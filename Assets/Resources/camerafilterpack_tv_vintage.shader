Shader "CameraFilterPack/TV_Vintage" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 996
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
					uniform 	float _TimeX;
					uniform 	float _Distortion;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_4;
					float u_xlat6;
					vec2 u_xlat10;
					vec2 u_xlat11;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat1.xyz = vec3(_TimeX) * vec3(0.100000001, 10.0, 110.0);
					    u_xlat10.xy = sin(u_xlat1.xz);
					    u_xlat10.xy = u_xlat10.xy * vec2(0.100000001, 0.00999999978) + vec2(0.899999976, 0.99000001);
					    u_xlat2.zw = u_xlat0.xy * u_xlat10.xx + vec2(0.5, 0.5);
					    u_xlat2.y = _Distortion * 0.00300000003 + u_xlat2.z;
					    u_xlat3 = texture(_MainTex, u_xlat2.yw);
					    u_xlat2.x = (-_Distortion) * 0.00300000003 + u_xlat2.z;
					    u_xlat10_4 = texture(_MainTex, u_xlat2.xw);
					    u_xlat3.z = u_xlat10_4.z;
					    u_xlat10_4 = texture(_MainTex, u_xlat2.zw);
					    u_xlat3.y = u_xlat10_4.y;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xzw = u_xlat3.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xzw * vec3(1.20000005, 1.20000005, 1.20000005) + u_xlat0.xyz;
					    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
					    u_xlat1.x = u_xlat2.z * u_xlat2.w;
					    u_xlat1.x = u_xlat1.x * 8.0;
					    u_xlat11.xy = (-u_xlat2.zw) + vec2(1.0, 1.0);
					    u_xlat6 = u_xlat2.w * 1000.0 + u_xlat1.y;
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * 0.100000001 + 0.899999976;
					    u_xlat1.x = u_xlat11.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat11.y + 0.5;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.949999988, 1.04999995, 0.949999988);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat10.yyy * u_xlat0.xyz;
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
					; Bound: 219
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %209 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
					                                             OpMemberDecorate %15 0 Offset 15 
					                                             OpMemberDecorate %15 1 Offset 15 
					                                             OpMemberDecorate %15 2 RelaxedPrecision 
					                                             OpMemberDecorate %15 2 Offset 15 
					                                             OpDecorate %15 Block 
					                                             OpDecorate %17 DescriptorSet 17 
					                                             OpDecorate %17 Binding 17 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %23 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %91 DescriptorSet 91 
					                                             OpDecorate %91 Binding 91 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %95 DescriptorSet 95 
					                                             OpDecorate %95 Binding 95 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %121 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %209 Location 209 
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
					                                     %15 = OpTypeStruct %6 %6 %14 
					                                     %16 = OpTypePointer Uniform %15 
					  Uniform struct {f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                     %18 = OpTypeInt 32 1 
					                                 i32 %19 = OpConstant 2 
					                                     %20 = OpTypePointer Uniform %14 
					                                 f32 %33 = OpConstant 3,674022E-40 
					                               f32_2 %34 = OpConstantComposite %33 %33 
					                                     %38 = OpTypePointer Private %14 
					                      Private f32_4* %39 = OpVariable Private 
					                                 i32 %40 = OpConstant 0 
					                                     %41 = OpTypePointer Uniform %6 
					                                 f32 %45 = OpConstant 3,674022E-40 
					                                 f32 %46 = OpConstant 3,674022E-40 
					                                 f32 %47 = OpConstant 3,674022E-40 
					                               f32_3 %48 = OpConstantComposite %45 %46 %47 
					                                     %52 = OpTypePointer Private %10 
					                      Private f32_2* %53 = OpVariable Private 
					                                 f32 %58 = OpConstant 3,674022E-40 
					                               f32_2 %59 = OpConstantComposite %45 %58 
					                                 f32 %61 = OpConstant 3,674022E-40 
					                                 f32 %62 = OpConstant 3,674022E-40 
					                               f32_2 %63 = OpConstantComposite %61 %62 
					                      Private f32_4* %65 = OpVariable Private 
					                                 f32 %71 = OpConstant 3,674022E-40 
					                               f32_2 %72 = OpConstantComposite %71 %71 
					                                 i32 %76 = OpConstant 1 
					                                 f32 %79 = OpConstant 3,674022E-40 
					                                     %81 = OpTypeInt 32 0 
					                                 u32 %82 = OpConstant 2 
					                                     %83 = OpTypePointer Private %6 
					                                 u32 %87 = OpConstant 1 
					                                     %89 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %90 = OpTypePointer UniformConstant %89 
					UniformConstant read_only Texture2D* %91 = OpVariable UniformConstant 
					                                     %93 = OpTypeSampler 
					                                     %94 = OpTypePointer UniformConstant %93 
					            UniformConstant sampler* %95 = OpVariable UniformConstant 
					                                     %97 = OpTypeSampledImage %89 
					                                u32 %102 = OpConstant 0 
					                              f32_3 %130 = OpConstantComposite %71 %71 %71 
					                                f32 %139 = OpConstant 3,674022E-40 
					                              f32_3 %140 = OpConstantComposite %139 %139 %139 
					                                f32 %146 = OpConstant 3,674022E-40 
					                                f32 %147 = OpConstant 3,674022E-40 
					                                u32 %153 = OpConstant 3 
					                                f32 %160 = OpConstant 3,674022E-40 
					                     Private f32_2* %163 = OpVariable Private 
					                              f32_2 %167 = OpConstantComposite %147 %147 
					                       Private f32* %169 = OpVariable Private 
					                                f32 %172 = OpConstant 3,674022E-40 
					                                f32 %200 = OpConstant 3,674022E-40 
					                                f32 %201 = OpConstant 3,674022E-40 
					                              f32_3 %202 = OpConstantComposite %200 %201 %200 
					                                    %208 = OpTypePointer Output %14 
					                      Output f32_4* %209 = OpVariable Output 
					                                    %216 = OpTypePointer Output %6 
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
					                               f32_3 %31 = OpLoad %9 
					                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
					                               f32_2 %35 = OpFAdd %32 %34 
					                               f32_3 %36 = OpLoad %9 
					                               f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
					                                             OpStore %9 %37 
					                        Uniform f32* %42 = OpAccessChain %17 %40 
					                                 f32 %43 = OpLoad %42 
					                               f32_3 %44 = OpCompositeConstruct %43 %43 %43 
					                               f32_3 %49 = OpFMul %44 %48 
					                               f32_4 %50 = OpLoad %39 
					                               f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
					                                             OpStore %39 %51 
					                               f32_4 %54 = OpLoad %39 
					                               f32_2 %55 = OpVectorShuffle %54 %54 0 2 
					                               f32_2 %56 = OpExtInst %1 13 %55 
					                                             OpStore %53 %56 
					                               f32_2 %57 = OpLoad %53 
					                               f32_2 %60 = OpFMul %57 %59 
					                               f32_2 %64 = OpFAdd %60 %63 
					                                             OpStore %53 %64 
					                               f32_3 %66 = OpLoad %9 
					                               f32_2 %67 = OpVectorShuffle %66 %66 0 1 
					                               f32_2 %68 = OpLoad %53 
					                               f32_2 %69 = OpVectorShuffle %68 %68 0 0 
					                               f32_2 %70 = OpFMul %67 %69 
					                               f32_2 %73 = OpFAdd %70 %72 
					                               f32_4 %74 = OpLoad %65 
					                               f32_4 %75 = OpVectorShuffle %74 %73 0 1 4 5 
					                                             OpStore %65 %75 
					                        Uniform f32* %77 = OpAccessChain %17 %76 
					                                 f32 %78 = OpLoad %77 
					                                 f32 %80 = OpFMul %78 %79 
					                        Private f32* %84 = OpAccessChain %65 %82 
					                                 f32 %85 = OpLoad %84 
					                                 f32 %86 = OpFAdd %80 %85 
					                        Private f32* %88 = OpAccessChain %65 %87 
					                                             OpStore %88 %86 
					                 read_only Texture2D %92 = OpLoad %91 
					                             sampler %96 = OpLoad %95 
					          read_only Texture2DSampled %98 = OpSampledImage %92 %96 
					                               f32_4 %99 = OpLoad %65 
					                              f32_2 %100 = OpVectorShuffle %99 %99 1 3 
					                              f32_4 %101 = OpImageSampleImplicitLod %98 %100 
					                                f32 %103 = OpCompositeExtract %101 0 
					                       Private f32* %104 = OpAccessChain %9 %102 
					                                             OpStore %104 %103 
					                       Uniform f32* %105 = OpAccessChain %17 %76 
					                                f32 %106 = OpLoad %105 
					                                f32 %107 = OpFNegate %106 
					                                f32 %108 = OpFMul %107 %79 
					                       Private f32* %109 = OpAccessChain %65 %82 
					                                f32 %110 = OpLoad %109 
					                                f32 %111 = OpFAdd %108 %110 
					                       Private f32* %112 = OpAccessChain %65 %102 
					                                             OpStore %112 %111 
					                read_only Texture2D %113 = OpLoad %91 
					                            sampler %114 = OpLoad %95 
					         read_only Texture2DSampled %115 = OpSampledImage %113 %114 
					                              f32_4 %116 = OpLoad %65 
					                              f32_2 %117 = OpVectorShuffle %116 %116 0 3 
					                              f32_4 %118 = OpImageSampleImplicitLod %115 %117 
					                                f32 %119 = OpCompositeExtract %118 2 
					                       Private f32* %120 = OpAccessChain %9 %82 
					                                             OpStore %120 %119 
					                read_only Texture2D %121 = OpLoad %91 
					                            sampler %122 = OpLoad %95 
					         read_only Texture2DSampled %123 = OpSampledImage %121 %122 
					                              f32_4 %124 = OpLoad %65 
					                              f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                              f32_4 %126 = OpImageSampleImplicitLod %123 %125 
					                                f32 %127 = OpCompositeExtract %126 1 
					                       Private f32* %128 = OpAccessChain %9 %87 
					                                             OpStore %128 %127 
					                              f32_3 %129 = OpLoad %9 
					                              f32_3 %131 = OpFMul %129 %130 
					                              f32_4 %132 = OpLoad %39 
					                              f32_4 %133 = OpVectorShuffle %132 %131 4 1 5 6 
					                                             OpStore %39 %133 
					                              f32_3 %134 = OpLoad %9 
					                              f32_4 %135 = OpLoad %39 
					                              f32_3 %136 = OpVectorShuffle %135 %135 0 2 3 
					                              f32_3 %137 = OpFMul %134 %136 
					                                             OpStore %9 %137 
					                              f32_3 %138 = OpLoad %9 
					                              f32_3 %141 = OpFMul %138 %140 
					                              f32_4 %142 = OpLoad %39 
					                              f32_3 %143 = OpVectorShuffle %142 %142 0 2 3 
					                              f32_3 %144 = OpFAdd %141 %143 
					                                             OpStore %9 %144 
					                              f32_3 %145 = OpLoad %9 
					                              f32_3 %148 = OpCompositeConstruct %146 %146 %146 
					                              f32_3 %149 = OpCompositeConstruct %147 %147 %147 
					                              f32_3 %150 = OpExtInst %1 43 %145 %148 %149 
					                                             OpStore %9 %150 
					                       Private f32* %151 = OpAccessChain %65 %82 
					                                f32 %152 = OpLoad %151 
					                       Private f32* %154 = OpAccessChain %65 %153 
					                                f32 %155 = OpLoad %154 
					                                f32 %156 = OpFMul %152 %155 
					                       Private f32* %157 = OpAccessChain %39 %102 
					                                             OpStore %157 %156 
					                       Private f32* %158 = OpAccessChain %39 %102 
					                                f32 %159 = OpLoad %158 
					                                f32 %161 = OpFMul %159 %160 
					                       Private f32* %162 = OpAccessChain %39 %102 
					                                             OpStore %162 %161 
					                              f32_4 %164 = OpLoad %65 
					                              f32_2 %165 = OpVectorShuffle %164 %164 2 3 
					                              f32_2 %166 = OpFNegate %165 
					                              f32_2 %168 = OpFAdd %166 %167 
					                                             OpStore %163 %168 
					                       Private f32* %170 = OpAccessChain %65 %153 
					                                f32 %171 = OpLoad %170 
					                                f32 %173 = OpFMul %171 %172 
					                       Private f32* %174 = OpAccessChain %39 %87 
					                                f32 %175 = OpLoad %174 
					                                f32 %176 = OpFAdd %173 %175 
					                                             OpStore %169 %176 
					                                f32 %177 = OpLoad %169 
					                                f32 %178 = OpExtInst %1 13 %177 
					                                             OpStore %169 %178 
					                                f32 %179 = OpLoad %169 
					                                f32 %180 = OpFMul %179 %45 
					                                f32 %181 = OpFAdd %180 %61 
					                                             OpStore %169 %181 
					                       Private f32* %182 = OpAccessChain %163 %102 
					                                f32 %183 = OpLoad %182 
					                       Private f32* %184 = OpAccessChain %39 %102 
					                                f32 %185 = OpLoad %184 
					                                f32 %186 = OpFMul %183 %185 
					                       Private f32* %187 = OpAccessChain %39 %102 
					                                             OpStore %187 %186 
					                       Private f32* %188 = OpAccessChain %39 %102 
					                                f32 %189 = OpLoad %188 
					                       Private f32* %190 = OpAccessChain %163 %87 
					                                f32 %191 = OpLoad %190 
					                                f32 %192 = OpFMul %189 %191 
					                                f32 %193 = OpFAdd %192 %71 
					                       Private f32* %194 = OpAccessChain %39 %102 
					                                             OpStore %194 %193 
					                              f32_3 %195 = OpLoad %9 
					                              f32_4 %196 = OpLoad %39 
					                              f32_3 %197 = OpVectorShuffle %196 %196 0 0 0 
					                              f32_3 %198 = OpFMul %195 %197 
					                                             OpStore %9 %198 
					                              f32_3 %199 = OpLoad %9 
					                              f32_3 %203 = OpFMul %199 %202 
					                                             OpStore %9 %203 
					                                f32 %204 = OpLoad %169 
					                              f32_3 %205 = OpCompositeConstruct %204 %204 %204 
					                              f32_3 %206 = OpLoad %9 
					                              f32_3 %207 = OpFMul %205 %206 
					                                             OpStore %9 %207 
					                              f32_2 %210 = OpLoad %53 
					                              f32_3 %211 = OpVectorShuffle %210 %210 1 1 1 
					                              f32_3 %212 = OpLoad %9 
					                              f32_3 %213 = OpFMul %211 %212 
					                              f32_4 %214 = OpLoad %209 
					                              f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
					                                             OpStore %209 %215 
					                        Output f32* %217 = OpAccessChain %209 %153 
					                                             OpStore %217 %147 
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
						float _TimeX;
						float _Distortion;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_4;
					float u_xlat6;
					vec2 u_xlat10;
					vec2 u_xlat11;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat1.xyz = vec3(_TimeX) * vec3(0.100000001, 10.0, 110.0);
					    u_xlat10.xy = sin(u_xlat1.xz);
					    u_xlat10.xy = u_xlat10.xy * vec2(0.100000001, 0.00999999978) + vec2(0.899999976, 0.99000001);
					    u_xlat2.zw = u_xlat0.xy * u_xlat10.xx + vec2(0.5, 0.5);
					    u_xlat2.y = _Distortion * 0.00300000003 + u_xlat2.z;
					    u_xlat3 = texture(_MainTex, u_xlat2.yw);
					    u_xlat2.x = (-_Distortion) * 0.00300000003 + u_xlat2.z;
					    u_xlat10_4 = texture(_MainTex, u_xlat2.xw);
					    u_xlat3.z = u_xlat10_4.z;
					    u_xlat10_4 = texture(_MainTex, u_xlat2.zw);
					    u_xlat3.y = u_xlat10_4.y;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xzw = u_xlat3.xyz * u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xzw * vec3(1.20000005, 1.20000005, 1.20000005) + u_xlat0.xyz;
					    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
					    u_xlat1.x = u_xlat2.z * u_xlat2.w;
					    u_xlat1.x = u_xlat1.x * 8.0;
					    u_xlat11.xy = (-u_xlat2.zw) + vec2(1.0, 1.0);
					    u_xlat6 = u_xlat2.w * 1000.0 + u_xlat1.y;
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * 0.100000001 + 0.899999976;
					    u_xlat1.x = u_xlat11.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat11.y + 0.5;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.949999988, 1.04999995, 0.949999988);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat10.yyy * u_xlat0.xyz;
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