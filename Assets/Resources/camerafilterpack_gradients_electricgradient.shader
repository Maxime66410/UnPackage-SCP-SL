Shader "CameraFilterPack/Gradients_ElectricGradient" {
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
			GpuProgramID 33899
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
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat16_1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					float u_xlat7;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_6 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_6 * -2.0 + 1.0;
					    u_xlat6 = _Value * u_xlat16_1 + u_xlat16_6;
					    u_xlat1.x = u_xlat6 + -0.600000024;
					    u_xlat1.x = u_xlat1.x * 3.33333397;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat3 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat3;
					    u_xlat1.y = u_xlat1.x * u_xlat1.x;
					    u_xlat1.y = clamp(u_xlat1.y, 0.0, 1.0);
					    u_xlat7 = u_xlat6 * u_xlat6;
					    u_xlat7 = u_xlat6 * u_xlat7;
					    u_xlat1.x = u_xlat6 * 8.0 + -6.30000019;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.z = u_xlat7 * 1.70000005;
					    u_xlat1.z = clamp(u_xlat1.z, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					; Bound: 166
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
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %33 DescriptorSet 33 
					                                             OpDecorate %33 Binding 33 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %37 RelaxedPrecision 
					                                             OpDecorate %37 DescriptorSet 37 
					                                             OpDecorate %37 Binding 37 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %143 Location 143 
					                                             OpDecorate %158 RelaxedPrecision 
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
					                                     %28 = OpTypeVector %6 3 
					                                     %29 = OpTypePointer Private %28 
					                      Private f32_3* %30 = OpVariable Private 
					                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %32 = OpTypePointer UniformConstant %31 
					UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
					                                     %35 = OpTypeSampler 
					                                     %36 = OpTypePointer UniformConstant %35 
					            UniformConstant sampler* %37 = OpVariable UniformConstant 
					                                     %39 = OpTypeSampledImage %31 
					                                     %44 = OpTypePointer Private %6 
					                        Private f32* %45 = OpVariable Private 
					                                 f32 %47 = OpConstant 3,674022E-40 
					                                 f32 %48 = OpConstant 3,674022E-40 
					                                 f32 %49 = OpConstant 3,674022E-40 
					                               f32_3 %50 = OpConstantComposite %47 %48 %49 
					                        Private f32* %52 = OpVariable Private 
					                                 f32 %54 = OpConstant 3,674022E-40 
					                                 f32 %56 = OpConstant 3,674022E-40 
					                        Private f32* %58 = OpVariable Private 
					                                 i32 %59 = OpConstant 0 
					                                     %60 = OpTypePointer Uniform %6 
					                      Private f32_3* %67 = OpVariable Private 
					                                 f32 %69 = OpConstant 3,674022E-40 
					                                     %71 = OpTypeInt 32 0 
					                                 u32 %72 = OpConstant 0 
					                                 f32 %76 = OpConstant 3,674022E-40 
					                                 f32 %81 = OpConstant 3,674022E-40 
					                        Private f32* %84 = OpVariable Private 
					                                 f32 %88 = OpConstant 3,674022E-40 
					                                u32 %106 = OpConstant 1 
					                       Private f32* %112 = OpVariable Private 
					                                f32 %120 = OpConstant 3,674022E-40 
					                                f32 %122 = OpConstant 3,674022E-40 
					                                f32 %130 = OpConstant 3,674022E-40 
					                                u32 %132 = OpConstant 2 
					                                    %142 = OpTypePointer Output %13 
					                      Output f32_4* %143 = OpVariable Output 
					                                i32 %144 = OpConstant 1 
					                                u32 %162 = OpConstant 3 
					                                    %163 = OpTypePointer Output %6 
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
					                 read_only Texture2D %34 = OpLoad %33 
					                             sampler %38 = OpLoad %37 
					          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
					                               f32_2 %41 = OpLoad %9 
					                               f32_4 %42 = OpImageSampleImplicitLod %40 %41 
					                               f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
					                                             OpStore %30 %43 
					                               f32_3 %46 = OpLoad %30 
					                                 f32 %51 = OpDot %46 %50 
					                                             OpStore %45 %51 
					                                 f32 %53 = OpLoad %45 
					                                 f32 %55 = OpFMul %53 %54 
					                                 f32 %57 = OpFAdd %55 %56 
					                                             OpStore %52 %57 
					                        Uniform f32* %61 = OpAccessChain %16 %59 
					                                 f32 %62 = OpLoad %61 
					                                 f32 %63 = OpLoad %52 
					                                 f32 %64 = OpFMul %62 %63 
					                                 f32 %65 = OpLoad %45 
					                                 f32 %66 = OpFAdd %64 %65 
					                                             OpStore %58 %66 
					                                 f32 %68 = OpLoad %58 
					                                 f32 %70 = OpFAdd %68 %69 
					                        Private f32* %73 = OpAccessChain %67 %72 
					                                             OpStore %73 %70 
					                        Private f32* %74 = OpAccessChain %67 %72 
					                                 f32 %75 = OpLoad %74 
					                                 f32 %77 = OpFMul %75 %76 
					                        Private f32* %78 = OpAccessChain %67 %72 
					                                             OpStore %78 %77 
					                        Private f32* %79 = OpAccessChain %67 %72 
					                                 f32 %80 = OpLoad %79 
					                                 f32 %82 = OpExtInst %1 43 %80 %81 %56 
					                        Private f32* %83 = OpAccessChain %67 %72 
					                                             OpStore %83 %82 
					                        Private f32* %85 = OpAccessChain %67 %72 
					                                 f32 %86 = OpLoad %85 
					                                 f32 %87 = OpFMul %86 %54 
					                                 f32 %89 = OpFAdd %87 %88 
					                                             OpStore %84 %89 
					                        Private f32* %90 = OpAccessChain %67 %72 
					                                 f32 %91 = OpLoad %90 
					                        Private f32* %92 = OpAccessChain %67 %72 
					                                 f32 %93 = OpLoad %92 
					                                 f32 %94 = OpFMul %91 %93 
					                        Private f32* %95 = OpAccessChain %67 %72 
					                                             OpStore %95 %94 
					                        Private f32* %96 = OpAccessChain %67 %72 
					                                 f32 %97 = OpLoad %96 
					                                 f32 %98 = OpLoad %84 
					                                 f32 %99 = OpFMul %97 %98 
					                       Private f32* %100 = OpAccessChain %67 %72 
					                                             OpStore %100 %99 
					                       Private f32* %101 = OpAccessChain %67 %72 
					                                f32 %102 = OpLoad %101 
					                       Private f32* %103 = OpAccessChain %67 %72 
					                                f32 %104 = OpLoad %103 
					                                f32 %105 = OpFMul %102 %104 
					                       Private f32* %107 = OpAccessChain %67 %106 
					                                             OpStore %107 %105 
					                       Private f32* %108 = OpAccessChain %67 %106 
					                                f32 %109 = OpLoad %108 
					                                f32 %110 = OpExtInst %1 43 %109 %81 %56 
					                       Private f32* %111 = OpAccessChain %67 %106 
					                                             OpStore %111 %110 
					                                f32 %113 = OpLoad %58 
					                                f32 %114 = OpLoad %58 
					                                f32 %115 = OpFMul %113 %114 
					                                             OpStore %112 %115 
					                                f32 %116 = OpLoad %58 
					                                f32 %117 = OpLoad %112 
					                                f32 %118 = OpFMul %116 %117 
					                                             OpStore %112 %118 
					                                f32 %119 = OpLoad %58 
					                                f32 %121 = OpFMul %119 %120 
					                                f32 %123 = OpFAdd %121 %122 
					                       Private f32* %124 = OpAccessChain %67 %72 
					                                             OpStore %124 %123 
					                       Private f32* %125 = OpAccessChain %67 %72 
					                                f32 %126 = OpLoad %125 
					                                f32 %127 = OpExtInst %1 43 %126 %81 %56 
					                       Private f32* %128 = OpAccessChain %67 %72 
					                                             OpStore %128 %127 
					                                f32 %129 = OpLoad %112 
					                                f32 %131 = OpFMul %129 %130 
					                       Private f32* %133 = OpAccessChain %67 %132 
					                                             OpStore %133 %131 
					                       Private f32* %134 = OpAccessChain %67 %132 
					                                f32 %135 = OpLoad %134 
					                                f32 %136 = OpExtInst %1 43 %135 %81 %56 
					                       Private f32* %137 = OpAccessChain %67 %132 
					                                             OpStore %137 %136 
					                              f32_3 %138 = OpLoad %30 
					                              f32_3 %139 = OpFNegate %138 
					                              f32_3 %140 = OpLoad %67 
					                              f32_3 %141 = OpFAdd %139 %140 
					                                             OpStore %67 %141 
					                       Uniform f32* %145 = OpAccessChain %16 %144 
					                                f32 %146 = OpLoad %145 
					                       Uniform f32* %147 = OpAccessChain %16 %144 
					                                f32 %148 = OpLoad %147 
					                       Uniform f32* %149 = OpAccessChain %16 %144 
					                                f32 %150 = OpLoad %149 
					                              f32_3 %151 = OpCompositeConstruct %146 %148 %150 
					                                f32 %152 = OpCompositeExtract %151 0 
					                                f32 %153 = OpCompositeExtract %151 1 
					                                f32 %154 = OpCompositeExtract %151 2 
					                              f32_3 %155 = OpCompositeConstruct %152 %153 %154 
					                              f32_3 %156 = OpLoad %67 
					                              f32_3 %157 = OpFMul %155 %156 
					                              f32_3 %158 = OpLoad %30 
					                              f32_3 %159 = OpFAdd %157 %158 
					                              f32_4 %160 = OpLoad %143 
					                              f32_4 %161 = OpVectorShuffle %160 %159 4 5 6 3 
					                                             OpStore %143 %161 
					                        Output f32* %164 = OpAccessChain %143 %162 
					                                             OpStore %164 %56 
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
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat16_1;
					float u_xlat3;
					float u_xlat6;
					float u_xlat16_6;
					float u_xlat7;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_6 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_6 * -2.0 + 1.0;
					    u_xlat6 = _Value * u_xlat16_1 + u_xlat16_6;
					    u_xlat1.x = u_xlat6 + -0.600000024;
					    u_xlat1.x = u_xlat1.x * 3.33333397;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat3 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat3;
					    u_xlat1.y = u_xlat1.x * u_xlat1.x;
					    u_xlat1.y = clamp(u_xlat1.y, 0.0, 1.0);
					    u_xlat7 = u_xlat6 * u_xlat6;
					    u_xlat7 = u_xlat6 * u_xlat7;
					    u_xlat1.x = u_xlat6 * 8.0 + -6.30000019;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat1.z = u_xlat7 * 1.70000005;
					    u_xlat1.z = clamp(u_xlat1.z, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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