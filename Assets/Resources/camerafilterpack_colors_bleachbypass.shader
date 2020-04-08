Shader "CameraFilterPack/Colors_BleachBypass" {
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
			GpuProgramID 54158
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat16_1;
					vec3 u_xlat16_2;
					vec3 u_xlat16_4;
					float u_xlat10;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_1.x = dot(vec3(0.25, 0.649999976, 0.100000001), u_xlat10_0.xyz);
					    u_xlat16_4.x = (-u_xlat16_1.x) + 1.0;
					    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
					    u_xlat16_2.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_4.xxx) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_1.xxx;
					    u_xlat16_1.x = u_xlat16_1.x + -0.449999988;
					    u_xlat16_1.x = u_xlat16_1.x * 10.0;
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_2.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat16_4.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
					    u_xlat10 = (-_Value) * u_xlat10_0.w + 1.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(u_xlat10);
					    u_xlat10 = u_xlat10_0.w * _Value;
					    SV_Target0.w = u_xlat10_0.w;
					    SV_Target0.xyz = vec3(u_xlat10) * u_xlat16_1.xyz + u_xlat0.xyz;
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
					; Bound: 155
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %141 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
					                                             OpMemberDecorate %15 0 Offset 15 
					                                             OpMemberDecorate %15 1 RelaxedPrecision 
					                                             OpMemberDecorate %15 1 Offset 15 
					                                             OpDecorate %15 Block 
					                                             OpDecorate %17 DescriptorSet 17 
					                                             OpDecorate %17 Binding 17 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %23 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %32 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %35 DescriptorSet 35 
					                                             OpDecorate %35 Binding 35 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %39 DescriptorSet 39 
					                                             OpDecorate %39 Binding 39 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %130 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %136 RelaxedPrecision 
					                                             OpDecorate %141 Location 141 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %14 = OpTypeVector %6 4 
					                                     %15 = OpTypeStruct %6 %14 
					                                     %16 = OpTypePointer Uniform %15 
					       Uniform struct {f32; f32_4;}* %17 = OpVariable Uniform 
					                                     %18 = OpTypeInt 32 1 
					                                 i32 %19 = OpConstant 1 
					                                     %20 = OpTypePointer Uniform %14 
					                                     %31 = OpTypePointer Private %14 
					                      Private f32_4* %32 = OpVariable Private 
					                                     %33 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %34 = OpTypePointer UniformConstant %33 
					UniformConstant read_only Texture2D* %35 = OpVariable UniformConstant 
					                                     %37 = OpTypeSampler 
					                                     %38 = OpTypePointer UniformConstant %37 
					            UniformConstant sampler* %39 = OpVariable UniformConstant 
					                                     %41 = OpTypeSampledImage %33 
					                      Private f32_3* %46 = OpVariable Private 
					                                 f32 %47 = OpConstant 3,674022E-40 
					                                 f32 %48 = OpConstant 3,674022E-40 
					                                 f32 %49 = OpConstant 3,674022E-40 
					                               f32_3 %50 = OpConstantComposite %47 %48 %49 
					                                     %54 = OpTypeInt 32 0 
					                                 u32 %55 = OpConstant 0 
					                                     %56 = OpTypePointer Private %6 
					                      Private f32_3* %58 = OpVariable Private 
					                                 f32 %62 = OpConstant 3,674022E-40 
					                      Private f32_3* %71 = OpVariable Private 
					                               f32_3 %75 = OpConstantComposite %62 %62 %62 
					                                 f32 %90 = OpConstant 3,674022E-40 
					                                 f32 %95 = OpConstant 3,674022E-40 
					                                f32 %100 = OpConstant 3,674022E-40 
					                                f32 %105 = OpConstant 3,674022E-40 
					                              f32_3 %106 = OpConstantComposite %105 %105 %105 
					                       Private f32* %119 = OpVariable Private 
					                                i32 %120 = OpConstant 0 
					                                    %121 = OpTypePointer Uniform %6 
					                                u32 %125 = OpConstant 3 
					                                    %140 = OpTypePointer Output %14 
					                      Output f32_4* %141 = OpVariable Output 
					                                    %144 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_2 %13 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %21 = OpAccessChain %17 %19 
					                               f32_4 %22 = OpLoad %21 
					                               f32_2 %23 = OpVectorShuffle %22 %22 0 1 
					                               f32_2 %24 = OpFMul %13 %23 
					                      Uniform f32_4* %25 = OpAccessChain %17 %19 
					                               f32_4 %26 = OpLoad %25 
					                               f32_2 %27 = OpVectorShuffle %26 %26 2 3 
					                               f32_2 %28 = OpFAdd %24 %27 
					                               f32_3 %29 = OpLoad %9 
					                               f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
					                                             OpStore %9 %30 
					                 read_only Texture2D %36 = OpLoad %35 
					                             sampler %40 = OpLoad %39 
					          read_only Texture2DSampled %42 = OpSampledImage %36 %40 
					                               f32_3 %43 = OpLoad %9 
					                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
					                               f32_4 %45 = OpImageSampleImplicitLod %42 %44 
					                                             OpStore %32 %45 
					                               f32_4 %51 = OpLoad %32 
					                               f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
					                                 f32 %53 = OpDot %50 %52 
					                        Private f32* %57 = OpAccessChain %46 %55 
					                                             OpStore %57 %53 
					                        Private f32* %59 = OpAccessChain %46 %55 
					                                 f32 %60 = OpLoad %59 
					                                 f32 %61 = OpFNegate %60 
					                                 f32 %63 = OpFAdd %61 %62 
					                        Private f32* %64 = OpAccessChain %58 %55 
					                                             OpStore %64 %63 
					                        Private f32* %65 = OpAccessChain %58 %55 
					                                 f32 %66 = OpLoad %65 
					                        Private f32* %67 = OpAccessChain %58 %55 
					                                 f32 %68 = OpLoad %67 
					                                 f32 %69 = OpFAdd %66 %68 
					                        Private f32* %70 = OpAccessChain %58 %55 
					                                             OpStore %70 %69 
					                               f32_4 %72 = OpLoad %32 
					                               f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                               f32_3 %74 = OpFNegate %73 
					                               f32_3 %76 = OpFAdd %74 %75 
					                                             OpStore %71 %76 
					                               f32_3 %77 = OpLoad %58 
					                               f32_3 %78 = OpVectorShuffle %77 %77 0 0 0 
					                               f32_3 %79 = OpFNegate %78 
					                               f32_3 %80 = OpLoad %71 
					                               f32_3 %81 = OpFMul %79 %80 
					                               f32_3 %82 = OpFAdd %81 %75 
					                                             OpStore %58 %82 
					                               f32_4 %83 = OpLoad %32 
					                               f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
					                               f32_3 %85 = OpLoad %46 
					                               f32_3 %86 = OpVectorShuffle %85 %85 0 0 0 
					                               f32_3 %87 = OpFMul %84 %86 
					                                             OpStore %71 %87 
					                        Private f32* %88 = OpAccessChain %46 %55 
					                                 f32 %89 = OpLoad %88 
					                                 f32 %91 = OpFAdd %89 %90 
					                        Private f32* %92 = OpAccessChain %46 %55 
					                                             OpStore %92 %91 
					                        Private f32* %93 = OpAccessChain %46 %55 
					                                 f32 %94 = OpLoad %93 
					                                 f32 %96 = OpFMul %94 %95 
					                        Private f32* %97 = OpAccessChain %46 %55 
					                                             OpStore %97 %96 
					                        Private f32* %98 = OpAccessChain %46 %55 
					                                 f32 %99 = OpLoad %98 
					                                f32 %101 = OpExtInst %1 43 %99 %100 %62 
					                       Private f32* %102 = OpAccessChain %46 %55 
					                                             OpStore %102 %101 
					                              f32_3 %103 = OpLoad %71 
					                              f32_3 %104 = OpFNegate %103 
					                              f32_3 %107 = OpFMul %104 %106 
					                              f32_3 %108 = OpLoad %58 
					                              f32_3 %109 = OpFAdd %107 %108 
					                                             OpStore %58 %109 
					                              f32_3 %110 = OpLoad %71 
					                              f32_3 %111 = OpLoad %71 
					                              f32_3 %112 = OpFAdd %110 %111 
					                                             OpStore %71 %112 
					                              f32_3 %113 = OpLoad %46 
					                              f32_3 %114 = OpVectorShuffle %113 %113 0 0 0 
					                              f32_3 %115 = OpLoad %58 
					                              f32_3 %116 = OpFMul %114 %115 
					                              f32_3 %117 = OpLoad %71 
					                              f32_3 %118 = OpFAdd %116 %117 
					                                             OpStore %46 %118 
					                       Uniform f32* %122 = OpAccessChain %17 %120 
					                                f32 %123 = OpLoad %122 
					                                f32 %124 = OpFNegate %123 
					                       Private f32* %126 = OpAccessChain %32 %125 
					                                f32 %127 = OpLoad %126 
					                                f32 %128 = OpFMul %124 %127 
					                                f32 %129 = OpFAdd %128 %62 
					                                             OpStore %119 %129 
					                              f32_4 %130 = OpLoad %32 
					                              f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
					                                f32 %132 = OpLoad %119 
					                              f32_3 %133 = OpCompositeConstruct %132 %132 %132 
					                              f32_3 %134 = OpFMul %131 %133 
					                                             OpStore %9 %134 
					                       Private f32* %135 = OpAccessChain %32 %125 
					                                f32 %136 = OpLoad %135 
					                       Uniform f32* %137 = OpAccessChain %17 %120 
					                                f32 %138 = OpLoad %137 
					                                f32 %139 = OpFMul %136 %138 
					                                             OpStore %119 %139 
					                       Private f32* %142 = OpAccessChain %32 %125 
					                                f32 %143 = OpLoad %142 
					                        Output f32* %145 = OpAccessChain %141 %125 
					                                             OpStore %145 %143 
					                                f32 %146 = OpLoad %119 
					                              f32_3 %147 = OpCompositeConstruct %146 %146 %146 
					                              f32_3 %148 = OpLoad %46 
					                              f32_3 %149 = OpFMul %147 %148 
					                              f32_3 %150 = OpLoad %9 
					                              f32_3 %151 = OpFAdd %149 %150 
					                              f32_4 %152 = OpLoad %141 
					                              f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
					                                             OpStore %141 %153 
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
						vec4 unused_0_2;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat16_1;
					vec3 u_xlat16_2;
					vec3 u_xlat16_4;
					float u_xlat10;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_1.x = dot(vec3(0.25, 0.649999976, 0.100000001), u_xlat10_0.xyz);
					    u_xlat16_4.x = (-u_xlat16_1.x) + 1.0;
					    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
					    u_xlat16_2.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_4.xxx) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_1.xxx;
					    u_xlat16_1.x = u_xlat16_1.x + -0.449999988;
					    u_xlat16_1.x = u_xlat16_1.x * 10.0;
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					    u_xlat16_4.xyz = (-u_xlat16_2.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat16_4.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_2.xyz;
					    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
					    u_xlat10 = (-_Value) * u_xlat10_0.w + 1.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(u_xlat10);
					    u_xlat10 = u_xlat10_0.w * _Value;
					    SV_Target0.w = u_xlat10_0.w;
					    SV_Target0.xyz = vec3(u_xlat10) * u_xlat16_1.xyz + u_xlat0.xyz;
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