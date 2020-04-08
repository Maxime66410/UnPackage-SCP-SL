Shader "CameraFilterPack/CameraFilterPack_Classic_ThermalVision" {
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
			GpuProgramID 31457
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
					uniform 	float Fade;
					uniform 	float Crt;
					uniform 	float Curve;
					uniform 	float Color1;
					uniform 	float Color2;
					uniform 	float Color3;
					uniform 	vec4 _ScreenResolution;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat6;
					float u_xlat7;
					float u_xlat10;
					vec2 u_xlat11;
					vec2 u_xlat12;
					float u_xlat15;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat10 = _Speed * _TimeX;
					    u_xlat15 = vs_TEXCOORD0.y * 2.0 + u_xlat10;
					    u_xlat1.x = u_xlat15 + 4.0;
					    u_xlat15 = cos(u_xlat15);
					    u_xlat15 = max(u_xlat15, 0.0);
					    u_xlat1.x = cos(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 10.0;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat0.y = u_xlat15 * vs_TEXCOORD0.x;
					    u_xlat1.xy = u_xlat0.xy * vec2(128.0, 128.0);
					    u_xlat11.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.x = u_xlat11.y * 59.0 + u_xlat11.x;
					    u_xlat11.x = sin(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat0.x = u_xlat11.x * 43812.1758;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat11.x = (-u_xlat0.x) + u_xlat2.x;
					    u_xlat2.xw = u_xlat1.xy * u_xlat1.xy;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat1.xy * u_xlat2.xw;
					    u_xlat0.x = u_xlat1.x * u_xlat11.x + u_xlat0.x;
					    u_xlat11.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat1.x = u_xlat1.x * u_xlat11.x + u_xlat2.y;
					    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
					    u_xlat0.x = u_xlat1.y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat5.x = u_xlat15 * vs_TEXCOORD0.x + (-u_xlat0.x);
					    u_xlat15 = Curve * 0.899999976;
					    u_xlat0.x = u_xlat15 * u_xlat5.x + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.0500000007;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.y = 0.0;
					    u_xlat1.xy = vec2(Curve) * u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat1.y * _ScreenResolution.y;
					    u_xlat0.x = u_xlat0.x * 0.119999997 + u_xlat10;
					    u_xlat2 = vec4(u_xlat10) * vec4(1.27999997, 2.55999994, 10.0, 6.0);
					    u_xlat5.xz = floor(u_xlat2.xy);
					    u_xlat0.y = u_xlat5.z * 59.0 + u_xlat5.x;
					    u_xlat0.xw = sin(u_xlat0.xy);
					    u_xlat3.xyz = u_xlat0.yyy + vec3(1.0, 59.0, 60.0);
					    u_xlat3.xyz = sin(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat5.x = u_xlat0.w * 43812.1758;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat15 = (-u_xlat5.x) + u_xlat3.x;
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat3.xw = u_xlat2.xy * u_xlat2.xy;
					    u_xlat2.xy = (-u_xlat2.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat2.xy = u_xlat2.xy * u_xlat3.xw;
					    u_xlat5.x = u_xlat2.x * u_xlat15 + u_xlat5.x;
					    u_xlat15 = (-u_xlat3.y) + u_xlat3.z;
					    u_xlat15 = u_xlat2.x * u_xlat15 + u_xlat3.y;
					    u_xlat15 = (-u_xlat5.x) + u_xlat15;
					    u_xlat5.x = u_xlat2.y * u_xlat15 + u_xlat5.x;
					    u_xlat15 = u_xlat5.x * 0.0250000004;
					    u_xlat5.x = u_xlat5.x * u_xlat0.x;
					    u_xlat1.z = u_xlat15 * u_xlat0.x + u_xlat1.y;
					    u_xlat0.xw = u_xlat1.xz + vec2(-0.5, -0.5);
					    u_xlat3.xy = u_xlat5.xx * vec2(0.00999999978, 0.0240000002) + u_xlat1.yy;
					    u_xlat5.x = Curve * 2.0 + 0.00999999978;
					    u_xlat11.x = abs(u_xlat0.w) / u_xlat5.x;
					    u_xlat11.x = u_xlat11.x * u_xlat11.x + 1.0;
					    u_xlat2.x = u_xlat0.x * u_xlat11.x;
					    u_xlat0.x = abs(u_xlat2.x) / u_xlat5.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + 1.0;
					    u_xlat2.y = u_xlat0.x * u_xlat0.w;
					    u_xlat0.xw = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat4 = texture(_MainTex, u_xlat0.xw);
					    u_xlat0.xw = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = Crt * 2.0 + 0.00999999978;
					    u_xlat6.x = u_xlat6.x * Curve + 0.00999999978;
					    u_xlat11.x = abs(u_xlat0.w) / u_xlat6.x;
					    u_xlat11.x = u_xlat11.x * u_xlat11.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat11.x;
					    u_xlat0.x = abs(u_xlat0.x) / u_xlat6.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.w * u_xlat0.x + 0.5;
					    u_xlat0.x = u_xlat0.x * _ScreenResolution.y;
					    u_xlat0.w = u_xlat0.x * 0.0199999996 + u_xlat2.w;
					    u_xlat0.x = u_xlat0.x * 0.699999988 + (-u_xlat2.z);
					    u_xlat0.xw = sin(u_xlat0.xw);
					    u_xlat15 = (-u_xlat0.x) + u_xlat0.w;
					    u_xlat0.x = u_xlat15 * 0.5 + u_xlat0.x;
					    u_xlat1.w = u_xlat3.x;
					    u_xlat6.xy = u_xlat1.xw + vec2(-0.5, -0.5);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat1.xw = u_xlat3.zy + vec2(-0.5, -0.5);
					    u_xlat15 = abs(u_xlat6.y) / u_xlat5.x;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat2.x = u_xlat15 * u_xlat6.x;
					    u_xlat15 = abs(u_xlat2.x) / u_xlat5.x;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat2.y = u_xlat15 * u_xlat6.y;
					    u_xlat6.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat10_2 = texture(_MainTex, u_xlat6.xy);
					    u_xlat4.y = u_xlat10_2.y;
					    u_xlat15 = abs(u_xlat1.w) / u_xlat5.x;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat1.x = u_xlat15 * u_xlat1.x;
					    u_xlat5.x = abs(u_xlat1.x) / u_xlat5.x;
					    u_xlat5.x = u_xlat5.x * u_xlat5.x + 1.0;
					    u_xlat1.y = u_xlat5.x * u_xlat1.w;
					    u_xlat5.xz = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_MainTex, u_xlat5.xz);
					    u_xlat4.z = u_xlat10_1.z;
					    u_xlat0.xyw = u_xlat0.xxx + (-u_xlat4.xyz);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(0.0500000007, 0.0500000007, 0.0500000007) + u_xlat4.xyz;
					    u_xlat1.xy = vec2(u_xlat10) * vec2(6.0, 6.0) + vs_TEXCOORD0.xy;
					    u_xlat1.zw = (-vec2(u_xlat10)) * vec2(4.0, 4.0) + vs_TEXCOORD0.xy;
					    u_xlat1 = u_xlat1 * vec4(128.0, 128.0, 128.0, 128.0);
					    u_xlat2.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat10 = u_xlat2.y * 59.0 + u_xlat2.x;
					    u_xlat2.xyz = vec3(u_xlat10) + vec3(1.0, 59.0, 60.0);
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 43812.1758;
					    u_xlat10 = fract(u_xlat10);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat12.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat3.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat1.xy * u_xlat3.xy;
					    u_xlat7 = u_xlat1.x * u_xlat12.x + u_xlat2.y;
					    u_xlat2.x = (-u_xlat10) + u_xlat2.x;
					    u_xlat10 = u_xlat1.x * u_xlat2.x + u_xlat10;
					    u_xlat1.x = (-u_xlat10) + u_xlat7;
					    u_xlat10 = u_xlat1.y * u_xlat1.x + u_xlat10;
					    u_xlat1.xy = floor(u_xlat1.zw);
					    u_xlat1.x = u_xlat1.y * 59.0 + u_xlat1.x;
					    u_xlat2.xyz = u_xlat1.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43812.1758;
					    u_xlat1.xzw = fract(u_xlat1.xzw);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat6.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat12.xy = u_xlat1.zw * u_xlat1.zw;
					    u_xlat11.xy = (-u_xlat1.zw) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy;
					    u_xlat6.x = u_xlat11.x * u_xlat6.x + u_xlat2.y;
					    u_xlat2.x = (-u_xlat1.x) + u_xlat2.x;
					    u_xlat1.x = u_xlat11.x * u_xlat2.x + u_xlat1.x;
					    u_xlat6.x = (-u_xlat1.x) + u_xlat6.x;
					    u_xlat1.x = u_xlat11.y * u_xlat6.x + u_xlat1.x;
					    u_xlat10 = u_xlat10 + u_xlat1.x;
					    u_xlat10 = max(u_xlat10, 0.959999979);
					    u_xlat10 = min(u_xlat10, 1.0);
					    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyw;
					    u_xlat0.x = dot(vec3(0.400000006, 0.379999995, 0.25), u_xlat0.xyz);
					    u_xlatb5 = u_xlat0.x<0.5;
					    u_xlat0.z = u_xlat0.x + -0.5;
					    u_xlat0.xz = u_xlat0.xz + u_xlat0.xz;
					    u_xlat1.xy = vec2(Color2, Color1);
					    u_xlat2.x = (-u_xlat1.x) + Color3;
					    u_xlat1.z = 0.0;
					    u_xlat2.yz = (-u_xlat1.yz);
					    u_xlat2.xyz = u_xlat0.zzz * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = Color1;
					    u_xlat3.xyz = u_xlat1.xyz + (-u_xlat3.xyz);
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.zzy;
					    u_xlat0.xyz = (bool(u_xlatb5)) ? u_xlat0.xzw : u_xlat2.xyz;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_1.xyz;
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
					; Bound: 1094
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %1071 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %21 0 Offset 21 
					                                                      OpMemberDecorate %21 1 Offset 21 
					                                                      OpMemberDecorate %21 2 Offset 21 
					                                                      OpMemberDecorate %21 3 Offset 21 
					                                                      OpMemberDecorate %21 4 Offset 21 
					                                                      OpMemberDecorate %21 5 Offset 21 
					                                                      OpMemberDecorate %21 6 Offset 21 
					                                                      OpMemberDecorate %21 7 Offset 21 
					                                                      OpMemberDecorate %21 8 Offset 21 
					                                                      OpDecorate %21 Block 
					                                                      OpDecorate %23 DescriptorSet 23 
					                                                      OpDecorate %23 Binding 23 
					                                                      OpDecorate %485 RelaxedPrecision 
					                                                      OpDecorate %485 DescriptorSet 485 
					                                                      OpDecorate %485 Binding 485 
					                                                      OpDecorate %486 RelaxedPrecision 
					                                                      OpDecorate %489 RelaxedPrecision 
					                                                      OpDecorate %489 DescriptorSet 489 
					                                                      OpDecorate %489 Binding 489 
					                                                      OpDecorate %490 RelaxedPrecision 
					                                                      OpDecorate %645 RelaxedPrecision 
					                                                      OpDecorate %646 RelaxedPrecision 
					                                                      OpDecorate %692 RelaxedPrecision 
					                                                      OpDecorate %693 RelaxedPrecision 
					                                                      OpDecorate %1056 RelaxedPrecision 
					                                                      OpDecorate %1057 RelaxedPrecision 
					                                                      OpDecorate %1058 RelaxedPrecision 
					                                                      OpDecorate %1062 RelaxedPrecision 
					                                                      OpDecorate %1065 RelaxedPrecision 
					                                                      OpDecorate %1066 RelaxedPrecision 
					                                                      OpDecorate %1071 Location 1071 
					                                                      OpDecorate %1087 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeInt 32 0 
					                                          u32 %14 = OpConstant 0 
					                                              %15 = OpTypePointer Input %6 
					                                              %18 = OpTypePointer Private %6 
					                                 Private f32* %20 = OpVariable Private 
					                                              %21 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %7 
					                                              %22 = OpTypePointer Uniform %21 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %23 = OpVariable Uniform 
					                                              %24 = OpTypeInt 32 1 
					                                          i32 %25 = OpConstant 1 
					                                              %26 = OpTypePointer Uniform %6 
					                                          i32 %29 = OpConstant 0 
					                                 Private f32* %33 = OpVariable Private 
					                                          u32 %34 = OpConstant 1 
					                                          f32 %37 = OpConstant 3,674022E-40 
					                               Private f32_4* %41 = OpVariable Private 
					                                          f32 %43 = OpConstant 3,674022E-40 
					                                          f32 %49 = OpConstant 3,674022E-40 
					                                          f32 %57 = OpConstant 3,674022E-40 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                          f32 %76 = OpConstant 3,674022E-40 
					                                        f32_2 %77 = OpConstantComposite %76 %76 
					                                              %81 = OpTypePointer Private %10 
					                               Private f32_2* %82 = OpVariable Private 
					                                          f32 %93 = OpConstant 3,674022E-40 
					                              Private f32_4* %103 = OpVariable Private 
					                                             %104 = OpTypeVector %6 3 
					                                         f32 %107 = OpConstant 3,674022E-40 
					                                       f32_3 %108 = OpConstantComposite %62 %93 %107 
					                                         f32 %119 = OpConstant 3,674022E-40 
					                                       f32_3 %120 = OpConstantComposite %119 %119 %119 
					                                       f32_2 %154 = OpConstantComposite %37 %37 
					                                         f32 %156 = OpConstant 3,674022E-40 
					                                       f32_2 %157 = OpConstantComposite %156 %156 
					                                         u32 %180 = OpConstant 2 
					                                             %216 = OpTypePointer Private %104 
					                              Private f32_3* %217 = OpVariable Private 
					                                         i32 %227 = OpConstant 4 
					                                         f32 %230 = OpConstant 3,674022E-40 
					                                         f32 %242 = OpConstant 3,674022E-40 
					                                         i32 %262 = OpConstant 8 
					                                         f32 %269 = OpConstant 3,674022E-40 
					                                         f32 %276 = OpConstant 3,674022E-40 
					                                         f32 %277 = OpConstant 3,674022E-40 
					                                         f32 %278 = OpConstant 3,674022E-40 
					                                       f32_4 %279 = OpConstantComposite %276 %277 %57 %278 
					                              Private f32_4* %298 = OpVariable Private 
					                                         u32 %319 = OpConstant 3 
					                                         f32 %396 = OpConstant 3,674022E-40 
					                                         f32 %414 = OpConstant 3,674022E-40 
					                                       f32_2 %415 = OpConstantComposite %414 %414 
					                                         f32 %421 = OpConstant 3,674022E-40 
					                                         f32 %422 = OpConstant 3,674022E-40 
					                                       f32_2 %423 = OpConstantComposite %421 %422 
					                                         f32 %477 = OpConstant 3,674022E-40 
					                                       f32_2 %478 = OpConstantComposite %477 %477 
					                              Private f32_3* %482 = OpVariable Private 
					                                             %483 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %484 = OpTypePointer UniformConstant %483 
					        UniformConstant read_only Texture2D* %485 = OpVariable UniformConstant 
					                                             %487 = OpTypeSampler 
					                                             %488 = OpTypePointer UniformConstant %487 
					                    UniformConstant sampler* %489 = OpVariable UniformConstant 
					                                             %491 = OpTypeSampledImage %483 
					                              Private f32_2* %503 = OpVariable Private 
					                                         i32 %504 = OpConstant 3 
					                                         f32 %566 = OpConstant 3,674022E-40 
					                                         f32 %574 = OpConstant 3,674022E-40 
					                                       f32_3 %709 = OpConstantComposite %242 %242 %242 
					                                       f32_2 %717 = OpConstantComposite %278 %278 
					                                       f32_2 %726 = OpConstantComposite %43 %43 
					                                       f32_4 %733 = OpConstantComposite %76 %76 %76 %76 
					                              Private f32_2* %777 = OpVariable Private 
					                                Private f32* %806 = OpVariable Private 
					                                         f32 %951 = OpConstant 3,674022E-40 
					                                         f32 %962 = OpConstant 3,674022E-40 
					                                         f32 %963 = OpConstant 3,674022E-40 
					                                         f32 %964 = OpConstant 3,674022E-40 
					                                       f32_3 %965 = OpConstantComposite %962 %963 %964 
					                                             %970 = OpTypeBool 
					                                             %971 = OpTypePointer Private %970 
					                               Private bool* %972 = OpVariable Private 
					                                         i32 %987 = OpConstant 6 
					                                         i32 %990 = OpConstant 5 
					                                         i32 %999 = OpConstant 7 
					                                            %1044 = OpTypePointer Function %104 
					                             Private f32_3* %1056 = OpVariable Private 
					                                            %1070 = OpTypePointer Output %7 
					                              Output f32_4* %1071 = OpVariable Output 
					                                        i32 %1072 = OpConstant 2 
					                                            %1091 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                            Function f32_3* %1045 = OpVariable Function 
					                                   Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
					                                          f32 %17 = OpLoad %16 
					                                 Private f32* %19 = OpAccessChain %9 %14 
					                                                      OpStore %19 %17 
					                                 Uniform f32* %27 = OpAccessChain %23 %25 
					                                          f32 %28 = OpLoad %27 
					                                 Uniform f32* %30 = OpAccessChain %23 %29 
					                                          f32 %31 = OpLoad %30 
					                                          f32 %32 = OpFMul %28 %31 
					                                                      OpStore %20 %32 
					                                   Input f32* %35 = OpAccessChain vs_TEXCOORD0 %34 
					                                          f32 %36 = OpLoad %35 
					                                          f32 %38 = OpFMul %36 %37 
					                                          f32 %39 = OpLoad %20 
					                                          f32 %40 = OpFAdd %38 %39 
					                                                      OpStore %33 %40 
					                                          f32 %42 = OpLoad %33 
					                                          f32 %44 = OpFAdd %42 %43 
					                                 Private f32* %45 = OpAccessChain %41 %14 
					                                                      OpStore %45 %44 
					                                          f32 %46 = OpLoad %33 
					                                          f32 %47 = OpExtInst %1 14 %46 
					                                                      OpStore %33 %47 
					                                          f32 %48 = OpLoad %33 
					                                          f32 %50 = OpExtInst %1 40 %48 %49 
					                                                      OpStore %33 %50 
					                                 Private f32* %51 = OpAccessChain %41 %14 
					                                          f32 %52 = OpLoad %51 
					                                          f32 %53 = OpExtInst %1 14 %52 
					                                 Private f32* %54 = OpAccessChain %41 %14 
					                                                      OpStore %54 %53 
					                                 Private f32* %55 = OpAccessChain %41 %14 
					                                          f32 %56 = OpLoad %55 
					                                          f32 %58 = OpFMul %56 %57 
					                                 Private f32* %59 = OpAccessChain %41 %14 
					                                                      OpStore %59 %58 
					                                 Private f32* %60 = OpAccessChain %41 %14 
					                                          f32 %61 = OpLoad %60 
					                                          f32 %63 = OpExtInst %1 43 %61 %49 %62 
					                                 Private f32* %64 = OpAccessChain %41 %14 
					                                                      OpStore %64 %63 
					                                          f32 %65 = OpLoad %33 
					                                 Private f32* %66 = OpAccessChain %41 %14 
					                                          f32 %67 = OpLoad %66 
					                                          f32 %68 = OpFMul %65 %67 
					                                                      OpStore %33 %68 
					                                          f32 %69 = OpLoad %33 
					                                   Input f32* %70 = OpAccessChain vs_TEXCOORD0 %14 
					                                          f32 %71 = OpLoad %70 
					                                          f32 %72 = OpFMul %69 %71 
					                                 Private f32* %73 = OpAccessChain %9 %34 
					                                                      OpStore %73 %72 
					                                        f32_4 %74 = OpLoad %9 
					                                        f32_2 %75 = OpVectorShuffle %74 %74 0 1 
					                                        f32_2 %78 = OpFMul %75 %77 
					                                        f32_4 %79 = OpLoad %41 
					                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 2 3 
					                                                      OpStore %41 %80 
					                                        f32_4 %83 = OpLoad %41 
					                                        f32_2 %84 = OpVectorShuffle %83 %83 0 1 
					                                        f32_2 %85 = OpExtInst %1 8 %84 
					                                                      OpStore %82 %85 
					                                        f32_4 %86 = OpLoad %41 
					                                        f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                                        f32_2 %88 = OpExtInst %1 10 %87 
					                                        f32_4 %89 = OpLoad %41 
					                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
					                                                      OpStore %41 %90 
					                                 Private f32* %91 = OpAccessChain %82 %34 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %94 = OpFMul %92 %93 
					                                 Private f32* %95 = OpAccessChain %82 %14 
					                                          f32 %96 = OpLoad %95 
					                                          f32 %97 = OpFAdd %94 %96 
					                                 Private f32* %98 = OpAccessChain %9 %14 
					                                                      OpStore %98 %97 
					                                 Private f32* %99 = OpAccessChain %9 %14 
					                                         f32 %100 = OpLoad %99 
					                                         f32 %101 = OpExtInst %1 13 %100 
					                                Private f32* %102 = OpAccessChain %82 %14 
					                                                      OpStore %102 %101 
					                                       f32_4 %105 = OpLoad %9 
					                                       f32_3 %106 = OpVectorShuffle %105 %105 0 0 0 
					                                       f32_3 %109 = OpFAdd %106 %108 
					                                       f32_4 %110 = OpLoad %103 
					                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
					                                                      OpStore %103 %111 
					                                       f32_4 %112 = OpLoad %103 
					                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
					                                       f32_3 %114 = OpExtInst %1 13 %113 
					                                       f32_4 %115 = OpLoad %103 
					                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
					                                                      OpStore %103 %116 
					                                       f32_4 %117 = OpLoad %103 
					                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
					                                       f32_3 %121 = OpFMul %118 %120 
					                                       f32_4 %122 = OpLoad %103 
					                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
					                                                      OpStore %103 %123 
					                                       f32_4 %124 = OpLoad %103 
					                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
					                                       f32_3 %126 = OpExtInst %1 10 %125 
					                                       f32_4 %127 = OpLoad %103 
					                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
					                                                      OpStore %103 %128 
					                                Private f32* %129 = OpAccessChain %82 %14 
					                                         f32 %130 = OpLoad %129 
					                                         f32 %131 = OpFMul %130 %119 
					                                Private f32* %132 = OpAccessChain %9 %14 
					                                                      OpStore %132 %131 
					                                Private f32* %133 = OpAccessChain %9 %14 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpExtInst %1 10 %134 
					                                Private f32* %136 = OpAccessChain %9 %14 
					                                                      OpStore %136 %135 
					                                Private f32* %137 = OpAccessChain %9 %14 
					                                         f32 %138 = OpLoad %137 
					                                         f32 %139 = OpFNegate %138 
					                                Private f32* %140 = OpAccessChain %103 %14 
					                                         f32 %141 = OpLoad %140 
					                                         f32 %142 = OpFAdd %139 %141 
					                                Private f32* %143 = OpAccessChain %82 %14 
					                                                      OpStore %143 %142 
					                                       f32_4 %144 = OpLoad %41 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 0 1 
					                                       f32_4 %146 = OpLoad %41 
					                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
					                                       f32_2 %148 = OpFMul %145 %147 
					                                       f32_4 %149 = OpLoad %103 
					                                       f32_4 %150 = OpVectorShuffle %149 %148 4 1 2 5 
					                                                      OpStore %103 %150 
					                                       f32_4 %151 = OpLoad %41 
					                                       f32_2 %152 = OpVectorShuffle %151 %151 0 1 
					                                       f32_2 %153 = OpFNegate %152 
					                                       f32_2 %155 = OpFMul %153 %154 
					                                       f32_2 %158 = OpFAdd %155 %157 
					                                       f32_4 %159 = OpLoad %41 
					                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 2 3 
					                                                      OpStore %41 %160 
					                                       f32_4 %161 = OpLoad %41 
					                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
					                                       f32_4 %163 = OpLoad %103 
					                                       f32_2 %164 = OpVectorShuffle %163 %163 0 3 
					                                       f32_2 %165 = OpFMul %162 %164 
					                                       f32_4 %166 = OpLoad %41 
					                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 2 3 
					                                                      OpStore %41 %167 
					                                Private f32* %168 = OpAccessChain %41 %14 
					                                         f32 %169 = OpLoad %168 
					                                Private f32* %170 = OpAccessChain %82 %14 
					                                         f32 %171 = OpLoad %170 
					                                         f32 %172 = OpFMul %169 %171 
					                                Private f32* %173 = OpAccessChain %9 %14 
					                                         f32 %174 = OpLoad %173 
					                                         f32 %175 = OpFAdd %172 %174 
					                                Private f32* %176 = OpAccessChain %9 %14 
					                                                      OpStore %176 %175 
					                                Private f32* %177 = OpAccessChain %103 %34 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpFNegate %178 
					                                Private f32* %181 = OpAccessChain %103 %180 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpFAdd %179 %182 
					                                Private f32* %184 = OpAccessChain %82 %14 
					                                                      OpStore %184 %183 
					                                Private f32* %185 = OpAccessChain %41 %14 
					                                         f32 %186 = OpLoad %185 
					                                Private f32* %187 = OpAccessChain %82 %14 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpFMul %186 %188 
					                                Private f32* %190 = OpAccessChain %103 %34 
					                                         f32 %191 = OpLoad %190 
					                                         f32 %192 = OpFAdd %189 %191 
					                                Private f32* %193 = OpAccessChain %41 %14 
					                                                      OpStore %193 %192 
					                                Private f32* %194 = OpAccessChain %9 %14 
					                                         f32 %195 = OpLoad %194 
					                                         f32 %196 = OpFNegate %195 
					                                Private f32* %197 = OpAccessChain %41 %14 
					                                         f32 %198 = OpLoad %197 
					                                         f32 %199 = OpFAdd %196 %198 
					                                Private f32* %200 = OpAccessChain %41 %14 
					                                                      OpStore %200 %199 
					                                Private f32* %201 = OpAccessChain %41 %34 
					                                         f32 %202 = OpLoad %201 
					                                Private f32* %203 = OpAccessChain %41 %14 
					                                         f32 %204 = OpLoad %203 
					                                         f32 %205 = OpFMul %202 %204 
					                                Private f32* %206 = OpAccessChain %9 %14 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFAdd %205 %207 
					                                Private f32* %209 = OpAccessChain %9 %14 
					                                                      OpStore %209 %208 
					                                Private f32* %210 = OpAccessChain %9 %34 
					                                         f32 %211 = OpLoad %210 
					                                Private f32* %212 = OpAccessChain %9 %14 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpFMul %211 %213 
					                                Private f32* %215 = OpAccessChain %9 %14 
					                                                      OpStore %215 %214 
					                                         f32 %218 = OpLoad %33 
					                                  Input f32* %219 = OpAccessChain vs_TEXCOORD0 %14 
					                                         f32 %220 = OpLoad %219 
					                                         f32 %221 = OpFMul %218 %220 
					                                Private f32* %222 = OpAccessChain %9 %14 
					                                         f32 %223 = OpLoad %222 
					                                         f32 %224 = OpFNegate %223 
					                                         f32 %225 = OpFAdd %221 %224 
					                                Private f32* %226 = OpAccessChain %217 %14 
					                                                      OpStore %226 %225 
					                                Uniform f32* %228 = OpAccessChain %23 %227 
					                                         f32 %229 = OpLoad %228 
					                                         f32 %231 = OpFMul %229 %230 
					                                                      OpStore %33 %231 
					                                         f32 %232 = OpLoad %33 
					                                Private f32* %233 = OpAccessChain %217 %14 
					                                         f32 %234 = OpLoad %233 
					                                         f32 %235 = OpFMul %232 %234 
					                                Private f32* %236 = OpAccessChain %9 %14 
					                                         f32 %237 = OpLoad %236 
					                                         f32 %238 = OpFAdd %235 %237 
					                                Private f32* %239 = OpAccessChain %9 %14 
					                                                      OpStore %239 %238 
					                                Private f32* %240 = OpAccessChain %9 %14 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %243 = OpFMul %241 %242 
					                                Private f32* %244 = OpAccessChain %9 %14 
					                                                      OpStore %244 %243 
					                                Private f32* %245 = OpAccessChain %9 %14 
					                                         f32 %246 = OpLoad %245 
					                                         f32 %247 = OpFNegate %246 
					                                Private f32* %248 = OpAccessChain %9 %14 
					                                                      OpStore %248 %247 
					                                Private f32* %249 = OpAccessChain %9 %34 
					                                                      OpStore %249 %49 
					                                Uniform f32* %250 = OpAccessChain %23 %227 
					                                         f32 %251 = OpLoad %250 
					                                       f32_2 %252 = OpCompositeConstruct %251 %251 
					                                       f32_4 %253 = OpLoad %9 
					                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
					                                       f32_2 %255 = OpFMul %252 %254 
					                                       f32_2 %256 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %257 = OpFAdd %255 %256 
					                                       f32_4 %258 = OpLoad %41 
					                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 2 3 
					                                                      OpStore %41 %259 
					                                Private f32* %260 = OpAccessChain %41 %34 
					                                         f32 %261 = OpLoad %260 
					                                Uniform f32* %263 = OpAccessChain %23 %262 %34 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %265 = OpFMul %261 %264 
					                                Private f32* %266 = OpAccessChain %9 %14 
					                                                      OpStore %266 %265 
					                                Private f32* %267 = OpAccessChain %9 %14 
					                                         f32 %268 = OpLoad %267 
					                                         f32 %270 = OpFMul %268 %269 
					                                         f32 %271 = OpLoad %20 
					                                         f32 %272 = OpFAdd %270 %271 
					                                Private f32* %273 = OpAccessChain %9 %14 
					                                                      OpStore %273 %272 
					                                         f32 %274 = OpLoad %20 
					                                       f32_4 %275 = OpCompositeConstruct %274 %274 %274 %274 
					                                       f32_4 %280 = OpFMul %275 %279 
					                                                      OpStore %103 %280 
					                                       f32_4 %281 = OpLoad %103 
					                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
					                                       f32_2 %283 = OpExtInst %1 8 %282 
					                                       f32_3 %284 = OpLoad %217 
					                                       f32_3 %285 = OpVectorShuffle %284 %283 3 1 4 
					                                                      OpStore %217 %285 
					                                Private f32* %286 = OpAccessChain %217 %180 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFMul %287 %93 
					                                Private f32* %289 = OpAccessChain %217 %14 
					                                         f32 %290 = OpLoad %289 
					                                         f32 %291 = OpFAdd %288 %290 
					                                Private f32* %292 = OpAccessChain %9 %34 
					                                                      OpStore %292 %291 
					                                       f32_4 %293 = OpLoad %9 
					                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
					                                       f32_2 %295 = OpExtInst %1 13 %294 
					                                       f32_4 %296 = OpLoad %9 
					                                       f32_4 %297 = OpVectorShuffle %296 %295 4 1 2 5 
					                                                      OpStore %9 %297 
					                                       f32_4 %299 = OpLoad %9 
					                                       f32_3 %300 = OpVectorShuffle %299 %299 1 1 1 
					                                       f32_3 %301 = OpFAdd %300 %108 
					                                       f32_4 %302 = OpLoad %298 
					                                       f32_4 %303 = OpVectorShuffle %302 %301 4 5 6 3 
					                                                      OpStore %298 %303 
					                                       f32_4 %304 = OpLoad %298 
					                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
					                                       f32_3 %306 = OpExtInst %1 13 %305 
					                                       f32_4 %307 = OpLoad %298 
					                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 6 3 
					                                                      OpStore %298 %308 
					                                       f32_4 %309 = OpLoad %298 
					                                       f32_3 %310 = OpVectorShuffle %309 %309 0 1 2 
					                                       f32_3 %311 = OpFMul %310 %120 
					                                       f32_4 %312 = OpLoad %298 
					                                       f32_4 %313 = OpVectorShuffle %312 %311 4 5 6 3 
					                                                      OpStore %298 %313 
					                                       f32_4 %314 = OpLoad %298 
					                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
					                                       f32_3 %316 = OpExtInst %1 10 %315 
					                                       f32_4 %317 = OpLoad %298 
					                                       f32_4 %318 = OpVectorShuffle %317 %316 4 5 6 3 
					                                                      OpStore %298 %318 
					                                Private f32* %320 = OpAccessChain %9 %319 
					                                         f32 %321 = OpLoad %320 
					                                         f32 %322 = OpFMul %321 %119 
					                                Private f32* %323 = OpAccessChain %217 %14 
					                                                      OpStore %323 %322 
					                                Private f32* %324 = OpAccessChain %217 %14 
					                                         f32 %325 = OpLoad %324 
					                                         f32 %326 = OpExtInst %1 10 %325 
					                                Private f32* %327 = OpAccessChain %217 %14 
					                                                      OpStore %327 %326 
					                                Private f32* %328 = OpAccessChain %217 %14 
					                                         f32 %329 = OpLoad %328 
					                                         f32 %330 = OpFNegate %329 
					                                Private f32* %331 = OpAccessChain %298 %14 
					                                         f32 %332 = OpLoad %331 
					                                         f32 %333 = OpFAdd %330 %332 
					                                                      OpStore %33 %333 
					                                       f32_4 %334 = OpLoad %103 
					                                       f32_2 %335 = OpVectorShuffle %334 %334 0 1 
					                                       f32_2 %336 = OpExtInst %1 10 %335 
					                                       f32_4 %337 = OpLoad %103 
					                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 2 3 
					                                                      OpStore %103 %338 
					                                       f32_4 %339 = OpLoad %103 
					                                       f32_2 %340 = OpVectorShuffle %339 %339 0 1 
					                                       f32_4 %341 = OpLoad %103 
					                                       f32_2 %342 = OpVectorShuffle %341 %341 0 1 
					                                       f32_2 %343 = OpFMul %340 %342 
					                                       f32_4 %344 = OpLoad %298 
					                                       f32_4 %345 = OpVectorShuffle %344 %343 4 1 2 5 
					                                                      OpStore %298 %345 
					                                       f32_4 %346 = OpLoad %103 
					                                       f32_2 %347 = OpVectorShuffle %346 %346 0 1 
					                                       f32_2 %348 = OpFNegate %347 
					                                       f32_2 %349 = OpFMul %348 %154 
					                                       f32_2 %350 = OpFAdd %349 %157 
					                                       f32_4 %351 = OpLoad %103 
					                                       f32_4 %352 = OpVectorShuffle %351 %350 4 5 2 3 
					                                                      OpStore %103 %352 
					                                       f32_4 %353 = OpLoad %103 
					                                       f32_2 %354 = OpVectorShuffle %353 %353 0 1 
					                                       f32_4 %355 = OpLoad %298 
					                                       f32_2 %356 = OpVectorShuffle %355 %355 0 3 
					                                       f32_2 %357 = OpFMul %354 %356 
					                                       f32_4 %358 = OpLoad %103 
					                                       f32_4 %359 = OpVectorShuffle %358 %357 4 5 2 3 
					                                                      OpStore %103 %359 
					                                Private f32* %360 = OpAccessChain %103 %14 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpLoad %33 
					                                         f32 %363 = OpFMul %361 %362 
					                                Private f32* %364 = OpAccessChain %217 %14 
					                                         f32 %365 = OpLoad %364 
					                                         f32 %366 = OpFAdd %363 %365 
					                                Private f32* %367 = OpAccessChain %217 %14 
					                                                      OpStore %367 %366 
					                                Private f32* %368 = OpAccessChain %298 %34 
					                                         f32 %369 = OpLoad %368 
					                                         f32 %370 = OpFNegate %369 
					                                Private f32* %371 = OpAccessChain %298 %180 
					                                         f32 %372 = OpLoad %371 
					                                         f32 %373 = OpFAdd %370 %372 
					                                                      OpStore %33 %373 
					                                Private f32* %374 = OpAccessChain %103 %14 
					                                         f32 %375 = OpLoad %374 
					                                         f32 %376 = OpLoad %33 
					                                         f32 %377 = OpFMul %375 %376 
					                                Private f32* %378 = OpAccessChain %298 %34 
					                                         f32 %379 = OpLoad %378 
					                                         f32 %380 = OpFAdd %377 %379 
					                                                      OpStore %33 %380 
					                                Private f32* %381 = OpAccessChain %217 %14 
					                                         f32 %382 = OpLoad %381 
					                                         f32 %383 = OpFNegate %382 
					                                         f32 %384 = OpLoad %33 
					                                         f32 %385 = OpFAdd %383 %384 
					                                                      OpStore %33 %385 
					                                Private f32* %386 = OpAccessChain %103 %34 
					                                         f32 %387 = OpLoad %386 
					                                         f32 %388 = OpLoad %33 
					                                         f32 %389 = OpFMul %387 %388 
					                                Private f32* %390 = OpAccessChain %217 %14 
					                                         f32 %391 = OpLoad %390 
					                                         f32 %392 = OpFAdd %389 %391 
					                                Private f32* %393 = OpAccessChain %217 %14 
					                                                      OpStore %393 %392 
					                                Private f32* %394 = OpAccessChain %217 %14 
					                                         f32 %395 = OpLoad %394 
					                                         f32 %397 = OpFMul %395 %396 
					                                                      OpStore %33 %397 
					                                Private f32* %398 = OpAccessChain %217 %14 
					                                         f32 %399 = OpLoad %398 
					                                Private f32* %400 = OpAccessChain %9 %14 
					                                         f32 %401 = OpLoad %400 
					                                         f32 %402 = OpFMul %399 %401 
					                                Private f32* %403 = OpAccessChain %217 %14 
					                                                      OpStore %403 %402 
					                                         f32 %404 = OpLoad %33 
					                                Private f32* %405 = OpAccessChain %9 %14 
					                                         f32 %406 = OpLoad %405 
					                                         f32 %407 = OpFMul %404 %406 
					                                Private f32* %408 = OpAccessChain %41 %34 
					                                         f32 %409 = OpLoad %408 
					                                         f32 %410 = OpFAdd %407 %409 
					                                Private f32* %411 = OpAccessChain %41 %180 
					                                                      OpStore %411 %410 
					                                       f32_4 %412 = OpLoad %41 
					                                       f32_2 %413 = OpVectorShuffle %412 %412 0 2 
					                                       f32_2 %416 = OpFAdd %413 %415 
					                                       f32_4 %417 = OpLoad %9 
					                                       f32_4 %418 = OpVectorShuffle %417 %416 4 1 2 5 
					                                                      OpStore %9 %418 
					                                       f32_3 %419 = OpLoad %217 
					                                       f32_2 %420 = OpVectorShuffle %419 %419 0 0 
					                                       f32_2 %424 = OpFMul %420 %423 
					                                       f32_4 %425 = OpLoad %41 
					                                       f32_2 %426 = OpVectorShuffle %425 %425 1 1 
					                                       f32_2 %427 = OpFAdd %424 %426 
					                                       f32_4 %428 = OpLoad %298 
					                                       f32_4 %429 = OpVectorShuffle %428 %427 4 5 2 3 
					                                                      OpStore %298 %429 
					                                Uniform f32* %430 = OpAccessChain %23 %227 
					                                         f32 %431 = OpLoad %430 
					                                         f32 %432 = OpFMul %431 %37 
					                                         f32 %433 = OpFAdd %432 %421 
					                                Private f32* %434 = OpAccessChain %217 %14 
					                                                      OpStore %434 %433 
					                                Private f32* %435 = OpAccessChain %9 %319 
					                                         f32 %436 = OpLoad %435 
					                                         f32 %437 = OpExtInst %1 4 %436 
					                                Private f32* %438 = OpAccessChain %217 %14 
					                                         f32 %439 = OpLoad %438 
					                                         f32 %440 = OpFDiv %437 %439 
					                                Private f32* %441 = OpAccessChain %82 %14 
					                                                      OpStore %441 %440 
					                                Private f32* %442 = OpAccessChain %82 %14 
					                                         f32 %443 = OpLoad %442 
					                                Private f32* %444 = OpAccessChain %82 %14 
					                                         f32 %445 = OpLoad %444 
					                                         f32 %446 = OpFMul %443 %445 
					                                         f32 %447 = OpFAdd %446 %62 
					                                Private f32* %448 = OpAccessChain %82 %14 
					                                                      OpStore %448 %447 
					                                Private f32* %449 = OpAccessChain %9 %14 
					                                         f32 %450 = OpLoad %449 
					                                Private f32* %451 = OpAccessChain %82 %14 
					                                         f32 %452 = OpLoad %451 
					                                         f32 %453 = OpFMul %450 %452 
					                                Private f32* %454 = OpAccessChain %103 %14 
					                                                      OpStore %454 %453 
					                                Private f32* %455 = OpAccessChain %103 %14 
					                                         f32 %456 = OpLoad %455 
					                                         f32 %457 = OpExtInst %1 4 %456 
					                                Private f32* %458 = OpAccessChain %217 %14 
					                                         f32 %459 = OpLoad %458 
					                                         f32 %460 = OpFDiv %457 %459 
					                                Private f32* %461 = OpAccessChain %9 %14 
					                                                      OpStore %461 %460 
					                                Private f32* %462 = OpAccessChain %9 %14 
					                                         f32 %463 = OpLoad %462 
					                                Private f32* %464 = OpAccessChain %9 %14 
					                                         f32 %465 = OpLoad %464 
					                                         f32 %466 = OpFMul %463 %465 
					                                         f32 %467 = OpFAdd %466 %62 
					                                Private f32* %468 = OpAccessChain %9 %14 
					                                                      OpStore %468 %467 
					                                Private f32* %469 = OpAccessChain %9 %14 
					                                         f32 %470 = OpLoad %469 
					                                Private f32* %471 = OpAccessChain %9 %319 
					                                         f32 %472 = OpLoad %471 
					                                         f32 %473 = OpFMul %470 %472 
					                                Private f32* %474 = OpAccessChain %103 %34 
					                                                      OpStore %474 %473 
					                                       f32_4 %475 = OpLoad %103 
					                                       f32_2 %476 = OpVectorShuffle %475 %475 0 1 
					                                       f32_2 %479 = OpFAdd %476 %478 
					                                       f32_4 %480 = OpLoad %9 
					                                       f32_4 %481 = OpVectorShuffle %480 %479 4 1 2 5 
					                                                      OpStore %9 %481 
					                         read_only Texture2D %486 = OpLoad %485 
					                                     sampler %490 = OpLoad %489 
					                  read_only Texture2DSampled %492 = OpSampledImage %486 %490 
					                                       f32_4 %493 = OpLoad %9 
					                                       f32_2 %494 = OpVectorShuffle %493 %493 0 3 
					                                       f32_4 %495 = OpImageSampleImplicitLod %492 %494 
					                                         f32 %496 = OpCompositeExtract %495 0 
					                                Private f32* %497 = OpAccessChain %482 %14 
					                                                      OpStore %497 %496 
					                                       f32_4 %498 = OpLoad %41 
					                                       f32_2 %499 = OpVectorShuffle %498 %498 0 1 
					                                       f32_2 %500 = OpFAdd %499 %415 
					                                       f32_4 %501 = OpLoad %9 
					                                       f32_4 %502 = OpVectorShuffle %501 %500 4 1 2 5 
					                                                      OpStore %9 %502 
					                                Uniform f32* %505 = OpAccessChain %23 %504 
					                                         f32 %506 = OpLoad %505 
					                                         f32 %507 = OpFMul %506 %37 
					                                         f32 %508 = OpFAdd %507 %421 
					                                Private f32* %509 = OpAccessChain %503 %14 
					                                                      OpStore %509 %508 
					                                Private f32* %510 = OpAccessChain %503 %14 
					                                         f32 %511 = OpLoad %510 
					                                Uniform f32* %512 = OpAccessChain %23 %227 
					                                         f32 %513 = OpLoad %512 
					                                         f32 %514 = OpFMul %511 %513 
					                                         f32 %515 = OpFAdd %514 %421 
					                                Private f32* %516 = OpAccessChain %503 %14 
					                                                      OpStore %516 %515 
					                                Private f32* %517 = OpAccessChain %9 %319 
					                                         f32 %518 = OpLoad %517 
					                                         f32 %519 = OpExtInst %1 4 %518 
					                                Private f32* %520 = OpAccessChain %503 %14 
					                                         f32 %521 = OpLoad %520 
					                                         f32 %522 = OpFDiv %519 %521 
					                                Private f32* %523 = OpAccessChain %82 %14 
					                                                      OpStore %523 %522 
					                                Private f32* %524 = OpAccessChain %82 %14 
					                                         f32 %525 = OpLoad %524 
					                                Private f32* %526 = OpAccessChain %82 %14 
					                                         f32 %527 = OpLoad %526 
					                                         f32 %528 = OpFMul %525 %527 
					                                         f32 %529 = OpFAdd %528 %62 
					                                Private f32* %530 = OpAccessChain %82 %14 
					                                                      OpStore %530 %529 
					                                Private f32* %531 = OpAccessChain %9 %14 
					                                         f32 %532 = OpLoad %531 
					                                Private f32* %533 = OpAccessChain %82 %14 
					                                         f32 %534 = OpLoad %533 
					                                         f32 %535 = OpFMul %532 %534 
					                                Private f32* %536 = OpAccessChain %9 %14 
					                                                      OpStore %536 %535 
					                                Private f32* %537 = OpAccessChain %9 %14 
					                                         f32 %538 = OpLoad %537 
					                                         f32 %539 = OpExtInst %1 4 %538 
					                                Private f32* %540 = OpAccessChain %503 %14 
					                                         f32 %541 = OpLoad %540 
					                                         f32 %542 = OpFDiv %539 %541 
					                                Private f32* %543 = OpAccessChain %9 %14 
					                                                      OpStore %543 %542 
					                                Private f32* %544 = OpAccessChain %9 %14 
					                                         f32 %545 = OpLoad %544 
					                                Private f32* %546 = OpAccessChain %9 %14 
					                                         f32 %547 = OpLoad %546 
					                                         f32 %548 = OpFMul %545 %547 
					                                         f32 %549 = OpFAdd %548 %62 
					                                Private f32* %550 = OpAccessChain %9 %14 
					                                                      OpStore %550 %549 
					                                Private f32* %551 = OpAccessChain %9 %319 
					                                         f32 %552 = OpLoad %551 
					                                Private f32* %553 = OpAccessChain %9 %14 
					                                         f32 %554 = OpLoad %553 
					                                         f32 %555 = OpFMul %552 %554 
					                                         f32 %556 = OpFAdd %555 %477 
					                                Private f32* %557 = OpAccessChain %9 %14 
					                                                      OpStore %557 %556 
					                                Private f32* %558 = OpAccessChain %9 %14 
					                                         f32 %559 = OpLoad %558 
					                                Uniform f32* %560 = OpAccessChain %23 %262 %34 
					                                         f32 %561 = OpLoad %560 
					                                         f32 %562 = OpFMul %559 %561 
					                                Private f32* %563 = OpAccessChain %9 %14 
					                                                      OpStore %563 %562 
					                                Private f32* %564 = OpAccessChain %9 %14 
					                                         f32 %565 = OpLoad %564 
					                                         f32 %567 = OpFMul %565 %566 
					                                Private f32* %568 = OpAccessChain %103 %319 
					                                         f32 %569 = OpLoad %568 
					                                         f32 %570 = OpFAdd %567 %569 
					                                Private f32* %571 = OpAccessChain %9 %319 
					                                                      OpStore %571 %570 
					                                Private f32* %572 = OpAccessChain %9 %14 
					                                         f32 %573 = OpLoad %572 
					                                         f32 %575 = OpFMul %573 %574 
					                                Private f32* %576 = OpAccessChain %103 %180 
					                                         f32 %577 = OpLoad %576 
					                                         f32 %578 = OpFNegate %577 
					                                         f32 %579 = OpFAdd %575 %578 
					                                Private f32* %580 = OpAccessChain %9 %14 
					                                                      OpStore %580 %579 
					                                       f32_4 %581 = OpLoad %9 
					                                       f32_2 %582 = OpVectorShuffle %581 %581 0 3 
					                                       f32_2 %583 = OpExtInst %1 13 %582 
					                                       f32_4 %584 = OpLoad %9 
					                                       f32_4 %585 = OpVectorShuffle %584 %583 4 1 2 5 
					                                                      OpStore %9 %585 
					                                Private f32* %586 = OpAccessChain %9 %14 
					                                         f32 %587 = OpLoad %586 
					                                         f32 %588 = OpFNegate %587 
					                                Private f32* %589 = OpAccessChain %9 %319 
					                                         f32 %590 = OpLoad %589 
					                                         f32 %591 = OpFAdd %588 %590 
					                                                      OpStore %33 %591 
					                                         f32 %592 = OpLoad %33 
					                                         f32 %593 = OpFMul %592 %477 
					                                Private f32* %594 = OpAccessChain %9 %14 
					                                         f32 %595 = OpLoad %594 
					                                         f32 %596 = OpFAdd %593 %595 
					                                Private f32* %597 = OpAccessChain %9 %14 
					                                                      OpStore %597 %596 
					                                Private f32* %598 = OpAccessChain %298 %14 
					                                         f32 %599 = OpLoad %598 
					                                Private f32* %600 = OpAccessChain %41 %319 
					                                                      OpStore %600 %599 
					                                       f32_4 %601 = OpLoad %41 
					                                       f32_2 %602 = OpVectorShuffle %601 %601 0 3 
					                                       f32_2 %603 = OpFAdd %602 %415 
					                                                      OpStore %503 %603 
					                                Private f32* %604 = OpAccessChain %41 %14 
					                                         f32 %605 = OpLoad %604 
					                                Private f32* %606 = OpAccessChain %298 %180 
					                                                      OpStore %606 %605 
					                                       f32_4 %607 = OpLoad %298 
					                                       f32_2 %608 = OpVectorShuffle %607 %607 2 1 
					                                       f32_2 %609 = OpFAdd %608 %415 
					                                       f32_4 %610 = OpLoad %41 
					                                       f32_4 %611 = OpVectorShuffle %610 %609 4 1 2 5 
					                                                      OpStore %41 %611 
					                                Private f32* %612 = OpAccessChain %503 %34 
					                                         f32 %613 = OpLoad %612 
					                                         f32 %614 = OpExtInst %1 4 %613 
					                                Private f32* %615 = OpAccessChain %217 %14 
					                                         f32 %616 = OpLoad %615 
					                                         f32 %617 = OpFDiv %614 %616 
					                                                      OpStore %33 %617 
					                                         f32 %618 = OpLoad %33 
					                                         f32 %619 = OpLoad %33 
					                                         f32 %620 = OpFMul %618 %619 
					                                         f32 %621 = OpFAdd %620 %62 
					                                                      OpStore %33 %621 
					                                         f32 %622 = OpLoad %33 
					                                Private f32* %623 = OpAccessChain %503 %14 
					                                         f32 %624 = OpLoad %623 
					                                         f32 %625 = OpFMul %622 %624 
					                                Private f32* %626 = OpAccessChain %103 %14 
					                                                      OpStore %626 %625 
					                                Private f32* %627 = OpAccessChain %103 %14 
					                                         f32 %628 = OpLoad %627 
					                                         f32 %629 = OpExtInst %1 4 %628 
					                                Private f32* %630 = OpAccessChain %217 %14 
					                                         f32 %631 = OpLoad %630 
					                                         f32 %632 = OpFDiv %629 %631 
					                                                      OpStore %33 %632 
					                                         f32 %633 = OpLoad %33 
					                                         f32 %634 = OpLoad %33 
					                                         f32 %635 = OpFMul %633 %634 
					                                         f32 %636 = OpFAdd %635 %62 
					                                                      OpStore %33 %636 
					                                         f32 %637 = OpLoad %33 
					                                Private f32* %638 = OpAccessChain %503 %34 
					                                         f32 %639 = OpLoad %638 
					                                         f32 %640 = OpFMul %637 %639 
					                                Private f32* %641 = OpAccessChain %103 %34 
					                                                      OpStore %641 %640 
					                                       f32_4 %642 = OpLoad %103 
					                                       f32_2 %643 = OpVectorShuffle %642 %642 0 1 
					                                       f32_2 %644 = OpFAdd %643 %478 
					                                                      OpStore %503 %644 
					                         read_only Texture2D %645 = OpLoad %485 
					                                     sampler %646 = OpLoad %489 
					                  read_only Texture2DSampled %647 = OpSampledImage %645 %646 
					                                       f32_2 %648 = OpLoad %503 
					                                       f32_4 %649 = OpImageSampleImplicitLod %647 %648 
					                                         f32 %650 = OpCompositeExtract %649 1 
					                                Private f32* %651 = OpAccessChain %482 %34 
					                                                      OpStore %651 %650 
					                                Private f32* %652 = OpAccessChain %41 %319 
					                                         f32 %653 = OpLoad %652 
					                                         f32 %654 = OpExtInst %1 4 %653 
					                                Private f32* %655 = OpAccessChain %217 %14 
					                                         f32 %656 = OpLoad %655 
					                                         f32 %657 = OpFDiv %654 %656 
					                                                      OpStore %33 %657 
					                                         f32 %658 = OpLoad %33 
					                                         f32 %659 = OpLoad %33 
					                                         f32 %660 = OpFMul %658 %659 
					                                         f32 %661 = OpFAdd %660 %62 
					                                                      OpStore %33 %661 
					                                         f32 %662 = OpLoad %33 
					                                Private f32* %663 = OpAccessChain %41 %14 
					                                         f32 %664 = OpLoad %663 
					                                         f32 %665 = OpFMul %662 %664 
					                                Private f32* %666 = OpAccessChain %41 %14 
					                                                      OpStore %666 %665 
					                                Private f32* %667 = OpAccessChain %41 %14 
					                                         f32 %668 = OpLoad %667 
					                                         f32 %669 = OpExtInst %1 4 %668 
					                                Private f32* %670 = OpAccessChain %217 %14 
					                                         f32 %671 = OpLoad %670 
					                                         f32 %672 = OpFDiv %669 %671 
					                                Private f32* %673 = OpAccessChain %217 %14 
					                                                      OpStore %673 %672 
					                                Private f32* %674 = OpAccessChain %217 %14 
					                                         f32 %675 = OpLoad %674 
					                                Private f32* %676 = OpAccessChain %217 %14 
					                                         f32 %677 = OpLoad %676 
					                                         f32 %678 = OpFMul %675 %677 
					                                         f32 %679 = OpFAdd %678 %62 
					                                Private f32* %680 = OpAccessChain %217 %14 
					                                                      OpStore %680 %679 
					                                Private f32* %681 = OpAccessChain %217 %14 
					                                         f32 %682 = OpLoad %681 
					                                Private f32* %683 = OpAccessChain %41 %319 
					                                         f32 %684 = OpLoad %683 
					                                         f32 %685 = OpFMul %682 %684 
					                                Private f32* %686 = OpAccessChain %41 %34 
					                                                      OpStore %686 %685 
					                                       f32_4 %687 = OpLoad %41 
					                                       f32_2 %688 = OpVectorShuffle %687 %687 0 1 
					                                       f32_2 %689 = OpFAdd %688 %478 
					                                       f32_3 %690 = OpLoad %217 
					                                       f32_3 %691 = OpVectorShuffle %690 %689 3 1 4 
					                                                      OpStore %217 %691 
					                         read_only Texture2D %692 = OpLoad %485 
					                                     sampler %693 = OpLoad %489 
					                  read_only Texture2DSampled %694 = OpSampledImage %692 %693 
					                                       f32_3 %695 = OpLoad %217 
					                                       f32_2 %696 = OpVectorShuffle %695 %695 0 2 
					                                       f32_4 %697 = OpImageSampleImplicitLod %694 %696 
					                                         f32 %698 = OpCompositeExtract %697 2 
					                                Private f32* %699 = OpAccessChain %482 %180 
					                                                      OpStore %699 %698 
					                                       f32_4 %700 = OpLoad %9 
					                                       f32_3 %701 = OpVectorShuffle %700 %700 0 0 0 
					                                       f32_3 %702 = OpLoad %482 
					                                       f32_3 %703 = OpFNegate %702 
					                                       f32_3 %704 = OpFAdd %701 %703 
					                                       f32_4 %705 = OpLoad %9 
					                                       f32_4 %706 = OpVectorShuffle %705 %704 4 5 2 6 
					                                                      OpStore %9 %706 
					                                       f32_4 %707 = OpLoad %9 
					                                       f32_3 %708 = OpVectorShuffle %707 %707 0 1 3 
					                                       f32_3 %710 = OpFMul %708 %709 
					                                       f32_3 %711 = OpLoad %482 
					                                       f32_3 %712 = OpFAdd %710 %711 
					                                       f32_4 %713 = OpLoad %9 
					                                       f32_4 %714 = OpVectorShuffle %713 %712 4 5 2 6 
					                                                      OpStore %9 %714 
					                                         f32 %715 = OpLoad %20 
					                                       f32_2 %716 = OpCompositeConstruct %715 %715 
					                                       f32_2 %718 = OpFMul %716 %717 
					                                       f32_2 %719 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %720 = OpFAdd %718 %719 
					                                       f32_4 %721 = OpLoad %41 
					                                       f32_4 %722 = OpVectorShuffle %721 %720 4 5 2 3 
					                                                      OpStore %41 %722 
					                                         f32 %723 = OpLoad %20 
					                                       f32_2 %724 = OpCompositeConstruct %723 %723 
					                                       f32_2 %725 = OpFNegate %724 
					                                       f32_2 %727 = OpFMul %725 %726 
					                                       f32_2 %728 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %729 = OpFAdd %727 %728 
					                                       f32_4 %730 = OpLoad %41 
					                                       f32_4 %731 = OpVectorShuffle %730 %729 0 1 4 5 
					                                                      OpStore %41 %731 
					                                       f32_4 %732 = OpLoad %41 
					                                       f32_4 %734 = OpFMul %732 %733 
					                                                      OpStore %41 %734 
					                                       f32_4 %735 = OpLoad %41 
					                                       f32_2 %736 = OpVectorShuffle %735 %735 0 1 
					                                       f32_2 %737 = OpExtInst %1 8 %736 
					                                       f32_4 %738 = OpLoad %103 
					                                       f32_4 %739 = OpVectorShuffle %738 %737 4 5 2 3 
					                                                      OpStore %103 %739 
					                                       f32_4 %740 = OpLoad %41 
					                                       f32_2 %741 = OpVectorShuffle %740 %740 0 1 
					                                       f32_2 %742 = OpExtInst %1 10 %741 
					                                       f32_4 %743 = OpLoad %41 
					                                       f32_4 %744 = OpVectorShuffle %743 %742 4 5 2 3 
					                                                      OpStore %41 %744 
					                                Private f32* %745 = OpAccessChain %103 %34 
					                                         f32 %746 = OpLoad %745 
					                                         f32 %747 = OpFMul %746 %93 
					                                Private f32* %748 = OpAccessChain %103 %14 
					                                         f32 %749 = OpLoad %748 
					                                         f32 %750 = OpFAdd %747 %749 
					                                                      OpStore %20 %750 
					                                         f32 %751 = OpLoad %20 
					                                       f32_3 %752 = OpCompositeConstruct %751 %751 %751 
					                                       f32_3 %753 = OpFAdd %752 %108 
					                                       f32_4 %754 = OpLoad %103 
					                                       f32_4 %755 = OpVectorShuffle %754 %753 4 5 6 3 
					                                                      OpStore %103 %755 
					                                         f32 %756 = OpLoad %20 
					                                         f32 %757 = OpExtInst %1 13 %756 
					                                                      OpStore %20 %757 
					                                         f32 %758 = OpLoad %20 
					                                         f32 %759 = OpFMul %758 %119 
					                                                      OpStore %20 %759 
					                                         f32 %760 = OpLoad %20 
					                                         f32 %761 = OpExtInst %1 10 %760 
					                                                      OpStore %20 %761 
					                                       f32_4 %762 = OpLoad %103 
					                                       f32_3 %763 = OpVectorShuffle %762 %762 0 1 2 
					                                       f32_3 %764 = OpExtInst %1 13 %763 
					                                       f32_4 %765 = OpLoad %103 
					                                       f32_4 %766 = OpVectorShuffle %765 %764 4 5 6 3 
					                                                      OpStore %103 %766 
					                                       f32_4 %767 = OpLoad %103 
					                                       f32_3 %768 = OpVectorShuffle %767 %767 0 1 2 
					                                       f32_3 %769 = OpFMul %768 %120 
					                                       f32_4 %770 = OpLoad %103 
					                                       f32_4 %771 = OpVectorShuffle %770 %769 4 5 6 3 
					                                                      OpStore %103 %771 
					                                       f32_4 %772 = OpLoad %103 
					                                       f32_3 %773 = OpVectorShuffle %772 %772 0 1 2 
					                                       f32_3 %774 = OpExtInst %1 10 %773 
					                                       f32_4 %775 = OpLoad %103 
					                                       f32_4 %776 = OpVectorShuffle %775 %774 4 5 6 3 
					                                                      OpStore %103 %776 
					                                Private f32* %778 = OpAccessChain %103 %34 
					                                         f32 %779 = OpLoad %778 
					                                         f32 %780 = OpFNegate %779 
					                                Private f32* %781 = OpAccessChain %103 %180 
					                                         f32 %782 = OpLoad %781 
					                                         f32 %783 = OpFAdd %780 %782 
					                                Private f32* %784 = OpAccessChain %777 %14 
					                                                      OpStore %784 %783 
					                                       f32_4 %785 = OpLoad %41 
					                                       f32_2 %786 = OpVectorShuffle %785 %785 0 1 
					                                       f32_4 %787 = OpLoad %41 
					                                       f32_2 %788 = OpVectorShuffle %787 %787 0 1 
					                                       f32_2 %789 = OpFMul %786 %788 
					                                       f32_4 %790 = OpLoad %298 
					                                       f32_4 %791 = OpVectorShuffle %790 %789 4 5 2 3 
					                                                      OpStore %298 %791 
					                                       f32_4 %792 = OpLoad %41 
					                                       f32_2 %793 = OpVectorShuffle %792 %792 0 1 
					                                       f32_2 %794 = OpFNegate %793 
					                                       f32_2 %795 = OpFMul %794 %154 
					                                       f32_2 %796 = OpFAdd %795 %157 
					                                       f32_4 %797 = OpLoad %41 
					                                       f32_4 %798 = OpVectorShuffle %797 %796 4 5 2 3 
					                                                      OpStore %41 %798 
					                                       f32_4 %799 = OpLoad %41 
					                                       f32_2 %800 = OpVectorShuffle %799 %799 0 1 
					                                       f32_4 %801 = OpLoad %298 
					                                       f32_2 %802 = OpVectorShuffle %801 %801 0 1 
					                                       f32_2 %803 = OpFMul %800 %802 
					                                       f32_4 %804 = OpLoad %41 
					                                       f32_4 %805 = OpVectorShuffle %804 %803 4 5 2 3 
					                                                      OpStore %41 %805 
					                                Private f32* %807 = OpAccessChain %41 %14 
					                                         f32 %808 = OpLoad %807 
					                                Private f32* %809 = OpAccessChain %777 %14 
					                                         f32 %810 = OpLoad %809 
					                                         f32 %811 = OpFMul %808 %810 
					                                Private f32* %812 = OpAccessChain %103 %34 
					                                         f32 %813 = OpLoad %812 
					                                         f32 %814 = OpFAdd %811 %813 
					                                                      OpStore %806 %814 
					                                         f32 %815 = OpLoad %20 
					                                         f32 %816 = OpFNegate %815 
					                                Private f32* %817 = OpAccessChain %103 %14 
					                                         f32 %818 = OpLoad %817 
					                                         f32 %819 = OpFAdd %816 %818 
					                                Private f32* %820 = OpAccessChain %103 %14 
					                                                      OpStore %820 %819 
					                                Private f32* %821 = OpAccessChain %41 %14 
					                                         f32 %822 = OpLoad %821 
					                                Private f32* %823 = OpAccessChain %103 %14 
					                                         f32 %824 = OpLoad %823 
					                                         f32 %825 = OpFMul %822 %824 
					                                         f32 %826 = OpLoad %20 
					                                         f32 %827 = OpFAdd %825 %826 
					                                                      OpStore %20 %827 
					                                         f32 %828 = OpLoad %20 
					                                         f32 %829 = OpFNegate %828 
					                                         f32 %830 = OpLoad %806 
					                                         f32 %831 = OpFAdd %829 %830 
					                                Private f32* %832 = OpAccessChain %41 %14 
					                                                      OpStore %832 %831 
					                                Private f32* %833 = OpAccessChain %41 %34 
					                                         f32 %834 = OpLoad %833 
					                                Private f32* %835 = OpAccessChain %41 %14 
					                                         f32 %836 = OpLoad %835 
					                                         f32 %837 = OpFMul %834 %836 
					                                         f32 %838 = OpLoad %20 
					                                         f32 %839 = OpFAdd %837 %838 
					                                                      OpStore %20 %839 
					                                       f32_4 %840 = OpLoad %41 
					                                       f32_2 %841 = OpVectorShuffle %840 %840 2 3 
					                                       f32_2 %842 = OpExtInst %1 8 %841 
					                                       f32_4 %843 = OpLoad %41 
					                                       f32_4 %844 = OpVectorShuffle %843 %842 4 5 2 3 
					                                                      OpStore %41 %844 
					                                Private f32* %845 = OpAccessChain %41 %34 
					                                         f32 %846 = OpLoad %845 
					                                         f32 %847 = OpFMul %846 %93 
					                                Private f32* %848 = OpAccessChain %41 %14 
					                                         f32 %849 = OpLoad %848 
					                                         f32 %850 = OpFAdd %847 %849 
					                                Private f32* %851 = OpAccessChain %41 %14 
					                                                      OpStore %851 %850 
					                                       f32_4 %852 = OpLoad %41 
					                                       f32_3 %853 = OpVectorShuffle %852 %852 0 0 0 
					                                       f32_3 %854 = OpFAdd %853 %108 
					                                       f32_4 %855 = OpLoad %103 
					                                       f32_4 %856 = OpVectorShuffle %855 %854 4 5 6 3 
					                                                      OpStore %103 %856 
					                                Private f32* %857 = OpAccessChain %41 %14 
					                                         f32 %858 = OpLoad %857 
					                                         f32 %859 = OpExtInst %1 13 %858 
					                                Private f32* %860 = OpAccessChain %41 %14 
					                                                      OpStore %860 %859 
					                                Private f32* %861 = OpAccessChain %41 %14 
					                                         f32 %862 = OpLoad %861 
					                                         f32 %863 = OpFMul %862 %119 
					                                Private f32* %864 = OpAccessChain %41 %14 
					                                                      OpStore %864 %863 
					                                       f32_4 %865 = OpLoad %41 
					                                       f32_3 %866 = OpVectorShuffle %865 %865 0 2 3 
					                                       f32_3 %867 = OpExtInst %1 10 %866 
					                                       f32_4 %868 = OpLoad %41 
					                                       f32_4 %869 = OpVectorShuffle %868 %867 4 1 5 6 
					                                                      OpStore %41 %869 
					                                       f32_4 %870 = OpLoad %103 
					                                       f32_3 %871 = OpVectorShuffle %870 %870 0 1 2 
					                                       f32_3 %872 = OpExtInst %1 13 %871 
					                                       f32_4 %873 = OpLoad %103 
					                                       f32_4 %874 = OpVectorShuffle %873 %872 4 5 6 3 
					                                                      OpStore %103 %874 
					                                       f32_4 %875 = OpLoad %103 
					                                       f32_3 %876 = OpVectorShuffle %875 %875 0 1 2 
					                                       f32_3 %877 = OpFMul %876 %120 
					                                       f32_4 %878 = OpLoad %103 
					                                       f32_4 %879 = OpVectorShuffle %878 %877 4 5 6 3 
					                                                      OpStore %103 %879 
					                                       f32_4 %880 = OpLoad %103 
					                                       f32_3 %881 = OpVectorShuffle %880 %880 0 1 2 
					                                       f32_3 %882 = OpExtInst %1 10 %881 
					                                       f32_4 %883 = OpLoad %103 
					                                       f32_4 %884 = OpVectorShuffle %883 %882 4 5 6 3 
					                                                      OpStore %103 %884 
					                                Private f32* %885 = OpAccessChain %103 %34 
					                                         f32 %886 = OpLoad %885 
					                                         f32 %887 = OpFNegate %886 
					                                Private f32* %888 = OpAccessChain %103 %180 
					                                         f32 %889 = OpLoad %888 
					                                         f32 %890 = OpFAdd %887 %889 
					                                Private f32* %891 = OpAccessChain %503 %14 
					                                                      OpStore %891 %890 
					                                       f32_4 %892 = OpLoad %41 
					                                       f32_2 %893 = OpVectorShuffle %892 %892 2 3 
					                                       f32_4 %894 = OpLoad %41 
					                                       f32_2 %895 = OpVectorShuffle %894 %894 2 3 
					                                       f32_2 %896 = OpFMul %893 %895 
					                                                      OpStore %777 %896 
					                                       f32_4 %897 = OpLoad %41 
					                                       f32_2 %898 = OpVectorShuffle %897 %897 2 3 
					                                       f32_2 %899 = OpFNegate %898 
					                                       f32_2 %900 = OpFMul %899 %154 
					                                       f32_2 %901 = OpFAdd %900 %157 
					                                                      OpStore %82 %901 
					                                       f32_2 %902 = OpLoad %82 
					                                       f32_2 %903 = OpLoad %777 
					                                       f32_2 %904 = OpFMul %902 %903 
					                                                      OpStore %82 %904 
					                                Private f32* %905 = OpAccessChain %82 %14 
					                                         f32 %906 = OpLoad %905 
					                                Private f32* %907 = OpAccessChain %503 %14 
					                                         f32 %908 = OpLoad %907 
					                                         f32 %909 = OpFMul %906 %908 
					                                Private f32* %910 = OpAccessChain %103 %34 
					                                         f32 %911 = OpLoad %910 
					                                         f32 %912 = OpFAdd %909 %911 
					                                Private f32* %913 = OpAccessChain %503 %14 
					                                                      OpStore %913 %912 
					                                Private f32* %914 = OpAccessChain %41 %14 
					                                         f32 %915 = OpLoad %914 
					                                         f32 %916 = OpFNegate %915 
					                                Private f32* %917 = OpAccessChain %103 %14 
					                                         f32 %918 = OpLoad %917 
					                                         f32 %919 = OpFAdd %916 %918 
					                                Private f32* %920 = OpAccessChain %103 %14 
					                                                      OpStore %920 %919 
					                                Private f32* %921 = OpAccessChain %82 %14 
					                                         f32 %922 = OpLoad %921 
					                                Private f32* %923 = OpAccessChain %103 %14 
					                                         f32 %924 = OpLoad %923 
					                                         f32 %925 = OpFMul %922 %924 
					                                Private f32* %926 = OpAccessChain %41 %14 
					                                         f32 %927 = OpLoad %926 
					                                         f32 %928 = OpFAdd %925 %927 
					                                Private f32* %929 = OpAccessChain %41 %14 
					                                                      OpStore %929 %928 
					                                Private f32* %930 = OpAccessChain %41 %14 
					                                         f32 %931 = OpLoad %930 
					                                         f32 %932 = OpFNegate %931 
					                                Private f32* %933 = OpAccessChain %503 %14 
					                                         f32 %934 = OpLoad %933 
					                                         f32 %935 = OpFAdd %932 %934 
					                                Private f32* %936 = OpAccessChain %503 %14 
					                                                      OpStore %936 %935 
					                                Private f32* %937 = OpAccessChain %82 %34 
					                                         f32 %938 = OpLoad %937 
					                                Private f32* %939 = OpAccessChain %503 %14 
					                                         f32 %940 = OpLoad %939 
					                                         f32 %941 = OpFMul %938 %940 
					                                Private f32* %942 = OpAccessChain %41 %14 
					                                         f32 %943 = OpLoad %942 
					                                         f32 %944 = OpFAdd %941 %943 
					                                Private f32* %945 = OpAccessChain %41 %14 
					                                                      OpStore %945 %944 
					                                         f32 %946 = OpLoad %20 
					                                Private f32* %947 = OpAccessChain %41 %14 
					                                         f32 %948 = OpLoad %947 
					                                         f32 %949 = OpFAdd %946 %948 
					                                                      OpStore %20 %949 
					                                         f32 %950 = OpLoad %20 
					                                         f32 %952 = OpExtInst %1 40 %950 %951 
					                                                      OpStore %20 %952 
					                                         f32 %953 = OpLoad %20 
					                                         f32 %954 = OpExtInst %1 37 %953 %62 
					                                                      OpStore %20 %954 
					                                         f32 %955 = OpLoad %20 
					                                       f32_3 %956 = OpCompositeConstruct %955 %955 %955 
					                                       f32_4 %957 = OpLoad %9 
					                                       f32_3 %958 = OpVectorShuffle %957 %957 0 1 3 
					                                       f32_3 %959 = OpFMul %956 %958 
					                                       f32_4 %960 = OpLoad %9 
					                                       f32_4 %961 = OpVectorShuffle %960 %959 4 5 6 3 
					                                                      OpStore %9 %961 
					                                       f32_4 %966 = OpLoad %9 
					                                       f32_3 %967 = OpVectorShuffle %966 %966 0 1 2 
					                                         f32 %968 = OpDot %965 %967 
					                                Private f32* %969 = OpAccessChain %9 %14 
					                                                      OpStore %969 %968 
					                                Private f32* %973 = OpAccessChain %9 %14 
					                                         f32 %974 = OpLoad %973 
					                                        bool %975 = OpFOrdLessThan %974 %477 
					                                                      OpStore %972 %975 
					                                Private f32* %976 = OpAccessChain %9 %14 
					                                         f32 %977 = OpLoad %976 
					                                         f32 %978 = OpFAdd %977 %414 
					                                Private f32* %979 = OpAccessChain %9 %180 
					                                                      OpStore %979 %978 
					                                       f32_4 %980 = OpLoad %9 
					                                       f32_2 %981 = OpVectorShuffle %980 %980 0 2 
					                                       f32_4 %982 = OpLoad %9 
					                                       f32_2 %983 = OpVectorShuffle %982 %982 0 2 
					                                       f32_2 %984 = OpFAdd %981 %983 
					                                       f32_4 %985 = OpLoad %9 
					                                       f32_4 %986 = OpVectorShuffle %985 %984 4 1 5 3 
					                                                      OpStore %9 %986 
					                                Uniform f32* %988 = OpAccessChain %23 %987 
					                                         f32 %989 = OpLoad %988 
					                                Uniform f32* %991 = OpAccessChain %23 %990 
					                                         f32 %992 = OpLoad %991 
					                                       f32_2 %993 = OpCompositeConstruct %989 %992 
					                                       f32_4 %994 = OpLoad %41 
					                                       f32_4 %995 = OpVectorShuffle %994 %993 4 5 2 3 
					                                                      OpStore %41 %995 
					                                Private f32* %996 = OpAccessChain %41 %14 
					                                         f32 %997 = OpLoad %996 
					                                         f32 %998 = OpFNegate %997 
					                               Uniform f32* %1000 = OpAccessChain %23 %999 
					                                        f32 %1001 = OpLoad %1000 
					                                        f32 %1002 = OpFAdd %998 %1001 
					                               Private f32* %1003 = OpAccessChain %103 %14 
					                                                      OpStore %1003 %1002 
					                               Private f32* %1004 = OpAccessChain %41 %180 
					                                                      OpStore %1004 %49 
					                                      f32_4 %1005 = OpLoad %41 
					                                      f32_2 %1006 = OpVectorShuffle %1005 %1005 1 2 
					                                      f32_2 %1007 = OpFNegate %1006 
					                                      f32_4 %1008 = OpLoad %103 
					                                      f32_4 %1009 = OpVectorShuffle %1008 %1007 0 4 5 3 
					                                                      OpStore %103 %1009 
					                                      f32_4 %1010 = OpLoad %9 
					                                      f32_3 %1011 = OpVectorShuffle %1010 %1010 2 2 2 
					                                      f32_4 %1012 = OpLoad %103 
					                                      f32_3 %1013 = OpVectorShuffle %1012 %1012 0 1 2 
					                                      f32_3 %1014 = OpFMul %1011 %1013 
					                                      f32_4 %1015 = OpLoad %41 
					                                      f32_3 %1016 = OpVectorShuffle %1015 %1015 0 1 2 
					                                      f32_3 %1017 = OpFAdd %1014 %1016 
					                                      f32_4 %1018 = OpLoad %103 
					                                      f32_4 %1019 = OpVectorShuffle %1018 %1017 4 5 6 3 
					                                                      OpStore %103 %1019 
					                               Private f32* %1020 = OpAccessChain %298 %14 
					                                                      OpStore %1020 %49 
					                               Private f32* %1021 = OpAccessChain %298 %34 
					                                                      OpStore %1021 %49 
					                               Uniform f32* %1022 = OpAccessChain %23 %990 
					                                        f32 %1023 = OpLoad %1022 
					                               Private f32* %1024 = OpAccessChain %298 %180 
					                                                      OpStore %1024 %1023 
					                                      f32_4 %1025 = OpLoad %41 
					                                      f32_3 %1026 = OpVectorShuffle %1025 %1025 0 1 2 
					                                      f32_4 %1027 = OpLoad %298 
					                                      f32_3 %1028 = OpVectorShuffle %1027 %1027 0 1 2 
					                                      f32_3 %1029 = OpFNegate %1028 
					                                      f32_3 %1030 = OpFAdd %1026 %1029 
					                                      f32_4 %1031 = OpLoad %298 
					                                      f32_4 %1032 = OpVectorShuffle %1031 %1030 4 5 6 3 
					                                                      OpStore %298 %1032 
					                                      f32_4 %1033 = OpLoad %9 
					                                      f32_3 %1034 = OpVectorShuffle %1033 %1033 0 0 0 
					                                      f32_4 %1035 = OpLoad %298 
					                                      f32_3 %1036 = OpVectorShuffle %1035 %1035 0 1 2 
					                                      f32_3 %1037 = OpFMul %1034 %1036 
					                                      f32_4 %1038 = OpLoad %41 
					                                      f32_3 %1039 = OpVectorShuffle %1038 %1038 2 2 1 
					                                      f32_3 %1040 = OpFAdd %1037 %1039 
					                                      f32_4 %1041 = OpLoad %9 
					                                      f32_4 %1042 = OpVectorShuffle %1041 %1040 4 1 5 6 
					                                                      OpStore %9 %1042 
					                                       bool %1043 = OpLoad %972 
					                                                      OpSelectionMerge %1047 None 
					                                                      OpBranchConditional %1043 %1046 %1050 
					                                            %1046 = OpLabel 
					                                      f32_4 %1048 = OpLoad %9 
					                                      f32_3 %1049 = OpVectorShuffle %1048 %1048 0 2 3 
					                                                      OpStore %1045 %1049 
					                                                      OpBranch %1047 
					                                            %1050 = OpLabel 
					                                      f32_4 %1051 = OpLoad %103 
					                                      f32_3 %1052 = OpVectorShuffle %1051 %1051 0 1 2 
					                                                      OpStore %1045 %1052 
					                                                      OpBranch %1047 
					                                            %1047 = OpLabel 
					                                      f32_3 %1053 = OpLoad %1045 
					                                      f32_4 %1054 = OpLoad %9 
					                                      f32_4 %1055 = OpVectorShuffle %1054 %1053 4 5 6 3 
					                                                      OpStore %9 %1055 
					                        read_only Texture2D %1057 = OpLoad %485 
					                                    sampler %1058 = OpLoad %489 
					                 read_only Texture2DSampled %1059 = OpSampledImage %1057 %1058 
					                                      f32_2 %1060 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %1061 = OpImageSampleImplicitLod %1059 %1060 
					                                      f32_3 %1062 = OpVectorShuffle %1061 %1061 0 1 2 
					                                                      OpStore %1056 %1062 
					                                      f32_4 %1063 = OpLoad %9 
					                                      f32_3 %1064 = OpVectorShuffle %1063 %1063 0 1 2 
					                                      f32_3 %1065 = OpLoad %1056 
					                                      f32_3 %1066 = OpFNegate %1065 
					                                      f32_3 %1067 = OpFAdd %1064 %1066 
					                                      f32_4 %1068 = OpLoad %9 
					                                      f32_4 %1069 = OpVectorShuffle %1068 %1067 4 5 6 3 
					                                                      OpStore %9 %1069 
					                               Uniform f32* %1073 = OpAccessChain %23 %1072 
					                                        f32 %1074 = OpLoad %1073 
					                               Uniform f32* %1075 = OpAccessChain %23 %1072 
					                                        f32 %1076 = OpLoad %1075 
					                               Uniform f32* %1077 = OpAccessChain %23 %1072 
					                                        f32 %1078 = OpLoad %1077 
					                                      f32_3 %1079 = OpCompositeConstruct %1074 %1076 %1078 
					                                        f32 %1080 = OpCompositeExtract %1079 0 
					                                        f32 %1081 = OpCompositeExtract %1079 1 
					                                        f32 %1082 = OpCompositeExtract %1079 2 
					                                      f32_3 %1083 = OpCompositeConstruct %1080 %1081 %1082 
					                                      f32_4 %1084 = OpLoad %9 
					                                      f32_3 %1085 = OpVectorShuffle %1084 %1084 0 1 2 
					                                      f32_3 %1086 = OpFMul %1083 %1085 
					                                      f32_3 %1087 = OpLoad %1056 
					                                      f32_3 %1088 = OpFAdd %1086 %1087 
					                                      f32_4 %1089 = OpLoad %1071 
					                                      f32_4 %1090 = OpVectorShuffle %1089 %1088 4 5 6 3 
					                                                      OpStore %1071 %1090 
					                                Output f32* %1092 = OpAccessChain %1071 %319 
					                                                      OpStore %1092 %62 
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
						float Fade;
						float Crt;
						float Curve;
						float Color1;
						float Color2;
						float Color3;
						vec4 _ScreenResolution;
						vec4 unused_0_10;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat6;
					float u_xlat7;
					float u_xlat10;
					vec2 u_xlat11;
					vec2 u_xlat12;
					float u_xlat15;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat10 = _Speed * _TimeX;
					    u_xlat15 = vs_TEXCOORD0.y * 2.0 + u_xlat10;
					    u_xlat1.x = u_xlat15 + 4.0;
					    u_xlat15 = cos(u_xlat15);
					    u_xlat15 = max(u_xlat15, 0.0);
					    u_xlat1.x = cos(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 10.0;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat0.y = u_xlat15 * vs_TEXCOORD0.x;
					    u_xlat1.xy = u_xlat0.xy * vec2(128.0, 128.0);
					    u_xlat11.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat0.x = u_xlat11.y * 59.0 + u_xlat11.x;
					    u_xlat11.x = sin(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat0.x = u_xlat11.x * 43812.1758;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat11.x = (-u_xlat0.x) + u_xlat2.x;
					    u_xlat2.xw = u_xlat1.xy * u_xlat1.xy;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat1.xy * u_xlat2.xw;
					    u_xlat0.x = u_xlat1.x * u_xlat11.x + u_xlat0.x;
					    u_xlat11.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat1.x = u_xlat1.x * u_xlat11.x + u_xlat2.y;
					    u_xlat1.x = (-u_xlat0.x) + u_xlat1.x;
					    u_xlat0.x = u_xlat1.y * u_xlat1.x + u_xlat0.x;
					    u_xlat0.x = u_xlat0.y * u_xlat0.x;
					    u_xlat5.x = u_xlat15 * vs_TEXCOORD0.x + (-u_xlat0.x);
					    u_xlat15 = Curve * 0.899999976;
					    u_xlat0.x = u_xlat15 * u_xlat5.x + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.0500000007;
					    u_xlat0.x = (-u_xlat0.x);
					    u_xlat0.y = 0.0;
					    u_xlat1.xy = vec2(Curve) * u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat0.x = u_xlat1.y * _ScreenResolution.y;
					    u_xlat0.x = u_xlat0.x * 0.119999997 + u_xlat10;
					    u_xlat2 = vec4(u_xlat10) * vec4(1.27999997, 2.55999994, 10.0, 6.0);
					    u_xlat5.xz = floor(u_xlat2.xy);
					    u_xlat0.y = u_xlat5.z * 59.0 + u_xlat5.x;
					    u_xlat0.xw = sin(u_xlat0.xy);
					    u_xlat3.xyz = u_xlat0.yyy + vec3(1.0, 59.0, 60.0);
					    u_xlat3.xyz = sin(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat5.x = u_xlat0.w * 43812.1758;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat15 = (-u_xlat5.x) + u_xlat3.x;
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat3.xw = u_xlat2.xy * u_xlat2.xy;
					    u_xlat2.xy = (-u_xlat2.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat2.xy = u_xlat2.xy * u_xlat3.xw;
					    u_xlat5.x = u_xlat2.x * u_xlat15 + u_xlat5.x;
					    u_xlat15 = (-u_xlat3.y) + u_xlat3.z;
					    u_xlat15 = u_xlat2.x * u_xlat15 + u_xlat3.y;
					    u_xlat15 = (-u_xlat5.x) + u_xlat15;
					    u_xlat5.x = u_xlat2.y * u_xlat15 + u_xlat5.x;
					    u_xlat15 = u_xlat5.x * 0.0250000004;
					    u_xlat5.x = u_xlat5.x * u_xlat0.x;
					    u_xlat1.z = u_xlat15 * u_xlat0.x + u_xlat1.y;
					    u_xlat0.xw = u_xlat1.xz + vec2(-0.5, -0.5);
					    u_xlat3.xy = u_xlat5.xx * vec2(0.00999999978, 0.0240000002) + u_xlat1.yy;
					    u_xlat5.x = Curve * 2.0 + 0.00999999978;
					    u_xlat11.x = abs(u_xlat0.w) / u_xlat5.x;
					    u_xlat11.x = u_xlat11.x * u_xlat11.x + 1.0;
					    u_xlat2.x = u_xlat0.x * u_xlat11.x;
					    u_xlat0.x = abs(u_xlat2.x) / u_xlat5.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + 1.0;
					    u_xlat2.y = u_xlat0.x * u_xlat0.w;
					    u_xlat0.xw = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat4 = texture(_MainTex, u_xlat0.xw);
					    u_xlat0.xw = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat6.x = Crt * 2.0 + 0.00999999978;
					    u_xlat6.x = u_xlat6.x * Curve + 0.00999999978;
					    u_xlat11.x = abs(u_xlat0.w) / u_xlat6.x;
					    u_xlat11.x = u_xlat11.x * u_xlat11.x + 1.0;
					    u_xlat0.x = u_xlat0.x * u_xlat11.x;
					    u_xlat0.x = abs(u_xlat0.x) / u_xlat6.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.w * u_xlat0.x + 0.5;
					    u_xlat0.x = u_xlat0.x * _ScreenResolution.y;
					    u_xlat0.w = u_xlat0.x * 0.0199999996 + u_xlat2.w;
					    u_xlat0.x = u_xlat0.x * 0.699999988 + (-u_xlat2.z);
					    u_xlat0.xw = sin(u_xlat0.xw);
					    u_xlat15 = (-u_xlat0.x) + u_xlat0.w;
					    u_xlat0.x = u_xlat15 * 0.5 + u_xlat0.x;
					    u_xlat1.w = u_xlat3.x;
					    u_xlat6.xy = u_xlat1.xw + vec2(-0.5, -0.5);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat1.xw = u_xlat3.zy + vec2(-0.5, -0.5);
					    u_xlat15 = abs(u_xlat6.y) / u_xlat5.x;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat2.x = u_xlat15 * u_xlat6.x;
					    u_xlat15 = abs(u_xlat2.x) / u_xlat5.x;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat2.y = u_xlat15 * u_xlat6.y;
					    u_xlat6.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat10_2 = texture(_MainTex, u_xlat6.xy);
					    u_xlat4.y = u_xlat10_2.y;
					    u_xlat15 = abs(u_xlat1.w) / u_xlat5.x;
					    u_xlat15 = u_xlat15 * u_xlat15 + 1.0;
					    u_xlat1.x = u_xlat15 * u_xlat1.x;
					    u_xlat5.x = abs(u_xlat1.x) / u_xlat5.x;
					    u_xlat5.x = u_xlat5.x * u_xlat5.x + 1.0;
					    u_xlat1.y = u_xlat5.x * u_xlat1.w;
					    u_xlat5.xz = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_MainTex, u_xlat5.xz);
					    u_xlat4.z = u_xlat10_1.z;
					    u_xlat0.xyw = u_xlat0.xxx + (-u_xlat4.xyz);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(0.0500000007, 0.0500000007, 0.0500000007) + u_xlat4.xyz;
					    u_xlat1.xy = vec2(u_xlat10) * vec2(6.0, 6.0) + vs_TEXCOORD0.xy;
					    u_xlat1.zw = (-vec2(u_xlat10)) * vec2(4.0, 4.0) + vs_TEXCOORD0.xy;
					    u_xlat1 = u_xlat1 * vec4(128.0, 128.0, 128.0, 128.0);
					    u_xlat2.xy = floor(u_xlat1.xy);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat10 = u_xlat2.y * 59.0 + u_xlat2.x;
					    u_xlat2.xyz = vec3(u_xlat10) + vec3(1.0, 59.0, 60.0);
					    u_xlat10 = sin(u_xlat10);
					    u_xlat10 = u_xlat10 * 43812.1758;
					    u_xlat10 = fract(u_xlat10);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat12.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat3.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat1.xy * u_xlat3.xy;
					    u_xlat7 = u_xlat1.x * u_xlat12.x + u_xlat2.y;
					    u_xlat2.x = (-u_xlat10) + u_xlat2.x;
					    u_xlat10 = u_xlat1.x * u_xlat2.x + u_xlat10;
					    u_xlat1.x = (-u_xlat10) + u_xlat7;
					    u_xlat10 = u_xlat1.y * u_xlat1.x + u_xlat10;
					    u_xlat1.xy = floor(u_xlat1.zw);
					    u_xlat1.x = u_xlat1.y * 59.0 + u_xlat1.x;
					    u_xlat2.xyz = u_xlat1.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43812.1758;
					    u_xlat1.xzw = fract(u_xlat1.xzw);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat6.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat12.xy = u_xlat1.zw * u_xlat1.zw;
					    u_xlat11.xy = (-u_xlat1.zw) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat11.xy = u_xlat11.xy * u_xlat12.xy;
					    u_xlat6.x = u_xlat11.x * u_xlat6.x + u_xlat2.y;
					    u_xlat2.x = (-u_xlat1.x) + u_xlat2.x;
					    u_xlat1.x = u_xlat11.x * u_xlat2.x + u_xlat1.x;
					    u_xlat6.x = (-u_xlat1.x) + u_xlat6.x;
					    u_xlat1.x = u_xlat11.y * u_xlat6.x + u_xlat1.x;
					    u_xlat10 = u_xlat10 + u_xlat1.x;
					    u_xlat10 = max(u_xlat10, 0.959999979);
					    u_xlat10 = min(u_xlat10, 1.0);
					    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyw;
					    u_xlat0.x = dot(vec3(0.400000006, 0.379999995, 0.25), u_xlat0.xyz);
					    u_xlatb5 = u_xlat0.x<0.5;
					    u_xlat0.z = u_xlat0.x + -0.5;
					    u_xlat0.xz = u_xlat0.xz + u_xlat0.xz;
					    u_xlat1.xy = vec2(Color2, Color1);
					    u_xlat2.x = (-u_xlat1.x) + Color3;
					    u_xlat1.z = 0.0;
					    u_xlat2.yz = (-u_xlat1.yz);
					    u_xlat2.xyz = u_xlat0.zzz * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = Color1;
					    u_xlat3.xyz = u_xlat1.xyz + (-u_xlat3.xyz);
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.zzy;
					    u_xlat0.xyz = (bool(u_xlatb5)) ? u_xlat0.xzw : u_xlat2.xyz;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_1.xyz;
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