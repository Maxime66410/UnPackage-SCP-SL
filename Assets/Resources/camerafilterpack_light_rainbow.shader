Shader "CameraFilterPack/Light_Rainbow" {
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
			GpuProgramID 25543
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
					uniform 	float _Value;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.z = u_xlat1.y * _Value;
					    u_xlat9 = u_xlat1.z * u_xlat1.x;
					    u_xlat9 = u_xlat9 * 11.1000004 + _TimeX;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat1.xy = vec2(u_xlat9) * vec2(0.150000006, 0.150000006) + u_xlat1.xz;
					    u_xlat9 = _TimeX * 0.25;
					    u_xlat9 = u_xlat1.x * 0.100000001 + u_xlat9;
					    u_xlat1.xzw = vec3(u_xlat9) * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
					    u_xlat2.xyz = u_xlat1.xzw * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat2.xyz = floor(u_xlat2.xyz);
					    u_xlat1.xzw = (-u_xlat2.xyz) * vec3(6.0, 6.0, 6.0) + u_xlat1.xzw;
					    u_xlat1.xzw = u_xlat1.xzw + vec3(-3.0, -3.0, -3.0);
					    u_xlat1.xzw = abs(u_xlat1.xzw) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.y) + 0.699999988;
					    u_xlat4 = u_xlat1.y * u_xlat1.y;
					    u_xlat4 = u_xlat4 * 30.0;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat4 = (-u_xlat4) * 0.25999999 + 1.0;
					    u_xlat9 = u_xlat9 * 3.0;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat1.xzw = vec3(u_xlat9) * u_xlat1.xzw;
					    SV_Target0.xyz = u_xlat1.xzw * vec3(u_xlat4) + u_xlat16_0.xyz;
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
					; Bound: 205
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %191 
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
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %41 DescriptorSet 41 
					                                             OpDecorate %41 Binding 41 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %45 DescriptorSet 45 
					                                             OpDecorate %45 Binding 45 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %191 Location 191 
					                                             OpDecorate %197 RelaxedPrecision 
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
					                                     %28 = OpTypePointer Private %13 
					                      Private f32_4* %29 = OpVariable Private 
					                                 f32 %31 = OpConstant 3,674022E-40 
					                               f32_2 %32 = OpConstantComposite %31 %31 
					                                     %36 = OpTypeVector %6 3 
					                                     %37 = OpTypePointer Private %36 
					                      Private f32_3* %38 = OpVariable Private 
					                                     %39 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %40 = OpTypePointer UniformConstant %39 
					UniformConstant read_only Texture2D* %41 = OpVariable UniformConstant 
					                                     %43 = OpTypeSampler 
					                                     %44 = OpTypePointer UniformConstant %43 
					            UniformConstant sampler* %45 = OpVariable UniformConstant 
					                                     %47 = OpTypeSampledImage %39 
					                      Private f32_3* %52 = OpVariable Private 
					                                 f32 %54 = OpConstant 3,674022E-40 
					                               f32_3 %55 = OpConstantComposite %54 %54 %54 
					                                     %57 = OpTypeInt 32 0 
					                                 u32 %58 = OpConstant 1 
					                                     %59 = OpTypePointer Private %6 
					                                 i32 %62 = OpConstant 1 
					                                     %63 = OpTypePointer Uniform %6 
					                                 u32 %67 = OpConstant 2 
					                        Private f32* %69 = OpVariable Private 
					                                 u32 %72 = OpConstant 0 
					                                 f32 %77 = OpConstant 3,674022E-40 
					                                 i32 %79 = OpConstant 0 
					                                 f32 %87 = OpConstant 3,674022E-40 
					                               f32_2 %88 = OpConstantComposite %87 %87 
					                                 f32 %97 = OpConstant 3,674022E-40 
					                                f32 %101 = OpConstant 3,674022E-40 
					                                f32 %107 = OpConstant 3,674022E-40 
					                              f32_3 %108 = OpConstantComposite %107 %107 %107 
					                                f32 %110 = OpConstant 3,674022E-40 
					                                f32 %111 = OpConstant 3,674022E-40 
					                                f32 %112 = OpConstant 3,674022E-40 
					                              f32_3 %113 = OpConstantComposite %110 %111 %112 
					                     Private f32_3* %117 = OpVariable Private 
					                                f32 %120 = OpConstant 3,674022E-40 
					                              f32_3 %121 = OpConstantComposite %120 %120 %120 
					                                f32 %135 = OpConstant 3,674022E-40 
					                              f32_3 %136 = OpConstantComposite %135 %135 %135 
					                                f32 %143 = OpConstant 3,674022E-40 
					                              f32_3 %144 = OpConstantComposite %143 %143 %143 
					                                f32 %150 = OpConstant 3,674022E-40 
					                                f32 %160 = OpConstant 3,674022E-40 
					                       Private f32* %162 = OpVariable Private 
					                                f32 %169 = OpConstant 3,674022E-40 
					                                f32 %175 = OpConstant 3,674022E-40 
					                                f32 %179 = OpConstant 3,674022E-40 
					                                    %190 = OpTypePointer Output %13 
					                      Output f32_4* %191 = OpVariable Output 
					                                u32 %201 = OpConstant 3 
					                                    %202 = OpTypePointer Output %6 
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
					                               f32_2 %30 = OpLoad %9 
					                               f32_2 %33 = OpFAdd %30 %32 
					                               f32_4 %34 = OpLoad %29 
					                               f32_4 %35 = OpVectorShuffle %34 %33 4 5 2 3 
					                                             OpStore %29 %35 
					                 read_only Texture2D %42 = OpLoad %41 
					                             sampler %46 = OpLoad %45 
					          read_only Texture2DSampled %48 = OpSampledImage %42 %46 
					                               f32_2 %49 = OpLoad %9 
					                               f32_4 %50 = OpImageSampleImplicitLod %48 %49 
					                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
					                                             OpStore %38 %51 
					                               f32_3 %53 = OpLoad %38 
					                               f32_3 %56 = OpFMul %53 %55 
					                                             OpStore %52 %56 
					                        Private f32* %60 = OpAccessChain %29 %58 
					                                 f32 %61 = OpLoad %60 
					                        Uniform f32* %64 = OpAccessChain %16 %62 
					                                 f32 %65 = OpLoad %64 
					                                 f32 %66 = OpFMul %61 %65 
					                        Private f32* %68 = OpAccessChain %29 %67 
					                                             OpStore %68 %66 
					                        Private f32* %70 = OpAccessChain %29 %67 
					                                 f32 %71 = OpLoad %70 
					                        Private f32* %73 = OpAccessChain %29 %72 
					                                 f32 %74 = OpLoad %73 
					                                 f32 %75 = OpFMul %71 %74 
					                                             OpStore %69 %75 
					                                 f32 %76 = OpLoad %69 
					                                 f32 %78 = OpFMul %76 %77 
					                        Uniform f32* %80 = OpAccessChain %16 %79 
					                                 f32 %81 = OpLoad %80 
					                                 f32 %82 = OpFAdd %78 %81 
					                                             OpStore %69 %82 
					                                 f32 %83 = OpLoad %69 
					                                 f32 %84 = OpExtInst %1 13 %83 
					                                             OpStore %69 %84 
					                                 f32 %85 = OpLoad %69 
					                               f32_2 %86 = OpCompositeConstruct %85 %85 
					                               f32_2 %89 = OpFMul %86 %88 
					                               f32_4 %90 = OpLoad %29 
					                               f32_2 %91 = OpVectorShuffle %90 %90 0 2 
					                               f32_2 %92 = OpFAdd %89 %91 
					                               f32_4 %93 = OpLoad %29 
					                               f32_4 %94 = OpVectorShuffle %93 %92 4 5 2 3 
					                                             OpStore %29 %94 
					                        Uniform f32* %95 = OpAccessChain %16 %79 
					                                 f32 %96 = OpLoad %95 
					                                 f32 %98 = OpFMul %96 %97 
					                                             OpStore %69 %98 
					                        Private f32* %99 = OpAccessChain %29 %72 
					                                f32 %100 = OpLoad %99 
					                                f32 %102 = OpFMul %100 %101 
					                                f32 %103 = OpLoad %69 
					                                f32 %104 = OpFAdd %102 %103 
					                                             OpStore %69 %104 
					                                f32 %105 = OpLoad %69 
					                              f32_3 %106 = OpCompositeConstruct %105 %105 %105 
					                              f32_3 %109 = OpFMul %106 %108 
					                              f32_3 %114 = OpFAdd %109 %113 
					                              f32_4 %115 = OpLoad %29 
					                              f32_4 %116 = OpVectorShuffle %115 %114 4 1 5 6 
					                                             OpStore %29 %116 
					                              f32_4 %118 = OpLoad %29 
					                              f32_3 %119 = OpVectorShuffle %118 %118 0 2 3 
					                              f32_3 %122 = OpFMul %119 %121 
					                                             OpStore %117 %122 
					                              f32_3 %123 = OpLoad %117 
					                              f32_3 %124 = OpExtInst %1 8 %123 
					                                             OpStore %117 %124 
					                              f32_3 %125 = OpLoad %117 
					                              f32_3 %126 = OpFNegate %125 
					                              f32_3 %127 = OpFMul %126 %108 
					                              f32_4 %128 = OpLoad %29 
					                              f32_3 %129 = OpVectorShuffle %128 %128 0 2 3 
					                              f32_3 %130 = OpFAdd %127 %129 
					                              f32_4 %131 = OpLoad %29 
					                              f32_4 %132 = OpVectorShuffle %131 %130 4 1 5 6 
					                                             OpStore %29 %132 
					                              f32_4 %133 = OpLoad %29 
					                              f32_3 %134 = OpVectorShuffle %133 %133 0 2 3 
					                              f32_3 %137 = OpFAdd %134 %136 
					                              f32_4 %138 = OpLoad %29 
					                              f32_4 %139 = OpVectorShuffle %138 %137 4 1 5 6 
					                                             OpStore %29 %139 
					                              f32_4 %140 = OpLoad %29 
					                              f32_3 %141 = OpVectorShuffle %140 %140 0 2 3 
					                              f32_3 %142 = OpExtInst %1 4 %141 
					                              f32_3 %145 = OpFAdd %142 %144 
					                              f32_4 %146 = OpLoad %29 
					                              f32_4 %147 = OpVectorShuffle %146 %145 4 1 5 6 
					                                             OpStore %29 %147 
					                              f32_4 %148 = OpLoad %29 
					                              f32_3 %149 = OpVectorShuffle %148 %148 0 2 3 
					                              f32_3 %151 = OpCompositeConstruct %110 %110 %110 
					                              f32_3 %152 = OpCompositeConstruct %150 %150 %150 
					                              f32_3 %153 = OpExtInst %1 43 %149 %151 %152 
					                              f32_4 %154 = OpLoad %29 
					                              f32_4 %155 = OpVectorShuffle %154 %153 4 1 5 6 
					                                             OpStore %29 %155 
					                       Private f32* %156 = OpAccessChain %29 %58 
					                                f32 %157 = OpLoad %156 
					                                f32 %158 = OpExtInst %1 4 %157 
					                                f32 %159 = OpFNegate %158 
					                                f32 %161 = OpFAdd %159 %160 
					                                             OpStore %69 %161 
					                       Private f32* %163 = OpAccessChain %29 %58 
					                                f32 %164 = OpLoad %163 
					                       Private f32* %165 = OpAccessChain %29 %58 
					                                f32 %166 = OpLoad %165 
					                                f32 %167 = OpFMul %164 %166 
					                                             OpStore %162 %167 
					                                f32 %168 = OpLoad %162 
					                                f32 %170 = OpFMul %168 %169 
					                                             OpStore %162 %170 
					                                f32 %171 = OpLoad %162 
					                                f32 %172 = OpExtInst %1 13 %171 
					                                             OpStore %162 %172 
					                                f32 %173 = OpLoad %162 
					                                f32 %174 = OpFNegate %173 
					                                f32 %176 = OpFMul %174 %175 
					                                f32 %177 = OpFAdd %176 %150 
					                                             OpStore %162 %177 
					                                f32 %178 = OpLoad %69 
					                                f32 %180 = OpFMul %178 %179 
					                                             OpStore %69 %180 
					                                f32 %181 = OpLoad %69 
					                                f32 %182 = OpExtInst %1 43 %181 %110 %150 
					                                             OpStore %69 %182 
					                                f32 %183 = OpLoad %69 
					                              f32_3 %184 = OpCompositeConstruct %183 %183 %183 
					                              f32_4 %185 = OpLoad %29 
					                              f32_3 %186 = OpVectorShuffle %185 %185 0 2 3 
					                              f32_3 %187 = OpFMul %184 %186 
					                              f32_4 %188 = OpLoad %29 
					                              f32_4 %189 = OpVectorShuffle %188 %187 4 1 5 6 
					                                             OpStore %29 %189 
					                              f32_4 %192 = OpLoad %29 
					                              f32_3 %193 = OpVectorShuffle %192 %192 0 2 3 
					                                f32 %194 = OpLoad %162 
					                              f32_3 %195 = OpCompositeConstruct %194 %194 %194 
					                              f32_3 %196 = OpFMul %193 %195 
					                              f32_3 %197 = OpLoad %52 
					                              f32_3 %198 = OpFAdd %196 %197 
					                              f32_4 %199 = OpLoad %191 
					                              f32_4 %200 = OpVectorShuffle %199 %198 4 5 6 3 
					                                             OpStore %191 %200 
					                        Output f32* %203 = OpAccessChain %191 %201 
					                                             OpStore %203 %150 
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
						float _Value;
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.z = u_xlat1.y * _Value;
					    u_xlat9 = u_xlat1.z * u_xlat1.x;
					    u_xlat9 = u_xlat9 * 11.1000004 + _TimeX;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat1.xy = vec2(u_xlat9) * vec2(0.150000006, 0.150000006) + u_xlat1.xz;
					    u_xlat9 = _TimeX * 0.25;
					    u_xlat9 = u_xlat1.x * 0.100000001 + u_xlat9;
					    u_xlat1.xzw = vec3(u_xlat9) * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
					    u_xlat2.xyz = u_xlat1.xzw * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat2.xyz = floor(u_xlat2.xyz);
					    u_xlat1.xzw = (-u_xlat2.xyz) * vec3(6.0, 6.0, 6.0) + u_xlat1.xzw;
					    u_xlat1.xzw = u_xlat1.xzw + vec3(-3.0, -3.0, -3.0);
					    u_xlat1.xzw = abs(u_xlat1.xzw) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.y) + 0.699999988;
					    u_xlat4 = u_xlat1.y * u_xlat1.y;
					    u_xlat4 = u_xlat4 * 30.0;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat4 = (-u_xlat4) * 0.25999999 + 1.0;
					    u_xlat9 = u_xlat9 * 3.0;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat1.xzw = vec3(u_xlat9) * u_xlat1.xzw;
					    SV_Target0.xyz = u_xlat1.xzw * vec3(u_xlat4) + u_xlat16_0.xyz;
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