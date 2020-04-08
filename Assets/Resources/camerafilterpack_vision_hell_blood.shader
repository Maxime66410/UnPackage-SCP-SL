Shader "CameraFilterPack/Vision_Hell_Blood" {
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
			GpuProgramID 65322
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float BloodAlternative1;
					uniform 	float BloodAlternative2;
					uniform 	float BloodAlternative3;
					uniform 	vec4 ColorBlood;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec3 u_xlat14;
					float u_xlat15;
					bool u_xlatb15;
					vec2 u_xlat18;
					float u_xlat19;
					vec2 u_xlat22;
					vec2 u_xlat24;
					float u_xlat25;
					bool u_xlatb25;
					vec2 u_xlat26;
					bool u_xlatb26;
					float u_xlat27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat34;
					bool u_xlatb34;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy + vec4(-0.5, -0.5, -0.4921875, -0.5);
					    u_xlat18.x = _Time.x * _Value3;
					    u_xlat2.x = sin(u_xlat18.x);
					    u_xlat3.x = cos(u_xlat18.x);
					    u_xlat3.x = u_xlat3.x * 0.375;
					    u_xlat3.y = u_xlat2.x * 0.100000001;
					    u_xlat2 = u_xlat1 * vec4(-2.57822871, 2.57822871, -2.57822871, 2.57822871);
					    u_xlat4.xy = u_xlat0.xy + vec2(-0.5, -0.4921875);
					    u_xlat4.xy = u_xlat4.xy * vec2(-2.57822871, 2.57822871);
					    u_xlat5 = float(0.0);
					    u_xlat14.x = float(0.0);
					    u_xlat14.y = float(0.0);
					    u_xlat14.z = float(0.0);
					    u_xlat27 = 0.0;
					    while(true){
					        u_xlatb28 = u_xlat27>=4.0;
					        if(u_xlatb28){break;}
					        u_xlat28 = (-u_xlat18.x) * 2.0 + u_xlat27;
					        u_xlat28 = u_xlat28 * 0.200000003;
					        u_xlat28 = fract(u_xlat28);
					        u_xlat22.xy = vec2(u_xlat28) * vec2(6.0, 6.28299999);
					        u_xlat28 = exp2(u_xlat22.x);
					        u_xlat28 = u_xlat28 * 0.5;
					        u_xlat30 = cos(u_xlat22.y);
					        u_xlat30 = (-u_xlat30) + 1.0;
					        u_xlat30 = u_xlat30 / u_xlat28;
					        u_xlat6 = u_xlat2 * vec4(u_xlat28) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat7 = floor(u_xlat6);
					        u_xlat6 = fract(u_xlat6);
					        u_xlat22.x = 1.0;
					        u_xlat8.x = -1.0;
					        while(true){
					            u_xlatb31 = u_xlat8.x>=1.10000002;
					            if(u_xlatb31){break;}
					            u_xlat31 = u_xlat22.x;
					            u_xlat8.y = -1.0;
					            while(true){
					                u_xlatb26 = u_xlat8.y>=1.10000002;
					                if(u_xlatb26){break;}
					                u_xlat26.xy = u_xlat7.xy + u_xlat8.xy;
					                u_xlat26.x = u_xlat26.y * 2.0 + u_xlat26.x;
					                u_xlat26.x = sin(u_xlat26.x);
					                u_xlat26.x = fract(u_xlat26.x);
					                u_xlat26.xy = u_xlat26.xx + u_xlat8.xy;
					                u_xlat26.xy = (-u_xlat6.xy) + u_xlat26.xy;
					                u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
					                u_xlat31 = min(u_xlat31, u_xlat26.x);
					                u_xlat8.y = u_xlat8.y + 1.0;
					            }
					            u_xlat22.x = u_xlat31;
					            u_xlat8.x = u_xlat8.x + 1.0;
					        }
					        u_xlat6.x = sqrt(u_xlat22.x);
					        u_xlat14.x = u_xlat6.x * u_xlat30 + u_xlat14.x;
					        u_xlat6.x = 1.0;
					        u_xlat7.x = -1.0;
					        while(true){
					            u_xlatb15 = u_xlat7.x>=1.10000002;
					            if(u_xlatb15){break;}
					            u_xlat15 = u_xlat6.x;
					            u_xlat7.y = -1.0;
					            while(true){
					                u_xlatb8 = u_xlat7.y>=1.10000002;
					                if(u_xlatb8){break;}
					                u_xlat8.xy = u_xlat7.xy + u_xlat7.zw;
					                u_xlat8.x = u_xlat8.y * 2.0 + u_xlat8.x;
					                u_xlat8.x = sin(u_xlat8.x);
					                u_xlat8.x = fract(u_xlat8.x);
					                u_xlat8.xy = u_xlat7.xy + u_xlat8.xx;
					                u_xlat8.xy = (-u_xlat6.zw) + u_xlat8.xy;
					                u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
					                u_xlat15 = min(u_xlat15, u_xlat8.x);
					                u_xlat7.y = u_xlat7.y + 1.0;
					            }
					            u_xlat6.x = u_xlat15;
					            u_xlat7.x = u_xlat7.x + 1.0;
					        }
					        u_xlat24.x = sqrt(u_xlat6.x);
					        u_xlat14.y = u_xlat24.x * u_xlat30 + u_xlat14.y;
					        u_xlat24.xy = u_xlat4.xy * vec2(u_xlat28) + vec2(0.100000001, 0.100000001);
					        u_xlat7.xy = floor(u_xlat24.xy);
					        u_xlat24.xy = fract(u_xlat24.xy);
					        u_xlat28 = 1.0;
					        u_xlat8.x = -1.0;
					        while(true){
					            u_xlatb25 = u_xlat8.x>=1.10000002;
					            if(u_xlatb25){break;}
					            u_xlat25 = u_xlat28;
					            u_xlat8.y = -1.0;
					            while(true){
					                u_xlatb34 = u_xlat8.y>=1.10000002;
					                if(u_xlatb34){break;}
					                u_xlat26.xy = u_xlat7.xy + u_xlat8.xy;
					                u_xlat34 = u_xlat26.y * 2.0 + u_xlat26.x;
					                u_xlat34 = sin(u_xlat34);
					                u_xlat34 = fract(u_xlat34);
					                u_xlat26.xy = vec2(u_xlat34) + u_xlat8.xy;
					                u_xlat26.xy = (-u_xlat24.xy) + u_xlat26.xy;
					                u_xlat34 = dot(u_xlat26.xy, u_xlat26.xy);
					                u_xlat25 = min(u_xlat34, u_xlat25);
					                u_xlat8.y = u_xlat8.y + 1.0;
					            }
					            u_xlat28 = u_xlat25;
					            u_xlat8.x = u_xlat8.x + 1.0;
					        }
					        u_xlat24.x = sqrt(u_xlat28);
					        u_xlat14.z = u_xlat24.x * u_xlat30 + u_xlat14.z;
					        u_xlat5 = u_xlat30 + u_xlat5;
					        u_xlat27 = u_xlat27 + 1.0;
					    }
					    u_xlat2.xyz = u_xlat14.xyz / vec3(u_xlat5);
					    u_xlat18.xy = (-u_xlat2.xx) + u_xlat2.yz;
					    u_xlat2.xy = u_xlat18.xy * vec2(25.6000004, 25.6000004);
					    u_xlat2.z = 0.0;
					    u_xlat2.xyz = (-u_xlat2.xyz) + vec3(BloodAlternative1, BloodAlternative2, BloodAlternative3);
					    u_xlat18.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18.x = inversesqrt(u_xlat18.x);
					    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
					    u_xlat1.z = 0.0;
					    u_xlat3.z = -1.0;
					    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
					    u_xlat18.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = sqrt(u_xlat18.x);
					    u_xlat3.xyz = u_xlat3.xyz / vec3(u_xlat27);
					    u_xlat18.x = u_xlat18.x * 0.150000006;
					    u_xlat18.x = u_xlat27 * 0.75 + u_xlat18.x;
					    u_xlat18.x = min(u_xlat18.x, 1.0);
					    u_xlat27 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = max(u_xlat27, 0.0);
					    u_xlat27 = u_xlat27 * u_xlat27;
					    u_xlat19 = u_xlat27 * u_xlat27;
					    u_xlat19 = u_xlat19 * 0.340000004;
					    u_xlat27 = u_xlat27 * 0.660000026 + u_xlat19;
					    u_xlat19 = dot((-u_xlat3.xyz), u_xlat2.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat19 = u_xlat2.z * (-u_xlat19) + (-u_xlat3.z);
					    u_xlat19 = max((-u_xlat19), 0.0);
					    u_xlat19 = u_xlat19 * u_xlat19;
					    u_xlat19 = u_xlat19 * u_xlat19;
					    u_xlat19 = u_xlat19 * u_xlat19;
					    u_xlat2 = ColorBlood.xyzx * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat27 = u_xlat27 + 0.5;
					    u_xlat3 = vec4(u_xlat19) * vec4(0.5, 0.850000024, 1.0, 0.5);
					    u_xlat2 = u_xlat2 * vec4(u_xlat27) + u_xlat3;
					    u_xlat2 = u_xlat18.xxxx * u_xlat2;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.5, 1.5, 1.5);
					    u_xlat18.xy = (-u_xlat2.ww) * vec2(0.225000009, 0.225000009) + u_xlat0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat18.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat2.xyz = (-u_xlat10_3.xyz) * vec3(_Value4) + u_xlat2.xyz;
					    u_xlat27 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat27 = sqrt(u_xlat27);
					    u_xlat27 = u_xlat27 + (-_Value);
					    u_xlat1.x = float(1.0) / (-_Value2);
					    u_xlat27 = u_xlat27 * u_xlat1.x;
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					    u_xlat1.x = u_xlat27 * -2.0 + 3.0;
					    u_xlat27 = u_xlat27 * u_xlat27;
					    u_xlat27 = u_xlat1.x * u_xlat27 + -1.0;
					    u_xlat27 = ColorBlood.w * u_xlat27 + 1.0;
					    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat2.xyz);
					    SV_Target0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat2.xyz;
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
					; Bound: 726
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %713 
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
					                                                      OpMemberDecorate %15 9 RelaxedPrecision 
					                                                      OpMemberDecorate %15 9 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %23 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %628 RelaxedPrecision 
					                                                      OpDecorate %631 RelaxedPrecision 
					                                                      OpDecorate %631 DescriptorSet 631 
					                                                      OpDecorate %631 Binding 631 
					                                                      OpDecorate %632 RelaxedPrecision 
					                                                      OpDecorate %635 RelaxedPrecision 
					                                                      OpDecorate %635 DescriptorSet 635 
					                                                      OpDecorate %635 Binding 635 
					                                                      OpDecorate %636 RelaxedPrecision 
					                                                      OpDecorate %641 RelaxedPrecision 
					                                                      OpDecorate %642 RelaxedPrecision 
					                                                      OpDecorate %643 RelaxedPrecision 
					                                                      OpDecorate %644 RelaxedPrecision 
					                                                      OpDecorate %649 RelaxedPrecision 
					                                                      OpDecorate %650 RelaxedPrecision 
					                                                      OpDecorate %651 RelaxedPrecision 
					                                                      OpDecorate %655 RelaxedPrecision 
					                                                      OpDecorate %656 RelaxedPrecision 
					                                                      OpDecorate %707 RelaxedPrecision 
					                                                      OpDecorate %713 Location 713 
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
					                                              %15 = OpTypeStruct %14 %6 %6 %6 %6 %6 %6 %6 %14 %14 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 9 
					                                              %20 = OpTypePointer Uniform %14 
					                                              %31 = OpTypePointer Private %14 
					                               Private f32_4* %32 = OpVariable Private 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                          f32 %36 = OpConstant 3,674022E-40 
					                                        f32_4 %37 = OpConstantComposite %35 %35 %36 %35 
					                                              %39 = OpTypePointer Private %10 
					                               Private f32_2* %40 = OpVariable Private 
					                                          i32 %41 = OpConstant 0 
					                                              %42 = OpTypeInt 32 0 
					                                          u32 %43 = OpConstant 0 
					                                              %44 = OpTypePointer Uniform %6 
					                                          i32 %47 = OpConstant 3 
					                                              %51 = OpTypePointer Private %6 
					                               Private f32_4* %53 = OpVariable Private 
					                               Private f32_4* %58 = OpVariable Private 
					                                          f32 %65 = OpConstant 3,674022E-40 
					                                          f32 %70 = OpConstant 3,674022E-40 
					                                          u32 %72 = OpConstant 1 
					                                          f32 %75 = OpConstant 3,674022E-40 
					                                          f32 %76 = OpConstant 3,674022E-40 
					                                        f32_4 %77 = OpConstantComposite %75 %76 %75 %76 
					                               Private f32_2* %79 = OpVariable Private 
					                                        f32_2 %82 = OpConstantComposite %35 %36 
					                                        f32_2 %85 = OpConstantComposite %75 %76 
					                                 Private f32* %87 = OpVariable Private 
					                                          f32 %88 = OpConstant 3,674022E-40 
					                               Private f32_3* %89 = OpVariable Private 
					                                          u32 %92 = OpConstant 2 
					                                 Private f32* %94 = OpVariable Private 
					                                             %100 = OpTypeBool 
					                                        bool %101 = OpConstantTrue 
					                                             %102 = OpTypePointer Private %100 
					                               Private bool* %103 = OpVariable Private 
					                                         f32 %105 = OpConstant 3,674022E-40 
					                                Private f32* %111 = OpVariable Private 
					                                         f32 %115 = OpConstant 3,674022E-40 
					                                         f32 %120 = OpConstant 3,674022E-40 
					                              Private f32_2* %124 = OpVariable Private 
					                                         f32 %127 = OpConstant 3,674022E-40 
					                                         f32 %128 = OpConstant 3,674022E-40 
					                                       f32_2 %129 = OpConstantComposite %127 %128 
					                                         f32 %135 = OpConstant 3,674022E-40 
					                                Private f32* %137 = OpVariable Private 
					                                         f32 %143 = OpConstant 3,674022E-40 
					                              Private f32_4* %148 = OpVariable Private 
					                                       f32_4 %153 = OpConstantComposite %70 %70 %70 %70 
					                              Private f32_4* %155 = OpVariable Private 
					                              Private f32_2* %161 = OpVariable Private 
					                                         f32 %162 = OpConstant 3,674022E-40 
					                               Private bool* %169 = OpVariable Private 
					                                         f32 %172 = OpConstant 3,674022E-40 
					                                Private f32* %178 = OpVariable Private 
					                               Private bool* %187 = OpVariable Private 
					                              Private f32_2* %195 = OpVariable Private 
					                               Private bool* %261 = OpVariable Private 
					                                Private f32* %269 = OpVariable Private 
					                               Private bool* %278 = OpVariable Private 
					                              Private f32_2* %334 = OpVariable Private 
					                                       f32_2 %351 = OpConstantComposite %70 %70 
					                               Private bool* %365 = OpVariable Private 
					                                Private f32* %373 = OpVariable Private 
					                               Private bool* %381 = OpVariable Private 
					                                Private f32* %393 = OpVariable Private 
					                                         f32 %456 = OpConstant 3,674022E-40 
					                                       f32_2 %457 = OpConstantComposite %456 %456 
					                                         i32 %465 = OpConstant 5 
					                                         i32 %468 = OpConstant 6 
					                                         i32 %471 = OpConstant 7 
					                                         f32 %523 = OpConstant 3,674022E-40 
					                                         f32 %527 = OpConstant 3,674022E-40 
					                                Private f32* %547 = OpVariable Private 
					                                         f32 %552 = OpConstant 3,674022E-40 
					                                         f32 %555 = OpConstant 3,674022E-40 
					                                         i32 %589 = OpConstant 8 
					                                       f32_4 %593 = OpConstantComposite %135 %135 %135 %135 
					                                         f32 %599 = OpConstant 3,674022E-40 
					                                       f32_4 %600 = OpConstantComposite %135 %599 %143 %135 
					                                         f32 %614 = OpConstant 3,674022E-40 
					                                       f32_3 %615 = OpConstantComposite %614 %614 %614 
					                                         f32 %622 = OpConstant 3,674022E-40 
					                                       f32_2 %623 = OpConstantComposite %622 %622 
					                              Private f32_3* %628 = OpVariable Private 
					                                             %629 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %630 = OpTypePointer UniformConstant %629 
					        UniformConstant read_only Texture2D* %631 = OpVariable UniformConstant 
					                                             %633 = OpTypeSampler 
					                                             %634 = OpTypePointer UniformConstant %633 
					                    UniformConstant sampler* %635 = OpVariable UniformConstant 
					                                             %637 = OpTypeSampledImage %629 
					                              Private f32_3* %642 = OpVariable Private 
					                                         i32 %652 = OpConstant 4 
					                                         i32 %670 = OpConstant 1 
					                                         i32 %675 = OpConstant 2 
					                                         f32 %688 = OpConstant 3,674022E-40 
					                                         f32 %690 = OpConstant 3,674022E-40 
					                                         u32 %701 = OpConstant 3 
					                                             %712 = OpTypePointer Output %14 
					                               Output f32_4* %713 = OpVariable Output 
					                                             %723 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
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
					                                        f32_3 %33 = OpLoad %9 
					                                        f32_4 %34 = OpVectorShuffle %33 %33 0 1 0 1 
					                                        f32_4 %38 = OpFAdd %34 %37 
					                                                      OpStore %32 %38 
					                                 Uniform f32* %45 = OpAccessChain %17 %41 %43 
					                                          f32 %46 = OpLoad %45 
					                                 Uniform f32* %48 = OpAccessChain %17 %47 
					                                          f32 %49 = OpLoad %48 
					                                          f32 %50 = OpFMul %46 %49 
					                                 Private f32* %52 = OpAccessChain %40 %43 
					                                                      OpStore %52 %50 
					                                 Private f32* %54 = OpAccessChain %40 %43 
					                                          f32 %55 = OpLoad %54 
					                                          f32 %56 = OpExtInst %1 13 %55 
					                                 Private f32* %57 = OpAccessChain %53 %43 
					                                                      OpStore %57 %56 
					                                 Private f32* %59 = OpAccessChain %40 %43 
					                                          f32 %60 = OpLoad %59 
					                                          f32 %61 = OpExtInst %1 14 %60 
					                                 Private f32* %62 = OpAccessChain %58 %43 
					                                                      OpStore %62 %61 
					                                 Private f32* %63 = OpAccessChain %58 %43 
					                                          f32 %64 = OpLoad %63 
					                                          f32 %66 = OpFMul %64 %65 
					                                 Private f32* %67 = OpAccessChain %58 %43 
					                                                      OpStore %67 %66 
					                                 Private f32* %68 = OpAccessChain %53 %43 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %71 = OpFMul %69 %70 
					                                 Private f32* %73 = OpAccessChain %58 %72 
					                                                      OpStore %73 %71 
					                                        f32_4 %74 = OpLoad %32 
					                                        f32_4 %78 = OpFMul %74 %77 
					                                                      OpStore %53 %78 
					                                        f32_3 %80 = OpLoad %9 
					                                        f32_2 %81 = OpVectorShuffle %80 %80 0 1 
					                                        f32_2 %83 = OpFAdd %81 %82 
					                                                      OpStore %79 %83 
					                                        f32_2 %84 = OpLoad %79 
					                                        f32_2 %86 = OpFMul %84 %85 
					                                                      OpStore %79 %86 
					                                                      OpStore %87 %88 
					                                 Private f32* %90 = OpAccessChain %89 %43 
					                                                      OpStore %90 %88 
					                                 Private f32* %91 = OpAccessChain %89 %72 
					                                                      OpStore %91 %88 
					                                 Private f32* %93 = OpAccessChain %89 %92 
					                                                      OpStore %93 %88 
					                                                      OpStore %94 %88 
					                                                      OpBranch %95 
					                                              %95 = OpLabel 
					                                                      OpLoopMerge %97 %98 None 
					                                                      OpBranch %99 
					                                              %99 = OpLabel 
					                                                      OpBranchConditional %101 %96 %97 
					                                              %96 = OpLabel 
					                                         f32 %104 = OpLoad %94 
					                                        bool %106 = OpFOrdGreaterThanEqual %104 %105 
					                                                      OpStore %103 %106 
					                                        bool %107 = OpLoad %103 
					                                                      OpSelectionMerge %109 None 
					                                                      OpBranchConditional %107 %108 %109 
					                                             %108 = OpLabel 
					                                                      OpBranch %97 
					                                             %109 = OpLabel 
					                                Private f32* %112 = OpAccessChain %40 %43 
					                                         f32 %113 = OpLoad %112 
					                                         f32 %114 = OpFNegate %113 
					                                         f32 %116 = OpFMul %114 %115 
					                                         f32 %117 = OpLoad %94 
					                                         f32 %118 = OpFAdd %116 %117 
					                                                      OpStore %111 %118 
					                                         f32 %119 = OpLoad %111 
					                                         f32 %121 = OpFMul %119 %120 
					                                                      OpStore %111 %121 
					                                         f32 %122 = OpLoad %111 
					                                         f32 %123 = OpExtInst %1 10 %122 
					                                                      OpStore %111 %123 
					                                         f32 %125 = OpLoad %111 
					                                       f32_2 %126 = OpCompositeConstruct %125 %125 
					                                       f32_2 %130 = OpFMul %126 %129 
					                                                      OpStore %124 %130 
					                                Private f32* %131 = OpAccessChain %124 %43 
					                                         f32 %132 = OpLoad %131 
					                                         f32 %133 = OpExtInst %1 29 %132 
					                                                      OpStore %111 %133 
					                                         f32 %134 = OpLoad %111 
					                                         f32 %136 = OpFMul %134 %135 
					                                                      OpStore %111 %136 
					                                Private f32* %138 = OpAccessChain %124 %72 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpExtInst %1 14 %139 
					                                                      OpStore %137 %140 
					                                         f32 %141 = OpLoad %137 
					                                         f32 %142 = OpFNegate %141 
					                                         f32 %144 = OpFAdd %142 %143 
					                                                      OpStore %137 %144 
					                                         f32 %145 = OpLoad %137 
					                                         f32 %146 = OpLoad %111 
					                                         f32 %147 = OpFDiv %145 %146 
					                                                      OpStore %137 %147 
					                                       f32_4 %149 = OpLoad %53 
					                                         f32 %150 = OpLoad %111 
					                                       f32_4 %151 = OpCompositeConstruct %150 %150 %150 %150 
					                                       f32_4 %152 = OpFMul %149 %151 
					                                       f32_4 %154 = OpFAdd %152 %153 
					                                                      OpStore %148 %154 
					                                       f32_4 %156 = OpLoad %148 
					                                       f32_4 %157 = OpExtInst %1 8 %156 
					                                                      OpStore %155 %157 
					                                       f32_4 %158 = OpLoad %148 
					                                       f32_4 %159 = OpExtInst %1 10 %158 
					                                                      OpStore %148 %159 
					                                Private f32* %160 = OpAccessChain %124 %43 
					                                                      OpStore %160 %143 
					                                Private f32* %163 = OpAccessChain %161 %43 
					                                                      OpStore %163 %162 
					                                                      OpBranch %164 
					                                             %164 = OpLabel 
					                                                      OpLoopMerge %166 %167 None 
					                                                      OpBranch %168 
					                                             %168 = OpLabel 
					                                                      OpBranchConditional %101 %165 %166 
					                                             %165 = OpLabel 
					                                Private f32* %170 = OpAccessChain %161 %43 
					                                         f32 %171 = OpLoad %170 
					                                        bool %173 = OpFOrdGreaterThanEqual %171 %172 
					                                                      OpStore %169 %173 
					                                        bool %174 = OpLoad %169 
					                                                      OpSelectionMerge %176 None 
					                                                      OpBranchConditional %174 %175 %176 
					                                             %175 = OpLabel 
					                                                      OpBranch %166 
					                                             %176 = OpLabel 
					                                Private f32* %179 = OpAccessChain %124 %43 
					                                         f32 %180 = OpLoad %179 
					                                                      OpStore %178 %180 
					                                Private f32* %181 = OpAccessChain %161 %72 
					                                                      OpStore %181 %162 
					                                                      OpBranch %182 
					                                             %182 = OpLabel 
					                                                      OpLoopMerge %184 %185 None 
					                                                      OpBranch %186 
					                                             %186 = OpLabel 
					                                                      OpBranchConditional %101 %183 %184 
					                                             %183 = OpLabel 
					                                Private f32* %188 = OpAccessChain %161 %72 
					                                         f32 %189 = OpLoad %188 
					                                        bool %190 = OpFOrdGreaterThanEqual %189 %172 
					                                                      OpStore %187 %190 
					                                        bool %191 = OpLoad %187 
					                                                      OpSelectionMerge %193 None 
					                                                      OpBranchConditional %191 %192 %193 
					                                             %192 = OpLabel 
					                                                      OpBranch %184 
					                                             %193 = OpLabel 
					                                       f32_4 %196 = OpLoad %155 
					                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
					                                       f32_2 %198 = OpLoad %161 
					                                       f32_2 %199 = OpFAdd %197 %198 
					                                                      OpStore %195 %199 
					                                Private f32* %200 = OpAccessChain %195 %72 
					                                         f32 %201 = OpLoad %200 
					                                         f32 %202 = OpFMul %201 %115 
					                                Private f32* %203 = OpAccessChain %195 %43 
					                                         f32 %204 = OpLoad %203 
					                                         f32 %205 = OpFAdd %202 %204 
					                                Private f32* %206 = OpAccessChain %195 %43 
					                                                      OpStore %206 %205 
					                                Private f32* %207 = OpAccessChain %195 %43 
					                                         f32 %208 = OpLoad %207 
					                                         f32 %209 = OpExtInst %1 13 %208 
					                                Private f32* %210 = OpAccessChain %195 %43 
					                                                      OpStore %210 %209 
					                                Private f32* %211 = OpAccessChain %195 %43 
					                                         f32 %212 = OpLoad %211 
					                                         f32 %213 = OpExtInst %1 10 %212 
					                                Private f32* %214 = OpAccessChain %195 %43 
					                                                      OpStore %214 %213 
					                                       f32_2 %215 = OpLoad %195 
					                                       f32_2 %216 = OpVectorShuffle %215 %215 0 0 
					                                       f32_2 %217 = OpLoad %161 
					                                       f32_2 %218 = OpFAdd %216 %217 
					                                                      OpStore %195 %218 
					                                       f32_4 %219 = OpLoad %148 
					                                       f32_2 %220 = OpVectorShuffle %219 %219 0 1 
					                                       f32_2 %221 = OpFNegate %220 
					                                       f32_2 %222 = OpLoad %195 
					                                       f32_2 %223 = OpFAdd %221 %222 
					                                                      OpStore %195 %223 
					                                       f32_2 %224 = OpLoad %195 
					                                       f32_2 %225 = OpLoad %195 
					                                         f32 %226 = OpDot %224 %225 
					                                Private f32* %227 = OpAccessChain %195 %43 
					                                                      OpStore %227 %226 
					                                         f32 %228 = OpLoad %178 
					                                Private f32* %229 = OpAccessChain %195 %43 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpExtInst %1 37 %228 %230 
					                                                      OpStore %178 %231 
					                                Private f32* %232 = OpAccessChain %161 %72 
					                                         f32 %233 = OpLoad %232 
					                                         f32 %234 = OpFAdd %233 %143 
					                                Private f32* %235 = OpAccessChain %161 %72 
					                                                      OpStore %235 %234 
					                                                      OpBranch %185 
					                                             %185 = OpLabel 
					                                                      OpBranch %182 
					                                             %184 = OpLabel 
					                                         f32 %236 = OpLoad %178 
					                                Private f32* %237 = OpAccessChain %124 %43 
					                                                      OpStore %237 %236 
					                                Private f32* %238 = OpAccessChain %161 %43 
					                                         f32 %239 = OpLoad %238 
					                                         f32 %240 = OpFAdd %239 %143 
					                                Private f32* %241 = OpAccessChain %161 %43 
					                                                      OpStore %241 %240 
					                                                      OpBranch %167 
					                                             %167 = OpLabel 
					                                                      OpBranch %164 
					                                             %166 = OpLabel 
					                                Private f32* %242 = OpAccessChain %124 %43 
					                                         f32 %243 = OpLoad %242 
					                                         f32 %244 = OpExtInst %1 31 %243 
					                                Private f32* %245 = OpAccessChain %148 %43 
					                                                      OpStore %245 %244 
					                                Private f32* %246 = OpAccessChain %148 %43 
					                                         f32 %247 = OpLoad %246 
					                                         f32 %248 = OpLoad %137 
					                                         f32 %249 = OpFMul %247 %248 
					                                Private f32* %250 = OpAccessChain %89 %43 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpFAdd %249 %251 
					                                Private f32* %253 = OpAccessChain %89 %43 
					                                                      OpStore %253 %252 
					                                Private f32* %254 = OpAccessChain %148 %43 
					                                                      OpStore %254 %143 
					                                Private f32* %255 = OpAccessChain %155 %43 
					                                                      OpStore %255 %162 
					                                                      OpBranch %256 
					                                             %256 = OpLabel 
					                                                      OpLoopMerge %258 %259 None 
					                                                      OpBranch %260 
					                                             %260 = OpLabel 
					                                                      OpBranchConditional %101 %257 %258 
					                                             %257 = OpLabel 
					                                Private f32* %262 = OpAccessChain %155 %43 
					                                         f32 %263 = OpLoad %262 
					                                        bool %264 = OpFOrdGreaterThanEqual %263 %172 
					                                                      OpStore %261 %264 
					                                        bool %265 = OpLoad %261 
					                                                      OpSelectionMerge %267 None 
					                                                      OpBranchConditional %265 %266 %267 
					                                             %266 = OpLabel 
					                                                      OpBranch %258 
					                                             %267 = OpLabel 
					                                Private f32* %270 = OpAccessChain %148 %43 
					                                         f32 %271 = OpLoad %270 
					                                                      OpStore %269 %271 
					                                Private f32* %272 = OpAccessChain %155 %72 
					                                                      OpStore %272 %162 
					                                                      OpBranch %273 
					                                             %273 = OpLabel 
					                                                      OpLoopMerge %275 %276 None 
					                                                      OpBranch %277 
					                                             %277 = OpLabel 
					                                                      OpBranchConditional %101 %274 %275 
					                                             %274 = OpLabel 
					                                Private f32* %279 = OpAccessChain %155 %72 
					                                         f32 %280 = OpLoad %279 
					                                        bool %281 = OpFOrdGreaterThanEqual %280 %172 
					                                                      OpStore %278 %281 
					                                        bool %282 = OpLoad %278 
					                                                      OpSelectionMerge %284 None 
					                                                      OpBranchConditional %282 %283 %284 
					                                             %283 = OpLabel 
					                                                      OpBranch %275 
					                                             %284 = OpLabel 
					                                       f32_4 %286 = OpLoad %155 
					                                       f32_2 %287 = OpVectorShuffle %286 %286 0 1 
					                                       f32_4 %288 = OpLoad %155 
					                                       f32_2 %289 = OpVectorShuffle %288 %288 2 3 
					                                       f32_2 %290 = OpFAdd %287 %289 
					                                                      OpStore %161 %290 
					                                Private f32* %291 = OpAccessChain %161 %72 
					                                         f32 %292 = OpLoad %291 
					                                         f32 %293 = OpFMul %292 %115 
					                                Private f32* %294 = OpAccessChain %161 %43 
					                                         f32 %295 = OpLoad %294 
					                                         f32 %296 = OpFAdd %293 %295 
					                                Private f32* %297 = OpAccessChain %161 %43 
					                                                      OpStore %297 %296 
					                                Private f32* %298 = OpAccessChain %161 %43 
					                                         f32 %299 = OpLoad %298 
					                                         f32 %300 = OpExtInst %1 13 %299 
					                                Private f32* %301 = OpAccessChain %161 %43 
					                                                      OpStore %301 %300 
					                                Private f32* %302 = OpAccessChain %161 %43 
					                                         f32 %303 = OpLoad %302 
					                                         f32 %304 = OpExtInst %1 10 %303 
					                                Private f32* %305 = OpAccessChain %161 %43 
					                                                      OpStore %305 %304 
					                                       f32_4 %306 = OpLoad %155 
					                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
					                                       f32_2 %308 = OpLoad %161 
					                                       f32_2 %309 = OpVectorShuffle %308 %308 0 0 
					                                       f32_2 %310 = OpFAdd %307 %309 
					                                                      OpStore %161 %310 
					                                       f32_4 %311 = OpLoad %148 
					                                       f32_2 %312 = OpVectorShuffle %311 %311 2 3 
					                                       f32_2 %313 = OpFNegate %312 
					                                       f32_2 %314 = OpLoad %161 
					                                       f32_2 %315 = OpFAdd %313 %314 
					                                                      OpStore %161 %315 
					                                       f32_2 %316 = OpLoad %161 
					                                       f32_2 %317 = OpLoad %161 
					                                         f32 %318 = OpDot %316 %317 
					                                Private f32* %319 = OpAccessChain %161 %43 
					                                                      OpStore %319 %318 
					                                         f32 %320 = OpLoad %269 
					                                Private f32* %321 = OpAccessChain %161 %43 
					                                         f32 %322 = OpLoad %321 
					                                         f32 %323 = OpExtInst %1 37 %320 %322 
					                                                      OpStore %269 %323 
					                                Private f32* %324 = OpAccessChain %155 %72 
					                                         f32 %325 = OpLoad %324 
					                                         f32 %326 = OpFAdd %325 %143 
					                                Private f32* %327 = OpAccessChain %155 %72 
					                                                      OpStore %327 %326 
					                                                      OpBranch %276 
					                                             %276 = OpLabel 
					                                                      OpBranch %273 
					                                             %275 = OpLabel 
					                                         f32 %328 = OpLoad %269 
					                                Private f32* %329 = OpAccessChain %148 %43 
					                                                      OpStore %329 %328 
					                                Private f32* %330 = OpAccessChain %155 %43 
					                                         f32 %331 = OpLoad %330 
					                                         f32 %332 = OpFAdd %331 %143 
					                                Private f32* %333 = OpAccessChain %155 %43 
					                                                      OpStore %333 %332 
					                                                      OpBranch %259 
					                                             %259 = OpLabel 
					                                                      OpBranch %256 
					                                             %258 = OpLabel 
					                                Private f32* %335 = OpAccessChain %148 %43 
					                                         f32 %336 = OpLoad %335 
					                                         f32 %337 = OpExtInst %1 31 %336 
					                                Private f32* %338 = OpAccessChain %334 %43 
					                                                      OpStore %338 %337 
					                                Private f32* %339 = OpAccessChain %334 %43 
					                                         f32 %340 = OpLoad %339 
					                                         f32 %341 = OpLoad %137 
					                                         f32 %342 = OpFMul %340 %341 
					                                Private f32* %343 = OpAccessChain %89 %72 
					                                         f32 %344 = OpLoad %343 
					                                         f32 %345 = OpFAdd %342 %344 
					                                Private f32* %346 = OpAccessChain %89 %72 
					                                                      OpStore %346 %345 
					                                       f32_2 %347 = OpLoad %79 
					                                         f32 %348 = OpLoad %111 
					                                       f32_2 %349 = OpCompositeConstruct %348 %348 
					                                       f32_2 %350 = OpFMul %347 %349 
					                                       f32_2 %352 = OpFAdd %350 %351 
					                                                      OpStore %334 %352 
					                                       f32_2 %353 = OpLoad %334 
					                                       f32_2 %354 = OpExtInst %1 8 %353 
					                                       f32_4 %355 = OpLoad %155 
					                                       f32_4 %356 = OpVectorShuffle %355 %354 4 5 2 3 
					                                                      OpStore %155 %356 
					                                       f32_2 %357 = OpLoad %334 
					                                       f32_2 %358 = OpExtInst %1 10 %357 
					                                                      OpStore %334 %358 
					                                                      OpStore %111 %143 
					                                Private f32* %359 = OpAccessChain %161 %43 
					                                                      OpStore %359 %162 
					                                                      OpBranch %360 
					                                             %360 = OpLabel 
					                                                      OpLoopMerge %362 %363 None 
					                                                      OpBranch %364 
					                                             %364 = OpLabel 
					                                                      OpBranchConditional %101 %361 %362 
					                                             %361 = OpLabel 
					                                Private f32* %366 = OpAccessChain %161 %43 
					                                         f32 %367 = OpLoad %366 
					                                        bool %368 = OpFOrdGreaterThanEqual %367 %172 
					                                                      OpStore %365 %368 
					                                        bool %369 = OpLoad %365 
					                                                      OpSelectionMerge %371 None 
					                                                      OpBranchConditional %369 %370 %371 
					                                             %370 = OpLabel 
					                                                      OpBranch %362 
					                                             %371 = OpLabel 
					                                         f32 %374 = OpLoad %111 
					                                                      OpStore %373 %374 
					                                Private f32* %375 = OpAccessChain %161 %72 
					                                                      OpStore %375 %162 
					                                                      OpBranch %376 
					                                             %376 = OpLabel 
					                                                      OpLoopMerge %378 %379 None 
					                                                      OpBranch %380 
					                                             %380 = OpLabel 
					                                                      OpBranchConditional %101 %377 %378 
					                                             %377 = OpLabel 
					                                Private f32* %382 = OpAccessChain %161 %72 
					                                         f32 %383 = OpLoad %382 
					                                        bool %384 = OpFOrdGreaterThanEqual %383 %172 
					                                                      OpStore %381 %384 
					                                        bool %385 = OpLoad %381 
					                                                      OpSelectionMerge %387 None 
					                                                      OpBranchConditional %385 %386 %387 
					                                             %386 = OpLabel 
					                                                      OpBranch %378 
					                                             %387 = OpLabel 
					                                       f32_4 %389 = OpLoad %155 
					                                       f32_2 %390 = OpVectorShuffle %389 %389 0 1 
					                                       f32_2 %391 = OpLoad %161 
					                                       f32_2 %392 = OpFAdd %390 %391 
					                                                      OpStore %195 %392 
					                                Private f32* %394 = OpAccessChain %195 %72 
					                                         f32 %395 = OpLoad %394 
					                                         f32 %396 = OpFMul %395 %115 
					                                Private f32* %397 = OpAccessChain %195 %43 
					                                         f32 %398 = OpLoad %397 
					                                         f32 %399 = OpFAdd %396 %398 
					                                                      OpStore %393 %399 
					                                         f32 %400 = OpLoad %393 
					                                         f32 %401 = OpExtInst %1 13 %400 
					                                                      OpStore %393 %401 
					                                         f32 %402 = OpLoad %393 
					                                         f32 %403 = OpExtInst %1 10 %402 
					                                                      OpStore %393 %403 
					                                         f32 %404 = OpLoad %393 
					                                       f32_2 %405 = OpCompositeConstruct %404 %404 
					                                       f32_2 %406 = OpLoad %161 
					                                       f32_2 %407 = OpFAdd %405 %406 
					                                                      OpStore %195 %407 
					                                       f32_2 %408 = OpLoad %334 
					                                       f32_2 %409 = OpFNegate %408 
					                                       f32_2 %410 = OpLoad %195 
					                                       f32_2 %411 = OpFAdd %409 %410 
					                                                      OpStore %195 %411 
					                                       f32_2 %412 = OpLoad %195 
					                                       f32_2 %413 = OpLoad %195 
					                                         f32 %414 = OpDot %412 %413 
					                                                      OpStore %393 %414 
					                                         f32 %415 = OpLoad %393 
					                                         f32 %416 = OpLoad %373 
					                                         f32 %417 = OpExtInst %1 37 %415 %416 
					                                                      OpStore %373 %417 
					                                Private f32* %418 = OpAccessChain %161 %72 
					                                         f32 %419 = OpLoad %418 
					                                         f32 %420 = OpFAdd %419 %143 
					                                Private f32* %421 = OpAccessChain %161 %72 
					                                                      OpStore %421 %420 
					                                                      OpBranch %379 
					                                             %379 = OpLabel 
					                                                      OpBranch %376 
					                                             %378 = OpLabel 
					                                         f32 %422 = OpLoad %373 
					                                                      OpStore %111 %422 
					                                Private f32* %423 = OpAccessChain %161 %43 
					                                         f32 %424 = OpLoad %423 
					                                         f32 %425 = OpFAdd %424 %143 
					                                Private f32* %426 = OpAccessChain %161 %43 
					                                                      OpStore %426 %425 
					                                                      OpBranch %363 
					                                             %363 = OpLabel 
					                                                      OpBranch %360 
					                                             %362 = OpLabel 
					                                         f32 %427 = OpLoad %111 
					                                         f32 %428 = OpExtInst %1 31 %427 
					                                Private f32* %429 = OpAccessChain %334 %43 
					                                                      OpStore %429 %428 
					                                Private f32* %430 = OpAccessChain %334 %43 
					                                         f32 %431 = OpLoad %430 
					                                         f32 %432 = OpLoad %137 
					                                         f32 %433 = OpFMul %431 %432 
					                                Private f32* %434 = OpAccessChain %89 %92 
					                                         f32 %435 = OpLoad %434 
					                                         f32 %436 = OpFAdd %433 %435 
					                                Private f32* %437 = OpAccessChain %89 %92 
					                                                      OpStore %437 %436 
					                                         f32 %438 = OpLoad %137 
					                                         f32 %439 = OpLoad %87 
					                                         f32 %440 = OpFAdd %438 %439 
					                                                      OpStore %87 %440 
					                                         f32 %441 = OpLoad %94 
					                                         f32 %442 = OpFAdd %441 %143 
					                                                      OpStore %94 %442 
					                                                      OpBranch %98 
					                                              %98 = OpLabel 
					                                                      OpBranch %95 
					                                              %97 = OpLabel 
					                                       f32_3 %443 = OpLoad %89 
					                                         f32 %444 = OpLoad %87 
					                                       f32_3 %445 = OpCompositeConstruct %444 %444 %444 
					                                       f32_3 %446 = OpFDiv %443 %445 
					                                       f32_4 %447 = OpLoad %53 
					                                       f32_4 %448 = OpVectorShuffle %447 %446 4 5 6 3 
					                                                      OpStore %53 %448 
					                                       f32_4 %449 = OpLoad %53 
					                                       f32_2 %450 = OpVectorShuffle %449 %449 0 0 
					                                       f32_2 %451 = OpFNegate %450 
					                                       f32_4 %452 = OpLoad %53 
					                                       f32_2 %453 = OpVectorShuffle %452 %452 1 2 
					                                       f32_2 %454 = OpFAdd %451 %453 
					                                                      OpStore %40 %454 
					                                       f32_2 %455 = OpLoad %40 
					                                       f32_2 %458 = OpFMul %455 %457 
					                                       f32_4 %459 = OpLoad %53 
					                                       f32_4 %460 = OpVectorShuffle %459 %458 4 5 2 3 
					                                                      OpStore %53 %460 
					                                Private f32* %461 = OpAccessChain %53 %92 
					                                                      OpStore %461 %88 
					                                       f32_4 %462 = OpLoad %53 
					                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
					                                       f32_3 %464 = OpFNegate %463 
					                                Uniform f32* %466 = OpAccessChain %17 %465 
					                                         f32 %467 = OpLoad %466 
					                                Uniform f32* %469 = OpAccessChain %17 %468 
					                                         f32 %470 = OpLoad %469 
					                                Uniform f32* %472 = OpAccessChain %17 %471 
					                                         f32 %473 = OpLoad %472 
					                                       f32_3 %474 = OpCompositeConstruct %467 %470 %473 
					                                       f32_3 %475 = OpFAdd %464 %474 
					                                       f32_4 %476 = OpLoad %53 
					                                       f32_4 %477 = OpVectorShuffle %476 %475 4 5 6 3 
					                                                      OpStore %53 %477 
					                                       f32_4 %478 = OpLoad %53 
					                                       f32_3 %479 = OpVectorShuffle %478 %478 0 1 2 
					                                       f32_4 %480 = OpLoad %53 
					                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 2 
					                                         f32 %482 = OpDot %479 %481 
					                                Private f32* %483 = OpAccessChain %40 %43 
					                                                      OpStore %483 %482 
					                                Private f32* %484 = OpAccessChain %40 %43 
					                                         f32 %485 = OpLoad %484 
					                                         f32 %486 = OpExtInst %1 32 %485 
					                                Private f32* %487 = OpAccessChain %40 %43 
					                                                      OpStore %487 %486 
					                                       f32_2 %488 = OpLoad %40 
					                                       f32_3 %489 = OpVectorShuffle %488 %488 0 0 0 
					                                       f32_4 %490 = OpLoad %53 
					                                       f32_3 %491 = OpVectorShuffle %490 %490 0 1 2 
					                                       f32_3 %492 = OpFMul %489 %491 
					                                       f32_4 %493 = OpLoad %53 
					                                       f32_4 %494 = OpVectorShuffle %493 %492 4 5 6 3 
					                                                      OpStore %53 %494 
					                                Private f32* %495 = OpAccessChain %32 %92 
					                                                      OpStore %495 %88 
					                                Private f32* %496 = OpAccessChain %58 %92 
					                                                      OpStore %496 %162 
					                                       f32_4 %497 = OpLoad %32 
					                                       f32_3 %498 = OpVectorShuffle %497 %497 0 1 2 
					                                       f32_3 %499 = OpFNegate %498 
					                                       f32_4 %500 = OpLoad %58 
					                                       f32_3 %501 = OpVectorShuffle %500 %500 0 1 2 
					                                       f32_3 %502 = OpFAdd %499 %501 
					                                       f32_4 %503 = OpLoad %58 
					                                       f32_4 %504 = OpVectorShuffle %503 %502 4 5 6 3 
					                                                      OpStore %58 %504 
					                                       f32_4 %505 = OpLoad %58 
					                                       f32_3 %506 = OpVectorShuffle %505 %505 0 1 2 
					                                       f32_4 %507 = OpLoad %58 
					                                       f32_3 %508 = OpVectorShuffle %507 %507 0 1 2 
					                                         f32 %509 = OpDot %506 %508 
					                                Private f32* %510 = OpAccessChain %40 %43 
					                                                      OpStore %510 %509 
					                                Private f32* %511 = OpAccessChain %40 %43 
					                                         f32 %512 = OpLoad %511 
					                                         f32 %513 = OpExtInst %1 31 %512 
					                                                      OpStore %94 %513 
					                                       f32_4 %514 = OpLoad %58 
					                                       f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
					                                         f32 %516 = OpLoad %94 
					                                       f32_3 %517 = OpCompositeConstruct %516 %516 %516 
					                                       f32_3 %518 = OpFDiv %515 %517 
					                                       f32_4 %519 = OpLoad %58 
					                                       f32_4 %520 = OpVectorShuffle %519 %518 4 5 6 3 
					                                                      OpStore %58 %520 
					                                Private f32* %521 = OpAccessChain %40 %43 
					                                         f32 %522 = OpLoad %521 
					                                         f32 %524 = OpFMul %522 %523 
					                                Private f32* %525 = OpAccessChain %40 %43 
					                                                      OpStore %525 %524 
					                                         f32 %526 = OpLoad %94 
					                                         f32 %528 = OpFMul %526 %527 
					                                Private f32* %529 = OpAccessChain %40 %43 
					                                         f32 %530 = OpLoad %529 
					                                         f32 %531 = OpFAdd %528 %530 
					                                Private f32* %532 = OpAccessChain %40 %43 
					                                                      OpStore %532 %531 
					                                Private f32* %533 = OpAccessChain %40 %43 
					                                         f32 %534 = OpLoad %533 
					                                         f32 %535 = OpExtInst %1 37 %534 %143 
					                                Private f32* %536 = OpAccessChain %40 %43 
					                                                      OpStore %536 %535 
					                                       f32_4 %537 = OpLoad %53 
					                                       f32_3 %538 = OpVectorShuffle %537 %537 0 1 2 
					                                       f32_4 %539 = OpLoad %58 
					                                       f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
					                                         f32 %541 = OpDot %538 %540 
					                                                      OpStore %94 %541 
					                                         f32 %542 = OpLoad %94 
					                                         f32 %543 = OpExtInst %1 40 %542 %88 
					                                                      OpStore %94 %543 
					                                         f32 %544 = OpLoad %94 
					                                         f32 %545 = OpLoad %94 
					                                         f32 %546 = OpFMul %544 %545 
					                                                      OpStore %94 %546 
					                                         f32 %548 = OpLoad %94 
					                                         f32 %549 = OpLoad %94 
					                                         f32 %550 = OpFMul %548 %549 
					                                                      OpStore %547 %550 
					                                         f32 %551 = OpLoad %547 
					                                         f32 %553 = OpFMul %551 %552 
					                                                      OpStore %547 %553 
					                                         f32 %554 = OpLoad %94 
					                                         f32 %556 = OpFMul %554 %555 
					                                         f32 %557 = OpLoad %547 
					                                         f32 %558 = OpFAdd %556 %557 
					                                                      OpStore %94 %558 
					                                       f32_4 %559 = OpLoad %58 
					                                       f32_3 %560 = OpVectorShuffle %559 %559 0 1 2 
					                                       f32_3 %561 = OpFNegate %560 
					                                       f32_4 %562 = OpLoad %53 
					                                       f32_3 %563 = OpVectorShuffle %562 %562 0 1 2 
					                                         f32 %564 = OpDot %561 %563 
					                                                      OpStore %547 %564 
					                                         f32 %565 = OpLoad %547 
					                                         f32 %566 = OpLoad %547 
					                                         f32 %567 = OpFAdd %565 %566 
					                                                      OpStore %547 %567 
					                                Private f32* %568 = OpAccessChain %53 %92 
					                                         f32 %569 = OpLoad %568 
					                                         f32 %570 = OpLoad %547 
					                                         f32 %571 = OpFNegate %570 
					                                         f32 %572 = OpFMul %569 %571 
					                                Private f32* %573 = OpAccessChain %58 %92 
					                                         f32 %574 = OpLoad %573 
					                                         f32 %575 = OpFNegate %574 
					                                         f32 %576 = OpFAdd %572 %575 
					                                                      OpStore %547 %576 
					                                         f32 %577 = OpLoad %547 
					                                         f32 %578 = OpFNegate %577 
					                                         f32 %579 = OpExtInst %1 40 %578 %88 
					                                                      OpStore %547 %579 
					                                         f32 %580 = OpLoad %547 
					                                         f32 %581 = OpLoad %547 
					                                         f32 %582 = OpFMul %580 %581 
					                                                      OpStore %547 %582 
					                                         f32 %583 = OpLoad %547 
					                                         f32 %584 = OpLoad %547 
					                                         f32 %585 = OpFMul %583 %584 
					                                                      OpStore %547 %585 
					                                         f32 %586 = OpLoad %547 
					                                         f32 %587 = OpLoad %547 
					                                         f32 %588 = OpFMul %586 %587 
					                                                      OpStore %547 %588 
					                              Uniform f32_4* %590 = OpAccessChain %17 %589 
					                                       f32_4 %591 = OpLoad %590 
					                                       f32_4 %592 = OpVectorShuffle %591 %591 0 1 2 0 
					                                       f32_4 %594 = OpFMul %592 %593 
					                                                      OpStore %53 %594 
					                                         f32 %595 = OpLoad %94 
					                                         f32 %596 = OpFAdd %595 %135 
					                                                      OpStore %94 %596 
					                                         f32 %597 = OpLoad %547 
					                                       f32_4 %598 = OpCompositeConstruct %597 %597 %597 %597 
					                                       f32_4 %601 = OpFMul %598 %600 
					                                                      OpStore %58 %601 
					                                       f32_4 %602 = OpLoad %53 
					                                         f32 %603 = OpLoad %94 
					                                       f32_4 %604 = OpCompositeConstruct %603 %603 %603 %603 
					                                       f32_4 %605 = OpFMul %602 %604 
					                                       f32_4 %606 = OpLoad %58 
					                                       f32_4 %607 = OpFAdd %605 %606 
					                                                      OpStore %53 %607 
					                                       f32_2 %608 = OpLoad %40 
					                                       f32_4 %609 = OpVectorShuffle %608 %608 0 0 0 0 
					                                       f32_4 %610 = OpLoad %53 
					                                       f32_4 %611 = OpFMul %609 %610 
					                                                      OpStore %53 %611 
					                                       f32_4 %612 = OpLoad %53 
					                                       f32_3 %613 = OpVectorShuffle %612 %612 0 1 2 
					                                       f32_3 %616 = OpFMul %613 %615 
					                                       f32_4 %617 = OpLoad %53 
					                                       f32_4 %618 = OpVectorShuffle %617 %616 4 5 6 3 
					                                                      OpStore %53 %618 
					                                       f32_4 %619 = OpLoad %53 
					                                       f32_2 %620 = OpVectorShuffle %619 %619 3 3 
					                                       f32_2 %621 = OpFNegate %620 
					                                       f32_2 %624 = OpFMul %621 %623 
					                                       f32_3 %625 = OpLoad %9 
					                                       f32_2 %626 = OpVectorShuffle %625 %625 0 1 
					                                       f32_2 %627 = OpFAdd %624 %626 
					                                                      OpStore %40 %627 
					                         read_only Texture2D %632 = OpLoad %631 
					                                     sampler %636 = OpLoad %635 
					                  read_only Texture2DSampled %638 = OpSampledImage %632 %636 
					                                       f32_2 %639 = OpLoad %40 
					                                       f32_4 %640 = OpImageSampleImplicitLod %638 %639 
					                                       f32_3 %641 = OpVectorShuffle %640 %640 0 1 2 
					                                                      OpStore %628 %641 
					                         read_only Texture2D %643 = OpLoad %631 
					                                     sampler %644 = OpLoad %635 
					                  read_only Texture2DSampled %645 = OpSampledImage %643 %644 
					                                       f32_3 %646 = OpLoad %9 
					                                       f32_2 %647 = OpVectorShuffle %646 %646 0 1 
					                                       f32_4 %648 = OpImageSampleImplicitLod %645 %647 
					                                       f32_3 %649 = OpVectorShuffle %648 %648 0 1 2 
					                                                      OpStore %642 %649 
					                                       f32_3 %650 = OpLoad %628 
					                                       f32_3 %651 = OpFNegate %650 
					                                Uniform f32* %653 = OpAccessChain %17 %652 
					                                         f32 %654 = OpLoad %653 
					                                       f32_3 %655 = OpCompositeConstruct %654 %654 %654 
					                                       f32_3 %656 = OpFMul %651 %655 
					                                       f32_4 %657 = OpLoad %53 
					                                       f32_3 %658 = OpVectorShuffle %657 %657 0 1 2 
					                                       f32_3 %659 = OpFAdd %656 %658 
					                                       f32_4 %660 = OpLoad %53 
					                                       f32_4 %661 = OpVectorShuffle %660 %659 4 5 6 3 
					                                                      OpStore %53 %661 
					                                       f32_4 %662 = OpLoad %32 
					                                       f32_2 %663 = OpVectorShuffle %662 %662 0 1 
					                                       f32_4 %664 = OpLoad %32 
					                                       f32_2 %665 = OpVectorShuffle %664 %664 0 1 
					                                         f32 %666 = OpDot %663 %665 
					                                                      OpStore %94 %666 
					                                         f32 %667 = OpLoad %94 
					                                         f32 %668 = OpExtInst %1 31 %667 
					                                                      OpStore %94 %668 
					                                         f32 %669 = OpLoad %94 
					                                Uniform f32* %671 = OpAccessChain %17 %670 
					                                         f32 %672 = OpLoad %671 
					                                         f32 %673 = OpFNegate %672 
					                                         f32 %674 = OpFAdd %669 %673 
					                                                      OpStore %94 %674 
					                                Uniform f32* %676 = OpAccessChain %17 %675 
					                                         f32 %677 = OpLoad %676 
					                                         f32 %678 = OpFNegate %677 
					                                         f32 %679 = OpFDiv %143 %678 
					                                Private f32* %680 = OpAccessChain %32 %43 
					                                                      OpStore %680 %679 
					                                         f32 %681 = OpLoad %94 
					                                Private f32* %682 = OpAccessChain %32 %43 
					                                         f32 %683 = OpLoad %682 
					                                         f32 %684 = OpFMul %681 %683 
					                                                      OpStore %94 %684 
					                                         f32 %685 = OpLoad %94 
					                                         f32 %686 = OpExtInst %1 43 %685 %88 %143 
					                                                      OpStore %94 %686 
					                                         f32 %687 = OpLoad %94 
					                                         f32 %689 = OpFMul %687 %688 
					                                         f32 %691 = OpFAdd %689 %690 
					                                Private f32* %692 = OpAccessChain %32 %43 
					                                                      OpStore %692 %691 
					                                         f32 %693 = OpLoad %94 
					                                         f32 %694 = OpLoad %94 
					                                         f32 %695 = OpFMul %693 %694 
					                                                      OpStore %94 %695 
					                                Private f32* %696 = OpAccessChain %32 %43 
					                                         f32 %697 = OpLoad %696 
					                                         f32 %698 = OpLoad %94 
					                                         f32 %699 = OpFMul %697 %698 
					                                         f32 %700 = OpFAdd %699 %162 
					                                                      OpStore %94 %700 
					                                Uniform f32* %702 = OpAccessChain %17 %589 %701 
					                                         f32 %703 = OpLoad %702 
					                                         f32 %704 = OpLoad %94 
					                                         f32 %705 = OpFMul %703 %704 
					                                         f32 %706 = OpFAdd %705 %143 
					                                                      OpStore %94 %706 
					                                       f32_3 %707 = OpLoad %642 
					                                       f32_4 %708 = OpLoad %53 
					                                       f32_3 %709 = OpVectorShuffle %708 %708 0 1 2 
					                                       f32_3 %710 = OpFNegate %709 
					                                       f32_3 %711 = OpFAdd %707 %710 
					                                                      OpStore %9 %711 
					                                         f32 %714 = OpLoad %94 
					                                       f32_3 %715 = OpCompositeConstruct %714 %714 %714 
					                                       f32_3 %716 = OpLoad %9 
					                                       f32_3 %717 = OpFMul %715 %716 
					                                       f32_4 %718 = OpLoad %53 
					                                       f32_3 %719 = OpVectorShuffle %718 %718 0 1 2 
					                                       f32_3 %720 = OpFAdd %717 %719 
					                                       f32_4 %721 = OpLoad %713 
					                                       f32_4 %722 = OpVectorShuffle %721 %720 4 5 6 3 
					                                                      OpStore %713 %722 
					                                 Output f32* %724 = OpAccessChain %713 %701 
					                                                      OpStore %724 %143 
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
						float _Value;
						float _Value2;
						float _Value3;
						float _Value4;
						float BloodAlternative1;
						float BloodAlternative2;
						float BloodAlternative3;
						vec4 ColorBlood;
						vec4 unused_0_9;
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec3 u_xlat14;
					float u_xlat15;
					bool u_xlatb15;
					vec2 u_xlat18;
					float u_xlat19;
					vec2 u_xlat22;
					vec2 u_xlat24;
					float u_xlat25;
					bool u_xlatb25;
					vec2 u_xlat26;
					bool u_xlatb26;
					float u_xlat27;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat34;
					bool u_xlatb34;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy + vec4(-0.5, -0.5, -0.4921875, -0.5);
					    u_xlat18.x = _Value3 * _Time.x;
					    u_xlat2.x = sin(u_xlat18.x);
					    u_xlat3.x = cos(u_xlat18.x);
					    u_xlat3.x = u_xlat3.x * 0.375;
					    u_xlat3.y = u_xlat2.x * 0.100000001;
					    u_xlat2 = u_xlat1 * vec4(-2.57822871, 2.57822871, -2.57822871, 2.57822871);
					    u_xlat4.xy = u_xlat0.xy + vec2(-0.5, -0.4921875);
					    u_xlat4.xy = u_xlat4.xy * vec2(-2.57822871, 2.57822871);
					    u_xlat5 = float(0.0);
					    u_xlat14.x = float(0.0);
					    u_xlat14.y = float(0.0);
					    u_xlat14.z = float(0.0);
					    u_xlat27 = 0.0;
					    while(true){
					        u_xlatb28 = u_xlat27>=4.0;
					        if(u_xlatb28){break;}
					        u_xlat28 = (-u_xlat18.x) * 2.0 + u_xlat27;
					        u_xlat28 = u_xlat28 * 0.200000003;
					        u_xlat28 = fract(u_xlat28);
					        u_xlat22.xy = vec2(u_xlat28) * vec2(6.0, 6.28299999);
					        u_xlat28 = exp2(u_xlat22.x);
					        u_xlat28 = u_xlat28 * 0.5;
					        u_xlat30 = cos(u_xlat22.y);
					        u_xlat30 = (-u_xlat30) + 1.0;
					        u_xlat30 = u_xlat30 / u_xlat28;
					        u_xlat6 = u_xlat2 * vec4(u_xlat28) + vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001);
					        u_xlat7 = floor(u_xlat6);
					        u_xlat6 = fract(u_xlat6);
					        u_xlat22.x = 1.0;
					        u_xlat8.x = -1.0;
					        while(true){
					            u_xlatb31 = u_xlat8.x>=1.10000002;
					            if(u_xlatb31){break;}
					            u_xlat31 = u_xlat22.x;
					            u_xlat8.y = -1.0;
					            while(true){
					                u_xlatb26 = u_xlat8.y>=1.10000002;
					                if(u_xlatb26){break;}
					                u_xlat26.xy = u_xlat7.xy + u_xlat8.xy;
					                u_xlat26.x = u_xlat26.y * 2.0 + u_xlat26.x;
					                u_xlat26.x = sin(u_xlat26.x);
					                u_xlat26.x = fract(u_xlat26.x);
					                u_xlat26.xy = u_xlat26.xx + u_xlat8.xy;
					                u_xlat26.xy = (-u_xlat6.xy) + u_xlat26.xy;
					                u_xlat26.x = dot(u_xlat26.xy, u_xlat26.xy);
					                u_xlat31 = min(u_xlat31, u_xlat26.x);
					                u_xlat8.y = u_xlat8.y + 1.0;
					            }
					            u_xlat22.x = u_xlat31;
					            u_xlat8.x = u_xlat8.x + 1.0;
					        }
					        u_xlat6.x = sqrt(u_xlat22.x);
					        u_xlat14.x = u_xlat6.x * u_xlat30 + u_xlat14.x;
					        u_xlat6.x = 1.0;
					        u_xlat7.x = -1.0;
					        while(true){
					            u_xlatb15 = u_xlat7.x>=1.10000002;
					            if(u_xlatb15){break;}
					            u_xlat15 = u_xlat6.x;
					            u_xlat7.y = -1.0;
					            while(true){
					                u_xlatb8 = u_xlat7.y>=1.10000002;
					                if(u_xlatb8){break;}
					                u_xlat8.xy = u_xlat7.xy + u_xlat7.zw;
					                u_xlat8.x = u_xlat8.y * 2.0 + u_xlat8.x;
					                u_xlat8.x = sin(u_xlat8.x);
					                u_xlat8.x = fract(u_xlat8.x);
					                u_xlat8.xy = u_xlat7.xy + u_xlat8.xx;
					                u_xlat8.xy = (-u_xlat6.zw) + u_xlat8.xy;
					                u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
					                u_xlat15 = min(u_xlat15, u_xlat8.x);
					                u_xlat7.y = u_xlat7.y + 1.0;
					            }
					            u_xlat6.x = u_xlat15;
					            u_xlat7.x = u_xlat7.x + 1.0;
					        }
					        u_xlat24.x = sqrt(u_xlat6.x);
					        u_xlat14.y = u_xlat24.x * u_xlat30 + u_xlat14.y;
					        u_xlat24.xy = u_xlat4.xy * vec2(u_xlat28) + vec2(0.100000001, 0.100000001);
					        u_xlat7.xy = floor(u_xlat24.xy);
					        u_xlat24.xy = fract(u_xlat24.xy);
					        u_xlat28 = 1.0;
					        u_xlat8.x = -1.0;
					        while(true){
					            u_xlatb25 = u_xlat8.x>=1.10000002;
					            if(u_xlatb25){break;}
					            u_xlat25 = u_xlat28;
					            u_xlat8.y = -1.0;
					            while(true){
					                u_xlatb34 = u_xlat8.y>=1.10000002;
					                if(u_xlatb34){break;}
					                u_xlat26.xy = u_xlat7.xy + u_xlat8.xy;
					                u_xlat34 = u_xlat26.y * 2.0 + u_xlat26.x;
					                u_xlat34 = sin(u_xlat34);
					                u_xlat34 = fract(u_xlat34);
					                u_xlat26.xy = vec2(u_xlat34) + u_xlat8.xy;
					                u_xlat26.xy = (-u_xlat24.xy) + u_xlat26.xy;
					                u_xlat34 = dot(u_xlat26.xy, u_xlat26.xy);
					                u_xlat25 = min(u_xlat34, u_xlat25);
					                u_xlat8.y = u_xlat8.y + 1.0;
					            }
					            u_xlat28 = u_xlat25;
					            u_xlat8.x = u_xlat8.x + 1.0;
					        }
					        u_xlat24.x = sqrt(u_xlat28);
					        u_xlat14.z = u_xlat24.x * u_xlat30 + u_xlat14.z;
					        u_xlat5 = u_xlat30 + u_xlat5;
					        u_xlat27 = u_xlat27 + 1.0;
					    }
					    u_xlat2.xyz = u_xlat14.xyz / vec3(u_xlat5);
					    u_xlat18.xy = (-u_xlat2.xx) + u_xlat2.yz;
					    u_xlat2.xy = u_xlat18.xy * vec2(25.6000004, 25.6000004);
					    u_xlat2.z = 0.0;
					    u_xlat2.xyz = (-u_xlat2.xyz) + vec3(BloodAlternative1, BloodAlternative2, BloodAlternative3);
					    u_xlat18.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat18.x = inversesqrt(u_xlat18.x);
					    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
					    u_xlat1.z = 0.0;
					    u_xlat3.z = -1.0;
					    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
					    u_xlat18.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat27 = sqrt(u_xlat18.x);
					    u_xlat3.xyz = u_xlat3.xyz / vec3(u_xlat27);
					    u_xlat18.x = u_xlat18.x * 0.150000006;
					    u_xlat18.x = u_xlat27 * 0.75 + u_xlat18.x;
					    u_xlat18.x = min(u_xlat18.x, 1.0);
					    u_xlat27 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat27 = max(u_xlat27, 0.0);
					    u_xlat27 = u_xlat27 * u_xlat27;
					    u_xlat19 = u_xlat27 * u_xlat27;
					    u_xlat19 = u_xlat19 * 0.340000004;
					    u_xlat27 = u_xlat27 * 0.660000026 + u_xlat19;
					    u_xlat19 = dot((-u_xlat3.xyz), u_xlat2.xyz);
					    u_xlat19 = u_xlat19 + u_xlat19;
					    u_xlat19 = u_xlat2.z * (-u_xlat19) + (-u_xlat3.z);
					    u_xlat19 = max((-u_xlat19), 0.0);
					    u_xlat19 = u_xlat19 * u_xlat19;
					    u_xlat19 = u_xlat19 * u_xlat19;
					    u_xlat19 = u_xlat19 * u_xlat19;
					    u_xlat2 = ColorBlood.xyzx * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat27 = u_xlat27 + 0.5;
					    u_xlat3 = vec4(u_xlat19) * vec4(0.5, 0.850000024, 1.0, 0.5);
					    u_xlat2 = u_xlat2 * vec4(u_xlat27) + u_xlat3;
					    u_xlat2 = u_xlat18.xxxx * u_xlat2;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.5, 1.5, 1.5);
					    u_xlat18.xy = (-u_xlat2.ww) * vec2(0.225000009, 0.225000009) + u_xlat0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat18.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat2.xyz = (-u_xlat10_3.xyz) * vec3(_Value4) + u_xlat2.xyz;
					    u_xlat27 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat27 = sqrt(u_xlat27);
					    u_xlat27 = u_xlat27 + (-_Value);
					    u_xlat1.x = float(1.0) / (-_Value2);
					    u_xlat27 = u_xlat27 * u_xlat1.x;
					    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
					    u_xlat1.x = u_xlat27 * -2.0 + 3.0;
					    u_xlat27 = u_xlat27 * u_xlat27;
					    u_xlat27 = u_xlat1.x * u_xlat27 + -1.0;
					    u_xlat27 = ColorBlood.w * u_xlat27 + 1.0;
					    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat2.xyz);
					    SV_Target0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat2.xyz;
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