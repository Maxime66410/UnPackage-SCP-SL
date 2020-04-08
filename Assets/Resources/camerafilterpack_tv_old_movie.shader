Shader "CameraFilterPack/TV_Old_Movie" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 21244
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					bool u_xlatb4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					float u_xlat8;
					vec2 u_xlat10;
					vec2 u_xlat11;
					float u_xlat12;
					bool u_xlatb12;
					vec2 u_xlat13;
					float u_xlat15;
					float u_xlat16;
					int u_xlati16;
					float u_xlat17;
					bool u_xlatb17;
					float u_xlat18;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat10.x = _TimeX * 15.0;
					    u_xlat1.x = trunc(u_xlat10.x);
					    u_xlat1.y = 1.0;
					    u_xlat10.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat10.x = sin(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * 43758.5469;
					    u_xlat2.x = fract(u_xlat10.x);
					    u_xlat1.zw = u_xlat1.xx + vec2(23.0, 8.0);
					    u_xlat10.x = dot(u_xlat1.zy, vec2(12.9898005, 78.2330017));
					    u_xlat10.x = sin(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * 43758.5469;
					    u_xlat2.y = fract(u_xlat10.x);
					    u_xlat10.xy = u_xlat2.xy * vec2(0.00200000009, 0.00200000009) + u_xlat0.yx;
					    u_xlat10_2 = texture(_MainTex, u_xlat10.xy);
					    u_xlat10.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_2.xyz);
					    u_xlat15 = dot(u_xlat1.wy, vec2(12.9898005, 78.2330017));
					    u_xlat10.y = sin(u_xlat15);
					    u_xlat10.xy = u_xlat10.xy * vec2(0.699999988, 43758.5469);
					    u_xlat15 = fract(u_xlat10.y);
					    u_xlat11.xy = (-u_xlat0.yx) + vec2(1.0, 1.0);
					    u_xlat11.x = u_xlat0.y * u_xlat11.x;
					    u_xlat11.x = u_xlat0.x * u_xlat11.x;
					    u_xlat11.x = u_xlat11.y * u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * 16.0;
					    u_xlat16 = u_xlat15 + 0.5;
					    u_xlat16 = u_xlat16 * 0.300000012 + 0.699999988;
					    u_xlat2.xy = vec2(u_xlat15) * vec2(0.400000006, 8.0);
					    u_xlat16 = u_xlat11.x * u_xlat16 + u_xlat2.x;
					    u_xlat16 = u_xlat16 + 1.0;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 0.400000006;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * u_xlat16;
					    u_xlati16 = int(u_xlat2.y);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    u_xlat3 = u_xlat1.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat16 = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat3.y = fract(u_xlat16);
					    u_xlat16 = u_xlat3.y + -0.5;
					    u_xlatb12 = 0.200000003<u_xlat3.y;
					    u_xlat4.xy = u_xlat0.xy * u_xlat3.yy;
					    u_xlat17 = u_xlat4.x * 0.00999999978 + u_xlat4.y;
					    u_xlat16 = u_xlat16 + u_xlat17;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat17 = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb12) ? u_xlat16 : u_xlat17;
					    u_xlat16 = u_xlat16 * 0.5 + 0.5;
					    u_xlat16 = u_xlat16 * u_xlat11.x;
					    u_xlat11.x = (u_xlatb2.x) ? u_xlat16 : u_xlat11.x;
					    u_xlat16 = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat2.x = u_xlat16 + -0.5;
					    u_xlatb12 = 0.200000003<u_xlat16;
					    u_xlat13.xy = u_xlat0.xy * vec2(u_xlat16);
					    u_xlat16 = u_xlat13.x * 0.00999999978 + u_xlat13.y;
					    u_xlat16 = u_xlat2.x + u_xlat16;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat2.x = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb12) ? u_xlat16 : u_xlat2.x;
					    u_xlat16 = u_xlat16 * 0.5 + 0.5;
					    u_xlat16 = u_xlat16 * u_xlat11.x;
					    u_xlat11.x = (u_xlatb2.y) ? u_xlat16 : u_xlat11.x;
					    u_xlat2.xy = u_xlat1.xy + vec2(18.0, 0.0);
					    u_xlat16 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat16 = u_xlat16 * 8.0 + -2.0;
					    u_xlat16 = max(u_xlat16, 0.0);
					    u_xlati16 = int(u_xlat16);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    if(u_xlatb2.x){
					        u_xlat2.xz = u_xlat1.xy + vec2(6.0, 0.0);
					        u_xlat16 = dot(u_xlat2.xz, vec2(12.9898005, 78.2330017));
					        u_xlat16 = sin(u_xlat16);
					        u_xlat16 = u_xlat16 * 43758.5469;
					        u_xlat3.x = fract(u_xlat16);
					        u_xlat16 = u_xlat15 * 0.00999999978;
					        u_xlat2.xz = (-u_xlat0.yx) + u_xlat3.xy;
					        u_xlat17 = u_xlat2.z / u_xlat2.x;
					        u_xlat8 = min(abs(u_xlat17), 1.0);
					        u_xlat13.x = max(abs(u_xlat17), 1.0);
					        u_xlat13.x = float(1.0) / u_xlat13.x;
					        u_xlat8 = u_xlat13.x * u_xlat8;
					        u_xlat13.x = u_xlat8 * u_xlat8;
					        u_xlat18 = u_xlat13.x * 0.0208350997 + -0.0851330012;
					        u_xlat18 = u_xlat13.x * u_xlat18 + 0.180141002;
					        u_xlat18 = u_xlat13.x * u_xlat18 + -0.330299497;
					        u_xlat13.x = u_xlat13.x * u_xlat18 + 0.999866009;
					        u_xlat18 = u_xlat13.x * u_xlat8;
					        u_xlatb4 = 1.0<abs(u_xlat17);
					        u_xlat18 = u_xlat18 * -2.0 + 1.57079637;
					        u_xlat18 = u_xlatb4 ? u_xlat18 : float(0.0);
					        u_xlat8 = u_xlat8 * u_xlat13.x + u_xlat18;
					        u_xlat17 = min(u_xlat17, 1.0);
					        u_xlatb17 = u_xlat17<(-u_xlat17);
					        u_xlat17 = (u_xlatb17) ? (-u_xlat8) : u_xlat8;
					        u_xlat16 = u_xlat16 * u_xlat16;
					        u_xlat17 = u_xlat17 * u_xlat3.x;
					        u_xlat17 = u_xlat17 * 6.28310013;
					        u_xlat17 = sin(u_xlat17);
					        u_xlat17 = u_xlat17 * 0.100000001 + 1.0;
					        u_xlat3.x = u_xlat16 * u_xlat17;
					        u_xlat2.x = dot(u_xlat2.xz, u_xlat2.xz);
					        u_xlatb12 = u_xlat2.x<u_xlat3.x;
					        u_xlat16 = (-u_xlat16) * u_xlat17 + u_xlat2.x;
					        u_xlat16 = log2(u_xlat16);
					        u_xlat16 = u_xlat16 * 0.0625;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat16 = (u_xlatb12) ? 0.200000003 : u_xlat16;
					        u_xlat15 = (-u_xlat15) * 0.5 + 1.0;
					        u_xlat15 = u_xlat15 * 0.200000003 + 0.300000012;
					        u_xlat2.x = (-u_xlat15) + 1.0;
					        u_xlat15 = u_xlat16 * u_xlat2.x + u_xlat15;
					        u_xlat11.x = u_xlat15 * u_xlat11.x;
					    }
					    if(u_xlatb2.y){
					        u_xlat2 = u_xlat1.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat15 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					        u_xlat15 = sin(u_xlat15);
					        u_xlat15 = u_xlat15 * 43758.5469;
					        u_xlat2.x = fract(u_xlat15);
					        u_xlat15 = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					        u_xlat15 = sin(u_xlat15);
					        u_xlat15 = u_xlat15 * 43758.5469;
					        u_xlat2.y = fract(u_xlat15);
					        u_xlat1.xy = u_xlat1.xy + vec2(27.0, 0.0);
					        u_xlat15 = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					        u_xlat15 = sin(u_xlat15);
					        u_xlat15 = u_xlat15 * 43758.5469;
					        u_xlat15 = fract(u_xlat15);
					        u_xlat1.x = u_xlat15 * 0.00999999978;
					        u_xlat0.xy = (-u_xlat0.yx) + u_xlat2.xy;
					        u_xlat6 = u_xlat0.y / u_xlat0.x;
					        u_xlat16 = min(abs(u_xlat6), 1.0);
					        u_xlat7 = max(abs(u_xlat6), 1.0);
					        u_xlat7 = float(1.0) / u_xlat7;
					        u_xlat16 = u_xlat16 * u_xlat7;
					        u_xlat7 = u_xlat16 * u_xlat16;
					        u_xlat12 = u_xlat7 * 0.0208350997 + -0.0851330012;
					        u_xlat12 = u_xlat7 * u_xlat12 + 0.180141002;
					        u_xlat12 = u_xlat7 * u_xlat12 + -0.330299497;
					        u_xlat7 = u_xlat7 * u_xlat12 + 0.999866009;
					        u_xlat12 = u_xlat16 * u_xlat7;
					        u_xlatb17 = 1.0<abs(u_xlat6);
					        u_xlat12 = u_xlat12 * -2.0 + 1.57079637;
					        u_xlat12 = u_xlatb17 ? u_xlat12 : float(0.0);
					        u_xlat16 = u_xlat16 * u_xlat7 + u_xlat12;
					        u_xlat6 = min(u_xlat6, 1.0);
					        u_xlatb6 = u_xlat6<(-u_xlat6);
					        u_xlat6 = (u_xlatb6) ? (-u_xlat16) : u_xlat16;
					        u_xlat1.x = u_xlat1.x * u_xlat1.x;
					        u_xlat6 = u_xlat6 * u_xlat2.x;
					        u_xlat6 = u_xlat6 * 6.28310013;
					        u_xlat6 = sin(u_xlat6);
					        u_xlat6 = u_xlat6 * 0.100000001 + 1.0;
					        u_xlat16 = u_xlat6 * u_xlat1.x;
					        u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					        u_xlatb5 = u_xlat0.x<u_xlat16;
					        u_xlat0.x = (-u_xlat1.x) * u_xlat6 + u_xlat0.x;
					        u_xlat0.x = log2(u_xlat0.x);
					        u_xlat0.x = u_xlat0.x * 0.0625;
					        u_xlat0.x = exp2(u_xlat0.x);
					        u_xlat0.x = (u_xlatb5) ? 0.200000003 : u_xlat0.x;
					        u_xlat5 = (-u_xlat15) * 0.5 + 1.0;
					        u_xlat5 = u_xlat5 * 0.200000003 + 0.300000012;
					        u_xlat15 = (-u_xlat5) + 1.0;
					        u_xlat0.x = u_xlat0.x * u_xlat15 + u_xlat5;
					        u_xlat11.x = u_xlat0.x * u_xlat11.x;
					    }
					    SV_Target0.xyz = u_xlat10.xxx * u_xlat11.xxx;
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
					; Bound: 811
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %799 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 11 
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
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %107 RelaxedPrecision 
					                                              OpDecorate %107 DescriptorSet 107 
					                                              OpDecorate %107 Binding 107 
					                                              OpDecorate %108 RelaxedPrecision 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %111 DescriptorSet 111 
					                                              OpDecorate %111 Binding 111 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %117 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %799 Location 799 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %14 = OpTypeVector %6 4 
					                                      %15 = OpTypeStruct %6 %14 
					                                      %16 = OpTypePointer Uniform %15 
					        Uniform struct {f32; f32_4;}* %17 = OpVariable Uniform 
					                                      %18 = OpTypeInt 32 1 
					                                  i32 %19 = OpConstant 1 
					                                      %20 = OpTypePointer Uniform %14 
					                       Private f32_2* %29 = OpVariable Private 
					                                  i32 %30 = OpConstant 0 
					                                      %31 = OpTypePointer Uniform %6 
					                                  f32 %34 = OpConstant 3,674022E-40 
					                                      %36 = OpTypeInt 32 0 
					                                  u32 %37 = OpConstant 0 
					                                      %38 = OpTypePointer Private %6 
					                                      %40 = OpTypePointer Private %14 
					                       Private f32_4* %41 = OpVariable Private 
					                                  f32 %46 = OpConstant 3,674022E-40 
					                                  u32 %47 = OpConstant 1 
					                                  f32 %51 = OpConstant 3,674022E-40 
					                                  f32 %52 = OpConstant 3,674022E-40 
					                                f32_2 %53 = OpConstantComposite %51 %52 
					                                  f32 %62 = OpConstant 3,674022E-40 
					                       Private f32_4* %65 = OpVariable Private 
					                                  f32 %72 = OpConstant 3,674022E-40 
					                                  f32 %73 = OpConstant 3,674022E-40 
					                                f32_2 %74 = OpConstantComposite %72 %73 
					                                  f32 %96 = OpConstant 3,674022E-40 
					                                f32_2 %97 = OpConstantComposite %96 %96 
					                                     %102 = OpTypeVector %6 3 
					                                     %103 = OpTypePointer Private %102 
					                      Private f32_3* %104 = OpVariable Private 
					                                     %105 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %106 = OpTypePointer UniformConstant %105 
					UniformConstant read_only Texture2D* %107 = OpVariable UniformConstant 
					                                     %109 = OpTypeSampler 
					                                     %110 = OpTypePointer UniformConstant %109 
					            UniformConstant sampler* %111 = OpVariable UniformConstant 
					                                     %113 = OpTypeSampledImage %105 
					                                 f32 %118 = OpConstant 3,674022E-40 
					                                 f32 %119 = OpConstant 3,674022E-40 
					                                 f32 %120 = OpConstant 3,674022E-40 
					                               f32_3 %121 = OpConstantComposite %118 %119 %120 
					                        Private f32* %125 = OpVariable Private 
					                                 f32 %133 = OpConstant 3,674022E-40 
					                               f32_2 %134 = OpConstantComposite %133 %62 
					                      Private f32_2* %139 = OpVariable Private 
					                               f32_2 %143 = OpConstantComposite %46 %46 
					                                 f32 %165 = OpConstant 3,674022E-40 
					                        Private f32* %168 = OpVariable Private 
					                                 f32 %170 = OpConstant 3,674022E-40 
					                                 f32 %173 = OpConstant 3,674022E-40 
					                                 f32 %178 = OpConstant 3,674022E-40 
					                               f32_2 %179 = OpConstantComposite %178 %73 
					                                     %209 = OpTypePointer Private %18 
					                        Private i32* %210 = OpVariable Private 
					                                     %214 = OpTypeBool 
					                                     %215 = OpTypeVector %214 2 
					                                     %216 = OpTypePointer Private %215 
					                     Private bool_2* %217 = OpVariable Private 
					                                     %218 = OpTypeVector %18 4 
					                               i32_4 %219 = OpConstantComposite %30 %19 %30 %30 
					                                     %222 = OpTypeVector %214 4 
					                      Private f32_4* %225 = OpVariable Private 
					                                 f32 %228 = OpConstant 3,674022E-40 
					                                 f32 %229 = OpConstant 3,674022E-40 
					                                 f32 %230 = OpConstant 3,674022E-40 
					                               f32_4 %231 = OpConstantComposite %228 %229 %230 %229 
					                                 f32 %245 = OpConstant 3,674022E-40 
					                                     %247 = OpTypePointer Private %214 
					                       Private bool* %248 = OpVariable Private 
					                                 f32 %249 = OpConstant 3,674022E-40 
					                      Private f32_2* %253 = OpVariable Private 
					                        Private f32* %258 = OpVariable Private 
					                                 f32 %261 = OpConstant 3,674022E-40 
					                                 f32 %273 = OpConstant 3,674022E-40 
					                                 f32 %279 = OpConstant 3,674022E-40 
					                                     %294 = OpTypePointer Function %6 
					                      Private f32_2* %318 = OpVariable Private 
					                                 f32 %373 = OpConstant 3,674022E-40 
					                               f32_2 %374 = OpConstantComposite %373 %229 
					                                 f32 %389 = OpConstant 3,674022E-40 
					                                 f32 %405 = OpConstant 3,674022E-40 
					                               f32_2 %406 = OpConstantComposite %405 %229 
					                                 u32 %430 = OpConstant 2 
					                        Private f32* %436 = OpVariable Private 
					                        Private f32* %456 = OpVariable Private 
					                                 f32 %459 = OpConstant 3,674022E-40 
					                                 f32 %461 = OpConstant 3,674022E-40 
					                                 f32 %467 = OpConstant 3,674022E-40 
					                                 f32 %473 = OpConstant 3,674022E-40 
					                                 f32 %479 = OpConstant 3,674022E-40 
					                       Private bool* %486 = OpVariable Private 
					                                 f32 %492 = OpConstant 3,674022E-40 
					                       Private bool* %505 = OpVariable Private 
					                                 f32 %527 = OpConstant 3,674022E-40 
					                                 f32 %532 = OpConstant 3,674022E-40 
					                                 f32 %560 = OpConstant 3,674022E-40 
					                                 f32 %595 = OpConstant 3,674022E-40 
					                                 f32 %596 = OpConstant 3,674022E-40 
					                               f32_4 %597 = OpConstantComposite %595 %229 %596 %229 
					                                 f32 %621 = OpConstant 3,674022E-40 
					                               f32_2 %622 = OpConstantComposite %621 %229 
					                        Private f32* %644 = OpVariable Private 
					                        Private f32* %653 = OpVariable Private 
					                        Private f32* %665 = OpVariable Private 
					                       Private bool* %700 = OpVariable Private 
					                       Private bool* %739 = OpVariable Private 
					                        Private f32* %774 = OpVariable Private 
					                                     %798 = OpTypePointer Output %14 
					                       Output f32_4* %799 = OpVariable Output 
					                                 u32 %807 = OpConstant 3 
					                                     %808 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Function f32* %295 = OpVariable Function 
					                       Function f32* %345 = OpVariable Function 
					                       Function f32* %362 = OpVariable Function 
					                       Function f32* %511 = OpVariable Function 
					                       Function f32* %706 = OpVariable Function 
					                       Function f32* %766 = OpVariable Function 
					                                f32_2 %12 = OpLoad vs_TEXCOORD0 
					                                f32_2 %13 = OpVectorShuffle %12 %12 1 0 
					                       Uniform f32_4* %21 = OpAccessChain %17 %19 
					                                f32_4 %22 = OpLoad %21 
					                                f32_2 %23 = OpVectorShuffle %22 %22 1 0 
					                                f32_2 %24 = OpFMul %13 %23 
					                       Uniform f32_4* %25 = OpAccessChain %17 %19 
					                                f32_4 %26 = OpLoad %25 
					                                f32_2 %27 = OpVectorShuffle %26 %26 3 2 
					                                f32_2 %28 = OpFAdd %24 %27 
					                                              OpStore %9 %28 
					                         Uniform f32* %32 = OpAccessChain %17 %30 
					                                  f32 %33 = OpLoad %32 
					                                  f32 %35 = OpFMul %33 %34 
					                         Private f32* %39 = OpAccessChain %29 %37 
					                                              OpStore %39 %35 
					                         Private f32* %42 = OpAccessChain %29 %37 
					                                  f32 %43 = OpLoad %42 
					                                  f32 %44 = OpExtInst %1 3 %43 
					                         Private f32* %45 = OpAccessChain %41 %37 
					                                              OpStore %45 %44 
					                         Private f32* %48 = OpAccessChain %41 %47 
					                                              OpStore %48 %46 
					                                f32_4 %49 = OpLoad %41 
					                                f32_2 %50 = OpVectorShuffle %49 %49 0 1 
					                                  f32 %54 = OpDot %50 %53 
					                         Private f32* %55 = OpAccessChain %29 %37 
					                                              OpStore %55 %54 
					                         Private f32* %56 = OpAccessChain %29 %37 
					                                  f32 %57 = OpLoad %56 
					                                  f32 %58 = OpExtInst %1 13 %57 
					                         Private f32* %59 = OpAccessChain %29 %37 
					                                              OpStore %59 %58 
					                         Private f32* %60 = OpAccessChain %29 %37 
					                                  f32 %61 = OpLoad %60 
					                                  f32 %63 = OpFMul %61 %62 
					                         Private f32* %64 = OpAccessChain %29 %37 
					                                              OpStore %64 %63 
					                         Private f32* %66 = OpAccessChain %29 %37 
					                                  f32 %67 = OpLoad %66 
					                                  f32 %68 = OpExtInst %1 10 %67 
					                         Private f32* %69 = OpAccessChain %65 %37 
					                                              OpStore %69 %68 
					                                f32_4 %70 = OpLoad %41 
					                                f32_2 %71 = OpVectorShuffle %70 %70 0 0 
					                                f32_2 %75 = OpFAdd %71 %74 
					                                f32_4 %76 = OpLoad %41 
					                                f32_4 %77 = OpVectorShuffle %76 %75 0 1 4 5 
					                                              OpStore %41 %77 
					                                f32_4 %78 = OpLoad %41 
					                                f32_2 %79 = OpVectorShuffle %78 %78 2 1 
					                                  f32 %80 = OpDot %79 %53 
					                         Private f32* %81 = OpAccessChain %29 %37 
					                                              OpStore %81 %80 
					                         Private f32* %82 = OpAccessChain %29 %37 
					                                  f32 %83 = OpLoad %82 
					                                  f32 %84 = OpExtInst %1 13 %83 
					                         Private f32* %85 = OpAccessChain %29 %37 
					                                              OpStore %85 %84 
					                         Private f32* %86 = OpAccessChain %29 %37 
					                                  f32 %87 = OpLoad %86 
					                                  f32 %88 = OpFMul %87 %62 
					                         Private f32* %89 = OpAccessChain %29 %37 
					                                              OpStore %89 %88 
					                         Private f32* %90 = OpAccessChain %29 %37 
					                                  f32 %91 = OpLoad %90 
					                                  f32 %92 = OpExtInst %1 10 %91 
					                         Private f32* %93 = OpAccessChain %65 %47 
					                                              OpStore %93 %92 
					                                f32_4 %94 = OpLoad %65 
					                                f32_2 %95 = OpVectorShuffle %94 %94 0 1 
					                                f32_2 %98 = OpFMul %95 %97 
					                                f32_2 %99 = OpLoad %9 
					                               f32_2 %100 = OpVectorShuffle %99 %99 1 0 
					                               f32_2 %101 = OpFAdd %98 %100 
					                                              OpStore %29 %101 
					                 read_only Texture2D %108 = OpLoad %107 
					                             sampler %112 = OpLoad %111 
					          read_only Texture2DSampled %114 = OpSampledImage %108 %112 
					                               f32_2 %115 = OpLoad %29 
					                               f32_4 %116 = OpImageSampleImplicitLod %114 %115 
					                               f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
					                                              OpStore %104 %117 
					                               f32_3 %122 = OpLoad %104 
					                                 f32 %123 = OpDot %121 %122 
					                        Private f32* %124 = OpAccessChain %29 %37 
					                                              OpStore %124 %123 
					                               f32_4 %126 = OpLoad %41 
					                               f32_2 %127 = OpVectorShuffle %126 %126 3 1 
					                                 f32 %128 = OpDot %127 %53 
					                                              OpStore %125 %128 
					                                 f32 %129 = OpLoad %125 
					                                 f32 %130 = OpExtInst %1 13 %129 
					                        Private f32* %131 = OpAccessChain %29 %47 
					                                              OpStore %131 %130 
					                               f32_2 %132 = OpLoad %29 
					                               f32_2 %135 = OpFMul %132 %134 
					                                              OpStore %29 %135 
					                        Private f32* %136 = OpAccessChain %29 %47 
					                                 f32 %137 = OpLoad %136 
					                                 f32 %138 = OpExtInst %1 10 %137 
					                                              OpStore %125 %138 
					                               f32_2 %140 = OpLoad %9 
					                               f32_2 %141 = OpVectorShuffle %140 %140 1 0 
					                               f32_2 %142 = OpFNegate %141 
					                               f32_2 %144 = OpFAdd %142 %143 
					                                              OpStore %139 %144 
					                        Private f32* %145 = OpAccessChain %9 %47 
					                                 f32 %146 = OpLoad %145 
					                        Private f32* %147 = OpAccessChain %139 %37 
					                                 f32 %148 = OpLoad %147 
					                                 f32 %149 = OpFMul %146 %148 
					                        Private f32* %150 = OpAccessChain %139 %37 
					                                              OpStore %150 %149 
					                        Private f32* %151 = OpAccessChain %9 %37 
					                                 f32 %152 = OpLoad %151 
					                        Private f32* %153 = OpAccessChain %139 %37 
					                                 f32 %154 = OpLoad %153 
					                                 f32 %155 = OpFMul %152 %154 
					                        Private f32* %156 = OpAccessChain %139 %37 
					                                              OpStore %156 %155 
					                        Private f32* %157 = OpAccessChain %139 %47 
					                                 f32 %158 = OpLoad %157 
					                        Private f32* %159 = OpAccessChain %139 %37 
					                                 f32 %160 = OpLoad %159 
					                                 f32 %161 = OpFMul %158 %160 
					                        Private f32* %162 = OpAccessChain %139 %37 
					                                              OpStore %162 %161 
					                        Private f32* %163 = OpAccessChain %139 %37 
					                                 f32 %164 = OpLoad %163 
					                                 f32 %166 = OpFMul %164 %165 
					                        Private f32* %167 = OpAccessChain %139 %37 
					                                              OpStore %167 %166 
					                                 f32 %169 = OpLoad %125 
					                                 f32 %171 = OpFAdd %169 %170 
					                                              OpStore %168 %171 
					                                 f32 %172 = OpLoad %168 
					                                 f32 %174 = OpFMul %172 %173 
					                                 f32 %175 = OpFAdd %174 %133 
					                                              OpStore %168 %175 
					                                 f32 %176 = OpLoad %125 
					                               f32_2 %177 = OpCompositeConstruct %176 %176 
					                               f32_2 %180 = OpFMul %177 %179 
					                               f32_4 %181 = OpLoad %65 
					                               f32_4 %182 = OpVectorShuffle %181 %180 4 5 2 3 
					                                              OpStore %65 %182 
					                        Private f32* %183 = OpAccessChain %139 %37 
					                                 f32 %184 = OpLoad %183 
					                                 f32 %185 = OpLoad %168 
					                                 f32 %186 = OpFMul %184 %185 
					                        Private f32* %187 = OpAccessChain %65 %37 
					                                 f32 %188 = OpLoad %187 
					                                 f32 %189 = OpFAdd %186 %188 
					                                              OpStore %168 %189 
					                                 f32 %190 = OpLoad %168 
					                                 f32 %191 = OpFAdd %190 %46 
					                                              OpStore %168 %191 
					                        Private f32* %192 = OpAccessChain %139 %37 
					                                 f32 %193 = OpLoad %192 
					                                 f32 %194 = OpExtInst %1 30 %193 
					                        Private f32* %195 = OpAccessChain %139 %37 
					                                              OpStore %195 %194 
					                        Private f32* %196 = OpAccessChain %139 %37 
					                                 f32 %197 = OpLoad %196 
					                                 f32 %198 = OpFMul %197 %178 
					                        Private f32* %199 = OpAccessChain %139 %37 
					                                              OpStore %199 %198 
					                        Private f32* %200 = OpAccessChain %139 %37 
					                                 f32 %201 = OpLoad %200 
					                                 f32 %202 = OpExtInst %1 29 %201 
					                        Private f32* %203 = OpAccessChain %139 %37 
					                                              OpStore %203 %202 
					                        Private f32* %204 = OpAccessChain %139 %37 
					                                 f32 %205 = OpLoad %204 
					                                 f32 %206 = OpLoad %168 
					                                 f32 %207 = OpFMul %205 %206 
					                        Private f32* %208 = OpAccessChain %139 %37 
					                                              OpStore %208 %207 
					                        Private f32* %211 = OpAccessChain %65 %47 
					                                 f32 %212 = OpLoad %211 
					                                 i32 %213 = OpConvertFToS %212 
					                                              OpStore %210 %213 
					                                 i32 %220 = OpLoad %210 
					                               i32_4 %221 = OpCompositeConstruct %220 %220 %220 %220 
					                              bool_4 %223 = OpSLessThan %219 %221 
					                              bool_2 %224 = OpVectorShuffle %223 %223 0 1 
					                                              OpStore %217 %224 
					                               f32_4 %226 = OpLoad %41 
					                               f32_4 %227 = OpVectorShuffle %226 %226 0 1 0 1 
					                               f32_4 %232 = OpFAdd %227 %231 
					                                              OpStore %225 %232 
					                               f32_4 %233 = OpLoad %225 
					                               f32_2 %234 = OpVectorShuffle %233 %233 0 1 
					                                 f32 %235 = OpDot %234 %53 
					                                              OpStore %168 %235 
					                                 f32 %236 = OpLoad %168 
					                                 f32 %237 = OpExtInst %1 13 %236 
					                                              OpStore %168 %237 
					                                 f32 %238 = OpLoad %168 
					                                 f32 %239 = OpFMul %238 %62 
					                                              OpStore %168 %239 
					                                 f32 %240 = OpLoad %168 
					                                 f32 %241 = OpExtInst %1 10 %240 
					                        Private f32* %242 = OpAccessChain %225 %47 
					                                              OpStore %242 %241 
					                        Private f32* %243 = OpAccessChain %225 %47 
					                                 f32 %244 = OpLoad %243 
					                                 f32 %246 = OpFAdd %244 %245 
					                                              OpStore %168 %246 
					                        Private f32* %250 = OpAccessChain %225 %47 
					                                 f32 %251 = OpLoad %250 
					                                bool %252 = OpFOrdLessThan %249 %251 
					                                              OpStore %248 %252 
					                               f32_2 %254 = OpLoad %9 
					                               f32_4 %255 = OpLoad %225 
					                               f32_2 %256 = OpVectorShuffle %255 %255 1 1 
					                               f32_2 %257 = OpFMul %254 %256 
					                                              OpStore %253 %257 
					                        Private f32* %259 = OpAccessChain %253 %37 
					                                 f32 %260 = OpLoad %259 
					                                 f32 %262 = OpFMul %260 %261 
					                        Private f32* %263 = OpAccessChain %253 %47 
					                                 f32 %264 = OpLoad %263 
					                                 f32 %265 = OpFAdd %262 %264 
					                                              OpStore %258 %265 
					                                 f32 %266 = OpLoad %168 
					                                 f32 %267 = OpLoad %258 
					                                 f32 %268 = OpFAdd %266 %267 
					                                              OpStore %168 %268 
					                                 f32 %269 = OpLoad %168 
					                                 f32 %270 = OpExtInst %1 4 %269 
					                                 f32 %271 = OpExtInst %1 30 %270 
					                                              OpStore %168 %271 
					                                 f32 %272 = OpLoad %168 
					                                 f32 %274 = OpFMul %272 %273 
					                                              OpStore %168 %274 
					                                 f32 %275 = OpLoad %168 
					                                 f32 %276 = OpExtInst %1 29 %275 
					                                              OpStore %168 %276 
					                                 f32 %277 = OpLoad %168 
					                                 f32 %278 = OpFNegate %277 
					                                 f32 %280 = OpFAdd %278 %279 
					                                              OpStore %258 %280 
					                                bool %281 = OpLoad %248 
					                                 f32 %282 = OpLoad %168 
					                                 f32 %283 = OpLoad %258 
					                                 f32 %284 = OpSelect %281 %282 %283 
					                                              OpStore %168 %284 
					                                 f32 %285 = OpLoad %168 
					                                 f32 %286 = OpFMul %285 %170 
					                                 f32 %287 = OpFAdd %286 %170 
					                                              OpStore %168 %287 
					                                 f32 %288 = OpLoad %168 
					                        Private f32* %289 = OpAccessChain %139 %37 
					                                 f32 %290 = OpLoad %289 
					                                 f32 %291 = OpFMul %288 %290 
					                                              OpStore %168 %291 
					                       Private bool* %292 = OpAccessChain %217 %37 
					                                bool %293 = OpLoad %292 
					                                              OpSelectionMerge %297 None 
					                                              OpBranchConditional %293 %296 %299 
					                                     %296 = OpLabel 
					                                 f32 %298 = OpLoad %168 
					                                              OpStore %295 %298 
					                                              OpBranch %297 
					                                     %299 = OpLabel 
					                        Private f32* %300 = OpAccessChain %139 %37 
					                                 f32 %301 = OpLoad %300 
					                                              OpStore %295 %301 
					                                              OpBranch %297 
					                                     %297 = OpLabel 
					                                 f32 %302 = OpLoad %295 
					                        Private f32* %303 = OpAccessChain %139 %37 
					                                              OpStore %303 %302 
					                               f32_4 %304 = OpLoad %225 
					                               f32_2 %305 = OpVectorShuffle %304 %304 2 3 
					                                 f32 %306 = OpDot %305 %53 
					                                              OpStore %168 %306 
					                                 f32 %307 = OpLoad %168 
					                                 f32 %308 = OpExtInst %1 13 %307 
					                                              OpStore %168 %308 
					                                 f32 %309 = OpLoad %168 
					                                 f32 %310 = OpFMul %309 %62 
					                                              OpStore %168 %310 
					                                 f32 %311 = OpLoad %168 
					                                 f32 %312 = OpExtInst %1 10 %311 
					                                              OpStore %168 %312 
					                                 f32 %313 = OpLoad %168 
					                                 f32 %314 = OpFAdd %313 %245 
					                        Private f32* %315 = OpAccessChain %65 %37 
					                                              OpStore %315 %314 
					                                 f32 %316 = OpLoad %168 
					                                bool %317 = OpFOrdLessThan %249 %316 
					                                              OpStore %248 %317 
					                               f32_2 %319 = OpLoad %9 
					                                 f32 %320 = OpLoad %168 
					                               f32_2 %321 = OpCompositeConstruct %320 %320 
					                               f32_2 %322 = OpFMul %319 %321 
					                                              OpStore %318 %322 
					                        Private f32* %323 = OpAccessChain %318 %37 
					                                 f32 %324 = OpLoad %323 
					                                 f32 %325 = OpFMul %324 %261 
					                        Private f32* %326 = OpAccessChain %318 %47 
					                                 f32 %327 = OpLoad %326 
					                                 f32 %328 = OpFAdd %325 %327 
					                                              OpStore %168 %328 
					                        Private f32* %329 = OpAccessChain %65 %37 
					                                 f32 %330 = OpLoad %329 
					                                 f32 %331 = OpLoad %168 
					                                 f32 %332 = OpFAdd %330 %331 
					                                              OpStore %168 %332 
					                                 f32 %333 = OpLoad %168 
					                                 f32 %334 = OpExtInst %1 4 %333 
					                                 f32 %335 = OpExtInst %1 30 %334 
					                                              OpStore %168 %335 
					                                 f32 %336 = OpLoad %168 
					                                 f32 %337 = OpFMul %336 %273 
					                                              OpStore %168 %337 
					                                 f32 %338 = OpLoad %168 
					                                 f32 %339 = OpExtInst %1 29 %338 
					                                              OpStore %168 %339 
					                                 f32 %340 = OpLoad %168 
					                                 f32 %341 = OpFNegate %340 
					                                 f32 %342 = OpFAdd %341 %279 
					                        Private f32* %343 = OpAccessChain %65 %37 
					                                              OpStore %343 %342 
					                                bool %344 = OpLoad %248 
					                                              OpSelectionMerge %347 None 
					                                              OpBranchConditional %344 %346 %349 
					                                     %346 = OpLabel 
					                                 f32 %348 = OpLoad %168 
					                                              OpStore %345 %348 
					                                              OpBranch %347 
					                                     %349 = OpLabel 
					                        Private f32* %350 = OpAccessChain %65 %37 
					                                 f32 %351 = OpLoad %350 
					                                              OpStore %345 %351 
					                                              OpBranch %347 
					                                     %347 = OpLabel 
					                                 f32 %352 = OpLoad %345 
					                                              OpStore %168 %352 
					                                 f32 %353 = OpLoad %168 
					                                 f32 %354 = OpFMul %353 %170 
					                                 f32 %355 = OpFAdd %354 %170 
					                                              OpStore %168 %355 
					                                 f32 %356 = OpLoad %168 
					                        Private f32* %357 = OpAccessChain %139 %37 
					                                 f32 %358 = OpLoad %357 
					                                 f32 %359 = OpFMul %356 %358 
					                                              OpStore %168 %359 
					                       Private bool* %360 = OpAccessChain %217 %47 
					                                bool %361 = OpLoad %360 
					                                              OpSelectionMerge %364 None 
					                                              OpBranchConditional %361 %363 %366 
					                                     %363 = OpLabel 
					                                 f32 %365 = OpLoad %168 
					                                              OpStore %362 %365 
					                                              OpBranch %364 
					                                     %366 = OpLabel 
					                        Private f32* %367 = OpAccessChain %139 %37 
					                                 f32 %368 = OpLoad %367 
					                                              OpStore %362 %368 
					                                              OpBranch %364 
					                                     %364 = OpLabel 
					                                 f32 %369 = OpLoad %362 
					                        Private f32* %370 = OpAccessChain %139 %37 
					                                              OpStore %370 %369 
					                               f32_4 %371 = OpLoad %41 
					                               f32_2 %372 = OpVectorShuffle %371 %371 0 1 
					                               f32_2 %375 = OpFAdd %372 %374 
					                               f32_4 %376 = OpLoad %65 
					                               f32_4 %377 = OpVectorShuffle %376 %375 4 5 2 3 
					                                              OpStore %65 %377 
					                               f32_4 %378 = OpLoad %65 
					                               f32_2 %379 = OpVectorShuffle %378 %378 0 1 
					                                 f32 %380 = OpDot %379 %53 
					                                              OpStore %168 %380 
					                                 f32 %381 = OpLoad %168 
					                                 f32 %382 = OpExtInst %1 13 %381 
					                                              OpStore %168 %382 
					                                 f32 %383 = OpLoad %168 
					                                 f32 %384 = OpFMul %383 %62 
					                                              OpStore %168 %384 
					                                 f32 %385 = OpLoad %168 
					                                 f32 %386 = OpExtInst %1 10 %385 
					                                              OpStore %168 %386 
					                                 f32 %387 = OpLoad %168 
					                                 f32 %388 = OpFMul %387 %73 
					                                 f32 %390 = OpFAdd %388 %389 
					                                              OpStore %168 %390 
					                                 f32 %391 = OpLoad %168 
					                                 f32 %392 = OpExtInst %1 40 %391 %229 
					                                              OpStore %168 %392 
					                                 f32 %393 = OpLoad %168 
					                                 i32 %394 = OpConvertFToS %393 
					                                              OpStore %210 %394 
					                                 i32 %395 = OpLoad %210 
					                               i32_4 %396 = OpCompositeConstruct %395 %395 %395 %395 
					                              bool_4 %397 = OpSLessThan %219 %396 
					                              bool_2 %398 = OpVectorShuffle %397 %397 0 1 
					                                              OpStore %217 %398 
					                       Private bool* %399 = OpAccessChain %217 %37 
					                                bool %400 = OpLoad %399 
					                                              OpSelectionMerge %402 None 
					                                              OpBranchConditional %400 %401 %402 
					                                     %401 = OpLabel 
					                               f32_4 %403 = OpLoad %41 
					                               f32_2 %404 = OpVectorShuffle %403 %403 0 1 
					                               f32_2 %407 = OpFAdd %404 %406 
					                               f32_4 %408 = OpLoad %65 
					                               f32_4 %409 = OpVectorShuffle %408 %407 4 1 5 3 
					                                              OpStore %65 %409 
					                               f32_4 %410 = OpLoad %65 
					                               f32_2 %411 = OpVectorShuffle %410 %410 0 2 
					                                 f32 %412 = OpDot %411 %53 
					                                              OpStore %168 %412 
					                                 f32 %413 = OpLoad %168 
					                                 f32 %414 = OpExtInst %1 13 %413 
					                                              OpStore %168 %414 
					                                 f32 %415 = OpLoad %168 
					                                 f32 %416 = OpFMul %415 %62 
					                                              OpStore %168 %416 
					                                 f32 %417 = OpLoad %168 
					                                 f32 %418 = OpExtInst %1 10 %417 
					                        Private f32* %419 = OpAccessChain %225 %37 
					                                              OpStore %419 %418 
					                                 f32 %420 = OpLoad %125 
					                                 f32 %421 = OpFMul %420 %261 
					                                              OpStore %168 %421 
					                               f32_2 %422 = OpLoad %9 
					                               f32_2 %423 = OpVectorShuffle %422 %422 1 0 
					                               f32_2 %424 = OpFNegate %423 
					                               f32_4 %425 = OpLoad %225 
					                               f32_2 %426 = OpVectorShuffle %425 %425 0 1 
					                               f32_2 %427 = OpFAdd %424 %426 
					                               f32_4 %428 = OpLoad %65 
					                               f32_4 %429 = OpVectorShuffle %428 %427 4 1 5 3 
					                                              OpStore %65 %429 
					                        Private f32* %431 = OpAccessChain %65 %430 
					                                 f32 %432 = OpLoad %431 
					                        Private f32* %433 = OpAccessChain %65 %37 
					                                 f32 %434 = OpLoad %433 
					                                 f32 %435 = OpFDiv %432 %434 
					                                              OpStore %258 %435 
					                                 f32 %437 = OpLoad %258 
					                                 f32 %438 = OpExtInst %1 4 %437 
					                                 f32 %439 = OpExtInst %1 37 %438 %46 
					                                              OpStore %436 %439 
					                                 f32 %440 = OpLoad %258 
					                                 f32 %441 = OpExtInst %1 4 %440 
					                                 f32 %442 = OpExtInst %1 40 %441 %46 
					                        Private f32* %443 = OpAccessChain %318 %37 
					                                              OpStore %443 %442 
					                        Private f32* %444 = OpAccessChain %318 %37 
					                                 f32 %445 = OpLoad %444 
					                                 f32 %446 = OpFDiv %46 %445 
					                        Private f32* %447 = OpAccessChain %318 %37 
					                                              OpStore %447 %446 
					                        Private f32* %448 = OpAccessChain %318 %37 
					                                 f32 %449 = OpLoad %448 
					                                 f32 %450 = OpLoad %436 
					                                 f32 %451 = OpFMul %449 %450 
					                                              OpStore %436 %451 
					                                 f32 %452 = OpLoad %436 
					                                 f32 %453 = OpLoad %436 
					                                 f32 %454 = OpFMul %452 %453 
					                        Private f32* %455 = OpAccessChain %318 %37 
					                                              OpStore %455 %454 
					                        Private f32* %457 = OpAccessChain %318 %37 
					                                 f32 %458 = OpLoad %457 
					                                 f32 %460 = OpFMul %458 %459 
					                                 f32 %462 = OpFAdd %460 %461 
					                                              OpStore %456 %462 
					                        Private f32* %463 = OpAccessChain %318 %37 
					                                 f32 %464 = OpLoad %463 
					                                 f32 %465 = OpLoad %456 
					                                 f32 %466 = OpFMul %464 %465 
					                                 f32 %468 = OpFAdd %466 %467 
					                                              OpStore %456 %468 
					                        Private f32* %469 = OpAccessChain %318 %37 
					                                 f32 %470 = OpLoad %469 
					                                 f32 %471 = OpLoad %456 
					                                 f32 %472 = OpFMul %470 %471 
					                                 f32 %474 = OpFAdd %472 %473 
					                                              OpStore %456 %474 
					                        Private f32* %475 = OpAccessChain %318 %37 
					                                 f32 %476 = OpLoad %475 
					                                 f32 %477 = OpLoad %456 
					                                 f32 %478 = OpFMul %476 %477 
					                                 f32 %480 = OpFAdd %478 %479 
					                        Private f32* %481 = OpAccessChain %318 %37 
					                                              OpStore %481 %480 
					                        Private f32* %482 = OpAccessChain %318 %37 
					                                 f32 %483 = OpLoad %482 
					                                 f32 %484 = OpLoad %436 
					                                 f32 %485 = OpFMul %483 %484 
					                                              OpStore %456 %485 
					                                 f32 %487 = OpLoad %258 
					                                 f32 %488 = OpExtInst %1 4 %487 
					                                bool %489 = OpFOrdLessThan %46 %488 
					                                              OpStore %486 %489 
					                                 f32 %490 = OpLoad %456 
					                                 f32 %491 = OpFMul %490 %389 
					                                 f32 %493 = OpFAdd %491 %492 
					                                              OpStore %456 %493 
					                                bool %494 = OpLoad %486 
					                                 f32 %495 = OpLoad %456 
					                                 f32 %496 = OpSelect %494 %495 %229 
					                                              OpStore %456 %496 
					                                 f32 %497 = OpLoad %436 
					                        Private f32* %498 = OpAccessChain %318 %37 
					                                 f32 %499 = OpLoad %498 
					                                 f32 %500 = OpFMul %497 %499 
					                                 f32 %501 = OpLoad %456 
					                                 f32 %502 = OpFAdd %500 %501 
					                                              OpStore %436 %502 
					                                 f32 %503 = OpLoad %258 
					                                 f32 %504 = OpExtInst %1 37 %503 %46 
					                                              OpStore %258 %504 
					                                 f32 %506 = OpLoad %258 
					                                 f32 %507 = OpLoad %258 
					                                 f32 %508 = OpFNegate %507 
					                                bool %509 = OpFOrdLessThan %506 %508 
					                                              OpStore %505 %509 
					                                bool %510 = OpLoad %505 
					                                              OpSelectionMerge %513 None 
					                                              OpBranchConditional %510 %512 %516 
					                                     %512 = OpLabel 
					                                 f32 %514 = OpLoad %436 
					                                 f32 %515 = OpFNegate %514 
					                                              OpStore %511 %515 
					                                              OpBranch %513 
					                                     %516 = OpLabel 
					                                 f32 %517 = OpLoad %436 
					                                              OpStore %511 %517 
					                                              OpBranch %513 
					                                     %513 = OpLabel 
					                                 f32 %518 = OpLoad %511 
					                                              OpStore %258 %518 
					                                 f32 %519 = OpLoad %168 
					                                 f32 %520 = OpLoad %168 
					                                 f32 %521 = OpFMul %519 %520 
					                                              OpStore %168 %521 
					                                 f32 %522 = OpLoad %258 
					                        Private f32* %523 = OpAccessChain %225 %37 
					                                 f32 %524 = OpLoad %523 
					                                 f32 %525 = OpFMul %522 %524 
					                                              OpStore %258 %525 
					                                 f32 %526 = OpLoad %258 
					                                 f32 %528 = OpFMul %526 %527 
					                                              OpStore %258 %528 
					                                 f32 %529 = OpLoad %258 
					                                 f32 %530 = OpExtInst %1 13 %529 
					                                              OpStore %258 %530 
					                                 f32 %531 = OpLoad %258 
					                                 f32 %533 = OpFMul %531 %532 
					                                 f32 %534 = OpFAdd %533 %46 
					                                              OpStore %258 %534 
					                                 f32 %535 = OpLoad %168 
					                                 f32 %536 = OpLoad %258 
					                                 f32 %537 = OpFMul %535 %536 
					                        Private f32* %538 = OpAccessChain %225 %37 
					                                              OpStore %538 %537 
					                               f32_4 %539 = OpLoad %65 
					                               f32_2 %540 = OpVectorShuffle %539 %539 0 2 
					                               f32_4 %541 = OpLoad %65 
					                               f32_2 %542 = OpVectorShuffle %541 %541 0 2 
					                                 f32 %543 = OpDot %540 %542 
					                        Private f32* %544 = OpAccessChain %65 %37 
					                                              OpStore %544 %543 
					                        Private f32* %545 = OpAccessChain %65 %37 
					                                 f32 %546 = OpLoad %545 
					                        Private f32* %547 = OpAccessChain %225 %37 
					                                 f32 %548 = OpLoad %547 
					                                bool %549 = OpFOrdLessThan %546 %548 
					                                              OpStore %248 %549 
					                                 f32 %550 = OpLoad %168 
					                                 f32 %551 = OpFNegate %550 
					                                 f32 %552 = OpLoad %258 
					                                 f32 %553 = OpFMul %551 %552 
					                        Private f32* %554 = OpAccessChain %65 %37 
					                                 f32 %555 = OpLoad %554 
					                                 f32 %556 = OpFAdd %553 %555 
					                                              OpStore %168 %556 
					                                 f32 %557 = OpLoad %168 
					                                 f32 %558 = OpExtInst %1 30 %557 
					                                              OpStore %168 %558 
					                                 f32 %559 = OpLoad %168 
					                                 f32 %561 = OpFMul %559 %560 
					                                              OpStore %168 %561 
					                                 f32 %562 = OpLoad %168 
					                                 f32 %563 = OpExtInst %1 29 %562 
					                                              OpStore %168 %563 
					                                bool %564 = OpLoad %248 
					                                 f32 %565 = OpLoad %168 
					                                 f32 %566 = OpSelect %564 %249 %565 
					                                              OpStore %168 %566 
					                                 f32 %567 = OpLoad %125 
					                                 f32 %568 = OpFNegate %567 
					                                 f32 %569 = OpFMul %568 %170 
					                                 f32 %570 = OpFAdd %569 %46 
					                                              OpStore %125 %570 
					                                 f32 %571 = OpLoad %125 
					                                 f32 %572 = OpFMul %571 %249 
					                                 f32 %573 = OpFAdd %572 %173 
					                                              OpStore %125 %573 
					                                 f32 %574 = OpLoad %125 
					                                 f32 %575 = OpFNegate %574 
					                                 f32 %576 = OpFAdd %575 %46 
					                        Private f32* %577 = OpAccessChain %65 %37 
					                                              OpStore %577 %576 
					                                 f32 %578 = OpLoad %168 
					                        Private f32* %579 = OpAccessChain %65 %37 
					                                 f32 %580 = OpLoad %579 
					                                 f32 %581 = OpFMul %578 %580 
					                                 f32 %582 = OpLoad %125 
					                                 f32 %583 = OpFAdd %581 %582 
					                                              OpStore %125 %583 
					                                 f32 %584 = OpLoad %125 
					                        Private f32* %585 = OpAccessChain %139 %37 
					                                 f32 %586 = OpLoad %585 
					                                 f32 %587 = OpFMul %584 %586 
					                        Private f32* %588 = OpAccessChain %139 %37 
					                                              OpStore %588 %587 
					                                              OpBranch %402 
					                                     %402 = OpLabel 
					                       Private bool* %589 = OpAccessChain %217 %47 
					                                bool %590 = OpLoad %589 
					                                              OpSelectionMerge %592 None 
					                                              OpBranchConditional %590 %591 %592 
					                                     %591 = OpLabel 
					                               f32_4 %593 = OpLoad %41 
					                               f32_4 %594 = OpVectorShuffle %593 %593 0 1 0 1 
					                               f32_4 %598 = OpFAdd %594 %597 
					                                              OpStore %65 %598 
					                               f32_4 %599 = OpLoad %65 
					                               f32_2 %600 = OpVectorShuffle %599 %599 0 1 
					                                 f32 %601 = OpDot %600 %53 
					                                              OpStore %125 %601 
					                                 f32 %602 = OpLoad %125 
					                                 f32 %603 = OpExtInst %1 13 %602 
					                                              OpStore %125 %603 
					                                 f32 %604 = OpLoad %125 
					                                 f32 %605 = OpFMul %604 %62 
					                                              OpStore %125 %605 
					                                 f32 %606 = OpLoad %125 
					                                 f32 %607 = OpExtInst %1 10 %606 
					                        Private f32* %608 = OpAccessChain %65 %37 
					                                              OpStore %608 %607 
					                               f32_4 %609 = OpLoad %65 
					                               f32_2 %610 = OpVectorShuffle %609 %609 2 3 
					                                 f32 %611 = OpDot %610 %53 
					                                              OpStore %125 %611 
					                                 f32 %612 = OpLoad %125 
					                                 f32 %613 = OpExtInst %1 13 %612 
					                                              OpStore %125 %613 
					                                 f32 %614 = OpLoad %125 
					                                 f32 %615 = OpFMul %614 %62 
					                                              OpStore %125 %615 
					                                 f32 %616 = OpLoad %125 
					                                 f32 %617 = OpExtInst %1 10 %616 
					                        Private f32* %618 = OpAccessChain %65 %47 
					                                              OpStore %618 %617 
					                               f32_4 %619 = OpLoad %41 
					                               f32_2 %620 = OpVectorShuffle %619 %619 0 1 
					                               f32_2 %623 = OpFAdd %620 %622 
					                               f32_4 %624 = OpLoad %41 
					                               f32_4 %625 = OpVectorShuffle %624 %623 4 5 2 3 
					                                              OpStore %41 %625 
					                               f32_4 %626 = OpLoad %41 
					                               f32_2 %627 = OpVectorShuffle %626 %626 0 1 
					                                 f32 %628 = OpDot %627 %53 
					                                              OpStore %125 %628 
					                                 f32 %629 = OpLoad %125 
					                                 f32 %630 = OpExtInst %1 13 %629 
					                                              OpStore %125 %630 
					                                 f32 %631 = OpLoad %125 
					                                 f32 %632 = OpFMul %631 %62 
					                                              OpStore %125 %632 
					                                 f32 %633 = OpLoad %125 
					                                 f32 %634 = OpExtInst %1 10 %633 
					                                              OpStore %125 %634 
					                                 f32 %635 = OpLoad %125 
					                                 f32 %636 = OpFMul %635 %261 
					                        Private f32* %637 = OpAccessChain %41 %37 
					                                              OpStore %637 %636 
					                               f32_2 %638 = OpLoad %9 
					                               f32_2 %639 = OpVectorShuffle %638 %638 1 0 
					                               f32_2 %640 = OpFNegate %639 
					                               f32_4 %641 = OpLoad %65 
					                               f32_2 %642 = OpVectorShuffle %641 %641 0 1 
					                               f32_2 %643 = OpFAdd %640 %642 
					                                              OpStore %9 %643 
					                        Private f32* %645 = OpAccessChain %9 %47 
					                                 f32 %646 = OpLoad %645 
					                        Private f32* %647 = OpAccessChain %9 %37 
					                                 f32 %648 = OpLoad %647 
					                                 f32 %649 = OpFDiv %646 %648 
					                                              OpStore %644 %649 
					                                 f32 %650 = OpLoad %644 
					                                 f32 %651 = OpExtInst %1 4 %650 
					                                 f32 %652 = OpExtInst %1 37 %651 %46 
					                                              OpStore %168 %652 
					                                 f32 %654 = OpLoad %644 
					                                 f32 %655 = OpExtInst %1 4 %654 
					                                 f32 %656 = OpExtInst %1 40 %655 %46 
					                                              OpStore %653 %656 
					                                 f32 %657 = OpLoad %653 
					                                 f32 %658 = OpFDiv %46 %657 
					                                              OpStore %653 %658 
					                                 f32 %659 = OpLoad %168 
					                                 f32 %660 = OpLoad %653 
					                                 f32 %661 = OpFMul %659 %660 
					                                              OpStore %168 %661 
					                                 f32 %662 = OpLoad %168 
					                                 f32 %663 = OpLoad %168 
					                                 f32 %664 = OpFMul %662 %663 
					                                              OpStore %653 %664 
					                                 f32 %666 = OpLoad %653 
					                                 f32 %667 = OpFMul %666 %459 
					                                 f32 %668 = OpFAdd %667 %461 
					                                              OpStore %665 %668 
					                                 f32 %669 = OpLoad %653 
					                                 f32 %670 = OpLoad %665 
					                                 f32 %671 = OpFMul %669 %670 
					                                 f32 %672 = OpFAdd %671 %467 
					                                              OpStore %665 %672 
					                                 f32 %673 = OpLoad %653 
					                                 f32 %674 = OpLoad %665 
					                                 f32 %675 = OpFMul %673 %674 
					                                 f32 %676 = OpFAdd %675 %473 
					                                              OpStore %665 %676 
					                                 f32 %677 = OpLoad %653 
					                                 f32 %678 = OpLoad %665 
					                                 f32 %679 = OpFMul %677 %678 
					                                 f32 %680 = OpFAdd %679 %479 
					                                              OpStore %653 %680 
					                                 f32 %681 = OpLoad %168 
					                                 f32 %682 = OpLoad %653 
					                                 f32 %683 = OpFMul %681 %682 
					                                              OpStore %665 %683 
					                                 f32 %684 = OpLoad %644 
					                                 f32 %685 = OpExtInst %1 4 %684 
					                                bool %686 = OpFOrdLessThan %46 %685 
					                                              OpStore %505 %686 
					                                 f32 %687 = OpLoad %665 
					                                 f32 %688 = OpFMul %687 %389 
					                                 f32 %689 = OpFAdd %688 %492 
					                                              OpStore %665 %689 
					                                bool %690 = OpLoad %505 
					                                 f32 %691 = OpLoad %665 
					                                 f32 %692 = OpSelect %690 %691 %229 
					                                              OpStore %665 %692 
					                                 f32 %693 = OpLoad %168 
					                                 f32 %694 = OpLoad %653 
					                                 f32 %695 = OpFMul %693 %694 
					                                 f32 %696 = OpLoad %665 
					                                 f32 %697 = OpFAdd %695 %696 
					                                              OpStore %168 %697 
					                                 f32 %698 = OpLoad %644 
					                                 f32 %699 = OpExtInst %1 37 %698 %46 
					                                              OpStore %644 %699 
					                                 f32 %701 = OpLoad %644 
					                                 f32 %702 = OpLoad %644 
					                                 f32 %703 = OpFNegate %702 
					                                bool %704 = OpFOrdLessThan %701 %703 
					                                              OpStore %700 %704 
					                                bool %705 = OpLoad %700 
					                                              OpSelectionMerge %708 None 
					                                              OpBranchConditional %705 %707 %711 
					                                     %707 = OpLabel 
					                                 f32 %709 = OpLoad %168 
					                                 f32 %710 = OpFNegate %709 
					                                              OpStore %706 %710 
					                                              OpBranch %708 
					                                     %711 = OpLabel 
					                                 f32 %712 = OpLoad %168 
					                                              OpStore %706 %712 
					                                              OpBranch %708 
					                                     %708 = OpLabel 
					                                 f32 %713 = OpLoad %706 
					                                              OpStore %644 %713 
					                        Private f32* %714 = OpAccessChain %41 %37 
					                                 f32 %715 = OpLoad %714 
					                        Private f32* %716 = OpAccessChain %41 %37 
					                                 f32 %717 = OpLoad %716 
					                                 f32 %718 = OpFMul %715 %717 
					                        Private f32* %719 = OpAccessChain %41 %37 
					                                              OpStore %719 %718 
					                                 f32 %720 = OpLoad %644 
					                        Private f32* %721 = OpAccessChain %65 %37 
					                                 f32 %722 = OpLoad %721 
					                                 f32 %723 = OpFMul %720 %722 
					                                              OpStore %644 %723 
					                                 f32 %724 = OpLoad %644 
					                                 f32 %725 = OpFMul %724 %527 
					                                              OpStore %644 %725 
					                                 f32 %726 = OpLoad %644 
					                                 f32 %727 = OpExtInst %1 13 %726 
					                                              OpStore %644 %727 
					                                 f32 %728 = OpLoad %644 
					                                 f32 %729 = OpFMul %728 %532 
					                                 f32 %730 = OpFAdd %729 %46 
					                                              OpStore %644 %730 
					                                 f32 %731 = OpLoad %644 
					                        Private f32* %732 = OpAccessChain %41 %37 
					                                 f32 %733 = OpLoad %732 
					                                 f32 %734 = OpFMul %731 %733 
					                                              OpStore %168 %734 
					                               f32_2 %735 = OpLoad %9 
					                               f32_2 %736 = OpLoad %9 
					                                 f32 %737 = OpDot %735 %736 
					                        Private f32* %738 = OpAccessChain %9 %37 
					                                              OpStore %738 %737 
					                        Private f32* %740 = OpAccessChain %9 %37 
					                                 f32 %741 = OpLoad %740 
					                                 f32 %742 = OpLoad %168 
					                                bool %743 = OpFOrdLessThan %741 %742 
					                                              OpStore %739 %743 
					                        Private f32* %744 = OpAccessChain %41 %37 
					                                 f32 %745 = OpLoad %744 
					                                 f32 %746 = OpFNegate %745 
					                                 f32 %747 = OpLoad %644 
					                                 f32 %748 = OpFMul %746 %747 
					                        Private f32* %749 = OpAccessChain %9 %37 
					                                 f32 %750 = OpLoad %749 
					                                 f32 %751 = OpFAdd %748 %750 
					                        Private f32* %752 = OpAccessChain %9 %37 
					                                              OpStore %752 %751 
					                        Private f32* %753 = OpAccessChain %9 %37 
					                                 f32 %754 = OpLoad %753 
					                                 f32 %755 = OpExtInst %1 30 %754 
					                        Private f32* %756 = OpAccessChain %9 %37 
					                                              OpStore %756 %755 
					                        Private f32* %757 = OpAccessChain %9 %37 
					                                 f32 %758 = OpLoad %757 
					                                 f32 %759 = OpFMul %758 %560 
					                        Private f32* %760 = OpAccessChain %9 %37 
					                                              OpStore %760 %759 
					                        Private f32* %761 = OpAccessChain %9 %37 
					                                 f32 %762 = OpLoad %761 
					                                 f32 %763 = OpExtInst %1 29 %762 
					                        Private f32* %764 = OpAccessChain %9 %37 
					                                              OpStore %764 %763 
					                                bool %765 = OpLoad %739 
					                                              OpSelectionMerge %768 None 
					                                              OpBranchConditional %765 %767 %769 
					                                     %767 = OpLabel 
					                                              OpStore %766 %249 
					                                              OpBranch %768 
					                                     %769 = OpLabel 
					                        Private f32* %770 = OpAccessChain %9 %37 
					                                 f32 %771 = OpLoad %770 
					                                              OpStore %766 %771 
					                                              OpBranch %768 
					                                     %768 = OpLabel 
					                                 f32 %772 = OpLoad %766 
					                        Private f32* %773 = OpAccessChain %9 %37 
					                                              OpStore %773 %772 
					                                 f32 %775 = OpLoad %125 
					                                 f32 %776 = OpFNegate %775 
					                                 f32 %777 = OpFMul %776 %170 
					                                 f32 %778 = OpFAdd %777 %46 
					                                              OpStore %774 %778 
					                                 f32 %779 = OpLoad %774 
					                                 f32 %780 = OpFMul %779 %249 
					                                 f32 %781 = OpFAdd %780 %173 
					                                              OpStore %774 %781 
					                                 f32 %782 = OpLoad %774 
					                                 f32 %783 = OpFNegate %782 
					                                 f32 %784 = OpFAdd %783 %46 
					                                              OpStore %125 %784 
					                        Private f32* %785 = OpAccessChain %9 %37 
					                                 f32 %786 = OpLoad %785 
					                                 f32 %787 = OpLoad %125 
					                                 f32 %788 = OpFMul %786 %787 
					                                 f32 %789 = OpLoad %774 
					                                 f32 %790 = OpFAdd %788 %789 
					                        Private f32* %791 = OpAccessChain %9 %37 
					                                              OpStore %791 %790 
					                        Private f32* %792 = OpAccessChain %9 %37 
					                                 f32 %793 = OpLoad %792 
					                        Private f32* %794 = OpAccessChain %139 %37 
					                                 f32 %795 = OpLoad %794 
					                                 f32 %796 = OpFMul %793 %795 
					                        Private f32* %797 = OpAccessChain %139 %37 
					                                              OpStore %797 %796 
					                                              OpBranch %592 
					                                     %592 = OpLabel 
					                               f32_2 %800 = OpLoad %29 
					                               f32_3 %801 = OpVectorShuffle %800 %800 0 0 0 
					                               f32_2 %802 = OpLoad %139 
					                               f32_3 %803 = OpVectorShuffle %802 %802 0 0 0 
					                               f32_3 %804 = OpFMul %801 %803 
					                               f32_4 %805 = OpLoad %799 
					                               f32_4 %806 = OpVectorShuffle %805 %804 4 5 6 3 
					                                              OpStore %799 %806 
					                         Output f32* %809 = OpAccessChain %799 %807 
					                                              OpStore %809 %46 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					bool u_xlatb4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					float u_xlat8;
					vec2 u_xlat10;
					vec2 u_xlat11;
					float u_xlat12;
					bool u_xlatb12;
					vec2 u_xlat13;
					float u_xlat15;
					float u_xlat16;
					int u_xlati16;
					float u_xlat17;
					bool u_xlatb17;
					float u_xlat18;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat10.x = _TimeX * 15.0;
					    u_xlat1.x = trunc(u_xlat10.x);
					    u_xlat1.y = 1.0;
					    u_xlat10.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat10.x = sin(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * 43758.5469;
					    u_xlat2.x = fract(u_xlat10.x);
					    u_xlat1.zw = u_xlat1.xx + vec2(23.0, 8.0);
					    u_xlat10.x = dot(u_xlat1.zy, vec2(12.9898005, 78.2330017));
					    u_xlat10.x = sin(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * 43758.5469;
					    u_xlat2.y = fract(u_xlat10.x);
					    u_xlat10.xy = u_xlat2.xy * vec2(0.00200000009, 0.00200000009) + u_xlat0.yx;
					    u_xlat10_2 = texture(_MainTex, u_xlat10.xy);
					    u_xlat10.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_2.xyz);
					    u_xlat15 = dot(u_xlat1.wy, vec2(12.9898005, 78.2330017));
					    u_xlat10.y = sin(u_xlat15);
					    u_xlat10.xy = u_xlat10.xy * vec2(0.699999988, 43758.5469);
					    u_xlat15 = fract(u_xlat10.y);
					    u_xlat11.xy = (-u_xlat0.yx) + vec2(1.0, 1.0);
					    u_xlat11.x = u_xlat0.y * u_xlat11.x;
					    u_xlat11.x = u_xlat0.x * u_xlat11.x;
					    u_xlat11.x = u_xlat11.y * u_xlat11.x;
					    u_xlat11.x = u_xlat11.x * 16.0;
					    u_xlat16 = u_xlat15 + 0.5;
					    u_xlat16 = u_xlat16 * 0.300000012 + 0.699999988;
					    u_xlat2.xy = vec2(u_xlat15) * vec2(0.400000006, 8.0);
					    u_xlat16 = u_xlat11.x * u_xlat16 + u_xlat2.x;
					    u_xlat16 = u_xlat16 + 1.0;
					    u_xlat11.x = log2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * 0.400000006;
					    u_xlat11.x = exp2(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * u_xlat16;
					    u_xlati16 = int(u_xlat2.y);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    u_xlat3 = u_xlat1.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat16 = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat3.y = fract(u_xlat16);
					    u_xlat16 = u_xlat3.y + -0.5;
					    u_xlatb12 = 0.200000003<u_xlat3.y;
					    u_xlat4.xy = u_xlat0.xy * u_xlat3.yy;
					    u_xlat17 = u_xlat4.x * 0.00999999978 + u_xlat4.y;
					    u_xlat16 = u_xlat16 + u_xlat17;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat17 = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb12) ? u_xlat16 : u_xlat17;
					    u_xlat16 = u_xlat16 * 0.5 + 0.5;
					    u_xlat16 = u_xlat16 * u_xlat11.x;
					    u_xlat11.x = (u_xlatb2.x) ? u_xlat16 : u_xlat11.x;
					    u_xlat16 = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat2.x = u_xlat16 + -0.5;
					    u_xlatb12 = 0.200000003<u_xlat16;
					    u_xlat13.xy = u_xlat0.xy * vec2(u_xlat16);
					    u_xlat16 = u_xlat13.x * 0.00999999978 + u_xlat13.y;
					    u_xlat16 = u_xlat2.x + u_xlat16;
					    u_xlat16 = log2(abs(u_xlat16));
					    u_xlat16 = u_xlat16 * 0.125;
					    u_xlat16 = exp2(u_xlat16);
					    u_xlat2.x = (-u_xlat16) + 2.0;
					    u_xlat16 = (u_xlatb12) ? u_xlat16 : u_xlat2.x;
					    u_xlat16 = u_xlat16 * 0.5 + 0.5;
					    u_xlat16 = u_xlat16 * u_xlat11.x;
					    u_xlat11.x = (u_xlatb2.y) ? u_xlat16 : u_xlat11.x;
					    u_xlat2.xy = u_xlat1.xy + vec2(18.0, 0.0);
					    u_xlat16 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat16 = sin(u_xlat16);
					    u_xlat16 = u_xlat16 * 43758.5469;
					    u_xlat16 = fract(u_xlat16);
					    u_xlat16 = u_xlat16 * 8.0 + -2.0;
					    u_xlat16 = max(u_xlat16, 0.0);
					    u_xlati16 = int(u_xlat16);
					    u_xlatb2.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati16)).xy;
					    if(u_xlatb2.x){
					        u_xlat2.xz = u_xlat1.xy + vec2(6.0, 0.0);
					        u_xlat16 = dot(u_xlat2.xz, vec2(12.9898005, 78.2330017));
					        u_xlat16 = sin(u_xlat16);
					        u_xlat16 = u_xlat16 * 43758.5469;
					        u_xlat3.x = fract(u_xlat16);
					        u_xlat16 = u_xlat15 * 0.00999999978;
					        u_xlat2.xz = (-u_xlat0.yx) + u_xlat3.xy;
					        u_xlat17 = u_xlat2.z / u_xlat2.x;
					        u_xlat8 = min(abs(u_xlat17), 1.0);
					        u_xlat13.x = max(abs(u_xlat17), 1.0);
					        u_xlat13.x = float(1.0) / u_xlat13.x;
					        u_xlat8 = u_xlat13.x * u_xlat8;
					        u_xlat13.x = u_xlat8 * u_xlat8;
					        u_xlat18 = u_xlat13.x * 0.0208350997 + -0.0851330012;
					        u_xlat18 = u_xlat13.x * u_xlat18 + 0.180141002;
					        u_xlat18 = u_xlat13.x * u_xlat18 + -0.330299497;
					        u_xlat13.x = u_xlat13.x * u_xlat18 + 0.999866009;
					        u_xlat18 = u_xlat13.x * u_xlat8;
					        u_xlatb4 = 1.0<abs(u_xlat17);
					        u_xlat18 = u_xlat18 * -2.0 + 1.57079637;
					        u_xlat18 = u_xlatb4 ? u_xlat18 : float(0.0);
					        u_xlat8 = u_xlat8 * u_xlat13.x + u_xlat18;
					        u_xlat17 = min(u_xlat17, 1.0);
					        u_xlatb17 = u_xlat17<(-u_xlat17);
					        u_xlat17 = (u_xlatb17) ? (-u_xlat8) : u_xlat8;
					        u_xlat16 = u_xlat16 * u_xlat16;
					        u_xlat17 = u_xlat17 * u_xlat3.x;
					        u_xlat17 = u_xlat17 * 6.28310013;
					        u_xlat17 = sin(u_xlat17);
					        u_xlat17 = u_xlat17 * 0.100000001 + 1.0;
					        u_xlat3.x = u_xlat16 * u_xlat17;
					        u_xlat2.x = dot(u_xlat2.xz, u_xlat2.xz);
					        u_xlatb12 = u_xlat2.x<u_xlat3.x;
					        u_xlat16 = (-u_xlat16) * u_xlat17 + u_xlat2.x;
					        u_xlat16 = log2(u_xlat16);
					        u_xlat16 = u_xlat16 * 0.0625;
					        u_xlat16 = exp2(u_xlat16);
					        u_xlat16 = (u_xlatb12) ? 0.200000003 : u_xlat16;
					        u_xlat15 = (-u_xlat15) * 0.5 + 1.0;
					        u_xlat15 = u_xlat15 * 0.200000003 + 0.300000012;
					        u_xlat2.x = (-u_xlat15) + 1.0;
					        u_xlat15 = u_xlat16 * u_xlat2.x + u_xlat15;
					        u_xlat11.x = u_xlat15 * u_xlat11.x;
					    //ENDIF
					    }
					    if(u_xlatb2.y){
					        u_xlat2 = u_xlat1.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat15 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					        u_xlat15 = sin(u_xlat15);
					        u_xlat15 = u_xlat15 * 43758.5469;
					        u_xlat2.x = fract(u_xlat15);
					        u_xlat15 = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					        u_xlat15 = sin(u_xlat15);
					        u_xlat15 = u_xlat15 * 43758.5469;
					        u_xlat2.y = fract(u_xlat15);
					        u_xlat1.xy = u_xlat1.xy + vec2(27.0, 0.0);
					        u_xlat15 = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					        u_xlat15 = sin(u_xlat15);
					        u_xlat15 = u_xlat15 * 43758.5469;
					        u_xlat15 = fract(u_xlat15);
					        u_xlat1.x = u_xlat15 * 0.00999999978;
					        u_xlat0.xy = (-u_xlat0.yx) + u_xlat2.xy;
					        u_xlat6 = u_xlat0.y / u_xlat0.x;
					        u_xlat16 = min(abs(u_xlat6), 1.0);
					        u_xlat7 = max(abs(u_xlat6), 1.0);
					        u_xlat7 = float(1.0) / u_xlat7;
					        u_xlat16 = u_xlat16 * u_xlat7;
					        u_xlat7 = u_xlat16 * u_xlat16;
					        u_xlat12 = u_xlat7 * 0.0208350997 + -0.0851330012;
					        u_xlat12 = u_xlat7 * u_xlat12 + 0.180141002;
					        u_xlat12 = u_xlat7 * u_xlat12 + -0.330299497;
					        u_xlat7 = u_xlat7 * u_xlat12 + 0.999866009;
					        u_xlat12 = u_xlat16 * u_xlat7;
					        u_xlatb17 = 1.0<abs(u_xlat6);
					        u_xlat12 = u_xlat12 * -2.0 + 1.57079637;
					        u_xlat12 = u_xlatb17 ? u_xlat12 : float(0.0);
					        u_xlat16 = u_xlat16 * u_xlat7 + u_xlat12;
					        u_xlat6 = min(u_xlat6, 1.0);
					        u_xlatb6 = u_xlat6<(-u_xlat6);
					        u_xlat6 = (u_xlatb6) ? (-u_xlat16) : u_xlat16;
					        u_xlat1.x = u_xlat1.x * u_xlat1.x;
					        u_xlat6 = u_xlat6 * u_xlat2.x;
					        u_xlat6 = u_xlat6 * 6.28310013;
					        u_xlat6 = sin(u_xlat6);
					        u_xlat6 = u_xlat6 * 0.100000001 + 1.0;
					        u_xlat16 = u_xlat6 * u_xlat1.x;
					        u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					        u_xlatb5 = u_xlat0.x<u_xlat16;
					        u_xlat0.x = (-u_xlat1.x) * u_xlat6 + u_xlat0.x;
					        u_xlat0.x = log2(u_xlat0.x);
					        u_xlat0.x = u_xlat0.x * 0.0625;
					        u_xlat0.x = exp2(u_xlat0.x);
					        u_xlat0.x = (u_xlatb5) ? 0.200000003 : u_xlat0.x;
					        u_xlat5 = (-u_xlat15) * 0.5 + 1.0;
					        u_xlat5 = u_xlat5 * 0.200000003 + 0.300000012;
					        u_xlat15 = (-u_xlat5) + 1.0;
					        u_xlat0.x = u_xlat0.x * u_xlat15 + u_xlat5;
					        u_xlat11.x = u_xlat0.x * u_xlat11.x;
					    //ENDIF
					    }
					    SV_Target0.xyz = u_xlat10.xxx * u_xlat11.xxx;
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