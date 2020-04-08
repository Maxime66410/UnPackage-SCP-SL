Shader "CameraFilterPack/Drawing_Toon" {
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
			GpuProgramID 22908
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
					uniform 	float _Distortion;
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
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bvec4 u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					float u_xlat16_6;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat15;
					float u_xlat16_15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat0.x;
					    u_xlat1.yzw = vec3(_DotSize) * vec3(0.001953125, 0.001953125, 0.001953125) + u_xlat0.yxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_10 = dot(u_xlat10_3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_15 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat2.w = _DotSize * 0.001953125 + u_xlat0.y;
					    u_xlat2.xz = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + u_xlat1.xx;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_6 = dot(u_xlat10_3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_15 = u_xlat16_15 * 2.0 + u_xlat16_6;
					    u_xlat16_15 = u_xlat16_10 + u_xlat16_15;
					    u_xlat3.xyw = (-vec3(_DotSize)) * vec3(0.001953125, 0.001953125, 0.001953125) + u_xlat0.xyy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_11 = dot(u_xlat10_4, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_15 = u_xlat16_15 + (-u_xlat16_11);
					    u_xlat16_15 = (-u_xlat16_11) * 2.0 + u_xlat16_15;
					    u_xlat3.z = _DotSize * 0.001953125 + u_xlat1.x;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = dot(u_xlat10_3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_15 = u_xlat16_15 + (-u_xlat16_1);
					    u_xlat16_10 = u_xlat16_10 + u_xlat16_1;
					    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
					    u_xlat2.y = u_xlat0.y;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_0 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_5.x = u_xlat16_0 * 2.0 + u_xlat16_10;
					    u_xlat16_5.x = (-u_xlat16_11) + u_xlat16_5.x;
					    u_xlat16_0 = (-u_xlat16_0) * 2.0 + u_xlat16_5.x;
					    u_xlat16_0 = (-u_xlat16_6) + u_xlat16_0;
					    u_xlat0.x = u_xlat16_0 * u_xlat16_0 + u_xlat16_15;
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat16_5.x = dot(u_xlat10_3, u_xlat10_3);
					    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
					    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat10_3.xyz;
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.649999976, 0.649999976, 0.649999976);
					    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
					    u_xlat5.xyz = u_xlat16_5.xyz * vec3(5.0, 5.0, 5.0);
					    u_xlat5.xyz = floor(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.53846157, 1.53846157, 1.53846157);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat0.xyz = u_xlat5.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion)) + u_xlat0.xxx;
					    u_xlat15 = u_xlat0.z + u_xlat0.x;
					    u_xlat15 = u_xlat15 * 12.8000002;
					    u_xlatb15 = u_xlat15<u_xlat0.y;
					    u_xlat0.xyz = (bool(u_xlatb15)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat1 = u_xlat0.xxxx * vec4(0.899999976, 0.699999988, 0.5, 0.75);
					    u_xlat0.yzw = u_xlat0.xxx * vec3(0.25, 0.5, 0.899999976);
					    u_xlatb2 = lessThan(vec4(0.949999988, 0.75, 0.5, 0.25), u_xlat0.xxxx);
					    u_xlat5.xy = (u_xlatb2.w) ? u_xlat1.zw : u_xlat0.yz;
					    u_xlat5.xy = (u_xlatb2.z) ? u_xlat1.yx : u_xlat5.xy;
					    u_xlat5.xy = (u_xlatb2.y) ? u_xlat0.wx : u_xlat5.xy;
					    SV_Target0.xy = (u_xlatb2.x) ? u_xlat0.xx : u_xlat5.xy;
					    SV_Target0.z = u_xlat0.x;
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
					; Bound: 418
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %397 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
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
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %54 DescriptorSet 54 
					                                             OpDecorate %54 Binding 54 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %58 DescriptorSet 58 
					                                             OpDecorate %58 Binding 58 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %159 RelaxedPrecision 
					                                             OpDecorate %160 RelaxedPrecision 
					                                             OpDecorate %165 RelaxedPrecision 
					                                             OpDecorate %166 RelaxedPrecision 
					                                             OpDecorate %167 RelaxedPrecision 
					                                             OpDecorate %168 RelaxedPrecision 
					                                             OpDecorate %169 RelaxedPrecision 
					                                             OpDecorate %170 RelaxedPrecision 
					                                             OpDecorate %171 RelaxedPrecision 
					                                             OpDecorate %172 RelaxedPrecision 
					                                             OpDecorate %173 RelaxedPrecision 
					                                             OpDecorate %174 RelaxedPrecision 
					                                             OpDecorate %175 RelaxedPrecision 
					                                             OpDecorate %176 RelaxedPrecision 
					                                             OpDecorate %177 RelaxedPrecision 
					                                             OpDecorate %181 RelaxedPrecision 
					                                             OpDecorate %182 RelaxedPrecision 
					                                             OpDecorate %187 RelaxedPrecision 
					                                             OpDecorate %188 RelaxedPrecision 
					                                             OpDecorate %193 RelaxedPrecision 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %195 RelaxedPrecision 
					                                             OpDecorate %197 RelaxedPrecision 
					                                             OpDecorate %198 RelaxedPrecision 
					                                             OpDecorate %199 RelaxedPrecision 
					                                             OpDecorate %200 RelaxedPrecision 
					                                             OpDecorate %201 RelaxedPrecision 
					                                             OpDecorate %203 RelaxedPrecision 
					                                             OpDecorate %204 RelaxedPrecision 
					                                             OpDecorate %206 RelaxedPrecision 
					                                             OpDecorate %207 RelaxedPrecision 
					                                             OpDecorate %209 RelaxedPrecision 
					                                             OpDecorate %210 RelaxedPrecision 
					                                             OpDecorate %211 RelaxedPrecision 
					                                             OpDecorate %213 RelaxedPrecision 
					                                             OpDecorate %214 RelaxedPrecision 
					                                             OpDecorate %215 RelaxedPrecision 
					                                             OpDecorate %216 RelaxedPrecision 
					                                             OpDecorate %217 RelaxedPrecision 
					                                             OpDecorate %218 RelaxedPrecision 
					                                             OpDecorate %219 RelaxedPrecision 
					                                             OpDecorate %220 RelaxedPrecision 
					                                             OpDecorate %221 RelaxedPrecision 
					                                             OpDecorate %222 RelaxedPrecision 
					                                             OpDecorate %223 RelaxedPrecision 
					                                             OpDecorate %237 RelaxedPrecision 
					                                             OpDecorate %238 RelaxedPrecision 
					                                             OpDecorate %239 RelaxedPrecision 
					                                             OpDecorate %242 RelaxedPrecision 
					                                             OpDecorate %243 RelaxedPrecision 
					                                             OpDecorate %245 RelaxedPrecision 
					                                             OpDecorate %246 RelaxedPrecision 
					                                             OpDecorate %247 RelaxedPrecision 
					                                             OpDecorate %248 RelaxedPrecision 
					                                             OpDecorate %249 RelaxedPrecision 
					                                             OpDecorate %250 RelaxedPrecision 
					                                             OpDecorate %253 RelaxedPrecision 
					                                             OpDecorate %254 RelaxedPrecision 
					                                             OpDecorate %255 RelaxedPrecision 
					                                             OpDecorate %256 RelaxedPrecision 
					                                             OpDecorate %259 RelaxedPrecision 
					                                             OpDecorate %260 RelaxedPrecision 
					                                             OpDecorate %261 RelaxedPrecision 
					                                             OpDecorate %263 RelaxedPrecision 
					                                             OpDecorate %266 RelaxedPrecision 
					                                             OpDecorate %397 Location 397 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %14 = OpTypeStruct %6 %6 %7 
					                                     %15 = OpTypePointer Uniform %14 
					  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 2 
					                                     %19 = OpTypePointer Uniform %7 
					                      Private f32_4* %30 = OpVariable Private 
					                                     %31 = OpTypeInt 32 0 
					                                 u32 %32 = OpConstant 0 
					                                     %33 = OpTypePointer Private %6 
					                                 i32 %37 = OpConstant 1 
					                                     %38 = OpTypePointer Uniform %6 
					                                     %41 = OpTypeVector %6 3 
					                                 f32 %43 = OpConstant 3,674022E-40 
					                               f32_3 %44 = OpConstantComposite %43 %43 %43 
					                      Private f32_4* %51 = OpVariable Private 
					                                     %52 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %53 = OpTypePointer UniformConstant %52 
					UniformConstant read_only Texture2D* %54 = OpVariable UniformConstant 
					                                     %56 = OpTypeSampler 
					                                     %57 = OpTypePointer UniformConstant %56 
					            UniformConstant sampler* %58 = OpVariable UniformConstant 
					                                     %60 = OpTypeSampledImage %52 
					                      Private f32_4* %65 = OpVariable Private 
					                        Private f32* %72 = OpVariable Private 
					                                 f32 %74 = OpConstant 3,674022E-40 
					                                 f32 %75 = OpConstant 3,674022E-40 
					                                 f32 %76 = OpConstant 3,674022E-40 
					                                 f32 %77 = OpConstant 3,674022E-40 
					                               f32_4 %78 = OpConstantComposite %74 %75 %76 %77 
					                        Private f32* %80 = OpVariable Private 
					                      Private f32_4* %83 = OpVariable Private 
					                                 u32 %87 = OpConstant 1 
					                                 u32 %91 = OpConstant 3 
					                               f32_2 %97 = OpConstantComposite %43 %43 
					                       Private f32* %110 = OpVariable Private 
					                                f32 %114 = OpConstant 3,674022E-40 
					                     Private f32_4* %121 = OpVariable Private 
					                     Private f32_4* %132 = OpVariable Private 
					                       Private f32* %139 = OpVariable Private 
					                                u32 %157 = OpConstant 2 
					                       Private f32* %165 = OpVariable Private 
					                       Private f32* %193 = OpVariable Private 
					                                    %196 = OpTypePointer Private %41 
					                     Private f32_3* %197 = OpVariable Private 
					                                    %225 = OpTypeBool 
					                                    %226 = OpTypePointer Private %225 
					                      Private bool* %227 = OpVariable Private 
					                                f32 %228 = OpConstant 3,674022E-40 
					                                f32 %233 = OpConstant 3,674022E-40 
					                                f32 %234 = OpConstant 3,674022E-40 
					                                f32 %251 = OpConstant 3,674022E-40 
					                              f32_3 %252 = OpConstantComposite %251 %251 %251 
					                                f32 %257 = OpConstant 3,674022E-40 
					                              f32_3 %258 = OpConstantComposite %257 %257 %257 
					                     Private f32_3* %262 = OpVariable Private 
					                                f32 %264 = OpConstant 3,674022E-40 
					                              f32_3 %265 = OpConstantComposite %264 %264 %264 
					                                f32 %270 = OpConstant 3,674022E-40 
					                              f32_3 %271 = OpConstantComposite %270 %270 %270 
					                                f32 %276 = OpConstant 3,674022E-40 
					                              f32_3 %277 = OpConstantComposite %276 %276 %276 
					                                i32 %282 = OpConstant 0 
					                       Private f32* %300 = OpVariable Private 
					                                f32 %307 = OpConstant 3,674022E-40 
					                      Private bool* %309 = OpVariable Private 
					                                    %315 = OpTypePointer Function %41 
					                              f32_3 %319 = OpConstantComposite %234 %234 %234 
					                                f32 %328 = OpConstant 3,674022E-40 
					                                f32 %329 = OpConstant 3,674022E-40 
					                                f32 %330 = OpConstant 3,674022E-40 
					                              f32_3 %331 = OpConstantComposite %328 %329 %330 
					                                f32 %336 = OpConstant 3,674022E-40 
					                                f32 %337 = OpConstant 3,674022E-40 
					                                f32 %338 = OpConstant 3,674022E-40 
					                                f32 %339 = OpConstant 3,674022E-40 
					                              f32_4 %340 = OpConstantComposite %336 %337 %338 %339 
					                              f32_3 %344 = OpConstantComposite %77 %338 %336 
					                                    %348 = OpTypeVector %225 4 
					                                    %349 = OpTypePointer Private %348 
					                    Private bool_4* %350 = OpVariable Private 
					                                f32 %351 = OpConstant 3,674022E-40 
					                              f32_4 %352 = OpConstantComposite %351 %339 %338 %77 
					                                    %358 = OpTypePointer Function %10 
					                                    %396 = OpTypePointer Output %7 
					                      Output f32_4* %397 = OpVariable Output 
					                                    %413 = OpTypePointer Output %6 
					                                f32 %415 = OpConstant 3,674022E-40 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                    Function f32_3* %316 = OpVariable Function 
					                    Function f32_2* %359 = OpVariable Function 
					                    Function f32_2* %372 = OpVariable Function 
					                    Function f32_2* %385 = OpVariable Function 
					                    Function f32_2* %400 = OpVariable Function 
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
					                        Private f32* %34 = OpAccessChain %9 %32 
					                                 f32 %35 = OpLoad %34 
					                        Private f32* %36 = OpAccessChain %30 %32 
					                                             OpStore %36 %35 
					                        Uniform f32* %39 = OpAccessChain %16 %37 
					                                 f32 %40 = OpLoad %39 
					                               f32_3 %42 = OpCompositeConstruct %40 %40 %40 
					                               f32_3 %45 = OpFMul %42 %44 
					                               f32_4 %46 = OpLoad %9 
					                               f32_3 %47 = OpVectorShuffle %46 %46 1 0 1 
					                               f32_3 %48 = OpFAdd %45 %47 
					                               f32_4 %49 = OpLoad %30 
					                               f32_4 %50 = OpVectorShuffle %49 %48 0 4 5 6 
					                                             OpStore %30 %50 
					                 read_only Texture2D %55 = OpLoad %54 
					                             sampler %59 = OpLoad %58 
					          read_only Texture2DSampled %61 = OpSampledImage %55 %59 
					                               f32_4 %62 = OpLoad %30 
					                               f32_2 %63 = OpVectorShuffle %62 %62 0 1 
					                               f32_4 %64 = OpImageSampleImplicitLod %61 %63 
					                                             OpStore %51 %64 
					                 read_only Texture2D %66 = OpLoad %54 
					                             sampler %67 = OpLoad %58 
					          read_only Texture2DSampled %68 = OpSampledImage %66 %67 
					                               f32_4 %69 = OpLoad %30 
					                               f32_2 %70 = OpVectorShuffle %69 %69 2 3 
					                               f32_4 %71 = OpImageSampleImplicitLod %68 %70 
					                                             OpStore %65 %71 
					                               f32_4 %73 = OpLoad %65 
					                                 f32 %79 = OpDot %73 %78 
					                                             OpStore %72 %79 
					                               f32_4 %81 = OpLoad %51 
					                                 f32 %82 = OpDot %81 %78 
					                                             OpStore %80 %82 
					                        Uniform f32* %84 = OpAccessChain %16 %37 
					                                 f32 %85 = OpLoad %84 
					                                 f32 %86 = OpFMul %85 %43 
					                        Private f32* %88 = OpAccessChain %9 %87 
					                                 f32 %89 = OpLoad %88 
					                                 f32 %90 = OpFAdd %86 %89 
					                        Private f32* %92 = OpAccessChain %83 %91 
					                                             OpStore %92 %90 
					                        Uniform f32* %93 = OpAccessChain %16 %37 
					                                 f32 %94 = OpLoad %93 
					                               f32_2 %95 = OpCompositeConstruct %94 %94 
					                               f32_2 %96 = OpFNegate %95 
					                               f32_2 %98 = OpFMul %96 %97 
					                               f32_4 %99 = OpLoad %30 
					                              f32_2 %100 = OpVectorShuffle %99 %99 0 0 
					                              f32_2 %101 = OpFAdd %98 %100 
					                              f32_4 %102 = OpLoad %83 
					                              f32_4 %103 = OpVectorShuffle %102 %101 4 1 5 3 
					                                             OpStore %83 %103 
					                read_only Texture2D %104 = OpLoad %54 
					                            sampler %105 = OpLoad %58 
					         read_only Texture2DSampled %106 = OpSampledImage %104 %105 
					                              f32_4 %107 = OpLoad %83 
					                              f32_2 %108 = OpVectorShuffle %107 %107 2 3 
					                              f32_4 %109 = OpImageSampleImplicitLod %106 %108 
					                                             OpStore %65 %109 
					                              f32_4 %111 = OpLoad %65 
					                                f32 %112 = OpDot %111 %78 
					                                             OpStore %110 %112 
					                                f32 %113 = OpLoad %80 
					                                f32 %115 = OpFMul %113 %114 
					                                f32 %116 = OpLoad %110 
					                                f32 %117 = OpFAdd %115 %116 
					                                             OpStore %80 %117 
					                                f32 %118 = OpLoad %72 
					                                f32 %119 = OpLoad %80 
					                                f32 %120 = OpFAdd %118 %119 
					                                             OpStore %80 %120 
					                       Uniform f32* %122 = OpAccessChain %16 %37 
					                                f32 %123 = OpLoad %122 
					                              f32_3 %124 = OpCompositeConstruct %123 %123 %123 
					                              f32_3 %125 = OpFNegate %124 
					                              f32_3 %126 = OpFMul %125 %44 
					                              f32_4 %127 = OpLoad %9 
					                              f32_3 %128 = OpVectorShuffle %127 %127 0 1 1 
					                              f32_3 %129 = OpFAdd %126 %128 
					                              f32_4 %130 = OpLoad %121 
					                              f32_4 %131 = OpVectorShuffle %130 %129 4 5 2 6 
					                                             OpStore %121 %131 
					                read_only Texture2D %133 = OpLoad %54 
					                            sampler %134 = OpLoad %58 
					         read_only Texture2DSampled %135 = OpSampledImage %133 %134 
					                              f32_4 %136 = OpLoad %121 
					                              f32_2 %137 = OpVectorShuffle %136 %136 0 1 
					                              f32_4 %138 = OpImageSampleImplicitLod %135 %137 
					                                             OpStore %132 %138 
					                              f32_4 %140 = OpLoad %132 
					                                f32 %141 = OpDot %140 %78 
					                                             OpStore %139 %141 
					                                f32 %142 = OpLoad %80 
					                                f32 %143 = OpLoad %139 
					                                f32 %144 = OpFNegate %143 
					                                f32 %145 = OpFAdd %142 %144 
					                                             OpStore %80 %145 
					                                f32 %146 = OpLoad %139 
					                                f32 %147 = OpFNegate %146 
					                                f32 %148 = OpFMul %147 %114 
					                                f32 %149 = OpLoad %80 
					                                f32 %150 = OpFAdd %148 %149 
					                                             OpStore %80 %150 
					                       Uniform f32* %151 = OpAccessChain %16 %37 
					                                f32 %152 = OpLoad %151 
					                                f32 %153 = OpFMul %152 %43 
					                       Private f32* %154 = OpAccessChain %30 %32 
					                                f32 %155 = OpLoad %154 
					                                f32 %156 = OpFAdd %153 %155 
					                       Private f32* %158 = OpAccessChain %121 %157 
					                                             OpStore %158 %156 
					                read_only Texture2D %159 = OpLoad %54 
					                            sampler %160 = OpLoad %58 
					         read_only Texture2DSampled %161 = OpSampledImage %159 %160 
					                              f32_4 %162 = OpLoad %121 
					                              f32_2 %163 = OpVectorShuffle %162 %162 2 3 
					                              f32_4 %164 = OpImageSampleImplicitLod %161 %163 
					                                             OpStore %65 %164 
					                              f32_4 %166 = OpLoad %65 
					                                f32 %167 = OpDot %166 %78 
					                                             OpStore %165 %167 
					                                f32 %168 = OpLoad %80 
					                                f32 %169 = OpLoad %165 
					                                f32 %170 = OpFNegate %169 
					                                f32 %171 = OpFAdd %168 %170 
					                                             OpStore %80 %171 
					                                f32 %172 = OpLoad %72 
					                                f32 %173 = OpLoad %165 
					                                f32 %174 = OpFAdd %172 %173 
					                                             OpStore %72 %174 
					                                f32 %175 = OpLoad %80 
					                                f32 %176 = OpLoad %80 
					                                f32 %177 = OpFMul %175 %176 
					                                             OpStore %80 %177 
					                       Private f32* %178 = OpAccessChain %9 %87 
					                                f32 %179 = OpLoad %178 
					                       Private f32* %180 = OpAccessChain %83 %87 
					                                             OpStore %180 %179 
					                read_only Texture2D %181 = OpLoad %54 
					                            sampler %182 = OpLoad %58 
					         read_only Texture2DSampled %183 = OpSampledImage %181 %182 
					                              f32_4 %184 = OpLoad %9 
					                              f32_2 %185 = OpVectorShuffle %184 %184 0 1 
					                              f32_4 %186 = OpImageSampleImplicitLod %183 %185 
					                                             OpStore %65 %186 
					                read_only Texture2D %187 = OpLoad %54 
					                            sampler %188 = OpLoad %58 
					         read_only Texture2DSampled %189 = OpSampledImage %187 %188 
					                              f32_4 %190 = OpLoad %83 
					                              f32_2 %191 = OpVectorShuffle %190 %190 0 1 
					                              f32_4 %192 = OpImageSampleImplicitLod %189 %191 
					                                             OpStore %51 %192 
					                              f32_4 %194 = OpLoad %51 
					                                f32 %195 = OpDot %194 %78 
					                                             OpStore %193 %195 
					                                f32 %198 = OpLoad %193 
					                                f32 %199 = OpFMul %198 %114 
					                                f32 %200 = OpLoad %72 
					                                f32 %201 = OpFAdd %199 %200 
					                       Private f32* %202 = OpAccessChain %197 %32 
					                                             OpStore %202 %201 
					                                f32 %203 = OpLoad %139 
					                                f32 %204 = OpFNegate %203 
					                       Private f32* %205 = OpAccessChain %197 %32 
					                                f32 %206 = OpLoad %205 
					                                f32 %207 = OpFAdd %204 %206 
					                       Private f32* %208 = OpAccessChain %197 %32 
					                                             OpStore %208 %207 
					                                f32 %209 = OpLoad %193 
					                                f32 %210 = OpFNegate %209 
					                                f32 %211 = OpFMul %210 %114 
					                       Private f32* %212 = OpAccessChain %197 %32 
					                                f32 %213 = OpLoad %212 
					                                f32 %214 = OpFAdd %211 %213 
					                                             OpStore %193 %214 
					                                f32 %215 = OpLoad %110 
					                                f32 %216 = OpFNegate %215 
					                                f32 %217 = OpLoad %193 
					                                f32 %218 = OpFAdd %216 %217 
					                                             OpStore %193 %218 
					                                f32 %219 = OpLoad %193 
					                                f32 %220 = OpLoad %193 
					                                f32 %221 = OpFMul %219 %220 
					                                f32 %222 = OpLoad %80 
					                                f32 %223 = OpFAdd %221 %222 
					                       Private f32* %224 = OpAccessChain %9 %32 
					                                             OpStore %224 %223 
					                       Private f32* %229 = OpAccessChain %9 %32 
					                                f32 %230 = OpLoad %229 
					                               bool %231 = OpFOrdLessThan %228 %230 
					                                             OpStore %227 %231 
					                               bool %232 = OpLoad %227 
					                                f32 %235 = OpSelect %232 %233 %234 
					                       Private f32* %236 = OpAccessChain %9 %32 
					                                             OpStore %236 %235 
					                              f32_4 %237 = OpLoad %65 
					                              f32_4 %238 = OpLoad %65 
					                                f32 %239 = OpDot %237 %238 
					                       Private f32* %240 = OpAccessChain %197 %32 
					                                             OpStore %240 %239 
					                       Private f32* %241 = OpAccessChain %197 %32 
					                                f32 %242 = OpLoad %241 
					                                f32 %243 = OpExtInst %1 32 %242 
					                       Private f32* %244 = OpAccessChain %197 %32 
					                                             OpStore %244 %243 
					                              f32_3 %245 = OpLoad %197 
					                              f32_3 %246 = OpVectorShuffle %245 %245 0 0 0 
					                              f32_4 %247 = OpLoad %65 
					                              f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
					                              f32_3 %249 = OpFMul %246 %248 
					                                             OpStore %197 %249 
					                              f32_3 %250 = OpLoad %197 
					                              f32_3 %253 = OpFMul %250 %252 
					                                             OpStore %197 %253 
					                              f32_3 %254 = OpLoad %197 
					                              f32_3 %255 = OpExtInst %1 30 %254 
					                                             OpStore %197 %255 
					                              f32_3 %256 = OpLoad %197 
					                              f32_3 %259 = OpFMul %256 %258 
					                                             OpStore %197 %259 
					                              f32_3 %260 = OpLoad %197 
					                              f32_3 %261 = OpExtInst %1 29 %260 
					                                             OpStore %197 %261 
					                              f32_3 %263 = OpLoad %197 
					                              f32_3 %266 = OpFMul %263 %265 
					                                             OpStore %262 %266 
					                              f32_3 %267 = OpLoad %262 
					                              f32_3 %268 = OpExtInst %1 8 %267 
					                                             OpStore %262 %268 
					                              f32_3 %269 = OpLoad %262 
					                              f32_3 %272 = OpFMul %269 %271 
					                                             OpStore %262 %272 
					                              f32_3 %273 = OpLoad %262 
					                              f32_3 %274 = OpExtInst %1 30 %273 
					                                             OpStore %262 %274 
					                              f32_3 %275 = OpLoad %262 
					                              f32_3 %278 = OpFMul %275 %277 
					                                             OpStore %262 %278 
					                              f32_3 %279 = OpLoad %262 
					                              f32_3 %280 = OpExtInst %1 29 %279 
					                                             OpStore %262 %280 
					                              f32_3 %281 = OpLoad %262 
					                       Uniform f32* %283 = OpAccessChain %16 %282 
					                                f32 %284 = OpLoad %283 
					                       Uniform f32* %285 = OpAccessChain %16 %282 
					                                f32 %286 = OpLoad %285 
					                       Uniform f32* %287 = OpAccessChain %16 %282 
					                                f32 %288 = OpLoad %287 
					                              f32_3 %289 = OpCompositeConstruct %284 %286 %288 
					                                f32 %290 = OpCompositeExtract %289 0 
					                                f32 %291 = OpCompositeExtract %289 1 
					                                f32 %292 = OpCompositeExtract %289 2 
					                              f32_3 %293 = OpCompositeConstruct %290 %291 %292 
					                              f32_3 %294 = OpFMul %281 %293 
					                              f32_4 %295 = OpLoad %9 
					                              f32_3 %296 = OpVectorShuffle %295 %295 0 0 0 
					                              f32_3 %297 = OpFAdd %294 %296 
					                              f32_4 %298 = OpLoad %9 
					                              f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
					                                             OpStore %9 %299 
					                       Private f32* %301 = OpAccessChain %9 %157 
					                                f32 %302 = OpLoad %301 
					                       Private f32* %303 = OpAccessChain %9 %32 
					                                f32 %304 = OpLoad %303 
					                                f32 %305 = OpFAdd %302 %304 
					                                             OpStore %300 %305 
					                                f32 %306 = OpLoad %300 
					                                f32 %308 = OpFMul %306 %307 
					                                             OpStore %300 %308 
					                                f32 %310 = OpLoad %300 
					                       Private f32* %311 = OpAccessChain %9 %87 
					                                f32 %312 = OpLoad %311 
					                               bool %313 = OpFOrdLessThan %310 %312 
					                                             OpStore %309 %313 
					                               bool %314 = OpLoad %309 
					                                             OpSelectionMerge %318 None 
					                                             OpBranchConditional %314 %317 %320 
					                                    %317 = OpLabel 
					                                             OpStore %316 %319 
					                                             OpBranch %318 
					                                    %320 = OpLabel 
					                              f32_4 %321 = OpLoad %9 
					                              f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
					                                             OpStore %316 %322 
					                                             OpBranch %318 
					                                    %318 = OpLabel 
					                              f32_3 %323 = OpLoad %316 
					                              f32_4 %324 = OpLoad %9 
					                              f32_4 %325 = OpVectorShuffle %324 %323 4 5 6 3 
					                                             OpStore %9 %325 
					                              f32_4 %326 = OpLoad %9 
					                              f32_3 %327 = OpVectorShuffle %326 %326 0 1 2 
					                                f32 %332 = OpDot %327 %331 
					                       Private f32* %333 = OpAccessChain %9 %32 
					                                             OpStore %333 %332 
					                              f32_4 %334 = OpLoad %9 
					                              f32_4 %335 = OpVectorShuffle %334 %334 0 0 0 0 
					                              f32_4 %341 = OpFMul %335 %340 
					                                             OpStore %30 %341 
					                              f32_4 %342 = OpLoad %9 
					                              f32_3 %343 = OpVectorShuffle %342 %342 0 0 0 
					                              f32_3 %345 = OpFMul %343 %344 
					                              f32_4 %346 = OpLoad %9 
					                              f32_4 %347 = OpVectorShuffle %346 %345 0 4 5 6 
					                                             OpStore %9 %347 
					                              f32_4 %353 = OpLoad %9 
					                              f32_4 %354 = OpVectorShuffle %353 %353 0 0 0 0 
					                             bool_4 %355 = OpFOrdLessThan %352 %354 
					                                             OpStore %350 %355 
					                      Private bool* %356 = OpAccessChain %350 %91 
					                               bool %357 = OpLoad %356 
					                                             OpSelectionMerge %361 None 
					                                             OpBranchConditional %357 %360 %364 
					                                    %360 = OpLabel 
					                              f32_4 %362 = OpLoad %30 
					                              f32_2 %363 = OpVectorShuffle %362 %362 2 3 
					                                             OpStore %359 %363 
					                                             OpBranch %361 
					                                    %364 = OpLabel 
					                              f32_4 %365 = OpLoad %9 
					                              f32_2 %366 = OpVectorShuffle %365 %365 1 2 
					                                             OpStore %359 %366 
					                                             OpBranch %361 
					                                    %361 = OpLabel 
					                              f32_2 %367 = OpLoad %359 
					                              f32_3 %368 = OpLoad %262 
					                              f32_3 %369 = OpVectorShuffle %368 %367 3 4 2 
					                                             OpStore %262 %369 
					                      Private bool* %370 = OpAccessChain %350 %157 
					                               bool %371 = OpLoad %370 
					                                             OpSelectionMerge %374 None 
					                                             OpBranchConditional %371 %373 %377 
					                                    %373 = OpLabel 
					                              f32_4 %375 = OpLoad %30 
					                              f32_2 %376 = OpVectorShuffle %375 %375 1 0 
					                                             OpStore %372 %376 
					                                             OpBranch %374 
					                                    %377 = OpLabel 
					                              f32_3 %378 = OpLoad %262 
					                              f32_2 %379 = OpVectorShuffle %378 %378 0 1 
					                                             OpStore %372 %379 
					                                             OpBranch %374 
					                                    %374 = OpLabel 
					                              f32_2 %380 = OpLoad %372 
					                              f32_3 %381 = OpLoad %262 
					                              f32_3 %382 = OpVectorShuffle %381 %380 3 4 2 
					                                             OpStore %262 %382 
					                      Private bool* %383 = OpAccessChain %350 %87 
					                               bool %384 = OpLoad %383 
					                                             OpSelectionMerge %387 None 
					                                             OpBranchConditional %384 %386 %390 
					                                    %386 = OpLabel 
					                              f32_4 %388 = OpLoad %9 
					                              f32_2 %389 = OpVectorShuffle %388 %388 3 0 
					                                             OpStore %385 %389 
					                                             OpBranch %387 
					                                    %390 = OpLabel 
					                              f32_3 %391 = OpLoad %262 
					                              f32_2 %392 = OpVectorShuffle %391 %391 0 1 
					                                             OpStore %385 %392 
					                                             OpBranch %387 
					                                    %387 = OpLabel 
					                              f32_2 %393 = OpLoad %385 
					                              f32_3 %394 = OpLoad %262 
					                              f32_3 %395 = OpVectorShuffle %394 %393 3 4 2 
					                                             OpStore %262 %395 
					                      Private bool* %398 = OpAccessChain %350 %32 
					                               bool %399 = OpLoad %398 
					                                             OpSelectionMerge %402 None 
					                                             OpBranchConditional %399 %401 %405 
					                                    %401 = OpLabel 
					                              f32_4 %403 = OpLoad %9 
					                              f32_2 %404 = OpVectorShuffle %403 %403 0 0 
					                                             OpStore %400 %404 
					                                             OpBranch %402 
					                                    %405 = OpLabel 
					                              f32_3 %406 = OpLoad %262 
					                              f32_2 %407 = OpVectorShuffle %406 %406 0 1 
					                                             OpStore %400 %407 
					                                             OpBranch %402 
					                                    %402 = OpLabel 
					                              f32_2 %408 = OpLoad %400 
					                              f32_4 %409 = OpLoad %397 
					                              f32_4 %410 = OpVectorShuffle %409 %408 4 5 2 3 
					                                             OpStore %397 %410 
					                       Private f32* %411 = OpAccessChain %9 %32 
					                                f32 %412 = OpLoad %411 
					                        Output f32* %414 = OpAccessChain %397 %157 
					                                             OpStore %414 %412 
					                        Output f32* %416 = OpAccessChain %397 %91 
					                                             OpStore %416 %415 
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
						float _Distortion;
						vec4 unused_0_2;
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
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bvec4 u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec3 u_xlat16_5;
					float u_xlat16_6;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat15;
					float u_xlat16_15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat0.x;
					    u_xlat1.yzw = vec3(_DotSize) * vec3(0.001953125, 0.001953125, 0.001953125) + u_xlat0.yxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_10 = dot(u_xlat10_3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_15 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat2.w = _DotSize * 0.001953125 + u_xlat0.y;
					    u_xlat2.xz = (-vec2(_DotSize)) * vec2(0.001953125, 0.001953125) + u_xlat1.xx;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_6 = dot(u_xlat10_3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_15 = u_xlat16_15 * 2.0 + u_xlat16_6;
					    u_xlat16_15 = u_xlat16_10 + u_xlat16_15;
					    u_xlat3.xyw = (-vec3(_DotSize)) * vec3(0.001953125, 0.001953125, 0.001953125) + u_xlat0.xyy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_11 = dot(u_xlat10_4, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_15 = u_xlat16_15 + (-u_xlat16_11);
					    u_xlat16_15 = (-u_xlat16_11) * 2.0 + u_xlat16_15;
					    u_xlat3.z = _DotSize * 0.001953125 + u_xlat1.x;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = dot(u_xlat10_3, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_15 = u_xlat16_15 + (-u_xlat16_1);
					    u_xlat16_10 = u_xlat16_10 + u_xlat16_1;
					    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
					    u_xlat2.y = u_xlat0.y;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_0 = dot(u_xlat10_2, vec4(0.112500004, 0.221249998, 0.0412499979, 0.25));
					    u_xlat16_5.x = u_xlat16_0 * 2.0 + u_xlat16_10;
					    u_xlat16_5.x = (-u_xlat16_11) + u_xlat16_5.x;
					    u_xlat16_0 = (-u_xlat16_0) * 2.0 + u_xlat16_5.x;
					    u_xlat16_0 = (-u_xlat16_6) + u_xlat16_0;
					    u_xlat0.x = u_xlat16_0 * u_xlat16_0 + u_xlat16_15;
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat16_5.x = dot(u_xlat10_3, u_xlat10_3);
					    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
					    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat10_3.xyz;
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
					    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.649999976, 0.649999976, 0.649999976);
					    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
					    u_xlat5.xyz = u_xlat16_5.xyz * vec3(5.0, 5.0, 5.0);
					    u_xlat5.xyz = floor(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.53846157, 1.53846157, 1.53846157);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat0.xyz = u_xlat5.xyz * vec3(vec3(_Distortion, _Distortion, _Distortion)) + u_xlat0.xxx;
					    u_xlat15 = u_xlat0.z + u_xlat0.x;
					    u_xlat15 = u_xlat15 * 12.8000002;
					    u_xlatb15 = u_xlat15<u_xlat0.y;
					    u_xlat0.xyz = (bool(u_xlatb15)) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat1 = u_xlat0.xxxx * vec4(0.899999976, 0.699999988, 0.5, 0.75);
					    u_xlat0.yzw = u_xlat0.xxx * vec3(0.25, 0.5, 0.899999976);
					    u_xlatb2 = lessThan(vec4(0.949999988, 0.75, 0.5, 0.25), u_xlat0.xxxx);
					    u_xlat5.xy = (u_xlatb2.w) ? u_xlat1.zw : u_xlat0.yz;
					    u_xlat5.xy = (u_xlatb2.z) ? u_xlat1.yx : u_xlat5.xy;
					    u_xlat5.xy = (u_xlatb2.y) ? u_xlat0.wx : u_xlat5.xy;
					    SV_Target0.xy = (u_xlatb2.x) ? u_xlat0.xx : u_xlat5.xy;
					    SV_Target0.z = u_xlat0.x;
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