Shader "CameraFilterPack/Drawing_Manga_Color" {
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
			GpuProgramID 57323
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
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					bool u_xlatb5;
					vec2 u_xlat8;
					float u_xlat16_8;
					bool u_xlatb8;
					float u_xlat12;
					float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = vec2(_DotSize) * vec2(0.001953125, -0.001953125) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_8 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat1.xy = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_12 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_8 = u_xlat16_8 * 4.0 + (-u_xlat16_12);
					    u_xlat16_8 = u_xlat16_12 * -3.0 + u_xlat16_8;
					    u_xlat8.x = u_xlat16_8 * u_xlat16_8;
					    u_xlatb8 = 0.0399999991<u_xlat8.x;
					    u_xlat8.x = u_xlatb8 ? -1.0 : float(0.0);
					    u_xlat1 = u_xlat0.xyxy * vec4(0.707106411, 0.707106411, 480.0, 480.0);
					    u_xlat2.xy = u_xlat0.xx * vec2(0.707106411, 480.0) + (-u_xlat1.yw);
					    u_xlat1.xy = u_xlat1.yw + u_xlat1.xz;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat10_3.xyzx + u_xlat10_3.xyzx;
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 0.625;
					    u_xlat0.y = u_xlat0.x * u_xlat2.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xy = cos(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat0 = u_xlat8.xxxx * u_xlat0.xxxx + u_xlat16_3;
					    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 1.39999998);
					    u_xlat12 = floor(u_xlat0.w);
					    u_xlat12 = u_xlat12 * 0.357142866;
					    u_xlat1.x = u_xlat1.y * u_xlat12;
					    u_xlat12 = u_xlat2.y * u_xlat12;
					    u_xlat12 = u_xlat12 * 3.1500001;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat1.x = u_xlat1.x * 3.1500001;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlatb5 = u_xlat0.x<u_xlat0.y;
					    u_xlat12 = (u_xlatb5) ? u_xlat12 : u_xlat1.x;
					    SV_Target0.xyz = (-vec3(u_xlat12)) * vec3(0.125, 0.125, 0.125) + u_xlat0.xyz;
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
					; Bound: 270
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %254 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 RelaxedPrecision 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %47 DescriptorSet 47 
					                                             OpDecorate %47 Binding 47 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %51 DescriptorSet 51 
					                                             OpDecorate %51 Binding 51 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %151 RelaxedPrecision 
					                                             OpDecorate %152 RelaxedPrecision 
					                                             OpDecorate %153 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                             OpDecorate %201 RelaxedPrecision 
					                                             OpDecorate %254 Location 254 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %14 = OpTypeStruct %6 %7 
					                                     %15 = OpTypePointer Uniform %14 
					       Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 1 
					                                     %19 = OpTypePointer Uniform %7 
					                                     %30 = OpTypePointer Private %10 
					                      Private f32_2* %31 = OpVariable Private 
					                                 i32 %32 = OpConstant 0 
					                                     %33 = OpTypePointer Uniform %6 
					                                 f32 %37 = OpConstant 3,674022E-40 
					                                 f32 %38 = OpConstant 3,674022E-40 
					                               f32_2 %39 = OpConstantComposite %37 %38 
					                      Private f32_4* %44 = OpVariable Private 
					                                     %45 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %46 = OpTypePointer UniformConstant %45 
					UniformConstant read_only Texture2D* %47 = OpVariable UniformConstant 
					                                     %49 = OpTypeSampler 
					                                     %50 = OpTypePointer UniformConstant %49 
					            UniformConstant sampler* %51 = OpVariable UniformConstant 
					                                     %53 = OpTypeSampledImage %45 
					                                     %57 = OpTypePointer Private %6 
					                        Private f32* %58 = OpVariable Private 
					                                 f32 %60 = OpConstant 3,674022E-40 
					                                 f32 %61 = OpConstant 3,674022E-40 
					                                 f32 %62 = OpConstant 3,674022E-40 
					                                 f32 %63 = OpConstant 3,674022E-40 
					                               f32_4 %64 = OpConstantComposite %60 %61 %62 %63 
					                      Private f32_4* %66 = OpVariable Private 
					                               f32_2 %71 = OpConstantComposite %37 %37 
					                        Private f32* %84 = OpVariable Private 
					                                 f32 %88 = OpConstant 3,674022E-40 
					                                 f32 %94 = OpConstant 3,674022E-40 
					                                    %101 = OpTypeInt 32 0 
					                                u32 %102 = OpConstant 0 
					                                    %104 = OpTypeBool 
					                                    %105 = OpTypePointer Private %104 
					                      Private bool* %106 = OpVariable Private 
					                                f32 %107 = OpConstant 3,674022E-40 
					                                f32 %112 = OpConstant 3,674022E-40 
					                                f32 %113 = OpConstant 3,674022E-40 
					                                f32 %118 = OpConstant 3,674022E-40 
					                                f32 %119 = OpConstant 3,674022E-40 
					                              f32_4 %120 = OpConstantComposite %118 %118 %119 %119 
					                     Private f32_2* %122 = OpVariable Private 
					                              f32_2 %125 = OpConstantComposite %118 %119 
					                     Private f32_4* %138 = OpVariable Private 
					                                    %145 = OpTypeVector %6 3 
					                     Private f32_4* %149 = OpVariable Private 
					                                f32 %155 = OpConstant 3,674022E-40 
					                                f32 %162 = OpConstant 3,674022E-40 
					                                u32 %170 = OpConstant 1 
					                                f32 %186 = OpConstant 3,674022E-40 
					                                f32 %204 = OpConstant 3,674022E-40 
					                              f32_4 %205 = OpConstantComposite %186 %186 %186 %204 
					                       Private f32* %207 = OpVariable Private 
					                                u32 %208 = OpConstant 3 
					                                f32 %213 = OpConstant 3,674022E-40 
					                                f32 %225 = OpConstant 3,674022E-40 
					                      Private bool* %237 = OpVariable Private 
					                                    %244 = OpTypePointer Function %6 
					                                    %253 = OpTypePointer Output %7 
					                      Output f32_4* %254 = OpVariable Output 
					                                f32 %258 = OpConstant 3,674022E-40 
					                              f32_3 %259 = OpConstantComposite %258 %258 %258 
					                                f32 %266 = OpConstant 3,674022E-40 
					                                    %267 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Function f32* %245 = OpVariable Function 
					                               f32_2 %13 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %20 = OpAccessChain %16 %18 
					                               f32_4 %21 = OpLoad %20 
					                               f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                               f32_2 %23 = OpFMul %13 %22 
					                      Uniform f32_4* %24 = OpAccessChain %16 %18 
					                               f32_4 %25 = OpLoad %24 
					                               f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                               f32_2 %27 = OpFAdd %23 %26 
					                               f32_4 %28 = OpLoad %9 
					                               f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
					                                             OpStore %9 %29 
					                        Uniform f32* %34 = OpAccessChain %16 %32 
					                                 f32 %35 = OpLoad %34 
					                               f32_2 %36 = OpCompositeConstruct %35 %35 
					                               f32_2 %40 = OpFMul %36 %39 
					                               f32_4 %41 = OpLoad %9 
					                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                               f32_2 %43 = OpFAdd %40 %42 
					                                             OpStore %31 %43 
					                 read_only Texture2D %48 = OpLoad %47 
					                             sampler %52 = OpLoad %51 
					          read_only Texture2DSampled %54 = OpSampledImage %48 %52 
					                               f32_2 %55 = OpLoad %31 
					                               f32_4 %56 = OpImageSampleImplicitLod %54 %55 
					                                             OpStore %44 %56 
					                               f32_4 %59 = OpLoad %44 
					                                 f32 %65 = OpDot %59 %64 
					                                             OpStore %58 %65 
					                        Uniform f32* %67 = OpAccessChain %16 %32 
					                                 f32 %68 = OpLoad %67 
					                               f32_2 %69 = OpCompositeConstruct %68 %68 
					                               f32_2 %70 = OpFNegate %69 
					                               f32_2 %72 = OpFMul %70 %71 
					                               f32_4 %73 = OpLoad %9 
					                               f32_2 %74 = OpVectorShuffle %73 %73 0 1 
					                               f32_2 %75 = OpFAdd %72 %74 
					                               f32_4 %76 = OpLoad %66 
					                               f32_4 %77 = OpVectorShuffle %76 %75 4 5 2 3 
					                                             OpStore %66 %77 
					                 read_only Texture2D %78 = OpLoad %47 
					                             sampler %79 = OpLoad %51 
					          read_only Texture2DSampled %80 = OpSampledImage %78 %79 
					                               f32_4 %81 = OpLoad %66 
					                               f32_2 %82 = OpVectorShuffle %81 %81 0 1 
					                               f32_4 %83 = OpImageSampleImplicitLod %80 %82 
					                                             OpStore %44 %83 
					                               f32_4 %85 = OpLoad %44 
					                                 f32 %86 = OpDot %85 %64 
					                                             OpStore %84 %86 
					                                 f32 %87 = OpLoad %58 
					                                 f32 %89 = OpFMul %87 %88 
					                                 f32 %90 = OpLoad %84 
					                                 f32 %91 = OpFNegate %90 
					                                 f32 %92 = OpFAdd %89 %91 
					                                             OpStore %58 %92 
					                                 f32 %93 = OpLoad %84 
					                                 f32 %95 = OpFMul %93 %94 
					                                 f32 %96 = OpLoad %58 
					                                 f32 %97 = OpFAdd %95 %96 
					                                             OpStore %58 %97 
					                                 f32 %98 = OpLoad %58 
					                                 f32 %99 = OpLoad %58 
					                                f32 %100 = OpFMul %98 %99 
					                       Private f32* %103 = OpAccessChain %31 %102 
					                                             OpStore %103 %100 
					                       Private f32* %108 = OpAccessChain %31 %102 
					                                f32 %109 = OpLoad %108 
					                               bool %110 = OpFOrdLessThan %107 %109 
					                                             OpStore %106 %110 
					                               bool %111 = OpLoad %106 
					                                f32 %114 = OpSelect %111 %112 %113 
					                       Private f32* %115 = OpAccessChain %31 %102 
					                                             OpStore %115 %114 
					                              f32_4 %116 = OpLoad %9 
					                              f32_4 %117 = OpVectorShuffle %116 %116 0 1 0 1 
					                              f32_4 %121 = OpFMul %117 %120 
					                                             OpStore %66 %121 
					                              f32_4 %123 = OpLoad %9 
					                              f32_2 %124 = OpVectorShuffle %123 %123 0 0 
					                              f32_2 %126 = OpFMul %124 %125 
					                              f32_4 %127 = OpLoad %66 
					                              f32_2 %128 = OpVectorShuffle %127 %127 1 3 
					                              f32_2 %129 = OpFNegate %128 
					                              f32_2 %130 = OpFAdd %126 %129 
					                                             OpStore %122 %130 
					                              f32_4 %131 = OpLoad %66 
					                              f32_2 %132 = OpVectorShuffle %131 %131 1 3 
					                              f32_4 %133 = OpLoad %66 
					                              f32_2 %134 = OpVectorShuffle %133 %133 0 2 
					                              f32_2 %135 = OpFAdd %132 %134 
					                              f32_4 %136 = OpLoad %66 
					                              f32_4 %137 = OpVectorShuffle %136 %135 4 5 2 3 
					                                             OpStore %66 %137 
					                read_only Texture2D %139 = OpLoad %47 
					                            sampler %140 = OpLoad %51 
					         read_only Texture2DSampled %141 = OpSampledImage %139 %140 
					                              f32_4 %142 = OpLoad %9 
					                              f32_2 %143 = OpVectorShuffle %142 %142 0 1 
					                              f32_4 %144 = OpImageSampleImplicitLod %141 %143 
					                              f32_3 %146 = OpVectorShuffle %144 %144 0 1 2 
					                              f32_4 %147 = OpLoad %138 
					                              f32_4 %148 = OpVectorShuffle %147 %146 4 5 2 6 
					                                             OpStore %138 %148 
					                              f32_4 %150 = OpLoad %138 
					                              f32_4 %151 = OpVectorShuffle %150 %150 0 1 3 0 
					                              f32_4 %152 = OpLoad %138 
					                              f32_4 %153 = OpVectorShuffle %152 %152 0 1 3 0 
					                              f32_4 %154 = OpFAdd %151 %153 
					                                             OpStore %149 %154 
					                       Uniform f32* %156 = OpAccessChain %16 %32 
					                                f32 %157 = OpLoad %156 
					                                f32 %158 = OpFDiv %155 %157 
					                       Private f32* %159 = OpAccessChain %9 %102 
					                                             OpStore %159 %158 
					                       Private f32* %160 = OpAccessChain %9 %102 
					                                f32 %161 = OpLoad %160 
					                                f32 %163 = OpFMul %161 %162 
					                       Private f32* %164 = OpAccessChain %9 %102 
					                                             OpStore %164 %163 
					                       Private f32* %165 = OpAccessChain %9 %102 
					                                f32 %166 = OpLoad %165 
					                       Private f32* %167 = OpAccessChain %122 %102 
					                                f32 %168 = OpLoad %167 
					                                f32 %169 = OpFMul %166 %168 
					                       Private f32* %171 = OpAccessChain %9 %170 
					                                             OpStore %171 %169 
					                       Private f32* %172 = OpAccessChain %9 %102 
					                                f32 %173 = OpLoad %172 
					                       Private f32* %174 = OpAccessChain %66 %102 
					                                f32 %175 = OpLoad %174 
					                                f32 %176 = OpFMul %173 %175 
					                       Private f32* %177 = OpAccessChain %9 %102 
					                                             OpStore %177 %176 
					                              f32_4 %178 = OpLoad %9 
					                              f32_2 %179 = OpVectorShuffle %178 %178 0 1 
					                              f32_2 %180 = OpExtInst %1 14 %179 
					                              f32_4 %181 = OpLoad %9 
					                              f32_4 %182 = OpVectorShuffle %181 %180 4 5 2 3 
					                                             OpStore %9 %182 
					                       Private f32* %183 = OpAccessChain %9 %102 
					                                f32 %184 = OpLoad %183 
					                                f32 %185 = OpFMul %184 %63 
					                                f32 %187 = OpFAdd %185 %186 
					                       Private f32* %188 = OpAccessChain %9 %102 
					                                             OpStore %188 %187 
					                       Private f32* %189 = OpAccessChain %9 %170 
					                                f32 %190 = OpLoad %189 
					                                f32 %191 = OpFMul %190 %63 
					                       Private f32* %192 = OpAccessChain %9 %102 
					                                f32 %193 = OpLoad %192 
					                                f32 %194 = OpFAdd %191 %193 
					                       Private f32* %195 = OpAccessChain %9 %102 
					                                             OpStore %195 %194 
					                              f32_2 %196 = OpLoad %31 
					                              f32_4 %197 = OpVectorShuffle %196 %196 0 0 0 0 
					                              f32_4 %198 = OpLoad %9 
					                              f32_4 %199 = OpVectorShuffle %198 %198 0 0 0 0 
					                              f32_4 %200 = OpFMul %197 %199 
					                              f32_4 %201 = OpLoad %149 
					                              f32_4 %202 = OpFAdd %200 %201 
					                                             OpStore %9 %202 
					                              f32_4 %203 = OpLoad %9 
					                              f32_4 %206 = OpFMul %203 %205 
					                                             OpStore %9 %206 
					                       Private f32* %209 = OpAccessChain %9 %208 
					                                f32 %210 = OpLoad %209 
					                                f32 %211 = OpExtInst %1 8 %210 
					                                             OpStore %207 %211 
					                                f32 %212 = OpLoad %207 
					                                f32 %214 = OpFMul %212 %213 
					                                             OpStore %207 %214 
					                       Private f32* %215 = OpAccessChain %66 %170 
					                                f32 %216 = OpLoad %215 
					                                f32 %217 = OpLoad %207 
					                                f32 %218 = OpFMul %216 %217 
					                       Private f32* %219 = OpAccessChain %66 %102 
					                                             OpStore %219 %218 
					                       Private f32* %220 = OpAccessChain %122 %170 
					                                f32 %221 = OpLoad %220 
					                                f32 %222 = OpLoad %207 
					                                f32 %223 = OpFMul %221 %222 
					                                             OpStore %207 %223 
					                                f32 %224 = OpLoad %207 
					                                f32 %226 = OpFMul %224 %225 
					                                             OpStore %207 %226 
					                                f32 %227 = OpLoad %207 
					                                f32 %228 = OpExtInst %1 13 %227 
					                                             OpStore %207 %228 
					                       Private f32* %229 = OpAccessChain %66 %102 
					                                f32 %230 = OpLoad %229 
					                                f32 %231 = OpFMul %230 %225 
					                       Private f32* %232 = OpAccessChain %66 %102 
					                                             OpStore %232 %231 
					                       Private f32* %233 = OpAccessChain %66 %102 
					                                f32 %234 = OpLoad %233 
					                                f32 %235 = OpExtInst %1 13 %234 
					                       Private f32* %236 = OpAccessChain %66 %102 
					                                             OpStore %236 %235 
					                       Private f32* %238 = OpAccessChain %9 %102 
					                                f32 %239 = OpLoad %238 
					                       Private f32* %240 = OpAccessChain %9 %170 
					                                f32 %241 = OpLoad %240 
					                               bool %242 = OpFOrdLessThan %239 %241 
					                                             OpStore %237 %242 
					                               bool %243 = OpLoad %237 
					                                             OpSelectionMerge %247 None 
					                                             OpBranchConditional %243 %246 %249 
					                                    %246 = OpLabel 
					                                f32 %248 = OpLoad %207 
					                                             OpStore %245 %248 
					                                             OpBranch %247 
					                                    %249 = OpLabel 
					                       Private f32* %250 = OpAccessChain %66 %102 
					                                f32 %251 = OpLoad %250 
					                                             OpStore %245 %251 
					                                             OpBranch %247 
					                                    %247 = OpLabel 
					                                f32 %252 = OpLoad %245 
					                                             OpStore %207 %252 
					                                f32 %255 = OpLoad %207 
					                              f32_3 %256 = OpCompositeConstruct %255 %255 %255 
					                              f32_3 %257 = OpFNegate %256 
					                              f32_3 %260 = OpFMul %257 %259 
					                              f32_4 %261 = OpLoad %9 
					                              f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
					                              f32_3 %263 = OpFAdd %260 %262 
					                              f32_4 %264 = OpLoad %254 
					                              f32_4 %265 = OpVectorShuffle %264 %263 4 5 6 3 
					                                             OpStore %254 %265 
					                        Output f32* %268 = OpAccessChain %254 %208 
					                                             OpStore %268 %266 
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
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					bool u_xlatb5;
					vec2 u_xlat8;
					float u_xlat16_8;
					bool u_xlatb8;
					float u_xlat12;
					float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = vec2(_DotSize) * vec2(0.001953125, -0.001953125) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_8 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat1.xy = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_12 = dot(u_xlat10_1, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_8 = u_xlat16_8 * 4.0 + (-u_xlat16_12);
					    u_xlat16_8 = u_xlat16_12 * -3.0 + u_xlat16_8;
					    u_xlat8.x = u_xlat16_8 * u_xlat16_8;
					    u_xlatb8 = 0.0399999991<u_xlat8.x;
					    u_xlat8.x = u_xlatb8 ? -1.0 : float(0.0);
					    u_xlat1 = u_xlat0.xyxy * vec4(0.707106411, 0.707106411, 480.0, 480.0);
					    u_xlat2.xy = u_xlat0.xx * vec2(0.707106411, 480.0) + (-u_xlat1.yw);
					    u_xlat1.xy = u_xlat1.yw + u_xlat1.xz;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat10_3.xyzx + u_xlat10_3.xyzx;
					    u_xlat0.x = 2136.28125 / _DotSize;
					    u_xlat0.x = u_xlat0.x * 0.625;
					    u_xlat0.y = u_xlat0.x * u_xlat2.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xy = cos(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat0 = u_xlat8.xxxx * u_xlat0.xxxx + u_xlat16_3;
					    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 1.39999998);
					    u_xlat12 = floor(u_xlat0.w);
					    u_xlat12 = u_xlat12 * 0.357142866;
					    u_xlat1.x = u_xlat1.y * u_xlat12;
					    u_xlat12 = u_xlat2.y * u_xlat12;
					    u_xlat12 = u_xlat12 * 3.1500001;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat1.x = u_xlat1.x * 3.1500001;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlatb5 = u_xlat0.x<u_xlat0.y;
					    u_xlat12 = (u_xlatb5) ? u_xlat12 : u_xlat1.x;
					    SV_Target0.xyz = (-vec3(u_xlat12)) * vec3(0.125, 0.125, 0.125) + u_xlat0.xyz;
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