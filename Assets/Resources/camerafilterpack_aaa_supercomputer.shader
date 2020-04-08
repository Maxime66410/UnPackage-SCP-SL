Shader "CameraFilterPack/AAA_Super_Computer" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0.2, 10)) = 8.1
		_BorderSize ("_BorderSize", Range(-0.5, 0.5)) = 0
		_BorderColor ("_BorderColor", Vector) = (0,0.5,1,1)
		_SpotSize ("_SpotSize", Range(0, 1)) = 0.5
		_AlphaHexa ("_AlphaHexa", Range(0.2, 10)) = 0.608
		_PositionX ("_PositionX", Range(-0.5, 0.5)) = 0
		_PositionY ("_PositionY", Range(-0.5, 0.5)) = 0
		_Radius ("_Radius", Range(0, 1)) = 0.5
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 6429
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
					uniform 	float _BorderSize;
					uniform 	vec4 _BorderColor;
					uniform 	float _AlphaHexa;
					uniform 	float _PositionX;
					uniform 	float _PositionY;
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					vec4 u_xlat5;
					int u_xlati5;
					vec3 u_xlat6;
					bvec3 u_xlatb6;
					vec3 u_xlat7;
					int u_xlati7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec2 u_xlat11;
					float u_xlat12;
					vec2 u_xlat14;
					bool u_xlatb14;
					vec2 u_xlat16;
					bvec2 u_xlatb16;
					vec2 u_xlat18;
					vec2 u_xlat21;
					vec2 u_xlat22;
					vec2 u_xlat24;
					bool u_xlatb24;
					float u_xlat27;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					int u_xlati30;
					bool u_xlatb30;
					int u_xlati32;
					float u_xlat34;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat18.xy = u_xlat0.xy + u_xlat0.xy;
					    u_xlat2.xy = vec2(_TimeX) * vec2(1.29999995, 3048.65601);
					    u_xlat28 = floor(u_xlat2.x);
					    u_xlat2.x = fract(u_xlat2.y);
					    u_xlat11.x = sin(u_xlat28);
					    u_xlat11.x = u_xlat11.x * 43758.5469;
					    u_xlat11.x = fract(u_xlat11.x);
					    u_xlat28 = u_xlat28 + 1.0;
					    u_xlat28 = sin(u_xlat28);
					    u_xlat28 = u_xlat28 * 43758.5469;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = (-u_xlat11.x) + u_xlat28;
					    u_xlat28 = u_xlat2.x * u_xlat28 + u_xlat11.x;
					    u_xlat28 = u_xlat28 * 0.800000012 + 0.400000006;
					    u_xlat2.x = float(0.0);
					    u_xlat11.x = float(0.600000024);
					    u_xlat11.y = float(1.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<3 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = u_xlat18.xy * u_xlat11.yy;
					        u_xlat21.xy = u_xlat18.xy * u_xlat11.yy + vec2(5.0, 5.0);
					        u_xlat21.xy = floor(u_xlat21.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat22.x = float(8.0);
					        u_xlat22.y = float(8.0);
					        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					        {
					            u_xlat6.y = float(u_xlati_loop_2);
					            u_xlat14.xy = u_xlat22.xy;
					            for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					            {
					                u_xlat6.x = float(u_xlati_loop_3);
					                u_xlat24.xy = (-u_xlat4.xy) + u_xlat6.xy;
					                u_xlat7.xy = u_xlat21.xy + u_xlat6.xy;
					                u_xlat6.x = dot(u_xlat7.xy, vec2(591.320007, 154.076996));
					                u_xlat6.x = u_xlat6.x + _TimeX;
					                u_xlat6.x = sin(u_xlat6.x);
					                u_xlat7.x = dot(u_xlat7.xy, vec2(391.320007, 49.0769997));
					                u_xlat7.x = u_xlat7.x + _TimeX;
					                u_xlat7.x = cos(u_xlat7.x);
					                u_xlat8.x = fract(u_xlat6.x);
					                u_xlat8.y = fract(u_xlat7.x);
					                u_xlat6.xz = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat24.xy;
					                u_xlat7.x = max(abs(u_xlat6.z), abs(u_xlat6.x));
					                u_xlatb6.xz = lessThan(u_xlat7.xxxx, u_xlat14.xxyx).xz;
					                u_xlat7.z = (u_xlatb6.z) ? u_xlat7.x : u_xlat14.y;
					                u_xlat7.y = u_xlat14.x;
					                u_xlat14.xy = (u_xlatb6.x) ? u_xlat7.xy : u_xlat7.yz;
					            }
					            u_xlat22.xy = u_xlat14.xy;
					        }
					        u_xlat21.x = (-u_xlat22.x) * _Value2 + u_xlat22.y;
					        u_xlatb30 = 0<u_xlati_loop_1;
					        if(u_xlatb30){
					            u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5) + vec2(_TimeX);
					            u_xlat4.xy = u_xlat3.xy + vec2(50.0, 50.0);
					            u_xlat4.xy = floor(u_xlat4.xy);
					            u_xlat3.xy = fract(u_xlat3.xy);
					            u_xlat5.x = float(8.0);
					            u_xlat5.w = float(8.0);
					            for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					            {
					                u_xlat6.y = float(u_xlati_loop_4);
					                u_xlat24.xy = u_xlat5.xw;
					                for(int u_xlati_loop_5 = int(0xFFFFFFFFu) ; u_xlati_loop_5<=1 ; u_xlati_loop_5++)
					                {
					                    u_xlat6.x = float(u_xlati_loop_5);
					                    u_xlat16.xy = (-u_xlat3.xy) + u_xlat6.xy;
					                    u_xlat8.xy = u_xlat4.xy + u_xlat6.xy;
					                    u_xlat6.x = dot(u_xlat8.xy, vec2(591.320007, 154.076996));
					                    u_xlat6.x = u_xlat6.x + _TimeX;
					                    u_xlat6.x = sin(u_xlat6.x);
					                    u_xlat34 = dot(u_xlat8.xy, vec2(391.320007, 49.0769997));
					                    u_xlat34 = u_xlat34 + _TimeX;
					                    u_xlat34 = cos(u_xlat34);
					                    u_xlat8.x = fract(u_xlat6.x);
					                    u_xlat8.y = fract(u_xlat34);
					                    u_xlat16.xy = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat16.xy;
					                    u_xlat8.x = max(abs(u_xlat16.y), abs(u_xlat16.x));
					                    u_xlatb16.xy = lessThan(u_xlat8.xxxx, u_xlat24.xyxx).xy;
					                    u_xlat8.z = (u_xlatb16.y) ? u_xlat8.x : u_xlat24.y;
					                    u_xlat8.y = u_xlat24.x;
					                    u_xlat24.xy = (u_xlatb16.x) ? u_xlat8.xy : u_xlat8.yz;
					                }
					                u_xlat5.xw = u_xlat24.xy;
					            }
					            u_xlat3.x = (-u_xlat5.x) * _Value2 + u_xlat5.w;
					            u_xlat12 = u_xlat21.x * 10.0;
					            u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					            u_xlat30 = u_xlat12 * -2.0 + 3.0;
					            u_xlat12 = u_xlat12 * u_xlat12;
					            u_xlat12 = (-u_xlat30) * u_xlat12 + 1.0;
					            u_xlat3.x = u_xlat3.x * 12.5;
					            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					            u_xlat30 = u_xlat3.x * -2.0 + 3.0;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat3.x = (-u_xlat30) * u_xlat3.x + 1.5;
					            u_xlat3.x = u_xlat3.x * u_xlat12;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat2.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        }
					        u_xlat3.x = u_xlat21.x * 3.33333325;
					        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					        u_xlat12 = u_xlat3.x * -2.0 + 3.0;
					        u_xlat3.x = u_xlat3.x * u_xlat3.x;
					        u_xlat3.x = (-u_xlat12) * u_xlat3.x + 1.0;
					        u_xlat3.x = u_xlat3.x * 5.5 + 0.100000001;
					        u_xlat12 = floor(u_xlat3.x);
					        u_xlat3.x = u_xlat3.x * 2345.12012;
					        u_xlat21.x = sin(u_xlat12);
					        u_xlat3.z = u_xlat21.x * 43758.5469;
					        u_xlat12 = u_xlat12 + 1.0;
					        u_xlat12 = sin(u_xlat12);
					        u_xlat3.y = u_xlat12 * 43758.5469;
					        u_xlat3.xyz = fract(u_xlat3.xyz);
					        u_xlat12 = (-u_xlat3.z) + u_xlat3.y;
					        u_xlat3.x = u_xlat3.x * u_xlat12 + u_xlat3.z;
					        u_xlat12 = u_xlat11.x * u_xlat3.x;
					        u_xlat12 = u_xlat12 * u_xlat28 + u_xlat2.x;
					        u_xlat3.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        u_xlat2.x = (u_xlati_loop_1 != 0) ? u_xlat3.x : u_xlat12;
					        u_xlat11.xy = u_xlat11.xy * vec2(0.699999988, 3.0);
					    }
					    u_xlat18.x = dot(u_xlat18.xy, u_xlat18.xy);
					    u_xlat18.x = sqrt(u_xlat18.x);
					    u_xlat18.x = u_xlat18.x * -0.865617037;
					    u_xlat18.x = exp2(u_xlat18.x);
					    u_xlat18.x = u_xlat2.x * u_xlat18.x;
					    u_xlat18.x = u_xlat18.x * 1.20000005;
					    u_xlat18.x = log2(u_xlat18.x);
					    u_xlat18.x = u_xlat18.x * 2.5;
					    u_xlat18.x = exp2(u_xlat18.x);
					    u_xlat18.x = u_xlat18.x * _Value;
					    u_xlat27 = _SpotSize * 0.150000006;
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(_PositionX, _PositionY);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Radius);
					    u_xlat9.x = float(1.0) / u_xlat27;
					    u_xlat0.x = u_xlat9.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat9.x) * u_xlat0.x + 1.0;
					    u_xlat9.xyz = u_xlat18.xxx * _BorderColor.xyz + u_xlat10_1.xyz;
					    u_xlat2.xyz = (-u_xlat9.xyz) + u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat9.xyz;
					    u_xlat27 = (-_AlphaHexa) + 1.0;
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat10_1.xyz;
					    SV_Target0.xyz = vec3(u_xlat27) * u_xlat1.xyz + u_xlat0.xyz;
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
					; Bound: 850
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %829 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %15 0 Offset 15 
					                                                      OpMemberDecorate %15 1 Offset 15 
					                                                      OpMemberDecorate %15 2 Offset 15 
					                                                      OpMemberDecorate %15 3 Offset 15 
					                                                      OpMemberDecorate %15 4 Offset 15 
					                                                      OpMemberDecorate %15 5 Offset 15 
					                                                      OpMemberDecorate %15 6 Offset 15 
					                                                      OpMemberDecorate %15 7 Offset 15 
					                                                      OpMemberDecorate %15 8 Offset 15 
					                                                      OpMemberDecorate %15 9 Offset 15 
					                                                      OpMemberDecorate %15 10 RelaxedPrecision 
					                                                      OpMemberDecorate %15 10 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %23 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %31 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %34 DescriptorSet 34 
					                                                      OpDecorate %34 Binding 34 
					                                                      OpDecorate %35 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %38 DescriptorSet 38 
					                                                      OpDecorate %38 Binding 38 
					                                                      OpDecorate %39 RelaxedPrecision 
					                                                      OpDecorate %45 RelaxedPrecision 
					                                                      OpDecorate %806 RelaxedPrecision 
					                                                      OpDecorate %810 RelaxedPrecision 
					                                                      OpDecorate %826 RelaxedPrecision 
					                                                      OpDecorate %829 Location 829 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeVector %6 4 
					                                              %15 = OpTypeStruct %6 %6 %6 %6 %14 %6 %6 %6 %6 %6 %14 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32; f32; f32_4; f32; f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 10 
					                                              %20 = OpTypePointer Uniform %14 
					                               Private f32_3* %31 = OpVariable Private 
					                                              %32 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %33 = OpTypePointer UniformConstant %32 
					         UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
					                                              %36 = OpTypeSampler 
					                                              %37 = OpTypePointer UniformConstant %36 
					                     UniformConstant sampler* %38 = OpVariable UniformConstant 
					                                              %40 = OpTypeSampledImage %32 
					                                          f32 %48 = OpConstant 3,674022E-40 
					                                        f32_2 %49 = OpConstantComposite %48 %48 
					                                              %53 = OpTypePointer Private %10 
					                               Private f32_2* %54 = OpVariable Private 
					                               Private f32_3* %60 = OpVariable Private 
					                                          i32 %61 = OpConstant 0 
					                                              %62 = OpTypePointer Uniform %6 
					                                          f32 %66 = OpConstant 3,674022E-40 
					                                          f32 %67 = OpConstant 3,674022E-40 
					                                        f32_2 %68 = OpConstantComposite %66 %67 
					                                              %72 = OpTypePointer Private %6 
					                                 Private f32* %73 = OpVariable Private 
					                                              %74 = OpTypeInt 32 0 
					                                          u32 %75 = OpConstant 0 
					                                          u32 %79 = OpConstant 1 
					                               Private f32_2* %84 = OpVariable Private 
					                                          f32 %90 = OpConstant 3,674022E-40 
					                                          f32 %98 = OpConstant 3,674022E-40 
					                                         f32 %119 = OpConstant 3,674022E-40 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                                         f32 %123 = OpConstant 3,674022E-40 
					                                         f32 %125 = OpConstant 3,674022E-40 
					                                             %128 = OpTypePointer Function %18 
					                                         i32 %136 = OpConstant 3 
					                                             %137 = OpTypeBool 
					                              Private f32_3* %139 = OpVariable Private 
					                              Private f32_2* %146 = OpVariable Private 
					                                         f32 %151 = OpConstant 3,674022E-40 
					                                       f32_2 %152 = OpConstantComposite %151 %151 
					                              Private f32_2* %156 = OpVariable Private 
					                              Private f32_2* %160 = OpVariable Private 
					                                         f32 %161 = OpConstant 3,674022E-40 
					                                         i32 %165 = OpConstant -1 
					                                         i32 %172 = OpConstant 1 
					                              Private f32_3* %174 = OpVariable Private 
					                              Private f32_2* %178 = OpVariable Private 
					                              Private f32_2* %191 = OpVariable Private 
					                              Private f32_3* %197 = OpVariable Private 
					                                         f32 %206 = OpConstant 3,674022E-40 
					                                         f32 %207 = OpConstant 3,674022E-40 
					                                       f32_2 %208 = OpConstantComposite %206 %207 
					                                         f32 %223 = OpConstant 3,674022E-40 
					                                         f32 %224 = OpConstant 3,674022E-40 
					                                       f32_2 %225 = OpConstantComposite %223 %224 
					                              Private f32_3* %238 = OpVariable Private 
					                                         u32 %262 = OpConstant 2 
					                                             %271 = OpTypeVector %137 3 
					                                             %272 = OpTypePointer Private %271 
					                             Private bool_3* %273 = OpVariable Private 
					                                             %278 = OpTypeVector %137 4 
					                                             %280 = OpTypeVector %137 2 
					                                             %284 = OpTypePointer Private %137 
					                                             %287 = OpTypePointer Function %6 
					                                             %303 = OpTypePointer Function %10 
					                                         i32 %321 = OpConstant 2 
					                               Private bool* %329 = OpVariable Private 
					                                         f32 %337 = OpConstant 3,674022E-40 
					                                       f32_2 %338 = OpConstantComposite %337 %337 
					                                         f32 %348 = OpConstant 3,674022E-40 
					                                       f32_2 %349 = OpConstantComposite %348 %348 
					                                             %358 = OpTypePointer Private %14 
					                              Private f32_4* %359 = OpVariable Private 
					                                         u32 %361 = OpConstant 3 
					                              Private f32_2* %387 = OpVariable Private 
					                                Private f32* %414 = OpVariable Private 
					                                             %452 = OpTypePointer Private %280 
					                             Private bool_2* %453 = OpVariable Private 
					                                Private f32* %503 = OpVariable Private 
					                                         f32 %506 = OpConstant 3,674022E-40 
					                                Private f32* %510 = OpVariable Private 
					                                         f32 %512 = OpConstant 3,674022E-40 
					                                         f32 %514 = OpConstant 3,674022E-40 
					                                         f32 %526 = OpConstant 3,674022E-40 
					                                         f32 %548 = OpConstant 3,674022E-40 
					                                         f32 %573 = OpConstant 3,674022E-40 
					                                         f32 %599 = OpConstant 3,674022E-40 
					                                         f32 %601 = OpConstant 3,674022E-40 
					                                         f32 %609 = OpConstant 3,674022E-40 
					                                         f32 %674 = OpConstant 3,674022E-40 
					                                       f32_2 %675 = OpConstantComposite %674 %514 
					                                         f32 %689 = OpConstant 3,674022E-40 
					                                         f32 %704 = OpConstant 3,674022E-40 
					                                         f32 %713 = OpConstant 3,674022E-40 
					                                Private f32* %726 = OpVariable Private 
					                                         i32 %727 = OpConstant 9 
					                                         f32 %730 = OpConstant 3,674022E-40 
					                                         f32 %735 = OpConstant 3,674022E-40 
					                                       f32_2 %736 = OpConstantComposite %735 %735 
					                                         i32 %738 = OpConstant 6 
					                                         i32 %741 = OpConstant 7 
					                                         i32 %760 = OpConstant 8 
					                              Private f32_3* %766 = OpVariable Private 
					                                         i32 %801 = OpConstant 4 
					                                         i32 %818 = OpConstant 5 
					                              Private f32_3* %823 = OpVariable Private 
					                                             %828 = OpTypePointer Output %14 
					                               Output f32_4* %829 = OpVariable Output 
					                                             %838 = OpTypePointer Output %6 
					                               Private bool* %841 = OpVariable Private 
					                                             %842 = OpTypePointer Private %18 
					                                Private i32* %843 = OpVariable Private 
					                                Private i32* %844 = OpVariable Private 
					                               Private bool* %845 = OpVariable Private 
					                               Private bool* %846 = OpVariable Private 
					                                Private i32* %847 = OpVariable Private 
					                                Private i32* %848 = OpVariable Private 
					                                Private i32* %849 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %129 = OpVariable Function 
					                               Function i32* %164 = OpVariable Function 
					                               Function i32* %180 = OpVariable Function 
					                               Function f32* %288 = OpVariable Function 
					                             Function f32_2* %304 = OpVariable Function 
					                               Function i32* %363 = OpVariable Function 
					                               Function i32* %376 = OpVariable Function 
					                               Function f32* %462 = OpVariable Function 
					                             Function f32_2* %477 = OpVariable Function 
					                               Function f32* %664 = OpVariable Function 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %21 = OpAccessChain %17 %19 
					                                        f32_4 %22 = OpLoad %21 
					                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
					                                        f32_2 %24 = OpFMul %13 %23 
					                               Uniform f32_4* %25 = OpAccessChain %17 %19 
					                                        f32_4 %26 = OpLoad %25 
					                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
					                                        f32_2 %28 = OpFAdd %24 %27 
					                                        f32_3 %29 = OpLoad %9 
					                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
					                                                      OpStore %9 %30 
					                          read_only Texture2D %35 = OpLoad %34 
					                                      sampler %39 = OpLoad %38 
					                   read_only Texture2DSampled %41 = OpSampledImage %35 %39 
					                                        f32_3 %42 = OpLoad %9 
					                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
					                                        f32_4 %44 = OpImageSampleImplicitLod %41 %43 
					                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
					                                                      OpStore %31 %45 
					                                        f32_3 %46 = OpLoad %9 
					                                        f32_2 %47 = OpVectorShuffle %46 %46 0 1 
					                                        f32_2 %50 = OpFAdd %47 %49 
					                                        f32_3 %51 = OpLoad %9 
					                                        f32_3 %52 = OpVectorShuffle %51 %50 3 4 2 
					                                                      OpStore %9 %52 
					                                        f32_3 %55 = OpLoad %9 
					                                        f32_2 %56 = OpVectorShuffle %55 %55 0 1 
					                                        f32_3 %57 = OpLoad %9 
					                                        f32_2 %58 = OpVectorShuffle %57 %57 0 1 
					                                        f32_2 %59 = OpFAdd %56 %58 
					                                                      OpStore %54 %59 
					                                 Uniform f32* %63 = OpAccessChain %17 %61 
					                                          f32 %64 = OpLoad %63 
					                                        f32_2 %65 = OpCompositeConstruct %64 %64 
					                                        f32_2 %69 = OpFMul %65 %68 
					                                        f32_3 %70 = OpLoad %60 
					                                        f32_3 %71 = OpVectorShuffle %70 %69 3 4 2 
					                                                      OpStore %60 %71 
					                                 Private f32* %76 = OpAccessChain %60 %75 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpExtInst %1 8 %77 
					                                                      OpStore %73 %78 
					                                 Private f32* %80 = OpAccessChain %60 %79 
					                                          f32 %81 = OpLoad %80 
					                                          f32 %82 = OpExtInst %1 10 %81 
					                                 Private f32* %83 = OpAccessChain %60 %75 
					                                                      OpStore %83 %82 
					                                          f32 %85 = OpLoad %73 
					                                          f32 %86 = OpExtInst %1 13 %85 
					                                 Private f32* %87 = OpAccessChain %84 %75 
					                                                      OpStore %87 %86 
					                                 Private f32* %88 = OpAccessChain %84 %75 
					                                          f32 %89 = OpLoad %88 
					                                          f32 %91 = OpFMul %89 %90 
					                                 Private f32* %92 = OpAccessChain %84 %75 
					                                                      OpStore %92 %91 
					                                 Private f32* %93 = OpAccessChain %84 %75 
					                                          f32 %94 = OpLoad %93 
					                                          f32 %95 = OpExtInst %1 10 %94 
					                                 Private f32* %96 = OpAccessChain %84 %75 
					                                                      OpStore %96 %95 
					                                          f32 %97 = OpLoad %73 
					                                          f32 %99 = OpFAdd %97 %98 
					                                                      OpStore %73 %99 
					                                         f32 %100 = OpLoad %73 
					                                         f32 %101 = OpExtInst %1 13 %100 
					                                                      OpStore %73 %101 
					                                         f32 %102 = OpLoad %73 
					                                         f32 %103 = OpFMul %102 %90 
					                                                      OpStore %73 %103 
					                                         f32 %104 = OpLoad %73 
					                                         f32 %105 = OpExtInst %1 10 %104 
					                                                      OpStore %73 %105 
					                                Private f32* %106 = OpAccessChain %84 %75 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFNegate %107 
					                                         f32 %109 = OpLoad %73 
					                                         f32 %110 = OpFAdd %108 %109 
					                                                      OpStore %73 %110 
					                                Private f32* %111 = OpAccessChain %60 %75 
					                                         f32 %112 = OpLoad %111 
					                                         f32 %113 = OpLoad %73 
					                                         f32 %114 = OpFMul %112 %113 
					                                Private f32* %115 = OpAccessChain %84 %75 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFAdd %114 %116 
					                                                      OpStore %73 %117 
					                                         f32 %118 = OpLoad %73 
					                                         f32 %120 = OpFMul %118 %119 
					                                         f32 %122 = OpFAdd %120 %121 
					                                                      OpStore %73 %122 
					                                Private f32* %124 = OpAccessChain %60 %75 
					                                                      OpStore %124 %123 
					                                Private f32* %126 = OpAccessChain %84 %75 
					                                                      OpStore %126 %125 
					                                Private f32* %127 = OpAccessChain %84 %79 
					                                                      OpStore %127 %98 
					                                                      OpStore %129 %61 
					                                                      OpBranch %130 
					                                             %130 = OpLabel 
					                                                      OpLoopMerge %132 %133 None 
					                                                      OpBranch %134 
					                                             %134 = OpLabel 
					                                         i32 %135 = OpLoad %129 
					                                        bool %138 = OpSLessThan %135 %136 
					                                                      OpBranchConditional %138 %131 %132 
					                                             %131 = OpLabel 
					                                       f32_2 %140 = OpLoad %54 
					                                       f32_2 %141 = OpLoad %84 
					                                       f32_2 %142 = OpVectorShuffle %141 %141 1 1 
					                                       f32_2 %143 = OpFMul %140 %142 
					                                       f32_3 %144 = OpLoad %139 
					                                       f32_3 %145 = OpVectorShuffle %144 %143 3 4 2 
					                                                      OpStore %139 %145 
					                                       f32_2 %147 = OpLoad %54 
					                                       f32_2 %148 = OpLoad %84 
					                                       f32_2 %149 = OpVectorShuffle %148 %148 1 1 
					                                       f32_2 %150 = OpFMul %147 %149 
					                                       f32_2 %153 = OpFAdd %150 %152 
					                                                      OpStore %146 %153 
					                                       f32_2 %154 = OpLoad %146 
					                                       f32_2 %155 = OpExtInst %1 8 %154 
					                                                      OpStore %146 %155 
					                                       f32_3 %157 = OpLoad %139 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
					                                       f32_2 %159 = OpExtInst %1 10 %158 
					                                                      OpStore %156 %159 
					                                Private f32* %162 = OpAccessChain %160 %75 
					                                                      OpStore %162 %161 
					                                Private f32* %163 = OpAccessChain %160 %79 
					                                                      OpStore %163 %161 
					                                                      OpStore %164 %165 
					                                                      OpBranch %166 
					                                             %166 = OpLabel 
					                                                      OpLoopMerge %168 %169 None 
					                                                      OpBranch %170 
					                                             %170 = OpLabel 
					                                         i32 %171 = OpLoad %164 
					                                        bool %173 = OpSLessThanEqual %171 %172 
					                                                      OpBranchConditional %173 %167 %168 
					                                             %167 = OpLabel 
					                                         i32 %175 = OpLoad %164 
					                                         f32 %176 = OpConvertSToF %175 
					                                Private f32* %177 = OpAccessChain %174 %79 
					                                                      OpStore %177 %176 
					                                       f32_2 %179 = OpLoad %160 
					                                                      OpStore %178 %179 
					                                                      OpStore %180 %165 
					                                                      OpBranch %181 
					                                             %181 = OpLabel 
					                                                      OpLoopMerge %183 %184 None 
					                                                      OpBranch %185 
					                                             %185 = OpLabel 
					                                         i32 %186 = OpLoad %180 
					                                        bool %187 = OpSLessThanEqual %186 %172 
					                                                      OpBranchConditional %187 %182 %183 
					                                             %182 = OpLabel 
					                                         i32 %188 = OpLoad %180 
					                                         f32 %189 = OpConvertSToF %188 
					                                Private f32* %190 = OpAccessChain %174 %75 
					                                                      OpStore %190 %189 
					                                       f32_2 %192 = OpLoad %156 
					                                       f32_2 %193 = OpFNegate %192 
					                                       f32_3 %194 = OpLoad %174 
					                                       f32_2 %195 = OpVectorShuffle %194 %194 0 1 
					                                       f32_2 %196 = OpFAdd %193 %195 
					                                                      OpStore %191 %196 
					                                       f32_2 %198 = OpLoad %146 
					                                       f32_3 %199 = OpLoad %174 
					                                       f32_2 %200 = OpVectorShuffle %199 %199 0 1 
					                                       f32_2 %201 = OpFAdd %198 %200 
					                                       f32_3 %202 = OpLoad %197 
					                                       f32_3 %203 = OpVectorShuffle %202 %201 3 4 2 
					                                                      OpStore %197 %203 
					                                       f32_3 %204 = OpLoad %197 
					                                       f32_2 %205 = OpVectorShuffle %204 %204 0 1 
					                                         f32 %209 = OpDot %205 %208 
					                                Private f32* %210 = OpAccessChain %174 %75 
					                                                      OpStore %210 %209 
					                                Private f32* %211 = OpAccessChain %174 %75 
					                                         f32 %212 = OpLoad %211 
					                                Uniform f32* %213 = OpAccessChain %17 %61 
					                                         f32 %214 = OpLoad %213 
					                                         f32 %215 = OpFAdd %212 %214 
					                                Private f32* %216 = OpAccessChain %174 %75 
					                                                      OpStore %216 %215 
					                                Private f32* %217 = OpAccessChain %174 %75 
					                                         f32 %218 = OpLoad %217 
					                                         f32 %219 = OpExtInst %1 13 %218 
					                                Private f32* %220 = OpAccessChain %174 %75 
					                                                      OpStore %220 %219 
					                                       f32_3 %221 = OpLoad %197 
					                                       f32_2 %222 = OpVectorShuffle %221 %221 0 1 
					                                         f32 %226 = OpDot %222 %225 
					                                Private f32* %227 = OpAccessChain %197 %75 
					                                                      OpStore %227 %226 
					                                Private f32* %228 = OpAccessChain %197 %75 
					                                         f32 %229 = OpLoad %228 
					                                Uniform f32* %230 = OpAccessChain %17 %61 
					                                         f32 %231 = OpLoad %230 
					                                         f32 %232 = OpFAdd %229 %231 
					                                Private f32* %233 = OpAccessChain %197 %75 
					                                                      OpStore %233 %232 
					                                Private f32* %234 = OpAccessChain %197 %75 
					                                         f32 %235 = OpLoad %234 
					                                         f32 %236 = OpExtInst %1 14 %235 
					                                Private f32* %237 = OpAccessChain %197 %75 
					                                                      OpStore %237 %236 
					                                Private f32* %239 = OpAccessChain %174 %75 
					                                         f32 %240 = OpLoad %239 
					                                         f32 %241 = OpExtInst %1 10 %240 
					                                Private f32* %242 = OpAccessChain %238 %75 
					                                                      OpStore %242 %241 
					                                Private f32* %243 = OpAccessChain %197 %75 
					                                         f32 %244 = OpLoad %243 
					                                         f32 %245 = OpExtInst %1 10 %244 
					                                Private f32* %246 = OpAccessChain %238 %79 
					                                                      OpStore %246 %245 
					                                       f32_3 %247 = OpLoad %238 
					                                       f32_2 %248 = OpVectorShuffle %247 %247 0 1 
					                                Uniform f32* %249 = OpAccessChain %17 %136 
					                                         f32 %250 = OpLoad %249 
					                                Uniform f32* %251 = OpAccessChain %17 %136 
					                                         f32 %252 = OpLoad %251 
					                                       f32_2 %253 = OpCompositeConstruct %250 %252 
					                                         f32 %254 = OpCompositeExtract %253 0 
					                                         f32 %255 = OpCompositeExtract %253 1 
					                                       f32_2 %256 = OpCompositeConstruct %254 %255 
					                                       f32_2 %257 = OpFMul %248 %256 
					                                       f32_2 %258 = OpLoad %191 
					                                       f32_2 %259 = OpFAdd %257 %258 
					                                       f32_3 %260 = OpLoad %174 
					                                       f32_3 %261 = OpVectorShuffle %260 %259 3 1 4 
					                                                      OpStore %174 %261 
					                                Private f32* %263 = OpAccessChain %174 %262 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %265 = OpExtInst %1 4 %264 
					                                Private f32* %266 = OpAccessChain %174 %75 
					                                         f32 %267 = OpLoad %266 
					                                         f32 %268 = OpExtInst %1 4 %267 
					                                         f32 %269 = OpExtInst %1 40 %265 %268 
					                                Private f32* %270 = OpAccessChain %197 %75 
					                                                      OpStore %270 %269 
					                                       f32_3 %274 = OpLoad %197 
					                                       f32_4 %275 = OpVectorShuffle %274 %274 0 0 0 0 
					                                       f32_2 %276 = OpLoad %178 
					                                       f32_4 %277 = OpVectorShuffle %276 %276 0 0 1 0 
					                                      bool_4 %279 = OpFOrdLessThan %275 %277 
					                                      bool_2 %281 = OpVectorShuffle %279 %279 0 2 
					                                      bool_3 %282 = OpLoad %273 
					                                      bool_3 %283 = OpVectorShuffle %282 %281 3 1 4 
					                                                      OpStore %273 %283 
					                               Private bool* %285 = OpAccessChain %273 %262 
					                                        bool %286 = OpLoad %285 
					                                                      OpSelectionMerge %290 None 
					                                                      OpBranchConditional %286 %289 %293 
					                                             %289 = OpLabel 
					                                Private f32* %291 = OpAccessChain %197 %75 
					                                         f32 %292 = OpLoad %291 
					                                                      OpStore %288 %292 
					                                                      OpBranch %290 
					                                             %293 = OpLabel 
					                                Private f32* %294 = OpAccessChain %178 %79 
					                                         f32 %295 = OpLoad %294 
					                                                      OpStore %288 %295 
					                                                      OpBranch %290 
					                                             %290 = OpLabel 
					                                         f32 %296 = OpLoad %288 
					                                Private f32* %297 = OpAccessChain %197 %262 
					                                                      OpStore %297 %296 
					                                Private f32* %298 = OpAccessChain %178 %75 
					                                         f32 %299 = OpLoad %298 
					                                Private f32* %300 = OpAccessChain %197 %79 
					                                                      OpStore %300 %299 
					                               Private bool* %301 = OpAccessChain %273 %75 
					                                        bool %302 = OpLoad %301 
					                                                      OpSelectionMerge %306 None 
					                                                      OpBranchConditional %302 %305 %309 
					                                             %305 = OpLabel 
					                                       f32_3 %307 = OpLoad %197 
					                                       f32_2 %308 = OpVectorShuffle %307 %307 0 1 
					                                                      OpStore %304 %308 
					                                                      OpBranch %306 
					                                             %309 = OpLabel 
					                                       f32_3 %310 = OpLoad %197 
					                                       f32_2 %311 = OpVectorShuffle %310 %310 1 2 
					                                                      OpStore %304 %311 
					                                                      OpBranch %306 
					                                             %306 = OpLabel 
					                                       f32_2 %312 = OpLoad %304 
					                                                      OpStore %178 %312 
					                                                      OpBranch %184 
					                                             %184 = OpLabel 
					                                         i32 %313 = OpLoad %180 
					                                         i32 %314 = OpIAdd %313 %172 
					                                                      OpStore %180 %314 
					                                                      OpBranch %181 
					                                             %183 = OpLabel 
					                                       f32_2 %315 = OpLoad %178 
					                                                      OpStore %160 %315 
					                                                      OpBranch %169 
					                                             %169 = OpLabel 
					                                         i32 %316 = OpLoad %164 
					                                         i32 %317 = OpIAdd %316 %172 
					                                                      OpStore %164 %317 
					                                                      OpBranch %166 
					                                             %168 = OpLabel 
					                                Private f32* %318 = OpAccessChain %160 %75 
					                                         f32 %319 = OpLoad %318 
					                                         f32 %320 = OpFNegate %319 
					                                Uniform f32* %322 = OpAccessChain %17 %321 
					                                         f32 %323 = OpLoad %322 
					                                         f32 %324 = OpFMul %320 %323 
					                                Private f32* %325 = OpAccessChain %160 %79 
					                                         f32 %326 = OpLoad %325 
					                                         f32 %327 = OpFAdd %324 %326 
					                                Private f32* %328 = OpAccessChain %146 %75 
					                                                      OpStore %328 %327 
					                                         i32 %330 = OpLoad %129 
					                                        bool %331 = OpSLessThan %61 %330 
					                                                      OpStore %329 %331 
					                                        bool %332 = OpLoad %329 
					                                                      OpSelectionMerge %334 None 
					                                                      OpBranchConditional %332 %333 %334 
					                                             %333 = OpLabel 
					                                       f32_3 %335 = OpLoad %139 
					                                       f32_2 %336 = OpVectorShuffle %335 %335 0 1 
					                                       f32_2 %339 = OpFMul %336 %338 
					                                Uniform f32* %340 = OpAccessChain %17 %61 
					                                         f32 %341 = OpLoad %340 
					                                       f32_2 %342 = OpCompositeConstruct %341 %341 
					                                       f32_2 %343 = OpFAdd %339 %342 
					                                       f32_3 %344 = OpLoad %139 
					                                       f32_3 %345 = OpVectorShuffle %344 %343 3 4 2 
					                                                      OpStore %139 %345 
					                                       f32_3 %346 = OpLoad %139 
					                                       f32_2 %347 = OpVectorShuffle %346 %346 0 1 
					                                       f32_2 %350 = OpFAdd %347 %349 
					                                                      OpStore %156 %350 
					                                       f32_2 %351 = OpLoad %156 
					                                       f32_2 %352 = OpExtInst %1 8 %351 
					                                                      OpStore %156 %352 
					                                       f32_3 %353 = OpLoad %139 
					                                       f32_2 %354 = OpVectorShuffle %353 %353 0 1 
					                                       f32_2 %355 = OpExtInst %1 10 %354 
					                                       f32_3 %356 = OpLoad %139 
					                                       f32_3 %357 = OpVectorShuffle %356 %355 3 4 2 
					                                                      OpStore %139 %357 
					                                Private f32* %360 = OpAccessChain %359 %75 
					                                                      OpStore %360 %161 
					                                Private f32* %362 = OpAccessChain %359 %361 
					                                                      OpStore %362 %161 
					                                                      OpStore %363 %165 
					                                                      OpBranch %364 
					                                             %364 = OpLabel 
					                                                      OpLoopMerge %366 %367 None 
					                                                      OpBranch %368 
					                                             %368 = OpLabel 
					                                         i32 %369 = OpLoad %363 
					                                        bool %370 = OpSLessThanEqual %369 %172 
					                                                      OpBranchConditional %370 %365 %366 
					                                             %365 = OpLabel 
					                                         i32 %371 = OpLoad %363 
					                                         f32 %372 = OpConvertSToF %371 
					                                Private f32* %373 = OpAccessChain %174 %79 
					                                                      OpStore %373 %372 
					                                       f32_4 %374 = OpLoad %359 
					                                       f32_2 %375 = OpVectorShuffle %374 %374 0 3 
					                                                      OpStore %191 %375 
					                                                      OpStore %376 %165 
					                                                      OpBranch %377 
					                                             %377 = OpLabel 
					                                                      OpLoopMerge %379 %380 None 
					                                                      OpBranch %381 
					                                             %381 = OpLabel 
					                                         i32 %382 = OpLoad %376 
					                                        bool %383 = OpSLessThanEqual %382 %172 
					                                                      OpBranchConditional %383 %378 %379 
					                                             %378 = OpLabel 
					                                         i32 %384 = OpLoad %376 
					                                         f32 %385 = OpConvertSToF %384 
					                                Private f32* %386 = OpAccessChain %174 %75 
					                                                      OpStore %386 %385 
					                                       f32_3 %388 = OpLoad %139 
					                                       f32_2 %389 = OpVectorShuffle %388 %388 0 1 
					                                       f32_2 %390 = OpFNegate %389 
					                                       f32_3 %391 = OpLoad %174 
					                                       f32_2 %392 = OpVectorShuffle %391 %391 0 1 
					                                       f32_2 %393 = OpFAdd %390 %392 
					                                                      OpStore %387 %393 
					                                       f32_2 %394 = OpLoad %156 
					                                       f32_3 %395 = OpLoad %174 
					                                       f32_2 %396 = OpVectorShuffle %395 %395 0 1 
					                                       f32_2 %397 = OpFAdd %394 %396 
					                                       f32_3 %398 = OpLoad %238 
					                                       f32_3 %399 = OpVectorShuffle %398 %397 3 4 2 
					                                                      OpStore %238 %399 
					                                       f32_3 %400 = OpLoad %238 
					                                       f32_2 %401 = OpVectorShuffle %400 %400 0 1 
					                                         f32 %402 = OpDot %401 %208 
					                                Private f32* %403 = OpAccessChain %174 %75 
					                                                      OpStore %403 %402 
					                                Private f32* %404 = OpAccessChain %174 %75 
					                                         f32 %405 = OpLoad %404 
					                                Uniform f32* %406 = OpAccessChain %17 %61 
					                                         f32 %407 = OpLoad %406 
					                                         f32 %408 = OpFAdd %405 %407 
					                                Private f32* %409 = OpAccessChain %174 %75 
					                                                      OpStore %409 %408 
					                                Private f32* %410 = OpAccessChain %174 %75 
					                                         f32 %411 = OpLoad %410 
					                                         f32 %412 = OpExtInst %1 13 %411 
					                                Private f32* %413 = OpAccessChain %174 %75 
					                                                      OpStore %413 %412 
					                                       f32_3 %415 = OpLoad %238 
					                                       f32_2 %416 = OpVectorShuffle %415 %415 0 1 
					                                         f32 %417 = OpDot %416 %225 
					                                                      OpStore %414 %417 
					                                         f32 %418 = OpLoad %414 
					                                Uniform f32* %419 = OpAccessChain %17 %61 
					                                         f32 %420 = OpLoad %419 
					                                         f32 %421 = OpFAdd %418 %420 
					                                                      OpStore %414 %421 
					                                         f32 %422 = OpLoad %414 
					                                         f32 %423 = OpExtInst %1 14 %422 
					                                                      OpStore %414 %423 
					                                Private f32* %424 = OpAccessChain %174 %75 
					                                         f32 %425 = OpLoad %424 
					                                         f32 %426 = OpExtInst %1 10 %425 
					                                Private f32* %427 = OpAccessChain %238 %75 
					                                                      OpStore %427 %426 
					                                         f32 %428 = OpLoad %414 
					                                         f32 %429 = OpExtInst %1 10 %428 
					                                Private f32* %430 = OpAccessChain %238 %79 
					                                                      OpStore %430 %429 
					                                       f32_3 %431 = OpLoad %238 
					                                       f32_2 %432 = OpVectorShuffle %431 %431 0 1 
					                                Uniform f32* %433 = OpAccessChain %17 %136 
					                                         f32 %434 = OpLoad %433 
					                                Uniform f32* %435 = OpAccessChain %17 %136 
					                                         f32 %436 = OpLoad %435 
					                                       f32_2 %437 = OpCompositeConstruct %434 %436 
					                                         f32 %438 = OpCompositeExtract %437 0 
					                                         f32 %439 = OpCompositeExtract %437 1 
					                                       f32_2 %440 = OpCompositeConstruct %438 %439 
					                                       f32_2 %441 = OpFMul %432 %440 
					                                       f32_2 %442 = OpLoad %387 
					                                       f32_2 %443 = OpFAdd %441 %442 
					                                                      OpStore %387 %443 
					                                Private f32* %444 = OpAccessChain %387 %79 
					                                         f32 %445 = OpLoad %444 
					                                         f32 %446 = OpExtInst %1 4 %445 
					                                Private f32* %447 = OpAccessChain %387 %75 
					                                         f32 %448 = OpLoad %447 
					                                         f32 %449 = OpExtInst %1 4 %448 
					                                         f32 %450 = OpExtInst %1 40 %446 %449 
					                                Private f32* %451 = OpAccessChain %238 %75 
					                                                      OpStore %451 %450 
					                                       f32_3 %454 = OpLoad %238 
					                                       f32_4 %455 = OpVectorShuffle %454 %454 0 0 0 0 
					                                       f32_2 %456 = OpLoad %191 
					                                       f32_4 %457 = OpVectorShuffle %456 %456 0 1 0 0 
					                                      bool_4 %458 = OpFOrdLessThan %455 %457 
					                                      bool_2 %459 = OpVectorShuffle %458 %458 0 1 
					                                                      OpStore %453 %459 
					                               Private bool* %460 = OpAccessChain %453 %79 
					                                        bool %461 = OpLoad %460 
					                                                      OpSelectionMerge %464 None 
					                                                      OpBranchConditional %461 %463 %467 
					                                             %463 = OpLabel 
					                                Private f32* %465 = OpAccessChain %238 %75 
					                                         f32 %466 = OpLoad %465 
					                                                      OpStore %462 %466 
					                                                      OpBranch %464 
					                                             %467 = OpLabel 
					                                Private f32* %468 = OpAccessChain %191 %79 
					                                         f32 %469 = OpLoad %468 
					                                                      OpStore %462 %469 
					                                                      OpBranch %464 
					                                             %464 = OpLabel 
					                                         f32 %470 = OpLoad %462 
					                                Private f32* %471 = OpAccessChain %238 %262 
					                                                      OpStore %471 %470 
					                                Private f32* %472 = OpAccessChain %191 %75 
					                                         f32 %473 = OpLoad %472 
					                                Private f32* %474 = OpAccessChain %238 %79 
					                                                      OpStore %474 %473 
					                               Private bool* %475 = OpAccessChain %453 %75 
					                                        bool %476 = OpLoad %475 
					                                                      OpSelectionMerge %479 None 
					                                                      OpBranchConditional %476 %478 %482 
					                                             %478 = OpLabel 
					                                       f32_3 %480 = OpLoad %238 
					                                       f32_2 %481 = OpVectorShuffle %480 %480 0 1 
					                                                      OpStore %477 %481 
					                                                      OpBranch %479 
					                                             %482 = OpLabel 
					                                       f32_3 %483 = OpLoad %238 
					                                       f32_2 %484 = OpVectorShuffle %483 %483 1 2 
					                                                      OpStore %477 %484 
					                                                      OpBranch %479 
					                                             %479 = OpLabel 
					                                       f32_2 %485 = OpLoad %477 
					                                                      OpStore %191 %485 
					                                                      OpBranch %380 
					                                             %380 = OpLabel 
					                                         i32 %486 = OpLoad %376 
					                                         i32 %487 = OpIAdd %486 %172 
					                                                      OpStore %376 %487 
					                                                      OpBranch %377 
					                                             %379 = OpLabel 
					                                       f32_2 %488 = OpLoad %191 
					                                       f32_4 %489 = OpLoad %359 
					                                       f32_4 %490 = OpVectorShuffle %489 %488 4 1 2 5 
					                                                      OpStore %359 %490 
					                                                      OpBranch %367 
					                                             %367 = OpLabel 
					                                         i32 %491 = OpLoad %363 
					                                         i32 %492 = OpIAdd %491 %172 
					                                                      OpStore %363 %492 
					                                                      OpBranch %364 
					                                             %366 = OpLabel 
					                                Private f32* %493 = OpAccessChain %359 %75 
					                                         f32 %494 = OpLoad %493 
					                                         f32 %495 = OpFNegate %494 
					                                Uniform f32* %496 = OpAccessChain %17 %321 
					                                         f32 %497 = OpLoad %496 
					                                         f32 %498 = OpFMul %495 %497 
					                                Private f32* %499 = OpAccessChain %359 %361 
					                                         f32 %500 = OpLoad %499 
					                                         f32 %501 = OpFAdd %498 %500 
					                                Private f32* %502 = OpAccessChain %139 %75 
					                                                      OpStore %502 %501 
					                                Private f32* %504 = OpAccessChain %146 %75 
					                                         f32 %505 = OpLoad %504 
					                                         f32 %507 = OpFMul %505 %506 
					                                                      OpStore %503 %507 
					                                         f32 %508 = OpLoad %503 
					                                         f32 %509 = OpExtInst %1 43 %508 %123 %98 
					                                                      OpStore %503 %509 
					                                         f32 %511 = OpLoad %503 
					                                         f32 %513 = OpFMul %511 %512 
					                                         f32 %515 = OpFAdd %513 %514 
					                                                      OpStore %510 %515 
					                                         f32 %516 = OpLoad %503 
					                                         f32 %517 = OpLoad %503 
					                                         f32 %518 = OpFMul %516 %517 
					                                                      OpStore %503 %518 
					                                         f32 %519 = OpLoad %510 
					                                         f32 %520 = OpFNegate %519 
					                                         f32 %521 = OpLoad %503 
					                                         f32 %522 = OpFMul %520 %521 
					                                         f32 %523 = OpFAdd %522 %98 
					                                                      OpStore %503 %523 
					                                Private f32* %524 = OpAccessChain %139 %75 
					                                         f32 %525 = OpLoad %524 
					                                         f32 %527 = OpFMul %525 %526 
					                                Private f32* %528 = OpAccessChain %139 %75 
					                                                      OpStore %528 %527 
					                                Private f32* %529 = OpAccessChain %139 %75 
					                                         f32 %530 = OpLoad %529 
					                                         f32 %531 = OpExtInst %1 43 %530 %123 %98 
					                                Private f32* %532 = OpAccessChain %139 %75 
					                                                      OpStore %532 %531 
					                                Private f32* %533 = OpAccessChain %139 %75 
					                                         f32 %534 = OpLoad %533 
					                                         f32 %535 = OpFMul %534 %512 
					                                         f32 %536 = OpFAdd %535 %514 
					                                                      OpStore %510 %536 
					                                Private f32* %537 = OpAccessChain %139 %75 
					                                         f32 %538 = OpLoad %537 
					                                Private f32* %539 = OpAccessChain %139 %75 
					                                         f32 %540 = OpLoad %539 
					                                         f32 %541 = OpFMul %538 %540 
					                                Private f32* %542 = OpAccessChain %139 %75 
					                                                      OpStore %542 %541 
					                                         f32 %543 = OpLoad %510 
					                                         f32 %544 = OpFNegate %543 
					                                Private f32* %545 = OpAccessChain %139 %75 
					                                         f32 %546 = OpLoad %545 
					                                         f32 %547 = OpFMul %544 %546 
					                                         f32 %549 = OpFAdd %547 %548 
					                                Private f32* %550 = OpAccessChain %139 %75 
					                                                      OpStore %550 %549 
					                                Private f32* %551 = OpAccessChain %139 %75 
					                                         f32 %552 = OpLoad %551 
					                                         f32 %553 = OpLoad %503 
					                                         f32 %554 = OpFMul %552 %553 
					                                Private f32* %555 = OpAccessChain %139 %75 
					                                                      OpStore %555 %554 
					                                Private f32* %556 = OpAccessChain %139 %75 
					                                         f32 %557 = OpLoad %556 
					                                Private f32* %558 = OpAccessChain %139 %75 
					                                         f32 %559 = OpLoad %558 
					                                         f32 %560 = OpFMul %557 %559 
					                                Private f32* %561 = OpAccessChain %139 %75 
					                                                      OpStore %561 %560 
					                                Private f32* %562 = OpAccessChain %84 %75 
					                                         f32 %563 = OpLoad %562 
					                                Private f32* %564 = OpAccessChain %139 %75 
					                                         f32 %565 = OpLoad %564 
					                                         f32 %566 = OpFMul %563 %565 
					                                Private f32* %567 = OpAccessChain %60 %75 
					                                         f32 %568 = OpLoad %567 
					                                         f32 %569 = OpFAdd %566 %568 
					                                Private f32* %570 = OpAccessChain %60 %75 
					                                                      OpStore %570 %569 
					                                                      OpBranch %334 
					                                             %334 = OpLabel 
					                                Private f32* %571 = OpAccessChain %146 %75 
					                                         f32 %572 = OpLoad %571 
					                                         f32 %574 = OpFMul %572 %573 
					                                Private f32* %575 = OpAccessChain %139 %75 
					                                                      OpStore %575 %574 
					                                Private f32* %576 = OpAccessChain %139 %75 
					                                         f32 %577 = OpLoad %576 
					                                         f32 %578 = OpExtInst %1 43 %577 %123 %98 
					                                Private f32* %579 = OpAccessChain %139 %75 
					                                                      OpStore %579 %578 
					                                Private f32* %580 = OpAccessChain %139 %75 
					                                         f32 %581 = OpLoad %580 
					                                         f32 %582 = OpFMul %581 %512 
					                                         f32 %583 = OpFAdd %582 %514 
					                                                      OpStore %503 %583 
					                                Private f32* %584 = OpAccessChain %139 %75 
					                                         f32 %585 = OpLoad %584 
					                                Private f32* %586 = OpAccessChain %139 %75 
					                                         f32 %587 = OpLoad %586 
					                                         f32 %588 = OpFMul %585 %587 
					                                Private f32* %589 = OpAccessChain %139 %75 
					                                                      OpStore %589 %588 
					                                         f32 %590 = OpLoad %503 
					                                         f32 %591 = OpFNegate %590 
					                                Private f32* %592 = OpAccessChain %139 %75 
					                                         f32 %593 = OpLoad %592 
					                                         f32 %594 = OpFMul %591 %593 
					                                         f32 %595 = OpFAdd %594 %98 
					                                Private f32* %596 = OpAccessChain %139 %75 
					                                                      OpStore %596 %595 
					                                Private f32* %597 = OpAccessChain %139 %75 
					                                         f32 %598 = OpLoad %597 
					                                         f32 %600 = OpFMul %598 %599 
					                                         f32 %602 = OpFAdd %600 %601 
					                                Private f32* %603 = OpAccessChain %139 %75 
					                                                      OpStore %603 %602 
					                                Private f32* %604 = OpAccessChain %139 %75 
					                                         f32 %605 = OpLoad %604 
					                                         f32 %606 = OpExtInst %1 8 %605 
					                                                      OpStore %503 %606 
					                                Private f32* %607 = OpAccessChain %139 %75 
					                                         f32 %608 = OpLoad %607 
					                                         f32 %610 = OpFMul %608 %609 
					                                Private f32* %611 = OpAccessChain %139 %75 
					                                                      OpStore %611 %610 
					                                         f32 %612 = OpLoad %503 
					                                         f32 %613 = OpExtInst %1 13 %612 
					                                Private f32* %614 = OpAccessChain %146 %75 
					                                                      OpStore %614 %613 
					                                Private f32* %615 = OpAccessChain %146 %75 
					                                         f32 %616 = OpLoad %615 
					                                         f32 %617 = OpFMul %616 %90 
					                                Private f32* %618 = OpAccessChain %139 %262 
					                                                      OpStore %618 %617 
					                                         f32 %619 = OpLoad %503 
					                                         f32 %620 = OpFAdd %619 %98 
					                                                      OpStore %503 %620 
					                                         f32 %621 = OpLoad %503 
					                                         f32 %622 = OpExtInst %1 13 %621 
					                                                      OpStore %503 %622 
					                                         f32 %623 = OpLoad %503 
					                                         f32 %624 = OpFMul %623 %90 
					                                Private f32* %625 = OpAccessChain %139 %79 
					                                                      OpStore %625 %624 
					                                       f32_3 %626 = OpLoad %139 
					                                       f32_3 %627 = OpExtInst %1 10 %626 
					                                                      OpStore %139 %627 
					                                Private f32* %628 = OpAccessChain %139 %262 
					                                         f32 %629 = OpLoad %628 
					                                         f32 %630 = OpFNegate %629 
					                                Private f32* %631 = OpAccessChain %139 %79 
					                                         f32 %632 = OpLoad %631 
					                                         f32 %633 = OpFAdd %630 %632 
					                                                      OpStore %503 %633 
					                                Private f32* %634 = OpAccessChain %139 %75 
					                                         f32 %635 = OpLoad %634 
					                                         f32 %636 = OpLoad %503 
					                                         f32 %637 = OpFMul %635 %636 
					                                Private f32* %638 = OpAccessChain %139 %262 
					                                         f32 %639 = OpLoad %638 
					                                         f32 %640 = OpFAdd %637 %639 
					                                Private f32* %641 = OpAccessChain %139 %75 
					                                                      OpStore %641 %640 
					                                Private f32* %642 = OpAccessChain %84 %75 
					                                         f32 %643 = OpLoad %642 
					                                Private f32* %644 = OpAccessChain %139 %75 
					                                         f32 %645 = OpLoad %644 
					                                         f32 %646 = OpFMul %643 %645 
					                                                      OpStore %503 %646 
					                                         f32 %647 = OpLoad %503 
					                                         f32 %648 = OpLoad %73 
					                                         f32 %649 = OpFMul %647 %648 
					                                Private f32* %650 = OpAccessChain %60 %75 
					                                         f32 %651 = OpLoad %650 
					                                         f32 %652 = OpFAdd %649 %651 
					                                                      OpStore %503 %652 
					                                Private f32* %653 = OpAccessChain %84 %75 
					                                         f32 %654 = OpLoad %653 
					                                Private f32* %655 = OpAccessChain %139 %75 
					                                         f32 %656 = OpLoad %655 
					                                         f32 %657 = OpFMul %654 %656 
					                                Private f32* %658 = OpAccessChain %60 %75 
					                                         f32 %659 = OpLoad %658 
					                                         f32 %660 = OpFAdd %657 %659 
					                                Private f32* %661 = OpAccessChain %139 %75 
					                                                      OpStore %661 %660 
					                                         i32 %662 = OpLoad %129 
					                                        bool %663 = OpINotEqual %662 %61 
					                                                      OpSelectionMerge %666 None 
					                                                      OpBranchConditional %663 %665 %669 
					                                             %665 = OpLabel 
					                                Private f32* %667 = OpAccessChain %139 %75 
					                                         f32 %668 = OpLoad %667 
					                                                      OpStore %664 %668 
					                                                      OpBranch %666 
					                                             %669 = OpLabel 
					                                         f32 %670 = OpLoad %503 
					                                                      OpStore %664 %670 
					                                                      OpBranch %666 
					                                             %666 = OpLabel 
					                                         f32 %671 = OpLoad %664 
					                                Private f32* %672 = OpAccessChain %60 %75 
					                                                      OpStore %672 %671 
					                                       f32_2 %673 = OpLoad %84 
					                                       f32_2 %676 = OpFMul %673 %675 
					                                                      OpStore %84 %676 
					                                                      OpBranch %133 
					                                             %133 = OpLabel 
					                                         i32 %677 = OpLoad %129 
					                                         i32 %678 = OpIAdd %677 %172 
					                                                      OpStore %129 %678 
					                                                      OpBranch %130 
					                                             %132 = OpLabel 
					                                       f32_2 %679 = OpLoad %54 
					                                       f32_2 %680 = OpLoad %54 
					                                         f32 %681 = OpDot %679 %680 
					                                Private f32* %682 = OpAccessChain %54 %75 
					                                                      OpStore %682 %681 
					                                Private f32* %683 = OpAccessChain %54 %75 
					                                         f32 %684 = OpLoad %683 
					                                         f32 %685 = OpExtInst %1 31 %684 
					                                Private f32* %686 = OpAccessChain %54 %75 
					                                                      OpStore %686 %685 
					                                Private f32* %687 = OpAccessChain %54 %75 
					                                         f32 %688 = OpLoad %687 
					                                         f32 %690 = OpFMul %688 %689 
					                                Private f32* %691 = OpAccessChain %54 %75 
					                                                      OpStore %691 %690 
					                                Private f32* %692 = OpAccessChain %54 %75 
					                                         f32 %693 = OpLoad %692 
					                                         f32 %694 = OpExtInst %1 29 %693 
					                                Private f32* %695 = OpAccessChain %54 %75 
					                                                      OpStore %695 %694 
					                                Private f32* %696 = OpAccessChain %60 %75 
					                                         f32 %697 = OpLoad %696 
					                                Private f32* %698 = OpAccessChain %54 %75 
					                                         f32 %699 = OpLoad %698 
					                                         f32 %700 = OpFMul %697 %699 
					                                Private f32* %701 = OpAccessChain %54 %75 
					                                                      OpStore %701 %700 
					                                Private f32* %702 = OpAccessChain %54 %75 
					                                         f32 %703 = OpLoad %702 
					                                         f32 %705 = OpFMul %703 %704 
					                                Private f32* %706 = OpAccessChain %54 %75 
					                                                      OpStore %706 %705 
					                                Private f32* %707 = OpAccessChain %54 %75 
					                                         f32 %708 = OpLoad %707 
					                                         f32 %709 = OpExtInst %1 30 %708 
					                                Private f32* %710 = OpAccessChain %54 %75 
					                                                      OpStore %710 %709 
					                                Private f32* %711 = OpAccessChain %54 %75 
					                                         f32 %712 = OpLoad %711 
					                                         f32 %714 = OpFMul %712 %713 
					                                Private f32* %715 = OpAccessChain %54 %75 
					                                                      OpStore %715 %714 
					                                Private f32* %716 = OpAccessChain %54 %75 
					                                         f32 %717 = OpLoad %716 
					                                         f32 %718 = OpExtInst %1 29 %717 
					                                Private f32* %719 = OpAccessChain %54 %75 
					                                                      OpStore %719 %718 
					                                Private f32* %720 = OpAccessChain %54 %75 
					                                         f32 %721 = OpLoad %720 
					                                Uniform f32* %722 = OpAccessChain %17 %172 
					                                         f32 %723 = OpLoad %722 
					                                         f32 %724 = OpFMul %721 %723 
					                                Private f32* %725 = OpAccessChain %54 %75 
					                                                      OpStore %725 %724 
					                                Uniform f32* %728 = OpAccessChain %17 %727 
					                                         f32 %729 = OpLoad %728 
					                                         f32 %731 = OpFMul %729 %730 
					                                                      OpStore %726 %731 
					                                       f32_3 %732 = OpLoad %9 
					                                       f32_2 %733 = OpVectorShuffle %732 %732 0 1 
					                                       f32_2 %734 = OpFNegate %733 
					                                       f32_2 %737 = OpFMul %734 %736 
					                                Uniform f32* %739 = OpAccessChain %17 %738 
					                                         f32 %740 = OpLoad %739 
					                                Uniform f32* %742 = OpAccessChain %17 %741 
					                                         f32 %743 = OpLoad %742 
					                                       f32_2 %744 = OpCompositeConstruct %740 %743 
					                                       f32_2 %745 = OpFAdd %737 %744 
					                                       f32_3 %746 = OpLoad %9 
					                                       f32_3 %747 = OpVectorShuffle %746 %745 3 4 2 
					                                                      OpStore %9 %747 
					                                       f32_3 %748 = OpLoad %9 
					                                       f32_2 %749 = OpVectorShuffle %748 %748 0 1 
					                                       f32_3 %750 = OpLoad %9 
					                                       f32_2 %751 = OpVectorShuffle %750 %750 0 1 
					                                         f32 %752 = OpDot %749 %751 
					                                Private f32* %753 = OpAccessChain %9 %75 
					                                                      OpStore %753 %752 
					                                Private f32* %754 = OpAccessChain %9 %75 
					                                         f32 %755 = OpLoad %754 
					                                         f32 %756 = OpExtInst %1 31 %755 
					                                Private f32* %757 = OpAccessChain %9 %75 
					                                                      OpStore %757 %756 
					                                Private f32* %758 = OpAccessChain %9 %75 
					                                         f32 %759 = OpLoad %758 
					                                Uniform f32* %761 = OpAccessChain %17 %760 
					                                         f32 %762 = OpLoad %761 
					                                         f32 %763 = OpFNegate %762 
					                                         f32 %764 = OpFAdd %759 %763 
					                                Private f32* %765 = OpAccessChain %9 %75 
					                                                      OpStore %765 %764 
					                                         f32 %767 = OpLoad %726 
					                                         f32 %768 = OpFDiv %98 %767 
					                                Private f32* %769 = OpAccessChain %766 %75 
					                                                      OpStore %769 %768 
					                                Private f32* %770 = OpAccessChain %766 %75 
					                                         f32 %771 = OpLoad %770 
					                                Private f32* %772 = OpAccessChain %9 %75 
					                                         f32 %773 = OpLoad %772 
					                                         f32 %774 = OpFMul %771 %773 
					                                Private f32* %775 = OpAccessChain %9 %75 
					                                                      OpStore %775 %774 
					                                Private f32* %776 = OpAccessChain %9 %75 
					                                         f32 %777 = OpLoad %776 
					                                         f32 %778 = OpExtInst %1 43 %777 %123 %98 
					                                Private f32* %779 = OpAccessChain %9 %75 
					                                                      OpStore %779 %778 
					                                Private f32* %780 = OpAccessChain %9 %75 
					                                         f32 %781 = OpLoad %780 
					                                         f32 %782 = OpFMul %781 %512 
					                                         f32 %783 = OpFAdd %782 %514 
					                                Private f32* %784 = OpAccessChain %766 %75 
					                                                      OpStore %784 %783 
					                                Private f32* %785 = OpAccessChain %9 %75 
					                                         f32 %786 = OpLoad %785 
					                                Private f32* %787 = OpAccessChain %9 %75 
					                                         f32 %788 = OpLoad %787 
					                                         f32 %789 = OpFMul %786 %788 
					                                Private f32* %790 = OpAccessChain %9 %75 
					                                                      OpStore %790 %789 
					                                Private f32* %791 = OpAccessChain %766 %75 
					                                         f32 %792 = OpLoad %791 
					                                         f32 %793 = OpFNegate %792 
					                                Private f32* %794 = OpAccessChain %9 %75 
					                                         f32 %795 = OpLoad %794 
					                                         f32 %796 = OpFMul %793 %795 
					                                         f32 %797 = OpFAdd %796 %98 
					                                Private f32* %798 = OpAccessChain %9 %75 
					                                                      OpStore %798 %797 
					                                       f32_2 %799 = OpLoad %54 
					                                       f32_3 %800 = OpVectorShuffle %799 %799 0 0 0 
					                              Uniform f32_4* %802 = OpAccessChain %17 %801 
					                                       f32_4 %803 = OpLoad %802 
					                                       f32_3 %804 = OpVectorShuffle %803 %803 0 1 2 
					                                       f32_3 %805 = OpFMul %800 %804 
					                                       f32_3 %806 = OpLoad %31 
					                                       f32_3 %807 = OpFAdd %805 %806 
					                                                      OpStore %766 %807 
					                                       f32_3 %808 = OpLoad %766 
					                                       f32_3 %809 = OpFNegate %808 
					                                       f32_3 %810 = OpLoad %31 
					                                       f32_3 %811 = OpFAdd %809 %810 
					                                                      OpStore %60 %811 
					                                       f32_3 %812 = OpLoad %9 
					                                       f32_3 %813 = OpVectorShuffle %812 %812 0 0 0 
					                                       f32_3 %814 = OpLoad %60 
					                                       f32_3 %815 = OpFMul %813 %814 
					                                       f32_3 %816 = OpLoad %766 
					                                       f32_3 %817 = OpFAdd %815 %816 
					                                                      OpStore %9 %817 
					                                Uniform f32* %819 = OpAccessChain %17 %818 
					                                         f32 %820 = OpLoad %819 
					                                         f32 %821 = OpFNegate %820 
					                                         f32 %822 = OpFAdd %821 %98 
					                                                      OpStore %726 %822 
					                                       f32_3 %824 = OpLoad %9 
					                                       f32_3 %825 = OpFNegate %824 
					                                       f32_3 %826 = OpLoad %31 
					                                       f32_3 %827 = OpFAdd %825 %826 
					                                                      OpStore %823 %827 
					                                         f32 %830 = OpLoad %726 
					                                       f32_3 %831 = OpCompositeConstruct %830 %830 %830 
					                                       f32_3 %832 = OpLoad %823 
					                                       f32_3 %833 = OpFMul %831 %832 
					                                       f32_3 %834 = OpLoad %9 
					                                       f32_3 %835 = OpFAdd %833 %834 
					                                       f32_4 %836 = OpLoad %829 
					                                       f32_4 %837 = OpVectorShuffle %836 %835 4 5 6 3 
					                                                      OpStore %829 %837 
					                                 Output f32* %839 = OpAccessChain %829 %361 
					                                                      OpStore %839 %98 
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
						vec4 unused_0_2;
						float _Value;
						float _Value2;
						float _BorderSize;
						vec4 _BorderColor;
						float _AlphaHexa;
						float _PositionX;
						float _PositionY;
						float _Radius;
						float _SpotSize;
						vec4 unused_0_12;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					vec4 u_xlat5;
					int u_xlati5;
					vec3 u_xlat6;
					bvec3 u_xlatb6;
					vec3 u_xlat7;
					int u_xlati7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec2 u_xlat11;
					float u_xlat12;
					vec2 u_xlat14;
					bool u_xlatb14;
					vec2 u_xlat16;
					bvec2 u_xlatb16;
					vec2 u_xlat18;
					vec2 u_xlat21;
					vec2 u_xlat22;
					vec2 u_xlat24;
					bool u_xlatb24;
					float u_xlat27;
					float u_xlat28;
					int u_xlati29;
					float u_xlat30;
					int u_xlati30;
					bool u_xlatb30;
					int u_xlati32;
					float u_xlat34;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat18.xy = u_xlat0.xy + u_xlat0.xy;
					    u_xlat2.xy = vec2(_TimeX) * vec2(1.29999995, 3048.65601);
					    u_xlat28 = floor(u_xlat2.x);
					    u_xlat2.x = fract(u_xlat2.y);
					    u_xlat11.x = sin(u_xlat28);
					    u_xlat11.x = u_xlat11.x * 43758.5469;
					    u_xlat11.x = fract(u_xlat11.x);
					    u_xlat28 = u_xlat28 + 1.0;
					    u_xlat28 = sin(u_xlat28);
					    u_xlat28 = u_xlat28 * 43758.5469;
					    u_xlat28 = fract(u_xlat28);
					    u_xlat28 = (-u_xlat11.x) + u_xlat28;
					    u_xlat28 = u_xlat2.x * u_xlat28 + u_xlat11.x;
					    u_xlat28 = u_xlat28 * 0.800000012 + 0.400000006;
					    u_xlat2.x = float(0.0);
					    u_xlat11.x = float(0.600000024);
					    u_xlat11.y = float(1.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<3 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = u_xlat18.xy * u_xlat11.yy;
					        u_xlat21.xy = u_xlat18.xy * u_xlat11.yy + vec2(5.0, 5.0);
					        u_xlat21.xy = floor(u_xlat21.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat22.x = float(8.0);
					        u_xlat22.y = float(8.0);
					        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					        {
					            u_xlat6.y = float(u_xlati_loop_2);
					            u_xlat14.xy = u_xlat22.xy;
					            for(int u_xlati_loop_3 = int(0xFFFFFFFFu) ; u_xlati_loop_3<=1 ; u_xlati_loop_3++)
					            {
					                u_xlat6.x = float(u_xlati_loop_3);
					                u_xlat24.xy = (-u_xlat4.xy) + u_xlat6.xy;
					                u_xlat7.xy = u_xlat21.xy + u_xlat6.xy;
					                u_xlat6.x = dot(u_xlat7.xy, vec2(591.320007, 154.076996));
					                u_xlat6.x = u_xlat6.x + _TimeX;
					                u_xlat6.x = sin(u_xlat6.x);
					                u_xlat7.x = dot(u_xlat7.xy, vec2(391.320007, 49.0769997));
					                u_xlat7.x = u_xlat7.x + _TimeX;
					                u_xlat7.x = cos(u_xlat7.x);
					                u_xlat8.x = fract(u_xlat6.x);
					                u_xlat8.y = fract(u_xlat7.x);
					                u_xlat6.xz = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat24.xy;
					                u_xlat7.x = max(abs(u_xlat6.z), abs(u_xlat6.x));
					                u_xlatb6.xz = lessThan(u_xlat7.xxxx, u_xlat14.xxyx).xz;
					                u_xlat7.z = (u_xlatb6.z) ? u_xlat7.x : u_xlat14.y;
					                u_xlat7.y = u_xlat14.x;
					                u_xlat14.xy = (u_xlatb6.x) ? u_xlat7.xy : u_xlat7.yz;
					            }
					            u_xlat22.xy = u_xlat14.xy;
					        }
					        u_xlat21.x = (-u_xlat22.x) * _Value2 + u_xlat22.y;
					        u_xlatb30 = 0<u_xlati_loop_1;
					        if(u_xlatb30){
					            u_xlat3.xy = u_xlat3.xy * vec2(0.5, 0.5) + vec2(_TimeX);
					            u_xlat4.xy = u_xlat3.xy + vec2(50.0, 50.0);
					            u_xlat4.xy = floor(u_xlat4.xy);
					            u_xlat3.xy = fract(u_xlat3.xy);
					            u_xlat5.x = float(8.0);
					            u_xlat5.w = float(8.0);
					            for(int u_xlati_loop_4 = int(0xFFFFFFFFu) ; u_xlati_loop_4<=1 ; u_xlati_loop_4++)
					            {
					                u_xlat6.y = float(u_xlati_loop_4);
					                u_xlat24.xy = u_xlat5.xw;
					                for(int u_xlati_loop_5 = int(0xFFFFFFFFu) ; u_xlati_loop_5<=1 ; u_xlati_loop_5++)
					                {
					                    u_xlat6.x = float(u_xlati_loop_5);
					                    u_xlat16.xy = (-u_xlat3.xy) + u_xlat6.xy;
					                    u_xlat8.xy = u_xlat4.xy + u_xlat6.xy;
					                    u_xlat6.x = dot(u_xlat8.xy, vec2(591.320007, 154.076996));
					                    u_xlat6.x = u_xlat6.x + _TimeX;
					                    u_xlat6.x = sin(u_xlat6.x);
					                    u_xlat34 = dot(u_xlat8.xy, vec2(391.320007, 49.0769997));
					                    u_xlat34 = u_xlat34 + _TimeX;
					                    u_xlat34 = cos(u_xlat34);
					                    u_xlat8.x = fract(u_xlat6.x);
					                    u_xlat8.y = fract(u_xlat34);
					                    u_xlat16.xy = u_xlat8.xy * vec2(vec2(_BorderSize, _BorderSize)) + u_xlat16.xy;
					                    u_xlat8.x = max(abs(u_xlat16.y), abs(u_xlat16.x));
					                    u_xlatb16.xy = lessThan(u_xlat8.xxxx, u_xlat24.xyxx).xy;
					                    u_xlat8.z = (u_xlatb16.y) ? u_xlat8.x : u_xlat24.y;
					                    u_xlat8.y = u_xlat24.x;
					                    u_xlat24.xy = (u_xlatb16.x) ? u_xlat8.xy : u_xlat8.yz;
					                }
					                u_xlat5.xw = u_xlat24.xy;
					            }
					            u_xlat3.x = (-u_xlat5.x) * _Value2 + u_xlat5.w;
					            u_xlat12 = u_xlat21.x * 10.0;
					            u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					            u_xlat30 = u_xlat12 * -2.0 + 3.0;
					            u_xlat12 = u_xlat12 * u_xlat12;
					            u_xlat12 = (-u_xlat30) * u_xlat12 + 1.0;
					            u_xlat3.x = u_xlat3.x * 12.5;
					            u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					            u_xlat30 = u_xlat3.x * -2.0 + 3.0;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat3.x = (-u_xlat30) * u_xlat3.x + 1.5;
					            u_xlat3.x = u_xlat3.x * u_xlat12;
					            u_xlat3.x = u_xlat3.x * u_xlat3.x;
					            u_xlat2.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        //ENDIF
					        }
					        u_xlat3.x = u_xlat21.x * 3.33333325;
					        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					        u_xlat12 = u_xlat3.x * -2.0 + 3.0;
					        u_xlat3.x = u_xlat3.x * u_xlat3.x;
					        u_xlat3.x = (-u_xlat12) * u_xlat3.x + 1.0;
					        u_xlat3.x = u_xlat3.x * 5.5 + 0.100000001;
					        u_xlat12 = floor(u_xlat3.x);
					        u_xlat3.x = u_xlat3.x * 2345.12012;
					        u_xlat21.x = sin(u_xlat12);
					        u_xlat3.z = u_xlat21.x * 43758.5469;
					        u_xlat12 = u_xlat12 + 1.0;
					        u_xlat12 = sin(u_xlat12);
					        u_xlat3.y = u_xlat12 * 43758.5469;
					        u_xlat3.xyz = fract(u_xlat3.xyz);
					        u_xlat12 = (-u_xlat3.z) + u_xlat3.y;
					        u_xlat3.x = u_xlat3.x * u_xlat12 + u_xlat3.z;
					        u_xlat12 = u_xlat11.x * u_xlat3.x;
					        u_xlat12 = u_xlat12 * u_xlat28 + u_xlat2.x;
					        u_xlat3.x = u_xlat11.x * u_xlat3.x + u_xlat2.x;
					        u_xlat2.x = (u_xlati_loop_1 != 0) ? u_xlat3.x : u_xlat12;
					        u_xlat11.xy = u_xlat11.xy * vec2(0.699999988, 3.0);
					    }
					    u_xlat18.x = dot(u_xlat18.xy, u_xlat18.xy);
					    u_xlat18.x = sqrt(u_xlat18.x);
					    u_xlat18.x = u_xlat18.x * -0.865617037;
					    u_xlat18.x = exp2(u_xlat18.x);
					    u_xlat18.x = u_xlat2.x * u_xlat18.x;
					    u_xlat18.x = u_xlat18.x * 1.20000005;
					    u_xlat18.x = log2(u_xlat18.x);
					    u_xlat18.x = u_xlat18.x * 2.5;
					    u_xlat18.x = exp2(u_xlat18.x);
					    u_xlat18.x = u_xlat18.x * _Value;
					    u_xlat27 = _SpotSize * 0.150000006;
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(_PositionX, _PositionY);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Radius);
					    u_xlat9.x = float(1.0) / u_xlat27;
					    u_xlat0.x = u_xlat9.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat9.x) * u_xlat0.x + 1.0;
					    u_xlat9.xyz = u_xlat18.xxx * _BorderColor.xyz + u_xlat10_1.xyz;
					    u_xlat2.xyz = (-u_xlat9.xyz) + u_xlat10_1.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat9.xyz;
					    u_xlat27 = (-_AlphaHexa) + 1.0;
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat10_1.xyz;
					    SV_Target0.xyz = vec3(u_xlat27) * u_xlat1.xyz + u_xlat0.xyz;
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