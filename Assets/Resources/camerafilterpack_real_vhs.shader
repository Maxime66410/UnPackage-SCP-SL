Shader "CameraFilterPack/Real_VHS" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		VHS ("Base (RGB)", 2D) = "white" {}
		VHS2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 46386
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
					uniform 	vec4 _Time;
					uniform 	float TRACKING;
					uniform 	float CONTRAST;
					uniform 	float JITTER;
					uniform 	float GLITCH;
					uniform 	float NOISE;
					uniform 	float Brightness;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D VHS;
					UNITY_LOCATION(2) uniform  sampler2D VHS2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					bvec3 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec2 u_xlat7;
					vec2 u_xlat8;
					vec2 u_xlat14;
					float u_xlat16_14;
					float u_xlat21;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0 = _Time.xxxx * vec4(12.0, 64.0, 48.0, 20.0);
					    u_xlat21 = dot(u_xlat0.ww, vec2(12.9898005, 78.2330017));
					    u_xlat21 = u_xlat21 * 0.318471313;
					    u_xlatb1.x = u_xlat21>=(-u_xlat21);
					    u_xlat21 = fract(abs(u_xlat21));
					    u_xlat21 = (u_xlatb1.x) ? u_xlat21 : (-u_xlat21);
					    u_xlat21 = u_xlat21 * 3.1400001;
					    u_xlat21 = sin(u_xlat21);
					    u_xlat21 = u_xlat21 * 43758.5469;
					    u_xlat21 = fract(u_xlat21);
					    u_xlat1.x = u_xlat21 * 15.0 + 0.0599999987;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat8.y;
					    u_xlat1.x = u_xlat1.x * 33.3333282;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat22 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat22;
					    u_xlat21 = (-u_xlat21) * 15.0 + u_xlat8.y;
					    u_xlat21 = u_xlat21 * 33.3333359;
					    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					    u_xlat22 = u_xlat21 * -2.0 + 3.0;
					    u_xlat21 = u_xlat21 * u_xlat21;
					    u_xlat21 = u_xlat22 * u_xlat21 + (-u_xlat1.x);
					    u_xlat2.xyz = u_xlat8.yyy * vec3(512.0, 512.0, 150.0) + u_xlat0.xyz;
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat0.x = u_xlat8.y + -0.0500000007;
					    u_xlat14.x = u_xlat0.x * u_xlat2.x + u_xlat8.x;
					    u_xlatb1.xw = lessThan(u_xlat8.yyyy, vec4(0.0250000004, 0.0, 0.0, 0.0149999997)).xw;
					    u_xlat14.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat8.x;
					    u_xlat0.x = u_xlat0.x * u_xlat2.y + u_xlat14.x;
					    u_xlat0.x = (u_xlatb1.w) ? u_xlat0.x : u_xlat14.x;
					    u_xlat14.x = u_xlat2.z * 0.015625;
					    u_xlat0.x = u_xlat21 * u_xlat14.x + u_xlat0.x;
					    u_xlat14.x = (-u_xlat0.x) + 1.0;
					    u_xlat2.zw = _Time.xx * vec2(0.0130000003, 0.400000006);
					    u_xlat21 = u_xlat8.y * 288.0;
					    u_xlat21 = floor(u_xlat21);
					    u_xlat2.xy = vec2(u_xlat21) * vec2(0.00347222225, 0.00145833334);
					    u_xlat21 = dot(u_xlat2.wx, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = dot(u_xlat2.zy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = u_xlat1.x * 0.318471313;
					    u_xlat21 = u_xlat21 * 0.318471313;
					    u_xlatb22 = u_xlat21>=(-u_xlat21);
					    u_xlat21 = fract(abs(u_xlat21));
					    u_xlat21 = (u_xlatb22) ? u_xlat21 : (-u_xlat21);
					    u_xlat21 = u_xlat21 * 3.1400001;
					    u_xlat21 = sin(u_xlat21);
					    u_xlat21 = u_xlat21 * 43758.5469;
					    u_xlat21 = fract(u_xlat21);
					    u_xlat21 = sin(u_xlat21);
					    u_xlat21 = u_xlat21 * 0.00499999989;
					    u_xlatb22 = u_xlat1.x>=(-u_xlat1.x);
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb22) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 3.1400001;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat21 = u_xlat1.x * 0.00400000019 + u_xlat21;
					    u_xlat0.x = u_xlat21 * u_xlat14.x + u_xlat0.x;
					    u_xlat2.xy = (-u_xlat8.xy);
					    u_xlat3.x = u_xlat0.x + u_xlat2.x;
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.w = float(0.0);
					    u_xlat3 = vec4(vec4(JITTER, JITTER, JITTER, JITTER)) * u_xlat3 + u_xlat8.xyyy;
					    u_xlat4 = u_xlat3 * vec4(52.0, 288.0, 288.0, 288.0);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xw);
					    u_xlat16_0.xzw = max(u_xlat10_3.xyz, vec3(0.0799999982, 0.0799999982, 0.0799999982));
					    u_xlat16_0.xzw = min(u_xlat16_0.xzw, vec3(0.949999988, 0.949999988, 0.949999988));
					    u_xlat16_0.x = dot(u_xlat16_0.xzw, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat3 = floor(u_xlat4);
					    u_xlat7.x = u_xlat3.z * 0.0833333358 + u_xlat0.y;
					    u_xlat7.x = sin(u_xlat7.x);
					    u_xlat4 = _Time.xxxx * vec4(128.0, 16.0, 30.0, 3.75);
					    u_xlat14.x = u_xlat3.w * 0.0486111119 + u_xlat4.y;
					    u_xlat1.xw = u_xlat3.xy * vec2(0.0192307699, 0.00347222225);
					    u_xlat7.y = sin(u_xlat14.x);
					    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
					    u_xlat7.x = u_xlat7.y + u_xlat7.x;
					    u_xlat7.x = u_xlat7.x * 0.5 + 0.5;
					    u_xlat3.y = 0.0078125;
					    u_xlat5.x = cos(u_xlat4.x);
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat3.x = u_xlat4.x * 0.0078125;
					    u_xlat5.y = u_xlat3.x * u_xlat5.x;
					    u_xlat5.x = u_xlat4.x * 0.0078125 + -0.00999999978;
					    u_xlat14.xy = u_xlat5.xy * u_xlat3.xy + u_xlat1.xw;
					    u_xlat10_3 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_14 = u_xlat10_3.y * 0.289000005;
					    u_xlat16_14 = u_xlat10_3.x * -0.147 + (-u_xlat16_14);
					    u_xlat5.yw = u_xlat10_3.zz * vec2(0.43599999, 0.43599999) + vec2(u_xlat16_14);
					    u_xlat16_14 = u_xlat10_3.y * 0.514999986;
					    u_xlat16_14 = u_xlat10_3.x * 0.61500001 + (-u_xlat16_14);
					    u_xlat5.xz = (-u_xlat10_3.zz) * vec2(0.100000001, 0.100000001) + vec2(u_xlat16_14);
					    u_xlat14.x = CONTRAST + 1.0;
					    u_xlat3 = u_xlat5 / u_xlat14.xxxx;
					    u_xlat3 = u_xlat7.xxxx * u_xlat3;
					    u_xlat7.x = (-u_xlat3.y) * 0.395000011 + u_xlat16_0.x;
					    u_xlat5.xz = u_xlat3.xw * vec2(1.13999999, 2.03200006) + u_xlat16_0.xx;
					    u_xlat5.y = (-u_xlat3.z) * 0.58099997 + u_xlat7.x;
					    u_xlat0.xyz = max(u_xlat5.xyz, vec3(0.0799999982, 0.0799999982, 0.0799999982));
					    u_xlat0.xyz = min(u_xlat0.xyz, vec3(0.949999988, 0.949999988, 0.949999988));
					    u_xlat3.xyz = (-u_xlat0.xyz) * vec3(1.04999995, 1.04999995, 1.04999995) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
					    u_xlatb1.xw = greaterThanEqual(u_xlat4.zzzw, (-u_xlat4.zzzw)).xw;
					    u_xlat4.xy = fract(abs(u_xlat4.zw));
					    u_xlat1.x = (u_xlatb1.x) ? u_xlat4.x : (-u_xlat4.x);
					    u_xlat1.w = (u_xlatb1.w) ? u_xlat4.y : (-u_xlat4.y);
					    u_xlat1.xw = u_xlat1.xw * vec2(8.0, 8.0);
					    u_xlat1.xw = floor(u_xlat1.xw);
					    u_xlat21 = u_xlat1.x * 0.125;
					    u_xlat1.x = (-u_xlat1.w) * 0.125 + 1.0;
					    u_xlat4.x = u_xlat8.x * 0.125 + u_xlat21;
					    u_xlat4.y = u_xlat8.y * 0.125 + u_xlat1.x;
					    u_xlat4.z = u_xlat8.y * -1.125 + u_xlat1.x;
					    u_xlat10_5 = texture(VHS, u_xlat4.xy);
					    u_xlat5.xyz = u_xlat10_5.xyz + vec3(vec3(Brightness, Brightness, Brightness));
					    u_xlat5.xyz = u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat5.xyz = vec3(NOISE) * u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz;
					    u_xlatb0.xyz = lessThan(u_xlat0.xyzx, vec4(0.476190507, 0.476190507, 0.476190507, 0.0)).xyz;
					    u_xlat5.xyz = u_xlat5.xyz * vec3(2.0999999, 2.0999999, 2.0999999);
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat0.x = (u_xlatb0.x) ? u_xlat5.x : u_xlat3.x;
					    u_xlat0.y = (u_xlatb0.y) ? u_xlat5.y : u_xlat3.y;
					    u_xlat0.z = (u_xlatb0.z) ? u_xlat5.z : u_xlat3.z;
					    u_xlat2.z = 1.0;
					    u_xlat1.xw = u_xlat2.xz + u_xlat4.xz;
					    u_xlat21 = u_xlat2.y + 1.0;
					    u_xlat21 = u_xlat21 * TRACKING;
					    u_xlat1.xy = vec2(vec2(GLITCH, GLITCH)) * u_xlat1.xw + u_xlat8.xy;
					    u_xlat10_1 = texture(VHS2, u_xlat1.xy);
					    SV_Target0.xyz = vec3(u_xlat21) * u_xlat10_1.xyz + u_xlat0.xyz;
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
					; Bound: 920
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %83 %907 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %10 0 Offset 10 
					                                                      OpMemberDecorate %10 1 Offset 10 
					                                                      OpMemberDecorate %10 2 Offset 10 
					                                                      OpMemberDecorate %10 3 Offset 10 
					                                                      OpMemberDecorate %10 4 Offset 10 
					                                                      OpMemberDecorate %10 5 Offset 10 
					                                                      OpMemberDecorate %10 6 Offset 10 
					                                                      OpMemberDecorate %10 7 RelaxedPrecision 
					                                                      OpMemberDecorate %10 7 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 83 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %410 RelaxedPrecision 
					                                                      OpDecorate %413 RelaxedPrecision 
					                                                      OpDecorate %413 DescriptorSet 413 
					                                                      OpDecorate %413 Binding 413 
					                                                      OpDecorate %414 RelaxedPrecision 
					                                                      OpDecorate %417 RelaxedPrecision 
					                                                      OpDecorate %417 DescriptorSet 417 
					                                                      OpDecorate %417 Binding 417 
					                                                      OpDecorate %418 RelaxedPrecision 
					                                                      OpDecorate %424 RelaxedPrecision 
					                                                      OpDecorate %427 RelaxedPrecision 
					                                                      OpDecorate %428 RelaxedPrecision 
					                                                      OpDecorate %429 RelaxedPrecision 
					                                                      OpDecorate %432 RelaxedPrecision 
					                                                      OpDecorate %435 RelaxedPrecision 
					                                                      OpDecorate %436 RelaxedPrecision 
					                                                      OpDecorate %439 RelaxedPrecision 
					                                                      OpDecorate %442 RelaxedPrecision 
					                                                      OpDecorate %443 RelaxedPrecision 
					                                                      OpDecorate %448 RelaxedPrecision 
					                                                      OpDecorate %544 RelaxedPrecision 
					                                                      OpDecorate %545 RelaxedPrecision 
					                                                      OpDecorate %546 RelaxedPrecision 
					                                                      OpDecorate %550 RelaxedPrecision 
					                                                      OpDecorate %551 RelaxedPrecision 
					                                                      OpDecorate %553 RelaxedPrecision 
					                                                      OpDecorate %555 RelaxedPrecision 
					                                                      OpDecorate %557 RelaxedPrecision 
					                                                      OpDecorate %559 RelaxedPrecision 
					                                                      OpDecorate %560 RelaxedPrecision 
					                                                      OpDecorate %561 RelaxedPrecision 
					                                                      OpDecorate %562 RelaxedPrecision 
					                                                      OpDecorate %563 RelaxedPrecision 
					                                                      OpDecorate %564 RelaxedPrecision 
					                                                      OpDecorate %567 RelaxedPrecision 
					                                                      OpDecorate %568 RelaxedPrecision 
					                                                      OpDecorate %569 RelaxedPrecision 
					                                                      OpDecorate %570 RelaxedPrecision 
					                                                      OpDecorate %574 RelaxedPrecision 
					                                                      OpDecorate %576 RelaxedPrecision 
					                                                      OpDecorate %578 RelaxedPrecision 
					                                                      OpDecorate %580 RelaxedPrecision 
					                                                      OpDecorate %581 RelaxedPrecision 
					                                                      OpDecorate %582 RelaxedPrecision 
					                                                      OpDecorate %583 RelaxedPrecision 
					                                                      OpDecorate %584 RelaxedPrecision 
					                                                      OpDecorate %585 RelaxedPrecision 
					                                                      OpDecorate %586 RelaxedPrecision 
					                                                      OpDecorate %589 RelaxedPrecision 
					                                                      OpDecorate %590 RelaxedPrecision 
					                                                      OpDecorate %591 RelaxedPrecision 
					                                                      OpDecorate %592 RelaxedPrecision 
					                                                      OpDecorate %614 RelaxedPrecision 
					                                                      OpDecorate %623 RelaxedPrecision 
					                                                      OpDecorate %624 RelaxedPrecision 
					                                                      OpDecorate %748 RelaxedPrecision 
					                                                      OpDecorate %749 RelaxedPrecision 
					                                                      OpDecorate %749 DescriptorSet 749 
					                                                      OpDecorate %749 Binding 749 
					                                                      OpDecorate %750 RelaxedPrecision 
					                                                      OpDecorate %751 RelaxedPrecision 
					                                                      OpDecorate %751 DescriptorSet 751 
					                                                      OpDecorate %751 Binding 751 
					                                                      OpDecorate %752 RelaxedPrecision 
					                                                      OpDecorate %757 RelaxedPrecision 
					                                                      OpDecorate %758 RelaxedPrecision 
					                                                      OpDecorate %766 RelaxedPrecision 
					                                                      OpDecorate %767 RelaxedPrecision 
					                                                      OpDecorate %768 RelaxedPrecision 
					                                                      OpDecorate %769 RelaxedPrecision 
					                                                      OpDecorate %770 RelaxedPrecision 
					                                                      OpDecorate %771 RelaxedPrecision 
					                                                      OpDecorate %896 RelaxedPrecision 
					                                                      OpDecorate %897 RelaxedPrecision 
					                                                      OpDecorate %897 DescriptorSet 897 
					                                                      OpDecorate %897 Binding 897 
					                                                      OpDecorate %898 RelaxedPrecision 
					                                                      OpDecorate %899 RelaxedPrecision 
					                                                      OpDecorate %899 DescriptorSet 899 
					                                                      OpDecorate %899 Binding 899 
					                                                      OpDecorate %900 RelaxedPrecision 
					                                                      OpDecorate %905 RelaxedPrecision 
					                                                      OpDecorate %907 Location 907 
					                                                      OpDecorate %909 RelaxedPrecision 
					                                                      OpDecorate %910 RelaxedPrecision 
					                                                      OpDecorate %911 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %7 %6 %6 %6 %6 %6 %6 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 0 
					                                              %15 = OpTypePointer Uniform %7 
					                                          f32 %19 = OpConstant 3,674022E-40 
					                                          f32 %20 = OpConstant 3,674022E-40 
					                                          f32 %21 = OpConstant 3,674022E-40 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                        f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
					                                              %25 = OpTypePointer Private %6 
					                                 Private f32* %26 = OpVariable Private 
					                                              %27 = OpTypeVector %6 2 
					                                          f32 %30 = OpConstant 3,674022E-40 
					                                          f32 %31 = OpConstant 3,674022E-40 
					                                        f32_2 %32 = OpConstantComposite %30 %31 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                              %37 = OpTypeBool 
					                                              %38 = OpTypeVector %37 4 
					                                              %39 = OpTypePointer Private %38 
					                              Private bool_4* %40 = OpVariable Private 
					                                              %45 = OpTypeInt 32 0 
					                                          u32 %46 = OpConstant 0 
					                                              %47 = OpTypePointer Private %37 
					                                              %54 = OpTypePointer Function %6 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                          f32 %69 = OpConstant 3,674022E-40 
					                               Private f32_4* %73 = OpVariable Private 
					                                          f32 %75 = OpConstant 3,674022E-40 
					                                          f32 %77 = OpConstant 3,674022E-40 
					                                              %80 = OpTypePointer Private %27 
					                               Private f32_2* %81 = OpVariable Private 
					                                              %82 = OpTypePointer Input %27 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %85 = OpConstant 7 
					                                          u32 %97 = OpConstant 1 
					                                         f32 %104 = OpConstant 3,674022E-40 
					                                         f32 %109 = OpConstant 3,674022E-40 
					                                         f32 %110 = OpConstant 3,674022E-40 
					                                Private f32* %113 = OpVariable Private 
					                                         f32 %116 = OpConstant 3,674022E-40 
					                                         f32 %118 = OpConstant 3,674022E-40 
					                                         f32 %138 = OpConstant 3,674022E-40 
					                              Private f32_4* %155 = OpVariable Private 
					                                             %156 = OpTypeVector %6 3 
					                                         f32 %159 = OpConstant 3,674022E-40 
					                                         f32 %160 = OpConstant 3,674022E-40 
					                                       f32_3 %161 = OpConstantComposite %159 %159 %160 
					                                         f32 %175 = OpConstant 3,674022E-40 
					                              Private f32_2* %178 = OpVariable Private 
					                                         f32 %190 = OpConstant 3,674022E-40 
					                                         f32 %191 = OpConstant 3,674022E-40 
					                                       f32_4 %192 = OpConstantComposite %190 %109 %109 %191 
					                                             %194 = OpTypeVector %37 2 
					                                         u32 %219 = OpConstant 3 
					                                         u32 %232 = OpConstant 2 
					                                         f32 %235 = OpConstant 3,674022E-40 
					                                         f32 %254 = OpConstant 3,674022E-40 
					                                         f32 %255 = OpConstant 3,674022E-40 
					                                       f32_2 %256 = OpConstantComposite %254 %255 
					                                         f32 %262 = OpConstant 3,674022E-40 
					                                         f32 %268 = OpConstant 3,674022E-40 
					                                         f32 %269 = OpConstant 3,674022E-40 
					                                       f32_2 %270 = OpConstantComposite %268 %269 
					                               Private bool* %287 = OpVariable Private 
					                                         f32 %315 = OpConstant 3,674022E-40 
					                                         f32 %358 = OpConstant 3,674022E-40 
					                              Private f32_4* %374 = OpVariable Private 
					                                         i32 %384 = OpConstant 3 
					                                             %385 = OpTypePointer Uniform %6 
					                              Private f32_4* %405 = OpVariable Private 
					                                         f32 %407 = OpConstant 3,674022E-40 
					                                       f32_4 %408 = OpConstantComposite %407 %262 %262 %262 
					                              Private f32_4* %410 = OpVariable Private 
					                                             %411 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %412 = OpTypePointer UniformConstant %411 
					        UniformConstant read_only Texture2D* %413 = OpVariable UniformConstant 
					                                             %415 = OpTypeSampler 
					                                             %416 = OpTypePointer UniformConstant %415 
					                    UniformConstant sampler* %417 = OpVariable UniformConstant 
					                                             %419 = OpTypeSampledImage %411 
					                              Private f32_4* %427 = OpVariable Private 
					                                         f32 %430 = OpConstant 3,674022E-40 
					                                       f32_3 %431 = OpConstantComposite %430 %430 %430 
					                                         f32 %437 = OpConstant 3,674022E-40 
					                                       f32_3 %438 = OpConstantComposite %437 %437 %437 
					                                         f32 %444 = OpConstant 3,674022E-40 
					                                         f32 %445 = OpConstant 3,674022E-40 
					                                         f32 %446 = OpConstant 3,674022E-40 
					                                       f32_3 %447 = OpConstantComposite %444 %445 %446 
					                              Private f32_2* %452 = OpVariable Private 
					                                         f32 %455 = OpConstant 3,674022E-40 
					                                         f32 %468 = OpConstant 3,674022E-40 
					                                         f32 %469 = OpConstant 3,674022E-40 
					                                         f32 %470 = OpConstant 3,674022E-40 
					                                         f32 %471 = OpConstant 3,674022E-40 
					                                       f32_4 %472 = OpConstantComposite %468 %469 %470 %471 
					                                         f32 %476 = OpConstant 3,674022E-40 
					                                         f32 %484 = OpConstant 3,674022E-40 
					                                       f32_2 %485 = OpConstantComposite %484 %268 
					                                       f32_2 %494 = OpConstantComposite %109 %109 
					                                         f32 %504 = OpConstant 3,674022E-40 
					                                         f32 %508 = OpConstant 3,674022E-40 
					                              Private f32_4* %510 = OpVariable Private 
					                                         f32 %532 = OpConstant 3,674022E-40 
					                                             %543 = OpTypePointer Private %156 
					                              Private f32_3* %544 = OpVariable Private 
					                                Private f32* %551 = OpVariable Private 
					                                         f32 %554 = OpConstant 3,674022E-40 
					                                         f32 %558 = OpConstant 3,674022E-40 
					                                         f32 %565 = OpConstant 3,674022E-40 
					                                       f32_2 %566 = OpConstantComposite %565 %565 
					                                         f32 %575 = OpConstant 3,674022E-40 
					                                         f32 %579 = OpConstant 3,674022E-40 
					                                         f32 %587 = OpConstant 3,674022E-40 
					                                       f32_2 %588 = OpConstantComposite %587 %587 
					                                         i32 %595 = OpConstant 2 
					                                         f32 %611 = OpConstant 3,674022E-40 
					                                         f32 %619 = OpConstant 3,674022E-40 
					                                         f32 %620 = OpConstant 3,674022E-40 
					                                       f32_2 %621 = OpConstantComposite %619 %620 
					                                         f32 %631 = OpConstant 3,674022E-40 
					                                         f32 %650 = OpConstant 3,674022E-40 
					                                       f32_3 %651 = OpConstantComposite %650 %650 %650 
					                                       f32_3 %653 = OpConstantComposite %110 %110 %110 
					                                         f32 %707 = OpConstant 3,674022E-40 
					                                       f32_2 %708 = OpConstantComposite %707 %707 
					                                         f32 %719 = OpConstant 3,674022E-40 
					                                         f32 %742 = OpConstant 3,674022E-40 
					                              Private f32_3* %748 = OpVariable Private 
					        UniformConstant read_only Texture2D* %749 = OpVariable UniformConstant 
					                    UniformConstant sampler* %751 = OpVariable UniformConstant 
					                                         i32 %759 = OpConstant 6 
					                                         f32 %776 = OpConstant 3,674022E-40 
					                                       f32_3 %777 = OpConstantComposite %776 %776 %776 
					                                         i32 %781 = OpConstant 5 
					                                       f32_3 %788 = OpConstantComposite %504 %504 %504 
					                              Private f32_3* %792 = OpVariable Private 
					                                             %804 = OpTypeVector %37 3 
					                                             %805 = OpTypePointer Private %804 
					                             Private bool_3* %806 = OpVariable Private 
					                                         f32 %809 = OpConstant 3,674022E-40 
					                                       f32_4 %810 = OpConstantComposite %809 %809 %809 %109 
					                                         f32 %815 = OpConstant 3,674022E-40 
					                                       f32_3 %816 = OpConstantComposite %815 %815 %815 
					                                         i32 %876 = OpConstant 1 
					                                         i32 %880 = OpConstant 4 
					                              Private f32_3* %896 = OpVariable Private 
					        UniformConstant read_only Texture2D* %897 = OpVariable UniformConstant 
					                    UniformConstant sampler* %899 = OpVariable UniformConstant 
					                                             %906 = OpTypePointer Output %7 
					                               Output f32_4* %907 = OpVariable Output 
					                                             %917 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %55 = OpVariable Function 
					                               Function f32* %200 = OpVariable Function 
					                               Function f32* %222 = OpVariable Function 
					                               Function f32* %296 = OpVariable Function 
					                               Function f32* %329 = OpVariable Function 
					                               Function f32* %681 = OpVariable Function 
					                               Function f32* %694 = OpVariable Function 
					                               Function f32* %830 = OpVariable Function 
					                               Function f32* %842 = OpVariable Function 
					                               Function f32* %854 = OpVariable Function 
					                               Uniform f32_4* %16 = OpAccessChain %12 %14 
					                                        f32_4 %17 = OpLoad %16 
					                                        f32_4 %18 = OpVectorShuffle %17 %17 0 0 0 0 
					                                        f32_4 %24 = OpFMul %18 %23 
					                                                      OpStore %9 %24 
					                                        f32_4 %28 = OpLoad %9 
					                                        f32_2 %29 = OpVectorShuffle %28 %28 3 3 
					                                          f32 %33 = OpDot %29 %32 
					                                                      OpStore %26 %33 
					                                          f32 %34 = OpLoad %26 
					                                          f32 %36 = OpFMul %34 %35 
					                                                      OpStore %26 %36 
					                                          f32 %41 = OpLoad %26 
					                                          f32 %42 = OpLoad %26 
					                                          f32 %43 = OpFNegate %42 
					                                         bool %44 = OpFOrdGreaterThanEqual %41 %43 
					                                Private bool* %48 = OpAccessChain %40 %46 
					                                                      OpStore %48 %44 
					                                          f32 %49 = OpLoad %26 
					                                          f32 %50 = OpExtInst %1 4 %49 
					                                          f32 %51 = OpExtInst %1 10 %50 
					                                                      OpStore %26 %51 
					                                Private bool* %52 = OpAccessChain %40 %46 
					                                         bool %53 = OpLoad %52 
					                                                      OpSelectionMerge %57 None 
					                                                      OpBranchConditional %53 %56 %59 
					                                              %56 = OpLabel 
					                                          f32 %58 = OpLoad %26 
					                                                      OpStore %55 %58 
					                                                      OpBranch %57 
					                                              %59 = OpLabel 
					                                          f32 %60 = OpLoad %26 
					                                          f32 %61 = OpFNegate %60 
					                                                      OpStore %55 %61 
					                                                      OpBranch %57 
					                                              %57 = OpLabel 
					                                          f32 %62 = OpLoad %55 
					                                                      OpStore %26 %62 
					                                          f32 %63 = OpLoad %26 
					                                          f32 %65 = OpFMul %63 %64 
					                                                      OpStore %26 %65 
					                                          f32 %66 = OpLoad %26 
					                                          f32 %67 = OpExtInst %1 13 %66 
					                                                      OpStore %26 %67 
					                                          f32 %68 = OpLoad %26 
					                                          f32 %70 = OpFMul %68 %69 
					                                                      OpStore %26 %70 
					                                          f32 %71 = OpLoad %26 
					                                          f32 %72 = OpExtInst %1 10 %71 
					                                                      OpStore %26 %72 
					                                          f32 %74 = OpLoad %26 
					                                          f32 %76 = OpFMul %74 %75 
					                                          f32 %78 = OpFAdd %76 %77 
					                                 Private f32* %79 = OpAccessChain %73 %46 
					                                                      OpStore %79 %78 
					                                        f32_2 %84 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %86 = OpAccessChain %12 %85 
					                                        f32_4 %87 = OpLoad %86 
					                                        f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                        f32_2 %89 = OpFMul %84 %88 
					                               Uniform f32_4* %90 = OpAccessChain %12 %85 
					                                        f32_4 %91 = OpLoad %90 
					                                        f32_2 %92 = OpVectorShuffle %91 %91 2 3 
					                                        f32_2 %93 = OpFAdd %89 %92 
					                                                      OpStore %81 %93 
					                                 Private f32* %94 = OpAccessChain %73 %46 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFNegate %95 
					                                 Private f32* %98 = OpAccessChain %81 %97 
					                                          f32 %99 = OpLoad %98 
					                                         f32 %100 = OpFAdd %96 %99 
					                                Private f32* %101 = OpAccessChain %73 %46 
					                                                      OpStore %101 %100 
					                                Private f32* %102 = OpAccessChain %73 %46 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %105 = OpFMul %103 %104 
					                                Private f32* %106 = OpAccessChain %73 %46 
					                                                      OpStore %106 %105 
					                                Private f32* %107 = OpAccessChain %73 %46 
					                                         f32 %108 = OpLoad %107 
					                                         f32 %111 = OpExtInst %1 43 %108 %109 %110 
					                                Private f32* %112 = OpAccessChain %73 %46 
					                                                      OpStore %112 %111 
					                                Private f32* %114 = OpAccessChain %73 %46 
					                                         f32 %115 = OpLoad %114 
					                                         f32 %117 = OpFMul %115 %116 
					                                         f32 %119 = OpFAdd %117 %118 
					                                                      OpStore %113 %119 
					                                Private f32* %120 = OpAccessChain %73 %46 
					                                         f32 %121 = OpLoad %120 
					                                Private f32* %122 = OpAccessChain %73 %46 
					                                         f32 %123 = OpLoad %122 
					                                         f32 %124 = OpFMul %121 %123 
					                                Private f32* %125 = OpAccessChain %73 %46 
					                                                      OpStore %125 %124 
					                                Private f32* %126 = OpAccessChain %73 %46 
					                                         f32 %127 = OpLoad %126 
					                                         f32 %128 = OpLoad %113 
					                                         f32 %129 = OpFMul %127 %128 
					                                Private f32* %130 = OpAccessChain %73 %46 
					                                                      OpStore %130 %129 
					                                         f32 %131 = OpLoad %26 
					                                         f32 %132 = OpFNegate %131 
					                                         f32 %133 = OpFMul %132 %75 
					                                Private f32* %134 = OpAccessChain %81 %97 
					                                         f32 %135 = OpLoad %134 
					                                         f32 %136 = OpFAdd %133 %135 
					                                                      OpStore %26 %136 
					                                         f32 %137 = OpLoad %26 
					                                         f32 %139 = OpFMul %137 %138 
					                                                      OpStore %26 %139 
					                                         f32 %140 = OpLoad %26 
					                                         f32 %141 = OpExtInst %1 43 %140 %109 %110 
					                                                      OpStore %26 %141 
					                                         f32 %142 = OpLoad %26 
					                                         f32 %143 = OpFMul %142 %116 
					                                         f32 %144 = OpFAdd %143 %118 
					                                                      OpStore %113 %144 
					                                         f32 %145 = OpLoad %26 
					                                         f32 %146 = OpLoad %26 
					                                         f32 %147 = OpFMul %145 %146 
					                                                      OpStore %26 %147 
					                                         f32 %148 = OpLoad %113 
					                                         f32 %149 = OpLoad %26 
					                                         f32 %150 = OpFMul %148 %149 
					                                Private f32* %151 = OpAccessChain %73 %46 
					                                         f32 %152 = OpLoad %151 
					                                         f32 %153 = OpFNegate %152 
					                                         f32 %154 = OpFAdd %150 %153 
					                                                      OpStore %26 %154 
					                                       f32_2 %157 = OpLoad %81 
					                                       f32_3 %158 = OpVectorShuffle %157 %157 1 1 1 
					                                       f32_3 %162 = OpFMul %158 %161 
					                                       f32_4 %163 = OpLoad %9 
					                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
					                                       f32_3 %165 = OpFAdd %162 %164 
					                                       f32_4 %166 = OpLoad %155 
					                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
					                                                      OpStore %155 %167 
					                                       f32_4 %168 = OpLoad %155 
					                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
					                                       f32_3 %170 = OpExtInst %1 13 %169 
					                                       f32_4 %171 = OpLoad %155 
					                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 6 3 
					                                                      OpStore %155 %172 
					                                Private f32* %173 = OpAccessChain %81 %97 
					                                         f32 %174 = OpLoad %173 
					                                         f32 %176 = OpFAdd %174 %175 
					                                Private f32* %177 = OpAccessChain %9 %46 
					                                                      OpStore %177 %176 
					                                Private f32* %179 = OpAccessChain %9 %46 
					                                         f32 %180 = OpLoad %179 
					                                Private f32* %181 = OpAccessChain %155 %46 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpFMul %180 %182 
					                                Private f32* %184 = OpAccessChain %81 %46 
					                                         f32 %185 = OpLoad %184 
					                                         f32 %186 = OpFAdd %183 %185 
					                                Private f32* %187 = OpAccessChain %178 %46 
					                                                      OpStore %187 %186 
					                                       f32_2 %188 = OpLoad %81 
					                                       f32_4 %189 = OpVectorShuffle %188 %188 1 1 1 1 
					                                      bool_4 %193 = OpFOrdLessThan %189 %192 
					                                      bool_2 %195 = OpVectorShuffle %193 %193 0 3 
					                                      bool_4 %196 = OpLoad %40 
					                                      bool_4 %197 = OpVectorShuffle %196 %195 4 1 2 5 
					                                                      OpStore %40 %197 
					                               Private bool* %198 = OpAccessChain %40 %46 
					                                        bool %199 = OpLoad %198 
					                                                      OpSelectionMerge %202 None 
					                                                      OpBranchConditional %199 %201 %205 
					                                             %201 = OpLabel 
					                                Private f32* %203 = OpAccessChain %178 %46 
					                                         f32 %204 = OpLoad %203 
					                                                      OpStore %200 %204 
					                                                      OpBranch %202 
					                                             %205 = OpLabel 
					                                Private f32* %206 = OpAccessChain %81 %46 
					                                         f32 %207 = OpLoad %206 
					                                                      OpStore %200 %207 
					                                                      OpBranch %202 
					                                             %202 = OpLabel 
					                                         f32 %208 = OpLoad %200 
					                                Private f32* %209 = OpAccessChain %178 %46 
					                                                      OpStore %209 %208 
					                                Private f32* %210 = OpAccessChain %9 %46 
					                                         f32 %211 = OpLoad %210 
					                                Private f32* %212 = OpAccessChain %155 %97 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpFMul %211 %213 
					                                Private f32* %215 = OpAccessChain %178 %46 
					                                         f32 %216 = OpLoad %215 
					                                         f32 %217 = OpFAdd %214 %216 
					                                Private f32* %218 = OpAccessChain %9 %46 
					                                                      OpStore %218 %217 
					                               Private bool* %220 = OpAccessChain %40 %219 
					                                        bool %221 = OpLoad %220 
					                                                      OpSelectionMerge %224 None 
					                                                      OpBranchConditional %221 %223 %227 
					                                             %223 = OpLabel 
					                                Private f32* %225 = OpAccessChain %9 %46 
					                                         f32 %226 = OpLoad %225 
					                                                      OpStore %222 %226 
					                                                      OpBranch %224 
					                                             %227 = OpLabel 
					                                Private f32* %228 = OpAccessChain %178 %46 
					                                         f32 %229 = OpLoad %228 
					                                                      OpStore %222 %229 
					                                                      OpBranch %224 
					                                             %224 = OpLabel 
					                                         f32 %230 = OpLoad %222 
					                                Private f32* %231 = OpAccessChain %9 %46 
					                                                      OpStore %231 %230 
					                                Private f32* %233 = OpAccessChain %155 %232 
					                                         f32 %234 = OpLoad %233 
					                                         f32 %236 = OpFMul %234 %235 
					                                Private f32* %237 = OpAccessChain %178 %46 
					                                                      OpStore %237 %236 
					                                         f32 %238 = OpLoad %26 
					                                Private f32* %239 = OpAccessChain %178 %46 
					                                         f32 %240 = OpLoad %239 
					                                         f32 %241 = OpFMul %238 %240 
					                                Private f32* %242 = OpAccessChain %9 %46 
					                                         f32 %243 = OpLoad %242 
					                                         f32 %244 = OpFAdd %241 %243 
					                                Private f32* %245 = OpAccessChain %9 %46 
					                                                      OpStore %245 %244 
					                                Private f32* %246 = OpAccessChain %9 %46 
					                                         f32 %247 = OpLoad %246 
					                                         f32 %248 = OpFNegate %247 
					                                         f32 %249 = OpFAdd %248 %110 
					                                Private f32* %250 = OpAccessChain %178 %46 
					                                                      OpStore %250 %249 
					                              Uniform f32_4* %251 = OpAccessChain %12 %14 
					                                       f32_4 %252 = OpLoad %251 
					                                       f32_2 %253 = OpVectorShuffle %252 %252 0 0 
					                                       f32_2 %257 = OpFMul %253 %256 
					                                       f32_4 %258 = OpLoad %155 
					                                       f32_4 %259 = OpVectorShuffle %258 %257 0 1 4 5 
					                                                      OpStore %155 %259 
					                                Private f32* %260 = OpAccessChain %81 %97 
					                                         f32 %261 = OpLoad %260 
					                                         f32 %263 = OpFMul %261 %262 
					                                                      OpStore %26 %263 
					                                         f32 %264 = OpLoad %26 
					                                         f32 %265 = OpExtInst %1 8 %264 
					                                                      OpStore %26 %265 
					                                         f32 %266 = OpLoad %26 
					                                       f32_2 %267 = OpCompositeConstruct %266 %266 
					                                       f32_2 %271 = OpFMul %267 %270 
					                                       f32_4 %272 = OpLoad %155 
					                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 2 3 
					                                                      OpStore %155 %273 
					                                       f32_4 %274 = OpLoad %155 
					                                       f32_2 %275 = OpVectorShuffle %274 %274 3 0 
					                                         f32 %276 = OpDot %275 %32 
					                                                      OpStore %26 %276 
					                                       f32_4 %277 = OpLoad %155 
					                                       f32_2 %278 = OpVectorShuffle %277 %277 2 1 
					                                         f32 %279 = OpDot %278 %32 
					                                Private f32* %280 = OpAccessChain %73 %46 
					                                                      OpStore %280 %279 
					                                Private f32* %281 = OpAccessChain %73 %46 
					                                         f32 %282 = OpLoad %281 
					                                         f32 %283 = OpFMul %282 %35 
					                                Private f32* %284 = OpAccessChain %73 %46 
					                                                      OpStore %284 %283 
					                                         f32 %285 = OpLoad %26 
					                                         f32 %286 = OpFMul %285 %35 
					                                                      OpStore %26 %286 
					                                         f32 %288 = OpLoad %26 
					                                         f32 %289 = OpLoad %26 
					                                         f32 %290 = OpFNegate %289 
					                                        bool %291 = OpFOrdGreaterThanEqual %288 %290 
					                                                      OpStore %287 %291 
					                                         f32 %292 = OpLoad %26 
					                                         f32 %293 = OpExtInst %1 4 %292 
					                                         f32 %294 = OpExtInst %1 10 %293 
					                                                      OpStore %26 %294 
					                                        bool %295 = OpLoad %287 
					                                                      OpSelectionMerge %298 None 
					                                                      OpBranchConditional %295 %297 %300 
					                                             %297 = OpLabel 
					                                         f32 %299 = OpLoad %26 
					                                                      OpStore %296 %299 
					                                                      OpBranch %298 
					                                             %300 = OpLabel 
					                                         f32 %301 = OpLoad %26 
					                                         f32 %302 = OpFNegate %301 
					                                                      OpStore %296 %302 
					                                                      OpBranch %298 
					                                             %298 = OpLabel 
					                                         f32 %303 = OpLoad %296 
					                                                      OpStore %26 %303 
					                                         f32 %304 = OpLoad %26 
					                                         f32 %305 = OpFMul %304 %64 
					                                                      OpStore %26 %305 
					                                         f32 %306 = OpLoad %26 
					                                         f32 %307 = OpExtInst %1 13 %306 
					                                                      OpStore %26 %307 
					                                         f32 %308 = OpLoad %26 
					                                         f32 %309 = OpFMul %308 %69 
					                                                      OpStore %26 %309 
					                                         f32 %310 = OpLoad %26 
					                                         f32 %311 = OpExtInst %1 10 %310 
					                                                      OpStore %26 %311 
					                                         f32 %312 = OpLoad %26 
					                                         f32 %313 = OpExtInst %1 13 %312 
					                                                      OpStore %26 %313 
					                                         f32 %314 = OpLoad %26 
					                                         f32 %316 = OpFMul %314 %315 
					                                                      OpStore %26 %316 
					                                Private f32* %317 = OpAccessChain %73 %46 
					                                         f32 %318 = OpLoad %317 
					                                Private f32* %319 = OpAccessChain %73 %46 
					                                         f32 %320 = OpLoad %319 
					                                         f32 %321 = OpFNegate %320 
					                                        bool %322 = OpFOrdGreaterThanEqual %318 %321 
					                                                      OpStore %287 %322 
					                                Private f32* %323 = OpAccessChain %73 %46 
					                                         f32 %324 = OpLoad %323 
					                                         f32 %325 = OpExtInst %1 4 %324 
					                                         f32 %326 = OpExtInst %1 10 %325 
					                                Private f32* %327 = OpAccessChain %73 %46 
					                                                      OpStore %327 %326 
					                                        bool %328 = OpLoad %287 
					                                                      OpSelectionMerge %331 None 
					                                                      OpBranchConditional %328 %330 %334 
					                                             %330 = OpLabel 
					                                Private f32* %332 = OpAccessChain %73 %46 
					                                         f32 %333 = OpLoad %332 
					                                                      OpStore %329 %333 
					                                                      OpBranch %331 
					                                             %334 = OpLabel 
					                                Private f32* %335 = OpAccessChain %73 %46 
					                                         f32 %336 = OpLoad %335 
					                                         f32 %337 = OpFNegate %336 
					                                                      OpStore %329 %337 
					                                                      OpBranch %331 
					                                             %331 = OpLabel 
					                                         f32 %338 = OpLoad %329 
					                                Private f32* %339 = OpAccessChain %73 %46 
					                                                      OpStore %339 %338 
					                                Private f32* %340 = OpAccessChain %73 %46 
					                                         f32 %341 = OpLoad %340 
					                                         f32 %342 = OpFMul %341 %64 
					                                Private f32* %343 = OpAccessChain %73 %46 
					                                                      OpStore %343 %342 
					                                Private f32* %344 = OpAccessChain %73 %46 
					                                         f32 %345 = OpLoad %344 
					                                         f32 %346 = OpExtInst %1 13 %345 
					                                Private f32* %347 = OpAccessChain %73 %46 
					                                                      OpStore %347 %346 
					                                Private f32* %348 = OpAccessChain %73 %46 
					                                         f32 %349 = OpLoad %348 
					                                         f32 %350 = OpFMul %349 %69 
					                                Private f32* %351 = OpAccessChain %73 %46 
					                                                      OpStore %351 %350 
					                                Private f32* %352 = OpAccessChain %73 %46 
					                                         f32 %353 = OpLoad %352 
					                                         f32 %354 = OpExtInst %1 10 %353 
					                                Private f32* %355 = OpAccessChain %73 %46 
					                                                      OpStore %355 %354 
					                                Private f32* %356 = OpAccessChain %73 %46 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %359 = OpFMul %357 %358 
					                                         f32 %360 = OpLoad %26 
					                                         f32 %361 = OpFAdd %359 %360 
					                                                      OpStore %26 %361 
					                                         f32 %362 = OpLoad %26 
					                                Private f32* %363 = OpAccessChain %178 %46 
					                                         f32 %364 = OpLoad %363 
					                                         f32 %365 = OpFMul %362 %364 
					                                Private f32* %366 = OpAccessChain %9 %46 
					                                         f32 %367 = OpLoad %366 
					                                         f32 %368 = OpFAdd %365 %367 
					                                Private f32* %369 = OpAccessChain %9 %46 
					                                                      OpStore %369 %368 
					                                       f32_2 %370 = OpLoad %81 
					                                       f32_2 %371 = OpFNegate %370 
					                                       f32_4 %372 = OpLoad %155 
					                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 2 3 
					                                                      OpStore %155 %373 
					                                Private f32* %375 = OpAccessChain %9 %46 
					                                         f32 %376 = OpLoad %375 
					                                Private f32* %377 = OpAccessChain %155 %46 
					                                         f32 %378 = OpLoad %377 
					                                         f32 %379 = OpFAdd %376 %378 
					                                Private f32* %380 = OpAccessChain %374 %46 
					                                                      OpStore %380 %379 
					                                Private f32* %381 = OpAccessChain %374 %97 
					                                                      OpStore %381 %109 
					                                Private f32* %382 = OpAccessChain %374 %232 
					                                                      OpStore %382 %109 
					                                Private f32* %383 = OpAccessChain %374 %219 
					                                                      OpStore %383 %109 
					                                Uniform f32* %386 = OpAccessChain %12 %384 
					                                         f32 %387 = OpLoad %386 
					                                Uniform f32* %388 = OpAccessChain %12 %384 
					                                         f32 %389 = OpLoad %388 
					                                Uniform f32* %390 = OpAccessChain %12 %384 
					                                         f32 %391 = OpLoad %390 
					                                Uniform f32* %392 = OpAccessChain %12 %384 
					                                         f32 %393 = OpLoad %392 
					                                       f32_4 %394 = OpCompositeConstruct %387 %389 %391 %393 
					                                         f32 %395 = OpCompositeExtract %394 0 
					                                         f32 %396 = OpCompositeExtract %394 1 
					                                         f32 %397 = OpCompositeExtract %394 2 
					                                         f32 %398 = OpCompositeExtract %394 3 
					                                       f32_4 %399 = OpCompositeConstruct %395 %396 %397 %398 
					                                       f32_4 %400 = OpLoad %374 
					                                       f32_4 %401 = OpFMul %399 %400 
					                                       f32_2 %402 = OpLoad %81 
					                                       f32_4 %403 = OpVectorShuffle %402 %402 0 1 1 1 
					                                       f32_4 %404 = OpFAdd %401 %403 
					                                                      OpStore %374 %404 
					                                       f32_4 %406 = OpLoad %374 
					                                       f32_4 %409 = OpFMul %406 %408 
					                                                      OpStore %405 %409 
					                         read_only Texture2D %414 = OpLoad %413 
					                                     sampler %418 = OpLoad %417 
					                  read_only Texture2DSampled %420 = OpSampledImage %414 %418 
					                                       f32_4 %421 = OpLoad %374 
					                                       f32_2 %422 = OpVectorShuffle %421 %421 0 3 
					                                       f32_4 %423 = OpImageSampleImplicitLod %420 %422 
					                                       f32_3 %424 = OpVectorShuffle %423 %423 0 1 2 
					                                       f32_4 %425 = OpLoad %410 
					                                       f32_4 %426 = OpVectorShuffle %425 %424 4 1 5 6 
					                                                      OpStore %410 %426 
					                                       f32_4 %428 = OpLoad %410 
					                                       f32_3 %429 = OpVectorShuffle %428 %428 0 2 3 
					                                       f32_3 %432 = OpExtInst %1 40 %429 %431 
					                                       f32_4 %433 = OpLoad %427 
					                                       f32_4 %434 = OpVectorShuffle %433 %432 4 1 5 6 
					                                                      OpStore %427 %434 
					                                       f32_4 %435 = OpLoad %427 
					                                       f32_3 %436 = OpVectorShuffle %435 %435 0 2 3 
					                                       f32_3 %439 = OpExtInst %1 37 %436 %438 
					                                       f32_4 %440 = OpLoad %427 
					                                       f32_4 %441 = OpVectorShuffle %440 %439 4 1 5 6 
					                                                      OpStore %427 %441 
					                                       f32_4 %442 = OpLoad %427 
					                                       f32_3 %443 = OpVectorShuffle %442 %442 0 2 3 
					                                         f32 %448 = OpDot %443 %447 
					                                Private f32* %449 = OpAccessChain %427 %46 
					                                                      OpStore %449 %448 
					                                       f32_4 %450 = OpLoad %405 
					                                       f32_4 %451 = OpExtInst %1 8 %450 
					                                                      OpStore %374 %451 
					                                Private f32* %453 = OpAccessChain %374 %232 
					                                         f32 %454 = OpLoad %453 
					                                         f32 %456 = OpFMul %454 %455 
					                                Private f32* %457 = OpAccessChain %9 %97 
					                                         f32 %458 = OpLoad %457 
					                                         f32 %459 = OpFAdd %456 %458 
					                                Private f32* %460 = OpAccessChain %452 %46 
					                                                      OpStore %460 %459 
					                                Private f32* %461 = OpAccessChain %452 %46 
					                                         f32 %462 = OpLoad %461 
					                                         f32 %463 = OpExtInst %1 13 %462 
					                                Private f32* %464 = OpAccessChain %452 %46 
					                                                      OpStore %464 %463 
					                              Uniform f32_4* %465 = OpAccessChain %12 %14 
					                                       f32_4 %466 = OpLoad %465 
					                                       f32_4 %467 = OpVectorShuffle %466 %466 0 0 0 0 
					                                       f32_4 %473 = OpFMul %467 %472 
					                                                      OpStore %405 %473 
					                                Private f32* %474 = OpAccessChain %374 %219 
					                                         f32 %475 = OpLoad %474 
					                                         f32 %477 = OpFMul %475 %476 
					                                Private f32* %478 = OpAccessChain %405 %97 
					                                         f32 %479 = OpLoad %478 
					                                         f32 %480 = OpFAdd %477 %479 
					                                Private f32* %481 = OpAccessChain %178 %46 
					                                                      OpStore %481 %480 
					                                       f32_4 %482 = OpLoad %374 
					                                       f32_2 %483 = OpVectorShuffle %482 %482 0 1 
					                                       f32_2 %486 = OpFMul %483 %485 
					                                       f32_4 %487 = OpLoad %73 
					                                       f32_4 %488 = OpVectorShuffle %487 %486 4 1 2 5 
					                                                      OpStore %73 %488 
					                                Private f32* %489 = OpAccessChain %178 %46 
					                                         f32 %490 = OpLoad %489 
					                                         f32 %491 = OpExtInst %1 13 %490 
					                                Private f32* %492 = OpAccessChain %452 %97 
					                                                      OpStore %492 %491 
					                                       f32_2 %493 = OpLoad %452 
					                                       f32_2 %495 = OpExtInst %1 40 %493 %494 
					                                                      OpStore %452 %495 
					                                Private f32* %496 = OpAccessChain %452 %97 
					                                         f32 %497 = OpLoad %496 
					                                Private f32* %498 = OpAccessChain %452 %46 
					                                         f32 %499 = OpLoad %498 
					                                         f32 %500 = OpFAdd %497 %499 
					                                Private f32* %501 = OpAccessChain %452 %46 
					                                                      OpStore %501 %500 
					                                Private f32* %502 = OpAccessChain %452 %46 
					                                         f32 %503 = OpLoad %502 
					                                         f32 %505 = OpFMul %503 %504 
					                                         f32 %506 = OpFAdd %505 %504 
					                                Private f32* %507 = OpAccessChain %452 %46 
					                                                      OpStore %507 %506 
					                                Private f32* %509 = OpAccessChain %374 %97 
					                                                      OpStore %509 %508 
					                                Private f32* %511 = OpAccessChain %405 %46 
					                                         f32 %512 = OpLoad %511 
					                                         f32 %513 = OpExtInst %1 14 %512 
					                                Private f32* %514 = OpAccessChain %510 %46 
					                                                      OpStore %514 %513 
					                                Private f32* %515 = OpAccessChain %405 %46 
					                                         f32 %516 = OpLoad %515 
					                                         f32 %517 = OpExtInst %1 13 %516 
					                                Private f32* %518 = OpAccessChain %405 %46 
					                                                      OpStore %518 %517 
					                                Private f32* %519 = OpAccessChain %405 %46 
					                                         f32 %520 = OpLoad %519 
					                                         f32 %521 = OpFMul %520 %508 
					                                Private f32* %522 = OpAccessChain %374 %46 
					                                                      OpStore %522 %521 
					                                Private f32* %523 = OpAccessChain %374 %46 
					                                         f32 %524 = OpLoad %523 
					                                Private f32* %525 = OpAccessChain %510 %46 
					                                         f32 %526 = OpLoad %525 
					                                         f32 %527 = OpFMul %524 %526 
					                                Private f32* %528 = OpAccessChain %510 %97 
					                                                      OpStore %528 %527 
					                                Private f32* %529 = OpAccessChain %405 %46 
					                                         f32 %530 = OpLoad %529 
					                                         f32 %531 = OpFMul %530 %508 
					                                         f32 %533 = OpFAdd %531 %532 
					                                Private f32* %534 = OpAccessChain %510 %46 
					                                                      OpStore %534 %533 
					                                       f32_4 %535 = OpLoad %510 
					                                       f32_2 %536 = OpVectorShuffle %535 %535 0 1 
					                                       f32_4 %537 = OpLoad %374 
					                                       f32_2 %538 = OpVectorShuffle %537 %537 0 1 
					                                       f32_2 %539 = OpFMul %536 %538 
					                                       f32_4 %540 = OpLoad %73 
					                                       f32_2 %541 = OpVectorShuffle %540 %540 0 3 
					                                       f32_2 %542 = OpFAdd %539 %541 
					                                                      OpStore %178 %542 
					                         read_only Texture2D %545 = OpLoad %413 
					                                     sampler %546 = OpLoad %417 
					                  read_only Texture2DSampled %547 = OpSampledImage %545 %546 
					                                       f32_2 %548 = OpLoad %178 
					                                       f32_4 %549 = OpImageSampleImplicitLod %547 %548 
					                                       f32_3 %550 = OpVectorShuffle %549 %549 0 1 2 
					                                                      OpStore %544 %550 
					                                Private f32* %552 = OpAccessChain %544 %97 
					                                         f32 %553 = OpLoad %552 
					                                         f32 %555 = OpFMul %553 %554 
					                                                      OpStore %551 %555 
					                                Private f32* %556 = OpAccessChain %544 %46 
					                                         f32 %557 = OpLoad %556 
					                                         f32 %559 = OpFMul %557 %558 
					                                         f32 %560 = OpLoad %551 
					                                         f32 %561 = OpFNegate %560 
					                                         f32 %562 = OpFAdd %559 %561 
					                                                      OpStore %551 %562 
					                                       f32_3 %563 = OpLoad %544 
					                                       f32_2 %564 = OpVectorShuffle %563 %563 2 2 
					                                       f32_2 %567 = OpFMul %564 %566 
					                                         f32 %568 = OpLoad %551 
					                                       f32_2 %569 = OpCompositeConstruct %568 %568 
					                                       f32_2 %570 = OpFAdd %567 %569 
					                                       f32_4 %571 = OpLoad %510 
					                                       f32_4 %572 = OpVectorShuffle %571 %570 0 4 2 5 
					                                                      OpStore %510 %572 
					                                Private f32* %573 = OpAccessChain %544 %97 
					                                         f32 %574 = OpLoad %573 
					                                         f32 %576 = OpFMul %574 %575 
					                                                      OpStore %551 %576 
					                                Private f32* %577 = OpAccessChain %544 %46 
					                                         f32 %578 = OpLoad %577 
					                                         f32 %580 = OpFMul %578 %579 
					                                         f32 %581 = OpLoad %551 
					                                         f32 %582 = OpFNegate %581 
					                                         f32 %583 = OpFAdd %580 %582 
					                                                      OpStore %551 %583 
					                                       f32_3 %584 = OpLoad %544 
					                                       f32_2 %585 = OpVectorShuffle %584 %584 2 2 
					                                       f32_2 %586 = OpFNegate %585 
					                                       f32_2 %589 = OpFMul %586 %588 
					                                         f32 %590 = OpLoad %551 
					                                       f32_2 %591 = OpCompositeConstruct %590 %590 
					                                       f32_2 %592 = OpFAdd %589 %591 
					                                       f32_4 %593 = OpLoad %510 
					                                       f32_4 %594 = OpVectorShuffle %593 %592 4 1 5 3 
					                                                      OpStore %510 %594 
					                                Uniform f32* %596 = OpAccessChain %12 %595 
					                                         f32 %597 = OpLoad %596 
					                                         f32 %598 = OpFAdd %597 %110 
					                                Private f32* %599 = OpAccessChain %178 %46 
					                                                      OpStore %599 %598 
					                                       f32_4 %600 = OpLoad %510 
					                                       f32_2 %601 = OpLoad %178 
					                                       f32_4 %602 = OpVectorShuffle %601 %601 0 0 0 0 
					                                       f32_4 %603 = OpFDiv %600 %602 
					                                                      OpStore %374 %603 
					                                       f32_2 %604 = OpLoad %452 
					                                       f32_4 %605 = OpVectorShuffle %604 %604 0 0 0 0 
					                                       f32_4 %606 = OpLoad %374 
					                                       f32_4 %607 = OpFMul %605 %606 
					                                                      OpStore %374 %607 
					                                Private f32* %608 = OpAccessChain %374 %97 
					                                         f32 %609 = OpLoad %608 
					                                         f32 %610 = OpFNegate %609 
					                                         f32 %612 = OpFMul %610 %611 
					                                Private f32* %613 = OpAccessChain %427 %46 
					                                         f32 %614 = OpLoad %613 
					                                         f32 %615 = OpFAdd %612 %614 
					                                Private f32* %616 = OpAccessChain %452 %46 
					                                                      OpStore %616 %615 
					                                       f32_4 %617 = OpLoad %374 
					                                       f32_2 %618 = OpVectorShuffle %617 %617 0 3 
					                                       f32_2 %622 = OpFMul %618 %621 
					                                       f32_4 %623 = OpLoad %427 
					                                       f32_2 %624 = OpVectorShuffle %623 %623 0 0 
					                                       f32_2 %625 = OpFAdd %622 %624 
					                                       f32_4 %626 = OpLoad %510 
					                                       f32_4 %627 = OpVectorShuffle %626 %625 4 1 5 3 
					                                                      OpStore %510 %627 
					                                Private f32* %628 = OpAccessChain %374 %232 
					                                         f32 %629 = OpLoad %628 
					                                         f32 %630 = OpFNegate %629 
					                                         f32 %632 = OpFMul %630 %631 
					                                Private f32* %633 = OpAccessChain %452 %46 
					                                         f32 %634 = OpLoad %633 
					                                         f32 %635 = OpFAdd %632 %634 
					                                Private f32* %636 = OpAccessChain %510 %97 
					                                                      OpStore %636 %635 
					                                       f32_4 %637 = OpLoad %510 
					                                       f32_3 %638 = OpVectorShuffle %637 %637 0 1 2 
					                                       f32_3 %639 = OpExtInst %1 40 %638 %431 
					                                       f32_4 %640 = OpLoad %9 
					                                       f32_4 %641 = OpVectorShuffle %640 %639 4 5 6 3 
					                                                      OpStore %9 %641 
					                                       f32_4 %642 = OpLoad %9 
					                                       f32_3 %643 = OpVectorShuffle %642 %642 0 1 2 
					                                       f32_3 %644 = OpExtInst %1 37 %643 %438 
					                                       f32_4 %645 = OpLoad %9 
					                                       f32_4 %646 = OpVectorShuffle %645 %644 4 5 6 3 
					                                                      OpStore %9 %646 
					                                       f32_4 %647 = OpLoad %9 
					                                       f32_3 %648 = OpVectorShuffle %647 %647 0 1 2 
					                                       f32_3 %649 = OpFNegate %648 
					                                       f32_3 %652 = OpFMul %649 %651 
					                                       f32_3 %654 = OpFAdd %652 %653 
					                                       f32_4 %655 = OpLoad %374 
					                                       f32_4 %656 = OpVectorShuffle %655 %654 4 5 6 3 
					                                                      OpStore %374 %656 
					                                       f32_4 %657 = OpLoad %374 
					                                       f32_3 %658 = OpVectorShuffle %657 %657 0 1 2 
					                                       f32_4 %659 = OpLoad %374 
					                                       f32_3 %660 = OpVectorShuffle %659 %659 0 1 2 
					                                       f32_3 %661 = OpFAdd %658 %660 
					                                       f32_4 %662 = OpLoad %374 
					                                       f32_4 %663 = OpVectorShuffle %662 %661 4 5 6 3 
					                                                      OpStore %374 %663 
					                                       f32_4 %664 = OpLoad %405 
					                                       f32_4 %665 = OpVectorShuffle %664 %664 2 2 2 3 
					                                       f32_4 %666 = OpLoad %405 
					                                       f32_4 %667 = OpVectorShuffle %666 %666 2 2 2 3 
					                                       f32_4 %668 = OpFNegate %667 
					                                      bool_4 %669 = OpFOrdGreaterThanEqual %665 %668 
					                                      bool_2 %670 = OpVectorShuffle %669 %669 0 3 
					                                      bool_4 %671 = OpLoad %40 
					                                      bool_4 %672 = OpVectorShuffle %671 %670 4 1 2 5 
					                                                      OpStore %40 %672 
					                                       f32_4 %673 = OpLoad %405 
					                                       f32_2 %674 = OpVectorShuffle %673 %673 2 3 
					                                       f32_2 %675 = OpExtInst %1 4 %674 
					                                       f32_2 %676 = OpExtInst %1 10 %675 
					                                       f32_4 %677 = OpLoad %405 
					                                       f32_4 %678 = OpVectorShuffle %677 %676 4 5 2 3 
					                                                      OpStore %405 %678 
					                               Private bool* %679 = OpAccessChain %40 %46 
					                                        bool %680 = OpLoad %679 
					                                                      OpSelectionMerge %683 None 
					                                                      OpBranchConditional %680 %682 %686 
					                                             %682 = OpLabel 
					                                Private f32* %684 = OpAccessChain %405 %46 
					                                         f32 %685 = OpLoad %684 
					                                                      OpStore %681 %685 
					                                                      OpBranch %683 
					                                             %686 = OpLabel 
					                                Private f32* %687 = OpAccessChain %405 %46 
					                                         f32 %688 = OpLoad %687 
					                                         f32 %689 = OpFNegate %688 
					                                                      OpStore %681 %689 
					                                                      OpBranch %683 
					                                             %683 = OpLabel 
					                                         f32 %690 = OpLoad %681 
					                                Private f32* %691 = OpAccessChain %73 %46 
					                                                      OpStore %691 %690 
					                               Private bool* %692 = OpAccessChain %40 %219 
					                                        bool %693 = OpLoad %692 
					                                                      OpSelectionMerge %696 None 
					                                                      OpBranchConditional %693 %695 %699 
					                                             %695 = OpLabel 
					                                Private f32* %697 = OpAccessChain %405 %97 
					                                         f32 %698 = OpLoad %697 
					                                                      OpStore %694 %698 
					                                                      OpBranch %696 
					                                             %699 = OpLabel 
					                                Private f32* %700 = OpAccessChain %405 %97 
					                                         f32 %701 = OpLoad %700 
					                                         f32 %702 = OpFNegate %701 
					                                                      OpStore %694 %702 
					                                                      OpBranch %696 
					                                             %696 = OpLabel 
					                                         f32 %703 = OpLoad %694 
					                                Private f32* %704 = OpAccessChain %73 %219 
					                                                      OpStore %704 %703 
					                                       f32_4 %705 = OpLoad %73 
					                                       f32_2 %706 = OpVectorShuffle %705 %705 0 3 
					                                       f32_2 %709 = OpFMul %706 %708 
					                                       f32_4 %710 = OpLoad %73 
					                                       f32_4 %711 = OpVectorShuffle %710 %709 4 1 2 5 
					                                                      OpStore %73 %711 
					                                       f32_4 %712 = OpLoad %73 
					                                       f32_2 %713 = OpVectorShuffle %712 %712 0 3 
					                                       f32_2 %714 = OpExtInst %1 8 %713 
					                                       f32_4 %715 = OpLoad %73 
					                                       f32_4 %716 = OpVectorShuffle %715 %714 4 1 2 5 
					                                                      OpStore %73 %716 
					                                Private f32* %717 = OpAccessChain %73 %46 
					                                         f32 %718 = OpLoad %717 
					                                         f32 %720 = OpFMul %718 %719 
					                                                      OpStore %26 %720 
					                                Private f32* %721 = OpAccessChain %73 %219 
					                                         f32 %722 = OpLoad %721 
					                                         f32 %723 = OpFNegate %722 
					                                         f32 %724 = OpFMul %723 %719 
					                                         f32 %725 = OpFAdd %724 %110 
					                                Private f32* %726 = OpAccessChain %73 %46 
					                                                      OpStore %726 %725 
					                                Private f32* %727 = OpAccessChain %81 %46 
					                                         f32 %728 = OpLoad %727 
					                                         f32 %729 = OpFMul %728 %719 
					                                         f32 %730 = OpLoad %26 
					                                         f32 %731 = OpFAdd %729 %730 
					                                Private f32* %732 = OpAccessChain %405 %46 
					                                                      OpStore %732 %731 
					                                Private f32* %733 = OpAccessChain %81 %97 
					                                         f32 %734 = OpLoad %733 
					                                         f32 %735 = OpFMul %734 %719 
					                                Private f32* %736 = OpAccessChain %73 %46 
					                                         f32 %737 = OpLoad %736 
					                                         f32 %738 = OpFAdd %735 %737 
					                                Private f32* %739 = OpAccessChain %405 %97 
					                                                      OpStore %739 %738 
					                                Private f32* %740 = OpAccessChain %81 %97 
					                                         f32 %741 = OpLoad %740 
					                                         f32 %743 = OpFMul %741 %742 
					                                Private f32* %744 = OpAccessChain %73 %46 
					                                         f32 %745 = OpLoad %744 
					                                         f32 %746 = OpFAdd %743 %745 
					                                Private f32* %747 = OpAccessChain %405 %232 
					                                                      OpStore %747 %746 
					                         read_only Texture2D %750 = OpLoad %749 
					                                     sampler %752 = OpLoad %751 
					                  read_only Texture2DSampled %753 = OpSampledImage %750 %752 
					                                       f32_4 %754 = OpLoad %405 
					                                       f32_2 %755 = OpVectorShuffle %754 %754 0 1 
					                                       f32_4 %756 = OpImageSampleImplicitLod %753 %755 
					                                       f32_3 %757 = OpVectorShuffle %756 %756 0 1 2 
					                                                      OpStore %748 %757 
					                                       f32_3 %758 = OpLoad %748 
					                                Uniform f32* %760 = OpAccessChain %12 %759 
					                                         f32 %761 = OpLoad %760 
					                                Uniform f32* %762 = OpAccessChain %12 %759 
					                                         f32 %763 = OpLoad %762 
					                                Uniform f32* %764 = OpAccessChain %12 %759 
					                                         f32 %765 = OpLoad %764 
					                                       f32_3 %766 = OpCompositeConstruct %761 %763 %765 
					                                         f32 %767 = OpCompositeExtract %766 0 
					                                         f32 %768 = OpCompositeExtract %766 1 
					                                         f32 %769 = OpCompositeExtract %766 2 
					                                       f32_3 %770 = OpCompositeConstruct %767 %768 %769 
					                                       f32_3 %771 = OpFAdd %758 %770 
					                                       f32_4 %772 = OpLoad %510 
					                                       f32_4 %773 = OpVectorShuffle %772 %771 4 5 6 3 
					                                                      OpStore %510 %773 
					                                       f32_4 %774 = OpLoad %510 
					                                       f32_3 %775 = OpVectorShuffle %774 %774 0 1 2 
					                                       f32_3 %778 = OpFAdd %775 %777 
					                                       f32_4 %779 = OpLoad %510 
					                                       f32_4 %780 = OpVectorShuffle %779 %778 4 5 6 3 
					                                                      OpStore %510 %780 
					                                Uniform f32* %782 = OpAccessChain %12 %781 
					                                         f32 %783 = OpLoad %782 
					                                       f32_3 %784 = OpCompositeConstruct %783 %783 %783 
					                                       f32_4 %785 = OpLoad %510 
					                                       f32_3 %786 = OpVectorShuffle %785 %785 0 1 2 
					                                       f32_3 %787 = OpFMul %784 %786 
					                                       f32_3 %789 = OpFAdd %787 %788 
					                                       f32_4 %790 = OpLoad %510 
					                                       f32_4 %791 = OpVectorShuffle %790 %789 4 5 6 3 
					                                                      OpStore %510 %791 
					                                       f32_4 %793 = OpLoad %510 
					                                       f32_3 %794 = OpVectorShuffle %793 %793 0 1 2 
					                                       f32_3 %795 = OpFNegate %794 
					                                       f32_3 %796 = OpFAdd %795 %653 
					                                                      OpStore %792 %796 
					                                       f32_4 %797 = OpLoad %9 
					                                       f32_3 %798 = OpVectorShuffle %797 %797 0 1 2 
					                                       f32_4 %799 = OpLoad %510 
					                                       f32_3 %800 = OpVectorShuffle %799 %799 0 1 2 
					                                       f32_3 %801 = OpFMul %798 %800 
					                                       f32_4 %802 = OpLoad %510 
					                                       f32_4 %803 = OpVectorShuffle %802 %801 4 5 6 3 
					                                                      OpStore %510 %803 
					                                       f32_4 %807 = OpLoad %9 
					                                       f32_4 %808 = OpVectorShuffle %807 %807 0 1 2 0 
					                                      bool_4 %811 = OpFOrdLessThan %808 %810 
					                                      bool_3 %812 = OpVectorShuffle %811 %811 0 1 2 
					                                                      OpStore %806 %812 
					                                       f32_4 %813 = OpLoad %510 
					                                       f32_3 %814 = OpVectorShuffle %813 %813 0 1 2 
					                                       f32_3 %817 = OpFMul %814 %816 
					                                       f32_4 %818 = OpLoad %510 
					                                       f32_4 %819 = OpVectorShuffle %818 %817 4 5 6 3 
					                                                      OpStore %510 %819 
					                                       f32_4 %820 = OpLoad %374 
					                                       f32_3 %821 = OpVectorShuffle %820 %820 0 1 2 
					                                       f32_3 %822 = OpFNegate %821 
					                                       f32_3 %823 = OpLoad %792 
					                                       f32_3 %824 = OpFMul %822 %823 
					                                       f32_3 %825 = OpFAdd %824 %653 
					                                       f32_4 %826 = OpLoad %374 
					                                       f32_4 %827 = OpVectorShuffle %826 %825 4 5 6 3 
					                                                      OpStore %374 %827 
					                               Private bool* %828 = OpAccessChain %806 %46 
					                                        bool %829 = OpLoad %828 
					                                                      OpSelectionMerge %832 None 
					                                                      OpBranchConditional %829 %831 %835 
					                                             %831 = OpLabel 
					                                Private f32* %833 = OpAccessChain %510 %46 
					                                         f32 %834 = OpLoad %833 
					                                                      OpStore %830 %834 
					                                                      OpBranch %832 
					                                             %835 = OpLabel 
					                                Private f32* %836 = OpAccessChain %374 %46 
					                                         f32 %837 = OpLoad %836 
					                                                      OpStore %830 %837 
					                                                      OpBranch %832 
					                                             %832 = OpLabel 
					                                         f32 %838 = OpLoad %830 
					                                Private f32* %839 = OpAccessChain %9 %46 
					                                                      OpStore %839 %838 
					                               Private bool* %840 = OpAccessChain %806 %97 
					                                        bool %841 = OpLoad %840 
					                                                      OpSelectionMerge %844 None 
					                                                      OpBranchConditional %841 %843 %847 
					                                             %843 = OpLabel 
					                                Private f32* %845 = OpAccessChain %510 %97 
					                                         f32 %846 = OpLoad %845 
					                                                      OpStore %842 %846 
					                                                      OpBranch %844 
					                                             %847 = OpLabel 
					                                Private f32* %848 = OpAccessChain %374 %97 
					                                         f32 %849 = OpLoad %848 
					                                                      OpStore %842 %849 
					                                                      OpBranch %844 
					                                             %844 = OpLabel 
					                                         f32 %850 = OpLoad %842 
					                                Private f32* %851 = OpAccessChain %9 %97 
					                                                      OpStore %851 %850 
					                               Private bool* %852 = OpAccessChain %806 %232 
					                                        bool %853 = OpLoad %852 
					                                                      OpSelectionMerge %856 None 
					                                                      OpBranchConditional %853 %855 %859 
					                                             %855 = OpLabel 
					                                Private f32* %857 = OpAccessChain %510 %232 
					                                         f32 %858 = OpLoad %857 
					                                                      OpStore %854 %858 
					                                                      OpBranch %856 
					                                             %859 = OpLabel 
					                                Private f32* %860 = OpAccessChain %374 %232 
					                                         f32 %861 = OpLoad %860 
					                                                      OpStore %854 %861 
					                                                      OpBranch %856 
					                                             %856 = OpLabel 
					                                         f32 %862 = OpLoad %854 
					                                Private f32* %863 = OpAccessChain %9 %232 
					                                                      OpStore %863 %862 
					                                Private f32* %864 = OpAccessChain %155 %232 
					                                                      OpStore %864 %110 
					                                       f32_4 %865 = OpLoad %155 
					                                       f32_2 %866 = OpVectorShuffle %865 %865 0 2 
					                                       f32_4 %867 = OpLoad %405 
					                                       f32_2 %868 = OpVectorShuffle %867 %867 0 2 
					                                       f32_2 %869 = OpFAdd %866 %868 
					                                       f32_4 %870 = OpLoad %73 
					                                       f32_4 %871 = OpVectorShuffle %870 %869 4 1 2 5 
					                                                      OpStore %73 %871 
					                                Private f32* %872 = OpAccessChain %155 %97 
					                                         f32 %873 = OpLoad %872 
					                                         f32 %874 = OpFAdd %873 %110 
					                                                      OpStore %26 %874 
					                                         f32 %875 = OpLoad %26 
					                                Uniform f32* %877 = OpAccessChain %12 %876 
					                                         f32 %878 = OpLoad %877 
					                                         f32 %879 = OpFMul %875 %878 
					                                                      OpStore %26 %879 
					                                Uniform f32* %881 = OpAccessChain %12 %880 
					                                         f32 %882 = OpLoad %881 
					                                Uniform f32* %883 = OpAccessChain %12 %880 
					                                         f32 %884 = OpLoad %883 
					                                       f32_2 %885 = OpCompositeConstruct %882 %884 
					                                         f32 %886 = OpCompositeExtract %885 0 
					                                         f32 %887 = OpCompositeExtract %885 1 
					                                       f32_2 %888 = OpCompositeConstruct %886 %887 
					                                       f32_4 %889 = OpLoad %73 
					                                       f32_2 %890 = OpVectorShuffle %889 %889 0 3 
					                                       f32_2 %891 = OpFMul %888 %890 
					                                       f32_2 %892 = OpLoad %81 
					                                       f32_2 %893 = OpFAdd %891 %892 
					                                       f32_4 %894 = OpLoad %73 
					                                       f32_4 %895 = OpVectorShuffle %894 %893 4 5 2 3 
					                                                      OpStore %73 %895 
					                         read_only Texture2D %898 = OpLoad %897 
					                                     sampler %900 = OpLoad %899 
					                  read_only Texture2DSampled %901 = OpSampledImage %898 %900 
					                                       f32_4 %902 = OpLoad %73 
					                                       f32_2 %903 = OpVectorShuffle %902 %902 0 1 
					                                       f32_4 %904 = OpImageSampleImplicitLod %901 %903 
					                                       f32_3 %905 = OpVectorShuffle %904 %904 0 1 2 
					                                                      OpStore %896 %905 
					                                         f32 %908 = OpLoad %26 
					                                       f32_3 %909 = OpCompositeConstruct %908 %908 %908 
					                                       f32_3 %910 = OpLoad %896 
					                                       f32_3 %911 = OpFMul %909 %910 
					                                       f32_4 %912 = OpLoad %9 
					                                       f32_3 %913 = OpVectorShuffle %912 %912 0 1 2 
					                                       f32_3 %914 = OpFAdd %911 %913 
					                                       f32_4 %915 = OpLoad %907 
					                                       f32_4 %916 = OpVectorShuffle %915 %914 4 5 6 3 
					                                                      OpStore %907 %916 
					                                 Output f32* %918 = OpAccessChain %907 %219 
					                                                      OpStore %918 %110 
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
						float TRACKING;
						float CONTRAST;
						float JITTER;
						float GLITCH;
						float NOISE;
						float Brightness;
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D VHS;
					uniform  sampler2D VHS2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					bvec3 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec2 u_xlat7;
					vec2 u_xlat8;
					vec2 u_xlat14;
					float u_xlat16_14;
					float u_xlat21;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0 = _Time.xxxx * vec4(12.0, 64.0, 48.0, 20.0);
					    u_xlat21 = dot(u_xlat0.ww, vec2(12.9898005, 78.2330017));
					    u_xlat21 = u_xlat21 * 0.318471313;
					    u_xlatb1.x = u_xlat21>=(-u_xlat21);
					    u_xlat21 = fract(abs(u_xlat21));
					    u_xlat21 = (u_xlatb1.x) ? u_xlat21 : (-u_xlat21);
					    u_xlat21 = u_xlat21 * 3.1400001;
					    u_xlat21 = sin(u_xlat21);
					    u_xlat21 = u_xlat21 * 43758.5469;
					    u_xlat21 = fract(u_xlat21);
					    u_xlat1.x = u_xlat21 * 15.0 + 0.0599999987;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = (-u_xlat1.x) + u_xlat8.y;
					    u_xlat1.x = u_xlat1.x * 33.3333282;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat22 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat22;
					    u_xlat21 = (-u_xlat21) * 15.0 + u_xlat8.y;
					    u_xlat21 = u_xlat21 * 33.3333359;
					    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					    u_xlat22 = u_xlat21 * -2.0 + 3.0;
					    u_xlat21 = u_xlat21 * u_xlat21;
					    u_xlat21 = u_xlat22 * u_xlat21 + (-u_xlat1.x);
					    u_xlat2.xyz = u_xlat8.yyy * vec3(512.0, 512.0, 150.0) + u_xlat0.xyz;
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat0.x = u_xlat8.y + -0.0500000007;
					    u_xlat14.x = u_xlat0.x * u_xlat2.x + u_xlat8.x;
					    u_xlatb1.xw = lessThan(u_xlat8.yyyy, vec4(0.0250000004, 0.0, 0.0, 0.0149999997)).xw;
					    u_xlat14.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat8.x;
					    u_xlat0.x = u_xlat0.x * u_xlat2.y + u_xlat14.x;
					    u_xlat0.x = (u_xlatb1.w) ? u_xlat0.x : u_xlat14.x;
					    u_xlat14.x = u_xlat2.z * 0.015625;
					    u_xlat0.x = u_xlat21 * u_xlat14.x + u_xlat0.x;
					    u_xlat14.x = (-u_xlat0.x) + 1.0;
					    u_xlat2.zw = _Time.xx * vec2(0.0130000003, 0.400000006);
					    u_xlat21 = u_xlat8.y * 288.0;
					    u_xlat21 = floor(u_xlat21);
					    u_xlat2.xy = vec2(u_xlat21) * vec2(0.00347222225, 0.00145833334);
					    u_xlat21 = dot(u_xlat2.wx, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = dot(u_xlat2.zy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = u_xlat1.x * 0.318471313;
					    u_xlat21 = u_xlat21 * 0.318471313;
					    u_xlatb22 = u_xlat21>=(-u_xlat21);
					    u_xlat21 = fract(abs(u_xlat21));
					    u_xlat21 = (u_xlatb22) ? u_xlat21 : (-u_xlat21);
					    u_xlat21 = u_xlat21 * 3.1400001;
					    u_xlat21 = sin(u_xlat21);
					    u_xlat21 = u_xlat21 * 43758.5469;
					    u_xlat21 = fract(u_xlat21);
					    u_xlat21 = sin(u_xlat21);
					    u_xlat21 = u_xlat21 * 0.00499999989;
					    u_xlatb22 = u_xlat1.x>=(-u_xlat1.x);
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb22) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 3.1400001;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat21 = u_xlat1.x * 0.00400000019 + u_xlat21;
					    u_xlat0.x = u_xlat21 * u_xlat14.x + u_xlat0.x;
					    u_xlat2.xy = (-u_xlat8.xy);
					    u_xlat3.x = u_xlat0.x + u_xlat2.x;
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat3.w = float(0.0);
					    u_xlat3 = vec4(vec4(JITTER, JITTER, JITTER, JITTER)) * u_xlat3 + u_xlat8.xyyy;
					    u_xlat4 = u_xlat3 * vec4(52.0, 288.0, 288.0, 288.0);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.xw);
					    u_xlat16_0.xzw = max(u_xlat10_3.xyz, vec3(0.0799999982, 0.0799999982, 0.0799999982));
					    u_xlat16_0.xzw = min(u_xlat16_0.xzw, vec3(0.949999988, 0.949999988, 0.949999988));
					    u_xlat16_0.x = dot(u_xlat16_0.xzw, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat3 = floor(u_xlat4);
					    u_xlat7.x = u_xlat3.z * 0.0833333358 + u_xlat0.y;
					    u_xlat7.x = sin(u_xlat7.x);
					    u_xlat4 = _Time.xxxx * vec4(128.0, 16.0, 30.0, 3.75);
					    u_xlat14.x = u_xlat3.w * 0.0486111119 + u_xlat4.y;
					    u_xlat1.xw = u_xlat3.xy * vec2(0.0192307699, 0.00347222225);
					    u_xlat7.y = sin(u_xlat14.x);
					    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
					    u_xlat7.x = u_xlat7.y + u_xlat7.x;
					    u_xlat7.x = u_xlat7.x * 0.5 + 0.5;
					    u_xlat3.y = 0.0078125;
					    u_xlat5.x = cos(u_xlat4.x);
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat3.x = u_xlat4.x * 0.0078125;
					    u_xlat5.y = u_xlat3.x * u_xlat5.x;
					    u_xlat5.x = u_xlat4.x * 0.0078125 + -0.00999999978;
					    u_xlat14.xy = u_xlat5.xy * u_xlat3.xy + u_xlat1.xw;
					    u_xlat10_3 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_14 = u_xlat10_3.y * 0.289000005;
					    u_xlat16_14 = u_xlat10_3.x * -0.147 + (-u_xlat16_14);
					    u_xlat5.yw = u_xlat10_3.zz * vec2(0.43599999, 0.43599999) + vec2(u_xlat16_14);
					    u_xlat16_14 = u_xlat10_3.y * 0.514999986;
					    u_xlat16_14 = u_xlat10_3.x * 0.61500001 + (-u_xlat16_14);
					    u_xlat5.xz = (-u_xlat10_3.zz) * vec2(0.100000001, 0.100000001) + vec2(u_xlat16_14);
					    u_xlat14.x = CONTRAST + 1.0;
					    u_xlat3 = u_xlat5 / u_xlat14.xxxx;
					    u_xlat3 = u_xlat7.xxxx * u_xlat3;
					    u_xlat7.x = (-u_xlat3.y) * 0.395000011 + u_xlat16_0.x;
					    u_xlat5.xz = u_xlat3.xw * vec2(1.13999999, 2.03200006) + u_xlat16_0.xx;
					    u_xlat5.y = (-u_xlat3.z) * 0.58099997 + u_xlat7.x;
					    u_xlat0.xyz = max(u_xlat5.xyz, vec3(0.0799999982, 0.0799999982, 0.0799999982));
					    u_xlat0.xyz = min(u_xlat0.xyz, vec3(0.949999988, 0.949999988, 0.949999988));
					    u_xlat3.xyz = (-u_xlat0.xyz) * vec3(1.04999995, 1.04999995, 1.04999995) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
					    u_xlatb1.xw = greaterThanEqual(u_xlat4.zzzw, (-u_xlat4.zzzw)).xw;
					    u_xlat4.xy = fract(abs(u_xlat4.zw));
					    u_xlat1.x = (u_xlatb1.x) ? u_xlat4.x : (-u_xlat4.x);
					    u_xlat1.w = (u_xlatb1.w) ? u_xlat4.y : (-u_xlat4.y);
					    u_xlat1.xw = u_xlat1.xw * vec2(8.0, 8.0);
					    u_xlat1.xw = floor(u_xlat1.xw);
					    u_xlat21 = u_xlat1.x * 0.125;
					    u_xlat1.x = (-u_xlat1.w) * 0.125 + 1.0;
					    u_xlat4.x = u_xlat8.x * 0.125 + u_xlat21;
					    u_xlat4.y = u_xlat8.y * 0.125 + u_xlat1.x;
					    u_xlat4.z = u_xlat8.y * -1.125 + u_xlat1.x;
					    u_xlat10_5 = texture(VHS, u_xlat4.xy);
					    u_xlat5.xyz = u_xlat10_5.xyz + vec3(vec3(Brightness, Brightness, Brightness));
					    u_xlat5.xyz = u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat5.xyz = vec3(NOISE) * u_xlat5.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz;
					    u_xlatb0.xyz = lessThan(u_xlat0.xyzx, vec4(0.476190507, 0.476190507, 0.476190507, 0.0)).xyz;
					    u_xlat5.xyz = u_xlat5.xyz * vec3(2.0999999, 2.0999999, 2.0999999);
					    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat0.x = (u_xlatb0.x) ? u_xlat5.x : u_xlat3.x;
					    u_xlat0.y = (u_xlatb0.y) ? u_xlat5.y : u_xlat3.y;
					    u_xlat0.z = (u_xlatb0.z) ? u_xlat5.z : u_xlat3.z;
					    u_xlat2.z = 1.0;
					    u_xlat1.xw = u_xlat2.xz + u_xlat4.xz;
					    u_xlat21 = u_xlat2.y + 1.0;
					    u_xlat21 = u_xlat21 * TRACKING;
					    u_xlat1.xy = vec2(vec2(GLITCH, GLITCH)) * u_xlat1.xw + u_xlat8.xy;
					    u_xlat10_1 = texture(VHS2, u_xlat1.xy);
					    SV_Target0.xyz = vec3(u_xlat21) * u_xlat10_1.xyz + u_xlat0.xyz;
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