Shader "CameraFilterPack/TV_WideScreenHV" {
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
			GpuProgramID 57642
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
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					float u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat4.xx, u_xlat4.xx);
					    u_xlat0.y = dot(u_xlat4.yy, u_xlat4.yy);
					    u_xlat0.xy = sqrt(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat4.x = float(1.0) / (-_Value2);
					    u_xlat0.xy = u_xlat4.xx * u_xlat0.xy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat4.x) * u_xlat0.x + 1.0;
					    u_xlat4.x = u_xlat0.y * -2.0 + 3.0;
					    u_xlat2 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = (-u_xlat4.x) * u_xlat2 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * (-u_xlat10_1.xyz) + u_xlat10_1.xyz;
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
					; Bound: 157
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %143 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpMemberDecorate %14 2 RelaxedPrecision 
					                                             OpMemberDecorate %14 2 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %39 DescriptorSet 39 
					                                             OpDecorate %39 Binding 39 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %43 DescriptorSet 43 
					                                             OpDecorate %43 Binding 43 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %143 Location 143 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %6 %6 %13 
					                                     %15 = OpTypePointer Uniform %14 
					  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 2 
					                                     %19 = OpTypePointer Uniform %13 
					                      Private f32_2* %28 = OpVariable Private 
					                                 f32 %31 = OpConstant 3,674022E-40 
					                               f32_2 %32 = OpConstantComposite %31 %31 
					                                     %34 = OpTypeVector %6 3 
					                                     %35 = OpTypePointer Private %34 
					                      Private f32_3* %36 = OpVariable Private 
					                                     %37 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %38 = OpTypePointer UniformConstant %37 
					UniformConstant read_only Texture2D* %39 = OpVariable UniformConstant 
					                                     %41 = OpTypeSampler 
					                                     %42 = OpTypePointer UniformConstant %41 
					            UniformConstant sampler* %43 = OpVariable UniformConstant 
					                                     %45 = OpTypeSampledImage %37 
					                                     %55 = OpTypeInt 32 0 
					                                 u32 %56 = OpConstant 0 
					                                     %57 = OpTypePointer Private %6 
					                                 u32 %64 = OpConstant 1 
					                                 i32 %69 = OpConstant 0 
					                                     %70 = OpTypePointer Uniform %6 
					                                 f32 %81 = OpConstant 3,674022E-40 
					                                 i32 %82 = OpConstant 1 
					                                 f32 %93 = OpConstant 3,674022E-40 
					                                 f32 %99 = OpConstant 3,674022E-40 
					                                f32 %101 = OpConstant 3,674022E-40 
					                       Private f32* %123 = OpVariable Private 
					                                    %142 = OpTypePointer Output %13 
					                      Output f32_4* %143 = OpVariable Output 
					                                u32 %153 = OpConstant 3 
					                                    %154 = OpTypePointer Output %6 
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
					                               f32_2 %30 = OpFNegate %29 
					                               f32_2 %33 = OpFAdd %30 %32 
					                                             OpStore %28 %33 
					                 read_only Texture2D %40 = OpLoad %39 
					                             sampler %44 = OpLoad %43 
					          read_only Texture2DSampled %46 = OpSampledImage %40 %44 
					                               f32_2 %47 = OpLoad %9 
					                               f32_4 %48 = OpImageSampleImplicitLod %46 %47 
					                               f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
					                                             OpStore %36 %49 
					                               f32_2 %50 = OpLoad %28 
					                               f32_2 %51 = OpVectorShuffle %50 %50 0 0 
					                               f32_2 %52 = OpLoad %28 
					                               f32_2 %53 = OpVectorShuffle %52 %52 0 0 
					                                 f32 %54 = OpDot %51 %53 
					                        Private f32* %58 = OpAccessChain %9 %56 
					                                             OpStore %58 %54 
					                               f32_2 %59 = OpLoad %28 
					                               f32_2 %60 = OpVectorShuffle %59 %59 1 1 
					                               f32_2 %61 = OpLoad %28 
					                               f32_2 %62 = OpVectorShuffle %61 %61 1 1 
					                                 f32 %63 = OpDot %60 %62 
					                        Private f32* %65 = OpAccessChain %9 %64 
					                                             OpStore %65 %63 
					                               f32_2 %66 = OpLoad %9 
					                               f32_2 %67 = OpExtInst %1 31 %66 
					                                             OpStore %9 %67 
					                               f32_2 %68 = OpLoad %9 
					                        Uniform f32* %71 = OpAccessChain %16 %69 
					                                 f32 %72 = OpLoad %71 
					                        Uniform f32* %73 = OpAccessChain %16 %69 
					                                 f32 %74 = OpLoad %73 
					                               f32_2 %75 = OpCompositeConstruct %72 %74 
					                                 f32 %76 = OpCompositeExtract %75 0 
					                                 f32 %77 = OpCompositeExtract %75 1 
					                               f32_2 %78 = OpCompositeConstruct %76 %77 
					                               f32_2 %79 = OpFNegate %78 
					                               f32_2 %80 = OpFAdd %68 %79 
					                                             OpStore %9 %80 
					                        Uniform f32* %83 = OpAccessChain %16 %82 
					                                 f32 %84 = OpLoad %83 
					                                 f32 %85 = OpFNegate %84 
					                                 f32 %86 = OpFDiv %81 %85 
					                        Private f32* %87 = OpAccessChain %28 %56 
					                                             OpStore %87 %86 
					                               f32_2 %88 = OpLoad %28 
					                               f32_2 %89 = OpVectorShuffle %88 %88 0 0 
					                               f32_2 %90 = OpLoad %9 
					                               f32_2 %91 = OpFMul %89 %90 
					                                             OpStore %9 %91 
					                               f32_2 %92 = OpLoad %9 
					                               f32_2 %94 = OpCompositeConstruct %93 %93 
					                               f32_2 %95 = OpCompositeConstruct %81 %81 
					                               f32_2 %96 = OpExtInst %1 43 %92 %94 %95 
					                                             OpStore %9 %96 
					                        Private f32* %97 = OpAccessChain %9 %56 
					                                 f32 %98 = OpLoad %97 
					                                f32 %100 = OpFMul %98 %99 
					                                f32 %102 = OpFAdd %100 %101 
					                       Private f32* %103 = OpAccessChain %28 %56 
					                                             OpStore %103 %102 
					                       Private f32* %104 = OpAccessChain %9 %56 
					                                f32 %105 = OpLoad %104 
					                       Private f32* %106 = OpAccessChain %9 %56 
					                                f32 %107 = OpLoad %106 
					                                f32 %108 = OpFMul %105 %107 
					                       Private f32* %109 = OpAccessChain %9 %56 
					                                             OpStore %109 %108 
					                       Private f32* %110 = OpAccessChain %28 %56 
					                                f32 %111 = OpLoad %110 
					                                f32 %112 = OpFNegate %111 
					                       Private f32* %113 = OpAccessChain %9 %56 
					                                f32 %114 = OpLoad %113 
					                                f32 %115 = OpFMul %112 %114 
					                                f32 %116 = OpFAdd %115 %81 
					                       Private f32* %117 = OpAccessChain %9 %56 
					                                             OpStore %117 %116 
					                       Private f32* %118 = OpAccessChain %9 %64 
					                                f32 %119 = OpLoad %118 
					                                f32 %120 = OpFMul %119 %99 
					                                f32 %121 = OpFAdd %120 %101 
					                       Private f32* %122 = OpAccessChain %28 %56 
					                                             OpStore %122 %121 
					                       Private f32* %124 = OpAccessChain %9 %64 
					                                f32 %125 = OpLoad %124 
					                       Private f32* %126 = OpAccessChain %9 %64 
					                                f32 %127 = OpLoad %126 
					                                f32 %128 = OpFMul %125 %127 
					                                             OpStore %123 %128 
					                       Private f32* %129 = OpAccessChain %28 %56 
					                                f32 %130 = OpLoad %129 
					                                f32 %131 = OpFNegate %130 
					                                f32 %132 = OpLoad %123 
					                                f32 %133 = OpFMul %131 %132 
					                       Private f32* %134 = OpAccessChain %9 %56 
					                                f32 %135 = OpLoad %134 
					                                f32 %136 = OpFAdd %133 %135 
					                       Private f32* %137 = OpAccessChain %9 %56 
					                                             OpStore %137 %136 
					                       Private f32* %138 = OpAccessChain %9 %56 
					                                f32 %139 = OpLoad %138 
					                                f32 %140 = OpFAdd %139 %81 
					                       Private f32* %141 = OpAccessChain %9 %56 
					                                             OpStore %141 %140 
					                              f32_2 %144 = OpLoad %9 
					                              f32_3 %145 = OpVectorShuffle %144 %144 0 0 0 
					                              f32_3 %146 = OpLoad %36 
					                              f32_3 %147 = OpFNegate %146 
					                              f32_3 %148 = OpFMul %145 %147 
					                              f32_3 %149 = OpLoad %36 
					                              f32_3 %150 = OpFAdd %148 %149 
					                              f32_4 %151 = OpLoad %143 
					                              f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
					                                             OpStore %143 %152 
					                        Output f32* %155 = OpAccessChain %143 %153 
					                                             OpStore %155 %81 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					float u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat4.xx, u_xlat4.xx);
					    u_xlat0.y = dot(u_xlat4.yy, u_xlat4.yy);
					    u_xlat0.xy = sqrt(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat4.x = float(1.0) / (-_Value2);
					    u_xlat0.xy = u_xlat4.xx * u_xlat0.xy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat4.x) * u_xlat0.x + 1.0;
					    u_xlat4.x = u_xlat0.y * -2.0 + 3.0;
					    u_xlat2 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = (-u_xlat4.x) * u_xlat2 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * (-u_xlat10_1.xyz) + u_xlat10_1.xyz;
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