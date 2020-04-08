Shader "CameraFilterPack/TV_50" {
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
			GpuProgramID 37681
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
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec2 u_xlat5;
					vec3 u_xlat6;
					vec2 u_xlat11;
					float u_xlat12;
					float u_xlat15;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat5.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat5.xy + vec2(-0.5, -0.5);
					    u_xlat1.xy = u_xlat1.xy * vec2(2.20000005, 2.20000005);
					    u_xlat15 = abs(u_xlat1.y) * 0.200000003;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat2.x = u_xlat15 * u_xlat1.x;
					    u_xlat15 = abs(u_xlat2.x) * 0.25;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat2.y = u_xlat15 * u_xlat1.y;
					    u_xlat1.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.920000017, 0.920000017) + vec2(0.0399999991, 0.0399999991);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat1.y * 31.0 + u_xlat0.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.xyz = u_xlat1.yyx * vec3(21.0, 29.0, 250.0);
					    u_xlat11.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat2.xy;
					    u_xlat2.x = floor(u_xlat2.z);
					    u_xlat11.xy = sin(u_xlat11.xy);
					    u_xlat15 = u_xlat11.y * u_xlat11.x;
					    u_xlat0.x = u_xlat0.x * u_xlat15;
					    u_xlat15 = u_xlat0.x * 0.00170000002 + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.00170000002 + 0.0250000004;
					    u_xlat3.x = u_xlat0.x * 0.75 + u_xlat1.x;
					    u_xlat3.y = u_xlat15 + 0.00100000005;
					    u_xlat3.z = u_xlat1.y + 0.00100000005;
					    u_xlat0.xw = (-u_xlat5.xy) + u_xlat3.yz;
					    u_xlat11.xy = u_xlat3.xz + vec2(0.00100000005, -0.0149999997);
					    u_xlat10_3 = texture(_MainTex, u_xlat11.xy);
					    u_xlat0.xy = vec2(vec2(_Fade, _Fade)) * u_xlat0.xw + u_xlat5.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_4.xyz = u_xlat10_0.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_4.xyz;
					    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
					    u_xlat15 = u_xlat1.x * u_xlat1.y;
					    u_xlat15 = u_xlat15 * 16.0;
					    u_xlat1.xz = (-u_xlat1.xy) + vec2(1.0, 1.0);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat15 = u_xlat1.z * u_xlat15;
					    u_xlat15 = log2(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.300000012;
					    u_xlat15 = exp2(u_xlat15);
					    u_xlat1.xzw = vec3(u_xlat15) * u_xlat16_3.xyz;
					    u_xlat1.xzw = u_xlat1.xzw * vec3(3.66000009, 2.94000006, 2.66000009);
					    u_xlat15 = u_xlat1.y * _ScreenResolution.y;
					    u_xlat12 = _TimeX * 3.5;
					    u_xlat15 = u_xlat15 * 1.5 + u_xlat12;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.349999994 + 0.349999994;
					    u_xlat15 = log2(u_xlat15);
					    u_xlat15 = u_xlat15 * 1.70000005;
					    u_xlat15 = exp2(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.699999988 + 0.400000006;
					    u_xlat1.xzw = vec3(u_xlat15) * u_xlat1.xzw;
					    u_xlat15 = dot(u_xlat1.xzw, vec3(0.222000003, 0.707000017, 0.0710000023));
					    u_xlat1.x = u_xlat1.y * 250.0;
					    u_xlat2.y = floor(u_xlat1.x);
					    u_xlat1.xz = u_xlat2.xy * vec2(_TimeX);
					    u_xlat1.xz = u_xlat1.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat1.x = dot(u_xlat1.xz, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + 0.25;
					    u_xlat6.yz = vec2(_TimeX) * vec2(2.5999999, 110.0);
					    u_xlat6.x = u_xlat1.y * 6.0 + u_xlat6.y;
					    u_xlat6.xy = sin(u_xlat6.xz);
					    u_xlat11.x = u_xlat6.y * 0.00999999978 + 1.0;
					    u_xlat6.x = u_xlat6.x + 1.95000005;
					    u_xlat1.y = floor(u_xlat6.x);
					    u_xlat1.xy = min(u_xlat1.xy, vec2(1.0, 1.10000002));
					    u_xlat1.x = u_xlat1.x * u_xlat1.y + u_xlat11.x;
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xxx + (-u_xlat10_0.xyz);
					    SV_Target0.xyz = vec3(vec3(_Fade, _Fade, _Fade)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					; Bound: 495
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %30 %472 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpMemberDecorate %10 0 Offset 10 
					                                                  OpMemberDecorate %10 1 Offset 10 
					                                                  OpMemberDecorate %10 2 Offset 10 
					                                                  OpMemberDecorate %10 3 RelaxedPrecision 
					                                                  OpMemberDecorate %10 3 Offset 10 
					                                                  OpDecorate %10 Block 
					                                                  OpDecorate %12 DescriptorSet 12 
					                                                  OpDecorate %12 Binding 12 
					                                                  OpDecorate vs_TEXCOORD0 Location 30 
					                                                  OpDecorate %35 RelaxedPrecision 
					                                                  OpDecorate %36 RelaxedPrecision 
					                                                  OpDecorate %39 RelaxedPrecision 
					                                                  OpDecorate %40 RelaxedPrecision 
					                                                  OpDecorate %204 RelaxedPrecision 
					                                                  OpDecorate %207 RelaxedPrecision 
					                                                  OpDecorate %207 DescriptorSet 207 
					                                                  OpDecorate %207 Binding 207 
					                                                  OpDecorate %208 RelaxedPrecision 
					                                                  OpDecorate %211 RelaxedPrecision 
					                                                  OpDecorate %211 DescriptorSet 211 
					                                                  OpDecorate %211 Binding 211 
					                                                  OpDecorate %212 RelaxedPrecision 
					                                                  OpDecorate %217 RelaxedPrecision 
					                                                  OpDecorate %234 RelaxedPrecision 
					                                                  OpDecorate %235 RelaxedPrecision 
					                                                  OpDecorate %236 RelaxedPrecision 
					                                                  OpDecorate %241 RelaxedPrecision 
					                                                  OpDecorate %242 RelaxedPrecision 
					                                                  OpDecorate %243 RelaxedPrecision 
					                                                  OpDecorate %246 RelaxedPrecision 
					                                                  OpDecorate %247 RelaxedPrecision 
					                                                  OpDecorate %248 RelaxedPrecision 
					                                                  OpDecorate %251 RelaxedPrecision 
					                                                  OpDecorate %252 RelaxedPrecision 
					                                                  OpDecorate %253 RelaxedPrecision 
					                                                  OpDecorate %254 RelaxedPrecision 
					                                                  OpDecorate %255 RelaxedPrecision 
					                                                  OpDecorate %256 RelaxedPrecision 
					                                                  OpDecorate %257 RelaxedPrecision 
					                                                  OpDecorate %260 RelaxedPrecision 
					                                                  OpDecorate %261 RelaxedPrecision 
					                                                  OpDecorate %264 RelaxedPrecision 
					                                                  OpDecorate %265 RelaxedPrecision 
					                                                  OpDecorate %266 RelaxedPrecision 
					                                                  OpDecorate %267 RelaxedPrecision 
					                                                  OpDecorate %268 RelaxedPrecision 
					                                                  OpDecorate %269 RelaxedPrecision 
					                                                  OpDecorate %270 RelaxedPrecision 
					                                                  OpDecorate %301 RelaxedPrecision 
					                                                  OpDecorate %302 RelaxedPrecision 
					                                                  OpDecorate %303 RelaxedPrecision 
					                                                  OpDecorate %466 RelaxedPrecision 
					                                                  OpDecorate %467 RelaxedPrecision 
					                                                  OpDecorate %472 Location 472 
					                                                  OpDecorate %487 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 4 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_4* %9 = OpVariable Private 
					                                          %10 = OpTypeStruct %6 %6 %7 %7 
					                                          %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32_4; f32_4;}* %12 = OpVariable Uniform 
					                                          %13 = OpTypeInt 32 1 
					                                      i32 %14 = OpConstant 0 
					                                          %15 = OpTypePointer Uniform %6 
					                                      f32 %18 = OpConstant 3,674022E-40 
					                                      f32 %20 = OpConstant 3,674022E-40 
					                                          %22 = OpTypeInt 32 0 
					                                      u32 %23 = OpConstant 0 
					                                          %24 = OpTypePointer Private %6 
					                                          %26 = OpTypeVector %6 2 
					                                          %27 = OpTypePointer Private %26 
					                           Private f32_2* %28 = OpVariable Private 
					                                          %29 = OpTypePointer Input %26 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      i32 %32 = OpConstant 3 
					                                          %33 = OpTypePointer Uniform %7 
					                           Private f32_4* %42 = OpVariable Private 
					                                      f32 %44 = OpConstant 3,674022E-40 
					                                    f32_2 %45 = OpConstantComposite %44 %44 
					                                      f32 %51 = OpConstant 3,674022E-40 
					                                    f32_2 %52 = OpConstantComposite %51 %51 
					                             Private f32* %56 = OpVariable Private 
					                                      u32 %57 = OpConstant 1 
					                                      f32 %61 = OpConstant 3,674022E-40 
					                                      f32 %66 = OpConstant 3,674022E-40 
					                                          %68 = OpTypeVector %6 3 
					                                          %69 = OpTypePointer Private %68 
					                           Private f32_3* %70 = OpVariable Private 
					                                      f32 %79 = OpConstant 3,674022E-40 
					                                      f32 %92 = OpConstant 3,674022E-40 
					                                    f32_2 %93 = OpConstantComposite %92 %92 
					                                     f32 %100 = OpConstant 3,674022E-40 
					                                   f32_2 %101 = OpConstantComposite %100 %100 
					                                     f32 %103 = OpConstant 3,674022E-40 
					                                   f32_2 %104 = OpConstantComposite %103 %103 
					                                     f32 %110 = OpConstant 3,674022E-40 
					                                     f32 %118 = OpConstant 3,674022E-40 
					                                     f32 %130 = OpConstant 3,674022E-40 
					                                     f32 %131 = OpConstant 3,674022E-40 
					                                     f32 %132 = OpConstant 3,674022E-40 
					                                   f32_3 %133 = OpConstantComposite %130 %131 %132 
					                          Private f32_2* %135 = OpVariable Private 
					                                     f32 %139 = OpConstant 3,674022E-40 
					                                   f32_2 %140 = OpConstantComposite %20 %139 
					                                     u32 %145 = OpConstant 2 
					                                     f32 %164 = OpConstant 3,674022E-40 
					                                     f32 %172 = OpConstant 3,674022E-40 
					                          Private f32_3* %175 = OpVariable Private 
					                                     f32 %178 = OpConstant 3,674022E-40 
					                                     f32 %185 = OpConstant 3,674022E-40 
					                                     f32 %201 = OpConstant 3,674022E-40 
					                                   f32_2 %202 = OpConstantComposite %185 %201 
					                          Private f32_3* %204 = OpVariable Private 
					                                         %205 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                         %206 = OpTypePointer UniformConstant %205 
					    UniformConstant read_only Texture2D* %207 = OpVariable UniformConstant 
					                                         %209 = OpTypeSampler 
					                                         %210 = OpTypePointer UniformConstant %209 
					                UniformConstant sampler* %211 = OpVariable UniformConstant 
					                                         %213 = OpTypeSampledImage %205 
					                                     i32 %218 = OpConstant 1 
					                          Private f32_3* %234 = OpVariable Private 
					                          Private f32_3* %242 = OpVariable Private 
					                                     f32 %244 = OpConstant 3,674022E-40 
					                                   f32_3 %245 = OpConstantComposite %244 %244 %244 
					                          Private f32_3* %247 = OpVariable Private 
					                                     f32 %249 = OpConstant 3,674022E-40 
					                                   f32_3 %250 = OpConstantComposite %249 %244 %249 
					                                     f32 %258 = OpConstant 3,674022E-40 
					                                   f32_3 %259 = OpConstantComposite %258 %258 %258 
					                                     f32 %262 = OpConstant 3,674022E-40 
					                                   f32_3 %263 = OpConstantComposite %262 %262 %262 
					                                     f32 %277 = OpConstant 3,674022E-40 
					                                   f32_2 %282 = OpConstantComposite %66 %66 
					                                     f32 %308 = OpConstant 3,674022E-40 
					                                     f32 %309 = OpConstant 3,674022E-40 
					                                     f32 %310 = OpConstant 3,674022E-40 
					                                   f32_3 %311 = OpConstantComposite %308 %309 %310 
					                                     i32 %317 = OpConstant 2 
					                            Private f32* %321 = OpVariable Private 
					                                     f32 %324 = OpConstant 3,674022E-40 
					                                     f32 %327 = OpConstant 3,674022E-40 
					                                     f32 %334 = OpConstant 3,674022E-40 
					                                     f32 %340 = OpConstant 3,674022E-40 
					                                     f32 %356 = OpConstant 3,674022E-40 
					                                     f32 %357 = OpConstant 3,674022E-40 
					                                     f32 %358 = OpConstant 3,674022E-40 
					                                   f32_3 %359 = OpConstantComposite %356 %357 %358 
					                                   f32_2 %379 = OpConstantComposite %185 %185 
					                                     f32 %385 = OpConstant 3,674022E-40 
					                                     f32 %386 = OpConstant 3,674022E-40 
					                                   f32_2 %387 = OpConstantComposite %385 %386 
					                                     f32 %396 = OpConstant 3,674022E-40 
					                          Private f32_3* %407 = OpVariable Private 
					                                     f32 %411 = OpConstant 3,674022E-40 
					                                     f32 %412 = OpConstant 3,674022E-40 
					                                   f32_2 %413 = OpConstantComposite %411 %412 
					                                     f32 %419 = OpConstant 3,674022E-40 
					                                     f32 %432 = OpConstant 3,674022E-40 
					                                     f32 %438 = OpConstant 3,674022E-40 
					                                     f32 %447 = OpConstant 3,674022E-40 
					                                   f32_2 %448 = OpConstantComposite %66 %447 
					                                         %471 = OpTypePointer Output %7 
					                           Output f32_4* %472 = OpVariable Output 
					                                     u32 %491 = OpConstant 3 
					                                         %492 = OpTypePointer Output %6 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                             Uniform f32* %16 = OpAccessChain %12 %14 
					                                      f32 %17 = OpLoad %16 
					                                      f32 %19 = OpFMul %17 %18 
					                                      f32 %21 = OpFAdd %19 %20 
					                             Private f32* %25 = OpAccessChain %9 %23 
					                                                  OpStore %25 %21 
					                                    f32_2 %31 = OpLoad vs_TEXCOORD0 
					                           Uniform f32_4* %34 = OpAccessChain %12 %32 
					                                    f32_4 %35 = OpLoad %34 
					                                    f32_2 %36 = OpVectorShuffle %35 %35 0 1 
					                                    f32_2 %37 = OpFMul %31 %36 
					                           Uniform f32_4* %38 = OpAccessChain %12 %32 
					                                    f32_4 %39 = OpLoad %38 
					                                    f32_2 %40 = OpVectorShuffle %39 %39 2 3 
					                                    f32_2 %41 = OpFAdd %37 %40 
					                                                  OpStore %28 %41 
					                                    f32_2 %43 = OpLoad %28 
					                                    f32_2 %46 = OpFAdd %43 %45 
					                                    f32_4 %47 = OpLoad %42 
					                                    f32_4 %48 = OpVectorShuffle %47 %46 4 5 2 3 
					                                                  OpStore %42 %48 
					                                    f32_4 %49 = OpLoad %42 
					                                    f32_2 %50 = OpVectorShuffle %49 %49 0 1 
					                                    f32_2 %53 = OpFMul %50 %52 
					                                    f32_4 %54 = OpLoad %42 
					                                    f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
					                                                  OpStore %42 %55 
					                             Private f32* %58 = OpAccessChain %42 %57 
					                                      f32 %59 = OpLoad %58 
					                                      f32 %60 = OpExtInst %1 4 %59 
					                                      f32 %62 = OpFMul %60 %61 
					                                                  OpStore %56 %62 
					                                      f32 %63 = OpLoad %56 
					                                      f32 %64 = OpLoad %56 
					                                      f32 %65 = OpFMul %63 %64 
					                                      f32 %67 = OpFAdd %65 %66 
					                                                  OpStore %56 %67 
					                                      f32 %71 = OpLoad %56 
					                             Private f32* %72 = OpAccessChain %42 %23 
					                                      f32 %73 = OpLoad %72 
					                                      f32 %74 = OpFMul %71 %73 
					                             Private f32* %75 = OpAccessChain %70 %23 
					                                                  OpStore %75 %74 
					                             Private f32* %76 = OpAccessChain %70 %23 
					                                      f32 %77 = OpLoad %76 
					                                      f32 %78 = OpExtInst %1 4 %77 
					                                      f32 %80 = OpFMul %78 %79 
					                                                  OpStore %56 %80 
					                                      f32 %81 = OpLoad %56 
					                                      f32 %82 = OpLoad %56 
					                                      f32 %83 = OpFMul %81 %82 
					                                      f32 %84 = OpFAdd %83 %66 
					                                                  OpStore %56 %84 
					                                      f32 %85 = OpLoad %56 
					                             Private f32* %86 = OpAccessChain %42 %57 
					                                      f32 %87 = OpLoad %86 
					                                      f32 %88 = OpFMul %85 %87 
					                             Private f32* %89 = OpAccessChain %70 %57 
					                                                  OpStore %89 %88 
					                                    f32_3 %90 = OpLoad %70 
					                                    f32_2 %91 = OpVectorShuffle %90 %90 0 1 
					                                    f32_2 %94 = OpFMul %91 %93 
					                                    f32_2 %95 = OpFAdd %94 %93 
					                                    f32_4 %96 = OpLoad %42 
					                                    f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
					                                                  OpStore %42 %97 
					                                    f32_4 %98 = OpLoad %42 
					                                    f32_2 %99 = OpVectorShuffle %98 %98 0 1 
					                                   f32_2 %102 = OpFMul %99 %101 
					                                   f32_2 %105 = OpFAdd %102 %104 
					                                   f32_4 %106 = OpLoad %42 
					                                   f32_4 %107 = OpVectorShuffle %106 %105 4 5 2 3 
					                                                  OpStore %42 %107 
					                                   f32_4 %108 = OpLoad %42 
					                                   f32_2 %109 = OpVectorShuffle %108 %108 0 1 
					                                   f32_2 %111 = OpCompositeConstruct %110 %110 
					                                   f32_2 %112 = OpCompositeConstruct %66 %66 
					                                   f32_2 %113 = OpExtInst %1 43 %109 %111 %112 
					                                   f32_4 %114 = OpLoad %42 
					                                   f32_4 %115 = OpVectorShuffle %114 %113 4 5 2 3 
					                                                  OpStore %42 %115 
					                            Private f32* %116 = OpAccessChain %42 %57 
					                                     f32 %117 = OpLoad %116 
					                                     f32 %119 = OpFMul %117 %118 
					                            Private f32* %120 = OpAccessChain %9 %23 
					                                     f32 %121 = OpLoad %120 
					                                     f32 %122 = OpFAdd %119 %121 
					                            Private f32* %123 = OpAccessChain %9 %23 
					                                                  OpStore %123 %122 
					                            Private f32* %124 = OpAccessChain %9 %23 
					                                     f32 %125 = OpLoad %124 
					                                     f32 %126 = OpExtInst %1 13 %125 
					                            Private f32* %127 = OpAccessChain %9 %23 
					                                                  OpStore %127 %126 
					                                   f32_4 %128 = OpLoad %42 
					                                   f32_3 %129 = OpVectorShuffle %128 %128 1 1 0 
					                                   f32_3 %134 = OpFMul %129 %133 
					                                                  OpStore %70 %134 
					                            Uniform f32* %136 = OpAccessChain %12 %14 
					                                     f32 %137 = OpLoad %136 
					                                   f32_2 %138 = OpCompositeConstruct %137 %137 
					                                   f32_2 %141 = OpFMul %138 %140 
					                                   f32_3 %142 = OpLoad %70 
					                                   f32_2 %143 = OpVectorShuffle %142 %142 0 1 
					                                   f32_2 %144 = OpFAdd %141 %143 
					                                                  OpStore %135 %144 
					                            Private f32* %146 = OpAccessChain %70 %145 
					                                     f32 %147 = OpLoad %146 
					                                     f32 %148 = OpExtInst %1 8 %147 
					                            Private f32* %149 = OpAccessChain %70 %23 
					                                                  OpStore %149 %148 
					                                   f32_2 %150 = OpLoad %135 
					                                   f32_2 %151 = OpExtInst %1 13 %150 
					                                                  OpStore %135 %151 
					                            Private f32* %152 = OpAccessChain %135 %57 
					                                     f32 %153 = OpLoad %152 
					                            Private f32* %154 = OpAccessChain %135 %23 
					                                     f32 %155 = OpLoad %154 
					                                     f32 %156 = OpFMul %153 %155 
					                                                  OpStore %56 %156 
					                            Private f32* %157 = OpAccessChain %9 %23 
					                                     f32 %158 = OpLoad %157 
					                                     f32 %159 = OpLoad %56 
					                                     f32 %160 = OpFMul %158 %159 
					                            Private f32* %161 = OpAccessChain %9 %23 
					                                                  OpStore %161 %160 
					                            Private f32* %162 = OpAccessChain %9 %23 
					                                     f32 %163 = OpLoad %162 
					                                     f32 %165 = OpFMul %163 %164 
					                            Private f32* %166 = OpAccessChain %42 %23 
					                                     f32 %167 = OpLoad %166 
					                                     f32 %168 = OpFAdd %165 %167 
					                                                  OpStore %56 %168 
					                            Private f32* %169 = OpAccessChain %9 %23 
					                                     f32 %170 = OpLoad %169 
					                                     f32 %171 = OpFMul %170 %164 
					                                     f32 %173 = OpFAdd %171 %172 
					                            Private f32* %174 = OpAccessChain %9 %23 
					                                                  OpStore %174 %173 
					                            Private f32* %176 = OpAccessChain %9 %23 
					                                     f32 %177 = OpLoad %176 
					                                     f32 %179 = OpFMul %177 %178 
					                            Private f32* %180 = OpAccessChain %42 %23 
					                                     f32 %181 = OpLoad %180 
					                                     f32 %182 = OpFAdd %179 %181 
					                            Private f32* %183 = OpAccessChain %175 %23 
					                                                  OpStore %183 %182 
					                                     f32 %184 = OpLoad %56 
					                                     f32 %186 = OpFAdd %184 %185 
					                            Private f32* %187 = OpAccessChain %175 %57 
					                                                  OpStore %187 %186 
					                            Private f32* %188 = OpAccessChain %42 %57 
					                                     f32 %189 = OpLoad %188 
					                                     f32 %190 = OpFAdd %189 %185 
					                            Private f32* %191 = OpAccessChain %175 %145 
					                                                  OpStore %191 %190 
					                                   f32_2 %192 = OpLoad %28 
					                                   f32_2 %193 = OpFNegate %192 
					                                   f32_3 %194 = OpLoad %175 
					                                   f32_2 %195 = OpVectorShuffle %194 %194 1 2 
					                                   f32_2 %196 = OpFAdd %193 %195 
					                                   f32_4 %197 = OpLoad %9 
					                                   f32_4 %198 = OpVectorShuffle %197 %196 4 1 2 5 
					                                                  OpStore %9 %198 
					                                   f32_3 %199 = OpLoad %175 
					                                   f32_2 %200 = OpVectorShuffle %199 %199 0 2 
					                                   f32_2 %203 = OpFAdd %200 %202 
					                                                  OpStore %135 %203 
					                     read_only Texture2D %208 = OpLoad %207 
					                                 sampler %212 = OpLoad %211 
					              read_only Texture2DSampled %214 = OpSampledImage %208 %212 
					                                   f32_2 %215 = OpLoad %135 
					                                   f32_4 %216 = OpImageSampleImplicitLod %214 %215 
					                                   f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
					                                                  OpStore %204 %217 
					                            Uniform f32* %219 = OpAccessChain %12 %218 
					                                     f32 %220 = OpLoad %219 
					                            Uniform f32* %221 = OpAccessChain %12 %218 
					                                     f32 %222 = OpLoad %221 
					                                   f32_2 %223 = OpCompositeConstruct %220 %222 
					                                     f32 %224 = OpCompositeExtract %223 0 
					                                     f32 %225 = OpCompositeExtract %223 1 
					                                   f32_2 %226 = OpCompositeConstruct %224 %225 
					                                   f32_4 %227 = OpLoad %9 
					                                   f32_2 %228 = OpVectorShuffle %227 %227 0 3 
					                                   f32_2 %229 = OpFMul %226 %228 
					                                   f32_2 %230 = OpLoad %28 
					                                   f32_2 %231 = OpFAdd %229 %230 
					                                   f32_4 %232 = OpLoad %9 
					                                   f32_4 %233 = OpVectorShuffle %232 %231 4 5 2 3 
					                                                  OpStore %9 %233 
					                     read_only Texture2D %235 = OpLoad %207 
					                                 sampler %236 = OpLoad %211 
					              read_only Texture2DSampled %237 = OpSampledImage %235 %236 
					                                   f32_4 %238 = OpLoad %9 
					                                   f32_2 %239 = OpVectorShuffle %238 %238 0 1 
					                                   f32_4 %240 = OpImageSampleImplicitLod %237 %239 
					                                   f32_3 %241 = OpVectorShuffle %240 %240 0 1 2 
					                                                  OpStore %234 %241 
					                                   f32_3 %243 = OpLoad %234 
					                                   f32_3 %246 = OpFAdd %243 %245 
					                                                  OpStore %242 %246 
					                                   f32_3 %248 = OpLoad %204 
					                                   f32_3 %251 = OpFMul %248 %250 
					                                   f32_3 %252 = OpLoad %242 
					                                   f32_3 %253 = OpFAdd %251 %252 
					                                                  OpStore %247 %253 
					                                   f32_3 %254 = OpLoad %247 
					                                   f32_3 %255 = OpLoad %247 
					                                   f32_3 %256 = OpFMul %254 %255 
					                                                  OpStore %242 %256 
					                                   f32_3 %257 = OpLoad %242 
					                                   f32_3 %260 = OpFMul %257 %259 
					                                                  OpStore %242 %260 
					                                   f32_3 %261 = OpLoad %247 
					                                   f32_3 %264 = OpFMul %261 %263 
					                                   f32_3 %265 = OpLoad %242 
					                                   f32_3 %266 = OpFAdd %264 %265 
					                                                  OpStore %247 %266 
					                                   f32_3 %267 = OpLoad %247 
					                                   f32_3 %268 = OpCompositeConstruct %110 %110 %110 
					                                   f32_3 %269 = OpCompositeConstruct %66 %66 %66 
					                                   f32_3 %270 = OpExtInst %1 43 %267 %268 %269 
					                                                  OpStore %247 %270 
					                            Private f32* %271 = OpAccessChain %42 %23 
					                                     f32 %272 = OpLoad %271 
					                            Private f32* %273 = OpAccessChain %42 %57 
					                                     f32 %274 = OpLoad %273 
					                                     f32 %275 = OpFMul %272 %274 
					                                                  OpStore %56 %275 
					                                     f32 %276 = OpLoad %56 
					                                     f32 %278 = OpFMul %276 %277 
					                                                  OpStore %56 %278 
					                                   f32_4 %279 = OpLoad %42 
					                                   f32_2 %280 = OpVectorShuffle %279 %279 0 1 
					                                   f32_2 %281 = OpFNegate %280 
					                                   f32_2 %283 = OpFAdd %281 %282 
					                                   f32_4 %284 = OpLoad %42 
					                                   f32_4 %285 = OpVectorShuffle %284 %283 4 1 5 3 
					                                                  OpStore %42 %285 
					                                     f32 %286 = OpLoad %56 
					                            Private f32* %287 = OpAccessChain %42 %23 
					                                     f32 %288 = OpLoad %287 
					                                     f32 %289 = OpFMul %286 %288 
					                                                  OpStore %56 %289 
					                            Private f32* %290 = OpAccessChain %42 %145 
					                                     f32 %291 = OpLoad %290 
					                                     f32 %292 = OpLoad %56 
					                                     f32 %293 = OpFMul %291 %292 
					                                                  OpStore %56 %293 
					                                     f32 %294 = OpLoad %56 
					                                     f32 %295 = OpExtInst %1 30 %294 
					                                                  OpStore %56 %295 
					                                     f32 %296 = OpLoad %56 
					                                     f32 %297 = OpFMul %296 %20 
					                                                  OpStore %56 %297 
					                                     f32 %298 = OpLoad %56 
					                                     f32 %299 = OpExtInst %1 29 %298 
					                                                  OpStore %56 %299 
					                                     f32 %300 = OpLoad %56 
					                                   f32_3 %301 = OpCompositeConstruct %300 %300 %300 
					                                   f32_3 %302 = OpLoad %247 
					                                   f32_3 %303 = OpFMul %301 %302 
					                                   f32_4 %304 = OpLoad %42 
					                                   f32_4 %305 = OpVectorShuffle %304 %303 4 1 5 6 
					                                                  OpStore %42 %305 
					                                   f32_4 %306 = OpLoad %42 
					                                   f32_3 %307 = OpVectorShuffle %306 %306 0 2 3 
					                                   f32_3 %312 = OpFMul %307 %311 
					                                   f32_4 %313 = OpLoad %42 
					                                   f32_4 %314 = OpVectorShuffle %313 %312 4 1 5 6 
					                                                  OpStore %42 %314 
					                            Private f32* %315 = OpAccessChain %42 %57 
					                                     f32 %316 = OpLoad %315 
					                            Uniform f32* %318 = OpAccessChain %12 %317 %57 
					                                     f32 %319 = OpLoad %318 
					                                     f32 %320 = OpFMul %316 %319 
					                                                  OpStore %56 %320 
					                            Uniform f32* %322 = OpAccessChain %12 %14 
					                                     f32 %323 = OpLoad %322 
					                                     f32 %325 = OpFMul %323 %324 
					                                                  OpStore %321 %325 
					                                     f32 %326 = OpLoad %56 
					                                     f32 %328 = OpFMul %326 %327 
					                                     f32 %329 = OpLoad %321 
					                                     f32 %330 = OpFAdd %328 %329 
					                                                  OpStore %56 %330 
					                                     f32 %331 = OpLoad %56 
					                                     f32 %332 = OpExtInst %1 13 %331 
					                                                  OpStore %56 %332 
					                                     f32 %333 = OpLoad %56 
					                                     f32 %335 = OpFMul %333 %334 
					                                     f32 %336 = OpFAdd %335 %334 
					                                                  OpStore %56 %336 
					                                     f32 %337 = OpLoad %56 
					                                     f32 %338 = OpExtInst %1 30 %337 
					                                                  OpStore %56 %338 
					                                     f32 %339 = OpLoad %56 
					                                     f32 %341 = OpFMul %339 %340 
					                                                  OpStore %56 %341 
					                                     f32 %342 = OpLoad %56 
					                                     f32 %343 = OpExtInst %1 29 %342 
					                                                  OpStore %56 %343 
					                                     f32 %344 = OpLoad %56 
					                                     f32 %345 = OpFMul %344 %139 
					                                     f32 %346 = OpFAdd %345 %258 
					                                                  OpStore %56 %346 
					                                     f32 %347 = OpLoad %56 
					                                   f32_3 %348 = OpCompositeConstruct %347 %347 %347 
					                                   f32_4 %349 = OpLoad %42 
					                                   f32_3 %350 = OpVectorShuffle %349 %349 0 2 3 
					                                   f32_3 %351 = OpFMul %348 %350 
					                                   f32_4 %352 = OpLoad %42 
					                                   f32_4 %353 = OpVectorShuffle %352 %351 4 1 5 6 
					                                                  OpStore %42 %353 
					                                   f32_4 %354 = OpLoad %42 
					                                   f32_3 %355 = OpVectorShuffle %354 %354 0 2 3 
					                                     f32 %360 = OpDot %355 %359 
					                                                  OpStore %56 %360 
					                            Private f32* %361 = OpAccessChain %42 %57 
					                                     f32 %362 = OpLoad %361 
					                                     f32 %363 = OpFMul %362 %132 
					                            Private f32* %364 = OpAccessChain %42 %23 
					                                                  OpStore %364 %363 
					                            Private f32* %365 = OpAccessChain %42 %23 
					                                     f32 %366 = OpLoad %365 
					                                     f32 %367 = OpExtInst %1 8 %366 
					                            Private f32* %368 = OpAccessChain %70 %57 
					                                                  OpStore %368 %367 
					                                   f32_3 %369 = OpLoad %70 
					                                   f32_2 %370 = OpVectorShuffle %369 %369 0 1 
					                            Uniform f32* %371 = OpAccessChain %12 %14 
					                                     f32 %372 = OpLoad %371 
					                                   f32_2 %373 = OpCompositeConstruct %372 %372 
					                                   f32_2 %374 = OpFMul %370 %373 
					                                   f32_4 %375 = OpLoad %42 
					                                   f32_4 %376 = OpVectorShuffle %375 %374 4 1 5 3 
					                                                  OpStore %42 %376 
					                                   f32_4 %377 = OpLoad %42 
					                                   f32_2 %378 = OpVectorShuffle %377 %377 0 2 
					                                   f32_2 %380 = OpFMul %378 %379 
					                                   f32_4 %381 = OpLoad %42 
					                                   f32_4 %382 = OpVectorShuffle %381 %380 4 1 5 3 
					                                                  OpStore %42 %382 
					                                   f32_4 %383 = OpLoad %42 
					                                   f32_2 %384 = OpVectorShuffle %383 %383 0 2 
					                                     f32 %388 = OpDot %384 %387 
					                            Private f32* %389 = OpAccessChain %42 %23 
					                                                  OpStore %389 %388 
					                            Private f32* %390 = OpAccessChain %42 %23 
					                                     f32 %391 = OpLoad %390 
					                                     f32 %392 = OpExtInst %1 13 %391 
					                            Private f32* %393 = OpAccessChain %42 %23 
					                                                  OpStore %393 %392 
					                            Private f32* %394 = OpAccessChain %42 %23 
					                                     f32 %395 = OpLoad %394 
					                                     f32 %397 = OpFMul %395 %396 
					                            Private f32* %398 = OpAccessChain %42 %23 
					                                                  OpStore %398 %397 
					                            Private f32* %399 = OpAccessChain %42 %23 
					                                     f32 %400 = OpLoad %399 
					                                     f32 %401 = OpExtInst %1 10 %400 
					                            Private f32* %402 = OpAccessChain %42 %23 
					                                                  OpStore %402 %401 
					                            Private f32* %403 = OpAccessChain %42 %23 
					                                     f32 %404 = OpLoad %403 
					                                     f32 %405 = OpFAdd %404 %79 
					                            Private f32* %406 = OpAccessChain %42 %23 
					                                                  OpStore %406 %405 
					                            Uniform f32* %408 = OpAccessChain %12 %14 
					                                     f32 %409 = OpLoad %408 
					                                   f32_2 %410 = OpCompositeConstruct %409 %409 
					                                   f32_2 %414 = OpFMul %410 %413 
					                                   f32_3 %415 = OpLoad %407 
					                                   f32_3 %416 = OpVectorShuffle %415 %414 0 3 4 
					                                                  OpStore %407 %416 
					                            Private f32* %417 = OpAccessChain %42 %57 
					                                     f32 %418 = OpLoad %417 
					                                     f32 %420 = OpFMul %418 %419 
					                            Private f32* %421 = OpAccessChain %407 %57 
					                                     f32 %422 = OpLoad %421 
					                                     f32 %423 = OpFAdd %420 %422 
					                            Private f32* %424 = OpAccessChain %407 %23 
					                                                  OpStore %424 %423 
					                                   f32_3 %425 = OpLoad %407 
					                                   f32_2 %426 = OpVectorShuffle %425 %425 0 2 
					                                   f32_2 %427 = OpExtInst %1 13 %426 
					                                   f32_3 %428 = OpLoad %407 
					                                   f32_3 %429 = OpVectorShuffle %428 %427 3 4 2 
					                                                  OpStore %407 %429 
					                            Private f32* %430 = OpAccessChain %407 %57 
					                                     f32 %431 = OpLoad %430 
					                                     f32 %433 = OpFMul %431 %432 
					                                     f32 %434 = OpFAdd %433 %66 
					                            Private f32* %435 = OpAccessChain %135 %23 
					                                                  OpStore %435 %434 
					                            Private f32* %436 = OpAccessChain %407 %23 
					                                     f32 %437 = OpLoad %436 
					                                     f32 %439 = OpFAdd %437 %438 
					                            Private f32* %440 = OpAccessChain %407 %23 
					                                                  OpStore %440 %439 
					                            Private f32* %441 = OpAccessChain %407 %23 
					                                     f32 %442 = OpLoad %441 
					                                     f32 %443 = OpExtInst %1 8 %442 
					                            Private f32* %444 = OpAccessChain %42 %57 
					                                                  OpStore %444 %443 
					                                   f32_4 %445 = OpLoad %42 
					                                   f32_2 %446 = OpVectorShuffle %445 %445 0 1 
					                                   f32_2 %449 = OpExtInst %1 37 %446 %448 
					                                   f32_4 %450 = OpLoad %42 
					                                   f32_4 %451 = OpVectorShuffle %450 %449 4 5 2 3 
					                                                  OpStore %42 %451 
					                            Private f32* %452 = OpAccessChain %42 %23 
					                                     f32 %453 = OpLoad %452 
					                            Private f32* %454 = OpAccessChain %42 %57 
					                                     f32 %455 = OpLoad %454 
					                                     f32 %456 = OpFMul %453 %455 
					                            Private f32* %457 = OpAccessChain %135 %23 
					                                     f32 %458 = OpLoad %457 
					                                     f32 %459 = OpFAdd %456 %458 
					                            Private f32* %460 = OpAccessChain %42 %23 
					                                                  OpStore %460 %459 
					                                     f32 %461 = OpLoad %56 
					                                   f32_3 %462 = OpCompositeConstruct %461 %461 %461 
					                                   f32_4 %463 = OpLoad %42 
					                                   f32_3 %464 = OpVectorShuffle %463 %463 0 0 0 
					                                   f32_3 %465 = OpFMul %462 %464 
					                                   f32_3 %466 = OpLoad %234 
					                                   f32_3 %467 = OpFNegate %466 
					                                   f32_3 %468 = OpFAdd %465 %467 
					                                   f32_4 %469 = OpLoad %42 
					                                   f32_4 %470 = OpVectorShuffle %469 %468 4 5 6 3 
					                                                  OpStore %42 %470 
					                            Uniform f32* %473 = OpAccessChain %12 %218 
					                                     f32 %474 = OpLoad %473 
					                            Uniform f32* %475 = OpAccessChain %12 %218 
					                                     f32 %476 = OpLoad %475 
					                            Uniform f32* %477 = OpAccessChain %12 %218 
					                                     f32 %478 = OpLoad %477 
					                                   f32_3 %479 = OpCompositeConstruct %474 %476 %478 
					                                     f32 %480 = OpCompositeExtract %479 0 
					                                     f32 %481 = OpCompositeExtract %479 1 
					                                     f32 %482 = OpCompositeExtract %479 2 
					                                   f32_3 %483 = OpCompositeConstruct %480 %481 %482 
					                                   f32_4 %484 = OpLoad %42 
					                                   f32_3 %485 = OpVectorShuffle %484 %484 0 1 2 
					                                   f32_3 %486 = OpFMul %483 %485 
					                                   f32_3 %487 = OpLoad %234 
					                                   f32_3 %488 = OpFAdd %486 %487 
					                                   f32_4 %489 = OpLoad %472 
					                                   f32_4 %490 = OpVectorShuffle %489 %488 4 5 6 3 
					                                                  OpStore %472 %490 
					                             Output f32* %493 = OpAccessChain %472 %491 
					                                                  OpStore %493 %66 
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
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec3 u_xlat16_4;
					vec2 u_xlat5;
					vec3 u_xlat6;
					vec2 u_xlat11;
					float u_xlat12;
					float u_xlat15;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat5.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat5.xy + vec2(-0.5, -0.5);
					    u_xlat1.xy = u_xlat1.xy * vec2(2.20000005, 2.20000005);
					    u_xlat15 = abs(u_xlat1.y) * 0.200000003;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat2.x = u_xlat15 * u_xlat1.x;
					    u_xlat15 = abs(u_xlat2.x) * 0.25;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat2.y = u_xlat15 * u_xlat1.y;
					    u_xlat1.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.920000017, 0.920000017) + vec2(0.0399999991, 0.0399999991);
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0.x = u_xlat1.y * 31.0 + u_xlat0.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.xyz = u_xlat1.yyx * vec3(21.0, 29.0, 250.0);
					    u_xlat11.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat2.xy;
					    u_xlat2.x = floor(u_xlat2.z);
					    u_xlat11.xy = sin(u_xlat11.xy);
					    u_xlat15 = u_xlat11.y * u_xlat11.x;
					    u_xlat0.x = u_xlat0.x * u_xlat15;
					    u_xlat15 = u_xlat0.x * 0.00170000002 + u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.00170000002 + 0.0250000004;
					    u_xlat3.x = u_xlat0.x * 0.75 + u_xlat1.x;
					    u_xlat3.y = u_xlat15 + 0.00100000005;
					    u_xlat3.z = u_xlat1.y + 0.00100000005;
					    u_xlat0.xw = (-u_xlat5.xy) + u_xlat3.yz;
					    u_xlat11.xy = u_xlat3.xz + vec2(0.00100000005, -0.0149999997);
					    u_xlat10_3 = texture(_MainTex, u_xlat11.xy);
					    u_xlat0.xy = vec2(vec2(_Fade, _Fade)) * u_xlat0.xw + u_xlat5.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_4.xyz = u_xlat10_0.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat16_4.xyz;
					    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz;
					    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_4.xyz;
					    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
					    u_xlat15 = u_xlat1.x * u_xlat1.y;
					    u_xlat15 = u_xlat15 * 16.0;
					    u_xlat1.xz = (-u_xlat1.xy) + vec2(1.0, 1.0);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat15 = u_xlat1.z * u_xlat15;
					    u_xlat15 = log2(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.300000012;
					    u_xlat15 = exp2(u_xlat15);
					    u_xlat1.xzw = vec3(u_xlat15) * u_xlat16_3.xyz;
					    u_xlat1.xzw = u_xlat1.xzw * vec3(3.66000009, 2.94000006, 2.66000009);
					    u_xlat15 = u_xlat1.y * _ScreenResolution.y;
					    u_xlat12 = _TimeX * 3.5;
					    u_xlat15 = u_xlat15 * 1.5 + u_xlat12;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.349999994 + 0.349999994;
					    u_xlat15 = log2(u_xlat15);
					    u_xlat15 = u_xlat15 * 1.70000005;
					    u_xlat15 = exp2(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.699999988 + 0.400000006;
					    u_xlat1.xzw = vec3(u_xlat15) * u_xlat1.xzw;
					    u_xlat15 = dot(u_xlat1.xzw, vec3(0.222000003, 0.707000017, 0.0710000023));
					    u_xlat1.x = u_xlat1.y * 250.0;
					    u_xlat2.y = floor(u_xlat1.x);
					    u_xlat1.xz = u_xlat2.xy * vec2(_TimeX);
					    u_xlat1.xz = u_xlat1.xz * vec2(0.00100000005, 0.00100000005);
					    u_xlat1.x = dot(u_xlat1.xz, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + 0.25;
					    u_xlat6.yz = vec2(_TimeX) * vec2(2.5999999, 110.0);
					    u_xlat6.x = u_xlat1.y * 6.0 + u_xlat6.y;
					    u_xlat6.xy = sin(u_xlat6.xz);
					    u_xlat11.x = u_xlat6.y * 0.00999999978 + 1.0;
					    u_xlat6.x = u_xlat6.x + 1.95000005;
					    u_xlat1.y = floor(u_xlat6.x);
					    u_xlat1.xy = min(u_xlat1.xy, vec2(1.0, 1.10000002));
					    u_xlat1.x = u_xlat1.x * u_xlat1.y + u_xlat11.x;
					    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xxx + (-u_xlat10_0.xyz);
					    SV_Target0.xyz = vec3(vec3(_Fade, _Fade, _Fade)) * u_xlat1.xyz + u_xlat10_0.xyz;
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