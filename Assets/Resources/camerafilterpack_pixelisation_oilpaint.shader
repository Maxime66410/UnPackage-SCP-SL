Shader "CameraFilterPack/Pixelisation_OilPaint" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0, 5)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 56490
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					vec3 u_xlat8;
					vec3 u_xlat16_8;
					vec4 u_xlat10_8;
					float u_xlat9;
					bool u_xlatb9;
					vec2 u_xlat18;
					float u_xlat28;
					void main()
					{
					    u_xlat0.xy = vec2(_Value) / _ScreenResolution.xy;
					    u_xlat18.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + u_xlat18.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
					    u_xlat10_4 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_3.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz + u_xlat10_4.xyz;
					    u_xlat4 = u_xlat0.xyxy * vec4(2.0, 0.0, -4.0, -3.0) + u_xlat18.xyxy;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_3.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_5.xyz;
					    u_xlat5 = u_xlat0.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + u_xlat18.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_3.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_6.xyz;
					    u_xlat6.xy = u_xlat0.xy + u_xlat18.xy;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_3.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_6.xyz;
					    u_xlat6 = u_xlat0.xyxy * vec4(2.0, 1.0, -4.0, -2.0) + u_xlat18.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_3.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_7.xyz;
					    u_xlat7 = u_xlat0.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + u_xlat18.xyxy;
					    u_xlat10_8 = texture(_MainTex, u_xlat7.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat7.zw);
					    u_xlat16_3.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_8.xyz;
					    u_xlat8.xy = u_xlat0.xy * vec2(1.0, 2.0) + u_xlat18.xy;
					    u_xlat10_8 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_3.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_8.xyz;
					    u_xlat8.xy = u_xlat0.xy * vec2(2.0, 2.0) + u_xlat18.xy;
					    u_xlat0 = u_xlat0.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + u_xlat18.xyxy;
					    u_xlat10_8 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_3.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_8.xyz;
					    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat8.xyz = u_xlat2.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat16_3.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat8.xyz);
					    u_xlat28 = abs(u_xlat3.y) + abs(u_xlat3.x);
					    u_xlat28 = abs(u_xlat3.z) + u_xlat28;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_8.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
					    u_xlat16_8.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz + u_xlat16_8.xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz + u_xlat16_8.xyz;
					    u_xlat16_1.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat10_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat16_0.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat10_5.xyz + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat10_6.xyz + u_xlat16_1.xyz;
					    u_xlat16_1.xyz = u_xlat10_7.xyz + u_xlat16_1.xyz;
					    u_xlat16_1.xyz = u_xlat10_5.xyz + u_xlat16_1.xyz;
					    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat1.xyz = u_xlat3.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat1.xyz);
					    u_xlat0.x = abs(u_xlat0.y) + abs(u_xlat0.x);
					    u_xlat0.x = abs(u_xlat0.z) + u_xlat0.x;
					    u_xlat9 = min(u_xlat0.x, 100.0);
					    u_xlatb0 = u_xlat0.x<100.0;
					    u_xlatb9 = u_xlat28<u_xlat9;
					    u_xlat3.w = 1.0;
					    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3, vec4(bvec4(u_xlatb0)));
					    u_xlat2.w = 1.0;
					    SV_Target0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat1;
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
					; Bound: 492
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %31 %485 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpMemberDecorate %10 1 Offset 10 
					                                             OpMemberDecorate %10 2 RelaxedPrecision 
					                                             OpMemberDecorate %10 2 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD0 Location 31 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %58 DescriptorSet 58 
					                                             OpDecorate %58 Binding 58 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %62 DescriptorSet 62 
					                                             OpDecorate %62 Binding 62 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %123 RelaxedPrecision 
					                                             OpDecorate %124 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %130 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %158 RelaxedPrecision 
					                                             OpDecorate %159 RelaxedPrecision 
					                                             OpDecorate %160 RelaxedPrecision 
					                                             OpDecorate %161 RelaxedPrecision 
					                                             OpDecorate %162 RelaxedPrecision 
					                                             OpDecorate %170 RelaxedPrecision 
					                                             OpDecorate %171 RelaxedPrecision 
					                                             OpDecorate %176 RelaxedPrecision 
					                                             OpDecorate %177 RelaxedPrecision 
					                                             OpDecorate %178 RelaxedPrecision 
					                                             OpDecorate %179 RelaxedPrecision 
					                                             OpDecorate %180 RelaxedPrecision 
					                                             OpDecorate %181 RelaxedPrecision 
					                                             OpDecorate %182 RelaxedPrecision 
					                                             OpDecorate %183 RelaxedPrecision 
					                                             OpDecorate %184 RelaxedPrecision 
					                                             OpDecorate %192 RelaxedPrecision 
					                                             OpDecorate %193 RelaxedPrecision 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %199 RelaxedPrecision 
					                                             OpDecorate %200 RelaxedPrecision 
					                                             OpDecorate %201 RelaxedPrecision 
					                                             OpDecorate %206 RelaxedPrecision 
					                                             OpDecorate %207 RelaxedPrecision 
					                                             OpDecorate %208 RelaxedPrecision 
					                                             OpDecorate %209 RelaxedPrecision 
					                                             OpDecorate %210 RelaxedPrecision 
					                                             OpDecorate %211 RelaxedPrecision 
					                                             OpDecorate %212 RelaxedPrecision 
					                                             OpDecorate %213 RelaxedPrecision 
					                                             OpDecorate %214 RelaxedPrecision 
					                                             OpDecorate %223 RelaxedPrecision 
					                                             OpDecorate %224 RelaxedPrecision 
					                                             OpDecorate %225 RelaxedPrecision 
					                                             OpDecorate %230 RelaxedPrecision 
					                                             OpDecorate %231 RelaxedPrecision 
					                                             OpDecorate %232 RelaxedPrecision 
					                                             OpDecorate %237 RelaxedPrecision 
					                                             OpDecorate %238 RelaxedPrecision 
					                                             OpDecorate %239 RelaxedPrecision 
					                                             OpDecorate %240 RelaxedPrecision 
					                                             OpDecorate %241 RelaxedPrecision 
					                                             OpDecorate %242 RelaxedPrecision 
					                                             OpDecorate %243 RelaxedPrecision 
					                                             OpDecorate %244 RelaxedPrecision 
					                                             OpDecorate %245 RelaxedPrecision 
					                                             OpDecorate %255 RelaxedPrecision 
					                                             OpDecorate %256 RelaxedPrecision 
					                                             OpDecorate %261 RelaxedPrecision 
					                                             OpDecorate %262 RelaxedPrecision 
					                                             OpDecorate %263 RelaxedPrecision 
					                                             OpDecorate %264 RelaxedPrecision 
					                                             OpDecorate %265 RelaxedPrecision 
					                                             OpDecorate %266 RelaxedPrecision 
					                                             OpDecorate %267 RelaxedPrecision 
					                                             OpDecorate %268 RelaxedPrecision 
					                                             OpDecorate %269 RelaxedPrecision 
					                                             OpDecorate %285 RelaxedPrecision 
					                                             OpDecorate %286 RelaxedPrecision 
					                                             OpDecorate %291 RelaxedPrecision 
					                                             OpDecorate %292 RelaxedPrecision 
					                                             OpDecorate %293 RelaxedPrecision 
					                                             OpDecorate %294 RelaxedPrecision 
					                                             OpDecorate %295 RelaxedPrecision 
					                                             OpDecorate %296 RelaxedPrecision 
					                                             OpDecorate %297 RelaxedPrecision 
					                                             OpDecorate %298 RelaxedPrecision 
					                                             OpDecorate %299 RelaxedPrecision 
					                                             OpDecorate %301 RelaxedPrecision 
					                                             OpDecorate %304 RelaxedPrecision 
					                                             OpDecorate %313 RelaxedPrecision 
					                                             OpDecorate %314 RelaxedPrecision 
					                                             OpDecorate %338 RelaxedPrecision 
					                                             OpDecorate %339 RelaxedPrecision 
					                                             OpDecorate %340 RelaxedPrecision 
					                                             OpDecorate %345 RelaxedPrecision 
					                                             OpDecorate %346 RelaxedPrecision 
					                                             OpDecorate %347 RelaxedPrecision 
					                                             OpDecorate %348 RelaxedPrecision 
					                                             OpDecorate %353 RelaxedPrecision 
					                                             OpDecorate %354 RelaxedPrecision 
					                                             OpDecorate %355 RelaxedPrecision 
					                                             OpDecorate %356 RelaxedPrecision 
					                                             OpDecorate %357 RelaxedPrecision 
					                                             OpDecorate %358 RelaxedPrecision 
					                                             OpDecorate %359 RelaxedPrecision 
					                                             OpDecorate %360 RelaxedPrecision 
					                                             OpDecorate %361 RelaxedPrecision 
					                                             OpDecorate %362 RelaxedPrecision 
					                                             OpDecorate %363 RelaxedPrecision 
					                                             OpDecorate %364 RelaxedPrecision 
					                                             OpDecorate %365 RelaxedPrecision 
					                                             OpDecorate %366 RelaxedPrecision 
					                                             OpDecorate %367 RelaxedPrecision 
					                                             OpDecorate %368 RelaxedPrecision 
					                                             OpDecorate %369 RelaxedPrecision 
					                                             OpDecorate %370 RelaxedPrecision 
					                                             OpDecorate %371 RelaxedPrecision 
					                                             OpDecorate %372 RelaxedPrecision 
					                                             OpDecorate %373 RelaxedPrecision 
					                                             OpDecorate %374 RelaxedPrecision 
					                                             OpDecorate %375 RelaxedPrecision 
					                                             OpDecorate %376 RelaxedPrecision 
					                                             OpDecorate %377 RelaxedPrecision 
					                                             OpDecorate %378 RelaxedPrecision 
					                                             OpDecorate %379 RelaxedPrecision 
					                                             OpDecorate %380 RelaxedPrecision 
					                                             OpDecorate %381 RelaxedPrecision 
					                                             OpDecorate %382 RelaxedPrecision 
					                                             OpDecorate %383 RelaxedPrecision 
					                                             OpDecorate %384 RelaxedPrecision 
					                                             OpDecorate %385 RelaxedPrecision 
					                                             OpDecorate %386 RelaxedPrecision 
					                                             OpDecorate %387 RelaxedPrecision 
					                                             OpDecorate %388 RelaxedPrecision 
					                                             OpDecorate %389 RelaxedPrecision 
					                                             OpDecorate %390 RelaxedPrecision 
					                                             OpDecorate %391 RelaxedPrecision 
					                                             OpDecorate %392 RelaxedPrecision 
					                                             OpDecorate %393 RelaxedPrecision 
					                                             OpDecorate %394 RelaxedPrecision 
					                                             OpDecorate %395 RelaxedPrecision 
					                                             OpDecorate %396 RelaxedPrecision 
					                                             OpDecorate %397 RelaxedPrecision 
					                                             OpDecorate %398 RelaxedPrecision 
					                                             OpDecorate %399 RelaxedPrecision 
					                                             OpDecorate %400 RelaxedPrecision 
					                                             OpDecorate %401 RelaxedPrecision 
					                                             OpDecorate %402 RelaxedPrecision 
					                                             OpDecorate %403 RelaxedPrecision 
					                                             OpDecorate %404 RelaxedPrecision 
					                                             OpDecorate %405 RelaxedPrecision 
					                                             OpDecorate %406 RelaxedPrecision 
					                                             OpDecorate %407 RelaxedPrecision 
					                                             OpDecorate %408 RelaxedPrecision 
					                                             OpDecorate %409 RelaxedPrecision 
					                                             OpDecorate %410 RelaxedPrecision 
					                                             OpDecorate %411 RelaxedPrecision 
					                                             OpDecorate %412 RelaxedPrecision 
					                                             OpDecorate %413 RelaxedPrecision 
					                                             OpDecorate %414 RelaxedPrecision 
					                                             OpDecorate %415 RelaxedPrecision 
					                                             OpDecorate %416 RelaxedPrecision 
					                                             OpDecorate %417 RelaxedPrecision 
					                                             OpDecorate %418 RelaxedPrecision 
					                                             OpDecorate %419 RelaxedPrecision 
					                                             OpDecorate %420 RelaxedPrecision 
					                                             OpDecorate %421 RelaxedPrecision 
					                                             OpDecorate %422 RelaxedPrecision 
					                                             OpDecorate %423 RelaxedPrecision 
					                                             OpDecorate %424 RelaxedPrecision 
					                                             OpDecorate %425 RelaxedPrecision 
					                                             OpDecorate %435 RelaxedPrecision 
					                                             OpDecorate %436 RelaxedPrecision 
					                                             OpDecorate %485 Location 485 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeStruct %7 %6 %7 
					                                     %11 = OpTypePointer Uniform %10 
					Uniform struct {f32_4; f32; f32_4;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 1 
					                                     %15 = OpTypePointer Uniform %6 
					                                     %18 = OpTypeVector %6 2 
					                                 i32 %20 = OpConstant 0 
					                                     %21 = OpTypePointer Uniform %7 
					                                     %28 = OpTypePointer Private %18 
					                      Private f32_2* %29 = OpVariable Private 
					                                     %30 = OpTypePointer Input %18 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %33 = OpConstant 2 
					                      Private f32_4* %42 = OpVariable Private 
					                                 f32 %45 = OpConstant 3,674022E-40 
					                                 f32 %46 = OpConstant 3,674022E-40 
					                                 f32 %47 = OpConstant 3,674022E-40 
					                               f32_4 %48 = OpConstantComposite %45 %46 %47 %47 
					                                     %53 = OpTypeVector %6 3 
					                                     %54 = OpTypePointer Private %53 
					                      Private f32_3* %55 = OpVariable Private 
					                                     %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %57 = OpTypePointer UniformConstant %56 
					UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
					                                     %60 = OpTypeSampler 
					                                     %61 = OpTypePointer UniformConstant %60 
					            UniformConstant sampler* %62 = OpVariable UniformConstant 
					                                     %64 = OpTypeSampledImage %56 
					                      Private f32_3* %70 = OpVariable Private 
					                      Private f32_3* %78 = OpVariable Private 
					                      Private f32_3* %82 = OpVariable Private 
					                      Private f32_3* %94 = OpVariable Private 
					                      Private f32_4* %98 = OpVariable Private 
					                                f32 %101 = OpConstant 3,674022E-40 
					                                f32 %102 = OpConstant 3,674022E-40 
					                                f32 %103 = OpConstant 3,674022E-40 
					                              f32_4 %104 = OpConstantComposite %101 %46 %102 %103 
					                     Private f32_3* %109 = OpVariable Private 
					                     Private f32_4* %132 = OpVariable Private 
					                              f32_4 %135 = OpConstantComposite %46 %45 %47 %103 
					                     Private f32_3* %140 = OpVariable Private 
					                     Private f32_4* %163 = OpVariable Private 
					                              f32_4 %187 = OpConstantComposite %101 %45 %102 %47 
					                     Private f32_3* %192 = OpVariable Private 
					                     Private f32_4* %215 = OpVariable Private 
					                              f32_4 %218 = OpConstantComposite %46 %101 %103 %47 
					                     Private f32_3* %223 = OpVariable Private 
					                     Private f32_3* %246 = OpVariable Private 
					                              f32_2 %249 = OpConstantComposite %45 %101 
					                              f32_2 %272 = OpConstantComposite %101 %101 
					                              f32_4 %280 = OpConstantComposite %102 %102 %103 %103 
					                     Private f32_4* %300 = OpVariable Private 
					                                f32 %302 = OpConstant 3,674022E-40 
					                              f32_3 %303 = OpConstantComposite %302 %302 %302 
					                     Private f32_4* %312 = OpVariable Private 
					                                    %320 = OpTypePointer Private %6 
					                       Private f32* %321 = OpVariable Private 
					                                    %322 = OpTypeInt 32 0 
					                                u32 %323 = OpConstant 1 
					                                u32 %327 = OpConstant 0 
					                                u32 %332 = OpConstant 2 
					                     Private f32_3* %338 = OpVariable Private 
					                     Private f32_3* %346 = OpVariable Private 
					                     Private f32_3* %354 = OpVariable Private 
					                     Private f32_3* %369 = OpVariable Private 
					                     Private f32_3* %386 = OpVariable Private 
					                       Private f32* %458 = OpVariable Private 
					                                f32 %461 = OpConstant 3,674022E-40 
					                                    %463 = OpTypeBool 
					                                    %464 = OpTypePointer Private %463 
					                      Private bool* %465 = OpVariable Private 
					                      Private bool* %469 = OpVariable Private 
					                                u32 %473 = OpConstant 3 
					                              f32_4 %475 = OpConstantComposite %46 %46 %46 %46 
					                                    %478 = OpTypeVector %463 4 
					                              f32_4 %480 = OpConstantComposite %45 %45 %45 %45 
					                                    %484 = OpTypePointer Output %7 
					                      Output f32_4* %485 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                        Uniform f32* %16 = OpAccessChain %12 %14 
					                                 f32 %17 = OpLoad %16 
					                               f32_2 %19 = OpCompositeConstruct %17 %17 
					                      Uniform f32_4* %22 = OpAccessChain %12 %20 
					                               f32_4 %23 = OpLoad %22 
					                               f32_2 %24 = OpVectorShuffle %23 %23 0 1 
					                               f32_2 %25 = OpFDiv %19 %24 
					                               f32_4 %26 = OpLoad %9 
					                               f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
					                                             OpStore %9 %27 
					                               f32_2 %32 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %34 = OpAccessChain %12 %33 
					                               f32_4 %35 = OpLoad %34 
					                               f32_2 %36 = OpVectorShuffle %35 %35 0 1 
					                               f32_2 %37 = OpFMul %32 %36 
					                      Uniform f32_4* %38 = OpAccessChain %12 %33 
					                               f32_4 %39 = OpLoad %38 
					                               f32_2 %40 = OpVectorShuffle %39 %39 2 3 
					                               f32_2 %41 = OpFAdd %37 %40 
					                                             OpStore %29 %41 
					                               f32_4 %43 = OpLoad %9 
					                               f32_4 %44 = OpVectorShuffle %43 %43 0 1 0 1 
					                               f32_4 %49 = OpFMul %44 %48 
					                               f32_2 %50 = OpLoad %29 
					                               f32_4 %51 = OpVectorShuffle %50 %50 0 1 0 1 
					                               f32_4 %52 = OpFAdd %49 %51 
					                                             OpStore %42 %52 
					                 read_only Texture2D %59 = OpLoad %58 
					                             sampler %63 = OpLoad %62 
					          read_only Texture2DSampled %65 = OpSampledImage %59 %63 
					                               f32_4 %66 = OpLoad %42 
					                               f32_2 %67 = OpVectorShuffle %66 %66 0 1 
					                               f32_4 %68 = OpImageSampleImplicitLod %65 %67 
					                               f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
					                                             OpStore %55 %69 
					                 read_only Texture2D %71 = OpLoad %58 
					                             sampler %72 = OpLoad %62 
					          read_only Texture2DSampled %73 = OpSampledImage %71 %72 
					                               f32_4 %74 = OpLoad %42 
					                               f32_2 %75 = OpVectorShuffle %74 %74 2 3 
					                               f32_4 %76 = OpImageSampleImplicitLod %73 %75 
					                               f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
					                                             OpStore %70 %77 
					                               f32_3 %79 = OpLoad %55 
					                               f32_3 %80 = OpLoad %55 
					                               f32_3 %81 = OpFMul %79 %80 
					                                             OpStore %78 %81 
					                 read_only Texture2D %83 = OpLoad %58 
					                             sampler %84 = OpLoad %62 
					          read_only Texture2DSampled %85 = OpSampledImage %83 %84 
					                               f32_2 %86 = OpLoad %29 
					                               f32_4 %87 = OpImageSampleImplicitLod %85 %86 
					                               f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
					                                             OpStore %82 %88 
					                               f32_3 %89 = OpLoad %82 
					                               f32_3 %90 = OpLoad %82 
					                               f32_3 %91 = OpFMul %89 %90 
					                               f32_3 %92 = OpLoad %78 
					                               f32_3 %93 = OpFAdd %91 %92 
					                                             OpStore %78 %93 
					                               f32_3 %95 = OpLoad %55 
					                               f32_3 %96 = OpLoad %82 
					                               f32_3 %97 = OpFAdd %95 %96 
					                                             OpStore %94 %97 
					                               f32_4 %99 = OpLoad %9 
					                              f32_4 %100 = OpVectorShuffle %99 %99 0 1 0 1 
					                              f32_4 %105 = OpFMul %100 %104 
					                              f32_2 %106 = OpLoad %29 
					                              f32_4 %107 = OpVectorShuffle %106 %106 0 1 0 1 
					                              f32_4 %108 = OpFAdd %105 %107 
					                                             OpStore %98 %108 
					                read_only Texture2D %110 = OpLoad %58 
					                            sampler %111 = OpLoad %62 
					         read_only Texture2DSampled %112 = OpSampledImage %110 %111 
					                              f32_4 %113 = OpLoad %98 
					                              f32_2 %114 = OpVectorShuffle %113 %113 0 1 
					                              f32_4 %115 = OpImageSampleImplicitLod %112 %114 
					                              f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
					                                             OpStore %109 %116 
					                read_only Texture2D %117 = OpLoad %58 
					                            sampler %118 = OpLoad %62 
					         read_only Texture2DSampled %119 = OpSampledImage %117 %118 
					                              f32_4 %120 = OpLoad %98 
					                              f32_2 %121 = OpVectorShuffle %120 %120 2 3 
					                              f32_4 %122 = OpImageSampleImplicitLod %119 %121 
					                              f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
					                                             OpStore %82 %123 
					                              f32_3 %124 = OpLoad %109 
					                              f32_3 %125 = OpLoad %109 
					                              f32_3 %126 = OpFMul %124 %125 
					                              f32_3 %127 = OpLoad %78 
					                              f32_3 %128 = OpFAdd %126 %127 
					                                             OpStore %78 %128 
					                              f32_3 %129 = OpLoad %94 
					                              f32_3 %130 = OpLoad %109 
					                              f32_3 %131 = OpFAdd %129 %130 
					                                             OpStore %94 %131 
					                              f32_4 %133 = OpLoad %9 
					                              f32_4 %134 = OpVectorShuffle %133 %133 0 1 0 1 
					                              f32_4 %136 = OpFMul %134 %135 
					                              f32_2 %137 = OpLoad %29 
					                              f32_4 %138 = OpVectorShuffle %137 %137 0 1 0 1 
					                              f32_4 %139 = OpFAdd %136 %138 
					                                             OpStore %132 %139 
					                read_only Texture2D %141 = OpLoad %58 
					                            sampler %142 = OpLoad %62 
					         read_only Texture2DSampled %143 = OpSampledImage %141 %142 
					                              f32_4 %144 = OpLoad %132 
					                              f32_2 %145 = OpVectorShuffle %144 %144 0 1 
					                              f32_4 %146 = OpImageSampleImplicitLod %143 %145 
					                              f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
					                                             OpStore %140 %147 
					                read_only Texture2D %148 = OpLoad %58 
					                            sampler %149 = OpLoad %62 
					         read_only Texture2DSampled %150 = OpSampledImage %148 %149 
					                              f32_4 %151 = OpLoad %132 
					                              f32_2 %152 = OpVectorShuffle %151 %151 2 3 
					                              f32_4 %153 = OpImageSampleImplicitLod %150 %152 
					                              f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
					                                             OpStore %109 %154 
					                              f32_3 %155 = OpLoad %140 
					                              f32_3 %156 = OpLoad %140 
					                              f32_3 %157 = OpFMul %155 %156 
					                              f32_3 %158 = OpLoad %78 
					                              f32_3 %159 = OpFAdd %157 %158 
					                                             OpStore %78 %159 
					                              f32_3 %160 = OpLoad %94 
					                              f32_3 %161 = OpLoad %140 
					                              f32_3 %162 = OpFAdd %160 %161 
					                                             OpStore %94 %162 
					                              f32_4 %164 = OpLoad %9 
					                              f32_2 %165 = OpVectorShuffle %164 %164 0 1 
					                              f32_2 %166 = OpLoad %29 
					                              f32_2 %167 = OpFAdd %165 %166 
					                              f32_4 %168 = OpLoad %163 
					                              f32_4 %169 = OpVectorShuffle %168 %167 4 5 2 3 
					                                             OpStore %163 %169 
					                read_only Texture2D %170 = OpLoad %58 
					                            sampler %171 = OpLoad %62 
					         read_only Texture2DSampled %172 = OpSampledImage %170 %171 
					                              f32_4 %173 = OpLoad %163 
					                              f32_2 %174 = OpVectorShuffle %173 %173 0 1 
					                              f32_4 %175 = OpImageSampleImplicitLod %172 %174 
					                              f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
					                                             OpStore %140 %176 
					                              f32_3 %177 = OpLoad %140 
					                              f32_3 %178 = OpLoad %140 
					                              f32_3 %179 = OpFMul %177 %178 
					                              f32_3 %180 = OpLoad %78 
					                              f32_3 %181 = OpFAdd %179 %180 
					                                             OpStore %78 %181 
					                              f32_3 %182 = OpLoad %94 
					                              f32_3 %183 = OpLoad %140 
					                              f32_3 %184 = OpFAdd %182 %183 
					                                             OpStore %94 %184 
					                              f32_4 %185 = OpLoad %9 
					                              f32_4 %186 = OpVectorShuffle %185 %185 0 1 0 1 
					                              f32_4 %188 = OpFMul %186 %187 
					                              f32_2 %189 = OpLoad %29 
					                              f32_4 %190 = OpVectorShuffle %189 %189 0 1 0 1 
					                              f32_4 %191 = OpFAdd %188 %190 
					                                             OpStore %163 %191 
					                read_only Texture2D %193 = OpLoad %58 
					                            sampler %194 = OpLoad %62 
					         read_only Texture2DSampled %195 = OpSampledImage %193 %194 
					                              f32_4 %196 = OpLoad %163 
					                              f32_2 %197 = OpVectorShuffle %196 %196 0 1 
					                              f32_4 %198 = OpImageSampleImplicitLod %195 %197 
					                              f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
					                                             OpStore %192 %199 
					                read_only Texture2D %200 = OpLoad %58 
					                            sampler %201 = OpLoad %62 
					         read_only Texture2DSampled %202 = OpSampledImage %200 %201 
					                              f32_4 %203 = OpLoad %163 
					                              f32_2 %204 = OpVectorShuffle %203 %203 2 3 
					                              f32_4 %205 = OpImageSampleImplicitLod %202 %204 
					                              f32_3 %206 = OpVectorShuffle %205 %205 0 1 2 
					                                             OpStore %140 %206 
					                              f32_3 %207 = OpLoad %192 
					                              f32_3 %208 = OpLoad %192 
					                              f32_3 %209 = OpFMul %207 %208 
					                              f32_3 %210 = OpLoad %78 
					                              f32_3 %211 = OpFAdd %209 %210 
					                                             OpStore %78 %211 
					                              f32_3 %212 = OpLoad %94 
					                              f32_3 %213 = OpLoad %192 
					                              f32_3 %214 = OpFAdd %212 %213 
					                                             OpStore %94 %214 
					                              f32_4 %216 = OpLoad %9 
					                              f32_4 %217 = OpVectorShuffle %216 %216 0 1 0 1 
					                              f32_4 %219 = OpFMul %217 %218 
					                              f32_2 %220 = OpLoad %29 
					                              f32_4 %221 = OpVectorShuffle %220 %220 0 1 0 1 
					                              f32_4 %222 = OpFAdd %219 %221 
					                                             OpStore %215 %222 
					                read_only Texture2D %224 = OpLoad %58 
					                            sampler %225 = OpLoad %62 
					         read_only Texture2DSampled %226 = OpSampledImage %224 %225 
					                              f32_4 %227 = OpLoad %215 
					                              f32_2 %228 = OpVectorShuffle %227 %227 0 1 
					                              f32_4 %229 = OpImageSampleImplicitLod %226 %228 
					                              f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
					                                             OpStore %223 %230 
					                read_only Texture2D %231 = OpLoad %58 
					                            sampler %232 = OpLoad %62 
					         read_only Texture2DSampled %233 = OpSampledImage %231 %232 
					                              f32_4 %234 = OpLoad %215 
					                              f32_2 %235 = OpVectorShuffle %234 %234 2 3 
					                              f32_4 %236 = OpImageSampleImplicitLod %233 %235 
					                              f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
					                                             OpStore %192 %237 
					                              f32_3 %238 = OpLoad %223 
					                              f32_3 %239 = OpLoad %223 
					                              f32_3 %240 = OpFMul %238 %239 
					                              f32_3 %241 = OpLoad %78 
					                              f32_3 %242 = OpFAdd %240 %241 
					                                             OpStore %78 %242 
					                              f32_3 %243 = OpLoad %94 
					                              f32_3 %244 = OpLoad %223 
					                              f32_3 %245 = OpFAdd %243 %244 
					                                             OpStore %94 %245 
					                              f32_4 %247 = OpLoad %9 
					                              f32_2 %248 = OpVectorShuffle %247 %247 0 1 
					                              f32_2 %250 = OpFMul %248 %249 
					                              f32_2 %251 = OpLoad %29 
					                              f32_2 %252 = OpFAdd %250 %251 
					                              f32_3 %253 = OpLoad %246 
					                              f32_3 %254 = OpVectorShuffle %253 %252 3 4 2 
					                                             OpStore %246 %254 
					                read_only Texture2D %255 = OpLoad %58 
					                            sampler %256 = OpLoad %62 
					         read_only Texture2DSampled %257 = OpSampledImage %255 %256 
					                              f32_3 %258 = OpLoad %246 
					                              f32_2 %259 = OpVectorShuffle %258 %258 0 1 
					                              f32_4 %260 = OpImageSampleImplicitLod %257 %259 
					                              f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
					                                             OpStore %223 %261 
					                              f32_3 %262 = OpLoad %223 
					                              f32_3 %263 = OpLoad %223 
					                              f32_3 %264 = OpFMul %262 %263 
					                              f32_3 %265 = OpLoad %78 
					                              f32_3 %266 = OpFAdd %264 %265 
					                                             OpStore %78 %266 
					                              f32_3 %267 = OpLoad %94 
					                              f32_3 %268 = OpLoad %223 
					                              f32_3 %269 = OpFAdd %267 %268 
					                                             OpStore %94 %269 
					                              f32_4 %270 = OpLoad %9 
					                              f32_2 %271 = OpVectorShuffle %270 %270 0 1 
					                              f32_2 %273 = OpFMul %271 %272 
					                              f32_2 %274 = OpLoad %29 
					                              f32_2 %275 = OpFAdd %273 %274 
					                              f32_3 %276 = OpLoad %246 
					                              f32_3 %277 = OpVectorShuffle %276 %275 3 4 2 
					                                             OpStore %246 %277 
					                              f32_4 %278 = OpLoad %9 
					                              f32_4 %279 = OpVectorShuffle %278 %278 0 1 0 1 
					                              f32_4 %281 = OpFMul %279 %280 
					                              f32_2 %282 = OpLoad %29 
					                              f32_4 %283 = OpVectorShuffle %282 %282 0 1 0 1 
					                              f32_4 %284 = OpFAdd %281 %283 
					                                             OpStore %9 %284 
					                read_only Texture2D %285 = OpLoad %58 
					                            sampler %286 = OpLoad %62 
					         read_only Texture2DSampled %287 = OpSampledImage %285 %286 
					                              f32_3 %288 = OpLoad %246 
					                              f32_2 %289 = OpVectorShuffle %288 %288 0 1 
					                              f32_4 %290 = OpImageSampleImplicitLod %287 %289 
					                              f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
					                                             OpStore %223 %291 
					                              f32_3 %292 = OpLoad %223 
					                              f32_3 %293 = OpLoad %223 
					                              f32_3 %294 = OpFMul %292 %293 
					                              f32_3 %295 = OpLoad %78 
					                              f32_3 %296 = OpFAdd %294 %295 
					                                             OpStore %78 %296 
					                              f32_3 %297 = OpLoad %94 
					                              f32_3 %298 = OpLoad %223 
					                              f32_3 %299 = OpFAdd %297 %298 
					                                             OpStore %94 %299 
					                              f32_3 %301 = OpLoad %94 
					                              f32_3 %304 = OpFMul %301 %303 
					                              f32_4 %305 = OpLoad %300 
					                              f32_4 %306 = OpVectorShuffle %305 %304 4 5 6 3 
					                                             OpStore %300 %306 
					                              f32_4 %307 = OpLoad %300 
					                              f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
					                              f32_4 %309 = OpLoad %300 
					                              f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
					                              f32_3 %311 = OpFMul %308 %310 
					                                             OpStore %246 %311 
					                              f32_3 %313 = OpLoad %78 
					                              f32_3 %314 = OpFMul %313 %303 
					                              f32_3 %315 = OpLoad %246 
					                              f32_3 %316 = OpFNegate %315 
					                              f32_3 %317 = OpFAdd %314 %316 
					                              f32_4 %318 = OpLoad %312 
					                              f32_4 %319 = OpVectorShuffle %318 %317 4 5 6 3 
					                                             OpStore %312 %319 
					                       Private f32* %324 = OpAccessChain %312 %323 
					                                f32 %325 = OpLoad %324 
					                                f32 %326 = OpExtInst %1 4 %325 
					                       Private f32* %328 = OpAccessChain %312 %327 
					                                f32 %329 = OpLoad %328 
					                                f32 %330 = OpExtInst %1 4 %329 
					                                f32 %331 = OpFAdd %326 %330 
					                                             OpStore %321 %331 
					                       Private f32* %333 = OpAccessChain %312 %332 
					                                f32 %334 = OpLoad %333 
					                                f32 %335 = OpExtInst %1 4 %334 
					                                f32 %336 = OpLoad %321 
					                                f32 %337 = OpFAdd %335 %336 
					                                             OpStore %321 %337 
					                read_only Texture2D %339 = OpLoad %58 
					                            sampler %340 = OpLoad %62 
					         read_only Texture2DSampled %341 = OpSampledImage %339 %340 
					                              f32_4 %342 = OpLoad %9 
					                              f32_2 %343 = OpVectorShuffle %342 %342 0 1 
					                              f32_4 %344 = OpImageSampleImplicitLod %341 %343 
					                              f32_3 %345 = OpVectorShuffle %344 %344 0 1 2 
					                                             OpStore %338 %345 
					                read_only Texture2D %347 = OpLoad %58 
					                            sampler %348 = OpLoad %62 
					         read_only Texture2DSampled %349 = OpSampledImage %347 %348 
					                              f32_4 %350 = OpLoad %9 
					                              f32_2 %351 = OpVectorShuffle %350 %350 2 3 
					                              f32_4 %352 = OpImageSampleImplicitLod %349 %351 
					                              f32_3 %353 = OpVectorShuffle %352 %352 0 1 2 
					                                             OpStore %346 %353 
					                              f32_3 %355 = OpLoad %346 
					                              f32_3 %356 = OpLoad %346 
					                              f32_3 %357 = OpFMul %355 %356 
					                                             OpStore %354 %357 
					                              f32_3 %358 = OpLoad %338 
					                              f32_3 %359 = OpLoad %338 
					                              f32_3 %360 = OpFMul %358 %359 
					                              f32_3 %361 = OpLoad %354 
					                              f32_3 %362 = OpFAdd %360 %361 
					                                             OpStore %354 %362 
					                              f32_3 %363 = OpLoad %346 
					                              f32_3 %364 = OpLoad %338 
					                              f32_3 %365 = OpFAdd %363 %364 
					                                             OpStore %78 %365 
					                              f32_3 %366 = OpLoad %70 
					                              f32_3 %367 = OpLoad %78 
					                              f32_3 %368 = OpFAdd %366 %367 
					                                             OpStore %78 %368 
					                              f32_3 %370 = OpLoad %70 
					                              f32_3 %371 = OpLoad %70 
					                              f32_3 %372 = OpFMul %370 %371 
					                              f32_3 %373 = OpLoad %354 
					                              f32_3 %374 = OpFAdd %372 %373 
					                                             OpStore %369 %374 
					                              f32_3 %375 = OpLoad %82 
					                              f32_3 %376 = OpLoad %82 
					                              f32_3 %377 = OpFMul %375 %376 
					                              f32_3 %378 = OpLoad %369 
					                              f32_3 %379 = OpFAdd %377 %378 
					                                             OpStore %369 %379 
					                              f32_3 %380 = OpLoad %82 
					                              f32_3 %381 = OpLoad %78 
					                              f32_3 %382 = OpFAdd %380 %381 
					                                             OpStore %78 %382 
					                              f32_3 %383 = OpLoad %346 
					                              f32_3 %384 = OpLoad %78 
					                              f32_3 %385 = OpFAdd %383 %384 
					                                             OpStore %78 %385 
					                              f32_3 %387 = OpLoad %346 
					                              f32_3 %388 = OpLoad %346 
					                              f32_3 %389 = OpFMul %387 %388 
					                              f32_3 %390 = OpLoad %369 
					                              f32_3 %391 = OpFAdd %389 %390 
					                                             OpStore %386 %391 
					                              f32_3 %392 = OpLoad %109 
					                              f32_3 %393 = OpLoad %109 
					                              f32_3 %394 = OpFMul %392 %393 
					                              f32_3 %395 = OpLoad %386 
					                              f32_3 %396 = OpFAdd %394 %395 
					                                             OpStore %386 %396 
					                              f32_3 %397 = OpLoad %140 
					                              f32_3 %398 = OpLoad %140 
					                              f32_3 %399 = OpFMul %397 %398 
					                              f32_3 %400 = OpLoad %386 
					                              f32_3 %401 = OpFAdd %399 %400 
					                                             OpStore %386 %401 
					                              f32_3 %402 = OpLoad %192 
					                              f32_3 %403 = OpLoad %192 
					                              f32_3 %404 = OpFMul %402 %403 
					                              f32_3 %405 = OpLoad %386 
					                              f32_3 %406 = OpFAdd %404 %405 
					                                             OpStore %386 %406 
					                              f32_3 %407 = OpLoad %109 
					                              f32_3 %408 = OpLoad %109 
					                              f32_3 %409 = OpFMul %407 %408 
					                              f32_3 %410 = OpLoad %386 
					                              f32_3 %411 = OpFAdd %409 %410 
					                                             OpStore %386 %411 
					                              f32_3 %412 = OpLoad %109 
					                              f32_3 %413 = OpLoad %78 
					                              f32_3 %414 = OpFAdd %412 %413 
					                                             OpStore %369 %414 
					                              f32_3 %415 = OpLoad %140 
					                              f32_3 %416 = OpLoad %369 
					                              f32_3 %417 = OpFAdd %415 %416 
					                                             OpStore %369 %417 
					                              f32_3 %418 = OpLoad %192 
					                              f32_3 %419 = OpLoad %369 
					                              f32_3 %420 = OpFAdd %418 %419 
					                                             OpStore %369 %420 
					                              f32_3 %421 = OpLoad %109 
					                              f32_3 %422 = OpLoad %369 
					                              f32_3 %423 = OpFAdd %421 %422 
					                                             OpStore %369 %423 
					                              f32_3 %424 = OpLoad %369 
					                              f32_3 %425 = OpFMul %424 %303 
					                              f32_4 %426 = OpLoad %312 
					                              f32_4 %427 = OpVectorShuffle %426 %425 4 5 6 3 
					                                             OpStore %312 %427 
					                              f32_4 %428 = OpLoad %312 
					                              f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
					                              f32_4 %430 = OpLoad %312 
					                              f32_3 %431 = OpVectorShuffle %430 %430 0 1 2 
					                              f32_3 %432 = OpFMul %429 %431 
					                              f32_4 %433 = OpLoad %42 
					                              f32_4 %434 = OpVectorShuffle %433 %432 4 5 6 3 
					                                             OpStore %42 %434 
					                              f32_3 %435 = OpLoad %386 
					                              f32_3 %436 = OpFMul %435 %303 
					                              f32_4 %437 = OpLoad %42 
					                              f32_3 %438 = OpVectorShuffle %437 %437 0 1 2 
					                              f32_3 %439 = OpFNegate %438 
					                              f32_3 %440 = OpFAdd %436 %439 
					                              f32_4 %441 = OpLoad %9 
					                              f32_4 %442 = OpVectorShuffle %441 %440 4 5 6 3 
					                                             OpStore %9 %442 
					                       Private f32* %443 = OpAccessChain %9 %323 
					                                f32 %444 = OpLoad %443 
					                                f32 %445 = OpExtInst %1 4 %444 
					                       Private f32* %446 = OpAccessChain %9 %327 
					                                f32 %447 = OpLoad %446 
					                                f32 %448 = OpExtInst %1 4 %447 
					                                f32 %449 = OpFAdd %445 %448 
					                       Private f32* %450 = OpAccessChain %9 %327 
					                                             OpStore %450 %449 
					                       Private f32* %451 = OpAccessChain %9 %332 
					                                f32 %452 = OpLoad %451 
					                                f32 %453 = OpExtInst %1 4 %452 
					                       Private f32* %454 = OpAccessChain %9 %327 
					                                f32 %455 = OpLoad %454 
					                                f32 %456 = OpFAdd %453 %455 
					                       Private f32* %457 = OpAccessChain %9 %327 
					                                             OpStore %457 %456 
					                       Private f32* %459 = OpAccessChain %9 %327 
					                                f32 %460 = OpLoad %459 
					                                f32 %462 = OpExtInst %1 37 %460 %461 
					                                             OpStore %458 %462 
					                       Private f32* %466 = OpAccessChain %9 %327 
					                                f32 %467 = OpLoad %466 
					                               bool %468 = OpFOrdLessThan %467 %461 
					                                             OpStore %465 %468 
					                                f32 %470 = OpLoad %321 
					                                f32 %471 = OpLoad %458 
					                               bool %472 = OpFOrdLessThan %470 %471 
					                                             OpStore %469 %472 
					                       Private f32* %474 = OpAccessChain %312 %473 
					                                             OpStore %474 %45 
					                              f32_4 %476 = OpLoad %312 
					                               bool %477 = OpLoad %465 
					                             bool_4 %479 = OpCompositeConstruct %477 %477 %477 %477 
					                              f32_4 %481 = OpSelect %479 %480 %475 
					                              f32_4 %482 = OpExtInst %1 46 %475 %476 %481 
					                                             OpStore %42 %482 
					                       Private f32* %483 = OpAccessChain %300 %473 
					                                             OpStore %483 %45 
					                               bool %486 = OpLoad %469 
					                              f32_4 %487 = OpLoad %300 
					                              f32_4 %488 = OpLoad %42 
					                             bool_4 %489 = OpCompositeConstruct %486 %486 %486 %486 
					                              f32_4 %490 = OpSelect %489 %487 %488 
					                                             OpStore %485 %490 
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
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
						float _Value;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					vec3 u_xlat8;
					vec3 u_xlat16_8;
					vec4 u_xlat10_8;
					float u_xlat9;
					bool u_xlatb9;
					vec2 u_xlat18;
					float u_xlat28;
					void main()
					{
					    u_xlat0.xy = vec2(_Value) / _ScreenResolution.xy;
					    u_xlat18.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy * vec4(1.0, 0.0, -2.0, -2.0) + u_xlat18.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
					    u_xlat10_4 = texture(_MainTex, u_xlat18.xy);
					    u_xlat16_3.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat10_2.xyz + u_xlat10_4.xyz;
					    u_xlat4 = u_xlat0.xyxy * vec4(2.0, 0.0, -4.0, -3.0) + u_xlat18.xyxy;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_3.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_5.xyz;
					    u_xlat5 = u_xlat0.xyxy * vec4(0.0, 1.0, -2.0, -3.0) + u_xlat18.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_3.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_6.xyz;
					    u_xlat6.xy = u_xlat0.xy + u_xlat18.xy;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_3.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_6.xyz;
					    u_xlat6 = u_xlat0.xyxy * vec4(2.0, 1.0, -4.0, -2.0) + u_xlat18.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_3.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_7.xyz;
					    u_xlat7 = u_xlat0.xyxy * vec4(0.0, 2.0, -3.0, -2.0) + u_xlat18.xyxy;
					    u_xlat10_8 = texture(_MainTex, u_xlat7.xy);
					    u_xlat10_7 = texture(_MainTex, u_xlat7.zw);
					    u_xlat16_3.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_8.xyz;
					    u_xlat8.xy = u_xlat0.xy * vec2(1.0, 2.0) + u_xlat18.xy;
					    u_xlat10_8 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_3.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_8.xyz;
					    u_xlat8.xy = u_xlat0.xy * vec2(2.0, 2.0) + u_xlat18.xy;
					    u_xlat0 = u_xlat0.xyxy * vec4(-4.0, -4.0, -3.0, -3.0) + u_xlat18.xyxy;
					    u_xlat10_8 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_3.xyz = u_xlat10_8.xyz * u_xlat10_8.xyz + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat10_8.xyz;
					    u_xlat2.xyz = u_xlat16_2.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat8.xyz = u_xlat2.xyz * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat16_3.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat8.xyz);
					    u_xlat28 = abs(u_xlat3.y) + abs(u_xlat3.x);
					    u_xlat28 = abs(u_xlat3.z) + u_xlat28;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_8.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
					    u_xlat16_8.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz + u_xlat16_8.xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_1.xyz + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz + u_xlat16_8.xyz;
					    u_xlat16_1.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz + u_xlat16_1.xyz;
					    u_xlat16_3.xyz = u_xlat10_4.xyz + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat16_3.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz + u_xlat16_1.xyz;
					    u_xlat16_0.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_6.xyz * u_xlat10_6.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_7.xyz * u_xlat10_7.xyz + u_xlat16_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz + u_xlat16_0.xyz;
					    u_xlat16_1.xyz = u_xlat10_5.xyz + u_xlat16_3.xyz;
					    u_xlat16_1.xyz = u_xlat10_6.xyz + u_xlat16_1.xyz;
					    u_xlat16_1.xyz = u_xlat10_7.xyz + u_xlat16_1.xyz;
					    u_xlat16_1.xyz = u_xlat10_5.xyz + u_xlat16_1.xyz;
					    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					    u_xlat1.xyz = u_xlat3.xyz * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + (-u_xlat1.xyz);
					    u_xlat0.x = abs(u_xlat0.y) + abs(u_xlat0.x);
					    u_xlat0.x = abs(u_xlat0.z) + u_xlat0.x;
					    u_xlat9 = min(u_xlat0.x, 100.0);
					    u_xlatb0 = u_xlat0.x<100.0;
					    u_xlatb9 = u_xlat28<u_xlat9;
					    u_xlat3.w = 1.0;
					    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3, vec4(bvec4(u_xlatb0)));
					    u_xlat2.w = 1.0;
					    SV_Target0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat1;
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