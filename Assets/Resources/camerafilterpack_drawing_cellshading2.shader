Shader "CameraFilterPack/Drawing_CellShading2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_EdgeSize ("_EdgeSize", Range(0, 1)) = 0
		_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 45011
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _EdgeSize;
					uniform 	float _ColorLevel;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					ivec2 u_xlati3;
					vec2 u_xlat4;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat10_9;
					vec4 u_xlat10;
					vec4 u_xlat10_10;
					vec4 u_xlat10_11;
					vec4 u_xlat12;
					vec4 u_xlat16_12;
					vec4 u_xlat10_12;
					vec4 u_xlat13;
					vec4 u_xlat16_13;
					vec4 u_xlat10_13;
					vec4 u_xlat14;
					vec4 u_xlat16_14;
					vec4 u_xlat10_14;
					vec4 u_xlat10_15;
					int u_xlati33;
					float u_xlat36;
					ivec2 u_xlati36;
					bool u_xlatb36;
					float u_xlat49;
					bool u_xlatb49;
					float u_xlat50;
					int u_xlati50;
					vec4 TempArray0[6];
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat1.xy = u_xlat0.zw * _ScreenResolution.xy;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlati33 = int(0xFFFFFFFEu);
					    while(true){
					        u_xlatb49 = 2<u_xlati33;
					        if(u_xlatb49){break;}
					        u_xlati3.xy = ivec2(u_xlati33) + ivec2(2, 1);
					        u_xlat49 = TempArray0[u_xlati3.x].x;
					        u_xlat50 = float(u_xlati33);
					        u_xlat4.x = dot(vec2(u_xlat50), vec2(vec2(_Distortion, _Distortion)));
					        u_xlat3.xzw = u_xlat2.xyz;
					        u_xlati50 = int(0xFFFFFFFEu);
					        while(true){
					            u_xlatb36 = 2<u_xlati50;
					            if(u_xlatb36){break;}
					            u_xlati36.xy = ivec2(u_xlati50) + ivec2(2, 1);
					            u_xlat36 = TempArray0[u_xlati36.x].x;
					            u_xlat36 = u_xlat49 * u_xlat36;
					            u_xlat5.x = float(u_xlati50);
					            u_xlat4.y = dot(u_xlat5.xx, vec2(vec2(_Distortion, _Distortion)));
					            u_xlat5.xy = u_xlat0.zw * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat5.xy = u_xlat5.xy / _ScreenResolution.xy;
					            u_xlat10_5 = texture(_MainTex, u_xlat5.xy);
					            u_xlat3.xzw = vec3(u_xlat36) * u_xlat10_5.xyz + u_xlat3.xzw;
					            u_xlati50 = u_xlati36.y;
					        }
					        u_xlat2.xyz = u_xlat3.xzw;
					        u_xlati33 = u_xlati3.y;
					    }
					    u_xlat3 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 1.0, 1.0, 0.0);
					    u_xlat3 = u_xlat3 / _ScreenResolution.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_5 = u_xlat10_3 + u_xlat10_4;
					    u_xlat6 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, -1.0, 0.0, 1.0);
					    u_xlat6 = u_xlat6 / _ScreenResolution.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_7;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_6;
					    u_xlat1.xy = u_xlat1.xy / _ScreenResolution.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_5 = u_xlat10_1 + u_xlat16_5;
					    u_xlat8 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -1.0, -1.0, 1.0);
					    u_xlat8 = u_xlat8 / _ScreenResolution.xyxy;
					    u_xlat10_9 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_9;
					    u_xlat10_8 = texture(_MainTex, u_xlat8.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_8;
					    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 0.0, -1.0, -1.0);
					    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
					    u_xlat10_11 = texture(_MainTex, u_xlat10.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_11;
					    u_xlat10_10 = texture(_MainTex, u_xlat10.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_10;
					    u_xlat5 = u_xlat16_5 * vec4(0.777777791, 0.777777791, 0.777777791, 0.777777791);
					    u_xlat5 = floor(u_xlat5);
					    u_xlat5 = u_xlat5 / vec4(vec4(_ColorLevel, _ColorLevel, _ColorLevel, _ColorLevel));
					    u_xlat12 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 2.0, 0.0, 2.0);
					    u_xlat12 = u_xlat12 / _ScreenResolution.xyxy;
					    u_xlat10_13 = texture(_MainTex, u_xlat12.xy);
					    u_xlat16_13 = u_xlat10_4 + u_xlat10_13;
					    u_xlat16_13 = u_xlat10_3 + u_xlat16_13;
					    u_xlat10_12 = texture(_MainTex, u_xlat12.zw);
					    u_xlat16_12 = u_xlat10_12 + u_xlat16_13;
					    u_xlat16_12 = u_xlat10_6 + u_xlat16_12;
					    u_xlat16_12 = u_xlat10_1 + u_xlat16_12;
					    u_xlat13 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 2.0, 1.0, -2.0);
					    u_xlat13 = u_xlat13 / _ScreenResolution.xyxy;
					    u_xlat10_14 = texture(_MainTex, u_xlat13.xy);
					    u_xlat16_12 = u_xlat16_12 + u_xlat10_14;
					    u_xlat16_12 = u_xlat10_8 + u_xlat16_12;
					    u_xlat16_12 = u_xlat10_11 + u_xlat16_12;
					    u_xlat16_14 = u_xlat10_3 + u_xlat10_7;
					    u_xlat10_13 = texture(_MainTex, u_xlat13.zw);
					    u_xlat16_13 = u_xlat10_13 + u_xlat16_14;
					    u_xlat16_13 = u_xlat10_1 + u_xlat16_13;
					    u_xlat16_13 = u_xlat10_9 + u_xlat16_13;
					    u_xlat14 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -2.0, -1.0, -2.0);
					    u_xlat14 = u_xlat14 / _ScreenResolution.xyxy;
					    u_xlat10_15 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_13 = u_xlat16_13 + u_xlat10_15;
					    u_xlat16_13 = u_xlat10_11 + u_xlat16_13;
					    u_xlat16_13 = u_xlat10_10 + u_xlat16_13;
					    u_xlat10_14 = texture(_MainTex, u_xlat14.zw);
					    u_xlat16_13 = u_xlat16_13 + u_xlat10_14;
					    u_xlat16_13 = u_xlat16_13 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_12 = u_xlat16_12 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat16_13);
					    u_xlat13 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, 1.0, 2.0, 0.0);
					    u_xlat13 = u_xlat13 / _ScreenResolution.xyxy;
					    u_xlat10_14 = texture(_MainTex, u_xlat13.xy);
					    u_xlat10_13 = texture(_MainTex, u_xlat13.zw);
					    u_xlat16_13 = u_xlat10_13 + u_xlat10_14;
					    u_xlat14 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, -1.0, -2.0, 1.0);
					    u_xlat14 = u_xlat14 / _ScreenResolution.xyxy;
					    u_xlat10_15 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_13 = u_xlat16_13 + u_xlat10_15;
					    u_xlat16_4 = u_xlat10_4 + u_xlat16_13;
					    u_xlat16_3 = u_xlat10_3 + u_xlat16_4;
					    u_xlat16_3 = u_xlat10_7 + u_xlat16_3;
					    u_xlat16_3 = u_xlat10_6 + u_xlat16_3;
					    u_xlat16_3 = u_xlat10_1 + u_xlat16_3;
					    u_xlat16_3 = u_xlat10_9 + u_xlat16_3;
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_6;
					    u_xlat16_1 = u_xlat10_9 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_8 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_11 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_10 + u_xlat16_1;
					    u_xlat10_4 = texture(_MainTex, u_xlat14.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_4;
					    u_xlat0 = u_xlat0 * _ScreenResolution.xyxy + vec4(-2.0, 0.0, -2.0, -1.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_4;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_0 = u_xlat16_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat16_0);
					    u_xlat16_0 = abs(u_xlat16_0) + abs(u_xlat16_12);
					    u_xlat16_0 = u_xlat16_0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.w = 2.0;
					    u_xlat1 = (-u_xlat5) + u_xlat1;
					    u_xlat1 = vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)) * u_xlat1 + u_xlat5;
					    u_xlat2.x = _EdgeSize + 0.0500000007;
					    u_xlat16_0.x = dot(u_xlat16_0, u_xlat16_0);
					    u_xlat0.x = sqrt(u_xlat16_0.x);
					    u_xlatb0 = u_xlat2.x<u_xlat0.x;
					    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    SV_Target0.w = u_xlat1.w;
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
					; Bound: 736
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %718 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %15 0 Offset 15 
					                                                      OpMemberDecorate %15 1 Offset 15 
					                                                      OpMemberDecorate %15 2 Offset 15 
					                                                      OpMemberDecorate %15 3 Offset 15 
					                                                      OpMemberDecorate %15 4 RelaxedPrecision 
					                                                      OpMemberDecorate %15 4 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %23 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %180 DescriptorSet 180 
					                                                      OpDecorate %180 Binding 180 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %184 DescriptorSet 184 
					                                                      OpDecorate %184 Binding 184 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %307 RelaxedPrecision 
					                                                      OpDecorate %308 RelaxedPrecision 
					                                                      OpDecorate %313 RelaxedPrecision 
					                                                      OpDecorate %314 RelaxedPrecision 
					                                                      OpDecorate %315 RelaxedPrecision 
					                                                      OpDecorate %316 RelaxedPrecision 
					                                                      OpDecorate %317 RelaxedPrecision 
					                                                      OpDecorate %318 RelaxedPrecision 
					                                                      OpDecorate %323 RelaxedPrecision 
					                                                      OpDecorate %324 RelaxedPrecision 
					                                                      OpDecorate %325 RelaxedPrecision 
					                                                      OpDecorate %340 RelaxedPrecision 
					                                                      OpDecorate %341 RelaxedPrecision 
					                                                      OpDecorate %342 RelaxedPrecision 
					                                                      OpDecorate %347 RelaxedPrecision 
					                                                      OpDecorate %348 RelaxedPrecision 
					                                                      OpDecorate %349 RelaxedPrecision 
					                                                      OpDecorate %350 RelaxedPrecision 
					                                                      OpDecorate %351 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %357 RelaxedPrecision 
					                                                      OpDecorate %358 RelaxedPrecision 
					                                                      OpDecorate %359 RelaxedPrecision 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %397 RelaxedPrecision 
					                                                      OpDecorate %398 RelaxedPrecision 
					                                                      OpDecorate %399 RelaxedPrecision 
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
					                                                      OpDecorate %418 RelaxedPrecision 
					                                                      OpDecorate %419 RelaxedPrecision 
					                                                      OpDecorate %420 RelaxedPrecision 
					                                                      OpDecorate %421 RelaxedPrecision 
					                                                      OpDecorate %422 RelaxedPrecision 
					                                                      OpDecorate %423 RelaxedPrecision 
					                                                      OpDecorate %424 RelaxedPrecision 
					                                                      OpDecorate %425 RelaxedPrecision 
					                                                      OpDecorate %426 RelaxedPrecision 
					                                                      OpDecorate %427 RelaxedPrecision 
					                                                      OpDecorate %443 RelaxedPrecision 
					                                                      OpDecorate %444 RelaxedPrecision 
					                                                      OpDecorate %445 RelaxedPrecision 
					                                                      OpDecorate %450 RelaxedPrecision 
					                                                      OpDecorate %451 RelaxedPrecision 
					                                                      OpDecorate %452 RelaxedPrecision 
					                                                      OpDecorate %453 RelaxedPrecision 
					                                                      OpDecorate %454 RelaxedPrecision 
					                                                      OpDecorate %455 RelaxedPrecision 
					                                                      OpDecorate %456 RelaxedPrecision 
					                                                      OpDecorate %457 RelaxedPrecision 
					                                                      OpDecorate %458 RelaxedPrecision 
					                                                      OpDecorate %459 RelaxedPrecision 
					                                                      OpDecorate %460 RelaxedPrecision 
					                                                      OpDecorate %461 RelaxedPrecision 
					                                                      OpDecorate %462 RelaxedPrecision 
					                                                      OpDecorate %463 RelaxedPrecision 
					                                                      OpDecorate %464 RelaxedPrecision 
					                                                      OpDecorate %469 RelaxedPrecision 
					                                                      OpDecorate %470 RelaxedPrecision 
					                                                      OpDecorate %471 RelaxedPrecision 
					                                                      OpDecorate %472 RelaxedPrecision 
					                                                      OpDecorate %473 RelaxedPrecision 
					                                                      OpDecorate %474 RelaxedPrecision 
					                                                      OpDecorate %475 RelaxedPrecision 
					                                                      OpDecorate %476 RelaxedPrecision 
					                                                      OpDecorate %477 RelaxedPrecision 
					                                                      OpDecorate %492 RelaxedPrecision 
					                                                      OpDecorate %493 RelaxedPrecision 
					                                                      OpDecorate %494 RelaxedPrecision 
					                                                      OpDecorate %499 RelaxedPrecision 
					                                                      OpDecorate %500 RelaxedPrecision 
					                                                      OpDecorate %501 RelaxedPrecision 
					                                                      OpDecorate %502 RelaxedPrecision 
					                                                      OpDecorate %503 RelaxedPrecision 
					                                                      OpDecorate %504 RelaxedPrecision 
					                                                      OpDecorate %505 RelaxedPrecision 
					                                                      OpDecorate %506 RelaxedPrecision 
					                                                      OpDecorate %507 RelaxedPrecision 
					                                                      OpDecorate %508 RelaxedPrecision 
					                                                      OpDecorate %509 RelaxedPrecision 
					                                                      OpDecorate %514 RelaxedPrecision 
					                                                      OpDecorate %515 RelaxedPrecision 
					                                                      OpDecorate %516 RelaxedPrecision 
					                                                      OpDecorate %517 RelaxedPrecision 
					                                                      OpDecorate %520 RelaxedPrecision 
					                                                      OpDecorate %521 RelaxedPrecision 
					                                                      OpDecorate %522 RelaxedPrecision 
					                                                      OpDecorate %523 RelaxedPrecision 
					                                                      OpDecorate %524 RelaxedPrecision 
					                                                      OpDecorate %525 RelaxedPrecision 
					                                                      OpDecorate %539 RelaxedPrecision 
					                                                      OpDecorate %540 RelaxedPrecision 
					                                                      OpDecorate %545 RelaxedPrecision 
					                                                      OpDecorate %546 RelaxedPrecision 
					                                                      OpDecorate %551 RelaxedPrecision 
					                                                      OpDecorate %552 RelaxedPrecision 
					                                                      OpDecorate %553 RelaxedPrecision 
					                                                      OpDecorate %567 RelaxedPrecision 
					                                                      OpDecorate %568 RelaxedPrecision 
					                                                      OpDecorate %573 RelaxedPrecision 
					                                                      OpDecorate %574 RelaxedPrecision 
					                                                      OpDecorate %575 RelaxedPrecision 
					                                                      OpDecorate %576 RelaxedPrecision 
					                                                      OpDecorate %577 RelaxedPrecision 
					                                                      OpDecorate %578 RelaxedPrecision 
					                                                      OpDecorate %579 RelaxedPrecision 
					                                                      OpDecorate %580 RelaxedPrecision 
					                                                      OpDecorate %581 RelaxedPrecision 
					                                                      OpDecorate %582 RelaxedPrecision 
					                                                      OpDecorate %583 RelaxedPrecision 
					                                                      OpDecorate %584 RelaxedPrecision 
					                                                      OpDecorate %585 RelaxedPrecision 
					                                                      OpDecorate %586 RelaxedPrecision 
					                                                      OpDecorate %587 RelaxedPrecision 
					                                                      OpDecorate %588 RelaxedPrecision 
					                                                      OpDecorate %589 RelaxedPrecision 
					                                                      OpDecorate %590 RelaxedPrecision 
					                                                      OpDecorate %591 RelaxedPrecision 
					                                                      OpDecorate %592 RelaxedPrecision 
					                                                      OpDecorate %593 RelaxedPrecision 
					                                                      OpDecorate %594 RelaxedPrecision 
					                                                      OpDecorate %595 RelaxedPrecision 
					                                                      OpDecorate %596 RelaxedPrecision 
					                                                      OpDecorate %597 RelaxedPrecision 
					                                                      OpDecorate %598 RelaxedPrecision 
					                                                      OpDecorate %599 RelaxedPrecision 
					                                                      OpDecorate %600 RelaxedPrecision 
					                                                      OpDecorate %601 RelaxedPrecision 
					                                                      OpDecorate %602 RelaxedPrecision 
					                                                      OpDecorate %603 RelaxedPrecision 
					                                                      OpDecorate %604 RelaxedPrecision 
					                                                      OpDecorate %605 RelaxedPrecision 
					                                                      OpDecorate %606 RelaxedPrecision 
					                                                      OpDecorate %607 RelaxedPrecision 
					                                                      OpDecorate %608 RelaxedPrecision 
					                                                      OpDecorate %609 RelaxedPrecision 
					                                                      OpDecorate %610 RelaxedPrecision 
					                                                      OpDecorate %611 RelaxedPrecision 
					                                                      OpDecorate %612 RelaxedPrecision 
					                                                      OpDecorate %613 RelaxedPrecision 
					                                                      OpDecorate %618 RelaxedPrecision 
					                                                      OpDecorate %619 RelaxedPrecision 
					                                                      OpDecorate %620 RelaxedPrecision 
					                                                      OpDecorate %633 RelaxedPrecision 
					                                                      OpDecorate %634 RelaxedPrecision 
					                                                      OpDecorate %639 RelaxedPrecision 
					                                                      OpDecorate %640 RelaxedPrecision 
					                                                      OpDecorate %641 RelaxedPrecision 
					                                                      OpDecorate %642 RelaxedPrecision 
					                                                      OpDecorate %643 RelaxedPrecision 
					                                                      OpDecorate %644 RelaxedPrecision 
					                                                      OpDecorate %649 RelaxedPrecision 
					                                                      OpDecorate %650 RelaxedPrecision 
					                                                      OpDecorate %651 RelaxedPrecision 
					                                                      OpDecorate %652 RelaxedPrecision 
					                                                      OpDecorate %653 RelaxedPrecision 
					                                                      OpDecorate %654 RelaxedPrecision 
					                                                      OpDecorate %655 RelaxedPrecision 
					                                                      OpDecorate %656 RelaxedPrecision 
					                                                      OpDecorate %657 RelaxedPrecision 
					                                                      OpDecorate %658 RelaxedPrecision 
					                                                      OpDecorate %659 RelaxedPrecision 
					                                                      OpDecorate %660 RelaxedPrecision 
					                                                      OpDecorate %661 RelaxedPrecision 
					                                                      OpDecorate %662 RelaxedPrecision 
					                                                      OpDecorate %663 RelaxedPrecision 
					                                                      OpDecorate %664 RelaxedPrecision 
					                                                      OpDecorate %665 RelaxedPrecision 
					                                                      OpDecorate %668 RelaxedPrecision 
					                                                      OpDecorate %703 RelaxedPrecision 
					                                                      OpDecorate %704 RelaxedPrecision 
					                                                      OpDecorate %705 RelaxedPrecision 
					                                                      OpDecorate %708 RelaxedPrecision 
					                                                      OpDecorate %709 RelaxedPrecision 
					                                                      OpDecorate %718 Location 718 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %15 = OpTypeStruct %6 %7 %6 %6 %7 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32_4; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 4 
					                                              %20 = OpTypePointer Uniform %7 
					                                              %29 = OpTypeInt 32 0 
					                                          u32 %30 = OpConstant 6 
					                                              %31 = OpTypeArray %7 %30 
					                                              %32 = OpTypePointer Private %31 
					                            Private f32_4[6]* %33 = OpVariable Private 
					                                          i32 %34 = OpConstant 5 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                          u32 %36 = OpConstant 0 
					                                              %37 = OpTypePointer Private %6 
					                                          i32 %39 = OpConstant 2 
					                                          f32 %40 = OpConstant 3,674022E-40 
					                                          i32 %42 = OpConstant 1 
					                                          i32 %44 = OpConstant 3 
					                                          i32 %46 = OpConstant 0 
					                               Private f32_4* %49 = OpVariable Private 
					                                              %58 = OpTypeVector %6 3 
					                                              %59 = OpTypePointer Private %58 
					                               Private f32_3* %60 = OpVariable Private 
					                                          u32 %62 = OpConstant 1 
					                                          u32 %64 = OpConstant 2 
					                                              %66 = OpTypePointer Private %18 
					                                 Private i32* %67 = OpVariable Private 
					                                          i32 %68 = OpConstant -2 
					                                              %74 = OpTypeBool 
					                                         bool %75 = OpConstantTrue 
					                                              %76 = OpTypePointer Private %74 
					                                Private bool* %77 = OpVariable Private 
					                                              %84 = OpTypeVector %18 2 
					                                              %85 = OpTypePointer Private %84 
					                               Private i32_2* %86 = OpVariable Private 
					                                        i32_2 %89 = OpConstantComposite %39 %42 
					                                 Private f32* %91 = OpVariable Private 
					                                 Private f32* %96 = OpVariable Private 
					                                              %99 = OpTypePointer Private %10 
					                              Private f32_2* %100 = OpVariable Private 
					                                             %103 = OpTypePointer Uniform %6 
					                              Private f32_4* %114 = OpVariable Private 
					                                Private i32* %118 = OpVariable Private 
					                               Private bool* %124 = OpVariable Private 
					                              Private i32_2* %131 = OpVariable Private 
					                                Private f32* %135 = OpVariable Private 
					                              Private f32_4* %143 = OpVariable Private 
					                              Private f32_3* %177 = OpVariable Private 
					                                             %178 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %179 = OpTypePointer UniformConstant %178 
					        UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
					                                             %182 = OpTypeSampler 
					                                             %183 = OpTypePointer UniformConstant %182 
					                    UniformConstant sampler* %184 = OpVariable UniformConstant 
					                                             %186 = OpTypeSampledImage %178 
					                                         f32 %213 = OpConstant 3,674022E-40 
					                                       f32_4 %214 = OpConstantComposite %213 %213 %213 %35 
					                              Private f32_4* %221 = OpVariable Private 
					                              Private f32_4* %228 = OpVariable Private 
					                              Private f32_4* %235 = OpVariable Private 
					                              Private f32_4* %239 = OpVariable Private 
					                                         f32 %246 = OpConstant 3,674022E-40 
					                                       f32_4 %247 = OpConstantComposite %213 %246 %35 %213 
					                              Private f32_4* %254 = OpVariable Private 
					                              Private f32_4* %264 = OpVariable Private 
					                              Private f32_4* %282 = OpVariable Private 
					                              Private f32_4* %292 = OpVariable Private 
					                                       f32_4 %299 = OpConstantComposite %35 %246 %246 %213 
					                              Private f32_4* %306 = OpVariable Private 
					                              Private f32_4* %316 = OpVariable Private 
					                              Private f32_4* %326 = OpVariable Private 
					                                       f32_4 %333 = OpConstantComposite %246 %35 %246 %246 
					                              Private f32_4* %340 = OpVariable Private 
					                              Private f32_4* %350 = OpVariable Private 
					                                         f32 %361 = OpConstant 3,674022E-40 
					                                       f32_4 %362 = OpConstantComposite %361 %361 %361 %361 
					                              Private f32_4* %382 = OpVariable Private 
					                                         f32 %389 = OpConstant 3,674022E-40 
					                                       f32_4 %390 = OpConstantComposite %213 %389 %35 %389 
					                              Private f32_4* %397 = OpVariable Private 
					                              Private f32_4* %404 = OpVariable Private 
					                              Private f32_4* %411 = OpVariable Private 
					                              Private f32_4* %418 = OpVariable Private 
					                              Private f32_4* %428 = OpVariable Private 
					                                         f32 %435 = OpConstant 3,674022E-40 
					                                       f32_4 %436 = OpConstantComposite %246 %389 %213 %435 
					                              Private f32_4* %443 = OpVariable Private 
					                              Private f32_4* %459 = OpVariable Private 
					                              Private f32_4* %478 = OpVariable Private 
					                                       f32_4 %485 = OpConstantComposite %35 %435 %246 %435 
					                              Private f32_4* %492 = OpVariable Private 
					                                         f32 %518 = OpConstant 3,674022E-40 
					                                       f32_4 %519 = OpConstantComposite %518 %518 %518 %518 
					                                       f32_4 %532 = OpConstantComposite %389 %213 %389 %35 
					                                       f32_4 %560 = OpConstantComposite %389 %246 %435 %213 
					                              Private f32_4* %576 = OpVariable Private 
					                              Private f32_4* %580 = OpVariable Private 
					                              Private f32_4* %596 = OpVariable Private 
					                                       f32_4 %626 = OpConstantComposite %435 %35 %435 %246 
					                              Private f32_4* %642 = OpVariable Private 
					                              Private f32_4* %649 = OpVariable Private 
					                                         f32 %666 = OpConstant 3,674022E-40 
					                                       f32_4 %667 = OpConstantComposite %666 %666 %666 %666 
					                                       f32_3 %670 = OpConstantComposite %666 %666 %666 
					                                         u32 %674 = OpConstant 3 
					                                         f32 %700 = OpConstant 3,674022E-40 
					                               Private bool* %711 = OpVariable Private 
					                                             %717 = OpTypePointer Output %7 
					                               Output f32_4* %718 = OpVariable Output 
					                                             %720 = OpTypePointer Function %58 
					                                       f32_3 %724 = OpConstantComposite %35 %35 %35 
					                                             %733 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                             Function f32_3* %721 = OpVariable Function 
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
					                                 Private f32* %38 = OpAccessChain %33 %34 %36 
					                                                      OpStore %38 %35 
					                                 Private f32* %41 = OpAccessChain %33 %39 %36 
					                                                      OpStore %41 %40 
					                                 Private f32* %43 = OpAccessChain %33 %42 %36 
					                                                      OpStore %43 %40 
					                                 Private f32* %45 = OpAccessChain %33 %44 %36 
					                                                      OpStore %45 %40 
					                                 Private f32* %47 = OpAccessChain %33 %46 %36 
					                                                      OpStore %47 %40 
					                                 Private f32* %48 = OpAccessChain %33 %19 %36 
					                                                      OpStore %48 %40 
					                                        f32_4 %50 = OpLoad %9 
					                                        f32_2 %51 = OpVectorShuffle %50 %50 2 3 
					                               Uniform f32_4* %52 = OpAccessChain %17 %42 
					                                        f32_4 %53 = OpLoad %52 
					                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
					                                        f32_2 %55 = OpFMul %51 %54 
					                                        f32_4 %56 = OpLoad %49 
					                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
					                                                      OpStore %49 %57 
					                                 Private f32* %61 = OpAccessChain %60 %36 
					                                                      OpStore %61 %35 
					                                 Private f32* %63 = OpAccessChain %60 %62 
					                                                      OpStore %63 %35 
					                                 Private f32* %65 = OpAccessChain %60 %64 
					                                                      OpStore %65 %35 
					                                                      OpStore %67 %68 
					                                                      OpBranch %69 
					                                              %69 = OpLabel 
					                                                      OpLoopMerge %71 %72 None 
					                                                      OpBranch %73 
					                                              %73 = OpLabel 
					                                                      OpBranchConditional %75 %70 %71 
					                                              %70 = OpLabel 
					                                          i32 %78 = OpLoad %67 
					                                         bool %79 = OpSLessThan %39 %78 
					                                                      OpStore %77 %79 
					                                         bool %80 = OpLoad %77 
					                                                      OpSelectionMerge %82 None 
					                                                      OpBranchConditional %80 %81 %82 
					                                              %81 = OpLabel 
					                                                      OpBranch %71 
					                                              %82 = OpLabel 
					                                          i32 %87 = OpLoad %67 
					                                        i32_2 %88 = OpCompositeConstruct %87 %87 
					                                        i32_2 %90 = OpIAdd %88 %89 
					                                                      OpStore %86 %90 
					                                 Private i32* %92 = OpAccessChain %86 %36 
					                                          i32 %93 = OpLoad %92 
					                                 Private f32* %94 = OpAccessChain %33 %93 %36 
					                                          f32 %95 = OpLoad %94 
					                                                      OpStore %91 %95 
					                                          i32 %97 = OpLoad %67 
					                                          f32 %98 = OpConvertSToF %97 
					                                                      OpStore %96 %98 
					                                         f32 %101 = OpLoad %96 
					                                       f32_2 %102 = OpCompositeConstruct %101 %101 
					                                Uniform f32* %104 = OpAccessChain %17 %46 
					                                         f32 %105 = OpLoad %104 
					                                Uniform f32* %106 = OpAccessChain %17 %46 
					                                         f32 %107 = OpLoad %106 
					                                       f32_2 %108 = OpCompositeConstruct %105 %107 
					                                         f32 %109 = OpCompositeExtract %108 0 
					                                         f32 %110 = OpCompositeExtract %108 1 
					                                       f32_2 %111 = OpCompositeConstruct %109 %110 
					                                         f32 %112 = OpDot %102 %111 
					                                Private f32* %113 = OpAccessChain %100 %36 
					                                                      OpStore %113 %112 
					                                       f32_3 %115 = OpLoad %60 
					                                       f32_4 %116 = OpLoad %114 
					                                       f32_4 %117 = OpVectorShuffle %116 %115 4 1 5 6 
					                                                      OpStore %114 %117 
					                                                      OpStore %118 %68 
					                                                      OpBranch %119 
					                                             %119 = OpLabel 
					                                                      OpLoopMerge %121 %122 None 
					                                                      OpBranch %123 
					                                             %123 = OpLabel 
					                                                      OpBranchConditional %75 %120 %121 
					                                             %120 = OpLabel 
					                                         i32 %125 = OpLoad %118 
					                                        bool %126 = OpSLessThan %39 %125 
					                                                      OpStore %124 %126 
					                                        bool %127 = OpLoad %124 
					                                                      OpSelectionMerge %129 None 
					                                                      OpBranchConditional %127 %128 %129 
					                                             %128 = OpLabel 
					                                                      OpBranch %121 
					                                             %129 = OpLabel 
					                                         i32 %132 = OpLoad %118 
					                                       i32_2 %133 = OpCompositeConstruct %132 %132 
					                                       i32_2 %134 = OpIAdd %133 %89 
					                                                      OpStore %131 %134 
					                                Private i32* %136 = OpAccessChain %131 %36 
					                                         i32 %137 = OpLoad %136 
					                                Private f32* %138 = OpAccessChain %33 %137 %36 
					                                         f32 %139 = OpLoad %138 
					                                                      OpStore %135 %139 
					                                         f32 %140 = OpLoad %91 
					                                         f32 %141 = OpLoad %135 
					                                         f32 %142 = OpFMul %140 %141 
					                                                      OpStore %135 %142 
					                                         i32 %144 = OpLoad %118 
					                                         f32 %145 = OpConvertSToF %144 
					                                Private f32* %146 = OpAccessChain %143 %36 
					                                                      OpStore %146 %145 
					                                       f32_4 %147 = OpLoad %143 
					                                       f32_2 %148 = OpVectorShuffle %147 %147 0 0 
					                                Uniform f32* %149 = OpAccessChain %17 %46 
					                                         f32 %150 = OpLoad %149 
					                                Uniform f32* %151 = OpAccessChain %17 %46 
					                                         f32 %152 = OpLoad %151 
					                                       f32_2 %153 = OpCompositeConstruct %150 %152 
					                                         f32 %154 = OpCompositeExtract %153 0 
					                                         f32 %155 = OpCompositeExtract %153 1 
					                                       f32_2 %156 = OpCompositeConstruct %154 %155 
					                                         f32 %157 = OpDot %148 %156 
					                                Private f32* %158 = OpAccessChain %100 %62 
					                                                      OpStore %158 %157 
					                                       f32_4 %159 = OpLoad %9 
					                                       f32_2 %160 = OpVectorShuffle %159 %159 2 3 
					                              Uniform f32_4* %161 = OpAccessChain %17 %42 
					                                       f32_4 %162 = OpLoad %161 
					                                       f32_2 %163 = OpVectorShuffle %162 %162 0 1 
					                                       f32_2 %164 = OpFMul %160 %163 
					                                       f32_2 %165 = OpLoad %100 
					                                       f32_2 %166 = OpFAdd %164 %165 
					                                       f32_4 %167 = OpLoad %143 
					                                       f32_4 %168 = OpVectorShuffle %167 %166 4 5 2 3 
					                                                      OpStore %143 %168 
					                                       f32_4 %169 = OpLoad %143 
					                                       f32_2 %170 = OpVectorShuffle %169 %169 0 1 
					                              Uniform f32_4* %171 = OpAccessChain %17 %42 
					                                       f32_4 %172 = OpLoad %171 
					                                       f32_2 %173 = OpVectorShuffle %172 %172 0 1 
					                                       f32_2 %174 = OpFDiv %170 %173 
					                                       f32_4 %175 = OpLoad %143 
					                                       f32_4 %176 = OpVectorShuffle %175 %174 4 5 2 3 
					                                                      OpStore %143 %176 
					                         read_only Texture2D %181 = OpLoad %180 
					                                     sampler %185 = OpLoad %184 
					                  read_only Texture2DSampled %187 = OpSampledImage %181 %185 
					                                       f32_4 %188 = OpLoad %143 
					                                       f32_2 %189 = OpVectorShuffle %188 %188 0 1 
					                                       f32_4 %190 = OpImageSampleImplicitLod %187 %189 
					                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
					                                                      OpStore %177 %191 
					                                         f32 %192 = OpLoad %135 
					                                       f32_3 %193 = OpCompositeConstruct %192 %192 %192 
					                                       f32_3 %194 = OpLoad %177 
					                                       f32_3 %195 = OpFMul %193 %194 
					                                       f32_4 %196 = OpLoad %114 
					                                       f32_3 %197 = OpVectorShuffle %196 %196 0 2 3 
					                                       f32_3 %198 = OpFAdd %195 %197 
					                                       f32_4 %199 = OpLoad %114 
					                                       f32_4 %200 = OpVectorShuffle %199 %198 4 1 5 6 
					                                                      OpStore %114 %200 
					                                Private i32* %201 = OpAccessChain %131 %62 
					                                         i32 %202 = OpLoad %201 
					                                                      OpStore %118 %202 
					                                                      OpBranch %122 
					                                             %122 = OpLabel 
					                                                      OpBranch %119 
					                                             %121 = OpLabel 
					                                       f32_4 %203 = OpLoad %114 
					                                       f32_3 %204 = OpVectorShuffle %203 %203 0 2 3 
					                                                      OpStore %60 %204 
					                                Private i32* %205 = OpAccessChain %86 %62 
					                                         i32 %206 = OpLoad %205 
					                                                      OpStore %67 %206 
					                                                      OpBranch %72 
					                                              %72 = OpLabel 
					                                                      OpBranch %69 
					                                              %71 = OpLabel 
					                                       f32_4 %207 = OpLoad %9 
					                                       f32_4 %208 = OpVectorShuffle %207 %207 2 3 2 3 
					                              Uniform f32_4* %209 = OpAccessChain %17 %42 
					                                       f32_4 %210 = OpLoad %209 
					                                       f32_4 %211 = OpVectorShuffle %210 %210 0 1 0 1 
					                                       f32_4 %212 = OpFMul %208 %211 
					                                       f32_4 %215 = OpFAdd %212 %214 
					                                                      OpStore %114 %215 
					                                       f32_4 %216 = OpLoad %114 
					                              Uniform f32_4* %217 = OpAccessChain %17 %42 
					                                       f32_4 %218 = OpLoad %217 
					                                       f32_4 %219 = OpVectorShuffle %218 %218 0 1 0 1 
					                                       f32_4 %220 = OpFDiv %216 %219 
					                                                      OpStore %114 %220 
					                         read_only Texture2D %222 = OpLoad %180 
					                                     sampler %223 = OpLoad %184 
					                  read_only Texture2DSampled %224 = OpSampledImage %222 %223 
					                                       f32_4 %225 = OpLoad %114 
					                                       f32_2 %226 = OpVectorShuffle %225 %225 0 1 
					                                       f32_4 %227 = OpImageSampleImplicitLod %224 %226 
					                                                      OpStore %221 %227 
					                         read_only Texture2D %229 = OpLoad %180 
					                                     sampler %230 = OpLoad %184 
					                  read_only Texture2DSampled %231 = OpSampledImage %229 %230 
					                                       f32_4 %232 = OpLoad %114 
					                                       f32_2 %233 = OpVectorShuffle %232 %232 2 3 
					                                       f32_4 %234 = OpImageSampleImplicitLod %231 %233 
					                                                      OpStore %228 %234 
					                                       f32_4 %236 = OpLoad %228 
					                                       f32_4 %237 = OpLoad %221 
					                                       f32_4 %238 = OpFAdd %236 %237 
					                                                      OpStore %235 %238 
					                                       f32_4 %240 = OpLoad %9 
					                                       f32_4 %241 = OpVectorShuffle %240 %240 2 3 2 3 
					                              Uniform f32_4* %242 = OpAccessChain %17 %42 
					                                       f32_4 %243 = OpLoad %242 
					                                       f32_4 %244 = OpVectorShuffle %243 %243 0 1 0 1 
					                                       f32_4 %245 = OpFMul %241 %244 
					                                       f32_4 %248 = OpFAdd %245 %247 
					                                                      OpStore %239 %248 
					                                       f32_4 %249 = OpLoad %239 
					                              Uniform f32_4* %250 = OpAccessChain %17 %42 
					                                       f32_4 %251 = OpLoad %250 
					                                       f32_4 %252 = OpVectorShuffle %251 %251 0 1 0 1 
					                                       f32_4 %253 = OpFDiv %249 %252 
					                                                      OpStore %239 %253 
					                         read_only Texture2D %255 = OpLoad %180 
					                                     sampler %256 = OpLoad %184 
					                  read_only Texture2DSampled %257 = OpSampledImage %255 %256 
					                                       f32_4 %258 = OpLoad %239 
					                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
					                                       f32_4 %260 = OpImageSampleImplicitLod %257 %259 
					                                                      OpStore %254 %260 
					                                       f32_4 %261 = OpLoad %235 
					                                       f32_4 %262 = OpLoad %254 
					                                       f32_4 %263 = OpFAdd %261 %262 
					                                                      OpStore %235 %263 
					                         read_only Texture2D %265 = OpLoad %180 
					                                     sampler %266 = OpLoad %184 
					                  read_only Texture2DSampled %267 = OpSampledImage %265 %266 
					                                       f32_4 %268 = OpLoad %239 
					                                       f32_2 %269 = OpVectorShuffle %268 %268 2 3 
					                                       f32_4 %270 = OpImageSampleImplicitLod %267 %269 
					                                                      OpStore %264 %270 
					                                       f32_4 %271 = OpLoad %235 
					                                       f32_4 %272 = OpLoad %264 
					                                       f32_4 %273 = OpFAdd %271 %272 
					                                                      OpStore %235 %273 
					                                       f32_4 %274 = OpLoad %49 
					                                       f32_2 %275 = OpVectorShuffle %274 %274 0 1 
					                              Uniform f32_4* %276 = OpAccessChain %17 %42 
					                                       f32_4 %277 = OpLoad %276 
					                                       f32_2 %278 = OpVectorShuffle %277 %277 0 1 
					                                       f32_2 %279 = OpFDiv %275 %278 
					                                       f32_4 %280 = OpLoad %49 
					                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
					                                                      OpStore %49 %281 
					                         read_only Texture2D %283 = OpLoad %180 
					                                     sampler %284 = OpLoad %184 
					                  read_only Texture2DSampled %285 = OpSampledImage %283 %284 
					                                       f32_4 %286 = OpLoad %49 
					                                       f32_2 %287 = OpVectorShuffle %286 %286 0 1 
					                                       f32_4 %288 = OpImageSampleImplicitLod %285 %287 
					                                                      OpStore %282 %288 
					                                       f32_4 %289 = OpLoad %282 
					                                       f32_4 %290 = OpLoad %235 
					                                       f32_4 %291 = OpFAdd %289 %290 
					                                                      OpStore %235 %291 
					                                       f32_4 %293 = OpLoad %9 
					                                       f32_4 %294 = OpVectorShuffle %293 %293 2 3 2 3 
					                              Uniform f32_4* %295 = OpAccessChain %17 %42 
					                                       f32_4 %296 = OpLoad %295 
					                                       f32_4 %297 = OpVectorShuffle %296 %296 0 1 0 1 
					                                       f32_4 %298 = OpFMul %294 %297 
					                                       f32_4 %300 = OpFAdd %298 %299 
					                                                      OpStore %292 %300 
					                                       f32_4 %301 = OpLoad %292 
					                              Uniform f32_4* %302 = OpAccessChain %17 %42 
					                                       f32_4 %303 = OpLoad %302 
					                                       f32_4 %304 = OpVectorShuffle %303 %303 0 1 0 1 
					                                       f32_4 %305 = OpFDiv %301 %304 
					                                                      OpStore %292 %305 
					                         read_only Texture2D %307 = OpLoad %180 
					                                     sampler %308 = OpLoad %184 
					                  read_only Texture2DSampled %309 = OpSampledImage %307 %308 
					                                       f32_4 %310 = OpLoad %292 
					                                       f32_2 %311 = OpVectorShuffle %310 %310 0 1 
					                                       f32_4 %312 = OpImageSampleImplicitLod %309 %311 
					                                                      OpStore %306 %312 
					                                       f32_4 %313 = OpLoad %235 
					                                       f32_4 %314 = OpLoad %306 
					                                       f32_4 %315 = OpFAdd %313 %314 
					                                                      OpStore %235 %315 
					                         read_only Texture2D %317 = OpLoad %180 
					                                     sampler %318 = OpLoad %184 
					                  read_only Texture2DSampled %319 = OpSampledImage %317 %318 
					                                       f32_4 %320 = OpLoad %292 
					                                       f32_2 %321 = OpVectorShuffle %320 %320 2 3 
					                                       f32_4 %322 = OpImageSampleImplicitLod %319 %321 
					                                                      OpStore %316 %322 
					                                       f32_4 %323 = OpLoad %235 
					                                       f32_4 %324 = OpLoad %316 
					                                       f32_4 %325 = OpFAdd %323 %324 
					                                                      OpStore %235 %325 
					                                       f32_4 %327 = OpLoad %9 
					                                       f32_4 %328 = OpVectorShuffle %327 %327 2 3 2 3 
					                              Uniform f32_4* %329 = OpAccessChain %17 %42 
					                                       f32_4 %330 = OpLoad %329 
					                                       f32_4 %331 = OpVectorShuffle %330 %330 0 1 0 1 
					                                       f32_4 %332 = OpFMul %328 %331 
					                                       f32_4 %334 = OpFAdd %332 %333 
					                                                      OpStore %326 %334 
					                                       f32_4 %335 = OpLoad %326 
					                              Uniform f32_4* %336 = OpAccessChain %17 %42 
					                                       f32_4 %337 = OpLoad %336 
					                                       f32_4 %338 = OpVectorShuffle %337 %337 0 1 0 1 
					                                       f32_4 %339 = OpFDiv %335 %338 
					                                                      OpStore %326 %339 
					                         read_only Texture2D %341 = OpLoad %180 
					                                     sampler %342 = OpLoad %184 
					                  read_only Texture2DSampled %343 = OpSampledImage %341 %342 
					                                       f32_4 %344 = OpLoad %326 
					                                       f32_2 %345 = OpVectorShuffle %344 %344 0 1 
					                                       f32_4 %346 = OpImageSampleImplicitLod %343 %345 
					                                                      OpStore %340 %346 
					                                       f32_4 %347 = OpLoad %235 
					                                       f32_4 %348 = OpLoad %340 
					                                       f32_4 %349 = OpFAdd %347 %348 
					                                                      OpStore %235 %349 
					                         read_only Texture2D %351 = OpLoad %180 
					                                     sampler %352 = OpLoad %184 
					                  read_only Texture2DSampled %353 = OpSampledImage %351 %352 
					                                       f32_4 %354 = OpLoad %326 
					                                       f32_2 %355 = OpVectorShuffle %354 %354 2 3 
					                                       f32_4 %356 = OpImageSampleImplicitLod %353 %355 
					                                                      OpStore %350 %356 
					                                       f32_4 %357 = OpLoad %235 
					                                       f32_4 %358 = OpLoad %350 
					                                       f32_4 %359 = OpFAdd %357 %358 
					                                                      OpStore %235 %359 
					                                       f32_4 %360 = OpLoad %235 
					                                       f32_4 %363 = OpFMul %360 %362 
					                                                      OpStore %143 %363 
					                                       f32_4 %364 = OpLoad %143 
					                                       f32_4 %365 = OpExtInst %1 8 %364 
					                                                      OpStore %143 %365 
					                                       f32_4 %366 = OpLoad %143 
					                                Uniform f32* %367 = OpAccessChain %17 %44 
					                                         f32 %368 = OpLoad %367 
					                                Uniform f32* %369 = OpAccessChain %17 %44 
					                                         f32 %370 = OpLoad %369 
					                                Uniform f32* %371 = OpAccessChain %17 %44 
					                                         f32 %372 = OpLoad %371 
					                                Uniform f32* %373 = OpAccessChain %17 %44 
					                                         f32 %374 = OpLoad %373 
					                                       f32_4 %375 = OpCompositeConstruct %368 %370 %372 %374 
					                                         f32 %376 = OpCompositeExtract %375 0 
					                                         f32 %377 = OpCompositeExtract %375 1 
					                                         f32 %378 = OpCompositeExtract %375 2 
					                                         f32 %379 = OpCompositeExtract %375 3 
					                                       f32_4 %380 = OpCompositeConstruct %376 %377 %378 %379 
					                                       f32_4 %381 = OpFDiv %366 %380 
					                                                      OpStore %143 %381 
					                                       f32_4 %383 = OpLoad %9 
					                                       f32_4 %384 = OpVectorShuffle %383 %383 2 3 2 3 
					                              Uniform f32_4* %385 = OpAccessChain %17 %42 
					                                       f32_4 %386 = OpLoad %385 
					                                       f32_4 %387 = OpVectorShuffle %386 %386 0 1 0 1 
					                                       f32_4 %388 = OpFMul %384 %387 
					                                       f32_4 %391 = OpFAdd %388 %390 
					                                                      OpStore %382 %391 
					                                       f32_4 %392 = OpLoad %382 
					                              Uniform f32_4* %393 = OpAccessChain %17 %42 
					                                       f32_4 %394 = OpLoad %393 
					                                       f32_4 %395 = OpVectorShuffle %394 %394 0 1 0 1 
					                                       f32_4 %396 = OpFDiv %392 %395 
					                                                      OpStore %382 %396 
					                         read_only Texture2D %398 = OpLoad %180 
					                                     sampler %399 = OpLoad %184 
					                  read_only Texture2DSampled %400 = OpSampledImage %398 %399 
					                                       f32_4 %401 = OpLoad %382 
					                                       f32_2 %402 = OpVectorShuffle %401 %401 0 1 
					                                       f32_4 %403 = OpImageSampleImplicitLod %400 %402 
					                                                      OpStore %397 %403 
					                                       f32_4 %405 = OpLoad %221 
					                                       f32_4 %406 = OpLoad %397 
					                                       f32_4 %407 = OpFAdd %405 %406 
					                                                      OpStore %404 %407 
					                                       f32_4 %408 = OpLoad %228 
					                                       f32_4 %409 = OpLoad %404 
					                                       f32_4 %410 = OpFAdd %408 %409 
					                                                      OpStore %404 %410 
					                         read_only Texture2D %412 = OpLoad %180 
					                                     sampler %413 = OpLoad %184 
					                  read_only Texture2DSampled %414 = OpSampledImage %412 %413 
					                                       f32_4 %415 = OpLoad %382 
					                                       f32_2 %416 = OpVectorShuffle %415 %415 2 3 
					                                       f32_4 %417 = OpImageSampleImplicitLod %414 %416 
					                                                      OpStore %411 %417 
					                                       f32_4 %419 = OpLoad %411 
					                                       f32_4 %420 = OpLoad %404 
					                                       f32_4 %421 = OpFAdd %419 %420 
					                                                      OpStore %418 %421 
					                                       f32_4 %422 = OpLoad %264 
					                                       f32_4 %423 = OpLoad %418 
					                                       f32_4 %424 = OpFAdd %422 %423 
					                                                      OpStore %418 %424 
					                                       f32_4 %425 = OpLoad %282 
					                                       f32_4 %426 = OpLoad %418 
					                                       f32_4 %427 = OpFAdd %425 %426 
					                                                      OpStore %418 %427 
					                                       f32_4 %429 = OpLoad %9 
					                                       f32_4 %430 = OpVectorShuffle %429 %429 2 3 2 3 
					                              Uniform f32_4* %431 = OpAccessChain %17 %42 
					                                       f32_4 %432 = OpLoad %431 
					                                       f32_4 %433 = OpVectorShuffle %432 %432 0 1 0 1 
					                                       f32_4 %434 = OpFMul %430 %433 
					                                       f32_4 %437 = OpFAdd %434 %436 
					                                                      OpStore %428 %437 
					                                       f32_4 %438 = OpLoad %428 
					                              Uniform f32_4* %439 = OpAccessChain %17 %42 
					                                       f32_4 %440 = OpLoad %439 
					                                       f32_4 %441 = OpVectorShuffle %440 %440 0 1 0 1 
					                                       f32_4 %442 = OpFDiv %438 %441 
					                                                      OpStore %428 %442 
					                         read_only Texture2D %444 = OpLoad %180 
					                                     sampler %445 = OpLoad %184 
					                  read_only Texture2DSampled %446 = OpSampledImage %444 %445 
					                                       f32_4 %447 = OpLoad %428 
					                                       f32_2 %448 = OpVectorShuffle %447 %447 0 1 
					                                       f32_4 %449 = OpImageSampleImplicitLod %446 %448 
					                                                      OpStore %443 %449 
					                                       f32_4 %450 = OpLoad %418 
					                                       f32_4 %451 = OpLoad %443 
					                                       f32_4 %452 = OpFAdd %450 %451 
					                                                      OpStore %418 %452 
					                                       f32_4 %453 = OpLoad %316 
					                                       f32_4 %454 = OpLoad %418 
					                                       f32_4 %455 = OpFAdd %453 %454 
					                                                      OpStore %418 %455 
					                                       f32_4 %456 = OpLoad %340 
					                                       f32_4 %457 = OpLoad %418 
					                                       f32_4 %458 = OpFAdd %456 %457 
					                                                      OpStore %418 %458 
					                                       f32_4 %460 = OpLoad %228 
					                                       f32_4 %461 = OpLoad %254 
					                                       f32_4 %462 = OpFAdd %460 %461 
					                                                      OpStore %459 %462 
					                         read_only Texture2D %463 = OpLoad %180 
					                                     sampler %464 = OpLoad %184 
					                  read_only Texture2DSampled %465 = OpSampledImage %463 %464 
					                                       f32_4 %466 = OpLoad %428 
					                                       f32_2 %467 = OpVectorShuffle %466 %466 2 3 
					                                       f32_4 %468 = OpImageSampleImplicitLod %465 %467 
					                                                      OpStore %397 %468 
					                                       f32_4 %469 = OpLoad %397 
					                                       f32_4 %470 = OpLoad %459 
					                                       f32_4 %471 = OpFAdd %469 %470 
					                                                      OpStore %404 %471 
					                                       f32_4 %472 = OpLoad %282 
					                                       f32_4 %473 = OpLoad %404 
					                                       f32_4 %474 = OpFAdd %472 %473 
					                                                      OpStore %404 %474 
					                                       f32_4 %475 = OpLoad %306 
					                                       f32_4 %476 = OpLoad %404 
					                                       f32_4 %477 = OpFAdd %475 %476 
					                                                      OpStore %404 %477 
					                                       f32_4 %479 = OpLoad %9 
					                                       f32_4 %480 = OpVectorShuffle %479 %479 2 3 2 3 
					                              Uniform f32_4* %481 = OpAccessChain %17 %42 
					                                       f32_4 %482 = OpLoad %481 
					                                       f32_4 %483 = OpVectorShuffle %482 %482 0 1 0 1 
					                                       f32_4 %484 = OpFMul %480 %483 
					                                       f32_4 %486 = OpFAdd %484 %485 
					                                                      OpStore %478 %486 
					                                       f32_4 %487 = OpLoad %478 
					                              Uniform f32_4* %488 = OpAccessChain %17 %42 
					                                       f32_4 %489 = OpLoad %488 
					                                       f32_4 %490 = OpVectorShuffle %489 %489 0 1 0 1 
					                                       f32_4 %491 = OpFDiv %487 %490 
					                                                      OpStore %478 %491 
					                         read_only Texture2D %493 = OpLoad %180 
					                                     sampler %494 = OpLoad %184 
					                  read_only Texture2DSampled %495 = OpSampledImage %493 %494 
					                                       f32_4 %496 = OpLoad %478 
					                                       f32_2 %497 = OpVectorShuffle %496 %496 0 1 
					                                       f32_4 %498 = OpImageSampleImplicitLod %495 %497 
					                                                      OpStore %492 %498 
					                                       f32_4 %499 = OpLoad %404 
					                                       f32_4 %500 = OpLoad %492 
					                                       f32_4 %501 = OpFAdd %499 %500 
					                                                      OpStore %404 %501 
					                                       f32_4 %502 = OpLoad %340 
					                                       f32_4 %503 = OpLoad %404 
					                                       f32_4 %504 = OpFAdd %502 %503 
					                                                      OpStore %404 %504 
					                                       f32_4 %505 = OpLoad %350 
					                                       f32_4 %506 = OpLoad %404 
					                                       f32_4 %507 = OpFAdd %505 %506 
					                                                      OpStore %404 %507 
					                         read_only Texture2D %508 = OpLoad %180 
					                                     sampler %509 = OpLoad %184 
					                  read_only Texture2DSampled %510 = OpSampledImage %508 %509 
					                                       f32_4 %511 = OpLoad %478 
					                                       f32_2 %512 = OpVectorShuffle %511 %511 2 3 
					                                       f32_4 %513 = OpImageSampleImplicitLod %510 %512 
					                                                      OpStore %443 %513 
					                                       f32_4 %514 = OpLoad %404 
					                                       f32_4 %515 = OpLoad %443 
					                                       f32_4 %516 = OpFAdd %514 %515 
					                                                      OpStore %404 %516 
					                                       f32_4 %517 = OpLoad %404 
					                                       f32_4 %520 = OpFMul %517 %519 
					                                                      OpStore %404 %520 
					                                       f32_4 %521 = OpLoad %418 
					                                       f32_4 %522 = OpFMul %521 %519 
					                                       f32_4 %523 = OpLoad %404 
					                                       f32_4 %524 = OpFNegate %523 
					                                       f32_4 %525 = OpFAdd %522 %524 
					                                                      OpStore %418 %525 
					                                       f32_4 %526 = OpLoad %9 
					                                       f32_4 %527 = OpVectorShuffle %526 %526 2 3 2 3 
					                              Uniform f32_4* %528 = OpAccessChain %17 %42 
					                                       f32_4 %529 = OpLoad %528 
					                                       f32_4 %530 = OpVectorShuffle %529 %529 0 1 0 1 
					                                       f32_4 %531 = OpFMul %527 %530 
					                                       f32_4 %533 = OpFAdd %531 %532 
					                                                      OpStore %428 %533 
					                                       f32_4 %534 = OpLoad %428 
					                              Uniform f32_4* %535 = OpAccessChain %17 %42 
					                                       f32_4 %536 = OpLoad %535 
					                                       f32_4 %537 = OpVectorShuffle %536 %536 0 1 0 1 
					                                       f32_4 %538 = OpFDiv %534 %537 
					                                                      OpStore %428 %538 
					                         read_only Texture2D %539 = OpLoad %180 
					                                     sampler %540 = OpLoad %184 
					                  read_only Texture2DSampled %541 = OpSampledImage %539 %540 
					                                       f32_4 %542 = OpLoad %428 
					                                       f32_2 %543 = OpVectorShuffle %542 %542 0 1 
					                                       f32_4 %544 = OpImageSampleImplicitLod %541 %543 
					                                                      OpStore %443 %544 
					                         read_only Texture2D %545 = OpLoad %180 
					                                     sampler %546 = OpLoad %184 
					                  read_only Texture2DSampled %547 = OpSampledImage %545 %546 
					                                       f32_4 %548 = OpLoad %428 
					                                       f32_2 %549 = OpVectorShuffle %548 %548 2 3 
					                                       f32_4 %550 = OpImageSampleImplicitLod %547 %549 
					                                                      OpStore %397 %550 
					                                       f32_4 %551 = OpLoad %397 
					                                       f32_4 %552 = OpLoad %443 
					                                       f32_4 %553 = OpFAdd %551 %552 
					                                                      OpStore %404 %553 
					                                       f32_4 %554 = OpLoad %9 
					                                       f32_4 %555 = OpVectorShuffle %554 %554 2 3 2 3 
					                              Uniform f32_4* %556 = OpAccessChain %17 %42 
					                                       f32_4 %557 = OpLoad %556 
					                                       f32_4 %558 = OpVectorShuffle %557 %557 0 1 0 1 
					                                       f32_4 %559 = OpFMul %555 %558 
					                                       f32_4 %561 = OpFAdd %559 %560 
					                                                      OpStore %478 %561 
					                                       f32_4 %562 = OpLoad %478 
					                              Uniform f32_4* %563 = OpAccessChain %17 %42 
					                                       f32_4 %564 = OpLoad %563 
					                                       f32_4 %565 = OpVectorShuffle %564 %564 0 1 0 1 
					                                       f32_4 %566 = OpFDiv %562 %565 
					                                                      OpStore %478 %566 
					                         read_only Texture2D %567 = OpLoad %180 
					                                     sampler %568 = OpLoad %184 
					                  read_only Texture2DSampled %569 = OpSampledImage %567 %568 
					                                       f32_4 %570 = OpLoad %478 
					                                       f32_2 %571 = OpVectorShuffle %570 %570 0 1 
					                                       f32_4 %572 = OpImageSampleImplicitLod %569 %571 
					                                                      OpStore %492 %572 
					                                       f32_4 %573 = OpLoad %404 
					                                       f32_4 %574 = OpLoad %492 
					                                       f32_4 %575 = OpFAdd %573 %574 
					                                                      OpStore %404 %575 
					                                       f32_4 %577 = OpLoad %221 
					                                       f32_4 %578 = OpLoad %404 
					                                       f32_4 %579 = OpFAdd %577 %578 
					                                                      OpStore %576 %579 
					                                       f32_4 %581 = OpLoad %228 
					                                       f32_4 %582 = OpLoad %576 
					                                       f32_4 %583 = OpFAdd %581 %582 
					                                                      OpStore %580 %583 
					                                       f32_4 %584 = OpLoad %254 
					                                       f32_4 %585 = OpLoad %580 
					                                       f32_4 %586 = OpFAdd %584 %585 
					                                                      OpStore %580 %586 
					                                       f32_4 %587 = OpLoad %264 
					                                       f32_4 %588 = OpLoad %580 
					                                       f32_4 %589 = OpFAdd %587 %588 
					                                                      OpStore %580 %589 
					                                       f32_4 %590 = OpLoad %282 
					                                       f32_4 %591 = OpLoad %580 
					                                       f32_4 %592 = OpFAdd %590 %591 
					                                                      OpStore %580 %592 
					                                       f32_4 %593 = OpLoad %306 
					                                       f32_4 %594 = OpLoad %580 
					                                       f32_4 %595 = OpFAdd %593 %594 
					                                                      OpStore %580 %595 
					                                       f32_4 %597 = OpLoad %282 
					                                       f32_4 %598 = OpLoad %264 
					                                       f32_4 %599 = OpFAdd %597 %598 
					                                                      OpStore %596 %599 
					                                       f32_4 %600 = OpLoad %306 
					                                       f32_4 %601 = OpLoad %596 
					                                       f32_4 %602 = OpFAdd %600 %601 
					                                                      OpStore %596 %602 
					                                       f32_4 %603 = OpLoad %316 
					                                       f32_4 %604 = OpLoad %596 
					                                       f32_4 %605 = OpFAdd %603 %604 
					                                                      OpStore %596 %605 
					                                       f32_4 %606 = OpLoad %340 
					                                       f32_4 %607 = OpLoad %596 
					                                       f32_4 %608 = OpFAdd %606 %607 
					                                                      OpStore %596 %608 
					                                       f32_4 %609 = OpLoad %350 
					                                       f32_4 %610 = OpLoad %596 
					                                       f32_4 %611 = OpFAdd %609 %610 
					                                                      OpStore %596 %611 
					                         read_only Texture2D %612 = OpLoad %180 
					                                     sampler %613 = OpLoad %184 
					                  read_only Texture2DSampled %614 = OpSampledImage %612 %613 
					                                       f32_4 %615 = OpLoad %478 
					                                       f32_2 %616 = OpVectorShuffle %615 %615 2 3 
					                                       f32_4 %617 = OpImageSampleImplicitLod %614 %616 
					                                                      OpStore %221 %617 
					                                       f32_4 %618 = OpLoad %596 
					                                       f32_4 %619 = OpLoad %221 
					                                       f32_4 %620 = OpFAdd %618 %619 
					                                                      OpStore %596 %620 
					                                       f32_4 %621 = OpLoad %9 
					                              Uniform f32_4* %622 = OpAccessChain %17 %42 
					                                       f32_4 %623 = OpLoad %622 
					                                       f32_4 %624 = OpVectorShuffle %623 %623 0 1 0 1 
					                                       f32_4 %625 = OpFMul %621 %624 
					                                       f32_4 %627 = OpFAdd %625 %626 
					                                                      OpStore %9 %627 
					                                       f32_4 %628 = OpLoad %9 
					                              Uniform f32_4* %629 = OpAccessChain %17 %42 
					                                       f32_4 %630 = OpLoad %629 
					                                       f32_4 %631 = OpVectorShuffle %630 %630 0 1 0 1 
					                                       f32_4 %632 = OpFDiv %628 %631 
					                                                      OpStore %9 %632 
					                         read_only Texture2D %633 = OpLoad %180 
					                                     sampler %634 = OpLoad %184 
					                  read_only Texture2DSampled %635 = OpSampledImage %633 %634 
					                                       f32_4 %636 = OpLoad %9 
					                                       f32_2 %637 = OpVectorShuffle %636 %636 0 1 
					                                       f32_4 %638 = OpImageSampleImplicitLod %635 %637 
					                                                      OpStore %221 %638 
					                                       f32_4 %639 = OpLoad %596 
					                                       f32_4 %640 = OpLoad %221 
					                                       f32_4 %641 = OpFAdd %639 %640 
					                                                      OpStore %596 %641 
					                         read_only Texture2D %643 = OpLoad %180 
					                                     sampler %644 = OpLoad %184 
					                  read_only Texture2DSampled %645 = OpSampledImage %643 %644 
					                                       f32_4 %646 = OpLoad %9 
					                                       f32_2 %647 = OpVectorShuffle %646 %646 2 3 
					                                       f32_4 %648 = OpImageSampleImplicitLod %645 %647 
					                                                      OpStore %642 %648 
					                                       f32_4 %650 = OpLoad %642 
					                                       f32_4 %651 = OpLoad %596 
					                                       f32_4 %652 = OpFAdd %650 %651 
					                                                      OpStore %649 %652 
					                                       f32_4 %653 = OpLoad %649 
					                                       f32_4 %654 = OpFMul %653 %519 
					                                                      OpStore %649 %654 
					                                       f32_4 %655 = OpLoad %580 
					                                       f32_4 %656 = OpFMul %655 %519 
					                                       f32_4 %657 = OpLoad %649 
					                                       f32_4 %658 = OpFNegate %657 
					                                       f32_4 %659 = OpFAdd %656 %658 
					                                                      OpStore %649 %659 
					                                       f32_4 %660 = OpLoad %649 
					                                       f32_4 %661 = OpExtInst %1 4 %660 
					                                       f32_4 %662 = OpLoad %418 
					                                       f32_4 %663 = OpExtInst %1 4 %662 
					                                       f32_4 %664 = OpFAdd %661 %663 
					                                                      OpStore %649 %664 
					                                       f32_4 %665 = OpLoad %649 
					                                       f32_4 %668 = OpFMul %665 %667 
					                                                      OpStore %649 %668 
					                                       f32_3 %669 = OpLoad %60 
					                                       f32_3 %671 = OpFMul %669 %670 
					                                       f32_4 %672 = OpLoad %49 
					                                       f32_4 %673 = OpVectorShuffle %672 %671 4 5 6 3 
					                                                      OpStore %49 %673 
					                                Private f32* %675 = OpAccessChain %49 %674 
					                                                      OpStore %675 %389 
					                                       f32_4 %676 = OpLoad %143 
					                                       f32_4 %677 = OpFNegate %676 
					                                       f32_4 %678 = OpLoad %49 
					                                       f32_4 %679 = OpFAdd %677 %678 
					                                                      OpStore %49 %679 
					                                Uniform f32* %680 = OpAccessChain %17 %46 
					                                         f32 %681 = OpLoad %680 
					                                Uniform f32* %682 = OpAccessChain %17 %46 
					                                         f32 %683 = OpLoad %682 
					                                Uniform f32* %684 = OpAccessChain %17 %46 
					                                         f32 %685 = OpLoad %684 
					                                Uniform f32* %686 = OpAccessChain %17 %46 
					                                         f32 %687 = OpLoad %686 
					                                       f32_4 %688 = OpCompositeConstruct %681 %683 %685 %687 
					                                         f32 %689 = OpCompositeExtract %688 0 
					                                         f32 %690 = OpCompositeExtract %688 1 
					                                         f32 %691 = OpCompositeExtract %688 2 
					                                         f32 %692 = OpCompositeExtract %688 3 
					                                       f32_4 %693 = OpCompositeConstruct %689 %690 %691 %692 
					                                       f32_4 %694 = OpLoad %49 
					                                       f32_4 %695 = OpFMul %693 %694 
					                                       f32_4 %696 = OpLoad %143 
					                                       f32_4 %697 = OpFAdd %695 %696 
					                                                      OpStore %49 %697 
					                                Uniform f32* %698 = OpAccessChain %17 %39 
					                                         f32 %699 = OpLoad %698 
					                                         f32 %701 = OpFAdd %699 %700 
					                                Private f32* %702 = OpAccessChain %60 %36 
					                                                      OpStore %702 %701 
					                                       f32_4 %703 = OpLoad %649 
					                                       f32_4 %704 = OpLoad %649 
					                                         f32 %705 = OpDot %703 %704 
					                                Private f32* %706 = OpAccessChain %649 %36 
					                                                      OpStore %706 %705 
					                                Private f32* %707 = OpAccessChain %649 %36 
					                                         f32 %708 = OpLoad %707 
					                                         f32 %709 = OpExtInst %1 31 %708 
					                                Private f32* %710 = OpAccessChain %9 %36 
					                                                      OpStore %710 %709 
					                                Private f32* %712 = OpAccessChain %60 %36 
					                                         f32 %713 = OpLoad %712 
					                                Private f32* %714 = OpAccessChain %9 %36 
					                                         f32 %715 = OpLoad %714 
					                                        bool %716 = OpFOrdLessThan %713 %715 
					                                                      OpStore %711 %716 
					                                        bool %719 = OpLoad %711 
					                                                      OpSelectionMerge %723 None 
					                                                      OpBranchConditional %719 %722 %725 
					                                             %722 = OpLabel 
					                                                      OpStore %721 %724 
					                                                      OpBranch %723 
					                                             %725 = OpLabel 
					                                       f32_4 %726 = OpLoad %49 
					                                       f32_3 %727 = OpVectorShuffle %726 %726 0 1 2 
					                                                      OpStore %721 %727 
					                                                      OpBranch %723 
					                                             %723 = OpLabel 
					                                       f32_3 %728 = OpLoad %721 
					                                       f32_4 %729 = OpLoad %718 
					                                       f32_4 %730 = OpVectorShuffle %729 %728 4 5 6 3 
					                                                      OpStore %718 %730 
					                                Private f32* %731 = OpAccessChain %49 %674 
					                                         f32 %732 = OpLoad %731 
					                                 Output f32* %734 = OpAccessChain %718 %674 
					                                                      OpStore %734 %732 
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
						vec4 _ScreenResolution;
						float _EdgeSize;
						float _ColorLevel;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					ivec2 u_xlati3;
					vec2 u_xlat4;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat10_9;
					vec4 u_xlat10;
					vec4 u_xlat10_10;
					vec4 u_xlat10_11;
					vec4 u_xlat12;
					vec4 u_xlat16_12;
					vec4 u_xlat10_12;
					vec4 u_xlat13;
					vec4 u_xlat16_13;
					vec4 u_xlat10_13;
					vec4 u_xlat14;
					vec4 u_xlat16_14;
					vec4 u_xlat10_14;
					vec4 u_xlat10_15;
					int u_xlati33;
					float u_xlat36;
					ivec2 u_xlati36;
					bool u_xlatb36;
					float u_xlat49;
					bool u_xlatb49;
					float u_xlat50;
					int u_xlati50;
					vec4 TempArray0[6];
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat1.xy = u_xlat0.zw * _ScreenResolution.xy;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlati33 = int(0xFFFFFFFEu);
					    while(true){
					        u_xlatb49 = 2<u_xlati33;
					        if(u_xlatb49){break;}
					        u_xlati3.xy = ivec2(u_xlati33) + ivec2(2, 1);
					        u_xlat49 = TempArray0[u_xlati3.x].x;
					        u_xlat50 = float(u_xlati33);
					        u_xlat4.x = dot(vec2(u_xlat50), vec2(vec2(_Distortion, _Distortion)));
					        u_xlat3.xzw = u_xlat2.xyz;
					        u_xlati50 = int(0xFFFFFFFEu);
					        while(true){
					            u_xlatb36 = 2<u_xlati50;
					            if(u_xlatb36){break;}
					            u_xlati36.xy = ivec2(u_xlati50) + ivec2(2, 1);
					            u_xlat36 = TempArray0[u_xlati36.x].x;
					            u_xlat36 = u_xlat49 * u_xlat36;
					            u_xlat5.x = float(u_xlati50);
					            u_xlat4.y = dot(u_xlat5.xx, vec2(vec2(_Distortion, _Distortion)));
					            u_xlat5.xy = u_xlat0.zw * _ScreenResolution.xy + u_xlat4.xy;
					            u_xlat5.xy = u_xlat5.xy / _ScreenResolution.xy;
					            u_xlat10_5 = texture(_MainTex, u_xlat5.xy);
					            u_xlat3.xzw = vec3(u_xlat36) * u_xlat10_5.xyz + u_xlat3.xzw;
					            u_xlati50 = u_xlati36.y;
					        }
					        u_xlat2.xyz = u_xlat3.xzw;
					        u_xlati33 = u_xlati3.y;
					    }
					    u_xlat3 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 1.0, 1.0, 0.0);
					    u_xlat3 = u_xlat3 / _ScreenResolution.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_5 = u_xlat10_3 + u_xlat10_4;
					    u_xlat6 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, -1.0, 0.0, 1.0);
					    u_xlat6 = u_xlat6 / _ScreenResolution.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_7;
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_6;
					    u_xlat1.xy = u_xlat1.xy / _ScreenResolution.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_5 = u_xlat10_1 + u_xlat16_5;
					    u_xlat8 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -1.0, -1.0, 1.0);
					    u_xlat8 = u_xlat8 / _ScreenResolution.xyxy;
					    u_xlat10_9 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_9;
					    u_xlat10_8 = texture(_MainTex, u_xlat8.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_8;
					    u_xlat10 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 0.0, -1.0, -1.0);
					    u_xlat10 = u_xlat10 / _ScreenResolution.xyxy;
					    u_xlat10_11 = texture(_MainTex, u_xlat10.xy);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_11;
					    u_xlat10_10 = texture(_MainTex, u_xlat10.zw);
					    u_xlat16_5 = u_xlat16_5 + u_xlat10_10;
					    u_xlat5 = u_xlat16_5 * vec4(0.777777791, 0.777777791, 0.777777791, 0.777777791);
					    u_xlat5 = floor(u_xlat5);
					    u_xlat5 = u_xlat5 / vec4(vec4(_ColorLevel, _ColorLevel, _ColorLevel, _ColorLevel));
					    u_xlat12 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(1.0, 2.0, 0.0, 2.0);
					    u_xlat12 = u_xlat12 / _ScreenResolution.xyxy;
					    u_xlat10_13 = texture(_MainTex, u_xlat12.xy);
					    u_xlat16_13 = u_xlat10_4 + u_xlat10_13;
					    u_xlat16_13 = u_xlat10_3 + u_xlat16_13;
					    u_xlat10_12 = texture(_MainTex, u_xlat12.zw);
					    u_xlat16_12 = u_xlat10_12 + u_xlat16_13;
					    u_xlat16_12 = u_xlat10_6 + u_xlat16_12;
					    u_xlat16_12 = u_xlat10_1 + u_xlat16_12;
					    u_xlat13 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(-1.0, 2.0, 1.0, -2.0);
					    u_xlat13 = u_xlat13 / _ScreenResolution.xyxy;
					    u_xlat10_14 = texture(_MainTex, u_xlat13.xy);
					    u_xlat16_12 = u_xlat16_12 + u_xlat10_14;
					    u_xlat16_12 = u_xlat10_8 + u_xlat16_12;
					    u_xlat16_12 = u_xlat10_11 + u_xlat16_12;
					    u_xlat16_14 = u_xlat10_3 + u_xlat10_7;
					    u_xlat10_13 = texture(_MainTex, u_xlat13.zw);
					    u_xlat16_13 = u_xlat10_13 + u_xlat16_14;
					    u_xlat16_13 = u_xlat10_1 + u_xlat16_13;
					    u_xlat16_13 = u_xlat10_9 + u_xlat16_13;
					    u_xlat14 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(0.0, -2.0, -1.0, -2.0);
					    u_xlat14 = u_xlat14 / _ScreenResolution.xyxy;
					    u_xlat10_15 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_13 = u_xlat16_13 + u_xlat10_15;
					    u_xlat16_13 = u_xlat10_11 + u_xlat16_13;
					    u_xlat16_13 = u_xlat10_10 + u_xlat16_13;
					    u_xlat10_14 = texture(_MainTex, u_xlat14.zw);
					    u_xlat16_13 = u_xlat16_13 + u_xlat10_14;
					    u_xlat16_13 = u_xlat16_13 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_12 = u_xlat16_12 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat16_13);
					    u_xlat13 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, 1.0, 2.0, 0.0);
					    u_xlat13 = u_xlat13 / _ScreenResolution.xyxy;
					    u_xlat10_14 = texture(_MainTex, u_xlat13.xy);
					    u_xlat10_13 = texture(_MainTex, u_xlat13.zw);
					    u_xlat16_13 = u_xlat10_13 + u_xlat10_14;
					    u_xlat14 = u_xlat0.zwzw * _ScreenResolution.xyxy + vec4(2.0, -1.0, -2.0, 1.0);
					    u_xlat14 = u_xlat14 / _ScreenResolution.xyxy;
					    u_xlat10_15 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_13 = u_xlat16_13 + u_xlat10_15;
					    u_xlat16_4 = u_xlat10_4 + u_xlat16_13;
					    u_xlat16_3 = u_xlat10_3 + u_xlat16_4;
					    u_xlat16_3 = u_xlat10_7 + u_xlat16_3;
					    u_xlat16_3 = u_xlat10_6 + u_xlat16_3;
					    u_xlat16_3 = u_xlat10_1 + u_xlat16_3;
					    u_xlat16_3 = u_xlat10_9 + u_xlat16_3;
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_6;
					    u_xlat16_1 = u_xlat10_9 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_8 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_11 + u_xlat16_1;
					    u_xlat16_1 = u_xlat10_10 + u_xlat16_1;
					    u_xlat10_4 = texture(_MainTex, u_xlat14.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_4;
					    u_xlat0 = u_xlat0 * _ScreenResolution.xyxy + vec4(-2.0, 0.0, -2.0, -1.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_4;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112);
					    u_xlat16_0 = u_xlat16_3 * vec4(0.111111112, 0.111111112, 0.111111112, 0.111111112) + (-u_xlat16_0);
					    u_xlat16_0 = abs(u_xlat16_0) + abs(u_xlat16_12);
					    u_xlat16_0 = u_xlat16_0 * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.w = 2.0;
					    u_xlat1 = (-u_xlat5) + u_xlat1;
					    u_xlat1 = vec4(vec4(_Distortion, _Distortion, _Distortion, _Distortion)) * u_xlat1 + u_xlat5;
					    u_xlat2.x = _EdgeSize + 0.0500000007;
					    u_xlat16_0.x = dot(u_xlat16_0, u_xlat16_0);
					    u_xlat0.x = sqrt(u_xlat16_0.x);
					    u_xlatb0 = u_xlat2.x<u_xlat0.x;
					    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    SV_Target0.w = u_xlat1.w;
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