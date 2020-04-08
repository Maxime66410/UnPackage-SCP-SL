Shader "CameraFilterPack/FX_InverChromiLum" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 19000
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat16_1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat4;
					float u_xlat16_4;
					bool u_xlatb4;
					bool u_xlatb7;
					float u_xlat9;
					float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = max(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_1 = min(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_1;
					    u_xlat16_1 = u_xlat16_9 * u_xlat16_9;
					    u_xlat16_4 = u_xlat16_1 * 0.0208350997 + -0.0851330012;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + 0.180141002;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + -0.330299497;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_4 + 0.999866009;
					    u_xlat16_4 = u_xlat16_9 * u_xlat16_1;
					    u_xlat4 = u_xlat16_4 * -2.0 + 1.57079637;
					    u_xlatb7 = abs(u_xlat10_0.y)<abs(u_xlat10_0.x);
					    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
					    u_xlat9 = u_xlat16_9 * u_xlat16_1 + u_xlat4;
					    u_xlatb1 = u_xlat10_0.y<(-u_xlat10_0.y);
					    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
					    u_xlat9 = u_xlat9 + u_xlat1.x;
					    u_xlat1.x = min(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
					    u_xlat4 = max(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlatb4 = u_xlat4>=(-u_xlat4);
					    u_xlatb1 = u_xlatb4 && u_xlatb1;
					    u_xlat1.y = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
					    u_xlat9 = u_xlat1.y * 0.636619925;
					    u_xlat16_0 = u_xlat10_0.y + u_xlat10_0.x;
					    u_xlat16_0 = u_xlat10_0.z + u_xlat16_0;
					    u_xlat0.x = u_xlat16_0 * 2.09439349;
					    u_xlat2 = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat2 * 0.5 + 0.5;
					    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
					    u_xlat1.xz = u_xlat0.yx * vec2(u_xlat9);
					    SV_Target0.xyz = u_xlat1.xyz * vec3(2.0, 0.127323985, 2.0);
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
					; Bound: 232
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %220 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 RelaxedPrecision 
					                                             OpMemberDecorate %14 0 Offset 14 
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
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %152 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %179 RelaxedPrecision 
					                                             OpDecorate %181 RelaxedPrecision 
					                                             OpDecorate %183 RelaxedPrecision 
					                                             OpDecorate %184 RelaxedPrecision 
					                                             OpDecorate %187 RelaxedPrecision 
					                                             OpDecorate %188 RelaxedPrecision 
					                                             OpDecorate %189 RelaxedPrecision 
					                                             OpDecorate %190 RelaxedPrecision 
					                                             OpDecorate %192 RelaxedPrecision 
					                                             OpDecorate %220 Location 220 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %13 
					                                     %15 = OpTypePointer Uniform %14 
					            Uniform struct {f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 0 
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
					                                     %46 = OpTypeInt 32 0 
					                                 u32 %47 = OpConstant 1 
					                                 u32 %51 = OpConstant 0 
					                                 f32 %56 = OpConstant 3,674022E-40 
					                        Private f32* %59 = OpVariable Private 
					                        Private f32* %73 = OpVariable Private 
					                                 f32 %75 = OpConstant 3,674022E-40 
					                                 f32 %77 = OpConstant 3,674022E-40 
					                                 f32 %82 = OpConstant 3,674022E-40 
					                                 f32 %87 = OpConstant 3,674022E-40 
					                                 f32 %92 = OpConstant 3,674022E-40 
					                        Private f32* %97 = OpVariable Private 
					                                 f32 %99 = OpConstant 3,674022E-40 
					                                f32 %101 = OpConstant 3,674022E-40 
					                                    %103 = OpTypeBool 
					                                    %104 = OpTypePointer Private %103 
					                      Private bool* %105 = OpVariable Private 
					                                f32 %115 = OpConstant 3,674022E-40 
					                       Private f32* %117 = OpVariable Private 
					                      Private bool* %123 = OpVariable Private 
					                     Private f32_3* %130 = OpVariable Private 
					                                f32 %132 = OpConstant 3,674022E-40 
					                      Private bool* %156 = OpVariable Private 
					                                    %165 = OpTypePointer Function %6 
					                                f32 %177 = OpConstant 3,674022E-40 
					                       Private f32* %179 = OpVariable Private 
					                                u32 %185 = OpConstant 2 
					                                f32 %191 = OpConstant 3,674022E-40 
					                       Private f32* %194 = OpVariable Private 
					                                f32 %203 = OpConstant 3,674022E-40 
					                                    %219 = OpTypePointer Output %13 
					                      Output f32_4* %220 = OpVariable Output 
					                                f32 %222 = OpConstant 3,674022E-40 
					                                f32 %223 = OpConstant 3,674022E-40 
					                              f32_3 %224 = OpConstantComposite %222 %223 %222 
					                                u32 %228 = OpConstant 3 
					                                    %229 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Function f32* %166 = OpVariable Function 
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
					                        Private f32* %48 = OpAccessChain %30 %47 
					                                 f32 %49 = OpLoad %48 
					                                 f32 %50 = OpExtInst %1 4 %49 
					                        Private f32* %52 = OpAccessChain %30 %51 
					                                 f32 %53 = OpLoad %52 
					                                 f32 %54 = OpExtInst %1 4 %53 
					                                 f32 %55 = OpExtInst %1 40 %50 %54 
					                                             OpStore %45 %55 
					                                 f32 %57 = OpLoad %45 
					                                 f32 %58 = OpFDiv %56 %57 
					                                             OpStore %45 %58 
					                        Private f32* %60 = OpAccessChain %30 %47 
					                                 f32 %61 = OpLoad %60 
					                                 f32 %62 = OpExtInst %1 4 %61 
					                        Private f32* %63 = OpAccessChain %30 %51 
					                                 f32 %64 = OpLoad %63 
					                                 f32 %65 = OpExtInst %1 4 %64 
					                                 f32 %66 = OpExtInst %1 37 %62 %65 
					                                             OpStore %59 %66 
					                                 f32 %67 = OpLoad %45 
					                                 f32 %68 = OpLoad %59 
					                                 f32 %69 = OpFMul %67 %68 
					                                             OpStore %45 %69 
					                                 f32 %70 = OpLoad %45 
					                                 f32 %71 = OpLoad %45 
					                                 f32 %72 = OpFMul %70 %71 
					                                             OpStore %59 %72 
					                                 f32 %74 = OpLoad %59 
					                                 f32 %76 = OpFMul %74 %75 
					                                 f32 %78 = OpFAdd %76 %77 
					                                             OpStore %73 %78 
					                                 f32 %79 = OpLoad %59 
					                                 f32 %80 = OpLoad %73 
					                                 f32 %81 = OpFMul %79 %80 
					                                 f32 %83 = OpFAdd %81 %82 
					                                             OpStore %73 %83 
					                                 f32 %84 = OpLoad %59 
					                                 f32 %85 = OpLoad %73 
					                                 f32 %86 = OpFMul %84 %85 
					                                 f32 %88 = OpFAdd %86 %87 
					                                             OpStore %73 %88 
					                                 f32 %89 = OpLoad %59 
					                                 f32 %90 = OpLoad %73 
					                                 f32 %91 = OpFMul %89 %90 
					                                 f32 %93 = OpFAdd %91 %92 
					                                             OpStore %59 %93 
					                                 f32 %94 = OpLoad %45 
					                                 f32 %95 = OpLoad %59 
					                                 f32 %96 = OpFMul %94 %95 
					                                             OpStore %73 %96 
					                                 f32 %98 = OpLoad %73 
					                                f32 %100 = OpFMul %98 %99 
					                                f32 %102 = OpFAdd %100 %101 
					                                             OpStore %97 %102 
					                       Private f32* %106 = OpAccessChain %30 %47 
					                                f32 %107 = OpLoad %106 
					                                f32 %108 = OpExtInst %1 4 %107 
					                       Private f32* %109 = OpAccessChain %30 %51 
					                                f32 %110 = OpLoad %109 
					                                f32 %111 = OpExtInst %1 4 %110 
					                               bool %112 = OpFOrdLessThan %108 %111 
					                                             OpStore %105 %112 
					                               bool %113 = OpLoad %105 
					                                f32 %114 = OpLoad %97 
					                                f32 %116 = OpSelect %113 %114 %115 
					                                             OpStore %97 %116 
					                                f32 %118 = OpLoad %45 
					                                f32 %119 = OpLoad %59 
					                                f32 %120 = OpFMul %118 %119 
					                                f32 %121 = OpLoad %97 
					                                f32 %122 = OpFAdd %120 %121 
					                                             OpStore %117 %122 
					                       Private f32* %124 = OpAccessChain %30 %47 
					                                f32 %125 = OpLoad %124 
					                       Private f32* %126 = OpAccessChain %30 %47 
					                                f32 %127 = OpLoad %126 
					                                f32 %128 = OpFNegate %127 
					                               bool %129 = OpFOrdLessThan %125 %128 
					                                             OpStore %123 %129 
					                               bool %131 = OpLoad %123 
					                                f32 %133 = OpSelect %131 %132 %115 
					                       Private f32* %134 = OpAccessChain %130 %51 
					                                             OpStore %134 %133 
					                                f32 %135 = OpLoad %117 
					                       Private f32* %136 = OpAccessChain %130 %51 
					                                f32 %137 = OpLoad %136 
					                                f32 %138 = OpFAdd %135 %137 
					                                             OpStore %117 %138 
					                       Private f32* %139 = OpAccessChain %30 %47 
					                                f32 %140 = OpLoad %139 
					                       Private f32* %141 = OpAccessChain %30 %51 
					                                f32 %142 = OpLoad %141 
					                                f32 %143 = OpExtInst %1 37 %140 %142 
					                       Private f32* %144 = OpAccessChain %130 %51 
					                                             OpStore %144 %143 
					                       Private f32* %145 = OpAccessChain %130 %51 
					                                f32 %146 = OpLoad %145 
					                       Private f32* %147 = OpAccessChain %130 %51 
					                                f32 %148 = OpLoad %147 
					                                f32 %149 = OpFNegate %148 
					                               bool %150 = OpFOrdLessThan %146 %149 
					                                             OpStore %123 %150 
					                       Private f32* %151 = OpAccessChain %30 %47 
					                                f32 %152 = OpLoad %151 
					                       Private f32* %153 = OpAccessChain %30 %51 
					                                f32 %154 = OpLoad %153 
					                                f32 %155 = OpExtInst %1 40 %152 %154 
					                                             OpStore %97 %155 
					                                f32 %157 = OpLoad %97 
					                                f32 %158 = OpLoad %97 
					                                f32 %159 = OpFNegate %158 
					                               bool %160 = OpFOrdGreaterThanEqual %157 %159 
					                                             OpStore %156 %160 
					                               bool %161 = OpLoad %156 
					                               bool %162 = OpLoad %123 
					                               bool %163 = OpLogicalAnd %161 %162 
					                                             OpStore %123 %163 
					                               bool %164 = OpLoad %123 
					                                             OpSelectionMerge %168 None 
					                                             OpBranchConditional %164 %167 %171 
					                                    %167 = OpLabel 
					                                f32 %169 = OpLoad %117 
					                                f32 %170 = OpFNegate %169 
					                                             OpStore %166 %170 
					                                             OpBranch %168 
					                                    %171 = OpLabel 
					                                f32 %172 = OpLoad %117 
					                                             OpStore %166 %172 
					                                             OpBranch %168 
					                                    %168 = OpLabel 
					                                f32 %173 = OpLoad %166 
					                       Private f32* %174 = OpAccessChain %130 %47 
					                                             OpStore %174 %173 
					                       Private f32* %175 = OpAccessChain %130 %47 
					                                f32 %176 = OpLoad %175 
					                                f32 %178 = OpFMul %176 %177 
					                                             OpStore %117 %178 
					                       Private f32* %180 = OpAccessChain %30 %47 
					                                f32 %181 = OpLoad %180 
					                       Private f32* %182 = OpAccessChain %30 %51 
					                                f32 %183 = OpLoad %182 
					                                f32 %184 = OpFAdd %181 %183 
					                                             OpStore %179 %184 
					                       Private f32* %186 = OpAccessChain %30 %185 
					                                f32 %187 = OpLoad %186 
					                                f32 %188 = OpLoad %179 
					                                f32 %189 = OpFAdd %187 %188 
					                                             OpStore %179 %189 
					                                f32 %190 = OpLoad %179 
					                                f32 %192 = OpFMul %190 %191 
					                       Private f32* %193 = OpAccessChain %9 %51 
					                                             OpStore %193 %192 
					                       Private f32* %195 = OpAccessChain %9 %51 
					                                f32 %196 = OpLoad %195 
					                                f32 %197 = OpExtInst %1 14 %196 
					                                             OpStore %194 %197 
					                       Private f32* %198 = OpAccessChain %9 %51 
					                                f32 %199 = OpLoad %198 
					                                f32 %200 = OpExtInst %1 13 %199 
					                       Private f32* %201 = OpAccessChain %9 %51 
					                                             OpStore %201 %200 
					                                f32 %202 = OpLoad %194 
					                                f32 %204 = OpFMul %202 %203 
					                                f32 %205 = OpFAdd %204 %203 
					                       Private f32* %206 = OpAccessChain %9 %47 
					                                             OpStore %206 %205 
					                       Private f32* %207 = OpAccessChain %9 %51 
					                                f32 %208 = OpLoad %207 
					                                f32 %209 = OpFMul %208 %203 
					                                f32 %210 = OpFAdd %209 %203 
					                       Private f32* %211 = OpAccessChain %9 %51 
					                                             OpStore %211 %210 
					                              f32_2 %212 = OpLoad %9 
					                              f32_2 %213 = OpVectorShuffle %212 %212 1 0 
					                                f32 %214 = OpLoad %117 
					                              f32_2 %215 = OpCompositeConstruct %214 %214 
					                              f32_2 %216 = OpFMul %213 %215 
					                              f32_3 %217 = OpLoad %130 
					                              f32_3 %218 = OpVectorShuffle %217 %216 3 1 4 
					                                             OpStore %130 %218 
					                              f32_3 %221 = OpLoad %130 
					                              f32_3 %225 = OpFMul %221 %224 
					                              f32_4 %226 = OpLoad %220 
					                              f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
					                                             OpStore %220 %227 
					                        Output f32* %230 = OpAccessChain %220 %228 
					                                             OpStore %230 %56 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat16_1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat4;
					float u_xlat16_4;
					bool u_xlatb4;
					bool u_xlatb7;
					float u_xlat9;
					float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = max(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_1 = min(abs(u_xlat10_0.y), abs(u_xlat10_0.x));
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_1;
					    u_xlat16_1 = u_xlat16_9 * u_xlat16_9;
					    u_xlat16_4 = u_xlat16_1 * 0.0208350997 + -0.0851330012;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + 0.180141002;
					    u_xlat16_4 = u_xlat16_1 * u_xlat16_4 + -0.330299497;
					    u_xlat16_1 = u_xlat16_1 * u_xlat16_4 + 0.999866009;
					    u_xlat16_4 = u_xlat16_9 * u_xlat16_1;
					    u_xlat4 = u_xlat16_4 * -2.0 + 1.57079637;
					    u_xlatb7 = abs(u_xlat10_0.y)<abs(u_xlat10_0.x);
					    u_xlat4 = u_xlatb7 ? u_xlat4 : float(0.0);
					    u_xlat9 = u_xlat16_9 * u_xlat16_1 + u_xlat4;
					    u_xlatb1 = u_xlat10_0.y<(-u_xlat10_0.y);
					    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
					    u_xlat9 = u_xlat9 + u_xlat1.x;
					    u_xlat1.x = min(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
					    u_xlat4 = max(u_xlat10_0.y, u_xlat10_0.x);
					    u_xlatb4 = u_xlat4>=(-u_xlat4);
					    u_xlatb1 = u_xlatb4 && u_xlatb1;
					    u_xlat1.y = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
					    u_xlat9 = u_xlat1.y * 0.636619925;
					    u_xlat16_0 = u_xlat10_0.y + u_xlat10_0.x;
					    u_xlat16_0 = u_xlat10_0.z + u_xlat16_0;
					    u_xlat0.x = u_xlat16_0 * 2.09439349;
					    u_xlat2 = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.y = u_xlat2 * 0.5 + 0.5;
					    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
					    u_xlat1.xz = u_xlat0.yx * vec2(u_xlat9);
					    SV_Target0.xyz = u_xlat1.xyz * vec3(2.0, 0.127323985, 2.0);
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