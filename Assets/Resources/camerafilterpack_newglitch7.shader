Shader "CameraFilterPack/CameraFilterPack_NewGlitch7" {
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
			GpuProgramID 49832
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
					uniform 	float _Speed;
					uniform 	float LightMin;
					uniform 	float LightMax;
					uniform 	vec4 _ScreenResolution;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec4 u_xlat16_8;
					vec4 u_xlat10_8;
					vec4 u_xlat16_9;
					vec4 u_xlat10_9;
					vec3 u_xlat12;
					bool u_xlatb12;
					vec2 u_xlat20;
					bool u_xlatb23;
					vec2 u_xlat26;
					float u_xlat30;
					bool u_xlatb33;
					void main()
					{
					    u_xlat0.x = _ScreenResolution.y / _ScreenResolution.x;
					    u_xlat0.y = u_xlat0.x * vs_TEXCOORD0.y;
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat20.xy = u_xlat0.xy * vec2(1.0, 1.778);
					    u_xlat10_1 = texture(_MainTex, u_xlat20.xy);
					    u_xlat20.x = _TimeX * _Speed;
					    u_xlat20.x = u_xlat20.x * 7.67999983;
					    u_xlat30 = floor(u_xlat20.x);
					    u_xlat20.x = fract(u_xlat20.x);
					    u_xlat2.x = u_xlat30 * 60.0;
					    u_xlat12.x = u_xlat20.x * u_xlat20.x;
					    u_xlat20.x = (-u_xlat20.x) * 2.0 + 3.0;
					    u_xlat20.x = u_xlat20.x * u_xlat12.x;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * 43812.1758;
					    u_xlat12.xyz = vec3(u_xlat30) * vec3(60.0, 60.0, 60.0) + vec3(1.0, 59.0, 60.0);
					    u_xlat12.xyz = sin(u_xlat12.xyz);
					    u_xlat2.yzw = u_xlat12.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2 = fract(u_xlat2);
					    u_xlat30 = (-u_xlat2.x) + u_xlat2.y;
					    u_xlat30 = u_xlat20.x * u_xlat30 + u_xlat2.x;
					    u_xlat2.x = (-u_xlat2.z) + u_xlat2.w;
					    u_xlat2.x = u_xlat20.x * u_xlat2.x + u_xlat2.z;
					    u_xlat2.x = (-u_xlat30) + u_xlat2.x;
					    u_xlat20.x = u_xlat20.x * u_xlat2.x + u_xlat30;
					    u_xlat20.x = log2(abs(u_xlat20.x));
					    u_xlat20.x = u_xlat20.x * 15.0;
					    u_xlat20.x = exp2(u_xlat20.x);
					    u_xlat20.x = min(u_xlat20.x, 1.0);
					    u_xlat2.x = float(1.0) / _ScreenResolution.x;
					    u_xlat3.y = 1.0;
					    u_xlat4.y = 1.0;
					    u_xlat5 = u_xlat10_1;
					    u_xlat6.xy = u_xlat0.xy;
					    u_xlat30 = 0.0;
					    while(true){
					        u_xlatb33 = u_xlat30>=6.0;
					        if(u_xlatb33){break;}
					        u_xlat26.xy = u_xlat6.xy * vec2(28.0, 28.0);
					        u_xlat26.xy = fract(u_xlat26.xy);
					        u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
					        u_xlat26.xy = u_xlat20.xx * u_xlat26.xy + vec2(1.0, 1.0);
					        u_xlat26.xy = log2(u_xlat26.xy);
					        u_xlat26.xy = u_xlat26.xy * vec2(0.100000001, 0.100000001);
					        u_xlat26.xy = exp2(u_xlat26.xy);
					        u_xlat6.xy = u_xlat6.xy / u_xlat26.xy;
					        u_xlat7 = max(u_xlat5, vec4(vec4(LightMin, LightMin, LightMin, LightMin)));
					        u_xlat7 = min(u_xlat7, vec4(vec4(LightMax, LightMax, LightMax, LightMax)));
					        u_xlat2.y = u_xlat30 / _ScreenResolution.y;
					        u_xlat26.xy = u_xlat6.xy * vec2(1.0, 1.778) + u_xlat2.xy;
					        u_xlat10_8 = texture(_MainTex, u_xlat26.xy);
					        u_xlat16_8 = max(u_xlat10_8, vec4(0.0, 0.0, 0.0, 0.0));
					        u_xlat16_8 = min(u_xlat16_8, vec4(2.0, 2.0, 2.0, 2.0));
					        u_xlat16_8 = u_xlat16_8 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat7 = u_xlat7 / u_xlat16_8;
					        u_xlat2.zw = (-vec2(u_xlat30)) / _ScreenResolution.yx;
					        u_xlat8 = u_xlat6.xyxy * vec4(1.0, 1.778, 1.0, 1.778) + u_xlat2.xzwy;
					        u_xlat10_9 = texture(_MainTex, u_xlat8.xy);
					        u_xlat16_9 = max(u_xlat10_9, vec4(0.0, 0.0, 0.0, 0.0));
					        u_xlat16_9 = min(u_xlat16_9, vec4(2.0, 2.0, 2.0, 2.0));
					        u_xlat16_9 = u_xlat16_9 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat7 = u_xlat7 * u_xlat16_9;
					        u_xlat10_8 = texture(_MainTex, u_xlat8.zw);
					        u_xlat16_8 = max(u_xlat10_8, vec4(0.0, 0.0, 0.0, 0.0));
					        u_xlat16_8 = min(u_xlat16_8, vec4(2.0, 2.0, 2.0, 2.0));
					        u_xlat16_8 = u_xlat16_8 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat7 = u_xlat7 * u_xlat16_8;
					        u_xlat12.xy = u_xlat6.xy * vec2(1.0, 1.778) + u_xlat2.wz;
					        u_xlat10_8 = texture(_MainTex, u_xlat12.xy);
					        u_xlat16_8 = max(u_xlat10_8, vec4(0.0, 0.0, 0.0, 0.0));
					        u_xlat16_8 = min(u_xlat16_8, vec4(2.0, 2.0, 2.0, 2.0));
					        u_xlat16_8 = u_xlat16_8 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat5 = u_xlat7 / u_xlat16_8;
					        u_xlat12.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat12.x = sqrt(u_xlat12.x);
					        u_xlat12.xy = (-u_xlat12.xx) + vec2(1.0, 0.840000033);
					        u_xlatb12 = 0.5>=u_xlat12.x;
					        u_xlat3.x = u_xlatb12 ? 1.0 : float(0.0);
					        u_xlat3.z = (u_xlatb12) ? 0.0 : 1.0;
					        u_xlat12.x = u_xlat12.y * 1.49253738;
					        u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
					        u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
					        u_xlat7.y = -abs(u_xlat12.x) + 1.0;
					        u_xlat7.xz = (-u_xlat7.yy) + vec2(1.0, 1.0);
					        u_xlat12.xyz = u_xlat3.xyz * u_xlat7.xyz;
					        u_xlat12.xyz = log2(u_xlat12.xyz);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(0.449999988, 0.449999988, 0.449999988);
					        u_xlat12.xyz = exp2(u_xlat12.xyz);
					        u_xlat12.xyz = (-u_xlat12.xyz) * vec3(0.0250000004, 0.0250000004, 0.0250000004) + vec3(1.00999999, 1.00999999, 1.00999999);
					        u_xlat12.xyz = u_xlat5.xyz / u_xlat12.xyz;
					        u_xlat3.x = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat3.x = sqrt(u_xlat3.x);
					        u_xlatb23 = 0.5>=u_xlat3.x;
					        u_xlat4.x = u_xlatb23 ? 1.0 : float(0.0);
					        u_xlat4.z = (u_xlatb23) ? 0.0 : 1.0;
					        u_xlat3.x = u_xlat3.x + -0.159999996;
					        u_xlat3.x = u_xlat3.x * 1.49253738;
					        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					        u_xlat3.x = u_xlat3.x * 2.0 + -1.0;
					        u_xlat7.y = -abs(u_xlat3.x) + 1.0;
					        u_xlat7.xz = (-u_xlat7.yy) + vec2(1.0, 1.0);
					        u_xlat3.xzw = u_xlat4.xyz * u_xlat7.xyz;
					        u_xlat3.xzw = log2(u_xlat3.xzw);
					        u_xlat3.xzw = u_xlat3.xzw * vec3(0.449999988, 0.449999988, 0.449999988);
					        u_xlat3.xzw = exp2(u_xlat3.xzw);
					        u_xlat3.xzw = u_xlat3.xzw * vec3(0.00999999978, 0.00999999978, 0.00999999978) + vec3(1.0, 1.0, 1.0);
					        u_xlat5.xyz = u_xlat12.xyz * u_xlat3.xzw;
					        u_xlat30 = u_xlat30 + 1.0;
					    }
					    u_xlat0 = u_xlat5 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					    u_xlat1 = dot(u_xlat0, u_xlat0);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat0 = u_xlat0 / vec4(u_xlat1);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.200000003, -0.200000003, -0.200000003, -0.200000003);
					    SV_Target0 = u_xlat0 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976);
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
					; Bound: 587
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %30 %583 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpMemberDecorate %10 0 Offset 10 
					                                                     OpMemberDecorate %10 1 Offset 10 
					                                                     OpMemberDecorate %10 2 Offset 10 
					                                                     OpMemberDecorate %10 3 Offset 10 
					                                                     OpMemberDecorate %10 4 Offset 10 
					                                                     OpDecorate %10 Block 
					                                                     OpDecorate %12 DescriptorSet 12 
					                                                     OpDecorate %12 Binding 12 
					                                                     OpDecorate vs_TEXCOORD0 Location 30 
					                                                     OpDecorate %47 RelaxedPrecision 
					                                                     OpDecorate %50 RelaxedPrecision 
					                                                     OpDecorate %50 DescriptorSet 50 
					                                                     OpDecorate %50 Binding 50 
					                                                     OpDecorate %51 RelaxedPrecision 
					                                                     OpDecorate %54 RelaxedPrecision 
					                                                     OpDecorate %54 DescriptorSet 54 
					                                                     OpDecorate %54 Binding 54 
					                                                     OpDecorate %55 RelaxedPrecision 
					                                                     OpDecorate %206 RelaxedPrecision 
					                                                     OpDecorate %300 RelaxedPrecision 
					                                                     OpDecorate %301 RelaxedPrecision 
					                                                     OpDecorate %302 RelaxedPrecision 
					                                                     OpDecorate %306 RelaxedPrecision 
					                                                     OpDecorate %307 RelaxedPrecision 
					                                                     OpDecorate %309 RelaxedPrecision 
					                                                     OpDecorate %310 RelaxedPrecision 
					                                                     OpDecorate %312 RelaxedPrecision 
					                                                     OpDecorate %313 RelaxedPrecision 
					                                                     OpDecorate %316 RelaxedPrecision 
					                                                     OpDecorate %318 RelaxedPrecision 
					                                                     OpDecorate %320 RelaxedPrecision 
					                                                     OpDecorate %340 RelaxedPrecision 
					                                                     OpDecorate %341 RelaxedPrecision 
					                                                     OpDecorate %342 RelaxedPrecision 
					                                                     OpDecorate %347 RelaxedPrecision 
					                                                     OpDecorate %348 RelaxedPrecision 
					                                                     OpDecorate %349 RelaxedPrecision 
					                                                     OpDecorate %350 RelaxedPrecision 
					                                                     OpDecorate %351 RelaxedPrecision 
					                                                     OpDecorate %352 RelaxedPrecision 
					                                                     OpDecorate %353 RelaxedPrecision 
					                                                     OpDecorate %354 RelaxedPrecision 
					                                                     OpDecorate %356 RelaxedPrecision 
					                                                     OpDecorate %358 RelaxedPrecision 
					                                                     OpDecorate %359 RelaxedPrecision 
					                                                     OpDecorate %364 RelaxedPrecision 
					                                                     OpDecorate %365 RelaxedPrecision 
					                                                     OpDecorate %366 RelaxedPrecision 
					                                                     OpDecorate %367 RelaxedPrecision 
					                                                     OpDecorate %368 RelaxedPrecision 
					                                                     OpDecorate %369 RelaxedPrecision 
					                                                     OpDecorate %370 RelaxedPrecision 
					                                                     OpDecorate %372 RelaxedPrecision 
					                                                     OpDecorate %381 RelaxedPrecision 
					                                                     OpDecorate %382 RelaxedPrecision 
					                                                     OpDecorate %387 RelaxedPrecision 
					                                                     OpDecorate %388 RelaxedPrecision 
					                                                     OpDecorate %389 RelaxedPrecision 
					                                                     OpDecorate %390 RelaxedPrecision 
					                                                     OpDecorate %391 RelaxedPrecision 
					                                                     OpDecorate %392 RelaxedPrecision 
					                                                     OpDecorate %393 RelaxedPrecision 
					                                                     OpDecorate %395 RelaxedPrecision 
					                                                     OpDecorate %583 Location 583 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypeStruct %6 %6 %6 %6 %7 
					                                             %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                             %13 = OpTypeInt 32 1 
					                                         i32 %14 = OpConstant 4 
					                                             %15 = OpTypeInt 32 0 
					                                         u32 %16 = OpConstant 1 
					                                             %17 = OpTypePointer Uniform %6 
					                                         u32 %20 = OpConstant 0 
					                                             %24 = OpTypePointer Private %6 
					                                             %28 = OpTypeVector %6 2 
					                                             %29 = OpTypePointer Input %28 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                             %31 = OpTypePointer Input %6 
					                                             %39 = OpTypePointer Private %28 
					                              Private f32_2* %40 = OpVariable Private 
					                                         f32 %43 = OpConstant 3,674022E-40 
					                                         f32 %44 = OpConstant 3,674022E-40 
					                                       f32_2 %45 = OpConstantComposite %43 %44 
					                              Private f32_4* %47 = OpVariable Private 
					                                             %48 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %49 = OpTypePointer UniformConstant %48 
					        UniformConstant read_only Texture2D* %50 = OpVariable UniformConstant 
					                                             %52 = OpTypeSampler 
					                                             %53 = OpTypePointer UniformConstant %52 
					                    UniformConstant sampler* %54 = OpVariable UniformConstant 
					                                             %56 = OpTypeSampledImage %48 
					                                         i32 %60 = OpConstant 0 
					                                         i32 %63 = OpConstant 1 
					                                         f32 %70 = OpConstant 3,674022E-40 
					                                Private f32* %73 = OpVariable Private 
					                              Private f32_4* %81 = OpVariable Private 
					                                         f32 %83 = OpConstant 3,674022E-40 
					                                             %86 = OpTypeVector %6 3 
					                                             %87 = OpTypePointer Private %86 
					                              Private f32_3* %88 = OpVariable Private 
					                                         f32 %98 = OpConstant 3,674022E-40 
					                                        f32 %100 = OpConstant 3,674022E-40 
					                                        f32 %115 = OpConstant 3,674022E-40 
					                                      f32_3 %120 = OpConstantComposite %83 %83 %83 
					                                        f32 %122 = OpConstant 3,674022E-40 
					                                      f32_3 %123 = OpConstantComposite %43 %122 %83 
					                                      f32_3 %128 = OpConstantComposite %115 %115 %115 
					                                        u32 %147 = OpConstant 2 
					                                        u32 %151 = OpConstant 3 
					                                        f32 %186 = OpConstant 3,674022E-40 
					                             Private f32_4* %201 = OpVariable Private 
					                             Private f32_3* %203 = OpVariable Private 
					                             Private f32_4* %205 = OpVariable Private 
					                             Private f32_2* %207 = OpVariable Private 
					                                        f32 %210 = OpConstant 3,674022E-40 
					                                            %216 = OpTypeBool 
					                                       bool %217 = OpConstantTrue 
					                                            %218 = OpTypePointer Private %216 
					                              Private bool* %219 = OpVariable Private 
					                                        f32 %221 = OpConstant 3,674022E-40 
					                             Private f32_2* %227 = OpVariable Private 
					                                        f32 %229 = OpConstant 3,674022E-40 
					                                      f32_2 %230 = OpConstantComposite %229 %229 
					                                        f32 %235 = OpConstant 3,674022E-40 
					                                      f32_2 %236 = OpConstantComposite %235 %235 
					                                      f32_2 %242 = OpConstantComposite %43 %43 
					                                        f32 %247 = OpConstant 3,674022E-40 
					                                      f32_2 %248 = OpConstantComposite %247 %247 
					                             Private f32_4* %255 = OpVariable Private 
					                                        i32 %257 = OpConstant 2 
					                                        i32 %274 = OpConstant 3 
					                             Private f32_4* %300 = OpVariable Private 
					                             Private f32_4* %306 = OpVariable Private 
					                                      f32_4 %308 = OpConstantComposite %210 %210 %210 %210 
					                                      f32_4 %311 = OpConstantComposite %98 %98 %98 %98 
					                                        f32 %314 = OpConstant 3,674022E-40 
					                                      f32_4 %315 = OpConstantComposite %314 %314 %314 %314 
					                                      f32_4 %317 = OpConstantComposite %247 %247 %247 %247 
					                                            %325 = OpTypePointer Uniform %7 
					                             Private f32_4* %332 = OpVariable Private 
					                                      f32_4 %335 = OpConstantComposite %43 %44 %43 %44 
					                             Private f32_4* %340 = OpVariable Private 
					                             Private f32_4* %347 = OpVariable Private 
					                                        f32 %410 = OpConstant 3,674022E-40 
					                                      f32_2 %411 = OpConstantComposite %43 %410 
					                              Private bool* %415 = OpVariable Private 
					                                        f32 %416 = OpConstant 3,674022E-40 
					                                        f32 %428 = OpConstant 3,674022E-40 
					                                        f32 %438 = OpConstant 3,674022E-40 
					                                        f32 %461 = OpConstant 3,674022E-40 
					                                      f32_3 %462 = OpConstantComposite %461 %461 %461 
					                                        f32 %468 = OpConstant 3,674022E-40 
					                                      f32_3 %469 = OpConstantComposite %468 %468 %468 
					                                        f32 %471 = OpConstant 3,674022E-40 
					                                      f32_3 %472 = OpConstantComposite %471 %471 %471 
					                              Private bool* %486 = OpVariable Private 
					                                        f32 %498 = OpConstant 3,674022E-40 
					                                        f32 %549 = OpConstant 3,674022E-40 
					                                      f32_3 %550 = OpConstantComposite %549 %549 %549 
					                                      f32_3 %552 = OpConstantComposite %43 %43 %43 
					                               Private f32* %567 = OpVariable Private 
					                                        f32 %579 = OpConstant 3,674022E-40 
					                                      f32_4 %580 = OpConstantComposite %579 %579 %579 %579 
					                                            %582 = OpTypePointer Output %7 
					                              Output f32_4* %583 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                Uniform f32* %18 = OpAccessChain %12 %14 %16 
					                                         f32 %19 = OpLoad %18 
					                                Uniform f32* %21 = OpAccessChain %12 %14 %20 
					                                         f32 %22 = OpLoad %21 
					                                         f32 %23 = OpFDiv %19 %22 
					                                Private f32* %25 = OpAccessChain %9 %20 
					                                                     OpStore %25 %23 
					                                Private f32* %26 = OpAccessChain %9 %20 
					                                         f32 %27 = OpLoad %26 
					                                  Input f32* %32 = OpAccessChain vs_TEXCOORD0 %16 
					                                         f32 %33 = OpLoad %32 
					                                         f32 %34 = OpFMul %27 %33 
					                                Private f32* %35 = OpAccessChain %9 %16 
					                                                     OpStore %35 %34 
					                                  Input f32* %36 = OpAccessChain vs_TEXCOORD0 %20 
					                                         f32 %37 = OpLoad %36 
					                                Private f32* %38 = OpAccessChain %9 %20 
					                                                     OpStore %38 %37 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                                       f32_2 %46 = OpFMul %42 %45 
					                                                     OpStore %40 %46 
					                         read_only Texture2D %51 = OpLoad %50 
					                                     sampler %55 = OpLoad %54 
					                  read_only Texture2DSampled %57 = OpSampledImage %51 %55 
					                                       f32_2 %58 = OpLoad %40 
					                                       f32_4 %59 = OpImageSampleImplicitLod %57 %58 
					                                                     OpStore %47 %59 
					                                Uniform f32* %61 = OpAccessChain %12 %60 
					                                         f32 %62 = OpLoad %61 
					                                Uniform f32* %64 = OpAccessChain %12 %63 
					                                         f32 %65 = OpLoad %64 
					                                         f32 %66 = OpFMul %62 %65 
					                                Private f32* %67 = OpAccessChain %40 %20 
					                                                     OpStore %67 %66 
					                                Private f32* %68 = OpAccessChain %40 %20 
					                                         f32 %69 = OpLoad %68 
					                                         f32 %71 = OpFMul %69 %70 
					                                Private f32* %72 = OpAccessChain %40 %20 
					                                                     OpStore %72 %71 
					                                Private f32* %74 = OpAccessChain %40 %20 
					                                         f32 %75 = OpLoad %74 
					                                         f32 %76 = OpExtInst %1 8 %75 
					                                                     OpStore %73 %76 
					                                Private f32* %77 = OpAccessChain %40 %20 
					                                         f32 %78 = OpLoad %77 
					                                         f32 %79 = OpExtInst %1 10 %78 
					                                Private f32* %80 = OpAccessChain %40 %20 
					                                                     OpStore %80 %79 
					                                         f32 %82 = OpLoad %73 
					                                         f32 %84 = OpFMul %82 %83 
					                                Private f32* %85 = OpAccessChain %81 %20 
					                                                     OpStore %85 %84 
					                                Private f32* %89 = OpAccessChain %40 %20 
					                                         f32 %90 = OpLoad %89 
					                                Private f32* %91 = OpAccessChain %40 %20 
					                                         f32 %92 = OpLoad %91 
					                                         f32 %93 = OpFMul %90 %92 
					                                Private f32* %94 = OpAccessChain %88 %20 
					                                                     OpStore %94 %93 
					                                Private f32* %95 = OpAccessChain %40 %20 
					                                         f32 %96 = OpLoad %95 
					                                         f32 %97 = OpFNegate %96 
					                                         f32 %99 = OpFMul %97 %98 
					                                        f32 %101 = OpFAdd %99 %100 
					                               Private f32* %102 = OpAccessChain %40 %20 
					                                                     OpStore %102 %101 
					                               Private f32* %103 = OpAccessChain %40 %20 
					                                        f32 %104 = OpLoad %103 
					                               Private f32* %105 = OpAccessChain %88 %20 
					                                        f32 %106 = OpLoad %105 
					                                        f32 %107 = OpFMul %104 %106 
					                               Private f32* %108 = OpAccessChain %40 %20 
					                                                     OpStore %108 %107 
					                               Private f32* %109 = OpAccessChain %81 %20 
					                                        f32 %110 = OpLoad %109 
					                                        f32 %111 = OpExtInst %1 13 %110 
					                               Private f32* %112 = OpAccessChain %81 %20 
					                                                     OpStore %112 %111 
					                               Private f32* %113 = OpAccessChain %81 %20 
					                                        f32 %114 = OpLoad %113 
					                                        f32 %116 = OpFMul %114 %115 
					                               Private f32* %117 = OpAccessChain %81 %20 
					                                                     OpStore %117 %116 
					                                        f32 %118 = OpLoad %73 
					                                      f32_3 %119 = OpCompositeConstruct %118 %118 %118 
					                                      f32_3 %121 = OpFMul %119 %120 
					                                      f32_3 %124 = OpFAdd %121 %123 
					                                                     OpStore %88 %124 
					                                      f32_3 %125 = OpLoad %88 
					                                      f32_3 %126 = OpExtInst %1 13 %125 
					                                                     OpStore %88 %126 
					                                      f32_3 %127 = OpLoad %88 
					                                      f32_3 %129 = OpFMul %127 %128 
					                                      f32_4 %130 = OpLoad %81 
					                                      f32_4 %131 = OpVectorShuffle %130 %129 0 4 5 6 
					                                                     OpStore %81 %131 
					                                      f32_4 %132 = OpLoad %81 
					                                      f32_4 %133 = OpExtInst %1 10 %132 
					                                                     OpStore %81 %133 
					                               Private f32* %134 = OpAccessChain %81 %20 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                               Private f32* %137 = OpAccessChain %81 %16 
					                                        f32 %138 = OpLoad %137 
					                                        f32 %139 = OpFAdd %136 %138 
					                                                     OpStore %73 %139 
					                               Private f32* %140 = OpAccessChain %40 %20 
					                                        f32 %141 = OpLoad %140 
					                                        f32 %142 = OpLoad %73 
					                                        f32 %143 = OpFMul %141 %142 
					                               Private f32* %144 = OpAccessChain %81 %20 
					                                        f32 %145 = OpLoad %144 
					                                        f32 %146 = OpFAdd %143 %145 
					                                                     OpStore %73 %146 
					                               Private f32* %148 = OpAccessChain %81 %147 
					                                        f32 %149 = OpLoad %148 
					                                        f32 %150 = OpFNegate %149 
					                               Private f32* %152 = OpAccessChain %81 %151 
					                                        f32 %153 = OpLoad %152 
					                                        f32 %154 = OpFAdd %150 %153 
					                               Private f32* %155 = OpAccessChain %81 %20 
					                                                     OpStore %155 %154 
					                               Private f32* %156 = OpAccessChain %40 %20 
					                                        f32 %157 = OpLoad %156 
					                               Private f32* %158 = OpAccessChain %81 %20 
					                                        f32 %159 = OpLoad %158 
					                                        f32 %160 = OpFMul %157 %159 
					                               Private f32* %161 = OpAccessChain %81 %147 
					                                        f32 %162 = OpLoad %161 
					                                        f32 %163 = OpFAdd %160 %162 
					                               Private f32* %164 = OpAccessChain %81 %20 
					                                                     OpStore %164 %163 
					                                        f32 %165 = OpLoad %73 
					                                        f32 %166 = OpFNegate %165 
					                               Private f32* %167 = OpAccessChain %81 %20 
					                                        f32 %168 = OpLoad %167 
					                                        f32 %169 = OpFAdd %166 %168 
					                               Private f32* %170 = OpAccessChain %81 %20 
					                                                     OpStore %170 %169 
					                               Private f32* %171 = OpAccessChain %40 %20 
					                                        f32 %172 = OpLoad %171 
					                               Private f32* %173 = OpAccessChain %81 %20 
					                                        f32 %174 = OpLoad %173 
					                                        f32 %175 = OpFMul %172 %174 
					                                        f32 %176 = OpLoad %73 
					                                        f32 %177 = OpFAdd %175 %176 
					                               Private f32* %178 = OpAccessChain %40 %20 
					                                                     OpStore %178 %177 
					                               Private f32* %179 = OpAccessChain %40 %20 
					                                        f32 %180 = OpLoad %179 
					                                        f32 %181 = OpExtInst %1 4 %180 
					                                        f32 %182 = OpExtInst %1 30 %181 
					                               Private f32* %183 = OpAccessChain %40 %20 
					                                                     OpStore %183 %182 
					                               Private f32* %184 = OpAccessChain %40 %20 
					                                        f32 %185 = OpLoad %184 
					                                        f32 %187 = OpFMul %185 %186 
					                               Private f32* %188 = OpAccessChain %40 %20 
					                                                     OpStore %188 %187 
					                               Private f32* %189 = OpAccessChain %40 %20 
					                                        f32 %190 = OpLoad %189 
					                                        f32 %191 = OpExtInst %1 29 %190 
					                               Private f32* %192 = OpAccessChain %40 %20 
					                                                     OpStore %192 %191 
					                               Private f32* %193 = OpAccessChain %40 %20 
					                                        f32 %194 = OpLoad %193 
					                                        f32 %195 = OpExtInst %1 37 %194 %43 
					                               Private f32* %196 = OpAccessChain %40 %20 
					                                                     OpStore %196 %195 
					                               Uniform f32* %197 = OpAccessChain %12 %14 %20 
					                                        f32 %198 = OpLoad %197 
					                                        f32 %199 = OpFDiv %43 %198 
					                               Private f32* %200 = OpAccessChain %81 %20 
					                                                     OpStore %200 %199 
					                               Private f32* %202 = OpAccessChain %201 %16 
					                                                     OpStore %202 %43 
					                               Private f32* %204 = OpAccessChain %203 %16 
					                                                     OpStore %204 %43 
					                                      f32_4 %206 = OpLoad %47 
					                                                     OpStore %205 %206 
					                                      f32_4 %208 = OpLoad %9 
					                                      f32_2 %209 = OpVectorShuffle %208 %208 0 1 
					                                                     OpStore %207 %209 
					                                                     OpStore %73 %210 
					                                                     OpBranch %211 
					                                            %211 = OpLabel 
					                                                     OpLoopMerge %213 %214 None 
					                                                     OpBranch %215 
					                                            %215 = OpLabel 
					                                                     OpBranchConditional %217 %212 %213 
					                                            %212 = OpLabel 
					                                        f32 %220 = OpLoad %73 
					                                       bool %222 = OpFOrdGreaterThanEqual %220 %221 
					                                                     OpStore %219 %222 
					                                       bool %223 = OpLoad %219 
					                                                     OpSelectionMerge %225 None 
					                                                     OpBranchConditional %223 %224 %225 
					                                            %224 = OpLabel 
					                                                     OpBranch %213 
					                                            %225 = OpLabel 
					                                      f32_2 %228 = OpLoad %207 
					                                      f32_2 %231 = OpFMul %228 %230 
					                                                     OpStore %227 %231 
					                                      f32_2 %232 = OpLoad %227 
					                                      f32_2 %233 = OpExtInst %1 10 %232 
					                                                     OpStore %227 %233 
					                                      f32_2 %234 = OpLoad %227 
					                                      f32_2 %237 = OpFAdd %234 %236 
					                                                     OpStore %227 %237 
					                                      f32_2 %238 = OpLoad %40 
					                                      f32_2 %239 = OpVectorShuffle %238 %238 0 0 
					                                      f32_2 %240 = OpLoad %227 
					                                      f32_2 %241 = OpFMul %239 %240 
					                                      f32_2 %243 = OpFAdd %241 %242 
					                                                     OpStore %227 %243 
					                                      f32_2 %244 = OpLoad %227 
					                                      f32_2 %245 = OpExtInst %1 30 %244 
					                                                     OpStore %227 %245 
					                                      f32_2 %246 = OpLoad %227 
					                                      f32_2 %249 = OpFMul %246 %248 
					                                                     OpStore %227 %249 
					                                      f32_2 %250 = OpLoad %227 
					                                      f32_2 %251 = OpExtInst %1 29 %250 
					                                                     OpStore %227 %251 
					                                      f32_2 %252 = OpLoad %207 
					                                      f32_2 %253 = OpLoad %227 
					                                      f32_2 %254 = OpFDiv %252 %253 
					                                                     OpStore %207 %254 
					                                      f32_4 %256 = OpLoad %205 
					                               Uniform f32* %258 = OpAccessChain %12 %257 
					                                        f32 %259 = OpLoad %258 
					                               Uniform f32* %260 = OpAccessChain %12 %257 
					                                        f32 %261 = OpLoad %260 
					                               Uniform f32* %262 = OpAccessChain %12 %257 
					                                        f32 %263 = OpLoad %262 
					                               Uniform f32* %264 = OpAccessChain %12 %257 
					                                        f32 %265 = OpLoad %264 
					                                      f32_4 %266 = OpCompositeConstruct %259 %261 %263 %265 
					                                        f32 %267 = OpCompositeExtract %266 0 
					                                        f32 %268 = OpCompositeExtract %266 1 
					                                        f32 %269 = OpCompositeExtract %266 2 
					                                        f32 %270 = OpCompositeExtract %266 3 
					                                      f32_4 %271 = OpCompositeConstruct %267 %268 %269 %270 
					                                      f32_4 %272 = OpExtInst %1 40 %256 %271 
					                                                     OpStore %255 %272 
					                                      f32_4 %273 = OpLoad %255 
					                               Uniform f32* %275 = OpAccessChain %12 %274 
					                                        f32 %276 = OpLoad %275 
					                               Uniform f32* %277 = OpAccessChain %12 %274 
					                                        f32 %278 = OpLoad %277 
					                               Uniform f32* %279 = OpAccessChain %12 %274 
					                                        f32 %280 = OpLoad %279 
					                               Uniform f32* %281 = OpAccessChain %12 %274 
					                                        f32 %282 = OpLoad %281 
					                                      f32_4 %283 = OpCompositeConstruct %276 %278 %280 %282 
					                                        f32 %284 = OpCompositeExtract %283 0 
					                                        f32 %285 = OpCompositeExtract %283 1 
					                                        f32 %286 = OpCompositeExtract %283 2 
					                                        f32 %287 = OpCompositeExtract %283 3 
					                                      f32_4 %288 = OpCompositeConstruct %284 %285 %286 %287 
					                                      f32_4 %289 = OpExtInst %1 37 %273 %288 
					                                                     OpStore %255 %289 
					                                        f32 %290 = OpLoad %73 
					                               Uniform f32* %291 = OpAccessChain %12 %14 %16 
					                                        f32 %292 = OpLoad %291 
					                                        f32 %293 = OpFDiv %290 %292 
					                               Private f32* %294 = OpAccessChain %81 %16 
					                                                     OpStore %294 %293 
					                                      f32_2 %295 = OpLoad %207 
					                                      f32_2 %296 = OpFMul %295 %45 
					                                      f32_4 %297 = OpLoad %81 
					                                      f32_2 %298 = OpVectorShuffle %297 %297 0 1 
					                                      f32_2 %299 = OpFAdd %296 %298 
					                                                     OpStore %227 %299 
					                        read_only Texture2D %301 = OpLoad %50 
					                                    sampler %302 = OpLoad %54 
					                 read_only Texture2DSampled %303 = OpSampledImage %301 %302 
					                                      f32_2 %304 = OpLoad %227 
					                                      f32_4 %305 = OpImageSampleImplicitLod %303 %304 
					                                                     OpStore %300 %305 
					                                      f32_4 %307 = OpLoad %300 
					                                      f32_4 %309 = OpExtInst %1 40 %307 %308 
					                                                     OpStore %306 %309 
					                                      f32_4 %310 = OpLoad %306 
					                                      f32_4 %312 = OpExtInst %1 37 %310 %311 
					                                                     OpStore %306 %312 
					                                      f32_4 %313 = OpLoad %306 
					                                      f32_4 %316 = OpFMul %313 %315 
					                                      f32_4 %318 = OpFAdd %316 %317 
					                                                     OpStore %306 %318 
					                                      f32_4 %319 = OpLoad %255 
					                                      f32_4 %320 = OpLoad %306 
					                                      f32_4 %321 = OpFDiv %319 %320 
					                                                     OpStore %255 %321 
					                                        f32 %322 = OpLoad %73 
					                                      f32_2 %323 = OpCompositeConstruct %322 %322 
					                                      f32_2 %324 = OpFNegate %323 
					                             Uniform f32_4* %326 = OpAccessChain %12 %14 
					                                      f32_4 %327 = OpLoad %326 
					                                      f32_2 %328 = OpVectorShuffle %327 %327 1 0 
					                                      f32_2 %329 = OpFDiv %324 %328 
					                                      f32_4 %330 = OpLoad %81 
					                                      f32_4 %331 = OpVectorShuffle %330 %329 0 1 4 5 
					                                                     OpStore %81 %331 
					                                      f32_2 %333 = OpLoad %207 
					                                      f32_4 %334 = OpVectorShuffle %333 %333 0 1 0 1 
					                                      f32_4 %336 = OpFMul %334 %335 
					                                      f32_4 %337 = OpLoad %81 
					                                      f32_4 %338 = OpVectorShuffle %337 %337 0 2 3 1 
					                                      f32_4 %339 = OpFAdd %336 %338 
					                                                     OpStore %332 %339 
					                        read_only Texture2D %341 = OpLoad %50 
					                                    sampler %342 = OpLoad %54 
					                 read_only Texture2DSampled %343 = OpSampledImage %341 %342 
					                                      f32_4 %344 = OpLoad %332 
					                                      f32_2 %345 = OpVectorShuffle %344 %344 0 1 
					                                      f32_4 %346 = OpImageSampleImplicitLod %343 %345 
					                                                     OpStore %340 %346 
					                                      f32_4 %348 = OpLoad %340 
					                                      f32_4 %349 = OpExtInst %1 40 %348 %308 
					                                                     OpStore %347 %349 
					                                      f32_4 %350 = OpLoad %347 
					                                      f32_4 %351 = OpExtInst %1 37 %350 %311 
					                                                     OpStore %347 %351 
					                                      f32_4 %352 = OpLoad %347 
					                                      f32_4 %353 = OpFMul %352 %315 
					                                      f32_4 %354 = OpFAdd %353 %317 
					                                                     OpStore %347 %354 
					                                      f32_4 %355 = OpLoad %255 
					                                      f32_4 %356 = OpLoad %347 
					                                      f32_4 %357 = OpFMul %355 %356 
					                                                     OpStore %255 %357 
					                        read_only Texture2D %358 = OpLoad %50 
					                                    sampler %359 = OpLoad %54 
					                 read_only Texture2DSampled %360 = OpSampledImage %358 %359 
					                                      f32_4 %361 = OpLoad %332 
					                                      f32_2 %362 = OpVectorShuffle %361 %361 2 3 
					                                      f32_4 %363 = OpImageSampleImplicitLod %360 %362 
					                                                     OpStore %300 %363 
					                                      f32_4 %364 = OpLoad %300 
					                                      f32_4 %365 = OpExtInst %1 40 %364 %308 
					                                                     OpStore %306 %365 
					                                      f32_4 %366 = OpLoad %306 
					                                      f32_4 %367 = OpExtInst %1 37 %366 %311 
					                                                     OpStore %306 %367 
					                                      f32_4 %368 = OpLoad %306 
					                                      f32_4 %369 = OpFMul %368 %315 
					                                      f32_4 %370 = OpFAdd %369 %317 
					                                                     OpStore %306 %370 
					                                      f32_4 %371 = OpLoad %255 
					                                      f32_4 %372 = OpLoad %306 
					                                      f32_4 %373 = OpFMul %371 %372 
					                                                     OpStore %255 %373 
					                                      f32_2 %374 = OpLoad %207 
					                                      f32_2 %375 = OpFMul %374 %45 
					                                      f32_4 %376 = OpLoad %81 
					                                      f32_2 %377 = OpVectorShuffle %376 %376 3 2 
					                                      f32_2 %378 = OpFAdd %375 %377 
					                                      f32_3 %379 = OpLoad %88 
					                                      f32_3 %380 = OpVectorShuffle %379 %378 3 4 2 
					                                                     OpStore %88 %380 
					                        read_only Texture2D %381 = OpLoad %50 
					                                    sampler %382 = OpLoad %54 
					                 read_only Texture2DSampled %383 = OpSampledImage %381 %382 
					                                      f32_3 %384 = OpLoad %88 
					                                      f32_2 %385 = OpVectorShuffle %384 %384 0 1 
					                                      f32_4 %386 = OpImageSampleImplicitLod %383 %385 
					                                                     OpStore %300 %386 
					                                      f32_4 %387 = OpLoad %300 
					                                      f32_4 %388 = OpExtInst %1 40 %387 %308 
					                                                     OpStore %306 %388 
					                                      f32_4 %389 = OpLoad %306 
					                                      f32_4 %390 = OpExtInst %1 37 %389 %311 
					                                                     OpStore %306 %390 
					                                      f32_4 %391 = OpLoad %306 
					                                      f32_4 %392 = OpFMul %391 %315 
					                                      f32_4 %393 = OpFAdd %392 %317 
					                                                     OpStore %306 %393 
					                                      f32_4 %394 = OpLoad %255 
					                                      f32_4 %395 = OpLoad %306 
					                                      f32_4 %396 = OpFDiv %394 %395 
					                                                     OpStore %205 %396 
					                                      f32_4 %397 = OpLoad %205 
					                                      f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
					                                      f32_4 %399 = OpLoad %205 
					                                      f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
					                                        f32 %401 = OpDot %398 %400 
					                               Private f32* %402 = OpAccessChain %88 %20 
					                                                     OpStore %402 %401 
					                               Private f32* %403 = OpAccessChain %88 %20 
					                                        f32 %404 = OpLoad %403 
					                                        f32 %405 = OpExtInst %1 31 %404 
					                               Private f32* %406 = OpAccessChain %88 %20 
					                                                     OpStore %406 %405 
					                                      f32_3 %407 = OpLoad %88 
					                                      f32_2 %408 = OpVectorShuffle %407 %407 0 0 
					                                      f32_2 %409 = OpFNegate %408 
					                                      f32_2 %412 = OpFAdd %409 %411 
					                                      f32_3 %413 = OpLoad %88 
					                                      f32_3 %414 = OpVectorShuffle %413 %412 3 4 2 
					                                                     OpStore %88 %414 
					                               Private f32* %417 = OpAccessChain %88 %20 
					                                        f32 %418 = OpLoad %417 
					                                       bool %419 = OpFOrdGreaterThanEqual %416 %418 
					                                                     OpStore %415 %419 
					                                       bool %420 = OpLoad %415 
					                                        f32 %421 = OpSelect %420 %43 %210 
					                               Private f32* %422 = OpAccessChain %201 %20 
					                                                     OpStore %422 %421 
					                                       bool %423 = OpLoad %415 
					                                        f32 %424 = OpSelect %423 %210 %43 
					                               Private f32* %425 = OpAccessChain %201 %147 
					                                                     OpStore %425 %424 
					                               Private f32* %426 = OpAccessChain %88 %16 
					                                        f32 %427 = OpLoad %426 
					                                        f32 %429 = OpFMul %427 %428 
					                               Private f32* %430 = OpAccessChain %88 %20 
					                                                     OpStore %430 %429 
					                               Private f32* %431 = OpAccessChain %88 %20 
					                                        f32 %432 = OpLoad %431 
					                                        f32 %433 = OpExtInst %1 43 %432 %210 %43 
					                               Private f32* %434 = OpAccessChain %88 %20 
					                                                     OpStore %434 %433 
					                               Private f32* %435 = OpAccessChain %88 %20 
					                                        f32 %436 = OpLoad %435 
					                                        f32 %437 = OpFMul %436 %98 
					                                        f32 %439 = OpFAdd %437 %438 
					                               Private f32* %440 = OpAccessChain %88 %20 
					                                                     OpStore %440 %439 
					                               Private f32* %441 = OpAccessChain %88 %20 
					                                        f32 %442 = OpLoad %441 
					                                        f32 %443 = OpExtInst %1 4 %442 
					                                        f32 %444 = OpFNegate %443 
					                                        f32 %445 = OpFAdd %444 %43 
					                               Private f32* %446 = OpAccessChain %255 %16 
					                                                     OpStore %446 %445 
					                                      f32_4 %447 = OpLoad %255 
					                                      f32_2 %448 = OpVectorShuffle %447 %447 1 1 
					                                      f32_2 %449 = OpFNegate %448 
					                                      f32_2 %450 = OpFAdd %449 %242 
					                                      f32_4 %451 = OpLoad %255 
					                                      f32_4 %452 = OpVectorShuffle %451 %450 4 1 5 3 
					                                                     OpStore %255 %452 
					                                      f32_4 %453 = OpLoad %201 
					                                      f32_3 %454 = OpVectorShuffle %453 %453 0 1 2 
					                                      f32_4 %455 = OpLoad %255 
					                                      f32_3 %456 = OpVectorShuffle %455 %455 0 1 2 
					                                      f32_3 %457 = OpFMul %454 %456 
					                                                     OpStore %88 %457 
					                                      f32_3 %458 = OpLoad %88 
					                                      f32_3 %459 = OpExtInst %1 30 %458 
					                                                     OpStore %88 %459 
					                                      f32_3 %460 = OpLoad %88 
					                                      f32_3 %463 = OpFMul %460 %462 
					                                                     OpStore %88 %463 
					                                      f32_3 %464 = OpLoad %88 
					                                      f32_3 %465 = OpExtInst %1 29 %464 
					                                                     OpStore %88 %465 
					                                      f32_3 %466 = OpLoad %88 
					                                      f32_3 %467 = OpFNegate %466 
					                                      f32_3 %470 = OpFMul %467 %469 
					                                      f32_3 %473 = OpFAdd %470 %472 
					                                                     OpStore %88 %473 
					                                      f32_4 %474 = OpLoad %205 
					                                      f32_3 %475 = OpVectorShuffle %474 %474 0 1 2 
					                                      f32_3 %476 = OpLoad %88 
					                                      f32_3 %477 = OpFDiv %475 %476 
					                                                     OpStore %88 %477 
					                                      f32_3 %478 = OpLoad %88 
					                                      f32_3 %479 = OpLoad %88 
					                                        f32 %480 = OpDot %478 %479 
					                               Private f32* %481 = OpAccessChain %201 %20 
					                                                     OpStore %481 %480 
					                               Private f32* %482 = OpAccessChain %201 %20 
					                                        f32 %483 = OpLoad %482 
					                                        f32 %484 = OpExtInst %1 31 %483 
					                               Private f32* %485 = OpAccessChain %201 %20 
					                                                     OpStore %485 %484 
					                               Private f32* %487 = OpAccessChain %201 %20 
					                                        f32 %488 = OpLoad %487 
					                                       bool %489 = OpFOrdGreaterThanEqual %416 %488 
					                                                     OpStore %486 %489 
					                                       bool %490 = OpLoad %486 
					                                        f32 %491 = OpSelect %490 %43 %210 
					                               Private f32* %492 = OpAccessChain %203 %20 
					                                                     OpStore %492 %491 
					                                       bool %493 = OpLoad %486 
					                                        f32 %494 = OpSelect %493 %210 %43 
					                               Private f32* %495 = OpAccessChain %203 %147 
					                                                     OpStore %495 %494 
					                               Private f32* %496 = OpAccessChain %201 %20 
					                                        f32 %497 = OpLoad %496 
					                                        f32 %499 = OpFAdd %497 %498 
					                               Private f32* %500 = OpAccessChain %201 %20 
					                                                     OpStore %500 %499 
					                               Private f32* %501 = OpAccessChain %201 %20 
					                                        f32 %502 = OpLoad %501 
					                                        f32 %503 = OpFMul %502 %428 
					                               Private f32* %504 = OpAccessChain %201 %20 
					                                                     OpStore %504 %503 
					                               Private f32* %505 = OpAccessChain %201 %20 
					                                        f32 %506 = OpLoad %505 
					                                        f32 %507 = OpExtInst %1 43 %506 %210 %43 
					                               Private f32* %508 = OpAccessChain %201 %20 
					                                                     OpStore %508 %507 
					                               Private f32* %509 = OpAccessChain %201 %20 
					                                        f32 %510 = OpLoad %509 
					                                        f32 %511 = OpFMul %510 %98 
					                                        f32 %512 = OpFAdd %511 %438 
					                               Private f32* %513 = OpAccessChain %201 %20 
					                                                     OpStore %513 %512 
					                               Private f32* %514 = OpAccessChain %201 %20 
					                                        f32 %515 = OpLoad %514 
					                                        f32 %516 = OpExtInst %1 4 %515 
					                                        f32 %517 = OpFNegate %516 
					                                        f32 %518 = OpFAdd %517 %43 
					                               Private f32* %519 = OpAccessChain %255 %16 
					                                                     OpStore %519 %518 
					                                      f32_4 %520 = OpLoad %255 
					                                      f32_2 %521 = OpVectorShuffle %520 %520 1 1 
					                                      f32_2 %522 = OpFNegate %521 
					                                      f32_2 %523 = OpFAdd %522 %242 
					                                      f32_4 %524 = OpLoad %255 
					                                      f32_4 %525 = OpVectorShuffle %524 %523 4 1 5 3 
					                                                     OpStore %255 %525 
					                                      f32_3 %526 = OpLoad %203 
					                                      f32_4 %527 = OpLoad %255 
					                                      f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
					                                      f32_3 %529 = OpFMul %526 %528 
					                                      f32_4 %530 = OpLoad %201 
					                                      f32_4 %531 = OpVectorShuffle %530 %529 4 1 5 6 
					                                                     OpStore %201 %531 
					                                      f32_4 %532 = OpLoad %201 
					                                      f32_3 %533 = OpVectorShuffle %532 %532 0 2 3 
					                                      f32_3 %534 = OpExtInst %1 30 %533 
					                                      f32_4 %535 = OpLoad %201 
					                                      f32_4 %536 = OpVectorShuffle %535 %534 4 1 5 6 
					                                                     OpStore %201 %536 
					                                      f32_4 %537 = OpLoad %201 
					                                      f32_3 %538 = OpVectorShuffle %537 %537 0 2 3 
					                                      f32_3 %539 = OpFMul %538 %462 
					                                      f32_4 %540 = OpLoad %201 
					                                      f32_4 %541 = OpVectorShuffle %540 %539 4 1 5 6 
					                                                     OpStore %201 %541 
					                                      f32_4 %542 = OpLoad %201 
					                                      f32_3 %543 = OpVectorShuffle %542 %542 0 2 3 
					                                      f32_3 %544 = OpExtInst %1 29 %543 
					                                      f32_4 %545 = OpLoad %201 
					                                      f32_4 %546 = OpVectorShuffle %545 %544 4 1 5 6 
					                                                     OpStore %201 %546 
					                                      f32_4 %547 = OpLoad %201 
					                                      f32_3 %548 = OpVectorShuffle %547 %547 0 2 3 
					                                      f32_3 %551 = OpFMul %548 %550 
					                                      f32_3 %553 = OpFAdd %551 %552 
					                                      f32_4 %554 = OpLoad %201 
					                                      f32_4 %555 = OpVectorShuffle %554 %553 4 1 5 6 
					                                                     OpStore %201 %555 
					                                      f32_3 %556 = OpLoad %88 
					                                      f32_4 %557 = OpLoad %201 
					                                      f32_3 %558 = OpVectorShuffle %557 %557 0 2 3 
					                                      f32_3 %559 = OpFMul %556 %558 
					                                      f32_4 %560 = OpLoad %205 
					                                      f32_4 %561 = OpVectorShuffle %560 %559 4 5 6 3 
					                                                     OpStore %205 %561 
					                                        f32 %562 = OpLoad %73 
					                                        f32 %563 = OpFAdd %562 %43 
					                                                     OpStore %73 %563 
					                                                     OpBranch %214 
					                                            %214 = OpLabel 
					                                                     OpBranch %211 
					                                            %213 = OpLabel 
					                                      f32_4 %564 = OpLoad %205 
					                                      f32_4 %565 = OpFMul %564 %315 
					                                      f32_4 %566 = OpFAdd %565 %317 
					                                                     OpStore %9 %566 
					                                      f32_4 %568 = OpLoad %9 
					                                      f32_4 %569 = OpLoad %9 
					                                        f32 %570 = OpDot %568 %569 
					                                                     OpStore %567 %570 
					                                        f32 %571 = OpLoad %567 
					                                        f32 %572 = OpExtInst %1 31 %571 
					                                                     OpStore %567 %572 
					                                      f32_4 %573 = OpLoad %9 
					                                        f32 %574 = OpLoad %567 
					                                      f32_4 %575 = OpCompositeConstruct %574 %574 %574 %574 
					                                      f32_4 %576 = OpFDiv %573 %575 
					                                                     OpStore %9 %576 
					                                      f32_4 %577 = OpLoad %9 
					                                      f32_4 %578 = OpFMul %577 %311 
					                                      f32_4 %581 = OpFAdd %578 %580 
					                                                     OpStore %9 %581 
					                                      f32_4 %584 = OpLoad %9 
					                                      f32_4 %585 = OpFMul %584 %315 
					                                                     OpStore %583 %585 
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
						float _Speed;
						float LightMin;
						float LightMax;
						vec4 _ScreenResolution;
						vec4 unused_0_6;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec4 u_xlat16_8;
					vec4 u_xlat10_8;
					vec4 u_xlat16_9;
					vec4 u_xlat10_9;
					vec3 u_xlat12;
					bool u_xlatb12;
					vec2 u_xlat20;
					bool u_xlatb23;
					vec2 u_xlat26;
					float u_xlat30;
					bool u_xlatb33;
					void main()
					{
					    u_xlat0.x = _ScreenResolution.y / _ScreenResolution.x;
					    u_xlat0.y = u_xlat0.x * vs_TEXCOORD0.y;
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat20.xy = u_xlat0.xy * vec2(1.0, 1.778);
					    u_xlat10_1 = texture(_MainTex, u_xlat20.xy);
					    u_xlat20.x = _TimeX * _Speed;
					    u_xlat20.x = u_xlat20.x * 7.67999983;
					    u_xlat30 = floor(u_xlat20.x);
					    u_xlat20.x = fract(u_xlat20.x);
					    u_xlat2.x = u_xlat30 * 60.0;
					    u_xlat12.x = u_xlat20.x * u_xlat20.x;
					    u_xlat20.x = (-u_xlat20.x) * 2.0 + 3.0;
					    u_xlat20.x = u_xlat20.x * u_xlat12.x;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * 43812.1758;
					    u_xlat12.xyz = vec3(u_xlat30) * vec3(60.0, 60.0, 60.0) + vec3(1.0, 59.0, 60.0);
					    u_xlat12.xyz = sin(u_xlat12.xyz);
					    u_xlat2.yzw = u_xlat12.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2 = fract(u_xlat2);
					    u_xlat30 = (-u_xlat2.x) + u_xlat2.y;
					    u_xlat30 = u_xlat20.x * u_xlat30 + u_xlat2.x;
					    u_xlat2.x = (-u_xlat2.z) + u_xlat2.w;
					    u_xlat2.x = u_xlat20.x * u_xlat2.x + u_xlat2.z;
					    u_xlat2.x = (-u_xlat30) + u_xlat2.x;
					    u_xlat20.x = u_xlat20.x * u_xlat2.x + u_xlat30;
					    u_xlat20.x = log2(abs(u_xlat20.x));
					    u_xlat20.x = u_xlat20.x * 15.0;
					    u_xlat20.x = exp2(u_xlat20.x);
					    u_xlat20.x = min(u_xlat20.x, 1.0);
					    u_xlat2.x = float(1.0) / _ScreenResolution.x;
					    u_xlat3.y = 1.0;
					    u_xlat4.y = 1.0;
					    u_xlat5 = u_xlat10_1;
					    u_xlat6.xy = u_xlat0.xy;
					    u_xlat30 = 0.0;
					    while(true){
					        u_xlatb33 = u_xlat30>=6.0;
					        if(u_xlatb33){break;}
					        u_xlat26.xy = u_xlat6.xy * vec2(28.0, 28.0);
					        u_xlat26.xy = fract(u_xlat26.xy);
					        u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
					        u_xlat26.xy = u_xlat20.xx * u_xlat26.xy + vec2(1.0, 1.0);
					        u_xlat26.xy = log2(u_xlat26.xy);
					        u_xlat26.xy = u_xlat26.xy * vec2(0.100000001, 0.100000001);
					        u_xlat26.xy = exp2(u_xlat26.xy);
					        u_xlat6.xy = u_xlat6.xy / u_xlat26.xy;
					        u_xlat7 = max(u_xlat5, vec4(vec4(LightMin, LightMin, LightMin, LightMin)));
					        u_xlat7 = min(u_xlat7, vec4(vec4(LightMax, LightMax, LightMax, LightMax)));
					        u_xlat2.y = u_xlat30 / _ScreenResolution.y;
					        u_xlat26.xy = u_xlat6.xy * vec2(1.0, 1.778) + u_xlat2.xy;
					        u_xlat10_8 = texture(_MainTex, u_xlat26.xy);
					        u_xlat16_8 = max(u_xlat10_8, vec4(0.0, 0.0, 0.0, 0.0));
					        u_xlat16_8 = min(u_xlat16_8, vec4(2.0, 2.0, 2.0, 2.0));
					        u_xlat16_8 = u_xlat16_8 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat7 = u_xlat7 / u_xlat16_8;
					        u_xlat2.zw = (-vec2(u_xlat30)) / _ScreenResolution.yx;
					        u_xlat8 = u_xlat6.xyxy * vec4(1.0, 1.778, 1.0, 1.778) + u_xlat2.xzwy;
					        u_xlat10_9 = texture(_MainTex, u_xlat8.xy);
					        u_xlat16_9 = max(u_xlat10_9, vec4(0.0, 0.0, 0.0, 0.0));
					        u_xlat16_9 = min(u_xlat16_9, vec4(2.0, 2.0, 2.0, 2.0));
					        u_xlat16_9 = u_xlat16_9 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat7 = u_xlat7 * u_xlat16_9;
					        u_xlat10_8 = texture(_MainTex, u_xlat8.zw);
					        u_xlat16_8 = max(u_xlat10_8, vec4(0.0, 0.0, 0.0, 0.0));
					        u_xlat16_8 = min(u_xlat16_8, vec4(2.0, 2.0, 2.0, 2.0));
					        u_xlat16_8 = u_xlat16_8 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat7 = u_xlat7 * u_xlat16_8;
					        u_xlat12.xy = u_xlat6.xy * vec2(1.0, 1.778) + u_xlat2.wz;
					        u_xlat10_8 = texture(_MainTex, u_xlat12.xy);
					        u_xlat16_8 = max(u_xlat10_8, vec4(0.0, 0.0, 0.0, 0.0));
					        u_xlat16_8 = min(u_xlat16_8, vec4(2.0, 2.0, 2.0, 2.0));
					        u_xlat16_8 = u_xlat16_8 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat5 = u_xlat7 / u_xlat16_8;
					        u_xlat12.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					        u_xlat12.x = sqrt(u_xlat12.x);
					        u_xlat12.xy = (-u_xlat12.xx) + vec2(1.0, 0.840000033);
					        u_xlatb12 = 0.5>=u_xlat12.x;
					        u_xlat3.x = u_xlatb12 ? 1.0 : float(0.0);
					        u_xlat3.z = (u_xlatb12) ? 0.0 : 1.0;
					        u_xlat12.x = u_xlat12.y * 1.49253738;
					        u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
					        u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
					        u_xlat7.y = -abs(u_xlat12.x) + 1.0;
					        u_xlat7.xz = (-u_xlat7.yy) + vec2(1.0, 1.0);
					        u_xlat12.xyz = u_xlat3.xyz * u_xlat7.xyz;
					        u_xlat12.xyz = log2(u_xlat12.xyz);
					        u_xlat12.xyz = u_xlat12.xyz * vec3(0.449999988, 0.449999988, 0.449999988);
					        u_xlat12.xyz = exp2(u_xlat12.xyz);
					        u_xlat12.xyz = (-u_xlat12.xyz) * vec3(0.0250000004, 0.0250000004, 0.0250000004) + vec3(1.00999999, 1.00999999, 1.00999999);
					        u_xlat12.xyz = u_xlat5.xyz / u_xlat12.xyz;
					        u_xlat3.x = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat3.x = sqrt(u_xlat3.x);
					        u_xlatb23 = 0.5>=u_xlat3.x;
					        u_xlat4.x = u_xlatb23 ? 1.0 : float(0.0);
					        u_xlat4.z = (u_xlatb23) ? 0.0 : 1.0;
					        u_xlat3.x = u_xlat3.x + -0.159999996;
					        u_xlat3.x = u_xlat3.x * 1.49253738;
					        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					        u_xlat3.x = u_xlat3.x * 2.0 + -1.0;
					        u_xlat7.y = -abs(u_xlat3.x) + 1.0;
					        u_xlat7.xz = (-u_xlat7.yy) + vec2(1.0, 1.0);
					        u_xlat3.xzw = u_xlat4.xyz * u_xlat7.xyz;
					        u_xlat3.xzw = log2(u_xlat3.xzw);
					        u_xlat3.xzw = u_xlat3.xzw * vec3(0.449999988, 0.449999988, 0.449999988);
					        u_xlat3.xzw = exp2(u_xlat3.xzw);
					        u_xlat3.xzw = u_xlat3.xzw * vec3(0.00999999978, 0.00999999978, 0.00999999978) + vec3(1.0, 1.0, 1.0);
					        u_xlat5.xyz = u_xlat12.xyz * u_xlat3.xzw;
					        u_xlat30 = u_xlat30 + 1.0;
					    }
					    u_xlat0 = u_xlat5 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					    u_xlat1 = dot(u_xlat0, u_xlat0);
					    u_xlat1 = sqrt(u_xlat1);
					    u_xlat0 = u_xlat0 / vec4(u_xlat1);
					    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.200000003, -0.200000003, -0.200000003, -0.200000003);
					    SV_Target0 = u_xlat0 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976);
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