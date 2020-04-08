Shader "CameraFilterPack/Drawing_Manga4" {
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
			GpuProgramID 59112
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
					float u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					float u_xlat16_4;
					float u_xlat5;
					float u_xlat16_5;
					float u_xlat8;
					vec2 u_xlat9;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat1 = u_xlat0 + vec4(0.0, 0.00390625, 0.00390625, 0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_4 = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1 = u_xlat0.zwzw + vec4(-0.00390625, 0.0, -0.00390625, 0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1 = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_5 = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_4 = u_xlat16_4 * 2.0 + u_xlat16_5;
					    u_xlat16_4 = u_xlat16_0 + u_xlat16_4;
					    u_xlat2 = u_xlat0.zwzw + vec4(-0.00390625, -0.00390625, 0.00390625, -0.00390625);
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat9.x = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat9.y = dot(u_xlat10_3, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat4.x = u_xlat16_4 + (-u_xlat9.y);
					    u_xlat0.y = (-u_xlat9.y) * 2.0 + u_xlat4.x;
					    u_xlat0.x = u_xlat16_0 + u_xlat9.x;
					    u_xlat0.x = u_xlat16_1 * 2.0 + u_xlat0.x;
					    u_xlat0.xy = (-u_xlat9.yx) + u_xlat0.xy;
					    u_xlat0.x = (-u_xlat16_1) * 2.0 + u_xlat0.x;
					    u_xlat0.x = (-u_xlat16_5) + u_xlat0.x;
					    u_xlat4.x = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat4.x;
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat1.xy = u_xlat0.zw * vec2(0.707106411, 0.707106411);
					    u_xlat4.x = u_xlat0.z * 0.707106411 + (-u_xlat1.y);
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.zw);
					    u_xlat8 = 2136.28125 / _DotSize;
					    u_xlat8 = u_xlat8 * 1.66666663;
					    u_xlat4.x = u_xlat8 * u_xlat4.x;
					    u_xlat4.y = u_xlat8 * u_xlat1.x;
					    u_xlat4.xy = cos(u_xlat4.xy);
					    u_xlat8 = u_xlat4.y * 0.25 + 0.5;
					    u_xlat4.x = u_xlat4.x * 0.25 + u_xlat8;
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat4.xx);
					    u_xlat4.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + (-u_xlat4.xxx);
					    u_xlat1.x = _DotSize * 0.125 + -0.200000018;
					    u_xlat1.x = u_xlat1.x * -3.33333349;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xxx + u_xlat10_2.xyy;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat1.xzz;
					    u_xlatb13 = 0.300000012<u_xlat1.x;
					    u_xlat4.xyz = (bool(u_xlatb13)) ? u_xlat4.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat4.xyz;
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
					; Bound: 352
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %341 
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
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %38 DescriptorSet 38 
					                                             OpDecorate %38 Binding 38 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %42 DescriptorSet 42 
					                                             OpDecorate %42 Binding 42 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %124 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %151 RelaxedPrecision 
					                                             OpDecorate %164 RelaxedPrecision 
					                                             OpDecorate %165 RelaxedPrecision 
					                                             OpDecorate %166 RelaxedPrecision 
					                                             OpDecorate %171 RelaxedPrecision 
					                                             OpDecorate %172 RelaxedPrecision 
					                                             OpDecorate %225 RelaxedPrecision 
					                                             OpDecorate %226 RelaxedPrecision 
					                                             OpDecorate %227 RelaxedPrecision 
					                                             OpDecorate %232 RelaxedPrecision 
					                                             OpDecorate %275 RelaxedPrecision 
					                                             OpDecorate %277 RelaxedPrecision 
					                                             OpDecorate %317 RelaxedPrecision 
					                                             OpDecorate %318 RelaxedPrecision 
					                                             OpDecorate %341 Location 341 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %15 = OpTypeStruct %6 %7 
					                                     %16 = OpTypePointer Uniform %15 
					       Uniform struct {f32; f32_4;}* %17 = OpVariable Uniform 
					                                     %18 = OpTypeInt 32 1 
					                                 i32 %19 = OpConstant 1 
					                                     %20 = OpTypePointer Uniform %7 
					                      Private f32_4* %29 = OpVariable Private 
					                                 f32 %31 = OpConstant 3,674022E-40 
					                                 f32 %32 = OpConstant 3,674022E-40 
					                               f32_4 %33 = OpConstantComposite %31 %32 %32 %32 
					                      Private f32_4* %35 = OpVariable Private 
					                                     %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %37 = OpTypePointer UniformConstant %36 
					UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
					                                     %40 = OpTypeSampler 
					                                     %41 = OpTypePointer UniformConstant %40 
					            UniformConstant sampler* %42 = OpVariable UniformConstant 
					                                     %44 = OpTypeSampledImage %36 
					                      Private f32_4* %49 = OpVariable Private 
					                                     %56 = OpTypePointer Private %6 
					                        Private f32* %57 = OpVariable Private 
					                                 f32 %59 = OpConstant 3,674022E-40 
					                                 f32 %60 = OpConstant 3,674022E-40 
					                                 f32 %61 = OpConstant 3,674022E-40 
					                                 f32 %62 = OpConstant 3,674022E-40 
					                               f32_4 %63 = OpConstantComposite %59 %60 %61 %62 
					                        Private f32* %65 = OpVariable Private 
					                                 f32 %70 = OpConstant 3,674022E-40 
					                               f32_4 %71 = OpConstantComposite %70 %31 %70 %32 
					                        Private f32* %85 = OpVariable Private 
					                        Private f32* %88 = OpVariable Private 
					                                 f32 %92 = OpConstant 3,674022E-40 
					                      Private f32_4* %99 = OpVariable Private 
					                              f32_4 %102 = OpConstantComposite %70 %70 %32 %70 
					                     Private f32_4* %104 = OpVariable Private 
					                                    %117 = OpTypePointer Private %10 
					                     Private f32_2* %118 = OpVariable Private 
					                                    %121 = OpTypeInt 32 0 
					                                u32 %122 = OpConstant 0 
					                                u32 %126 = OpConstant 1 
					                                    %128 = OpTypeVector %6 3 
					                                    %129 = OpTypePointer Private %128 
					                     Private f32_3* %130 = OpVariable Private 
					                                    %192 = OpTypeBool 
					                                    %193 = OpTypePointer Private %192 
					                      Private bool* %194 = OpVariable Private 
					                                f32 %195 = OpConstant 3,674022E-40 
					                                f32 %200 = OpConstant 3,674022E-40 
					                                f32 %205 = OpConstant 3,674022E-40 
					                              f32_2 %206 = OpConstantComposite %205 %205 
					                                u32 %210 = OpConstant 2 
					                     Private f32_3* %225 = OpVariable Private 
					                       Private f32* %233 = OpVariable Private 
					                                f32 %234 = OpConstant 3,674022E-40 
					                                i32 %235 = OpConstant 0 
					                                    %236 = OpTypePointer Uniform %6 
					                                f32 %241 = OpConstant 3,674022E-40 
					                                f32 %261 = OpConstant 3,674022E-40 
					                              f32_3 %276 = OpConstantComposite %92 %92 %92 
					                                f32 %284 = OpConstant 3,674022E-40 
					                                f32 %286 = OpConstant 3,674022E-40 
					                                f32 %291 = OpConstant 3,674022E-40 
					                                f32 %296 = OpConstant 3,674022E-40 
					                       Private f32* %299 = OpVariable Private 
					                                f32 %302 = OpConstant 3,674022E-40 
					                                f32 %304 = OpConstant 3,674022E-40 
					                      Private bool* %326 = OpVariable Private 
					                                    %331 = OpTypePointer Function %128 
					                                    %340 = OpTypePointer Output %7 
					                      Output f32_4* %341 = OpVariable Output 
					                                u32 %348 = OpConstant 3 
					                                    %349 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                    Function f32_3* %332 = OpVariable Function 
					                               f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
					                      Uniform f32_4* %21 = OpAccessChain %17 %19 
					                               f32_4 %22 = OpLoad %21 
					                               f32_4 %23 = OpVectorShuffle %22 %22 0 1 0 1 
					                               f32_4 %24 = OpFMul %14 %23 
					                      Uniform f32_4* %25 = OpAccessChain %17 %19 
					                               f32_4 %26 = OpLoad %25 
					                               f32_4 %27 = OpVectorShuffle %26 %26 2 3 2 3 
					                               f32_4 %28 = OpFAdd %24 %27 
					                                             OpStore %9 %28 
					                               f32_4 %30 = OpLoad %9 
					                               f32_4 %34 = OpFAdd %30 %33 
					                                             OpStore %29 %34 
					                 read_only Texture2D %39 = OpLoad %38 
					                             sampler %43 = OpLoad %42 
					          read_only Texture2DSampled %45 = OpSampledImage %39 %43 
					                               f32_4 %46 = OpLoad %29 
					                               f32_2 %47 = OpVectorShuffle %46 %46 0 1 
					                               f32_4 %48 = OpImageSampleImplicitLod %45 %47 
					                                             OpStore %35 %48 
					                 read_only Texture2D %50 = OpLoad %38 
					                             sampler %51 = OpLoad %42 
					          read_only Texture2DSampled %52 = OpSampledImage %50 %51 
					                               f32_4 %53 = OpLoad %29 
					                               f32_2 %54 = OpVectorShuffle %53 %53 2 3 
					                               f32_4 %55 = OpImageSampleImplicitLod %52 %54 
					                                             OpStore %49 %55 
					                               f32_4 %58 = OpLoad %49 
					                                 f32 %64 = OpDot %58 %63 
					                                             OpStore %57 %64 
					                               f32_4 %66 = OpLoad %35 
					                                 f32 %67 = OpDot %66 %63 
					                                             OpStore %65 %67 
					                               f32_4 %68 = OpLoad %9 
					                               f32_4 %69 = OpVectorShuffle %68 %68 2 3 2 3 
					                               f32_4 %72 = OpFAdd %69 %71 
					                                             OpStore %29 %72 
					                 read_only Texture2D %73 = OpLoad %38 
					                             sampler %74 = OpLoad %42 
					          read_only Texture2DSampled %75 = OpSampledImage %73 %74 
					                               f32_4 %76 = OpLoad %29 
					                               f32_2 %77 = OpVectorShuffle %76 %76 2 3 
					                               f32_4 %78 = OpImageSampleImplicitLod %75 %77 
					                                             OpStore %35 %78 
					                 read_only Texture2D %79 = OpLoad %38 
					                             sampler %80 = OpLoad %42 
					          read_only Texture2DSampled %81 = OpSampledImage %79 %80 
					                               f32_4 %82 = OpLoad %29 
					                               f32_2 %83 = OpVectorShuffle %82 %82 0 1 
					                               f32_4 %84 = OpImageSampleImplicitLod %81 %83 
					                                             OpStore %49 %84 
					                               f32_4 %86 = OpLoad %49 
					                                 f32 %87 = OpDot %86 %63 
					                                             OpStore %85 %87 
					                               f32_4 %89 = OpLoad %35 
					                                 f32 %90 = OpDot %89 %63 
					                                             OpStore %88 %90 
					                                 f32 %91 = OpLoad %65 
					                                 f32 %93 = OpFMul %91 %92 
					                                 f32 %94 = OpLoad %88 
					                                 f32 %95 = OpFAdd %93 %94 
					                                             OpStore %65 %95 
					                                 f32 %96 = OpLoad %57 
					                                 f32 %97 = OpLoad %65 
					                                 f32 %98 = OpFAdd %96 %97 
					                                             OpStore %65 %98 
					                              f32_4 %100 = OpLoad %9 
					                              f32_4 %101 = OpVectorShuffle %100 %100 2 3 2 3 
					                              f32_4 %103 = OpFAdd %101 %102 
					                                             OpStore %99 %103 
					                read_only Texture2D %105 = OpLoad %38 
					                            sampler %106 = OpLoad %42 
					         read_only Texture2DSampled %107 = OpSampledImage %105 %106 
					                              f32_4 %108 = OpLoad %99 
					                              f32_2 %109 = OpVectorShuffle %108 %108 0 1 
					                              f32_4 %110 = OpImageSampleImplicitLod %107 %109 
					                                             OpStore %104 %110 
					                read_only Texture2D %111 = OpLoad %38 
					                            sampler %112 = OpLoad %42 
					         read_only Texture2DSampled %113 = OpSampledImage %111 %112 
					                              f32_4 %114 = OpLoad %99 
					                              f32_2 %115 = OpVectorShuffle %114 %114 2 3 
					                              f32_4 %116 = OpImageSampleImplicitLod %113 %115 
					                                             OpStore %35 %116 
					                              f32_4 %119 = OpLoad %35 
					                                f32 %120 = OpDot %119 %63 
					                       Private f32* %123 = OpAccessChain %118 %122 
					                                             OpStore %123 %120 
					                              f32_4 %124 = OpLoad %104 
					                                f32 %125 = OpDot %124 %63 
					                       Private f32* %127 = OpAccessChain %118 %126 
					                                             OpStore %127 %125 
					                                f32 %131 = OpLoad %65 
					                       Private f32* %132 = OpAccessChain %118 %126 
					                                f32 %133 = OpLoad %132 
					                                f32 %134 = OpFNegate %133 
					                                f32 %135 = OpFAdd %131 %134 
					                       Private f32* %136 = OpAccessChain %130 %122 
					                                             OpStore %136 %135 
					                       Private f32* %137 = OpAccessChain %118 %126 
					                                f32 %138 = OpLoad %137 
					                                f32 %139 = OpFNegate %138 
					                                f32 %140 = OpFMul %139 %92 
					                       Private f32* %141 = OpAccessChain %130 %122 
					                                f32 %142 = OpLoad %141 
					                                f32 %143 = OpFAdd %140 %142 
					                       Private f32* %144 = OpAccessChain %9 %126 
					                                             OpStore %144 %143 
					                                f32 %145 = OpLoad %57 
					                       Private f32* %146 = OpAccessChain %118 %122 
					                                f32 %147 = OpLoad %146 
					                                f32 %148 = OpFAdd %145 %147 
					                       Private f32* %149 = OpAccessChain %9 %122 
					                                             OpStore %149 %148 
					                                f32 %150 = OpLoad %85 
					                                f32 %151 = OpFMul %150 %92 
					                       Private f32* %152 = OpAccessChain %9 %122 
					                                f32 %153 = OpLoad %152 
					                                f32 %154 = OpFAdd %151 %153 
					                       Private f32* %155 = OpAccessChain %9 %122 
					                                             OpStore %155 %154 
					                              f32_2 %156 = OpLoad %118 
					                              f32_2 %157 = OpVectorShuffle %156 %156 1 0 
					                              f32_2 %158 = OpFNegate %157 
					                              f32_4 %159 = OpLoad %9 
					                              f32_2 %160 = OpVectorShuffle %159 %159 0 1 
					                              f32_2 %161 = OpFAdd %158 %160 
					                              f32_4 %162 = OpLoad %9 
					                              f32_4 %163 = OpVectorShuffle %162 %161 4 5 2 3 
					                                             OpStore %9 %163 
					                                f32 %164 = OpLoad %85 
					                                f32 %165 = OpFNegate %164 
					                                f32 %166 = OpFMul %165 %92 
					                       Private f32* %167 = OpAccessChain %9 %122 
					                                f32 %168 = OpLoad %167 
					                                f32 %169 = OpFAdd %166 %168 
					                       Private f32* %170 = OpAccessChain %9 %122 
					                                             OpStore %170 %169 
					                                f32 %171 = OpLoad %88 
					                                f32 %172 = OpFNegate %171 
					                       Private f32* %173 = OpAccessChain %9 %122 
					                                f32 %174 = OpLoad %173 
					                                f32 %175 = OpFAdd %172 %174 
					                       Private f32* %176 = OpAccessChain %9 %122 
					                                             OpStore %176 %175 
					                       Private f32* %177 = OpAccessChain %9 %126 
					                                f32 %178 = OpLoad %177 
					                       Private f32* %179 = OpAccessChain %9 %126 
					                                f32 %180 = OpLoad %179 
					                                f32 %181 = OpFMul %178 %180 
					                       Private f32* %182 = OpAccessChain %130 %122 
					                                             OpStore %182 %181 
					                       Private f32* %183 = OpAccessChain %9 %122 
					                                f32 %184 = OpLoad %183 
					                       Private f32* %185 = OpAccessChain %9 %122 
					                                f32 %186 = OpLoad %185 
					                                f32 %187 = OpFMul %184 %186 
					                       Private f32* %188 = OpAccessChain %130 %122 
					                                f32 %189 = OpLoad %188 
					                                f32 %190 = OpFAdd %187 %189 
					                       Private f32* %191 = OpAccessChain %9 %122 
					                                             OpStore %191 %190 
					                       Private f32* %196 = OpAccessChain %9 %122 
					                                f32 %197 = OpLoad %196 
					                               bool %198 = OpFOrdLessThan %195 %197 
					                                             OpStore %194 %198 
					                               bool %199 = OpLoad %194 
					                                f32 %201 = OpSelect %199 %200 %31 
					                       Private f32* %202 = OpAccessChain %9 %122 
					                                             OpStore %202 %201 
					                              f32_4 %203 = OpLoad %9 
					                              f32_2 %204 = OpVectorShuffle %203 %203 2 3 
					                              f32_2 %207 = OpFMul %204 %206 
					                              f32_4 %208 = OpLoad %29 
					                              f32_4 %209 = OpVectorShuffle %208 %207 4 5 2 3 
					                                             OpStore %29 %209 
					                       Private f32* %211 = OpAccessChain %9 %210 
					                                f32 %212 = OpLoad %211 
					                                f32 %213 = OpFMul %212 %205 
					                       Private f32* %214 = OpAccessChain %29 %126 
					                                f32 %215 = OpLoad %214 
					                                f32 %216 = OpFNegate %215 
					                                f32 %217 = OpFAdd %213 %216 
					                       Private f32* %218 = OpAccessChain %130 %122 
					                                             OpStore %218 %217 
					                       Private f32* %219 = OpAccessChain %29 %126 
					                                f32 %220 = OpLoad %219 
					                       Private f32* %221 = OpAccessChain %29 %122 
					                                f32 %222 = OpLoad %221 
					                                f32 %223 = OpFAdd %220 %222 
					                       Private f32* %224 = OpAccessChain %29 %122 
					                                             OpStore %224 %223 
					                read_only Texture2D %226 = OpLoad %38 
					                            sampler %227 = OpLoad %42 
					         read_only Texture2DSampled %228 = OpSampledImage %226 %227 
					                              f32_4 %229 = OpLoad %9 
					                              f32_2 %230 = OpVectorShuffle %229 %229 2 3 
					                              f32_4 %231 = OpImageSampleImplicitLod %228 %230 
					                              f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
					                                             OpStore %225 %232 
					                       Uniform f32* %237 = OpAccessChain %17 %235 
					                                f32 %238 = OpLoad %237 
					                                f32 %239 = OpFDiv %234 %238 
					                                             OpStore %233 %239 
					                                f32 %240 = OpLoad %233 
					                                f32 %242 = OpFMul %240 %241 
					                                             OpStore %233 %242 
					                                f32 %243 = OpLoad %233 
					                       Private f32* %244 = OpAccessChain %130 %122 
					                                f32 %245 = OpLoad %244 
					                                f32 %246 = OpFMul %243 %245 
					                       Private f32* %247 = OpAccessChain %130 %122 
					                                             OpStore %247 %246 
					                                f32 %248 = OpLoad %233 
					                       Private f32* %249 = OpAccessChain %29 %122 
					                                f32 %250 = OpLoad %249 
					                                f32 %251 = OpFMul %248 %250 
					                       Private f32* %252 = OpAccessChain %130 %126 
					                                             OpStore %252 %251 
					                              f32_3 %253 = OpLoad %130 
					                              f32_2 %254 = OpVectorShuffle %253 %253 0 1 
					                              f32_2 %255 = OpExtInst %1 14 %254 
					                              f32_3 %256 = OpLoad %130 
					                              f32_3 %257 = OpVectorShuffle %256 %255 3 4 2 
					                                             OpStore %130 %257 
					                       Private f32* %258 = OpAccessChain %130 %126 
					                                f32 %259 = OpLoad %258 
					                                f32 %260 = OpFMul %259 %62 
					                                f32 %262 = OpFAdd %260 %261 
					                                             OpStore %233 %262 
					                       Private f32* %263 = OpAccessChain %130 %122 
					                                f32 %264 = OpLoad %263 
					                                f32 %265 = OpFMul %264 %62 
					                                f32 %266 = OpLoad %233 
					                                f32 %267 = OpFAdd %265 %266 
					                       Private f32* %268 = OpAccessChain %130 %122 
					                                             OpStore %268 %267 
					                              f32_4 %269 = OpLoad %9 
					                              f32_2 %270 = OpVectorShuffle %269 %269 0 0 
					                              f32_3 %271 = OpLoad %130 
					                              f32_2 %272 = OpVectorShuffle %271 %271 0 0 
					                                f32 %273 = OpDot %270 %272 
					                       Private f32* %274 = OpAccessChain %9 %122 
					                                             OpStore %274 %273 
					                              f32_3 %275 = OpLoad %225 
					                              f32_3 %277 = OpFMul %275 %276 
					                              f32_3 %278 = OpLoad %130 
					                              f32_3 %279 = OpVectorShuffle %278 %278 0 0 0 
					                              f32_3 %280 = OpFNegate %279 
					                              f32_3 %281 = OpFAdd %277 %280 
					                                             OpStore %130 %281 
					                       Uniform f32* %282 = OpAccessChain %17 %235 
					                                f32 %283 = OpLoad %282 
					                                f32 %285 = OpFMul %283 %284 
					                                f32 %287 = OpFAdd %285 %286 
					                       Private f32* %288 = OpAccessChain %29 %122 
					                                             OpStore %288 %287 
					                       Private f32* %289 = OpAccessChain %29 %122 
					                                f32 %290 = OpLoad %289 
					                                f32 %292 = OpFMul %290 %291 
					                       Private f32* %293 = OpAccessChain %29 %122 
					                                             OpStore %293 %292 
					                       Private f32* %294 = OpAccessChain %29 %122 
					                                f32 %295 = OpLoad %294 
					                                f32 %297 = OpExtInst %1 43 %295 %31 %296 
					                       Private f32* %298 = OpAccessChain %29 %122 
					                                             OpStore %298 %297 
					                       Private f32* %300 = OpAccessChain %29 %122 
					                                f32 %301 = OpLoad %300 
					                                f32 %303 = OpFMul %301 %302 
					                                f32 %305 = OpFAdd %303 %304 
					                                             OpStore %299 %305 
					                       Private f32* %306 = OpAccessChain %29 %122 
					                                f32 %307 = OpLoad %306 
					                       Private f32* %308 = OpAccessChain %29 %122 
					                                f32 %309 = OpLoad %308 
					                                f32 %310 = OpFMul %307 %309 
					                       Private f32* %311 = OpAccessChain %29 %122 
					                                             OpStore %311 %310 
					                                f32 %312 = OpLoad %299 
					                              f32_3 %313 = OpCompositeConstruct %312 %312 %312 
					                              f32_4 %314 = OpLoad %29 
					                              f32_3 %315 = OpVectorShuffle %314 %314 0 0 0 
					                              f32_3 %316 = OpFMul %313 %315 
					                              f32_3 %317 = OpLoad %225 
					                              f32_3 %318 = OpVectorShuffle %317 %317 0 1 1 
					                              f32_3 %319 = OpFAdd %316 %318 
					                              f32_4 %320 = OpLoad %29 
					                              f32_4 %321 = OpVectorShuffle %320 %319 4 5 6 3 
					                                             OpStore %29 %321 
					                              f32_3 %322 = OpLoad %130 
					                              f32_4 %323 = OpLoad %29 
					                              f32_3 %324 = OpVectorShuffle %323 %323 0 2 2 
					                              f32_3 %325 = OpFAdd %322 %324 
					                                             OpStore %130 %325 
					                       Private f32* %327 = OpAccessChain %29 %122 
					                                f32 %328 = OpLoad %327 
					                               bool %329 = OpFOrdLessThan %59 %328 
					                                             OpStore %326 %329 
					                               bool %330 = OpLoad %326 
					                                             OpSelectionMerge %334 None 
					                                             OpBranchConditional %330 %333 %336 
					                                    %333 = OpLabel 
					                              f32_3 %335 = OpLoad %130 
					                                             OpStore %332 %335 
					                                             OpBranch %334 
					                                    %336 = OpLabel 
					                              f32_4 %337 = OpLoad %29 
					                              f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
					                                             OpStore %332 %338 
					                                             OpBranch %334 
					                                    %334 = OpLabel 
					                              f32_3 %339 = OpLoad %332 
					                                             OpStore %130 %339 
					                              f32_4 %342 = OpLoad %9 
					                              f32_3 %343 = OpVectorShuffle %342 %342 0 0 0 
					                              f32_3 %344 = OpLoad %130 
					                              f32_3 %345 = OpFAdd %343 %344 
					                              f32_4 %346 = OpLoad %341 
					                              f32_4 %347 = OpVectorShuffle %346 %345 4 5 6 3 
					                                             OpStore %341 %347 
					                        Output f32* %350 = OpAccessChain %341 %348 
					                                             OpStore %350 %296 
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
					float u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					float u_xlat16_4;
					float u_xlat5;
					float u_xlat16_5;
					float u_xlat8;
					vec2 u_xlat9;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat1 = u_xlat0 + vec4(0.0, 0.00390625, 0.00390625, 0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_0 = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_4 = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1 = u_xlat0.zwzw + vec4(-0.00390625, 0.0, -0.00390625, 0.00390625);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1 = dot(u_xlat10_1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_5 = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat16_4 = u_xlat16_4 * 2.0 + u_xlat16_5;
					    u_xlat16_4 = u_xlat16_0 + u_xlat16_4;
					    u_xlat2 = u_xlat0.zwzw + vec4(-0.00390625, -0.00390625, 0.00390625, -0.00390625);
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat9.x = dot(u_xlat10_2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat9.y = dot(u_xlat10_3, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat4.x = u_xlat16_4 + (-u_xlat9.y);
					    u_xlat0.y = (-u_xlat9.y) * 2.0 + u_xlat4.x;
					    u_xlat0.x = u_xlat16_0 + u_xlat9.x;
					    u_xlat0.x = u_xlat16_1 * 2.0 + u_xlat0.x;
					    u_xlat0.xy = (-u_xlat9.yx) + u_xlat0.xy;
					    u_xlat0.x = (-u_xlat16_1) * 2.0 + u_xlat0.x;
					    u_xlat0.x = (-u_xlat16_5) + u_xlat0.x;
					    u_xlat4.x = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat4.x;
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat1.xy = u_xlat0.zw * vec2(0.707106411, 0.707106411);
					    u_xlat4.x = u_xlat0.z * 0.707106411 + (-u_xlat1.y);
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.zw);
					    u_xlat8 = 2136.28125 / _DotSize;
					    u_xlat8 = u_xlat8 * 1.66666663;
					    u_xlat4.x = u_xlat8 * u_xlat4.x;
					    u_xlat4.y = u_xlat8 * u_xlat1.x;
					    u_xlat4.xy = cos(u_xlat4.xy);
					    u_xlat8 = u_xlat4.y * 0.25 + 0.5;
					    u_xlat4.x = u_xlat4.x * 0.25 + u_xlat8;
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat4.xx);
					    u_xlat4.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + (-u_xlat4.xxx);
					    u_xlat1.x = _DotSize * 0.125 + -0.200000018;
					    u_xlat1.x = u_xlat1.x * -3.33333349;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xxx + u_xlat10_2.xyy;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat1.xzz;
					    u_xlatb13 = 0.300000012<u_xlat1.x;
					    u_xlat4.xyz = (bool(u_xlatb13)) ? u_xlat4.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat4.xyz;
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