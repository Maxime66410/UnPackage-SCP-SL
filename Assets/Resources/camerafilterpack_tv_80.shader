Shader "CameraFilterPack/TV_80" {
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
			GpuProgramID 2602
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
					uniform 	float _Fade;
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec2 u_xlat4;
					float u_xlat5;
					vec2 u_xlat8;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.y = 0.00100000005;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat8.yy * vec2(21.0, 29.0);
					    u_xlat1.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat1.xy;
					    u_xlat1.xy = sin(u_xlat1.xy);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat5 = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat5 = u_xlat8.y * 31.0 + u_xlat5;
					    u_xlat5 = sin(u_xlat5);
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat5 = u_xlat1.x * 0.00170000002 + u_xlat8.x;
					    u_xlat1.x = u_xlat1.x * 0.00170000002 + 0.0250000004;
					    u_xlat2.x = u_xlat1.x * 0.75 + u_xlat8.x;
					    u_xlat1.x = u_xlat5 + 0.00100000005;
					    u_xlat0.x = (-u_xlat8.x) + u_xlat1.x;
					    u_xlat0.xy = vec2(vec2(_Fade, _Fade)) * u_xlat0.xy + u_xlat8.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3.xyz = u_xlat10_1.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat2.y = u_xlat8.y + 0.00100000005;
					    u_xlat0.xy = u_xlat2.xy + vec2(0.00100000005, -0.0149999997);
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
					    u_xlat0.x = u_xlat8.x * u_xlat8.y;
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat4.xy = (-u_xlat8.xy) + vec2(1.0, 1.0);
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4.y * u_xlat0.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.300000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(3.66000009, 2.94000006, 2.66000009);
					    u_xlat13 = u_xlat8.y * _ScreenResolution.y;
					    u_xlat2.x = _TimeX * 3.5;
					    u_xlat13 = u_xlat13 * 1.5 + u_xlat2.x;
					    u_xlat13 = sin(u_xlat13);
					    u_xlat13 = u_xlat13 * 0.349999994 + 0.349999994;
					    u_xlat13 = log2(u_xlat13);
					    u_xlat13 = u_xlat13 * 1.70000005;
					    u_xlat13 = exp2(u_xlat13);
					    u_xlat13 = u_xlat13 * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
					    u_xlat2.xy = vec2(_TimeX) * vec2(2.5999999, 110.0);
					    u_xlat12 = u_xlat8.y * 6.0 + u_xlat2.x;
					    u_xlat13 = sin(u_xlat2.y);
					    u_xlat13 = u_xlat13 * 0.00999999978 + 1.0;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 + 1.95000005;
					    u_xlat12 = floor(u_xlat12);
					    u_xlat12 = min(u_xlat12, 1.10000002);
					    u_xlat12 = u_xlat12 * 0.25 + u_xlat13;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_Fade, _Fade, _Fade)) * u_xlat0.xyz + u_xlat10_1.xyz;
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
					; Bound: 349
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %19 %327 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpDecorate vs_TEXCOORD0 Location 19 
					                                                  OpMemberDecorate %22 0 Offset 22 
					                                                  OpMemberDecorate %22 1 Offset 22 
					                                                  OpMemberDecorate %22 2 Offset 22 
					                                                  OpMemberDecorate %22 3 RelaxedPrecision 
					                                                  OpMemberDecorate %22 3 Offset 22 
					                                                  OpDecorate %22 Block 
					                                                  OpDecorate %24 DescriptorSet 24 
					                                                  OpDecorate %24 Binding 24 
					                                                  OpDecorate %29 RelaxedPrecision 
					                                                  OpDecorate %30 RelaxedPrecision 
					                                                  OpDecorate %33 RelaxedPrecision 
					                                                  OpDecorate %34 RelaxedPrecision 
					                                                  OpDecorate %130 RelaxedPrecision 
					                                                  OpDecorate %133 RelaxedPrecision 
					                                                  OpDecorate %133 DescriptorSet 133 
					                                                  OpDecorate %133 Binding 133 
					                                                  OpDecorate %134 RelaxedPrecision 
					                                                  OpDecorate %137 RelaxedPrecision 
					                                                  OpDecorate %137 DescriptorSet 137 
					                                                  OpDecorate %137 Binding 137 
					                                                  OpDecorate %138 RelaxedPrecision 
					                                                  OpDecorate %144 RelaxedPrecision 
					                                                  OpDecorate %145 RelaxedPrecision 
					                                                  OpDecorate %146 RelaxedPrecision 
					                                                  OpDecorate %149 RelaxedPrecision 
					                                                  OpDecorate %160 RelaxedPrecision 
					                                                  OpDecorate %161 RelaxedPrecision 
					                                                  OpDecorate %162 RelaxedPrecision 
					                                                  OpDecorate %167 RelaxedPrecision 
					                                                  OpDecorate %168 RelaxedPrecision 
					                                                  OpDecorate %169 RelaxedPrecision 
					                                                  OpDecorate %172 RelaxedPrecision 
					                                                  OpDecorate %173 RelaxedPrecision 
					                                                  OpDecorate %174 RelaxedPrecision 
					                                                  OpDecorate %175 RelaxedPrecision 
					                                                  OpDecorate %176 RelaxedPrecision 
					                                                  OpDecorate %177 RelaxedPrecision 
					                                                  OpDecorate %178 RelaxedPrecision 
					                                                  OpDecorate %181 RelaxedPrecision 
					                                                  OpDecorate %182 RelaxedPrecision 
					                                                  OpDecorate %185 RelaxedPrecision 
					                                                  OpDecorate %186 RelaxedPrecision 
					                                                  OpDecorate %187 RelaxedPrecision 
					                                                  OpDecorate %188 RelaxedPrecision 
					                                                  OpDecorate %191 RelaxedPrecision 
					                                                  OpDecorate %192 RelaxedPrecision 
					                                                  OpDecorate %193 RelaxedPrecision 
					                                                  OpDecorate %236 RelaxedPrecision 
					                                                  OpDecorate %323 RelaxedPrecision 
					                                                  OpDecorate %324 RelaxedPrecision 
					                                                  OpDecorate %327 Location 327 
					                                                  OpDecorate %341 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 3 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_3* %9 = OpVariable Private 
					                                      f32 %10 = OpConstant 3,674022E-40 
					                                          %11 = OpTypeInt 32 0 
					                                      u32 %12 = OpConstant 1 
					                                          %13 = OpTypePointer Private %6 
					                                          %15 = OpTypeVector %6 2 
					                                          %16 = OpTypePointer Private %15 
					                           Private f32_2* %17 = OpVariable Private 
					                                          %18 = OpTypePointer Input %15 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          %21 = OpTypeVector %6 4 
					                                          %22 = OpTypeStruct %6 %6 %21 %21 
					                                          %23 = OpTypePointer Uniform %22 
					Uniform struct {f32; f32; f32_4; f32_4;}* %24 = OpVariable Uniform 
					                                          %25 = OpTypeInt 32 1 
					                                      i32 %26 = OpConstant 3 
					                                          %27 = OpTypePointer Uniform %21 
					                           Private f32_2* %36 = OpVariable Private 
					                                      f32 %39 = OpConstant 3,674022E-40 
					                                      f32 %40 = OpConstant 3,674022E-40 
					                                    f32_2 %41 = OpConstantComposite %39 %40 
					                                      i32 %43 = OpConstant 0 
					                                          %44 = OpTypePointer Uniform %6 
					                                      f32 %48 = OpConstant 3,674022E-40 
					                                      f32 %49 = OpConstant 3,674022E-40 
					                                    f32_2 %50 = OpConstantComposite %48 %49 
					                                      u32 %58 = OpConstant 0 
					                             Private f32* %63 = OpVariable Private 
					                                      f32 %66 = OpConstant 3,674022E-40 
					                                      f32 %71 = OpConstant 3,674022E-40 
					                                      f32 %84 = OpConstant 3,674022E-40 
					                                      f32 %92 = OpConstant 3,674022E-40 
					                           Private f32_2* %95 = OpVariable Private 
					                                      f32 %98 = OpConstant 3,674022E-40 
					                                     i32 %114 = OpConstant 1 
					                          Private f32_3* %130 = OpVariable Private 
					                                         %131 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                         %132 = OpTypePointer UniformConstant %131 
					    UniformConstant read_only Texture2D* %133 = OpVariable UniformConstant 
					                                         %135 = OpTypeSampler 
					                                         %136 = OpTypePointer UniformConstant %135 
					                UniformConstant sampler* %137 = OpVariable UniformConstant 
					                                         %139 = OpTypeSampledImage %131 
					                          Private f32_3* %145 = OpVariable Private 
					                                     f32 %147 = OpConstant 3,674022E-40 
					                                   f32_3 %148 = OpConstantComposite %147 %147 %147 
					                                     f32 %155 = OpConstant 3,674022E-40 
					                                   f32_2 %156 = OpConstantComposite %10 %155 
					                          Private f32_3* %160 = OpVariable Private 
					                          Private f32_3* %168 = OpVariable Private 
					                                     f32 %170 = OpConstant 3,674022E-40 
					                                   f32_3 %171 = OpConstantComposite %170 %147 %170 
					                                     f32 %179 = OpConstant 3,674022E-40 
					                                   f32_3 %180 = OpConstantComposite %179 %179 %179 
					                                     f32 %183 = OpConstant 3,674022E-40 
					                                   f32_3 %184 = OpConstantComposite %183 %183 %183 
					                                     f32 %189 = OpConstant 3,674022E-40 
					                                     f32 %190 = OpConstant 3,674022E-40 
					                                     f32 %202 = OpConstant 3,674022E-40 
					                          Private f32_2* %205 = OpVariable Private 
					                                   f32_2 %208 = OpConstantComposite %190 %190 
					                                     f32 %239 = OpConstant 3,674022E-40 
					                                     f32 %240 = OpConstant 3,674022E-40 
					                                     f32 %241 = OpConstant 3,674022E-40 
					                                   f32_3 %242 = OpConstantComposite %239 %240 %241 
					                            Private f32* %244 = OpVariable Private 
					                                     i32 %247 = OpConstant 2 
					                                     f32 %253 = OpConstant 3,674022E-40 
					                                     f32 %257 = OpConstant 3,674022E-40 
					                                     f32 %265 = OpConstant 3,674022E-40 
					                                     f32 %271 = OpConstant 3,674022E-40 
					                                     f32 %285 = OpConstant 3,674022E-40 
					                                     f32 %286 = OpConstant 3,674022E-40 
					                                   f32_2 %287 = OpConstantComposite %285 %286 
					                            Private f32* %289 = OpVariable Private 
					                                     f32 %292 = OpConstant 3,674022E-40 
					                                     f32 %301 = OpConstant 3,674022E-40 
					                                     f32 %307 = OpConstant 3,674022E-40 
					                                     f32 %312 = OpConstant 3,674022E-40 
					                                     f32 %315 = OpConstant 3,674022E-40 
					                                         %326 = OpTypePointer Output %21 
					                           Output f32_4* %327 = OpVariable Output 
					                                     u32 %345 = OpConstant 3 
					                                         %346 = OpTypePointer Output %6 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                             Private f32* %14 = OpAccessChain %9 %12 
					                                                  OpStore %14 %10 
					                                    f32_2 %20 = OpLoad vs_TEXCOORD0 
					                           Uniform f32_4* %28 = OpAccessChain %24 %26 
					                                    f32_4 %29 = OpLoad %28 
					                                    f32_2 %30 = OpVectorShuffle %29 %29 0 1 
					                                    f32_2 %31 = OpFMul %20 %30 
					                           Uniform f32_4* %32 = OpAccessChain %24 %26 
					                                    f32_4 %33 = OpLoad %32 
					                                    f32_2 %34 = OpVectorShuffle %33 %33 2 3 
					                                    f32_2 %35 = OpFAdd %31 %34 
					                                                  OpStore %17 %35 
					                                    f32_2 %37 = OpLoad %17 
					                                    f32_2 %38 = OpVectorShuffle %37 %37 1 1 
					                                    f32_2 %42 = OpFMul %38 %41 
					                                                  OpStore %36 %42 
					                             Uniform f32* %45 = OpAccessChain %24 %43 
					                                      f32 %46 = OpLoad %45 
					                                    f32_2 %47 = OpCompositeConstruct %46 %46 
					                                    f32_2 %51 = OpFMul %47 %50 
					                                    f32_2 %52 = OpLoad %36 
					                                    f32_2 %53 = OpFAdd %51 %52 
					                                                  OpStore %36 %53 
					                                    f32_2 %54 = OpLoad %36 
					                                    f32_2 %55 = OpExtInst %1 13 %54 
					                                                  OpStore %36 %55 
					                             Private f32* %56 = OpAccessChain %36 %12 
					                                      f32 %57 = OpLoad %56 
					                             Private f32* %59 = OpAccessChain %36 %58 
					                                      f32 %60 = OpLoad %59 
					                                      f32 %61 = OpFMul %57 %60 
					                             Private f32* %62 = OpAccessChain %36 %58 
					                                                  OpStore %62 %61 
					                             Uniform f32* %64 = OpAccessChain %24 %43 
					                                      f32 %65 = OpLoad %64 
					                                      f32 %67 = OpFMul %65 %66 
					                                      f32 %68 = OpFAdd %67 %48 
					                                                  OpStore %63 %68 
					                             Private f32* %69 = OpAccessChain %17 %12 
					                                      f32 %70 = OpLoad %69 
					                                      f32 %72 = OpFMul %70 %71 
					                                      f32 %73 = OpLoad %63 
					                                      f32 %74 = OpFAdd %72 %73 
					                                                  OpStore %63 %74 
					                                      f32 %75 = OpLoad %63 
					                                      f32 %76 = OpExtInst %1 13 %75 
					                                                  OpStore %63 %76 
					                                      f32 %77 = OpLoad %63 
					                             Private f32* %78 = OpAccessChain %36 %58 
					                                      f32 %79 = OpLoad %78 
					                                      f32 %80 = OpFMul %77 %79 
					                             Private f32* %81 = OpAccessChain %36 %58 
					                                                  OpStore %81 %80 
					                             Private f32* %82 = OpAccessChain %36 %58 
					                                      f32 %83 = OpLoad %82 
					                                      f32 %85 = OpFMul %83 %84 
					                             Private f32* %86 = OpAccessChain %17 %58 
					                                      f32 %87 = OpLoad %86 
					                                      f32 %88 = OpFAdd %85 %87 
					                                                  OpStore %63 %88 
					                             Private f32* %89 = OpAccessChain %36 %58 
					                                      f32 %90 = OpLoad %89 
					                                      f32 %91 = OpFMul %90 %84 
					                                      f32 %93 = OpFAdd %91 %92 
					                             Private f32* %94 = OpAccessChain %36 %58 
					                                                  OpStore %94 %93 
					                             Private f32* %96 = OpAccessChain %36 %58 
					                                      f32 %97 = OpLoad %96 
					                                      f32 %99 = OpFMul %97 %98 
					                            Private f32* %100 = OpAccessChain %17 %58 
					                                     f32 %101 = OpLoad %100 
					                                     f32 %102 = OpFAdd %99 %101 
					                            Private f32* %103 = OpAccessChain %95 %58 
					                                                  OpStore %103 %102 
					                                     f32 %104 = OpLoad %63 
					                                     f32 %105 = OpFAdd %104 %10 
					                            Private f32* %106 = OpAccessChain %36 %58 
					                                                  OpStore %106 %105 
					                            Private f32* %107 = OpAccessChain %17 %58 
					                                     f32 %108 = OpLoad %107 
					                                     f32 %109 = OpFNegate %108 
					                            Private f32* %110 = OpAccessChain %36 %58 
					                                     f32 %111 = OpLoad %110 
					                                     f32 %112 = OpFAdd %109 %111 
					                            Private f32* %113 = OpAccessChain %9 %58 
					                                                  OpStore %113 %112 
					                            Uniform f32* %115 = OpAccessChain %24 %114 
					                                     f32 %116 = OpLoad %115 
					                            Uniform f32* %117 = OpAccessChain %24 %114 
					                                     f32 %118 = OpLoad %117 
					                                   f32_2 %119 = OpCompositeConstruct %116 %118 
					                                     f32 %120 = OpCompositeExtract %119 0 
					                                     f32 %121 = OpCompositeExtract %119 1 
					                                   f32_2 %122 = OpCompositeConstruct %120 %121 
					                                   f32_3 %123 = OpLoad %9 
					                                   f32_2 %124 = OpVectorShuffle %123 %123 0 1 
					                                   f32_2 %125 = OpFMul %122 %124 
					                                   f32_2 %126 = OpLoad %17 
					                                   f32_2 %127 = OpFAdd %125 %126 
					                                   f32_3 %128 = OpLoad %9 
					                                   f32_3 %129 = OpVectorShuffle %128 %127 3 4 2 
					                                                  OpStore %9 %129 
					                     read_only Texture2D %134 = OpLoad %133 
					                                 sampler %138 = OpLoad %137 
					              read_only Texture2DSampled %140 = OpSampledImage %134 %138 
					                                   f32_3 %141 = OpLoad %9 
					                                   f32_2 %142 = OpVectorShuffle %141 %141 0 1 
					                                   f32_4 %143 = OpImageSampleImplicitLod %140 %142 
					                                   f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
					                                                  OpStore %130 %144 
					                                   f32_3 %146 = OpLoad %130 
					                                   f32_3 %149 = OpFAdd %146 %148 
					                                                  OpStore %145 %149 
					                            Private f32* %150 = OpAccessChain %17 %12 
					                                     f32 %151 = OpLoad %150 
					                                     f32 %152 = OpFAdd %151 %10 
					                            Private f32* %153 = OpAccessChain %95 %12 
					                                                  OpStore %153 %152 
					                                   f32_2 %154 = OpLoad %95 
					                                   f32_2 %157 = OpFAdd %154 %156 
					                                   f32_3 %158 = OpLoad %9 
					                                   f32_3 %159 = OpVectorShuffle %158 %157 3 4 2 
					                                                  OpStore %9 %159 
					                     read_only Texture2D %161 = OpLoad %133 
					                                 sampler %162 = OpLoad %137 
					              read_only Texture2DSampled %163 = OpSampledImage %161 %162 
					                                   f32_3 %164 = OpLoad %9 
					                                   f32_2 %165 = OpVectorShuffle %164 %164 0 1 
					                                   f32_4 %166 = OpImageSampleImplicitLod %163 %165 
					                                   f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
					                                                  OpStore %160 %167 
					                                   f32_3 %169 = OpLoad %160 
					                                   f32_3 %172 = OpFMul %169 %171 
					                                   f32_3 %173 = OpLoad %145 
					                                   f32_3 %174 = OpFAdd %172 %173 
					                                                  OpStore %168 %174 
					                                   f32_3 %175 = OpLoad %168 
					                                   f32_3 %176 = OpLoad %168 
					                                   f32_3 %177 = OpFMul %175 %176 
					                                                  OpStore %145 %177 
					                                   f32_3 %178 = OpLoad %145 
					                                   f32_3 %181 = OpFMul %178 %180 
					                                                  OpStore %145 %181 
					                                   f32_3 %182 = OpLoad %168 
					                                   f32_3 %185 = OpFMul %182 %184 
					                                   f32_3 %186 = OpLoad %145 
					                                   f32_3 %187 = OpFAdd %185 %186 
					                                                  OpStore %168 %187 
					                                   f32_3 %188 = OpLoad %168 
					                                   f32_3 %191 = OpCompositeConstruct %189 %189 %189 
					                                   f32_3 %192 = OpCompositeConstruct %190 %190 %190 
					                                   f32_3 %193 = OpExtInst %1 43 %188 %191 %192 
					                                                  OpStore %168 %193 
					                            Private f32* %194 = OpAccessChain %17 %58 
					                                     f32 %195 = OpLoad %194 
					                            Private f32* %196 = OpAccessChain %17 %12 
					                                     f32 %197 = OpLoad %196 
					                                     f32 %198 = OpFMul %195 %197 
					                            Private f32* %199 = OpAccessChain %9 %58 
					                                                  OpStore %199 %198 
					                            Private f32* %200 = OpAccessChain %9 %58 
					                                     f32 %201 = OpLoad %200 
					                                     f32 %203 = OpFMul %201 %202 
					                            Private f32* %204 = OpAccessChain %9 %58 
					                                                  OpStore %204 %203 
					                                   f32_2 %206 = OpLoad %17 
					                                   f32_2 %207 = OpFNegate %206 
					                                   f32_2 %209 = OpFAdd %207 %208 
					                                                  OpStore %205 %209 
					                            Private f32* %210 = OpAccessChain %205 %58 
					                                     f32 %211 = OpLoad %210 
					                            Private f32* %212 = OpAccessChain %9 %58 
					                                     f32 %213 = OpLoad %212 
					                                     f32 %214 = OpFMul %211 %213 
					                            Private f32* %215 = OpAccessChain %9 %58 
					                                                  OpStore %215 %214 
					                            Private f32* %216 = OpAccessChain %205 %12 
					                                     f32 %217 = OpLoad %216 
					                            Private f32* %218 = OpAccessChain %9 %58 
					                                     f32 %219 = OpLoad %218 
					                                     f32 %220 = OpFMul %217 %219 
					                            Private f32* %221 = OpAccessChain %9 %58 
					                                                  OpStore %221 %220 
					                            Private f32* %222 = OpAccessChain %9 %58 
					                                     f32 %223 = OpLoad %222 
					                                     f32 %224 = OpExtInst %1 30 %223 
					                            Private f32* %225 = OpAccessChain %9 %58 
					                                                  OpStore %225 %224 
					                            Private f32* %226 = OpAccessChain %9 %58 
					                                     f32 %227 = OpLoad %226 
					                                     f32 %228 = OpFMul %227 %48 
					                            Private f32* %229 = OpAccessChain %9 %58 
					                                                  OpStore %229 %228 
					                            Private f32* %230 = OpAccessChain %9 %58 
					                                     f32 %231 = OpLoad %230 
					                                     f32 %232 = OpExtInst %1 29 %231 
					                            Private f32* %233 = OpAccessChain %9 %58 
					                                                  OpStore %233 %232 
					                                   f32_3 %234 = OpLoad %9 
					                                   f32_3 %235 = OpVectorShuffle %234 %234 0 0 0 
					                                   f32_3 %236 = OpLoad %168 
					                                   f32_3 %237 = OpFMul %235 %236 
					                                                  OpStore %9 %237 
					                                   f32_3 %238 = OpLoad %9 
					                                   f32_3 %243 = OpFMul %238 %242 
					                                                  OpStore %9 %243 
					                            Private f32* %245 = OpAccessChain %17 %12 
					                                     f32 %246 = OpLoad %245 
					                            Uniform f32* %248 = OpAccessChain %24 %247 %12 
					                                     f32 %249 = OpLoad %248 
					                                     f32 %250 = OpFMul %246 %249 
					                                                  OpStore %244 %250 
					                            Uniform f32* %251 = OpAccessChain %24 %43 
					                                     f32 %252 = OpLoad %251 
					                                     f32 %254 = OpFMul %252 %253 
					                            Private f32* %255 = OpAccessChain %95 %58 
					                                                  OpStore %255 %254 
					                                     f32 %256 = OpLoad %244 
					                                     f32 %258 = OpFMul %256 %257 
					                            Private f32* %259 = OpAccessChain %95 %58 
					                                     f32 %260 = OpLoad %259 
					                                     f32 %261 = OpFAdd %258 %260 
					                                                  OpStore %244 %261 
					                                     f32 %262 = OpLoad %244 
					                                     f32 %263 = OpExtInst %1 13 %262 
					                                                  OpStore %244 %263 
					                                     f32 %264 = OpLoad %244 
					                                     f32 %266 = OpFMul %264 %265 
					                                     f32 %267 = OpFAdd %266 %265 
					                                                  OpStore %244 %267 
					                                     f32 %268 = OpLoad %244 
					                                     f32 %269 = OpExtInst %1 30 %268 
					                                                  OpStore %244 %269 
					                                     f32 %270 = OpLoad %244 
					                                     f32 %272 = OpFMul %270 %271 
					                                                  OpStore %244 %272 
					                                     f32 %273 = OpLoad %244 
					                                     f32 %274 = OpExtInst %1 29 %273 
					                                                  OpStore %244 %274 
					                                     f32 %275 = OpLoad %244 
					                                     f32 %276 = OpFMul %275 %49 
					                                     f32 %277 = OpFAdd %276 %179 
					                                                  OpStore %244 %277 
					                                   f32_3 %278 = OpLoad %9 
					                                     f32 %279 = OpLoad %244 
					                                   f32_3 %280 = OpCompositeConstruct %279 %279 %279 
					                                   f32_3 %281 = OpFMul %278 %280 
					                                                  OpStore %9 %281 
					                            Uniform f32* %282 = OpAccessChain %24 %43 
					                                     f32 %283 = OpLoad %282 
					                                   f32_2 %284 = OpCompositeConstruct %283 %283 
					                                   f32_2 %288 = OpFMul %284 %287 
					                                                  OpStore %95 %288 
					                            Private f32* %290 = OpAccessChain %17 %12 
					                                     f32 %291 = OpLoad %290 
					                                     f32 %293 = OpFMul %291 %292 
					                            Private f32* %294 = OpAccessChain %95 %58 
					                                     f32 %295 = OpLoad %294 
					                                     f32 %296 = OpFAdd %293 %295 
					                                                  OpStore %289 %296 
					                            Private f32* %297 = OpAccessChain %95 %12 
					                                     f32 %298 = OpLoad %297 
					                                     f32 %299 = OpExtInst %1 13 %298 
					                                                  OpStore %244 %299 
					                                     f32 %300 = OpLoad %244 
					                                     f32 %302 = OpFMul %300 %301 
					                                     f32 %303 = OpFAdd %302 %190 
					                                                  OpStore %244 %303 
					                                     f32 %304 = OpLoad %289 
					                                     f32 %305 = OpExtInst %1 13 %304 
					                                                  OpStore %289 %305 
					                                     f32 %306 = OpLoad %289 
					                                     f32 %308 = OpFAdd %306 %307 
					                                                  OpStore %289 %308 
					                                     f32 %309 = OpLoad %289 
					                                     f32 %310 = OpExtInst %1 8 %309 
					                                                  OpStore %289 %310 
					                                     f32 %311 = OpLoad %289 
					                                     f32 %313 = OpExtInst %1 37 %311 %312 
					                                                  OpStore %289 %313 
					                                     f32 %314 = OpLoad %289 
					                                     f32 %316 = OpFMul %314 %315 
					                                     f32 %317 = OpLoad %244 
					                                     f32 %318 = OpFAdd %316 %317 
					                                                  OpStore %289 %318 
					                                   f32_3 %319 = OpLoad %9 
					                                     f32 %320 = OpLoad %289 
					                                   f32_3 %321 = OpCompositeConstruct %320 %320 %320 
					                                   f32_3 %322 = OpFMul %319 %321 
					                                   f32_3 %323 = OpLoad %130 
					                                   f32_3 %324 = OpFNegate %323 
					                                   f32_3 %325 = OpFAdd %322 %324 
					                                                  OpStore %9 %325 
					                            Uniform f32* %328 = OpAccessChain %24 %114 
					                                     f32 %329 = OpLoad %328 
					                            Uniform f32* %330 = OpAccessChain %24 %114 
					                                     f32 %331 = OpLoad %330 
					                            Uniform f32* %332 = OpAccessChain %24 %114 
					                                     f32 %333 = OpLoad %332 
					                                   f32_3 %334 = OpCompositeConstruct %329 %331 %333 
					                                     f32 %335 = OpCompositeExtract %334 0 
					                                     f32 %336 = OpCompositeExtract %334 1 
					                                     f32 %337 = OpCompositeExtract %334 2 
					                                   f32_3 %338 = OpCompositeConstruct %335 %336 %337 
					                                   f32_3 %339 = OpLoad %9 
					                                   f32_3 %340 = OpFMul %338 %339 
					                                   f32_3 %341 = OpLoad %130 
					                                   f32_3 %342 = OpFAdd %340 %341 
					                                   f32_4 %343 = OpLoad %327 
					                                   f32_4 %344 = OpVectorShuffle %343 %342 4 5 6 3 
					                                                  OpStore %327 %344 
					                             Output f32* %347 = OpAccessChain %327 %345 
					                                                  OpStore %347 %190 
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
						float _Fade;
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat16_3;
					vec2 u_xlat4;
					float u_xlat5;
					vec2 u_xlat8;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.y = 0.00100000005;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat8.yy * vec2(21.0, 29.0);
					    u_xlat1.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat1.xy;
					    u_xlat1.xy = sin(u_xlat1.xy);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat5 = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat5 = u_xlat8.y * 31.0 + u_xlat5;
					    u_xlat5 = sin(u_xlat5);
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat5 = u_xlat1.x * 0.00170000002 + u_xlat8.x;
					    u_xlat1.x = u_xlat1.x * 0.00170000002 + 0.0250000004;
					    u_xlat2.x = u_xlat1.x * 0.75 + u_xlat8.x;
					    u_xlat1.x = u_xlat5 + 0.00100000005;
					    u_xlat0.x = (-u_xlat8.x) + u_xlat1.x;
					    u_xlat0.xy = vec2(vec2(_Fade, _Fade)) * u_xlat0.xy + u_xlat8.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3.xyz = u_xlat10_1.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat2.y = u_xlat8.y + 0.00100000005;
					    u_xlat0.xy = u_xlat2.xy + vec2(0.00100000005, -0.0149999997);
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_3.xyz;
					    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_3.xyz;
					    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
					    u_xlat0.x = u_xlat8.x * u_xlat8.y;
					    u_xlat0.x = u_xlat0.x * 16.0;
					    u_xlat4.xy = (-u_xlat8.xy) + vec2(1.0, 1.0);
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4.y * u_xlat0.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.300000012;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(3.66000009, 2.94000006, 2.66000009);
					    u_xlat13 = u_xlat8.y * _ScreenResolution.y;
					    u_xlat2.x = _TimeX * 3.5;
					    u_xlat13 = u_xlat13 * 1.5 + u_xlat2.x;
					    u_xlat13 = sin(u_xlat13);
					    u_xlat13 = u_xlat13 * 0.349999994 + 0.349999994;
					    u_xlat13 = log2(u_xlat13);
					    u_xlat13 = u_xlat13 * 1.70000005;
					    u_xlat13 = exp2(u_xlat13);
					    u_xlat13 = u_xlat13 * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
					    u_xlat2.xy = vec2(_TimeX) * vec2(2.5999999, 110.0);
					    u_xlat12 = u_xlat8.y * 6.0 + u_xlat2.x;
					    u_xlat13 = sin(u_xlat2.y);
					    u_xlat13 = u_xlat13 * 0.00999999978 + 1.0;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 + 1.95000005;
					    u_xlat12 = floor(u_xlat12);
					    u_xlat12 = min(u_xlat12, 1.10000002);
					    u_xlat12 = u_xlat12 * 0.25 + u_xlat13;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_Fade, _Fade, _Fade)) * u_xlat0.xyz + u_xlat10_1.xyz;
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