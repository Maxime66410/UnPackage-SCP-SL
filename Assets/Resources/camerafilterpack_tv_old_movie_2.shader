Shader "CameraFilterPack/TV_Old_Movie_2" {
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
			GpuProgramID 30011
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Fade;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					bool u_xlatb4;
					vec2 u_xlat5;
					vec2 u_xlat7;
					vec2 u_xlat9;
					vec2 u_xlat10;
					vec2 u_xlat12;
					vec2 u_xlat13;
					int u_xlati13;
					bvec2 u_xlatb13;
					vec2 u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat18;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					bool u_xlatb21;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.x = _Value * _TimeX;
					    u_xlat1.x = trunc(u_xlat12.x);
					    u_xlat1.y = 1.0;
					    u_xlat12.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12.x = sin(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * 43758.5469;
					    u_xlat2.x = fract(u_xlat12.x);
					    u_xlat1.zw = u_xlat1.xx + vec2(23.0, 8.0);
					    u_xlat12.x = dot(u_xlat1.zy, vec2(12.9898005, 78.2330017));
					    u_xlat12.x = sin(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * 43758.5469;
					    u_xlat2.y = fract(u_xlat12.x);
					    u_xlat12.xy = u_xlat2.xy * vec2(0.00200000009, 0.00200000009) + u_xlat0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat12.xy);
					    u_xlat2.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_2.xyz);
					    u_xlat2.y = _Value2;
					    u_xlat3.xyz = vec3(_Value3, _Value3, _Value2) * vec3(1.0, 0.5, 1.0) + vec3(0.699999988, 0.699999988, 0.0);
					    u_xlat3.xyz = u_xlat2.xxy * u_xlat3.xyz;
					    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat2.zw = vec2(vec2(_Value3, _Value3)) * vec2(1.0, 0.125) + vec2(0.699999988, 0.699999988);
					    u_xlat2.xyz = u_xlat2.zwx * u_xlat3.xyz;
					    u_xlat3.x = _Value2;
					    u_xlat3.z = 0.48999998;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxz;
					    u_xlat12.x = dot(u_xlat1.wy, vec2(12.9898005, 78.2330017));
					    u_xlat12.x = sin(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * 43758.5469;
					    u_xlat12.x = fract(u_xlat12.x);
					    u_xlat13.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat18 = u_xlat0.x * u_xlat13.x;
					    u_xlat18 = u_xlat0.y * u_xlat18;
					    u_xlat18 = u_xlat13.y * u_xlat18;
					    u_xlat18 = u_xlat18 * 16.0;
					    u_xlat13.x = u_xlat12.x + 0.5;
					    u_xlat13.x = u_xlat13.x * 0.300000012 + 0.699999988;
					    u_xlat3.xy = u_xlat12.xx * vec2(0.400000006, 8.0);
					    u_xlat13.x = u_xlat18 * u_xlat13.x + u_xlat3.x;
					    u_xlat13.x = u_xlat13.x + 1.0;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 0.400000006;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = u_xlat18 * u_xlat13.x;
					    u_xlati13 = int(u_xlat3.y);
					    u_xlatb13.xy = lessThan(ivec4(0, 1, 0, 1), ivec4(u_xlati13)).xy;
					    u_xlat3 = u_xlat1.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat20 = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat20 = sin(u_xlat20);
					    u_xlat20 = u_xlat20 * 43758.5469;
					    u_xlat3.y = fract(u_xlat20);
					    u_xlat20 = u_xlat3.y + -0.5;
					    u_xlatb4 = 0.200000003<u_xlat3.y;
					    u_xlat10.xy = u_xlat0.yx * u_xlat3.yy;
					    u_xlat10.x = u_xlat10.x * 0.00999999978 + u_xlat10.y;
					    u_xlat20 = u_xlat20 + u_xlat10.x;
					    u_xlat20 = log2(abs(u_xlat20));
					    u_xlat20 = u_xlat20 * 0.125;
					    u_xlat20 = exp2(u_xlat20);
					    u_xlat10.x = (-u_xlat20) + 2.0;
					    u_xlat20 = (u_xlatb4) ? u_xlat20 : u_xlat10.x;
					    u_xlat4.xy = (-vec2(_Value4, _Fade)) + vec2(0.5, 1.0);
					    u_xlat16 = (-u_xlat4.x) + 1.0;
					    u_xlat20 = u_xlat20 * u_xlat16 + u_xlat4.x;
					    u_xlat20 = u_xlat18 * u_xlat20;
					    u_xlat18 = (u_xlatb13.x) ? u_xlat20 : u_xlat18;
					    u_xlat13.x = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat13.x = sin(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x * 43758.5469;
					    u_xlat13.x = fract(u_xlat13.x);
					    u_xlat20 = u_xlat13.x + -0.5;
					    u_xlatb15 = 0.200000003<u_xlat13.x;
					    u_xlat5.xy = u_xlat0.yx * u_xlat13.xx;
					    u_xlat13.x = u_xlat5.x * 0.00999999978 + u_xlat5.y;
					    u_xlat13.x = u_xlat20 + u_xlat13.x;
					    u_xlat13.x = log2(abs(u_xlat13.x));
					    u_xlat13.x = u_xlat13.x * 0.125;
					    u_xlat13.x = exp2(u_xlat13.x);
					    u_xlat20 = (-u_xlat13.x) + 2.0;
					    u_xlat13.x = (u_xlatb15) ? u_xlat13.x : u_xlat20;
					    u_xlat13.x = u_xlat13.x * u_xlat16 + u_xlat4.x;
					    u_xlat13.x = u_xlat18 * u_xlat13.x;
					    u_xlat18 = (u_xlatb13.y) ? u_xlat13.x : u_xlat18;
					    u_xlat13.xy = u_xlat1.xy + vec2(18.0, 0.0);
					    u_xlat13.x = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13.x = sin(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x * 43758.5469;
					    u_xlat13.x = fract(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x * 8.0 + -2.0;
					    u_xlat13.x = max(u_xlat13.x, 0.0);
					    u_xlati13 = int(u_xlat13.x);
					    u_xlatb13.xy = lessThan(ivec4(0, 1, 0, 1), ivec4(u_xlati13)).xy;
					    if(u_xlatb13.x){
					        u_xlat15.xy = u_xlat1.xy + vec2(6.0, 0.0);
					        u_xlat13.x = dot(u_xlat15.xy, vec2(12.9898005, 78.2330017));
					        u_xlat13.x = sin(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * 43758.5469;
					        u_xlat3.x = fract(u_xlat13.x);
					        u_xlat13.x = u_xlat12.x * 0.00999999978;
					        u_xlat9.xy = (-u_xlat0.xy) + u_xlat3.xy;
					        u_xlat20 = u_xlat9.y / u_xlat9.x;
					        u_xlat21 = min(abs(u_xlat20), 1.0);
					        u_xlat4.x = max(abs(u_xlat20), 1.0);
					        u_xlat4.x = float(1.0) / u_xlat4.x;
					        u_xlat21 = u_xlat21 * u_xlat4.x;
					        u_xlat4.x = u_xlat21 * u_xlat21;
					        u_xlat16 = u_xlat4.x * 0.0208350997 + -0.0851330012;
					        u_xlat16 = u_xlat4.x * u_xlat16 + 0.180141002;
					        u_xlat16 = u_xlat4.x * u_xlat16 + -0.330299497;
					        u_xlat4.x = u_xlat4.x * u_xlat16 + 0.999866009;
					        u_xlat16 = u_xlat21 * u_xlat4.x;
					        u_xlatb22 = 1.0<abs(u_xlat20);
					        u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
					        u_xlat16 = u_xlatb22 ? u_xlat16 : float(0.0);
					        u_xlat21 = u_xlat21 * u_xlat4.x + u_xlat16;
					        u_xlat20 = min(u_xlat20, 1.0);
					        u_xlatb20 = u_xlat20<(-u_xlat20);
					        u_xlat20 = (u_xlatb20) ? (-u_xlat21) : u_xlat21;
					        u_xlat13.x = u_xlat13.x * u_xlat13.x;
					        u_xlat20 = u_xlat20 * u_xlat3.x;
					        u_xlat20 = u_xlat20 * 6.28310013;
					        u_xlat20 = sin(u_xlat20);
					        u_xlat20 = u_xlat20 * 0.100000001 + 1.0;
					        u_xlat3.x = u_xlat13.x * u_xlat20;
					        u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
					        u_xlatb3 = u_xlat9.x<u_xlat3.x;
					        u_xlat13.x = (-u_xlat13.x) * u_xlat20 + u_xlat9.x;
					        u_xlat13.x = log2(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * 0.0625;
					        u_xlat13.x = exp2(u_xlat13.x);
					        u_xlat13.x = (u_xlatb3) ? 0.200000003 : u_xlat13.x;
					        u_xlat12.x = (-u_xlat12.x) * 0.5 + 1.0;
					        u_xlat12.x = u_xlat12.x * 0.200000003 + (-_Value4);
					        u_xlat12.x = u_xlat12.x + 0.300000012;
					        u_xlat20 = (-u_xlat12.x) + 1.0;
					        u_xlat12.x = u_xlat13.x * u_xlat20 + u_xlat12.x;
					        u_xlat18 = u_xlat12.x * u_xlat18;
					    }
					    if(u_xlatb13.y){
					        u_xlat3 = u_xlat1.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat12.x = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					        u_xlat12.x = sin(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 43758.5469;
					        u_xlat3.x = fract(u_xlat12.x);
					        u_xlat12.x = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					        u_xlat12.x = sin(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 43758.5469;
					        u_xlat3.y = fract(u_xlat12.x);
					        u_xlat1.xy = u_xlat1.xy + vec2(27.0, 0.0);
					        u_xlat12.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					        u_xlat12.x = sin(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 43758.5469;
					        u_xlat12.x = fract(u_xlat12.x);
					        u_xlat1.x = u_xlat12.x * 0.00999999978;
					        u_xlat7.xy = (-u_xlat0.xy) + u_xlat3.xy;
					        u_xlat19 = u_xlat7.y / u_xlat7.x;
					        u_xlat20 = min(abs(u_xlat19), 1.0);
					        u_xlat9.x = max(abs(u_xlat19), 1.0);
					        u_xlat9.x = float(1.0) / u_xlat9.x;
					        u_xlat20 = u_xlat20 * u_xlat9.x;
					        u_xlat9.x = u_xlat20 * u_xlat20;
					        u_xlat15.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
					        u_xlat15.x = u_xlat9.x * u_xlat15.x + 0.180141002;
					        u_xlat15.x = u_xlat9.x * u_xlat15.x + -0.330299497;
					        u_xlat9.x = u_xlat9.x * u_xlat15.x + 0.999866009;
					        u_xlat15.x = u_xlat20 * u_xlat9.x;
					        u_xlatb21 = 1.0<abs(u_xlat19);
					        u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
					        u_xlat15.x = u_xlatb21 ? u_xlat15.x : float(0.0);
					        u_xlat20 = u_xlat20 * u_xlat9.x + u_xlat15.x;
					        u_xlat19 = min(u_xlat19, 1.0);
					        u_xlatb19 = u_xlat19<(-u_xlat19);
					        u_xlat19 = (u_xlatb19) ? (-u_xlat20) : u_xlat20;
					        u_xlat1.x = u_xlat1.x * u_xlat1.x;
					        u_xlat19 = u_xlat19 * u_xlat3.x;
					        u_xlat19 = u_xlat19 * 6.28310013;
					        u_xlat19 = sin(u_xlat19);
					        u_xlat19 = u_xlat19 * 0.100000001 + 1.0;
					        u_xlat20 = u_xlat19 * u_xlat1.x;
					        u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
					        u_xlatb13.x = u_xlat7.x<u_xlat20;
					        u_xlat1.x = (-u_xlat1.x) * u_xlat19 + u_xlat7.x;
					        u_xlat1.x = log2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * 0.0625;
					        u_xlat1.x = exp2(u_xlat1.x);
					        u_xlat1.x = (u_xlatb13.x) ? 0.200000003 : u_xlat1.x;
					        u_xlat12.x = (-u_xlat12.x) * 0.5 + 1.0;
					        u_xlat12.x = u_xlat12.x * 0.200000003 + (-_Value4);
					        u_xlat12.x = u_xlat12.x + 0.300000012;
					        u_xlat7.x = (-u_xlat12.x) + 1.0;
					        u_xlat12.x = u_xlat1.x * u_xlat7.x + u_xlat12.x;
					        u_xlat18 = u_xlat12.x * u_xlat18;
					    }
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.w = 1.0;
					    u_xlat0 = u_xlat10_0 + (-u_xlat1);
					    SV_Target0 = u_xlat4.yyyy * u_xlat0 + u_xlat1;
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
					; Bound: 1045
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %1037 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %14 0 Offset 14 
					                                                      OpMemberDecorate %14 1 Offset 14 
					                                                      OpMemberDecorate %14 2 Offset 14 
					                                                      OpMemberDecorate %14 3 Offset 14 
					                                                      OpMemberDecorate %14 4 Offset 14 
					                                                      OpMemberDecorate %14 5 Offset 14 
					                                                      OpMemberDecorate %14 6 RelaxedPrecision 
					                                                      OpMemberDecorate %14 6 Offset 14 
					                                                      OpDecorate %14 Block 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %110 DescriptorSet 110 
					                                                      OpDecorate %110 Binding 110 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %114 DescriptorSet 114 
					                                                      OpDecorate %114 Binding 114 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %1023 RelaxedPrecision 
					                                                      OpDecorate %1024 RelaxedPrecision 
					                                                      OpDecorate %1025 RelaxedPrecision 
					                                                      OpDecorate %1032 RelaxedPrecision 
					                                                      OpDecorate %1037 Location 1037 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %6 %7 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 6 
					                                              %19 = OpTypePointer Uniform %7 
					                                              %30 = OpTypePointer Private %10 
					                               Private f32_2* %31 = OpVariable Private 
					                                          i32 %32 = OpConstant 1 
					                                              %33 = OpTypePointer Uniform %6 
					                                          i32 %36 = OpConstant 0 
					                                              %40 = OpTypeInt 32 0 
					                                          u32 %41 = OpConstant 0 
					                                              %42 = OpTypePointer Private %6 
					                               Private f32_4* %44 = OpVariable Private 
					                                          f32 %49 = OpConstant 3,674022E-40 
					                                          u32 %50 = OpConstant 1 
					                                          f32 %54 = OpConstant 3,674022E-40 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                        f32_2 %56 = OpConstantComposite %54 %55 
					                                          f32 %65 = OpConstant 3,674022E-40 
					                               Private f32_4* %68 = OpVariable Private 
					                                          f32 %75 = OpConstant 3,674022E-40 
					                                          f32 %76 = OpConstant 3,674022E-40 
					                                        f32_2 %77 = OpConstantComposite %75 %76 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                       f32_2 %100 = OpConstantComposite %99 %99 
					                                             %105 = OpTypeVector %6 3 
					                                             %106 = OpTypePointer Private %105 
					                              Private f32_3* %107 = OpVariable Private 
					                                             %108 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %109 = OpTypePointer UniformConstant %108 
					        UniformConstant read_only Texture2D* %110 = OpVariable UniformConstant 
					                                             %112 = OpTypeSampler 
					                                             %113 = OpTypePointer UniformConstant %112 
					                    UniformConstant sampler* %114 = OpVariable UniformConstant 
					                                             %116 = OpTypeSampledImage %108 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                         f32 %123 = OpConstant 3,674022E-40 
					                                       f32_3 %124 = OpConstantComposite %121 %122 %123 
					                                         i32 %128 = OpConstant 2 
					                              Private f32_4* %132 = OpVariable Private 
					                                         i32 %133 = OpConstant 3 
					                                         f32 %141 = OpConstant 3,674022E-40 
					                                       f32_3 %142 = OpConstantComposite %49 %141 %49 
					                                         f32 %144 = OpConstant 3,674022E-40 
					                                         f32 %145 = OpConstant 3,674022E-40 
					                                       f32_3 %146 = OpConstantComposite %144 %144 %145 
					                                         f32 %178 = OpConstant 3,674022E-40 
					                                       f32_2 %179 = OpConstantComposite %49 %178 
					                                       f32_2 %181 = OpConstantComposite %144 %144 
					                                         f32 %195 = OpConstant 3,674022E-40 
					                                         u32 %196 = OpConstant 2 
					                              Private f32_2* %221 = OpVariable Private 
					                                       f32_2 %225 = OpConstantComposite %49 %49 
					                                Private f32* %227 = OpVariable Private 
					                                         f32 %242 = OpConstant 3,674022E-40 
					                                         f32 %250 = OpConstant 3,674022E-40 
					                                         f32 %256 = OpConstant 3,674022E-40 
					                                       f32_2 %257 = OpConstantComposite %256 %76 
					                                             %283 = OpTypePointer Private %17 
					                                Private i32* %284 = OpVariable Private 
					                                             %288 = OpTypeBool 
					                                             %289 = OpTypeVector %288 2 
					                                             %290 = OpTypePointer Private %289 
					                             Private bool_2* %291 = OpVariable Private 
					                                             %292 = OpTypeVector %17 4 
					                                       i32_4 %293 = OpConstantComposite %36 %32 %36 %32 
					                                             %296 = OpTypeVector %288 4 
					                                         f32 %301 = OpConstant 3,674022E-40 
					                                         f32 %302 = OpConstant 3,674022E-40 
					                                       f32_4 %303 = OpConstantComposite %301 %145 %302 %145 
					                                Private f32* %305 = OpVariable Private 
					                                         f32 %318 = OpConstant 3,674022E-40 
					                                             %320 = OpTypePointer Private %288 
					                               Private bool* %321 = OpVariable Private 
					                                         f32 %322 = OpConstant 3,674022E-40 
					                              Private f32_2* %326 = OpVariable Private 
					                                         f32 %334 = OpConstant 3,674022E-40 
					                                         f32 %353 = OpConstant 3,674022E-40 
					                                             %357 = OpTypePointer Function %6 
					                              Private f32_2* %366 = OpVariable Private 
					                                         i32 %367 = OpConstant 4 
					                                         i32 %370 = OpConstant 5 
					                                       f32_2 %375 = OpConstantComposite %141 %49 
					                                Private f32* %377 = OpVariable Private 
					                               Private bool* %415 = OpVariable Private 
					                              Private f32_2* %419 = OpVariable Private 
					                                         f32 %489 = OpConstant 3,674022E-40 
					                                       f32_2 %490 = OpConstantComposite %489 %145 
					                                         f32 %510 = OpConstant 3,674022E-40 
					                              Private f32_2* %528 = OpVariable Private 
					                                         f32 %531 = OpConstant 3,674022E-40 
					                                       f32_2 %532 = OpConstantComposite %531 %145 
					                              Private f32_2* %553 = OpVariable Private 
					                                Private f32* %565 = OpVariable Private 
					                                         f32 %587 = OpConstant 3,674022E-40 
					                                         f32 %589 = OpConstant 3,674022E-40 
					                                         f32 %595 = OpConstant 3,674022E-40 
					                                         f32 %601 = OpConstant 3,674022E-40 
					                                         f32 %607 = OpConstant 3,674022E-40 
					                               Private bool* %614 = OpVariable Private 
					                                         f32 %620 = OpConstant 3,674022E-40 
					                               Private bool* %633 = OpVariable Private 
					                                         f32 %658 = OpConstant 3,674022E-40 
					                                         f32 %663 = OpConstant 3,674022E-40 
					                               Private bool* %675 = OpVariable Private 
					                                         f32 %696 = OpConstant 3,674022E-40 
					                                         f32 %752 = OpConstant 3,674022E-40 
					                                         f32 %753 = OpConstant 3,674022E-40 
					                                       f32_4 %754 = OpConstantComposite %752 %145 %753 %145 
					                                         f32 %790 = OpConstant 3,674022E-40 
					                                       f32_2 %791 = OpConstantComposite %790 %145 
					                              Private f32_2* %815 = OpVariable Private 
					                                Private f32* %822 = OpVariable Private 
					                               Private bool* %878 = OpVariable Private 
					                               Private bool* %905 = OpVariable Private 
					                             Private f32_4* %1023 = OpVariable Private 
					                                        u32 %1030 = OpConstant 3 
					                                            %1036 = OpTypePointer Output %7 
					                              Output f32_4* %1037 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %358 = OpVariable Function 
					                               Function f32* %455 = OpVariable Function 
					                               Function f32* %479 = OpVariable Function 
					                               Function f32* %639 = OpVariable Function 
					                               Function f32* %704 = OpVariable Function 
					                               Function f32* %888 = OpVariable Function 
					                               Function f32* %911 = OpVariable Function 
					                               Function f32* %972 = OpVariable Function 
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
					                                 Uniform f32* %34 = OpAccessChain %16 %32 
					                                          f32 %35 = OpLoad %34 
					                                 Uniform f32* %37 = OpAccessChain %16 %36 
					                                          f32 %38 = OpLoad %37 
					                                          f32 %39 = OpFMul %35 %38 
					                                 Private f32* %43 = OpAccessChain %31 %41 
					                                                      OpStore %43 %39 
					                                 Private f32* %45 = OpAccessChain %31 %41 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %47 = OpExtInst %1 3 %46 
					                                 Private f32* %48 = OpAccessChain %44 %41 
					                                                      OpStore %48 %47 
					                                 Private f32* %51 = OpAccessChain %44 %50 
					                                                      OpStore %51 %49 
					                                        f32_4 %52 = OpLoad %44 
					                                        f32_2 %53 = OpVectorShuffle %52 %52 0 1 
					                                          f32 %57 = OpDot %53 %56 
					                                 Private f32* %58 = OpAccessChain %31 %41 
					                                                      OpStore %58 %57 
					                                 Private f32* %59 = OpAccessChain %31 %41 
					                                          f32 %60 = OpLoad %59 
					                                          f32 %61 = OpExtInst %1 13 %60 
					                                 Private f32* %62 = OpAccessChain %31 %41 
					                                                      OpStore %62 %61 
					                                 Private f32* %63 = OpAccessChain %31 %41 
					                                          f32 %64 = OpLoad %63 
					                                          f32 %66 = OpFMul %64 %65 
					                                 Private f32* %67 = OpAccessChain %31 %41 
					                                                      OpStore %67 %66 
					                                 Private f32* %69 = OpAccessChain %31 %41 
					                                          f32 %70 = OpLoad %69 
					                                          f32 %71 = OpExtInst %1 10 %70 
					                                 Private f32* %72 = OpAccessChain %68 %41 
					                                                      OpStore %72 %71 
					                                        f32_4 %73 = OpLoad %44 
					                                        f32_2 %74 = OpVectorShuffle %73 %73 0 0 
					                                        f32_2 %78 = OpFAdd %74 %77 
					                                        f32_4 %79 = OpLoad %44 
					                                        f32_4 %80 = OpVectorShuffle %79 %78 0 1 4 5 
					                                                      OpStore %44 %80 
					                                        f32_4 %81 = OpLoad %44 
					                                        f32_2 %82 = OpVectorShuffle %81 %81 2 1 
					                                          f32 %83 = OpDot %82 %56 
					                                 Private f32* %84 = OpAccessChain %31 %41 
					                                                      OpStore %84 %83 
					                                 Private f32* %85 = OpAccessChain %31 %41 
					                                          f32 %86 = OpLoad %85 
					                                          f32 %87 = OpExtInst %1 13 %86 
					                                 Private f32* %88 = OpAccessChain %31 %41 
					                                                      OpStore %88 %87 
					                                 Private f32* %89 = OpAccessChain %31 %41 
					                                          f32 %90 = OpLoad %89 
					                                          f32 %91 = OpFMul %90 %65 
					                                 Private f32* %92 = OpAccessChain %31 %41 
					                                                      OpStore %92 %91 
					                                 Private f32* %93 = OpAccessChain %31 %41 
					                                          f32 %94 = OpLoad %93 
					                                          f32 %95 = OpExtInst %1 10 %94 
					                                 Private f32* %96 = OpAccessChain %68 %50 
					                                                      OpStore %96 %95 
					                                        f32_4 %97 = OpLoad %68 
					                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                       f32_2 %101 = OpFMul %98 %100 
					                                       f32_4 %102 = OpLoad %9 
					                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
					                                       f32_2 %104 = OpFAdd %101 %103 
					                                                      OpStore %31 %104 
					                         read_only Texture2D %111 = OpLoad %110 
					                                     sampler %115 = OpLoad %114 
					                  read_only Texture2DSampled %117 = OpSampledImage %111 %115 
					                                       f32_2 %118 = OpLoad %31 
					                                       f32_4 %119 = OpImageSampleImplicitLod %117 %118 
					                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
					                                                      OpStore %107 %120 
					                                       f32_3 %125 = OpLoad %107 
					                                         f32 %126 = OpDot %124 %125 
					                                Private f32* %127 = OpAccessChain %68 %41 
					                                                      OpStore %127 %126 
					                                Uniform f32* %129 = OpAccessChain %16 %128 
					                                         f32 %130 = OpLoad %129 
					                                Private f32* %131 = OpAccessChain %68 %50 
					                                                      OpStore %131 %130 
					                                Uniform f32* %134 = OpAccessChain %16 %133 
					                                         f32 %135 = OpLoad %134 
					                                Uniform f32* %136 = OpAccessChain %16 %133 
					                                         f32 %137 = OpLoad %136 
					                                Uniform f32* %138 = OpAccessChain %16 %128 
					                                         f32 %139 = OpLoad %138 
					                                       f32_3 %140 = OpCompositeConstruct %135 %137 %139 
					                                       f32_3 %143 = OpFMul %140 %142 
					                                       f32_3 %147 = OpFAdd %143 %146 
					                                       f32_4 %148 = OpLoad %132 
					                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
					                                                      OpStore %132 %149 
					                                       f32_4 %150 = OpLoad %68 
					                                       f32_3 %151 = OpVectorShuffle %150 %150 0 0 1 
					                                       f32_4 %152 = OpLoad %132 
					                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
					                                       f32_3 %154 = OpFMul %151 %153 
					                                       f32_4 %155 = OpLoad %132 
					                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
					                                                      OpStore %132 %156 
					                                       f32_4 %157 = OpLoad %132 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
					                                Uniform f32* %159 = OpAccessChain %16 %128 
					                                         f32 %160 = OpLoad %159 
					                                Uniform f32* %161 = OpAccessChain %16 %128 
					                                         f32 %162 = OpLoad %161 
					                                       f32_2 %163 = OpCompositeConstruct %160 %162 
					                                         f32 %164 = OpCompositeExtract %163 0 
					                                         f32 %165 = OpCompositeExtract %163 1 
					                                       f32_2 %166 = OpCompositeConstruct %164 %165 
					                                       f32_2 %167 = OpFMul %158 %166 
					                                       f32_4 %168 = OpLoad %132 
					                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 2 3 
					                                                      OpStore %132 %169 
					                                Uniform f32* %170 = OpAccessChain %16 %133 
					                                         f32 %171 = OpLoad %170 
					                                Uniform f32* %172 = OpAccessChain %16 %133 
					                                         f32 %173 = OpLoad %172 
					                                       f32_2 %174 = OpCompositeConstruct %171 %173 
					                                         f32 %175 = OpCompositeExtract %174 0 
					                                         f32 %176 = OpCompositeExtract %174 1 
					                                       f32_2 %177 = OpCompositeConstruct %175 %176 
					                                       f32_2 %180 = OpFMul %177 %179 
					                                       f32_2 %182 = OpFAdd %180 %181 
					                                       f32_4 %183 = OpLoad %68 
					                                       f32_4 %184 = OpVectorShuffle %183 %182 0 1 4 5 
					                                                      OpStore %68 %184 
					                                       f32_4 %185 = OpLoad %68 
					                                       f32_3 %186 = OpVectorShuffle %185 %185 2 3 0 
					                                       f32_4 %187 = OpLoad %132 
					                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
					                                       f32_3 %189 = OpFMul %186 %188 
					                                       f32_4 %190 = OpLoad %68 
					                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
					                                                      OpStore %68 %191 
					                                Uniform f32* %192 = OpAccessChain %16 %128 
					                                         f32 %193 = OpLoad %192 
					                                Private f32* %194 = OpAccessChain %132 %41 
					                                                      OpStore %194 %193 
					                                Private f32* %197 = OpAccessChain %132 %196 
					                                                      OpStore %197 %195 
					                                       f32_4 %198 = OpLoad %68 
					                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
					                                       f32_4 %200 = OpLoad %132 
					                                       f32_3 %201 = OpVectorShuffle %200 %200 0 0 2 
					                                       f32_3 %202 = OpFMul %199 %201 
					                                       f32_4 %203 = OpLoad %68 
					                                       f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
					                                                      OpStore %68 %204 
					                                       f32_4 %205 = OpLoad %44 
					                                       f32_2 %206 = OpVectorShuffle %205 %205 3 1 
					                                         f32 %207 = OpDot %206 %56 
					                                Private f32* %208 = OpAccessChain %31 %41 
					                                                      OpStore %208 %207 
					                                Private f32* %209 = OpAccessChain %31 %41 
					                                         f32 %210 = OpLoad %209 
					                                         f32 %211 = OpExtInst %1 13 %210 
					                                Private f32* %212 = OpAccessChain %31 %41 
					                                                      OpStore %212 %211 
					                                Private f32* %213 = OpAccessChain %31 %41 
					                                         f32 %214 = OpLoad %213 
					                                         f32 %215 = OpFMul %214 %65 
					                                Private f32* %216 = OpAccessChain %31 %41 
					                                                      OpStore %216 %215 
					                                Private f32* %217 = OpAccessChain %31 %41 
					                                         f32 %218 = OpLoad %217 
					                                         f32 %219 = OpExtInst %1 10 %218 
					                                Private f32* %220 = OpAccessChain %31 %41 
					                                                      OpStore %220 %219 
					                                       f32_4 %222 = OpLoad %9 
					                                       f32_2 %223 = OpVectorShuffle %222 %222 0 1 
					                                       f32_2 %224 = OpFNegate %223 
					                                       f32_2 %226 = OpFAdd %224 %225 
					                                                      OpStore %221 %226 
					                                Private f32* %228 = OpAccessChain %9 %41 
					                                         f32 %229 = OpLoad %228 
					                                Private f32* %230 = OpAccessChain %221 %41 
					                                         f32 %231 = OpLoad %230 
					                                         f32 %232 = OpFMul %229 %231 
					                                                      OpStore %227 %232 
					                                Private f32* %233 = OpAccessChain %9 %50 
					                                         f32 %234 = OpLoad %233 
					                                         f32 %235 = OpLoad %227 
					                                         f32 %236 = OpFMul %234 %235 
					                                                      OpStore %227 %236 
					                                Private f32* %237 = OpAccessChain %221 %50 
					                                         f32 %238 = OpLoad %237 
					                                         f32 %239 = OpLoad %227 
					                                         f32 %240 = OpFMul %238 %239 
					                                                      OpStore %227 %240 
					                                         f32 %241 = OpLoad %227 
					                                         f32 %243 = OpFMul %241 %242 
					                                                      OpStore %227 %243 
					                                Private f32* %244 = OpAccessChain %31 %41 
					                                         f32 %245 = OpLoad %244 
					                                         f32 %246 = OpFAdd %245 %141 
					                                Private f32* %247 = OpAccessChain %221 %41 
					                                                      OpStore %247 %246 
					                                Private f32* %248 = OpAccessChain %221 %41 
					                                         f32 %249 = OpLoad %248 
					                                         f32 %251 = OpFMul %249 %250 
					                                         f32 %252 = OpFAdd %251 %144 
					                                Private f32* %253 = OpAccessChain %221 %41 
					                                                      OpStore %253 %252 
					                                       f32_2 %254 = OpLoad %31 
					                                       f32_2 %255 = OpVectorShuffle %254 %254 0 0 
					                                       f32_2 %258 = OpFMul %255 %257 
					                                       f32_4 %259 = OpLoad %132 
					                                       f32_4 %260 = OpVectorShuffle %259 %258 4 5 2 3 
					                                                      OpStore %132 %260 
					                                         f32 %261 = OpLoad %227 
					                                Private f32* %262 = OpAccessChain %221 %41 
					                                         f32 %263 = OpLoad %262 
					                                         f32 %264 = OpFMul %261 %263 
					                                Private f32* %265 = OpAccessChain %132 %41 
					                                         f32 %266 = OpLoad %265 
					                                         f32 %267 = OpFAdd %264 %266 
					                                Private f32* %268 = OpAccessChain %221 %41 
					                                                      OpStore %268 %267 
					                                Private f32* %269 = OpAccessChain %221 %41 
					                                         f32 %270 = OpLoad %269 
					                                         f32 %271 = OpFAdd %270 %49 
					                                Private f32* %272 = OpAccessChain %221 %41 
					                                                      OpStore %272 %271 
					                                         f32 %273 = OpLoad %227 
					                                         f32 %274 = OpExtInst %1 30 %273 
					                                                      OpStore %227 %274 
					                                         f32 %275 = OpLoad %227 
					                                         f32 %276 = OpFMul %275 %256 
					                                                      OpStore %227 %276 
					                                         f32 %277 = OpLoad %227 
					                                         f32 %278 = OpExtInst %1 29 %277 
					                                                      OpStore %227 %278 
					                                         f32 %279 = OpLoad %227 
					                                Private f32* %280 = OpAccessChain %221 %41 
					                                         f32 %281 = OpLoad %280 
					                                         f32 %282 = OpFMul %279 %281 
					                                                      OpStore %227 %282 
					                                Private f32* %285 = OpAccessChain %132 %50 
					                                         f32 %286 = OpLoad %285 
					                                         i32 %287 = OpConvertFToS %286 
					                                                      OpStore %284 %287 
					                                         i32 %294 = OpLoad %284 
					                                       i32_4 %295 = OpCompositeConstruct %294 %294 %294 %294 
					                                      bool_4 %297 = OpSLessThan %293 %295 
					                                      bool_2 %298 = OpVectorShuffle %297 %297 0 1 
					                                                      OpStore %291 %298 
					                                       f32_4 %299 = OpLoad %44 
					                                       f32_4 %300 = OpVectorShuffle %299 %299 0 1 0 1 
					                                       f32_4 %304 = OpFAdd %300 %303 
					                                                      OpStore %132 %304 
					                                       f32_4 %306 = OpLoad %132 
					                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
					                                         f32 %308 = OpDot %307 %56 
					                                                      OpStore %305 %308 
					                                         f32 %309 = OpLoad %305 
					                                         f32 %310 = OpExtInst %1 13 %309 
					                                                      OpStore %305 %310 
					                                         f32 %311 = OpLoad %305 
					                                         f32 %312 = OpFMul %311 %65 
					                                                      OpStore %305 %312 
					                                         f32 %313 = OpLoad %305 
					                                         f32 %314 = OpExtInst %1 10 %313 
					                                Private f32* %315 = OpAccessChain %132 %50 
					                                                      OpStore %315 %314 
					                                Private f32* %316 = OpAccessChain %132 %50 
					                                         f32 %317 = OpLoad %316 
					                                         f32 %319 = OpFAdd %317 %318 
					                                                      OpStore %305 %319 
					                                Private f32* %323 = OpAccessChain %132 %50 
					                                         f32 %324 = OpLoad %323 
					                                        bool %325 = OpFOrdLessThan %322 %324 
					                                                      OpStore %321 %325 
					                                       f32_4 %327 = OpLoad %9 
					                                       f32_2 %328 = OpVectorShuffle %327 %327 1 0 
					                                       f32_4 %329 = OpLoad %132 
					                                       f32_2 %330 = OpVectorShuffle %329 %329 1 1 
					                                       f32_2 %331 = OpFMul %328 %330 
					                                                      OpStore %326 %331 
					                                Private f32* %332 = OpAccessChain %326 %41 
					                                         f32 %333 = OpLoad %332 
					                                         f32 %335 = OpFMul %333 %334 
					                                Private f32* %336 = OpAccessChain %326 %50 
					                                         f32 %337 = OpLoad %336 
					                                         f32 %338 = OpFAdd %335 %337 
					                                Private f32* %339 = OpAccessChain %326 %41 
					                                                      OpStore %339 %338 
					                                         f32 %340 = OpLoad %305 
					                                Private f32* %341 = OpAccessChain %326 %41 
					                                         f32 %342 = OpLoad %341 
					                                         f32 %343 = OpFAdd %340 %342 
					                                                      OpStore %305 %343 
					                                         f32 %344 = OpLoad %305 
					                                         f32 %345 = OpExtInst %1 4 %344 
					                                         f32 %346 = OpExtInst %1 30 %345 
					                                                      OpStore %305 %346 
					                                         f32 %347 = OpLoad %305 
					                                         f32 %348 = OpFMul %347 %178 
					                                                      OpStore %305 %348 
					                                         f32 %349 = OpLoad %305 
					                                         f32 %350 = OpExtInst %1 29 %349 
					                                                      OpStore %305 %350 
					                                         f32 %351 = OpLoad %305 
					                                         f32 %352 = OpFNegate %351 
					                                         f32 %354 = OpFAdd %352 %353 
					                                Private f32* %355 = OpAccessChain %326 %41 
					                                                      OpStore %355 %354 
					                                        bool %356 = OpLoad %321 
					                                                      OpSelectionMerge %360 None 
					                                                      OpBranchConditional %356 %359 %362 
					                                             %359 = OpLabel 
					                                         f32 %361 = OpLoad %305 
					                                                      OpStore %358 %361 
					                                                      OpBranch %360 
					                                             %362 = OpLabel 
					                                Private f32* %363 = OpAccessChain %326 %41 
					                                         f32 %364 = OpLoad %363 
					                                                      OpStore %358 %364 
					                                                      OpBranch %360 
					                                             %360 = OpLabel 
					                                         f32 %365 = OpLoad %358 
					                                                      OpStore %305 %365 
					                                Uniform f32* %368 = OpAccessChain %16 %367 
					                                         f32 %369 = OpLoad %368 
					                                Uniform f32* %371 = OpAccessChain %16 %370 
					                                         f32 %372 = OpLoad %371 
					                                       f32_2 %373 = OpCompositeConstruct %369 %372 
					                                       f32_2 %374 = OpFNegate %373 
					                                       f32_2 %376 = OpFAdd %374 %375 
					                                                      OpStore %366 %376 
					                                Private f32* %378 = OpAccessChain %366 %41 
					                                         f32 %379 = OpLoad %378 
					                                         f32 %380 = OpFNegate %379 
					                                         f32 %381 = OpFAdd %380 %49 
					                                                      OpStore %377 %381 
					                                         f32 %382 = OpLoad %305 
					                                         f32 %383 = OpLoad %377 
					                                         f32 %384 = OpFMul %382 %383 
					                                Private f32* %385 = OpAccessChain %366 %41 
					                                         f32 %386 = OpLoad %385 
					                                         f32 %387 = OpFAdd %384 %386 
					                                                      OpStore %305 %387 
					                                         f32 %388 = OpLoad %227 
					                                         f32 %389 = OpLoad %305 
					                                         f32 %390 = OpFMul %388 %389 
					                                                      OpStore %305 %390 
					                               Private bool* %391 = OpAccessChain %291 %41 
					                                        bool %392 = OpLoad %391 
					                                         f32 %393 = OpLoad %305 
					                                         f32 %394 = OpLoad %227 
					                                         f32 %395 = OpSelect %392 %393 %394 
					                                                      OpStore %227 %395 
					                                       f32_4 %396 = OpLoad %132 
					                                       f32_2 %397 = OpVectorShuffle %396 %396 2 3 
					                                         f32 %398 = OpDot %397 %56 
					                                Private f32* %399 = OpAccessChain %221 %41 
					                                                      OpStore %399 %398 
					                                Private f32* %400 = OpAccessChain %221 %41 
					                                         f32 %401 = OpLoad %400 
					                                         f32 %402 = OpExtInst %1 13 %401 
					                                Private f32* %403 = OpAccessChain %221 %41 
					                                                      OpStore %403 %402 
					                                Private f32* %404 = OpAccessChain %221 %41 
					                                         f32 %405 = OpLoad %404 
					                                         f32 %406 = OpFMul %405 %65 
					                                Private f32* %407 = OpAccessChain %221 %41 
					                                                      OpStore %407 %406 
					                                Private f32* %408 = OpAccessChain %221 %41 
					                                         f32 %409 = OpLoad %408 
					                                         f32 %410 = OpExtInst %1 10 %409 
					                                Private f32* %411 = OpAccessChain %221 %41 
					                                                      OpStore %411 %410 
					                                Private f32* %412 = OpAccessChain %221 %41 
					                                         f32 %413 = OpLoad %412 
					                                         f32 %414 = OpFAdd %413 %318 
					                                                      OpStore %305 %414 
					                                Private f32* %416 = OpAccessChain %221 %41 
					                                         f32 %417 = OpLoad %416 
					                                        bool %418 = OpFOrdLessThan %322 %417 
					                                                      OpStore %415 %418 
					                                       f32_4 %420 = OpLoad %9 
					                                       f32_2 %421 = OpVectorShuffle %420 %420 1 0 
					                                       f32_2 %422 = OpLoad %221 
					                                       f32_2 %423 = OpVectorShuffle %422 %422 0 0 
					                                       f32_2 %424 = OpFMul %421 %423 
					                                                      OpStore %419 %424 
					                                Private f32* %425 = OpAccessChain %419 %41 
					                                         f32 %426 = OpLoad %425 
					                                         f32 %427 = OpFMul %426 %334 
					                                Private f32* %428 = OpAccessChain %419 %50 
					                                         f32 %429 = OpLoad %428 
					                                         f32 %430 = OpFAdd %427 %429 
					                                Private f32* %431 = OpAccessChain %221 %41 
					                                                      OpStore %431 %430 
					                                         f32 %432 = OpLoad %305 
					                                Private f32* %433 = OpAccessChain %221 %41 
					                                         f32 %434 = OpLoad %433 
					                                         f32 %435 = OpFAdd %432 %434 
					                                Private f32* %436 = OpAccessChain %221 %41 
					                                                      OpStore %436 %435 
					                                Private f32* %437 = OpAccessChain %221 %41 
					                                         f32 %438 = OpLoad %437 
					                                         f32 %439 = OpExtInst %1 4 %438 
					                                         f32 %440 = OpExtInst %1 30 %439 
					                                Private f32* %441 = OpAccessChain %221 %41 
					                                                      OpStore %441 %440 
					                                Private f32* %442 = OpAccessChain %221 %41 
					                                         f32 %443 = OpLoad %442 
					                                         f32 %444 = OpFMul %443 %178 
					                                Private f32* %445 = OpAccessChain %221 %41 
					                                                      OpStore %445 %444 
					                                Private f32* %446 = OpAccessChain %221 %41 
					                                         f32 %447 = OpLoad %446 
					                                         f32 %448 = OpExtInst %1 29 %447 
					                                Private f32* %449 = OpAccessChain %221 %41 
					                                                      OpStore %449 %448 
					                                Private f32* %450 = OpAccessChain %221 %41 
					                                         f32 %451 = OpLoad %450 
					                                         f32 %452 = OpFNegate %451 
					                                         f32 %453 = OpFAdd %452 %353 
					                                                      OpStore %305 %453 
					                                        bool %454 = OpLoad %415 
					                                                      OpSelectionMerge %457 None 
					                                                      OpBranchConditional %454 %456 %460 
					                                             %456 = OpLabel 
					                                Private f32* %458 = OpAccessChain %221 %41 
					                                         f32 %459 = OpLoad %458 
					                                                      OpStore %455 %459 
					                                                      OpBranch %457 
					                                             %460 = OpLabel 
					                                         f32 %461 = OpLoad %305 
					                                                      OpStore %455 %461 
					                                                      OpBranch %457 
					                                             %457 = OpLabel 
					                                         f32 %462 = OpLoad %455 
					                                Private f32* %463 = OpAccessChain %221 %41 
					                                                      OpStore %463 %462 
					                                Private f32* %464 = OpAccessChain %221 %41 
					                                         f32 %465 = OpLoad %464 
					                                         f32 %466 = OpLoad %377 
					                                         f32 %467 = OpFMul %465 %466 
					                                Private f32* %468 = OpAccessChain %366 %41 
					                                         f32 %469 = OpLoad %468 
					                                         f32 %470 = OpFAdd %467 %469 
					                                Private f32* %471 = OpAccessChain %221 %41 
					                                                      OpStore %471 %470 
					                                         f32 %472 = OpLoad %227 
					                                Private f32* %473 = OpAccessChain %221 %41 
					                                         f32 %474 = OpLoad %473 
					                                         f32 %475 = OpFMul %472 %474 
					                                Private f32* %476 = OpAccessChain %221 %41 
					                                                      OpStore %476 %475 
					                               Private bool* %477 = OpAccessChain %291 %50 
					                                        bool %478 = OpLoad %477 
					                                                      OpSelectionMerge %481 None 
					                                                      OpBranchConditional %478 %480 %484 
					                                             %480 = OpLabel 
					                                Private f32* %482 = OpAccessChain %221 %41 
					                                         f32 %483 = OpLoad %482 
					                                                      OpStore %479 %483 
					                                                      OpBranch %481 
					                                             %484 = OpLabel 
					                                         f32 %485 = OpLoad %227 
					                                                      OpStore %479 %485 
					                                                      OpBranch %481 
					                                             %481 = OpLabel 
					                                         f32 %486 = OpLoad %479 
					                                                      OpStore %227 %486 
					                                       f32_4 %487 = OpLoad %44 
					                                       f32_2 %488 = OpVectorShuffle %487 %487 0 1 
					                                       f32_2 %491 = OpFAdd %488 %490 
					                                                      OpStore %221 %491 
					                                       f32_2 %492 = OpLoad %221 
					                                         f32 %493 = OpDot %492 %56 
					                                Private f32* %494 = OpAccessChain %221 %41 
					                                                      OpStore %494 %493 
					                                Private f32* %495 = OpAccessChain %221 %41 
					                                         f32 %496 = OpLoad %495 
					                                         f32 %497 = OpExtInst %1 13 %496 
					                                Private f32* %498 = OpAccessChain %221 %41 
					                                                      OpStore %498 %497 
					                                Private f32* %499 = OpAccessChain %221 %41 
					                                         f32 %500 = OpLoad %499 
					                                         f32 %501 = OpFMul %500 %65 
					                                Private f32* %502 = OpAccessChain %221 %41 
					                                                      OpStore %502 %501 
					                                Private f32* %503 = OpAccessChain %221 %41 
					                                         f32 %504 = OpLoad %503 
					                                         f32 %505 = OpExtInst %1 10 %504 
					                                Private f32* %506 = OpAccessChain %221 %41 
					                                                      OpStore %506 %505 
					                                Private f32* %507 = OpAccessChain %221 %41 
					                                         f32 %508 = OpLoad %507 
					                                         f32 %509 = OpFMul %508 %76 
					                                         f32 %511 = OpFAdd %509 %510 
					                                Private f32* %512 = OpAccessChain %221 %41 
					                                                      OpStore %512 %511 
					                                Private f32* %513 = OpAccessChain %221 %41 
					                                         f32 %514 = OpLoad %513 
					                                         f32 %515 = OpExtInst %1 40 %514 %145 
					                                Private f32* %516 = OpAccessChain %221 %41 
					                                                      OpStore %516 %515 
					                                Private f32* %517 = OpAccessChain %221 %41 
					                                         f32 %518 = OpLoad %517 
					                                         i32 %519 = OpConvertFToS %518 
					                                                      OpStore %284 %519 
					                                         i32 %520 = OpLoad %284 
					                                       i32_4 %521 = OpCompositeConstruct %520 %520 %520 %520 
					                                      bool_4 %522 = OpSLessThan %293 %521 
					                                      bool_2 %523 = OpVectorShuffle %522 %522 0 1 
					                                                      OpStore %291 %523 
					                               Private bool* %524 = OpAccessChain %291 %41 
					                                        bool %525 = OpLoad %524 
					                                                      OpSelectionMerge %527 None 
					                                                      OpBranchConditional %525 %526 %527 
					                                             %526 = OpLabel 
					                                       f32_4 %529 = OpLoad %44 
					                                       f32_2 %530 = OpVectorShuffle %529 %529 0 1 
					                                       f32_2 %533 = OpFAdd %530 %532 
					                                                      OpStore %528 %533 
					                                       f32_2 %534 = OpLoad %528 
					                                         f32 %535 = OpDot %534 %56 
					                                Private f32* %536 = OpAccessChain %221 %41 
					                                                      OpStore %536 %535 
					                                Private f32* %537 = OpAccessChain %221 %41 
					                                         f32 %538 = OpLoad %537 
					                                         f32 %539 = OpExtInst %1 13 %538 
					                                Private f32* %540 = OpAccessChain %221 %41 
					                                                      OpStore %540 %539 
					                                Private f32* %541 = OpAccessChain %221 %41 
					                                         f32 %542 = OpLoad %541 
					                                         f32 %543 = OpFMul %542 %65 
					                                Private f32* %544 = OpAccessChain %221 %41 
					                                                      OpStore %544 %543 
					                                Private f32* %545 = OpAccessChain %221 %41 
					                                         f32 %546 = OpLoad %545 
					                                         f32 %547 = OpExtInst %1 10 %546 
					                                Private f32* %548 = OpAccessChain %132 %41 
					                                                      OpStore %548 %547 
					                                Private f32* %549 = OpAccessChain %31 %41 
					                                         f32 %550 = OpLoad %549 
					                                         f32 %551 = OpFMul %550 %334 
					                                Private f32* %552 = OpAccessChain %221 %41 
					                                                      OpStore %552 %551 
					                                       f32_4 %554 = OpLoad %9 
					                                       f32_2 %555 = OpVectorShuffle %554 %554 0 1 
					                                       f32_2 %556 = OpFNegate %555 
					                                       f32_4 %557 = OpLoad %132 
					                                       f32_2 %558 = OpVectorShuffle %557 %557 0 1 
					                                       f32_2 %559 = OpFAdd %556 %558 
					                                                      OpStore %553 %559 
					                                Private f32* %560 = OpAccessChain %553 %50 
					                                         f32 %561 = OpLoad %560 
					                                Private f32* %562 = OpAccessChain %553 %41 
					                                         f32 %563 = OpLoad %562 
					                                         f32 %564 = OpFDiv %561 %563 
					                                                      OpStore %305 %564 
					                                         f32 %566 = OpLoad %305 
					                                         f32 %567 = OpExtInst %1 4 %566 
					                                         f32 %568 = OpExtInst %1 37 %567 %49 
					                                                      OpStore %565 %568 
					                                         f32 %569 = OpLoad %305 
					                                         f32 %570 = OpExtInst %1 4 %569 
					                                         f32 %571 = OpExtInst %1 40 %570 %49 
					                                Private f32* %572 = OpAccessChain %366 %41 
					                                                      OpStore %572 %571 
					                                Private f32* %573 = OpAccessChain %366 %41 
					                                         f32 %574 = OpLoad %573 
					                                         f32 %575 = OpFDiv %49 %574 
					                                Private f32* %576 = OpAccessChain %366 %41 
					                                                      OpStore %576 %575 
					                                         f32 %577 = OpLoad %565 
					                                Private f32* %578 = OpAccessChain %366 %41 
					                                         f32 %579 = OpLoad %578 
					                                         f32 %580 = OpFMul %577 %579 
					                                                      OpStore %565 %580 
					                                         f32 %581 = OpLoad %565 
					                                         f32 %582 = OpLoad %565 
					                                         f32 %583 = OpFMul %581 %582 
					                                Private f32* %584 = OpAccessChain %366 %41 
					                                                      OpStore %584 %583 
					                                Private f32* %585 = OpAccessChain %366 %41 
					                                         f32 %586 = OpLoad %585 
					                                         f32 %588 = OpFMul %586 %587 
					                                         f32 %590 = OpFAdd %588 %589 
					                                                      OpStore %377 %590 
					                                Private f32* %591 = OpAccessChain %366 %41 
					                                         f32 %592 = OpLoad %591 
					                                         f32 %593 = OpLoad %377 
					                                         f32 %594 = OpFMul %592 %593 
					                                         f32 %596 = OpFAdd %594 %595 
					                                                      OpStore %377 %596 
					                                Private f32* %597 = OpAccessChain %366 %41 
					                                         f32 %598 = OpLoad %597 
					                                         f32 %599 = OpLoad %377 
					                                         f32 %600 = OpFMul %598 %599 
					                                         f32 %602 = OpFAdd %600 %601 
					                                                      OpStore %377 %602 
					                                Private f32* %603 = OpAccessChain %366 %41 
					                                         f32 %604 = OpLoad %603 
					                                         f32 %605 = OpLoad %377 
					                                         f32 %606 = OpFMul %604 %605 
					                                         f32 %608 = OpFAdd %606 %607 
					                                Private f32* %609 = OpAccessChain %366 %41 
					                                                      OpStore %609 %608 
					                                         f32 %610 = OpLoad %565 
					                                Private f32* %611 = OpAccessChain %366 %41 
					                                         f32 %612 = OpLoad %611 
					                                         f32 %613 = OpFMul %610 %612 
					                                                      OpStore %377 %613 
					                                         f32 %615 = OpLoad %305 
					                                         f32 %616 = OpExtInst %1 4 %615 
					                                        bool %617 = OpFOrdLessThan %49 %616 
					                                                      OpStore %614 %617 
					                                         f32 %618 = OpLoad %377 
					                                         f32 %619 = OpFMul %618 %510 
					                                         f32 %621 = OpFAdd %619 %620 
					                                                      OpStore %377 %621 
					                                        bool %622 = OpLoad %614 
					                                         f32 %623 = OpLoad %377 
					                                         f32 %624 = OpSelect %622 %623 %145 
					                                                      OpStore %377 %624 
					                                         f32 %625 = OpLoad %565 
					                                Private f32* %626 = OpAccessChain %366 %41 
					                                         f32 %627 = OpLoad %626 
					                                         f32 %628 = OpFMul %625 %627 
					                                         f32 %629 = OpLoad %377 
					                                         f32 %630 = OpFAdd %628 %629 
					                                                      OpStore %565 %630 
					                                         f32 %631 = OpLoad %305 
					                                         f32 %632 = OpExtInst %1 37 %631 %49 
					                                                      OpStore %305 %632 
					                                         f32 %634 = OpLoad %305 
					                                         f32 %635 = OpLoad %305 
					                                         f32 %636 = OpFNegate %635 
					                                        bool %637 = OpFOrdLessThan %634 %636 
					                                                      OpStore %633 %637 
					                                        bool %638 = OpLoad %633 
					                                                      OpSelectionMerge %641 None 
					                                                      OpBranchConditional %638 %640 %644 
					                                             %640 = OpLabel 
					                                         f32 %642 = OpLoad %565 
					                                         f32 %643 = OpFNegate %642 
					                                                      OpStore %639 %643 
					                                                      OpBranch %641 
					                                             %644 = OpLabel 
					                                         f32 %645 = OpLoad %565 
					                                                      OpStore %639 %645 
					                                                      OpBranch %641 
					                                             %641 = OpLabel 
					                                         f32 %646 = OpLoad %639 
					                                                      OpStore %305 %646 
					                                Private f32* %647 = OpAccessChain %221 %41 
					                                         f32 %648 = OpLoad %647 
					                                Private f32* %649 = OpAccessChain %221 %41 
					                                         f32 %650 = OpLoad %649 
					                                         f32 %651 = OpFMul %648 %650 
					                                Private f32* %652 = OpAccessChain %221 %41 
					                                                      OpStore %652 %651 
					                                         f32 %653 = OpLoad %305 
					                                Private f32* %654 = OpAccessChain %132 %41 
					                                         f32 %655 = OpLoad %654 
					                                         f32 %656 = OpFMul %653 %655 
					                                                      OpStore %305 %656 
					                                         f32 %657 = OpLoad %305 
					                                         f32 %659 = OpFMul %657 %658 
					                                                      OpStore %305 %659 
					                                         f32 %660 = OpLoad %305 
					                                         f32 %661 = OpExtInst %1 13 %660 
					                                                      OpStore %305 %661 
					                                         f32 %662 = OpLoad %305 
					                                         f32 %664 = OpFMul %662 %663 
					                                         f32 %665 = OpFAdd %664 %49 
					                                                      OpStore %305 %665 
					                                Private f32* %666 = OpAccessChain %221 %41 
					                                         f32 %667 = OpLoad %666 
					                                         f32 %668 = OpLoad %305 
					                                         f32 %669 = OpFMul %667 %668 
					                                Private f32* %670 = OpAccessChain %132 %41 
					                                                      OpStore %670 %669 
					                                       f32_2 %671 = OpLoad %553 
					                                       f32_2 %672 = OpLoad %553 
					                                         f32 %673 = OpDot %671 %672 
					                                Private f32* %674 = OpAccessChain %553 %41 
					                                                      OpStore %674 %673 
					                                Private f32* %676 = OpAccessChain %553 %41 
					                                         f32 %677 = OpLoad %676 
					                                Private f32* %678 = OpAccessChain %132 %41 
					                                         f32 %679 = OpLoad %678 
					                                        bool %680 = OpFOrdLessThan %677 %679 
					                                                      OpStore %675 %680 
					                                Private f32* %681 = OpAccessChain %221 %41 
					                                         f32 %682 = OpLoad %681 
					                                         f32 %683 = OpFNegate %682 
					                                         f32 %684 = OpLoad %305 
					                                         f32 %685 = OpFMul %683 %684 
					                                Private f32* %686 = OpAccessChain %553 %41 
					                                         f32 %687 = OpLoad %686 
					                                         f32 %688 = OpFAdd %685 %687 
					                                Private f32* %689 = OpAccessChain %221 %41 
					                                                      OpStore %689 %688 
					                                Private f32* %690 = OpAccessChain %221 %41 
					                                         f32 %691 = OpLoad %690 
					                                         f32 %692 = OpExtInst %1 30 %691 
					                                Private f32* %693 = OpAccessChain %221 %41 
					                                                      OpStore %693 %692 
					                                Private f32* %694 = OpAccessChain %221 %41 
					                                         f32 %695 = OpLoad %694 
					                                         f32 %697 = OpFMul %695 %696 
					                                Private f32* %698 = OpAccessChain %221 %41 
					                                                      OpStore %698 %697 
					                                Private f32* %699 = OpAccessChain %221 %41 
					                                         f32 %700 = OpLoad %699 
					                                         f32 %701 = OpExtInst %1 29 %700 
					                                Private f32* %702 = OpAccessChain %221 %41 
					                                                      OpStore %702 %701 
					                                        bool %703 = OpLoad %675 
					                                                      OpSelectionMerge %706 None 
					                                                      OpBranchConditional %703 %705 %707 
					                                             %705 = OpLabel 
					                                                      OpStore %704 %322 
					                                                      OpBranch %706 
					                                             %707 = OpLabel 
					                                Private f32* %708 = OpAccessChain %221 %41 
					                                         f32 %709 = OpLoad %708 
					                                                      OpStore %704 %709 
					                                                      OpBranch %706 
					                                             %706 = OpLabel 
					                                         f32 %710 = OpLoad %704 
					                                Private f32* %711 = OpAccessChain %221 %41 
					                                                      OpStore %711 %710 
					                                Private f32* %712 = OpAccessChain %31 %41 
					                                         f32 %713 = OpLoad %712 
					                                         f32 %714 = OpFNegate %713 
					                                         f32 %715 = OpFMul %714 %141 
					                                         f32 %716 = OpFAdd %715 %49 
					                                Private f32* %717 = OpAccessChain %31 %41 
					                                                      OpStore %717 %716 
					                                Private f32* %718 = OpAccessChain %31 %41 
					                                         f32 %719 = OpLoad %718 
					                                         f32 %720 = OpFMul %719 %322 
					                                Uniform f32* %721 = OpAccessChain %16 %367 
					                                         f32 %722 = OpLoad %721 
					                                         f32 %723 = OpFNegate %722 
					                                         f32 %724 = OpFAdd %720 %723 
					                                Private f32* %725 = OpAccessChain %31 %41 
					                                                      OpStore %725 %724 
					                                Private f32* %726 = OpAccessChain %31 %41 
					                                         f32 %727 = OpLoad %726 
					                                         f32 %728 = OpFAdd %727 %250 
					                                Private f32* %729 = OpAccessChain %31 %41 
					                                                      OpStore %729 %728 
					                                Private f32* %730 = OpAccessChain %31 %41 
					                                         f32 %731 = OpLoad %730 
					                                         f32 %732 = OpFNegate %731 
					                                         f32 %733 = OpFAdd %732 %49 
					                                                      OpStore %305 %733 
					                                Private f32* %734 = OpAccessChain %221 %41 
					                                         f32 %735 = OpLoad %734 
					                                         f32 %736 = OpLoad %305 
					                                         f32 %737 = OpFMul %735 %736 
					                                Private f32* %738 = OpAccessChain %31 %41 
					                                         f32 %739 = OpLoad %738 
					                                         f32 %740 = OpFAdd %737 %739 
					                                Private f32* %741 = OpAccessChain %31 %41 
					                                                      OpStore %741 %740 
					                                Private f32* %742 = OpAccessChain %31 %41 
					                                         f32 %743 = OpLoad %742 
					                                         f32 %744 = OpLoad %227 
					                                         f32 %745 = OpFMul %743 %744 
					                                                      OpStore %227 %745 
					                                                      OpBranch %527 
					                                             %527 = OpLabel 
					                               Private bool* %746 = OpAccessChain %291 %50 
					                                        bool %747 = OpLoad %746 
					                                                      OpSelectionMerge %749 None 
					                                                      OpBranchConditional %747 %748 %749 
					                                             %748 = OpLabel 
					                                       f32_4 %750 = OpLoad %44 
					                                       f32_4 %751 = OpVectorShuffle %750 %750 0 1 0 1 
					                                       f32_4 %755 = OpFAdd %751 %754 
					                                                      OpStore %132 %755 
					                                       f32_4 %756 = OpLoad %132 
					                                       f32_2 %757 = OpVectorShuffle %756 %756 0 1 
					                                         f32 %758 = OpDot %757 %56 
					                                Private f32* %759 = OpAccessChain %31 %41 
					                                                      OpStore %759 %758 
					                                Private f32* %760 = OpAccessChain %31 %41 
					                                         f32 %761 = OpLoad %760 
					                                         f32 %762 = OpExtInst %1 13 %761 
					                                Private f32* %763 = OpAccessChain %31 %41 
					                                                      OpStore %763 %762 
					                                Private f32* %764 = OpAccessChain %31 %41 
					                                         f32 %765 = OpLoad %764 
					                                         f32 %766 = OpFMul %765 %65 
					                                Private f32* %767 = OpAccessChain %31 %41 
					                                                      OpStore %767 %766 
					                                Private f32* %768 = OpAccessChain %31 %41 
					                                         f32 %769 = OpLoad %768 
					                                         f32 %770 = OpExtInst %1 10 %769 
					                                Private f32* %771 = OpAccessChain %132 %41 
					                                                      OpStore %771 %770 
					                                       f32_4 %772 = OpLoad %132 
					                                       f32_2 %773 = OpVectorShuffle %772 %772 2 3 
					                                         f32 %774 = OpDot %773 %56 
					                                Private f32* %775 = OpAccessChain %31 %41 
					                                                      OpStore %775 %774 
					                                Private f32* %776 = OpAccessChain %31 %41 
					                                         f32 %777 = OpLoad %776 
					                                         f32 %778 = OpExtInst %1 13 %777 
					                                Private f32* %779 = OpAccessChain %31 %41 
					                                                      OpStore %779 %778 
					                                Private f32* %780 = OpAccessChain %31 %41 
					                                         f32 %781 = OpLoad %780 
					                                         f32 %782 = OpFMul %781 %65 
					                                Private f32* %783 = OpAccessChain %31 %41 
					                                                      OpStore %783 %782 
					                                Private f32* %784 = OpAccessChain %31 %41 
					                                         f32 %785 = OpLoad %784 
					                                         f32 %786 = OpExtInst %1 10 %785 
					                                Private f32* %787 = OpAccessChain %132 %50 
					                                                      OpStore %787 %786 
					                                       f32_4 %788 = OpLoad %44 
					                                       f32_2 %789 = OpVectorShuffle %788 %788 0 1 
					                                       f32_2 %792 = OpFAdd %789 %791 
					                                       f32_4 %793 = OpLoad %44 
					                                       f32_4 %794 = OpVectorShuffle %793 %792 4 5 2 3 
					                                                      OpStore %44 %794 
					                                       f32_4 %795 = OpLoad %44 
					                                       f32_2 %796 = OpVectorShuffle %795 %795 0 1 
					                                         f32 %797 = OpDot %796 %56 
					                                Private f32* %798 = OpAccessChain %31 %41 
					                                                      OpStore %798 %797 
					                                Private f32* %799 = OpAccessChain %31 %41 
					                                         f32 %800 = OpLoad %799 
					                                         f32 %801 = OpExtInst %1 13 %800 
					                                Private f32* %802 = OpAccessChain %31 %41 
					                                                      OpStore %802 %801 
					                                Private f32* %803 = OpAccessChain %31 %41 
					                                         f32 %804 = OpLoad %803 
					                                         f32 %805 = OpFMul %804 %65 
					                                Private f32* %806 = OpAccessChain %31 %41 
					                                                      OpStore %806 %805 
					                                Private f32* %807 = OpAccessChain %31 %41 
					                                         f32 %808 = OpLoad %807 
					                                         f32 %809 = OpExtInst %1 10 %808 
					                                Private f32* %810 = OpAccessChain %31 %41 
					                                                      OpStore %810 %809 
					                                Private f32* %811 = OpAccessChain %31 %41 
					                                         f32 %812 = OpLoad %811 
					                                         f32 %813 = OpFMul %812 %334 
					                                Private f32* %814 = OpAccessChain %44 %41 
					                                                      OpStore %814 %813 
					                                       f32_4 %816 = OpLoad %9 
					                                       f32_2 %817 = OpVectorShuffle %816 %816 0 1 
					                                       f32_2 %818 = OpFNegate %817 
					                                       f32_4 %819 = OpLoad %132 
					                                       f32_2 %820 = OpVectorShuffle %819 %819 0 1 
					                                       f32_2 %821 = OpFAdd %818 %820 
					                                                      OpStore %815 %821 
					                                Private f32* %823 = OpAccessChain %815 %50 
					                                         f32 %824 = OpLoad %823 
					                                Private f32* %825 = OpAccessChain %815 %41 
					                                         f32 %826 = OpLoad %825 
					                                         f32 %827 = OpFDiv %824 %826 
					                                                      OpStore %822 %827 
					                                         f32 %828 = OpLoad %822 
					                                         f32 %829 = OpExtInst %1 4 %828 
					                                         f32 %830 = OpExtInst %1 37 %829 %49 
					                                                      OpStore %305 %830 
					                                         f32 %831 = OpLoad %822 
					                                         f32 %832 = OpExtInst %1 4 %831 
					                                         f32 %833 = OpExtInst %1 40 %832 %49 
					                                Private f32* %834 = OpAccessChain %553 %41 
					                                                      OpStore %834 %833 
					                                Private f32* %835 = OpAccessChain %553 %41 
					                                         f32 %836 = OpLoad %835 
					                                         f32 %837 = OpFDiv %49 %836 
					                                Private f32* %838 = OpAccessChain %553 %41 
					                                                      OpStore %838 %837 
					                                         f32 %839 = OpLoad %305 
					                                Private f32* %840 = OpAccessChain %553 %41 
					                                         f32 %841 = OpLoad %840 
					                                         f32 %842 = OpFMul %839 %841 
					                                                      OpStore %305 %842 
					                                         f32 %843 = OpLoad %305 
					                                         f32 %844 = OpLoad %305 
					                                         f32 %845 = OpFMul %843 %844 
					                                Private f32* %846 = OpAccessChain %553 %41 
					                                                      OpStore %846 %845 
					                                Private f32* %847 = OpAccessChain %553 %41 
					                                         f32 %848 = OpLoad %847 
					                                         f32 %849 = OpFMul %848 %587 
					                                         f32 %850 = OpFAdd %849 %589 
					                                Private f32* %851 = OpAccessChain %528 %41 
					                                                      OpStore %851 %850 
					                                Private f32* %852 = OpAccessChain %553 %41 
					                                         f32 %853 = OpLoad %852 
					                                Private f32* %854 = OpAccessChain %528 %41 
					                                         f32 %855 = OpLoad %854 
					                                         f32 %856 = OpFMul %853 %855 
					                                         f32 %857 = OpFAdd %856 %595 
					                                Private f32* %858 = OpAccessChain %528 %41 
					                                                      OpStore %858 %857 
					                                Private f32* %859 = OpAccessChain %553 %41 
					                                         f32 %860 = OpLoad %859 
					                                Private f32* %861 = OpAccessChain %528 %41 
					                                         f32 %862 = OpLoad %861 
					                                         f32 %863 = OpFMul %860 %862 
					                                         f32 %864 = OpFAdd %863 %601 
					                                Private f32* %865 = OpAccessChain %528 %41 
					                                                      OpStore %865 %864 
					                                Private f32* %866 = OpAccessChain %553 %41 
					                                         f32 %867 = OpLoad %866 
					                                Private f32* %868 = OpAccessChain %528 %41 
					                                         f32 %869 = OpLoad %868 
					                                         f32 %870 = OpFMul %867 %869 
					                                         f32 %871 = OpFAdd %870 %607 
					                                Private f32* %872 = OpAccessChain %553 %41 
					                                                      OpStore %872 %871 
					                                         f32 %873 = OpLoad %305 
					                                Private f32* %874 = OpAccessChain %553 %41 
					                                         f32 %875 = OpLoad %874 
					                                         f32 %876 = OpFMul %873 %875 
					                                Private f32* %877 = OpAccessChain %528 %41 
					                                                      OpStore %877 %876 
					                                         f32 %879 = OpLoad %822 
					                                         f32 %880 = OpExtInst %1 4 %879 
					                                        bool %881 = OpFOrdLessThan %49 %880 
					                                                      OpStore %878 %881 
					                                Private f32* %882 = OpAccessChain %528 %41 
					                                         f32 %883 = OpLoad %882 
					                                         f32 %884 = OpFMul %883 %510 
					                                         f32 %885 = OpFAdd %884 %620 
					                                Private f32* %886 = OpAccessChain %528 %41 
					                                                      OpStore %886 %885 
					                                        bool %887 = OpLoad %878 
					                                                      OpSelectionMerge %890 None 
					                                                      OpBranchConditional %887 %889 %893 
					                                             %889 = OpLabel 
					                                Private f32* %891 = OpAccessChain %528 %41 
					                                         f32 %892 = OpLoad %891 
					                                                      OpStore %888 %892 
					                                                      OpBranch %890 
					                                             %893 = OpLabel 
					                                                      OpStore %888 %145 
					                                                      OpBranch %890 
					                                             %890 = OpLabel 
					                                         f32 %894 = OpLoad %888 
					                                Private f32* %895 = OpAccessChain %528 %41 
					                                                      OpStore %895 %894 
					                                         f32 %896 = OpLoad %305 
					                                Private f32* %897 = OpAccessChain %553 %41 
					                                         f32 %898 = OpLoad %897 
					                                         f32 %899 = OpFMul %896 %898 
					                                Private f32* %900 = OpAccessChain %528 %41 
					                                         f32 %901 = OpLoad %900 
					                                         f32 %902 = OpFAdd %899 %901 
					                                                      OpStore %305 %902 
					                                         f32 %903 = OpLoad %822 
					                                         f32 %904 = OpExtInst %1 37 %903 %49 
					                                                      OpStore %822 %904 
					                                         f32 %906 = OpLoad %822 
					                                         f32 %907 = OpLoad %822 
					                                         f32 %908 = OpFNegate %907 
					                                        bool %909 = OpFOrdLessThan %906 %908 
					                                                      OpStore %905 %909 
					                                        bool %910 = OpLoad %905 
					                                                      OpSelectionMerge %913 None 
					                                                      OpBranchConditional %910 %912 %916 
					                                             %912 = OpLabel 
					                                         f32 %914 = OpLoad %305 
					                                         f32 %915 = OpFNegate %914 
					                                                      OpStore %911 %915 
					                                                      OpBranch %913 
					                                             %916 = OpLabel 
					                                         f32 %917 = OpLoad %305 
					                                                      OpStore %911 %917 
					                                                      OpBranch %913 
					                                             %913 = OpLabel 
					                                         f32 %918 = OpLoad %911 
					                                                      OpStore %822 %918 
					                                Private f32* %919 = OpAccessChain %44 %41 
					                                         f32 %920 = OpLoad %919 
					                                Private f32* %921 = OpAccessChain %44 %41 
					                                         f32 %922 = OpLoad %921 
					                                         f32 %923 = OpFMul %920 %922 
					                                Private f32* %924 = OpAccessChain %44 %41 
					                                                      OpStore %924 %923 
					                                         f32 %925 = OpLoad %822 
					                                Private f32* %926 = OpAccessChain %132 %41 
					                                         f32 %927 = OpLoad %926 
					                                         f32 %928 = OpFMul %925 %927 
					                                                      OpStore %822 %928 
					                                         f32 %929 = OpLoad %822 
					                                         f32 %930 = OpFMul %929 %658 
					                                                      OpStore %822 %930 
					                                         f32 %931 = OpLoad %822 
					                                         f32 %932 = OpExtInst %1 13 %931 
					                                                      OpStore %822 %932 
					                                         f32 %933 = OpLoad %822 
					                                         f32 %934 = OpFMul %933 %663 
					                                         f32 %935 = OpFAdd %934 %49 
					                                                      OpStore %822 %935 
					                                         f32 %936 = OpLoad %822 
					                                Private f32* %937 = OpAccessChain %44 %41 
					                                         f32 %938 = OpLoad %937 
					                                         f32 %939 = OpFMul %936 %938 
					                                                      OpStore %305 %939 
					                                       f32_2 %940 = OpLoad %815 
					                                       f32_2 %941 = OpLoad %815 
					                                         f32 %942 = OpDot %940 %941 
					                                Private f32* %943 = OpAccessChain %815 %41 
					                                                      OpStore %943 %942 
					                                Private f32* %944 = OpAccessChain %815 %41 
					                                         f32 %945 = OpLoad %944 
					                                         f32 %946 = OpLoad %305 
					                                        bool %947 = OpFOrdLessThan %945 %946 
					                               Private bool* %948 = OpAccessChain %291 %41 
					                                                      OpStore %948 %947 
					                                Private f32* %949 = OpAccessChain %44 %41 
					                                         f32 %950 = OpLoad %949 
					                                         f32 %951 = OpFNegate %950 
					                                         f32 %952 = OpLoad %822 
					                                         f32 %953 = OpFMul %951 %952 
					                                Private f32* %954 = OpAccessChain %815 %41 
					                                         f32 %955 = OpLoad %954 
					                                         f32 %956 = OpFAdd %953 %955 
					                                Private f32* %957 = OpAccessChain %44 %41 
					                                                      OpStore %957 %956 
					                                Private f32* %958 = OpAccessChain %44 %41 
					                                         f32 %959 = OpLoad %958 
					                                         f32 %960 = OpExtInst %1 30 %959 
					                                Private f32* %961 = OpAccessChain %44 %41 
					                                                      OpStore %961 %960 
					                                Private f32* %962 = OpAccessChain %44 %41 
					                                         f32 %963 = OpLoad %962 
					                                         f32 %964 = OpFMul %963 %696 
					                                Private f32* %965 = OpAccessChain %44 %41 
					                                                      OpStore %965 %964 
					                                Private f32* %966 = OpAccessChain %44 %41 
					                                         f32 %967 = OpLoad %966 
					                                         f32 %968 = OpExtInst %1 29 %967 
					                                Private f32* %969 = OpAccessChain %44 %41 
					                                                      OpStore %969 %968 
					                               Private bool* %970 = OpAccessChain %291 %41 
					                                        bool %971 = OpLoad %970 
					                                                      OpSelectionMerge %974 None 
					                                                      OpBranchConditional %971 %973 %975 
					                                             %973 = OpLabel 
					                                                      OpStore %972 %322 
					                                                      OpBranch %974 
					                                             %975 = OpLabel 
					                                Private f32* %976 = OpAccessChain %44 %41 
					                                         f32 %977 = OpLoad %976 
					                                                      OpStore %972 %977 
					                                                      OpBranch %974 
					                                             %974 = OpLabel 
					                                         f32 %978 = OpLoad %972 
					                                Private f32* %979 = OpAccessChain %44 %41 
					                                                      OpStore %979 %978 
					                                Private f32* %980 = OpAccessChain %31 %41 
					                                         f32 %981 = OpLoad %980 
					                                         f32 %982 = OpFNegate %981 
					                                         f32 %983 = OpFMul %982 %141 
					                                         f32 %984 = OpFAdd %983 %49 
					                                Private f32* %985 = OpAccessChain %31 %41 
					                                                      OpStore %985 %984 
					                                Private f32* %986 = OpAccessChain %31 %41 
					                                         f32 %987 = OpLoad %986 
					                                         f32 %988 = OpFMul %987 %322 
					                                Uniform f32* %989 = OpAccessChain %16 %367 
					                                         f32 %990 = OpLoad %989 
					                                         f32 %991 = OpFNegate %990 
					                                         f32 %992 = OpFAdd %988 %991 
					                                Private f32* %993 = OpAccessChain %31 %41 
					                                                      OpStore %993 %992 
					                                Private f32* %994 = OpAccessChain %31 %41 
					                                         f32 %995 = OpLoad %994 
					                                         f32 %996 = OpFAdd %995 %250 
					                                Private f32* %997 = OpAccessChain %31 %41 
					                                                      OpStore %997 %996 
					                                Private f32* %998 = OpAccessChain %31 %41 
					                                         f32 %999 = OpLoad %998 
					                                        f32 %1000 = OpFNegate %999 
					                                        f32 %1001 = OpFAdd %1000 %49 
					                               Private f32* %1002 = OpAccessChain %815 %41 
					                                                      OpStore %1002 %1001 
					                               Private f32* %1003 = OpAccessChain %44 %41 
					                                        f32 %1004 = OpLoad %1003 
					                               Private f32* %1005 = OpAccessChain %815 %41 
					                                        f32 %1006 = OpLoad %1005 
					                                        f32 %1007 = OpFMul %1004 %1006 
					                               Private f32* %1008 = OpAccessChain %31 %41 
					                                        f32 %1009 = OpLoad %1008 
					                                        f32 %1010 = OpFAdd %1007 %1009 
					                               Private f32* %1011 = OpAccessChain %31 %41 
					                                                      OpStore %1011 %1010 
					                               Private f32* %1012 = OpAccessChain %31 %41 
					                                        f32 %1013 = OpLoad %1012 
					                                        f32 %1014 = OpLoad %227 
					                                        f32 %1015 = OpFMul %1013 %1014 
					                                                      OpStore %227 %1015 
					                                                      OpBranch %749 
					                                             %749 = OpLabel 
					                                        f32 %1016 = OpLoad %227 
					                                      f32_3 %1017 = OpCompositeConstruct %1016 %1016 %1016 
					                                      f32_4 %1018 = OpLoad %68 
					                                      f32_3 %1019 = OpVectorShuffle %1018 %1018 0 1 2 
					                                      f32_3 %1020 = OpFMul %1017 %1019 
					                                      f32_4 %1021 = OpLoad %44 
					                                      f32_4 %1022 = OpVectorShuffle %1021 %1020 4 5 6 3 
					                                                      OpStore %44 %1022 
					                        read_only Texture2D %1024 = OpLoad %110 
					                                    sampler %1025 = OpLoad %114 
					                 read_only Texture2DSampled %1026 = OpSampledImage %1024 %1025 
					                                      f32_4 %1027 = OpLoad %9 
					                                      f32_2 %1028 = OpVectorShuffle %1027 %1027 0 1 
					                                      f32_4 %1029 = OpImageSampleImplicitLod %1026 %1028 
					                                                      OpStore %1023 %1029 
					                               Private f32* %1031 = OpAccessChain %44 %1030 
					                                                      OpStore %1031 %49 
					                                      f32_4 %1032 = OpLoad %1023 
					                                      f32_4 %1033 = OpLoad %44 
					                                      f32_4 %1034 = OpFNegate %1033 
					                                      f32_4 %1035 = OpFAdd %1032 %1034 
					                                                      OpStore %9 %1035 
					                                      f32_2 %1038 = OpLoad %366 
					                                      f32_4 %1039 = OpVectorShuffle %1038 %1038 1 1 1 1 
					                                      f32_4 %1040 = OpLoad %9 
					                                      f32_4 %1041 = OpFMul %1039 %1040 
					                                      f32_4 %1042 = OpLoad %44 
					                                      f32_4 %1043 = OpFAdd %1041 %1042 
					                                                      OpStore %1037 %1043 
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
						float _Value;
						float _Value2;
						float _Value3;
						float _Value4;
						float _Fade;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					bool u_xlatb4;
					vec2 u_xlat5;
					vec2 u_xlat7;
					vec2 u_xlat9;
					vec2 u_xlat10;
					vec2 u_xlat12;
					vec2 u_xlat13;
					int u_xlati13;
					bvec2 u_xlatb13;
					vec2 u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat18;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat21;
					bool u_xlatb21;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.x = _Value * _TimeX;
					    u_xlat1.x = trunc(u_xlat12.x);
					    u_xlat1.y = 1.0;
					    u_xlat12.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12.x = sin(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * 43758.5469;
					    u_xlat2.x = fract(u_xlat12.x);
					    u_xlat1.zw = u_xlat1.xx + vec2(23.0, 8.0);
					    u_xlat12.x = dot(u_xlat1.zy, vec2(12.9898005, 78.2330017));
					    u_xlat12.x = sin(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * 43758.5469;
					    u_xlat2.y = fract(u_xlat12.x);
					    u_xlat12.xy = u_xlat2.xy * vec2(0.00200000009, 0.00200000009) + u_xlat0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat12.xy);
					    u_xlat2.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat10_2.xyz);
					    u_xlat2.y = _Value2;
					    u_xlat3.xyz = vec3(_Value3, _Value3, _Value2) * vec3(1.0, 0.5, 1.0) + vec3(0.699999988, 0.699999988, 0.0);
					    u_xlat3.xyz = u_xlat2.xxy * u_xlat3.xyz;
					    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_Value2, _Value2));
					    u_xlat2.zw = vec2(vec2(_Value3, _Value3)) * vec2(1.0, 0.125) + vec2(0.699999988, 0.699999988);
					    u_xlat2.xyz = u_xlat2.zwx * u_xlat3.xyz;
					    u_xlat3.x = _Value2;
					    u_xlat3.z = 0.48999998;
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xxz;
					    u_xlat12.x = dot(u_xlat1.wy, vec2(12.9898005, 78.2330017));
					    u_xlat12.x = sin(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * 43758.5469;
					    u_xlat12.x = fract(u_xlat12.x);
					    u_xlat13.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat18 = u_xlat0.x * u_xlat13.x;
					    u_xlat18 = u_xlat0.y * u_xlat18;
					    u_xlat18 = u_xlat13.y * u_xlat18;
					    u_xlat18 = u_xlat18 * 16.0;
					    u_xlat13.x = u_xlat12.x + 0.5;
					    u_xlat13.x = u_xlat13.x * 0.300000012 + 0.699999988;
					    u_xlat3.xy = u_xlat12.xx * vec2(0.400000006, 8.0);
					    u_xlat13.x = u_xlat18 * u_xlat13.x + u_xlat3.x;
					    u_xlat13.x = u_xlat13.x + 1.0;
					    u_xlat18 = log2(u_xlat18);
					    u_xlat18 = u_xlat18 * 0.400000006;
					    u_xlat18 = exp2(u_xlat18);
					    u_xlat18 = u_xlat18 * u_xlat13.x;
					    u_xlati13 = int(u_xlat3.y);
					    u_xlatb13.xy = lessThan(ivec4(0, 1, 0, 1), ivec4(u_xlati13)).xy;
					    u_xlat3 = u_xlat1.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat20 = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat20 = sin(u_xlat20);
					    u_xlat20 = u_xlat20 * 43758.5469;
					    u_xlat3.y = fract(u_xlat20);
					    u_xlat20 = u_xlat3.y + -0.5;
					    u_xlatb4 = 0.200000003<u_xlat3.y;
					    u_xlat10.xy = u_xlat0.yx * u_xlat3.yy;
					    u_xlat10.x = u_xlat10.x * 0.00999999978 + u_xlat10.y;
					    u_xlat20 = u_xlat20 + u_xlat10.x;
					    u_xlat20 = log2(abs(u_xlat20));
					    u_xlat20 = u_xlat20 * 0.125;
					    u_xlat20 = exp2(u_xlat20);
					    u_xlat10.x = (-u_xlat20) + 2.0;
					    u_xlat20 = (u_xlatb4) ? u_xlat20 : u_xlat10.x;
					    u_xlat4.xy = (-vec2(_Value4, _Fade)) + vec2(0.5, 1.0);
					    u_xlat16 = (-u_xlat4.x) + 1.0;
					    u_xlat20 = u_xlat20 * u_xlat16 + u_xlat4.x;
					    u_xlat20 = u_xlat18 * u_xlat20;
					    u_xlat18 = (u_xlatb13.x) ? u_xlat20 : u_xlat18;
					    u_xlat13.x = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat13.x = sin(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x * 43758.5469;
					    u_xlat13.x = fract(u_xlat13.x);
					    u_xlat20 = u_xlat13.x + -0.5;
					    u_xlatb15 = 0.200000003<u_xlat13.x;
					    u_xlat5.xy = u_xlat0.yx * u_xlat13.xx;
					    u_xlat13.x = u_xlat5.x * 0.00999999978 + u_xlat5.y;
					    u_xlat13.x = u_xlat20 + u_xlat13.x;
					    u_xlat13.x = log2(abs(u_xlat13.x));
					    u_xlat13.x = u_xlat13.x * 0.125;
					    u_xlat13.x = exp2(u_xlat13.x);
					    u_xlat20 = (-u_xlat13.x) + 2.0;
					    u_xlat13.x = (u_xlatb15) ? u_xlat13.x : u_xlat20;
					    u_xlat13.x = u_xlat13.x * u_xlat16 + u_xlat4.x;
					    u_xlat13.x = u_xlat18 * u_xlat13.x;
					    u_xlat18 = (u_xlatb13.y) ? u_xlat13.x : u_xlat18;
					    u_xlat13.xy = u_xlat1.xy + vec2(18.0, 0.0);
					    u_xlat13.x = dot(u_xlat13.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13.x = sin(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x * 43758.5469;
					    u_xlat13.x = fract(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x * 8.0 + -2.0;
					    u_xlat13.x = max(u_xlat13.x, 0.0);
					    u_xlati13 = int(u_xlat13.x);
					    u_xlatb13.xy = lessThan(ivec4(0, 1, 0, 1), ivec4(u_xlati13)).xy;
					    if(u_xlatb13.x){
					        u_xlat15.xy = u_xlat1.xy + vec2(6.0, 0.0);
					        u_xlat13.x = dot(u_xlat15.xy, vec2(12.9898005, 78.2330017));
					        u_xlat13.x = sin(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * 43758.5469;
					        u_xlat3.x = fract(u_xlat13.x);
					        u_xlat13.x = u_xlat12.x * 0.00999999978;
					        u_xlat9.xy = (-u_xlat0.xy) + u_xlat3.xy;
					        u_xlat20 = u_xlat9.y / u_xlat9.x;
					        u_xlat21 = min(abs(u_xlat20), 1.0);
					        u_xlat4.x = max(abs(u_xlat20), 1.0);
					        u_xlat4.x = float(1.0) / u_xlat4.x;
					        u_xlat21 = u_xlat21 * u_xlat4.x;
					        u_xlat4.x = u_xlat21 * u_xlat21;
					        u_xlat16 = u_xlat4.x * 0.0208350997 + -0.0851330012;
					        u_xlat16 = u_xlat4.x * u_xlat16 + 0.180141002;
					        u_xlat16 = u_xlat4.x * u_xlat16 + -0.330299497;
					        u_xlat4.x = u_xlat4.x * u_xlat16 + 0.999866009;
					        u_xlat16 = u_xlat21 * u_xlat4.x;
					        u_xlatb22 = 1.0<abs(u_xlat20);
					        u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
					        u_xlat16 = u_xlatb22 ? u_xlat16 : float(0.0);
					        u_xlat21 = u_xlat21 * u_xlat4.x + u_xlat16;
					        u_xlat20 = min(u_xlat20, 1.0);
					        u_xlatb20 = u_xlat20<(-u_xlat20);
					        u_xlat20 = (u_xlatb20) ? (-u_xlat21) : u_xlat21;
					        u_xlat13.x = u_xlat13.x * u_xlat13.x;
					        u_xlat20 = u_xlat20 * u_xlat3.x;
					        u_xlat20 = u_xlat20 * 6.28310013;
					        u_xlat20 = sin(u_xlat20);
					        u_xlat20 = u_xlat20 * 0.100000001 + 1.0;
					        u_xlat3.x = u_xlat13.x * u_xlat20;
					        u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
					        u_xlatb3 = u_xlat9.x<u_xlat3.x;
					        u_xlat13.x = (-u_xlat13.x) * u_xlat20 + u_xlat9.x;
					        u_xlat13.x = log2(u_xlat13.x);
					        u_xlat13.x = u_xlat13.x * 0.0625;
					        u_xlat13.x = exp2(u_xlat13.x);
					        u_xlat13.x = (u_xlatb3) ? 0.200000003 : u_xlat13.x;
					        u_xlat12.x = (-u_xlat12.x) * 0.5 + 1.0;
					        u_xlat12.x = u_xlat12.x * 0.200000003 + (-_Value4);
					        u_xlat12.x = u_xlat12.x + 0.300000012;
					        u_xlat20 = (-u_xlat12.x) + 1.0;
					        u_xlat12.x = u_xlat13.x * u_xlat20 + u_xlat12.x;
					        u_xlat18 = u_xlat12.x * u_xlat18;
					    //ENDIF
					    }
					    if(u_xlatb13.y){
					        u_xlat3 = u_xlat1.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat12.x = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					        u_xlat12.x = sin(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 43758.5469;
					        u_xlat3.x = fract(u_xlat12.x);
					        u_xlat12.x = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					        u_xlat12.x = sin(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 43758.5469;
					        u_xlat3.y = fract(u_xlat12.x);
					        u_xlat1.xy = u_xlat1.xy + vec2(27.0, 0.0);
					        u_xlat12.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					        u_xlat12.x = sin(u_xlat12.x);
					        u_xlat12.x = u_xlat12.x * 43758.5469;
					        u_xlat12.x = fract(u_xlat12.x);
					        u_xlat1.x = u_xlat12.x * 0.00999999978;
					        u_xlat7.xy = (-u_xlat0.xy) + u_xlat3.xy;
					        u_xlat19 = u_xlat7.y / u_xlat7.x;
					        u_xlat20 = min(abs(u_xlat19), 1.0);
					        u_xlat9.x = max(abs(u_xlat19), 1.0);
					        u_xlat9.x = float(1.0) / u_xlat9.x;
					        u_xlat20 = u_xlat20 * u_xlat9.x;
					        u_xlat9.x = u_xlat20 * u_xlat20;
					        u_xlat15.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
					        u_xlat15.x = u_xlat9.x * u_xlat15.x + 0.180141002;
					        u_xlat15.x = u_xlat9.x * u_xlat15.x + -0.330299497;
					        u_xlat9.x = u_xlat9.x * u_xlat15.x + 0.999866009;
					        u_xlat15.x = u_xlat20 * u_xlat9.x;
					        u_xlatb21 = 1.0<abs(u_xlat19);
					        u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
					        u_xlat15.x = u_xlatb21 ? u_xlat15.x : float(0.0);
					        u_xlat20 = u_xlat20 * u_xlat9.x + u_xlat15.x;
					        u_xlat19 = min(u_xlat19, 1.0);
					        u_xlatb19 = u_xlat19<(-u_xlat19);
					        u_xlat19 = (u_xlatb19) ? (-u_xlat20) : u_xlat20;
					        u_xlat1.x = u_xlat1.x * u_xlat1.x;
					        u_xlat19 = u_xlat19 * u_xlat3.x;
					        u_xlat19 = u_xlat19 * 6.28310013;
					        u_xlat19 = sin(u_xlat19);
					        u_xlat19 = u_xlat19 * 0.100000001 + 1.0;
					        u_xlat20 = u_xlat19 * u_xlat1.x;
					        u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
					        u_xlatb13.x = u_xlat7.x<u_xlat20;
					        u_xlat1.x = (-u_xlat1.x) * u_xlat19 + u_xlat7.x;
					        u_xlat1.x = log2(u_xlat1.x);
					        u_xlat1.x = u_xlat1.x * 0.0625;
					        u_xlat1.x = exp2(u_xlat1.x);
					        u_xlat1.x = (u_xlatb13.x) ? 0.200000003 : u_xlat1.x;
					        u_xlat12.x = (-u_xlat12.x) * 0.5 + 1.0;
					        u_xlat12.x = u_xlat12.x * 0.200000003 + (-_Value4);
					        u_xlat12.x = u_xlat12.x + 0.300000012;
					        u_xlat7.x = (-u_xlat12.x) + 1.0;
					        u_xlat12.x = u_xlat1.x * u_xlat7.x + u_xlat12.x;
					        u_xlat18 = u_xlat12.x * u_xlat18;
					    //ENDIF
					    }
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.w = 1.0;
					    u_xlat0 = u_xlat10_0 + (-u_xlat1);
					    SV_Target0 = u_xlat4.yyyy * u_xlat0 + u_xlat1;
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