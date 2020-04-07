Shader "Hidden/Post FX/Temporal Anti-aliasing" {
	Properties {
		_MainTex ("", 2D) = "black" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 32191
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(binding = 1, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    vs_TEXCOORD0.y = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    vs_TEXCOORD0.xzw = in_TEXCOORD0.xxy;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _CameraDepthTexture_TexelSize;
					uniform 	vec2 _Jitter;
					uniform 	vec4 _SharpenParameters;
					uniform 	vec4 _FinalBlendParameters;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _CameraMotionVectorsTexture;
					UNITY_LOCATION(2) uniform  sampler2D _MainTex;
					UNITY_LOCATION(3) uniform  sampler2D _HistoryTex;
					layout(location = 0) in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat10_0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec3 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat5;
					float u_xlat7;
					vec2 u_xlat12;
					float u_xlat13;
					vec2 u_xlat15;
					float u_xlat18;
					float u_xlat19;
					float u_xlat16_19;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + (-_Jitter.xy);
					    u_xlat12.xy = (-_MainTex_TexelSize.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat12.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_4.xyz = u_xlat10_2.xyz + u_xlat10_2.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_4.xyz);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vec3(0.166666999, 0.166666999, 0.166666999) + u_xlat10_2.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * _SharpenParameters.xxx;
					    u_xlat2.xyz = u_xlat4.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_2.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = u_xlat2.xyz + u_xlat16_3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(0.142857, 0.142857, 0.142857);
					    u_xlat18 = max(u_xlat3.z, u_xlat3.y);
					    u_xlat18 = max(u_xlat18, u_xlat3.x);
					    u_xlat18 = u_xlat18 + 1.0;
					    u_xlat18 = float(1.0) / u_xlat18;
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat19 = max(u_xlat2.z, u_xlat2.y);
					    u_xlat19 = max(u_xlat19, u_xlat2.x);
					    u_xlat19 = u_xlat19 + 1.0;
					    u_xlat19 = float(1.0) / u_xlat19;
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat19 = dot(u_xlat2.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat18 = u_xlat18 + (-u_xlat19);
					    u_xlat16_19 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_19 = max(u_xlat16_19, u_xlat10_1.x);
					    u_xlat16_19 = u_xlat16_19 + 1.0;
					    u_xlat16_19 = float(1.0) / u_xlat16_19;
					    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat10_1.xyz;
					    u_xlat16_19 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_19 = max(u_xlat10_0.x, u_xlat16_19);
					    u_xlat16_19 = u_xlat16_19 + 1.0;
					    u_xlat16_19 = float(1.0) / u_xlat16_19;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(u_xlat16_19);
					    u_xlat16_3.xyz = min(u_xlat16_1.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat0.xyz = abs(vec3(u_xlat18)) * vec3(4.0, 4.0, 4.0) + u_xlat16_0.xyz;
					    u_xlat1.xyz = -abs(vec3(u_xlat18)) * vec3(4.0, 4.0, 4.0) + u_xlat16_3.xyz;
					    u_xlat3.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat3.xy = vs_TEXCOORD0.zw + (-_CameraDepthTexture_TexelSize.xy);
					    u_xlat3.z = texture(_CameraDepthTexture, u_xlat3.xy).x;
					    u_xlat4.z = texture(_CameraDepthTexture, vs_TEXCOORD0.zw).x;
					    u_xlatb19 = u_xlat4.z>=u_xlat3.z;
					    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
					    u_xlat3.x = float(-1.0);
					    u_xlat3.y = float(-1.0);
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat4.yyz);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat4.x = float(1.0);
					    u_xlat4.y = float(-1.0);
					    u_xlat5 = _CameraDepthTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.zwzw;
					    u_xlat4.z = texture(_CameraDepthTexture, u_xlat5.xy).x;
					    u_xlat5.z = texture(_CameraDepthTexture, u_xlat5.zw).x;
					    u_xlatb19 = u_xlat3.z>=u_xlat4.z;
					    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
					    u_xlat4.xyz = (-u_xlat3.yyz) + u_xlat4.xyz;
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat3.xyz;
					    u_xlat5.x = float(-1.0);
					    u_xlat5.y = float(1.0);
					    u_xlat5.w = float(0.0);
					    u_xlatb19 = u_xlat3.z>=u_xlat5.z;
					    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
					    u_xlat4.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat3.xyz;
					    u_xlat4.xy = vs_TEXCOORD0.zw + _CameraDepthTexture_TexelSize.xy;
					    u_xlat19 = texture(_CameraDepthTexture, u_xlat4.xy).x;
					    u_xlatb19 = u_xlat3.z>=u_xlat19;
					    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
					    u_xlat15.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
					    u_xlat3.xy = vec2(u_xlat19) * u_xlat15.xy + u_xlat3.xy;
					    u_xlat3.xy = u_xlat3.xy * _CameraDepthTexture_TexelSize.xy + vs_TEXCOORD0.zw;
					    u_xlat10_3.xy = texture(_CameraMotionVectorsTexture, u_xlat3.xy).xy;
					    u_xlat15.xy = (-u_xlat10_3.xy) + vs_TEXCOORD0.zw;
					    u_xlat16_19 = dot(u_xlat10_3.xy, u_xlat10_3.xy);
					    u_xlat16_19 = sqrt(u_xlat16_19);
					    u_xlat10_3 = texture(_HistoryTex, u_xlat15.xy);
					    u_xlat16_4.x = max(u_xlat10_3.z, u_xlat10_3.y);
					    u_xlat16_4.x = max(u_xlat10_3.x, u_xlat16_4.x);
					    u_xlat16_4.x = u_xlat16_4.x + 1.0;
					    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
					    u_xlat5.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx + (-u_xlat0.xyz);
					    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx;
					    u_xlat0.w = u_xlat10_3.w;
					    u_xlat1.xyz = u_xlat5.xyz / u_xlat1.xyz;
					    u_xlat7 = max(abs(u_xlat1.z), abs(u_xlat1.y));
					    u_xlat1.x = max(u_xlat7, abs(u_xlat1.x));
					    u_xlat3 = u_xlat5 / u_xlat1.xxxx;
					    u_xlatb1 = 1.0<u_xlat1.x;
					    u_xlat3 = u_xlat0 + u_xlat3;
					    u_xlat4.w = u_xlat0.w;
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat3 : u_xlat4;
					    u_xlat1.x = (-_MainTex_TexelSize.z) * 0.00200000009 + u_xlat16_19;
					    u_xlat7 = u_xlat16_19 * _FinalBlendParameters.z;
					    u_xlat13 = _MainTex_TexelSize.z * 0.00150000001;
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat1.x = u_xlat13 * u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat13;
					    u_xlat2.w = min(u_xlat1.x, 1.0);
					    u_xlat0 = u_xlat0 + (-u_xlat2);
					    u_xlat1.x = (-_FinalBlendParameters.x) + _FinalBlendParameters.y;
					    u_xlat1.x = u_xlat7 * u_xlat1.x + _FinalBlendParameters.x;
					    u_xlat1.x = max(u_xlat1.x, _FinalBlendParameters.y);
					    u_xlat1.x = min(u_xlat1.x, _FinalBlendParameters.x);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat2;
					    u_xlat1.x = max(u_xlat0.z, u_xlat0.y);
					    u_xlat1.x = max(u_xlat0.x, u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    SV_Target1.xyz = u_xlat0.xyz;
					    SV_Target0 = u_xlat0;
					    SV_Target1.w = u_xlat0.w * 0.850000024;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 122
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %99 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate vs_TEXCOORD0 Location 99 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                                            %101 = OpTypePointer Function %6 
					                                            %110 = OpTypePointer Output %6 
					                                            %112 = OpTypeVector %6 3 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %102 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                       bool %100 = OpLoad %84 
					                                                     OpSelectionMerge %104 None 
					                                                     OpBranchConditional %100 %103 %106 
					                                            %103 = OpLabel 
					                                        f32 %105 = OpLoad %91 
					                                                     OpStore %102 %105 
					                                                     OpBranch %104 
					                                            %106 = OpLabel 
					                                 Input f32* %107 = OpAccessChain %92 %68 
					                                        f32 %108 = OpLoad %107 
					                                                     OpStore %102 %108 
					                                                     OpBranch %104 
					                                            %104 = OpLabel 
					                                        f32 %109 = OpLoad %102 
					                                Output f32* %111 = OpAccessChain vs_TEXCOORD0 %68 
					                                                     OpStore %111 %109 
					                                      f32_4 %113 = OpLoad %92 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 0 1 
					                                      f32_4 %115 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %116 = OpVectorShuffle %115 %114 4 1 5 6 
					                                                     OpStore vs_TEXCOORD0 %116 
					                                Output f32* %117 = OpAccessChain %72 %22 %68 
					                                        f32 %118 = OpLoad %117 
					                                        f32 %119 = OpFNegate %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                                     OpStore %120 %119 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 721
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %52 %707 %712 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpMemberDecorate %12 4 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 52 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %75 DescriptorSet 75 
					                                                      OpDecorate %75 Binding 75 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %79 DescriptorSet 79 
					                                                      OpDecorate %79 Binding 79 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %312 DescriptorSet 312 
					                                                      OpDecorate %312 Binding 312 
					                                                      OpDecorate %314 DescriptorSet 314 
					                                                      OpDecorate %314 Binding 314 
					                                                      OpDecorate %487 RelaxedPrecision 
					                                                      OpDecorate %487 DescriptorSet 487 
					                                                      OpDecorate %487 Binding 487 
					                                                      OpDecorate %488 RelaxedPrecision 
					                                                      OpDecorate %489 RelaxedPrecision 
					                                                      OpDecorate %489 DescriptorSet 489 
					                                                      OpDecorate %489 Binding 489 
					                                                      OpDecorate %490 RelaxedPrecision 
					                                                      OpDecorate %495 RelaxedPrecision 
					                                                      OpDecorate %498 RelaxedPrecision 
					                                                      OpDecorate %499 RelaxedPrecision 
					                                                      OpDecorate %500 RelaxedPrecision 
					                                                      OpDecorate %504 RelaxedPrecision 
					                                                      OpDecorate %505 RelaxedPrecision 
					                                                      OpDecorate %506 RelaxedPrecision 
					                                                      OpDecorate %507 RelaxedPrecision 
					                                                      OpDecorate %508 RelaxedPrecision 
					                                                      OpDecorate %509 RelaxedPrecision 
					                                                      OpDecorate %510 RelaxedPrecision 
					                                                      OpDecorate %511 RelaxedPrecision 
					                                                      OpDecorate %512 RelaxedPrecision 
					                                                      OpDecorate %513 RelaxedPrecision 
					                                                      OpDecorate %513 DescriptorSet 513 
					                                                      OpDecorate %513 Binding 513 
					                                                      OpDecorate %514 RelaxedPrecision 
					                                                      OpDecorate %515 RelaxedPrecision 
					                                                      OpDecorate %515 DescriptorSet 515 
					                                                      OpDecorate %515 Binding 515 
					                                                      OpDecorate %516 RelaxedPrecision 
					                                                      OpDecorate %520 RelaxedPrecision 
					                                                      OpDecorate %522 RelaxedPrecision 
					                                                      OpDecorate %524 RelaxedPrecision 
					                                                      OpDecorate %525 RelaxedPrecision 
					                                                      OpDecorate %527 RelaxedPrecision 
					                                                      OpDecorate %528 RelaxedPrecision 
					                                                      OpDecorate %529 RelaxedPrecision 
					                                                      OpDecorate %530 RelaxedPrecision 
					                                                      OpDecorate %531 RelaxedPrecision 
					                                                      OpDecorate %532 RelaxedPrecision 
					                                                      OpDecorate %533 RelaxedPrecision 
					                                                      OpDecorate %535 RelaxedPrecision 
					                                                      OpDecorate %536 RelaxedPrecision 
					                                                      OpDecorate %537 RelaxedPrecision 
					                                                      OpDecorate %538 RelaxedPrecision 
					                                                      OpDecorate %539 RelaxedPrecision 
					                                                      OpDecorate %546 RelaxedPrecision 
					                                                      OpDecorate %547 RelaxedPrecision 
					                                                      OpDecorate %548 RelaxedPrecision 
					                                                      OpDecorate %549 RelaxedPrecision 
					                                                      OpDecorate %550 RelaxedPrecision 
					                                                      OpDecorate %555 RelaxedPrecision 
					                                                      OpDecorate %560 RelaxedPrecision 
					                                                      OpDecorate %602 RelaxedPrecision 
					                                                      OpDecorate %605 RelaxedPrecision 
					                                                      OpDecorate %691 RelaxedPrecision 
					                                                      OpDecorate %693 RelaxedPrecision 
					                                                      OpDecorate %694 RelaxedPrecision 
					                                                      OpDecorate %695 RelaxedPrecision 
					                                                      OpDecorate %696 RelaxedPrecision 
					                                                      OpDecorate %697 RelaxedPrecision 
					                                                      OpDecorate %701 RelaxedPrecision 
					                                                      OpDecorate %702 RelaxedPrecision 
					                                                      OpDecorate %707 Location 707 
					                                                      OpDecorate %712 Location 712 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 4 
					                                              %11 = OpTypeVector %9 2 
					                                              %12 = OpTypeStruct %10 %10 %11 %10 %10 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32_4; f32_4; f32_2; f32_4; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 0 
					                                              %17 = OpTypeInt 32 0 
					                                          u32 %18 = OpConstant 1 
					                                              %19 = OpTypePointer Uniform %9 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                              %24 = OpTypePointer Private %11 
					                               Private f32_2* %25 = OpVariable Private 
					                                          i32 %26 = OpConstant 2 
					                                              %27 = OpTypePointer Uniform %11 
					                                          f32 %30 = OpConstant 3,674022E-40 
					                                          f32 %31 = OpConstant 3,674022E-40 
					                                        f32_2 %32 = OpConstantComposite %30 %31 
					                                              %34 = OpTypePointer Private %10 
					                               Private f32_4* %35 = OpVariable Private 
					                                              %37 = OpTypePointer Function %11 
					                                              %51 = OpTypePointer Input %10 
					                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                               Private f32_2* %58 = OpVariable Private 
					                                              %59 = OpTypePointer Uniform %10 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                        f32_2 %65 = OpConstantComposite %64 %64 
					                                              %70 = OpTypeVector %9 3 
					                                              %71 = OpTypePointer Private %70 
					                               Private f32_3* %72 = OpVariable Private 
					                                              %73 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                              %74 = OpTypePointer UniformConstant %73 
					         UniformConstant read_only Texture2D* %75 = OpVariable UniformConstant 
					                                              %77 = OpTypeSampler 
					                                              %78 = OpTypePointer UniformConstant %77 
					                     UniformConstant sampler* %79 = OpVariable UniformConstant 
					                                              %81 = OpTypeSampledImage %73 
					                                              %86 = OpTypePointer Private %9 
					                                 Private f32* %87 = OpVariable Private 
					                                          u32 %88 = OpConstant 2 
					                                          u32 %94 = OpConstant 0 
					                                Private f32* %101 = OpVariable Private 
					                              Private f32_3* %104 = OpVariable Private 
					                              Private f32_3* %116 = OpVariable Private 
					                              Private f32_3* %124 = OpVariable Private 
					                                Private f32* %142 = OpVariable Private 
					                              Private f32_3* %145 = OpVariable Private 
					                              Private f32_3* %150 = OpVariable Private 
					                              Private f32_3* %154 = OpVariable Private 
					                                         f32 %165 = OpConstant 3,674022E-40 
					                                       f32_3 %166 = OpConstantComposite %165 %165 %165 
					                                         f32 %173 = OpConstant 3,674022E-40 
					                                       f32_3 %174 = OpConstantComposite %173 %173 %173 
					                              Private f32_4* %178 = OpVariable Private 
					                                         i32 %180 = OpConstant 3 
					                              Private f32_4* %187 = OpVariable Private 
					                                         f32 %190 = OpConstant 3,674022E-40 
					                                       f32_3 %191 = OpConstantComposite %190 %190 %190 
					                                       f32_3 %199 = OpConstantComposite %22 %22 %22 
					                                         f32 %211 = OpConstant 3,674022E-40 
					                                       f32_3 %212 = OpConstantComposite %211 %211 %211 
					                                         f32 %238 = OpConstant 3,674022E-40 
					                                         f32 %239 = OpConstant 3,674022E-40 
					                                         f32 %240 = OpConstant 3,674022E-40 
					                                       f32_3 %241 = OpConstantComposite %238 %239 %240 
					                                Private f32* %243 = OpVariable Private 
					                                Private f32* %268 = OpVariable Private 
					                              Private f32_3* %286 = OpVariable Private 
					                              Private f32_4* %294 = OpVariable Private 
					                                       f32_3 %296 = OpConstantComposite %64 %64 %64 
					                                         i32 %304 = OpConstant 1 
					        UniformConstant read_only Texture2D* %312 = OpVariable UniformConstant 
					                    UniformConstant sampler* %314 = OpVariable UniformConstant 
					                               Private bool* %330 = OpVariable Private 
					                                Private f32* %336 = OpVariable Private 
					                              Private f32_4* %363 = OpVariable Private 
					                                       f32_4 %367 = OpConstantComposite %30 %31 %31 %30 
					                              Private f32_3* %380 = OpVariable Private 
					                              Private f32_2* %461 = OpVariable Private 
					                                       f32_2 %465 = OpConstantComposite %30 %30 
					        UniformConstant read_only Texture2D* %487 = OpVariable UniformConstant 
					                    UniformConstant sampler* %489 = OpVariable UniformConstant 
					                                Private f32* %504 = OpVariable Private 
					                              Private f32_4* %512 = OpVariable Private 
					        UniformConstant read_only Texture2D* %513 = OpVariable UniformConstant 
					                    UniformConstant sampler* %515 = OpVariable UniformConstant 
					                                Private f32* %520 = OpVariable Private 
					                                         u32 %553 = OpConstant 3 
					                              Private f32_3* %557 = OpVariable Private 
					                                Private f32* %562 = OpVariable Private 
					                               Private bool* %581 = OpVariable Private 
					                                             %594 = OpTypeVector %6 4 
					                                         f32 %600 = OpConstant 3,674022E-40 
					                                         i32 %606 = OpConstant 4 
					                                Private f32* %610 = OpVariable Private 
					                                         f32 %613 = OpConstant 3,674022E-40 
					                                         f32 %628 = OpConstant 3,674022E-40 
					                                         f32 %630 = OpConstant 3,674022E-40 
					                                             %706 = OpTypePointer Output %10 
					                               Output f32_4* %707 = OpVariable Output 
					                               Output f32_4* %712 = OpVariable Output 
					                                         f32 %716 = OpConstant 3,674022E-40 
					                                             %718 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                              Function f32_2* %38 = OpVariable Function 
					                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
					                                          f32 %21 = OpLoad %20 
					                                         bool %23 = OpFOrdLessThan %21 %22 
					                                                      OpStore %8 %23 
					                               Uniform f32_2* %28 = OpAccessChain %14 %26 
					                                        f32_2 %29 = OpLoad %28 
					                                        f32_2 %33 = OpFMul %29 %32 
					                                                      OpStore %25 %33 
					                                         bool %36 = OpLoad %8 
					                                                      OpSelectionMerge %40 None 
					                                                      OpBranchConditional %36 %39 %42 
					                                              %39 = OpLabel 
					                                        f32_2 %41 = OpLoad %25 
					                                                      OpStore %38 %41 
					                                                      OpBranch %40 
					                                              %42 = OpLabel 
					                               Uniform f32_2* %43 = OpAccessChain %14 %26 
					                                        f32_2 %44 = OpLoad %43 
					                                                      OpStore %38 %44 
					                                                      OpBranch %40 
					                                              %40 = OpLabel 
					                                        f32_2 %45 = OpLoad %38 
					                                        f32_4 %46 = OpLoad %35 
					                                        f32_4 %47 = OpVectorShuffle %46 %45 4 5 2 3 
					                                                      OpStore %35 %47 
					                                        f32_4 %48 = OpLoad %35 
					                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                        f32_2 %50 = OpFNegate %49 
					                                        f32_4 %53 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
					                                        f32_2 %55 = OpFAdd %50 %54 
					                                        f32_4 %56 = OpLoad %35 
					                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
					                                                      OpStore %35 %57 
					                               Uniform f32_4* %60 = OpAccessChain %14 %16 
					                                        f32_4 %61 = OpLoad %60 
					                                        f32_2 %62 = OpVectorShuffle %61 %61 0 1 
					                                        f32_2 %63 = OpFNegate %62 
					                                        f32_2 %66 = OpFMul %63 %65 
					                                        f32_4 %67 = OpLoad %35 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                        f32_2 %69 = OpFAdd %66 %68 
					                                                      OpStore %58 %69 
					                          read_only Texture2D %76 = OpLoad %75 
					                                      sampler %80 = OpLoad %79 
					                   read_only Texture2DSampled %82 = OpSampledImage %76 %80 
					                                        f32_2 %83 = OpLoad %58 
					                                        f32_4 %84 = OpImageSampleImplicitLod %82 %83 
					                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                                      OpStore %72 %85 
					                                 Private f32* %89 = OpAccessChain %72 %88 
					                                          f32 %90 = OpLoad %89 
					                                 Private f32* %91 = OpAccessChain %72 %18 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpExtInst %1 40 %90 %92 
					                                                      OpStore %87 %93 
					                                 Private f32* %95 = OpAccessChain %72 %94 
					                                          f32 %96 = OpLoad %95 
					                                          f32 %97 = OpLoad %87 
					                                          f32 %98 = OpExtInst %1 40 %96 %97 
					                                                      OpStore %87 %98 
					                                          f32 %99 = OpLoad %87 
					                                         f32 %100 = OpFAdd %99 %30 
					                                                      OpStore %87 %100 
					                                         f32 %102 = OpLoad %87 
					                                         f32 %103 = OpFDiv %30 %102 
					                                                      OpStore %101 %103 
					                                         f32 %105 = OpLoad %101 
					                                       f32_3 %106 = OpCompositeConstruct %105 %105 %105 
					                                       f32_3 %107 = OpLoad %72 
					                                       f32_3 %108 = OpFMul %106 %107 
					                                                      OpStore %104 %108 
					                              Uniform f32_4* %109 = OpAccessChain %14 %16 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
					                                       f32_2 %112 = OpFMul %111 %65 
					                                       f32_4 %113 = OpLoad %35 
					                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
					                                       f32_2 %115 = OpFAdd %112 %114 
					                                                      OpStore %58 %115 
					                         read_only Texture2D %117 = OpLoad %75 
					                                     sampler %118 = OpLoad %79 
					                  read_only Texture2DSampled %119 = OpSampledImage %117 %118 
					                                       f32_4 %120 = OpLoad %35 
					                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                       f32_4 %122 = OpImageSampleImplicitLod %119 %121 
					                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
					                                                      OpStore %116 %123 
					                         read_only Texture2D %125 = OpLoad %75 
					                                     sampler %126 = OpLoad %79 
					                  read_only Texture2DSampled %127 = OpSampledImage %125 %126 
					                                       f32_2 %128 = OpLoad %58 
					                                       f32_4 %129 = OpImageSampleImplicitLod %127 %128 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
					                                                      OpStore %124 %130 
					                                Private f32* %131 = OpAccessChain %124 %88 
					                                         f32 %132 = OpLoad %131 
					                                Private f32* %133 = OpAccessChain %124 %18 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpExtInst %1 40 %132 %134 
					                                                      OpStore %87 %135 
					                                Private f32* %136 = OpAccessChain %124 %94 
					                                         f32 %137 = OpLoad %136 
					                                         f32 %138 = OpLoad %87 
					                                         f32 %139 = OpExtInst %1 40 %137 %138 
					                                                      OpStore %87 %139 
					                                         f32 %140 = OpLoad %87 
					                                         f32 %141 = OpFAdd %140 %30 
					                                                      OpStore %87 %141 
					                                         f32 %143 = OpLoad %87 
					                                         f32 %144 = OpFDiv %30 %143 
					                                                      OpStore %142 %144 
					                                         f32 %146 = OpLoad %142 
					                                       f32_3 %147 = OpCompositeConstruct %146 %146 %146 
					                                       f32_3 %148 = OpLoad %124 
					                                       f32_3 %149 = OpFMul %147 %148 
					                                                      OpStore %145 %149 
					                                       f32_3 %151 = OpLoad %124 
					                                       f32_3 %152 = OpLoad %72 
					                                       f32_3 %153 = OpFAdd %151 %152 
					                                                      OpStore %150 %153 
					                                       f32_3 %155 = OpLoad %104 
					                                       f32_3 %156 = OpLoad %145 
					                                       f32_3 %157 = OpExtInst %1 37 %155 %156 
					                                                      OpStore %154 %157 
					                                       f32_3 %158 = OpLoad %104 
					                                       f32_3 %159 = OpLoad %145 
					                                       f32_3 %160 = OpExtInst %1 40 %158 %159 
					                                                      OpStore %104 %160 
					                                       f32_3 %161 = OpLoad %116 
					                                       f32_3 %162 = OpLoad %116 
					                                       f32_3 %163 = OpFAdd %161 %162 
					                                                      OpStore %145 %163 
					                                       f32_3 %164 = OpLoad %150 
					                                       f32_3 %167 = OpFMul %164 %166 
					                                       f32_3 %168 = OpLoad %145 
					                                       f32_3 %169 = OpFNegate %168 
					                                       f32_3 %170 = OpFAdd %167 %169 
					                                                      OpStore %150 %170 
					                                       f32_3 %171 = OpLoad %150 
					                                       f32_3 %172 = OpFNegate %171 
					                                       f32_3 %175 = OpFMul %172 %174 
					                                       f32_3 %176 = OpLoad %116 
					                                       f32_3 %177 = OpFAdd %175 %176 
					                                                      OpStore %145 %177 
					                                       f32_3 %179 = OpLoad %145 
					                              Uniform f32_4* %181 = OpAccessChain %14 %180 
					                                       f32_4 %182 = OpLoad %181 
					                                       f32_3 %183 = OpVectorShuffle %182 %182 0 0 0 
					                                       f32_3 %184 = OpFMul %179 %183 
					                                       f32_4 %185 = OpLoad %178 
					                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
					                                                      OpStore %178 %186 
					                                       f32_4 %188 = OpLoad %178 
					                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
					                                       f32_3 %192 = OpFMul %189 %191 
					                                       f32_3 %193 = OpLoad %116 
					                                       f32_3 %194 = OpFAdd %192 %193 
					                                       f32_4 %195 = OpLoad %187 
					                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
					                                                      OpStore %187 %196 
					                                       f32_4 %197 = OpLoad %187 
					                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
					                                       f32_3 %200 = OpExtInst %1 40 %198 %199 
					                                       f32_4 %201 = OpLoad %187 
					                                       f32_4 %202 = OpVectorShuffle %201 %200 4 5 6 3 
					                                                      OpStore %187 %202 
					                                       f32_3 %203 = OpLoad %150 
					                                       f32_4 %204 = OpLoad %187 
					                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
					                                       f32_3 %206 = OpFAdd %203 %205 
					                                       f32_4 %207 = OpLoad %35 
					                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
					                                                      OpStore %35 %208 
					                                       f32_4 %209 = OpLoad %35 
					                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
					                                       f32_3 %213 = OpFMul %210 %212 
					                                       f32_4 %214 = OpLoad %35 
					                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
					                                                      OpStore %35 %215 
					                                Private f32* %216 = OpAccessChain %35 %88 
					                                         f32 %217 = OpLoad %216 
					                                Private f32* %218 = OpAccessChain %35 %18 
					                                         f32 %219 = OpLoad %218 
					                                         f32 %220 = OpExtInst %1 40 %217 %219 
					                                                      OpStore %87 %220 
					                                Private f32* %221 = OpAccessChain %35 %94 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpLoad %87 
					                                         f32 %224 = OpExtInst %1 40 %222 %223 
					                                                      OpStore %87 %224 
					                                         f32 %225 = OpLoad %87 
					                                         f32 %226 = OpFAdd %225 %30 
					                                                      OpStore %87 %226 
					                                         f32 %227 = OpLoad %87 
					                                         f32 %228 = OpFDiv %30 %227 
					                                                      OpStore %142 %228 
					                                         f32 %229 = OpLoad %142 
					                                       f32_3 %230 = OpCompositeConstruct %229 %229 %229 
					                                       f32_4 %231 = OpLoad %35 
					                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
					                                       f32_3 %233 = OpFMul %230 %232 
					                                       f32_4 %234 = OpLoad %35 
					                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
					                                                      OpStore %35 %235 
					                                       f32_4 %236 = OpLoad %35 
					                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
					                                         f32 %242 = OpDot %237 %241 
					                                                      OpStore %87 %242 
					                                Private f32* %244 = OpAccessChain %187 %88 
					                                         f32 %245 = OpLoad %244 
					                                Private f32* %246 = OpAccessChain %187 %18 
					                                         f32 %247 = OpLoad %246 
					                                         f32 %248 = OpExtInst %1 40 %245 %247 
					                                                      OpStore %243 %248 
					                                         f32 %249 = OpLoad %243 
					                                Private f32* %250 = OpAccessChain %187 %94 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpExtInst %1 40 %249 %251 
					                                                      OpStore %243 %252 
					                                         f32 %253 = OpLoad %243 
					                                         f32 %254 = OpFAdd %253 %30 
					                                                      OpStore %243 %254 
					                                         f32 %255 = OpLoad %243 
					                                         f32 %256 = OpFDiv %30 %255 
					                                Private f32* %257 = OpAccessChain %150 %94 
					                                                      OpStore %257 %256 
					                                       f32_3 %258 = OpLoad %150 
					                                       f32_3 %259 = OpVectorShuffle %258 %258 0 0 0 
					                                       f32_4 %260 = OpLoad %187 
					                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
					                                       f32_3 %262 = OpFMul %259 %261 
					                                       f32_4 %263 = OpLoad %35 
					                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
					                                                      OpStore %35 %264 
					                                       f32_4 %265 = OpLoad %35 
					                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
					                                         f32 %267 = OpDot %266 %241 
					                                                      OpStore %243 %267 
					                                         f32 %269 = OpLoad %243 
					                                         f32 %270 = OpFNegate %269 
					                                         f32 %271 = OpLoad %87 
					                                         f32 %272 = OpFAdd %270 %271 
					                                                      OpStore %268 %272 
					                                         f32 %273 = OpLoad %268 
					                                       f32_3 %274 = OpCompositeConstruct %273 %273 %273 
					                                       f32_3 %275 = OpExtInst %1 4 %274 
					                                       f32_3 %276 = OpFNegate %275 
					                                       f32_3 %277 = OpFMul %276 %166 
					                                       f32_3 %278 = OpLoad %154 
					                                       f32_3 %279 = OpFAdd %277 %278 
					                                                      OpStore %154 %279 
					                                         f32 %280 = OpLoad %268 
					                                       f32_3 %281 = OpCompositeConstruct %280 %280 %280 
					                                       f32_3 %282 = OpExtInst %1 4 %281 
					                                       f32_3 %283 = OpFMul %282 %166 
					                                       f32_3 %284 = OpLoad %104 
					                                       f32_3 %285 = OpFAdd %283 %284 
					                                                      OpStore %104 %285 
					                                       f32_3 %287 = OpLoad %154 
					                                       f32_3 %288 = OpFNegate %287 
					                                       f32_3 %289 = OpLoad %104 
					                                       f32_3 %290 = OpFAdd %288 %289 
					                                                      OpStore %286 %290 
					                                       f32_3 %291 = OpLoad %154 
					                                       f32_3 %292 = OpLoad %104 
					                                       f32_3 %293 = OpFAdd %291 %292 
					                                                      OpStore %154 %293 
					                                       f32_3 %295 = OpLoad %154 
					                                       f32_3 %297 = OpFMul %295 %296 
					                                       f32_4 %298 = OpLoad %294 
					                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
					                                                      OpStore %294 %299 
					                                       f32_3 %300 = OpLoad %286 
					                                       f32_3 %301 = OpFMul %300 %296 
					                                                      OpStore %104 %301 
					                                       f32_4 %302 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %303 = OpVectorShuffle %302 %302 2 3 
					                              Uniform f32_4* %305 = OpAccessChain %14 %304 
					                                       f32_4 %306 = OpLoad %305 
					                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
					                                       f32_2 %308 = OpFNegate %307 
					                                       f32_2 %309 = OpFAdd %303 %308 
					                                       f32_4 %310 = OpLoad %187 
					                                       f32_4 %311 = OpVectorShuffle %310 %309 4 5 2 3 
					                                                      OpStore %187 %311 
					                         read_only Texture2D %313 = OpLoad %312 
					                                     sampler %315 = OpLoad %314 
					                  read_only Texture2DSampled %316 = OpSampledImage %313 %315 
					                                       f32_4 %317 = OpLoad %187 
					                                       f32_2 %318 = OpVectorShuffle %317 %317 0 1 
					                                       f32_4 %319 = OpImageSampleImplicitLod %316 %318 
					                                         f32 %320 = OpCompositeExtract %319 0 
					                                Private f32* %321 = OpAccessChain %187 %88 
					                                                      OpStore %321 %320 
					                         read_only Texture2D %322 = OpLoad %312 
					                                     sampler %323 = OpLoad %314 
					                  read_only Texture2DSampled %324 = OpSampledImage %322 %323 
					                                       f32_4 %325 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %326 = OpVectorShuffle %325 %325 2 3 
					                                       f32_4 %327 = OpImageSampleImplicitLod %324 %326 
					                                         f32 %328 = OpCompositeExtract %327 0 
					                                Private f32* %329 = OpAccessChain %178 %88 
					                                                      OpStore %329 %328 
					                                Private f32* %331 = OpAccessChain %187 %88 
					                                         f32 %332 = OpLoad %331 
					                                Private f32* %333 = OpAccessChain %178 %88 
					                                         f32 %334 = OpLoad %333 
					                                        bool %335 = OpFOrdGreaterThanEqual %332 %334 
					                                                      OpStore %330 %335 
					                                        bool %337 = OpLoad %330 
					                                         f32 %338 = OpSelect %337 %30 %22 
					                                                      OpStore %336 %338 
					                                Private f32* %339 = OpAccessChain %187 %94 
					                                                      OpStore %339 %31 
					                                Private f32* %340 = OpAccessChain %187 %18 
					                                                      OpStore %340 %31 
					                                Private f32* %341 = OpAccessChain %178 %94 
					                                                      OpStore %341 %22 
					                                Private f32* %342 = OpAccessChain %178 %18 
					                                                      OpStore %342 %22 
					                                       f32_4 %343 = OpLoad %187 
					                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
					                                       f32_4 %345 = OpLoad %178 
					                                       f32_3 %346 = OpVectorShuffle %345 %345 1 1 2 
					                                       f32_3 %347 = OpFNegate %346 
					                                       f32_3 %348 = OpFAdd %344 %347 
					                                       f32_4 %349 = OpLoad %187 
					                                       f32_4 %350 = OpVectorShuffle %349 %348 4 5 6 3 
					                                                      OpStore %187 %350 
					                                         f32 %351 = OpLoad %336 
					                                       f32_3 %352 = OpCompositeConstruct %351 %351 %351 
					                                       f32_4 %353 = OpLoad %187 
					                                       f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
					                                       f32_3 %355 = OpFMul %352 %354 
					                                       f32_4 %356 = OpLoad %178 
					                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
					                                       f32_3 %358 = OpFAdd %355 %357 
					                                       f32_4 %359 = OpLoad %187 
					                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
					                                                      OpStore %187 %360 
					                                Private f32* %361 = OpAccessChain %178 %94 
					                                                      OpStore %361 %30 
					                                Private f32* %362 = OpAccessChain %178 %18 
					                                                      OpStore %362 %31 
					                              Uniform f32_4* %364 = OpAccessChain %14 %304 
					                                       f32_4 %365 = OpLoad %364 
					                                       f32_4 %366 = OpVectorShuffle %365 %365 0 1 0 1 
					                                       f32_4 %368 = OpFMul %366 %367 
					                                       f32_4 %369 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %370 = OpVectorShuffle %369 %369 2 3 2 3 
					                                       f32_4 %371 = OpFAdd %368 %370 
					                                                      OpStore %363 %371 
					                         read_only Texture2D %372 = OpLoad %312 
					                                     sampler %373 = OpLoad %314 
					                  read_only Texture2DSampled %374 = OpSampledImage %372 %373 
					                                       f32_4 %375 = OpLoad %363 
					                                       f32_2 %376 = OpVectorShuffle %375 %375 0 1 
					                                       f32_4 %377 = OpImageSampleImplicitLod %374 %376 
					                                         f32 %378 = OpCompositeExtract %377 0 
					                                Private f32* %379 = OpAccessChain %178 %88 
					                                                      OpStore %379 %378 
					                         read_only Texture2D %381 = OpLoad %312 
					                                     sampler %382 = OpLoad %314 
					                  read_only Texture2DSampled %383 = OpSampledImage %381 %382 
					                                       f32_4 %384 = OpLoad %363 
					                                       f32_2 %385 = OpVectorShuffle %384 %384 2 3 
					                                       f32_4 %386 = OpImageSampleImplicitLod %383 %385 
					                                         f32 %387 = OpCompositeExtract %386 0 
					                                Private f32* %388 = OpAccessChain %380 %88 
					                                                      OpStore %388 %387 
					                                Private f32* %389 = OpAccessChain %178 %88 
					                                         f32 %390 = OpLoad %389 
					                                Private f32* %391 = OpAccessChain %187 %88 
					                                         f32 %392 = OpLoad %391 
					                                        bool %393 = OpFOrdGreaterThanEqual %390 %392 
					                                                      OpStore %330 %393 
					                                        bool %394 = OpLoad %330 
					                                         f32 %395 = OpSelect %394 %30 %22 
					                                                      OpStore %336 %395 
					                                       f32_4 %396 = OpLoad %187 
					                                       f32_3 %397 = OpVectorShuffle %396 %396 1 1 2 
					                                       f32_3 %398 = OpFNegate %397 
					                                       f32_4 %399 = OpLoad %178 
					                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
					                                       f32_3 %401 = OpFAdd %398 %400 
					                                       f32_4 %402 = OpLoad %178 
					                                       f32_4 %403 = OpVectorShuffle %402 %401 4 5 6 3 
					                                                      OpStore %178 %403 
					                                         f32 %404 = OpLoad %336 
					                                       f32_3 %405 = OpCompositeConstruct %404 %404 %404 
					                                       f32_4 %406 = OpLoad %178 
					                                       f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
					                                       f32_3 %408 = OpFMul %405 %407 
					                                       f32_4 %409 = OpLoad %187 
					                                       f32_3 %410 = OpVectorShuffle %409 %409 0 1 2 
					                                       f32_3 %411 = OpFAdd %408 %410 
					                                       f32_4 %412 = OpLoad %187 
					                                       f32_4 %413 = OpVectorShuffle %412 %411 4 5 6 3 
					                                                      OpStore %187 %413 
					                                Private f32* %414 = OpAccessChain %380 %94 
					                                                      OpStore %414 %31 
					                                Private f32* %415 = OpAccessChain %380 %18 
					                                                      OpStore %415 %30 
					                                Private f32* %416 = OpAccessChain %380 %88 
					                                         f32 %417 = OpLoad %416 
					                                Private f32* %418 = OpAccessChain %187 %88 
					                                         f32 %419 = OpLoad %418 
					                                        bool %420 = OpFOrdGreaterThanEqual %417 %419 
					                                                      OpStore %330 %420 
					                                        bool %421 = OpLoad %330 
					                                         f32 %422 = OpSelect %421 %30 %22 
					                                                      OpStore %336 %422 
					                                       f32_4 %423 = OpLoad %187 
					                                       f32_3 %424 = OpVectorShuffle %423 %423 0 1 2 
					                                       f32_3 %425 = OpFNegate %424 
					                                       f32_3 %426 = OpLoad %380 
					                                       f32_3 %427 = OpFAdd %425 %426 
					                                       f32_4 %428 = OpLoad %178 
					                                       f32_4 %429 = OpVectorShuffle %428 %427 4 5 6 3 
					                                                      OpStore %178 %429 
					                                         f32 %430 = OpLoad %336 
					                                       f32_3 %431 = OpCompositeConstruct %430 %430 %430 
					                                       f32_4 %432 = OpLoad %178 
					                                       f32_3 %433 = OpVectorShuffle %432 %432 0 1 2 
					                                       f32_3 %434 = OpFMul %431 %433 
					                                       f32_4 %435 = OpLoad %187 
					                                       f32_3 %436 = OpVectorShuffle %435 %435 0 1 2 
					                                       f32_3 %437 = OpFAdd %434 %436 
					                                       f32_4 %438 = OpLoad %187 
					                                       f32_4 %439 = OpVectorShuffle %438 %437 4 5 6 3 
					                                                      OpStore %187 %439 
					                                       f32_4 %440 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %441 = OpVectorShuffle %440 %440 2 3 
					                              Uniform f32_4* %442 = OpAccessChain %14 %304 
					                                       f32_4 %443 = OpLoad %442 
					                                       f32_2 %444 = OpVectorShuffle %443 %443 0 1 
					                                       f32_2 %445 = OpFAdd %441 %444 
					                                       f32_4 %446 = OpLoad %178 
					                                       f32_4 %447 = OpVectorShuffle %446 %445 4 5 2 3 
					                                                      OpStore %178 %447 
					                         read_only Texture2D %448 = OpLoad %312 
					                                     sampler %449 = OpLoad %314 
					                  read_only Texture2DSampled %450 = OpSampledImage %448 %449 
					                                       f32_4 %451 = OpLoad %178 
					                                       f32_2 %452 = OpVectorShuffle %451 %451 0 1 
					                                       f32_4 %453 = OpImageSampleImplicitLod %450 %452 
					                                         f32 %454 = OpCompositeExtract %453 0 
					                                                      OpStore %336 %454 
					                                         f32 %455 = OpLoad %336 
					                                Private f32* %456 = OpAccessChain %187 %88 
					                                         f32 %457 = OpLoad %456 
					                                        bool %458 = OpFOrdGreaterThanEqual %455 %457 
					                                                      OpStore %330 %458 
					                                        bool %459 = OpLoad %330 
					                                         f32 %460 = OpSelect %459 %30 %22 
					                                                      OpStore %336 %460 
					                                       f32_4 %462 = OpLoad %187 
					                                       f32_2 %463 = OpVectorShuffle %462 %462 0 1 
					                                       f32_2 %464 = OpFNegate %463 
					                                       f32_2 %466 = OpFAdd %464 %465 
					                                                      OpStore %461 %466 
					                                         f32 %467 = OpLoad %336 
					                                       f32_2 %468 = OpCompositeConstruct %467 %467 
					                                       f32_2 %469 = OpLoad %461 
					                                       f32_2 %470 = OpFMul %468 %469 
					                                       f32_4 %471 = OpLoad %187 
					                                       f32_2 %472 = OpVectorShuffle %471 %471 0 1 
					                                       f32_2 %473 = OpFAdd %470 %472 
					                                       f32_4 %474 = OpLoad %187 
					                                       f32_4 %475 = OpVectorShuffle %474 %473 4 5 2 3 
					                                                      OpStore %187 %475 
					                                       f32_4 %476 = OpLoad %187 
					                                       f32_2 %477 = OpVectorShuffle %476 %476 0 1 
					                              Uniform f32_4* %478 = OpAccessChain %14 %304 
					                                       f32_4 %479 = OpLoad %478 
					                                       f32_2 %480 = OpVectorShuffle %479 %479 0 1 
					                                       f32_2 %481 = OpFMul %477 %480 
					                                       f32_4 %482 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %483 = OpVectorShuffle %482 %482 2 3 
					                                       f32_2 %484 = OpFAdd %481 %483 
					                                       f32_4 %485 = OpLoad %187 
					                                       f32_4 %486 = OpVectorShuffle %485 %484 4 5 2 3 
					                                                      OpStore %187 %486 
					                         read_only Texture2D %488 = OpLoad %487 
					                                     sampler %490 = OpLoad %489 
					                  read_only Texture2DSampled %491 = OpSampledImage %488 %490 
					                                       f32_4 %492 = OpLoad %187 
					                                       f32_2 %493 = OpVectorShuffle %492 %492 0 1 
					                                       f32_4 %494 = OpImageSampleImplicitLod %491 %493 
					                                       f32_2 %495 = OpVectorShuffle %494 %494 0 1 
					                                       f32_3 %496 = OpLoad %116 
					                                       f32_3 %497 = OpVectorShuffle %496 %495 3 4 2 
					                                                      OpStore %116 %497 
					                                       f32_3 %498 = OpLoad %116 
					                                       f32_2 %499 = OpVectorShuffle %498 %498 0 1 
					                                       f32_2 %500 = OpFNegate %499 
					                                       f32_4 %501 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %502 = OpVectorShuffle %501 %501 2 3 
					                                       f32_2 %503 = OpFAdd %500 %502 
					                                                      OpStore %461 %503 
					                                       f32_3 %505 = OpLoad %116 
					                                       f32_2 %506 = OpVectorShuffle %505 %505 0 1 
					                                       f32_3 %507 = OpLoad %116 
					                                       f32_2 %508 = OpVectorShuffle %507 %507 0 1 
					                                         f32 %509 = OpDot %506 %508 
					                                                      OpStore %504 %509 
					                                         f32 %510 = OpLoad %504 
					                                         f32 %511 = OpExtInst %1 31 %510 
					                                                      OpStore %504 %511 
					                         read_only Texture2D %514 = OpLoad %513 
					                                     sampler %516 = OpLoad %515 
					                  read_only Texture2DSampled %517 = OpSampledImage %514 %516 
					                                       f32_2 %518 = OpLoad %461 
					                                       f32_4 %519 = OpImageSampleImplicitLod %517 %518 
					                                                      OpStore %512 %519 
					                                Private f32* %521 = OpAccessChain %512 %88 
					                                         f32 %522 = OpLoad %521 
					                                Private f32* %523 = OpAccessChain %512 %18 
					                                         f32 %524 = OpLoad %523 
					                                         f32 %525 = OpExtInst %1 40 %522 %524 
					                                                      OpStore %520 %525 
					                                Private f32* %526 = OpAccessChain %512 %94 
					                                         f32 %527 = OpLoad %526 
					                                         f32 %528 = OpLoad %520 
					                                         f32 %529 = OpExtInst %1 40 %527 %528 
					                                                      OpStore %520 %529 
					                                         f32 %530 = OpLoad %520 
					                                         f32 %531 = OpFAdd %530 %30 
					                                                      OpStore %520 %531 
					                                         f32 %532 = OpLoad %520 
					                                         f32 %533 = OpFDiv %30 %532 
					                                Private f32* %534 = OpAccessChain %286 %94 
					                                                      OpStore %534 %533 
					                                       f32_4 %535 = OpLoad %512 
					                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
					                                       f32_3 %537 = OpLoad %286 
					                                       f32_3 %538 = OpVectorShuffle %537 %537 0 0 0 
					                                       f32_3 %539 = OpFMul %536 %538 
					                                       f32_4 %540 = OpLoad %294 
					                                       f32_3 %541 = OpVectorShuffle %540 %540 0 1 2 
					                                       f32_3 %542 = OpFNegate %541 
					                                       f32_3 %543 = OpFAdd %539 %542 
					                                       f32_4 %544 = OpLoad %178 
					                                       f32_4 %545 = OpVectorShuffle %544 %543 4 5 6 3 
					                                                      OpStore %178 %545 
					                                       f32_4 %546 = OpLoad %512 
					                                       f32_3 %547 = OpVectorShuffle %546 %546 0 1 2 
					                                       f32_3 %548 = OpLoad %286 
					                                       f32_3 %549 = OpVectorShuffle %548 %548 0 0 0 
					                                       f32_3 %550 = OpFMul %547 %549 
					                                       f32_4 %551 = OpLoad %187 
					                                       f32_4 %552 = OpVectorShuffle %551 %550 4 5 6 3 
					                                                      OpStore %187 %552 
					                                Private f32* %554 = OpAccessChain %512 %553 
					                                         f32 %555 = OpLoad %554 
					                                Private f32* %556 = OpAccessChain %294 %553 
					                                                      OpStore %556 %555 
					                                       f32_4 %558 = OpLoad %178 
					                                       f32_3 %559 = OpVectorShuffle %558 %558 0 1 2 
					                                       f32_3 %560 = OpLoad %104 
					                                       f32_3 %561 = OpFDiv %559 %560 
					                                                      OpStore %557 %561 
					                                Private f32* %563 = OpAccessChain %557 %88 
					                                         f32 %564 = OpLoad %563 
					                                         f32 %565 = OpExtInst %1 4 %564 
					                                Private f32* %566 = OpAccessChain %557 %18 
					                                         f32 %567 = OpLoad %566 
					                                         f32 %568 = OpExtInst %1 4 %567 
					                                         f32 %569 = OpExtInst %1 40 %565 %568 
					                                                      OpStore %562 %569 
					                                         f32 %570 = OpLoad %562 
					                                Private f32* %571 = OpAccessChain %557 %94 
					                                         f32 %572 = OpLoad %571 
					                                         f32 %573 = OpExtInst %1 4 %572 
					                                         f32 %574 = OpExtInst %1 40 %570 %573 
					                                Private f32* %575 = OpAccessChain %557 %94 
					                                                      OpStore %575 %574 
					                                Private f32* %576 = OpAccessChain %178 %553 
					                                                      OpStore %576 %22 
					                                       f32_4 %577 = OpLoad %178 
					                                       f32_3 %578 = OpLoad %557 
					                                       f32_4 %579 = OpVectorShuffle %578 %578 0 0 0 0 
					                                       f32_4 %580 = OpFDiv %577 %579 
					                                                      OpStore %363 %580 
					                                Private f32* %582 = OpAccessChain %557 %94 
					                                         f32 %583 = OpLoad %582 
					                                        bool %584 = OpFOrdLessThan %30 %583 
					                                                      OpStore %581 %584 
					                                       f32_4 %585 = OpLoad %294 
					                                       f32_4 %586 = OpLoad %363 
					                                       f32_4 %587 = OpFAdd %585 %586 
					                                                      OpStore %363 %587 
					                                Private f32* %588 = OpAccessChain %294 %553 
					                                         f32 %589 = OpLoad %588 
					                                Private f32* %590 = OpAccessChain %187 %553 
					                                                      OpStore %590 %589 
					                                        bool %591 = OpLoad %581 
					                                       f32_4 %592 = OpLoad %363 
					                                       f32_4 %593 = OpLoad %187 
					                                      bool_4 %595 = OpCompositeConstruct %591 %591 %591 %591 
					                                       f32_4 %596 = OpSelect %595 %592 %593 
					                                                      OpStore %294 %596 
					                                Uniform f32* %597 = OpAccessChain %14 %16 %88 
					                                         f32 %598 = OpLoad %597 
					                                         f32 %599 = OpFNegate %598 
					                                         f32 %601 = OpFMul %599 %600 
					                                         f32 %602 = OpLoad %504 
					                                         f32 %603 = OpFAdd %601 %602 
					                                Private f32* %604 = OpAccessChain %557 %94 
					                                                      OpStore %604 %603 
					                                         f32 %605 = OpLoad %504 
					                                Uniform f32* %607 = OpAccessChain %14 %606 %88 
					                                         f32 %608 = OpLoad %607 
					                                         f32 %609 = OpFMul %605 %608 
					                                                      OpStore %562 %609 
					                                Uniform f32* %611 = OpAccessChain %14 %16 %88 
					                                         f32 %612 = OpLoad %611 
					                                         f32 %614 = OpFMul %612 %613 
					                                                      OpStore %610 %614 
					                                         f32 %615 = OpLoad %610 
					                                         f32 %616 = OpFDiv %30 %615 
					                                                      OpStore %610 %616 
					                                         f32 %617 = OpLoad %610 
					                                Private f32* %618 = OpAccessChain %557 %94 
					                                         f32 %619 = OpLoad %618 
					                                         f32 %620 = OpFMul %617 %619 
					                                Private f32* %621 = OpAccessChain %557 %94 
					                                                      OpStore %621 %620 
					                                Private f32* %622 = OpAccessChain %557 %94 
					                                         f32 %623 = OpLoad %622 
					                                         f32 %624 = OpExtInst %1 43 %623 %22 %30 
					                                Private f32* %625 = OpAccessChain %557 %94 
					                                                      OpStore %625 %624 
					                                Private f32* %626 = OpAccessChain %557 %94 
					                                         f32 %627 = OpLoad %626 
					                                         f32 %629 = OpFMul %627 %628 
					                                         f32 %631 = OpFAdd %629 %630 
					                                                      OpStore %610 %631 
					                                Private f32* %632 = OpAccessChain %557 %94 
					                                         f32 %633 = OpLoad %632 
					                                Private f32* %634 = OpAccessChain %557 %94 
					                                         f32 %635 = OpLoad %634 
					                                         f32 %636 = OpFMul %633 %635 
					                                Private f32* %637 = OpAccessChain %557 %94 
					                                                      OpStore %637 %636 
					                                Private f32* %638 = OpAccessChain %557 %94 
					                                         f32 %639 = OpLoad %638 
					                                         f32 %640 = OpLoad %610 
					                                         f32 %641 = OpFMul %639 %640 
					                                Private f32* %642 = OpAccessChain %557 %94 
					                                                      OpStore %642 %641 
					                                Private f32* %643 = OpAccessChain %557 %94 
					                                         f32 %644 = OpLoad %643 
					                                         f32 %645 = OpExtInst %1 37 %644 %30 
					                                Private f32* %646 = OpAccessChain %35 %553 
					                                                      OpStore %646 %645 
					                                       f32_4 %647 = OpLoad %35 
					                                       f32_4 %648 = OpFNegate %647 
					                                       f32_4 %649 = OpLoad %294 
					                                       f32_4 %650 = OpFAdd %648 %649 
					                                                      OpStore %294 %650 
					                                Uniform f32* %651 = OpAccessChain %14 %606 %94 
					                                         f32 %652 = OpLoad %651 
					                                         f32 %653 = OpFNegate %652 
					                                Uniform f32* %654 = OpAccessChain %14 %606 %18 
					                                         f32 %655 = OpLoad %654 
					                                         f32 %656 = OpFAdd %653 %655 
					                                Private f32* %657 = OpAccessChain %557 %94 
					                                                      OpStore %657 %656 
					                                         f32 %658 = OpLoad %562 
					                                Private f32* %659 = OpAccessChain %557 %94 
					                                         f32 %660 = OpLoad %659 
					                                         f32 %661 = OpFMul %658 %660 
					                                Uniform f32* %662 = OpAccessChain %14 %606 %94 
					                                         f32 %663 = OpLoad %662 
					                                         f32 %664 = OpFAdd %661 %663 
					                                Private f32* %665 = OpAccessChain %557 %94 
					                                                      OpStore %665 %664 
					                                Private f32* %666 = OpAccessChain %557 %94 
					                                         f32 %667 = OpLoad %666 
					                                Uniform f32* %668 = OpAccessChain %14 %606 %18 
					                                         f32 %669 = OpLoad %668 
					                                         f32 %670 = OpExtInst %1 40 %667 %669 
					                                Private f32* %671 = OpAccessChain %557 %94 
					                                                      OpStore %671 %670 
					                                Private f32* %672 = OpAccessChain %557 %94 
					                                         f32 %673 = OpLoad %672 
					                                Uniform f32* %674 = OpAccessChain %14 %606 %94 
					                                         f32 %675 = OpLoad %674 
					                                         f32 %676 = OpExtInst %1 37 %673 %675 
					                                Private f32* %677 = OpAccessChain %557 %94 
					                                                      OpStore %677 %676 
					                                       f32_3 %678 = OpLoad %557 
					                                       f32_4 %679 = OpVectorShuffle %678 %678 0 0 0 0 
					                                       f32_4 %680 = OpLoad %294 
					                                       f32_4 %681 = OpFMul %679 %680 
					                                       f32_4 %682 = OpLoad %35 
					                                       f32_4 %683 = OpFAdd %681 %682 
					                                                      OpStore %35 %683 
					                                Private f32* %684 = OpAccessChain %35 %88 
					                                         f32 %685 = OpLoad %684 
					                                Private f32* %686 = OpAccessChain %35 %18 
					                                         f32 %687 = OpLoad %686 
					                                         f32 %688 = OpExtInst %1 40 %685 %687 
					                                                      OpStore %520 %688 
					                                Private f32* %689 = OpAccessChain %35 %94 
					                                         f32 %690 = OpLoad %689 
					                                         f32 %691 = OpLoad %520 
					                                         f32 %692 = OpExtInst %1 40 %690 %691 
					                                                      OpStore %520 %692 
					                                         f32 %693 = OpLoad %520 
					                                         f32 %694 = OpFNegate %693 
					                                         f32 %695 = OpFAdd %694 %30 
					                                                      OpStore %520 %695 
					                                         f32 %696 = OpLoad %520 
					                                         f32 %697 = OpFDiv %30 %696 
					                                Private f32* %698 = OpAccessChain %154 %94 
					                                                      OpStore %698 %697 
					                                       f32_4 %699 = OpLoad %35 
					                                       f32_3 %700 = OpVectorShuffle %699 %699 0 1 2 
					                                       f32_3 %701 = OpLoad %154 
					                                       f32_3 %702 = OpVectorShuffle %701 %701 0 0 0 
					                                       f32_3 %703 = OpFMul %700 %702 
					                                       f32_4 %704 = OpLoad %35 
					                                       f32_4 %705 = OpVectorShuffle %704 %703 4 5 6 3 
					                                                      OpStore %35 %705 
					                                       f32_4 %708 = OpLoad %35 
					                                       f32_3 %709 = OpVectorShuffle %708 %708 0 1 2 
					                                       f32_4 %710 = OpLoad %707 
					                                       f32_4 %711 = OpVectorShuffle %710 %709 4 5 6 3 
					                                                      OpStore %707 %711 
					                                       f32_4 %713 = OpLoad %35 
					                                                      OpStore %712 %713 
					                                Private f32* %714 = OpAccessChain %35 %553 
					                                         f32 %715 = OpLoad %714 
					                                         f32 %717 = OpFMul %715 %716 
					                                 Output f32* %719 = OpAccessChain %707 %553 
					                                                      OpStore %719 %717 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[2];
						vec4 _CameraDepthTexture_TexelSize;
						vec2 _Jitter;
						vec4 _SharpenParameters;
						vec4 _FinalBlendParameters;
					};
					layout(location = 1) uniform  sampler2D _CameraDepthTexture;
					layout(location = 2) uniform  sampler2D _CameraMotionVectorsTexture;
					layout(location = 3) uniform  sampler2D _MainTex;
					layout(location = 4) uniform  sampler2D _HistoryTex;
					layout(location = 0) in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat10_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec3 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					float u_xlat7;
					vec2 u_xlat12;
					float u_xlat16_12;
					float u_xlat13;
					vec2 u_xlat14;
					float u_xlat18;
					float u_xlat16_18;
					float u_xlat19;
					float u_xlat16_19;
					bool u_xlatb19;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat6.xy = _Jitter.xy * vec2(1.0, -1.0);
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat6.xy : _Jitter.xy;
					    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat12.xy = (-_MainTex_TexelSize.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat16_12 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_12 = max(u_xlat16_12, u_xlat10_1.x);
					    u_xlat16_12 = u_xlat16_12 + 1.0;
					    u_xlat16_12 = float(1.0) / u_xlat16_12;
					    u_xlat16_2.xyz = vec3(u_xlat16_12) * u_xlat10_1.xyz;
					    u_xlat12.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat16_18 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_18 = max(u_xlat16_18, u_xlat10_0.x);
					    u_xlat16_18 = u_xlat16_18 + 1.0;
					    u_xlat16_18 = float(1.0) / u_xlat16_18;
					    u_xlat16_4.xyz = vec3(u_xlat16_18) * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_1.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
					    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_4.xyz);
					    u_xlat16_4.xyz = (-u_xlat16_0.xyz) * vec3(0.166666999, 0.166666999, 0.166666999) + u_xlat10_3.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * _SharpenParameters.xxx;
					    u_xlat3.xyz = u_xlat4.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_3.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat16_0.xyz + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.142857, 0.142857, 0.142857);
					    u_xlat18 = max(u_xlat0.z, u_xlat0.y);
					    u_xlat18 = max(u_xlat18, u_xlat0.x);
					    u_xlat18 = u_xlat18 + 1.0;
					    u_xlat18 = float(1.0) / u_xlat18;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat6.x = max(u_xlat3.z, u_xlat3.y);
					    u_xlat6.x = max(u_xlat6.x, u_xlat3.x);
					    u_xlat6.x = u_xlat6.x + 1.0;
					    u_xlat6.x = float(1.0) / u_xlat6.x;
					    u_xlat3.xyz = u_xlat6.xxx * u_xlat3.xyz;
					    u_xlat6.x = dot(u_xlat3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
					    u_xlat6.xyz = -abs(u_xlat0.xxx) * vec3(4.0, 4.0, 4.0) + u_xlat16_1.xyz;
					    u_xlat1.xyz = abs(u_xlat0.xxx) * vec3(4.0, 4.0, 4.0) + u_xlat16_2.xyz;
					    u_xlat2.xyz = (-u_xlat6.xyz) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat6.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD0.zw + (-_CameraDepthTexture_TexelSize.xy);
					    u_xlat2.z = texture(_CameraDepthTexture, u_xlat2.xy).x;
					    u_xlat4.z = texture(_CameraDepthTexture, vs_TEXCOORD0.zw).x;
					    u_xlatb19 = u_xlat2.z>=u_xlat4.z;
					    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
					    u_xlat2.x = float(-1.0);
					    u_xlat2.y = float(-1.0);
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat2.xyz = u_xlat2.xyz + (-u_xlat4.yyz);
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz + u_xlat4.xyz;
					    u_xlat4.x = float(1.0);
					    u_xlat4.y = float(-1.0);
					    u_xlat5 = _CameraDepthTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.zwzw;
					    u_xlat4.z = texture(_CameraDepthTexture, u_xlat5.xy).x;
					    u_xlat5.z = texture(_CameraDepthTexture, u_xlat5.zw).x;
					    u_xlatb19 = u_xlat4.z>=u_xlat2.z;
					    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
					    u_xlat4.xyz = (-u_xlat2.yyz) + u_xlat4.xyz;
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat2.xyz;
					    u_xlat5.x = float(-1.0);
					    u_xlat5.y = float(1.0);
					    u_xlat5.w = float(0.0);
					    u_xlatb19 = u_xlat5.z>=u_xlat2.z;
					    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
					    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat5.xyz;
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat2.xyz;
					    u_xlat4.xy = vs_TEXCOORD0.zw + _CameraDepthTexture_TexelSize.xy;
					    u_xlat19 = texture(_CameraDepthTexture, u_xlat4.xy).x;
					    u_xlatb19 = u_xlat19>=u_xlat2.z;
					    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
					    u_xlat14.xy = (-u_xlat2.xy) + vec2(1.0, 1.0);
					    u_xlat2.xy = vec2(u_xlat19) * u_xlat14.xy + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * _CameraDepthTexture_TexelSize.xy + vs_TEXCOORD0.zw;
					    u_xlat10_2.xy = texture(_CameraMotionVectorsTexture, u_xlat2.xy).xy;
					    u_xlat14.xy = (-u_xlat10_2.xy) + vs_TEXCOORD0.zw;
					    u_xlat16_19 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlat16_19 = sqrt(u_xlat16_19);
					    u_xlat10_2 = texture(_HistoryTex, u_xlat14.xy);
					    u_xlat16_4.x = max(u_xlat10_2.z, u_xlat10_2.y);
					    u_xlat16_4.x = max(u_xlat10_2.x, u_xlat16_4.x);
					    u_xlat16_4.x = u_xlat16_4.x + 1.0;
					    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
					    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat16_4.xxx + (-u_xlat0.xyz);
					    u_xlat4.xyz = u_xlat10_2.xyz * u_xlat16_4.xxx;
					    u_xlat0.w = u_xlat10_2.w;
					    u_xlat1.xyz = u_xlat5.xyz / u_xlat1.xyz;
					    u_xlat7 = max(abs(u_xlat1.z), abs(u_xlat1.y));
					    u_xlat1.x = max(u_xlat7, abs(u_xlat1.x));
					    u_xlat2 = u_xlat5 / u_xlat1.xxxx;
					    u_xlatb1 = 1.0<u_xlat1.x;
					    u_xlat2 = u_xlat0 + u_xlat2;
					    u_xlat4.w = u_xlat0.w;
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat4;
					    u_xlat1.x = (-_MainTex_TexelSize.z) * 0.00200000009 + u_xlat16_19;
					    u_xlat7 = u_xlat16_19 * _FinalBlendParameters.z;
					    u_xlat13 = _MainTex_TexelSize.z * 0.00150000001;
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat1.x = u_xlat13 * u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat13;
					    u_xlat3.w = min(u_xlat1.x, 1.0);
					    u_xlat0 = u_xlat0 + (-u_xlat3);
					    u_xlat1.x = (-_FinalBlendParameters.x) + _FinalBlendParameters.y;
					    u_xlat1.x = u_xlat7 * u_xlat1.x + _FinalBlendParameters.x;
					    u_xlat1.x = max(u_xlat1.x, _FinalBlendParameters.y);
					    u_xlat1.x = min(u_xlat1.x, _FinalBlendParameters.x);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat3;
					    u_xlat1.x = max(u_xlat0.z, u_xlat0.y);
					    u_xlat1.x = max(u_xlat0.x, u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    SV_Target1.xyz = u_xlat0.xyz;
					    SV_Target0 = u_xlat0;
					    SV_Target1.w = u_xlat0.w * 0.850000024;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 102385
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(binding = 1, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    vs_TEXCOORD0.y = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    vs_TEXCOORD0.xzw = in_TEXCOORD0.xxy;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _Jitter;
					uniform 	vec4 _SharpenParameters;
					uniform 	vec4 _FinalBlendParameters;
					UNITY_LOCATION(0) uniform  sampler2D _CameraMotionVectorsTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					UNITY_LOCATION(2) uniform  sampler2D _HistoryTex;
					layout(location = 0) in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec3 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat5;
					float u_xlat6;
					vec2 u_xlat12;
					vec2 u_xlat15;
					float u_xlat18;
					float u_xlat16_18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + (-_Jitter.xy);
					    u_xlat12.xy = (-_MainTex_TexelSize.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat12.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_4.xyz = u_xlat10_2.xyz + u_xlat10_2.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_4.xyz);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vec3(0.166666999, 0.166666999, 0.166666999) + u_xlat10_2.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * _SharpenParameters.xxx;
					    u_xlat2.xyz = u_xlat4.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_2.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = u_xlat2.xyz + u_xlat16_3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(0.142857, 0.142857, 0.142857);
					    u_xlat18 = max(u_xlat3.z, u_xlat3.y);
					    u_xlat18 = max(u_xlat18, u_xlat3.x);
					    u_xlat18 = u_xlat18 + 1.0;
					    u_xlat18 = float(1.0) / u_xlat18;
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat19 = max(u_xlat2.z, u_xlat2.y);
					    u_xlat19 = max(u_xlat19, u_xlat2.x);
					    u_xlat19 = u_xlat19 + 1.0;
					    u_xlat19 = float(1.0) / u_xlat19;
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat19 = dot(u_xlat2.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat18 = u_xlat18 + (-u_xlat19);
					    u_xlat16_19 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_19 = max(u_xlat16_19, u_xlat10_1.x);
					    u_xlat16_19 = u_xlat16_19 + 1.0;
					    u_xlat16_19 = float(1.0) / u_xlat16_19;
					    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat10_1.xyz;
					    u_xlat16_19 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_19 = max(u_xlat10_0.x, u_xlat16_19);
					    u_xlat16_19 = u_xlat16_19 + 1.0;
					    u_xlat16_19 = float(1.0) / u_xlat16_19;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(u_xlat16_19);
					    u_xlat16_3.xyz = min(u_xlat16_1.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat0.xyz = abs(vec3(u_xlat18)) * vec3(4.0, 4.0, 4.0) + u_xlat16_0.xyz;
					    u_xlat1.xyz = -abs(vec3(u_xlat18)) * vec3(4.0, 4.0, 4.0) + u_xlat16_3.xyz;
					    u_xlat3.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat10_3.xy = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.zw).xy;
					    u_xlat15.xy = (-u_xlat10_3.xy) + vs_TEXCOORD0.zw;
					    u_xlat16_18 = dot(u_xlat10_3.xy, u_xlat10_3.xy);
					    u_xlat16_18 = sqrt(u_xlat16_18);
					    u_xlat10_3 = texture(_HistoryTex, u_xlat15.xy);
					    u_xlat16_4.x = max(u_xlat10_3.z, u_xlat10_3.y);
					    u_xlat16_4.x = max(u_xlat10_3.x, u_xlat16_4.x);
					    u_xlat16_4.x = u_xlat16_4.x + 1.0;
					    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
					    u_xlat5.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx + (-u_xlat1.xyz);
					    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx;
					    u_xlat1.w = u_xlat10_3.w;
					    u_xlat0.xyz = u_xlat5.xyz / u_xlat0.xyz;
					    u_xlat6 = max(abs(u_xlat0.z), abs(u_xlat0.y));
					    u_xlat0.x = max(u_xlat6, abs(u_xlat0.x));
					    u_xlat5.w = 0.0;
					    u_xlat3 = u_xlat5 / u_xlat0.xxxx;
					    u_xlatb0 = 1.0<u_xlat0.x;
					    u_xlat3 = u_xlat1 + u_xlat3;
					    u_xlat4.w = u_xlat1.w;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat3 : u_xlat4;
					    u_xlat0.x = (-_MainTex_TexelSize.z) * 0.00200000009 + u_xlat16_18;
					    u_xlat6 = u_xlat16_18 * _FinalBlendParameters.z;
					    u_xlat12.x = _MainTex_TexelSize.z * 0.00150000001;
					    u_xlat12.x = float(1.0) / u_xlat12.x;
					    u_xlat0.x = u_xlat12.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat12.x;
					    u_xlat2.w = min(u_xlat0.x, 1.0);
					    u_xlat1 = u_xlat1 + (-u_xlat2);
					    u_xlat0.x = (-_FinalBlendParameters.x) + _FinalBlendParameters.y;
					    u_xlat0.x = u_xlat6 * u_xlat0.x + _FinalBlendParameters.x;
					    u_xlat0.x = max(u_xlat0.x, _FinalBlendParameters.y);
					    u_xlat0.x = min(u_xlat0.x, _FinalBlendParameters.x);
					    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
					    u_xlat1.x = max(u_xlat0.z, u_xlat0.y);
					    u_xlat1.x = max(u_xlat0.x, u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    SV_Target1.xyz = u_xlat0.xyz;
					    SV_Target0 = u_xlat0;
					    SV_Target1.w = u_xlat0.w * 0.850000024;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 122
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %99 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate vs_TEXCOORD0 Location 99 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                                            %101 = OpTypePointer Function %6 
					                                            %110 = OpTypePointer Output %6 
					                                            %112 = OpTypeVector %6 3 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %102 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                       bool %100 = OpLoad %84 
					                                                     OpSelectionMerge %104 None 
					                                                     OpBranchConditional %100 %103 %106 
					                                            %103 = OpLabel 
					                                        f32 %105 = OpLoad %91 
					                                                     OpStore %102 %105 
					                                                     OpBranch %104 
					                                            %106 = OpLabel 
					                                 Input f32* %107 = OpAccessChain %92 %68 
					                                        f32 %108 = OpLoad %107 
					                                                     OpStore %102 %108 
					                                                     OpBranch %104 
					                                            %104 = OpLabel 
					                                        f32 %109 = OpLoad %102 
					                                Output f32* %111 = OpAccessChain vs_TEXCOORD0 %68 
					                                                     OpStore %111 %109 
					                                      f32_4 %113 = OpLoad %92 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 0 1 
					                                      f32_4 %115 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %116 = OpVectorShuffle %115 %114 4 1 5 6 
					                                                     OpStore vs_TEXCOORD0 %116 
					                                Output f32* %117 = OpAccessChain %72 %22 %68 
					                                        f32 %118 = OpLoad %117 
					                                        f32 %119 = OpFNegate %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                                     OpStore %120 %119 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 537
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %52 %523 %528 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 52 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %75 DescriptorSet 75 
					                                                      OpDecorate %75 Binding 75 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %79 DescriptorSet 79 
					                                                      OpDecorate %79 Binding 79 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %303 DescriptorSet 303 
					                                                      OpDecorate %303 Binding 303 
					                                                      OpDecorate %304 RelaxedPrecision 
					                                                      OpDecorate %305 RelaxedPrecision 
					                                                      OpDecorate %305 DescriptorSet 305 
					                                                      OpDecorate %305 Binding 305 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %311 RelaxedPrecision 
					                                                      OpDecorate %315 RelaxedPrecision 
					                                                      OpDecorate %316 RelaxedPrecision 
					                                                      OpDecorate %317 RelaxedPrecision 
					                                                      OpDecorate %321 RelaxedPrecision 
					                                                      OpDecorate %322 RelaxedPrecision 
					                                                      OpDecorate %323 RelaxedPrecision 
					                                                      OpDecorate %324 RelaxedPrecision 
					                                                      OpDecorate %325 RelaxedPrecision 
					                                                      OpDecorate %326 RelaxedPrecision 
					                                                      OpDecorate %327 RelaxedPrecision 
					                                                      OpDecorate %328 RelaxedPrecision 
					                                                      OpDecorate %328 DescriptorSet 328 
					                                                      OpDecorate %328 Binding 328 
					                                                      OpDecorate %329 RelaxedPrecision 
					                                                      OpDecorate %330 RelaxedPrecision 
					                                                      OpDecorate %330 DescriptorSet 330 
					                                                      OpDecorate %330 Binding 330 
					                                                      OpDecorate %331 RelaxedPrecision 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                                      OpDecorate %337 RelaxedPrecision 
					                                                      OpDecorate %339 RelaxedPrecision 
					                                                      OpDecorate %340 RelaxedPrecision 
					                                                      OpDecorate %342 RelaxedPrecision 
					                                                      OpDecorate %343 RelaxedPrecision 
					                                                      OpDecorate %344 RelaxedPrecision 
					                                                      OpDecorate %345 RelaxedPrecision 
					                                                      OpDecorate %346 RelaxedPrecision 
					                                                      OpDecorate %347 RelaxedPrecision 
					                                                      OpDecorate %348 RelaxedPrecision 
					                                                      OpDecorate %350 RelaxedPrecision 
					                                                      OpDecorate %351 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %353 RelaxedPrecision 
					                                                      OpDecorate %354 RelaxedPrecision 
					                                                      OpDecorate %361 RelaxedPrecision 
					                                                      OpDecorate %362 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %365 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %418 RelaxedPrecision 
					                                                      OpDecorate %421 RelaxedPrecision 
					                                                      OpDecorate %507 RelaxedPrecision 
					                                                      OpDecorate %509 RelaxedPrecision 
					                                                      OpDecorate %510 RelaxedPrecision 
					                                                      OpDecorate %511 RelaxedPrecision 
					                                                      OpDecorate %512 RelaxedPrecision 
					                                                      OpDecorate %513 RelaxedPrecision 
					                                                      OpDecorate %517 RelaxedPrecision 
					                                                      OpDecorate %518 RelaxedPrecision 
					                                                      OpDecorate %523 Location 523 
					                                                      OpDecorate %528 Location 528 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 4 
					                                              %11 = OpTypeVector %9 2 
					                                              %12 = OpTypeStruct %10 %11 %10 %10 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32_4; f32_2; f32_4; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 0 
					                                              %17 = OpTypeInt 32 0 
					                                          u32 %18 = OpConstant 1 
					                                              %19 = OpTypePointer Uniform %9 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                              %24 = OpTypePointer Private %11 
					                               Private f32_2* %25 = OpVariable Private 
					                                          i32 %26 = OpConstant 1 
					                                              %27 = OpTypePointer Uniform %11 
					                                          f32 %30 = OpConstant 3,674022E-40 
					                                          f32 %31 = OpConstant 3,674022E-40 
					                                        f32_2 %32 = OpConstantComposite %30 %31 
					                                              %34 = OpTypePointer Private %10 
					                               Private f32_4* %35 = OpVariable Private 
					                                              %37 = OpTypePointer Function %11 
					                                              %51 = OpTypePointer Input %10 
					                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                               Private f32_2* %58 = OpVariable Private 
					                                              %59 = OpTypePointer Uniform %10 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                        f32_2 %65 = OpConstantComposite %64 %64 
					                                              %70 = OpTypeVector %9 3 
					                                              %71 = OpTypePointer Private %70 
					                               Private f32_3* %72 = OpVariable Private 
					                                              %73 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                              %74 = OpTypePointer UniformConstant %73 
					         UniformConstant read_only Texture2D* %75 = OpVariable UniformConstant 
					                                              %77 = OpTypeSampler 
					                                              %78 = OpTypePointer UniformConstant %77 
					                     UniformConstant sampler* %79 = OpVariable UniformConstant 
					                                              %81 = OpTypeSampledImage %73 
					                                              %86 = OpTypePointer Private %9 
					                                 Private f32* %87 = OpVariable Private 
					                                          u32 %88 = OpConstant 2 
					                                          u32 %94 = OpConstant 0 
					                                Private f32* %101 = OpVariable Private 
					                              Private f32_3* %104 = OpVariable Private 
					                              Private f32_3* %116 = OpVariable Private 
					                              Private f32_3* %124 = OpVariable Private 
					                                Private f32* %142 = OpVariable Private 
					                              Private f32_3* %145 = OpVariable Private 
					                              Private f32_3* %150 = OpVariable Private 
					                              Private f32_3* %154 = OpVariable Private 
					                                         f32 %165 = OpConstant 3,674022E-40 
					                                       f32_3 %166 = OpConstantComposite %165 %165 %165 
					                                         f32 %173 = OpConstant 3,674022E-40 
					                                       f32_3 %174 = OpConstantComposite %173 %173 %173 
					                              Private f32_4* %178 = OpVariable Private 
					                                         i32 %180 = OpConstant 2 
					                              Private f32_4* %187 = OpVariable Private 
					                                         f32 %190 = OpConstant 3,674022E-40 
					                                       f32_3 %191 = OpConstantComposite %190 %190 %190 
					                                       f32_3 %199 = OpConstantComposite %22 %22 %22 
					                                         f32 %211 = OpConstant 3,674022E-40 
					                                       f32_3 %212 = OpConstantComposite %211 %211 %211 
					                                         f32 %238 = OpConstant 3,674022E-40 
					                                         f32 %239 = OpConstant 3,674022E-40 
					                                         f32 %240 = OpConstant 3,674022E-40 
					                                       f32_3 %241 = OpConstantComposite %238 %239 %240 
					                                Private f32* %243 = OpVariable Private 
					                                Private f32* %268 = OpVariable Private 
					                              Private f32_3* %286 = OpVariable Private 
					                                       f32_3 %295 = OpConstantComposite %64 %64 %64 
					                              Private f32_4* %297 = OpVariable Private 
					                              Private f32_4* %302 = OpVariable Private 
					        UniformConstant read_only Texture2D* %303 = OpVariable UniformConstant 
					                    UniformConstant sampler* %305 = OpVariable UniformConstant 
					                              Private f32_2* %314 = OpVariable Private 
					        UniformConstant read_only Texture2D* %328 = OpVariable UniformConstant 
					                    UniformConstant sampler* %330 = OpVariable UniformConstant 
					                                Private f32* %335 = OpVariable Private 
					                                         u32 %368 = OpConstant 3 
					                              Private f32_3* %372 = OpVariable Private 
					                                Private f32* %377 = OpVariable Private 
					                              Private f32_4* %392 = OpVariable Private 
					                               Private bool* %397 = OpVariable Private 
					                                             %410 = OpTypeVector %6 4 
					                                         f32 %416 = OpConstant 3,674022E-40 
					                                         i32 %422 = OpConstant 3 
					                                Private f32* %426 = OpVariable Private 
					                                         f32 %429 = OpConstant 3,674022E-40 
					                                         f32 %444 = OpConstant 3,674022E-40 
					                                         f32 %446 = OpConstant 3,674022E-40 
					                                             %522 = OpTypePointer Output %10 
					                               Output f32_4* %523 = OpVariable Output 
					                               Output f32_4* %528 = OpVariable Output 
					                                         f32 %532 = OpConstant 3,674022E-40 
					                                             %534 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                              Function f32_2* %38 = OpVariable Function 
					                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
					                                          f32 %21 = OpLoad %20 
					                                         bool %23 = OpFOrdLessThan %21 %22 
					                                                      OpStore %8 %23 
					                               Uniform f32_2* %28 = OpAccessChain %14 %26 
					                                        f32_2 %29 = OpLoad %28 
					                                        f32_2 %33 = OpFMul %29 %32 
					                                                      OpStore %25 %33 
					                                         bool %36 = OpLoad %8 
					                                                      OpSelectionMerge %40 None 
					                                                      OpBranchConditional %36 %39 %42 
					                                              %39 = OpLabel 
					                                        f32_2 %41 = OpLoad %25 
					                                                      OpStore %38 %41 
					                                                      OpBranch %40 
					                                              %42 = OpLabel 
					                               Uniform f32_2* %43 = OpAccessChain %14 %26 
					                                        f32_2 %44 = OpLoad %43 
					                                                      OpStore %38 %44 
					                                                      OpBranch %40 
					                                              %40 = OpLabel 
					                                        f32_2 %45 = OpLoad %38 
					                                        f32_4 %46 = OpLoad %35 
					                                        f32_4 %47 = OpVectorShuffle %46 %45 4 5 2 3 
					                                                      OpStore %35 %47 
					                                        f32_4 %48 = OpLoad %35 
					                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                        f32_2 %50 = OpFNegate %49 
					                                        f32_4 %53 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
					                                        f32_2 %55 = OpFAdd %50 %54 
					                                        f32_4 %56 = OpLoad %35 
					                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
					                                                      OpStore %35 %57 
					                               Uniform f32_4* %60 = OpAccessChain %14 %16 
					                                        f32_4 %61 = OpLoad %60 
					                                        f32_2 %62 = OpVectorShuffle %61 %61 0 1 
					                                        f32_2 %63 = OpFNegate %62 
					                                        f32_2 %66 = OpFMul %63 %65 
					                                        f32_4 %67 = OpLoad %35 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                        f32_2 %69 = OpFAdd %66 %68 
					                                                      OpStore %58 %69 
					                          read_only Texture2D %76 = OpLoad %75 
					                                      sampler %80 = OpLoad %79 
					                   read_only Texture2DSampled %82 = OpSampledImage %76 %80 
					                                        f32_2 %83 = OpLoad %58 
					                                        f32_4 %84 = OpImageSampleImplicitLod %82 %83 
					                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                                      OpStore %72 %85 
					                                 Private f32* %89 = OpAccessChain %72 %88 
					                                          f32 %90 = OpLoad %89 
					                                 Private f32* %91 = OpAccessChain %72 %18 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpExtInst %1 40 %90 %92 
					                                                      OpStore %87 %93 
					                                 Private f32* %95 = OpAccessChain %72 %94 
					                                          f32 %96 = OpLoad %95 
					                                          f32 %97 = OpLoad %87 
					                                          f32 %98 = OpExtInst %1 40 %96 %97 
					                                                      OpStore %87 %98 
					                                          f32 %99 = OpLoad %87 
					                                         f32 %100 = OpFAdd %99 %30 
					                                                      OpStore %87 %100 
					                                         f32 %102 = OpLoad %87 
					                                         f32 %103 = OpFDiv %30 %102 
					                                                      OpStore %101 %103 
					                                         f32 %105 = OpLoad %101 
					                                       f32_3 %106 = OpCompositeConstruct %105 %105 %105 
					                                       f32_3 %107 = OpLoad %72 
					                                       f32_3 %108 = OpFMul %106 %107 
					                                                      OpStore %104 %108 
					                              Uniform f32_4* %109 = OpAccessChain %14 %16 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
					                                       f32_2 %112 = OpFMul %111 %65 
					                                       f32_4 %113 = OpLoad %35 
					                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
					                                       f32_2 %115 = OpFAdd %112 %114 
					                                                      OpStore %58 %115 
					                         read_only Texture2D %117 = OpLoad %75 
					                                     sampler %118 = OpLoad %79 
					                  read_only Texture2DSampled %119 = OpSampledImage %117 %118 
					                                       f32_4 %120 = OpLoad %35 
					                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                       f32_4 %122 = OpImageSampleImplicitLod %119 %121 
					                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
					                                                      OpStore %116 %123 
					                         read_only Texture2D %125 = OpLoad %75 
					                                     sampler %126 = OpLoad %79 
					                  read_only Texture2DSampled %127 = OpSampledImage %125 %126 
					                                       f32_2 %128 = OpLoad %58 
					                                       f32_4 %129 = OpImageSampleImplicitLod %127 %128 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
					                                                      OpStore %124 %130 
					                                Private f32* %131 = OpAccessChain %124 %88 
					                                         f32 %132 = OpLoad %131 
					                                Private f32* %133 = OpAccessChain %124 %18 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpExtInst %1 40 %132 %134 
					                                                      OpStore %87 %135 
					                                Private f32* %136 = OpAccessChain %124 %94 
					                                         f32 %137 = OpLoad %136 
					                                         f32 %138 = OpLoad %87 
					                                         f32 %139 = OpExtInst %1 40 %137 %138 
					                                                      OpStore %87 %139 
					                                         f32 %140 = OpLoad %87 
					                                         f32 %141 = OpFAdd %140 %30 
					                                                      OpStore %87 %141 
					                                         f32 %143 = OpLoad %87 
					                                         f32 %144 = OpFDiv %30 %143 
					                                                      OpStore %142 %144 
					                                         f32 %146 = OpLoad %142 
					                                       f32_3 %147 = OpCompositeConstruct %146 %146 %146 
					                                       f32_3 %148 = OpLoad %124 
					                                       f32_3 %149 = OpFMul %147 %148 
					                                                      OpStore %145 %149 
					                                       f32_3 %151 = OpLoad %124 
					                                       f32_3 %152 = OpLoad %72 
					                                       f32_3 %153 = OpFAdd %151 %152 
					                                                      OpStore %150 %153 
					                                       f32_3 %155 = OpLoad %104 
					                                       f32_3 %156 = OpLoad %145 
					                                       f32_3 %157 = OpExtInst %1 37 %155 %156 
					                                                      OpStore %154 %157 
					                                       f32_3 %158 = OpLoad %104 
					                                       f32_3 %159 = OpLoad %145 
					                                       f32_3 %160 = OpExtInst %1 40 %158 %159 
					                                                      OpStore %104 %160 
					                                       f32_3 %161 = OpLoad %116 
					                                       f32_3 %162 = OpLoad %116 
					                                       f32_3 %163 = OpFAdd %161 %162 
					                                                      OpStore %145 %163 
					                                       f32_3 %164 = OpLoad %150 
					                                       f32_3 %167 = OpFMul %164 %166 
					                                       f32_3 %168 = OpLoad %145 
					                                       f32_3 %169 = OpFNegate %168 
					                                       f32_3 %170 = OpFAdd %167 %169 
					                                                      OpStore %150 %170 
					                                       f32_3 %171 = OpLoad %150 
					                                       f32_3 %172 = OpFNegate %171 
					                                       f32_3 %175 = OpFMul %172 %174 
					                                       f32_3 %176 = OpLoad %116 
					                                       f32_3 %177 = OpFAdd %175 %176 
					                                                      OpStore %145 %177 
					                                       f32_3 %179 = OpLoad %145 
					                              Uniform f32_4* %181 = OpAccessChain %14 %180 
					                                       f32_4 %182 = OpLoad %181 
					                                       f32_3 %183 = OpVectorShuffle %182 %182 0 0 0 
					                                       f32_3 %184 = OpFMul %179 %183 
					                                       f32_4 %185 = OpLoad %178 
					                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
					                                                      OpStore %178 %186 
					                                       f32_4 %188 = OpLoad %178 
					                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
					                                       f32_3 %192 = OpFMul %189 %191 
					                                       f32_3 %193 = OpLoad %116 
					                                       f32_3 %194 = OpFAdd %192 %193 
					                                       f32_4 %195 = OpLoad %187 
					                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
					                                                      OpStore %187 %196 
					                                       f32_4 %197 = OpLoad %187 
					                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
					                                       f32_3 %200 = OpExtInst %1 40 %198 %199 
					                                       f32_4 %201 = OpLoad %187 
					                                       f32_4 %202 = OpVectorShuffle %201 %200 4 5 6 3 
					                                                      OpStore %187 %202 
					                                       f32_3 %203 = OpLoad %150 
					                                       f32_4 %204 = OpLoad %187 
					                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
					                                       f32_3 %206 = OpFAdd %203 %205 
					                                       f32_4 %207 = OpLoad %35 
					                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
					                                                      OpStore %35 %208 
					                                       f32_4 %209 = OpLoad %35 
					                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
					                                       f32_3 %213 = OpFMul %210 %212 
					                                       f32_4 %214 = OpLoad %35 
					                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
					                                                      OpStore %35 %215 
					                                Private f32* %216 = OpAccessChain %35 %88 
					                                         f32 %217 = OpLoad %216 
					                                Private f32* %218 = OpAccessChain %35 %18 
					                                         f32 %219 = OpLoad %218 
					                                         f32 %220 = OpExtInst %1 40 %217 %219 
					                                                      OpStore %87 %220 
					                                Private f32* %221 = OpAccessChain %35 %94 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpLoad %87 
					                                         f32 %224 = OpExtInst %1 40 %222 %223 
					                                                      OpStore %87 %224 
					                                         f32 %225 = OpLoad %87 
					                                         f32 %226 = OpFAdd %225 %30 
					                                                      OpStore %87 %226 
					                                         f32 %227 = OpLoad %87 
					                                         f32 %228 = OpFDiv %30 %227 
					                                                      OpStore %142 %228 
					                                         f32 %229 = OpLoad %142 
					                                       f32_3 %230 = OpCompositeConstruct %229 %229 %229 
					                                       f32_4 %231 = OpLoad %35 
					                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
					                                       f32_3 %233 = OpFMul %230 %232 
					                                       f32_4 %234 = OpLoad %35 
					                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
					                                                      OpStore %35 %235 
					                                       f32_4 %236 = OpLoad %35 
					                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
					                                         f32 %242 = OpDot %237 %241 
					                                                      OpStore %87 %242 
					                                Private f32* %244 = OpAccessChain %187 %88 
					                                         f32 %245 = OpLoad %244 
					                                Private f32* %246 = OpAccessChain %187 %18 
					                                         f32 %247 = OpLoad %246 
					                                         f32 %248 = OpExtInst %1 40 %245 %247 
					                                                      OpStore %243 %248 
					                                         f32 %249 = OpLoad %243 
					                                Private f32* %250 = OpAccessChain %187 %94 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpExtInst %1 40 %249 %251 
					                                                      OpStore %243 %252 
					                                         f32 %253 = OpLoad %243 
					                                         f32 %254 = OpFAdd %253 %30 
					                                                      OpStore %243 %254 
					                                         f32 %255 = OpLoad %243 
					                                         f32 %256 = OpFDiv %30 %255 
					                                Private f32* %257 = OpAccessChain %150 %94 
					                                                      OpStore %257 %256 
					                                       f32_3 %258 = OpLoad %150 
					                                       f32_3 %259 = OpVectorShuffle %258 %258 0 0 0 
					                                       f32_4 %260 = OpLoad %187 
					                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
					                                       f32_3 %262 = OpFMul %259 %261 
					                                       f32_4 %263 = OpLoad %35 
					                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
					                                                      OpStore %35 %264 
					                                       f32_4 %265 = OpLoad %35 
					                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
					                                         f32 %267 = OpDot %266 %241 
					                                                      OpStore %243 %267 
					                                         f32 %269 = OpLoad %243 
					                                         f32 %270 = OpFNegate %269 
					                                         f32 %271 = OpLoad %87 
					                                         f32 %272 = OpFAdd %270 %271 
					                                                      OpStore %268 %272 
					                                         f32 %273 = OpLoad %268 
					                                       f32_3 %274 = OpCompositeConstruct %273 %273 %273 
					                                       f32_3 %275 = OpExtInst %1 4 %274 
					                                       f32_3 %276 = OpFNegate %275 
					                                       f32_3 %277 = OpFMul %276 %166 
					                                       f32_3 %278 = OpLoad %154 
					                                       f32_3 %279 = OpFAdd %277 %278 
					                                                      OpStore %154 %279 
					                                         f32 %280 = OpLoad %268 
					                                       f32_3 %281 = OpCompositeConstruct %280 %280 %280 
					                                       f32_3 %282 = OpExtInst %1 4 %281 
					                                       f32_3 %283 = OpFMul %282 %166 
					                                       f32_3 %284 = OpLoad %104 
					                                       f32_3 %285 = OpFAdd %283 %284 
					                                                      OpStore %104 %285 
					                                       f32_3 %287 = OpLoad %154 
					                                       f32_3 %288 = OpLoad %104 
					                                       f32_3 %289 = OpFAdd %287 %288 
					                                                      OpStore %286 %289 
					                                       f32_3 %290 = OpLoad %154 
					                                       f32_3 %291 = OpFNegate %290 
					                                       f32_3 %292 = OpLoad %104 
					                                       f32_3 %293 = OpFAdd %291 %292 
					                                                      OpStore %154 %293 
					                                       f32_3 %294 = OpLoad %154 
					                                       f32_3 %296 = OpFMul %294 %295 
					                                                      OpStore %154 %296 
					                                       f32_3 %298 = OpLoad %286 
					                                       f32_3 %299 = OpFMul %298 %295 
					                                       f32_4 %300 = OpLoad %297 
					                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
					                                                      OpStore %297 %301 
					                         read_only Texture2D %304 = OpLoad %303 
					                                     sampler %306 = OpLoad %305 
					                  read_only Texture2DSampled %307 = OpSampledImage %304 %306 
					                                       f32_4 %308 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %309 = OpVectorShuffle %308 %308 2 3 
					                                       f32_4 %310 = OpImageSampleImplicitLod %307 %309 
					                                       f32_2 %311 = OpVectorShuffle %310 %310 0 1 
					                                       f32_4 %312 = OpLoad %302 
					                                       f32_4 %313 = OpVectorShuffle %312 %311 4 5 2 3 
					                                                      OpStore %302 %313 
					                                       f32_4 %315 = OpLoad %302 
					                                       f32_2 %316 = OpVectorShuffle %315 %315 0 1 
					                                       f32_2 %317 = OpFNegate %316 
					                                       f32_4 %318 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %319 = OpVectorShuffle %318 %318 2 3 
					                                       f32_2 %320 = OpFAdd %317 %319 
					                                                      OpStore %314 %320 
					                                       f32_4 %321 = OpLoad %302 
					                                       f32_2 %322 = OpVectorShuffle %321 %321 0 1 
					                                       f32_4 %323 = OpLoad %302 
					                                       f32_2 %324 = OpVectorShuffle %323 %323 0 1 
					                                         f32 %325 = OpDot %322 %324 
					                                                      OpStore %268 %325 
					                                         f32 %326 = OpLoad %268 
					                                         f32 %327 = OpExtInst %1 31 %326 
					                                                      OpStore %268 %327 
					                         read_only Texture2D %329 = OpLoad %328 
					                                     sampler %331 = OpLoad %330 
					                  read_only Texture2DSampled %332 = OpSampledImage %329 %331 
					                                       f32_2 %333 = OpLoad %314 
					                                       f32_4 %334 = OpImageSampleImplicitLod %332 %333 
					                                                      OpStore %302 %334 
					                                Private f32* %336 = OpAccessChain %302 %88 
					                                         f32 %337 = OpLoad %336 
					                                Private f32* %338 = OpAccessChain %302 %18 
					                                         f32 %339 = OpLoad %338 
					                                         f32 %340 = OpExtInst %1 40 %337 %339 
					                                                      OpStore %335 %340 
					                                Private f32* %341 = OpAccessChain %302 %94 
					                                         f32 %342 = OpLoad %341 
					                                         f32 %343 = OpLoad %335 
					                                         f32 %344 = OpExtInst %1 40 %342 %343 
					                                                      OpStore %335 %344 
					                                         f32 %345 = OpLoad %335 
					                                         f32 %346 = OpFAdd %345 %30 
					                                                      OpStore %335 %346 
					                                         f32 %347 = OpLoad %335 
					                                         f32 %348 = OpFDiv %30 %347 
					                                Private f32* %349 = OpAccessChain %286 %94 
					                                                      OpStore %349 %348 
					                                       f32_4 %350 = OpLoad %302 
					                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
					                                       f32_3 %352 = OpLoad %286 
					                                       f32_3 %353 = OpVectorShuffle %352 %352 0 0 0 
					                                       f32_3 %354 = OpFMul %351 %353 
					                                       f32_4 %355 = OpLoad %297 
					                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
					                                       f32_3 %357 = OpFNegate %356 
					                                       f32_3 %358 = OpFAdd %354 %357 
					                                       f32_4 %359 = OpLoad %178 
					                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
					                                                      OpStore %178 %360 
					                                       f32_4 %361 = OpLoad %302 
					                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
					                                       f32_3 %363 = OpLoad %286 
					                                       f32_3 %364 = OpVectorShuffle %363 %363 0 0 0 
					                                       f32_3 %365 = OpFMul %362 %364 
					                                       f32_4 %366 = OpLoad %187 
					                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
					                                                      OpStore %187 %367 
					                                Private f32* %369 = OpAccessChain %302 %368 
					                                         f32 %370 = OpLoad %369 
					                                Private f32* %371 = OpAccessChain %297 %368 
					                                                      OpStore %371 %370 
					                                       f32_4 %373 = OpLoad %178 
					                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
					                                       f32_3 %375 = OpLoad %154 
					                                       f32_3 %376 = OpFDiv %374 %375 
					                                                      OpStore %372 %376 
					                                Private f32* %378 = OpAccessChain %372 %88 
					                                         f32 %379 = OpLoad %378 
					                                         f32 %380 = OpExtInst %1 4 %379 
					                                Private f32* %381 = OpAccessChain %372 %18 
					                                         f32 %382 = OpLoad %381 
					                                         f32 %383 = OpExtInst %1 4 %382 
					                                         f32 %384 = OpExtInst %1 40 %380 %383 
					                                                      OpStore %377 %384 
					                                         f32 %385 = OpLoad %377 
					                                Private f32* %386 = OpAccessChain %372 %94 
					                                         f32 %387 = OpLoad %386 
					                                         f32 %388 = OpExtInst %1 4 %387 
					                                         f32 %389 = OpExtInst %1 40 %385 %388 
					                                Private f32* %390 = OpAccessChain %372 %94 
					                                                      OpStore %390 %389 
					                                Private f32* %391 = OpAccessChain %178 %368 
					                                                      OpStore %391 %22 
					                                       f32_4 %393 = OpLoad %178 
					                                       f32_3 %394 = OpLoad %372 
					                                       f32_4 %395 = OpVectorShuffle %394 %394 0 0 0 0 
					                                       f32_4 %396 = OpFDiv %393 %395 
					                                                      OpStore %392 %396 
					                                Private f32* %398 = OpAccessChain %372 %94 
					                                         f32 %399 = OpLoad %398 
					                                        bool %400 = OpFOrdLessThan %30 %399 
					                                                      OpStore %397 %400 
					                                       f32_4 %401 = OpLoad %297 
					                                       f32_4 %402 = OpLoad %392 
					                                       f32_4 %403 = OpFAdd %401 %402 
					                                                      OpStore %392 %403 
					                                Private f32* %404 = OpAccessChain %297 %368 
					                                         f32 %405 = OpLoad %404 
					                                Private f32* %406 = OpAccessChain %187 %368 
					                                                      OpStore %406 %405 
					                                        bool %407 = OpLoad %397 
					                                       f32_4 %408 = OpLoad %392 
					                                       f32_4 %409 = OpLoad %187 
					                                      bool_4 %411 = OpCompositeConstruct %407 %407 %407 %407 
					                                       f32_4 %412 = OpSelect %411 %408 %409 
					                                                      OpStore %297 %412 
					                                Uniform f32* %413 = OpAccessChain %14 %16 %88 
					                                         f32 %414 = OpLoad %413 
					                                         f32 %415 = OpFNegate %414 
					                                         f32 %417 = OpFMul %415 %416 
					                                         f32 %418 = OpLoad %268 
					                                         f32 %419 = OpFAdd %417 %418 
					                                Private f32* %420 = OpAccessChain %372 %94 
					                                                      OpStore %420 %419 
					                                         f32 %421 = OpLoad %268 
					                                Uniform f32* %423 = OpAccessChain %14 %422 %88 
					                                         f32 %424 = OpLoad %423 
					                                         f32 %425 = OpFMul %421 %424 
					                                                      OpStore %377 %425 
					                                Uniform f32* %427 = OpAccessChain %14 %16 %88 
					                                         f32 %428 = OpLoad %427 
					                                         f32 %430 = OpFMul %428 %429 
					                                                      OpStore %426 %430 
					                                         f32 %431 = OpLoad %426 
					                                         f32 %432 = OpFDiv %30 %431 
					                                                      OpStore %426 %432 
					                                         f32 %433 = OpLoad %426 
					                                Private f32* %434 = OpAccessChain %372 %94 
					                                         f32 %435 = OpLoad %434 
					                                         f32 %436 = OpFMul %433 %435 
					                                Private f32* %437 = OpAccessChain %372 %94 
					                                                      OpStore %437 %436 
					                                Private f32* %438 = OpAccessChain %372 %94 
					                                         f32 %439 = OpLoad %438 
					                                         f32 %440 = OpExtInst %1 43 %439 %22 %30 
					                                Private f32* %441 = OpAccessChain %372 %94 
					                                                      OpStore %441 %440 
					                                Private f32* %442 = OpAccessChain %372 %94 
					                                         f32 %443 = OpLoad %442 
					                                         f32 %445 = OpFMul %443 %444 
					                                         f32 %447 = OpFAdd %445 %446 
					                                                      OpStore %426 %447 
					                                Private f32* %448 = OpAccessChain %372 %94 
					                                         f32 %449 = OpLoad %448 
					                                Private f32* %450 = OpAccessChain %372 %94 
					                                         f32 %451 = OpLoad %450 
					                                         f32 %452 = OpFMul %449 %451 
					                                Private f32* %453 = OpAccessChain %372 %94 
					                                                      OpStore %453 %452 
					                                Private f32* %454 = OpAccessChain %372 %94 
					                                         f32 %455 = OpLoad %454 
					                                         f32 %456 = OpLoad %426 
					                                         f32 %457 = OpFMul %455 %456 
					                                Private f32* %458 = OpAccessChain %372 %94 
					                                                      OpStore %458 %457 
					                                Private f32* %459 = OpAccessChain %372 %94 
					                                         f32 %460 = OpLoad %459 
					                                         f32 %461 = OpExtInst %1 37 %460 %30 
					                                Private f32* %462 = OpAccessChain %35 %368 
					                                                      OpStore %462 %461 
					                                       f32_4 %463 = OpLoad %35 
					                                       f32_4 %464 = OpFNegate %463 
					                                       f32_4 %465 = OpLoad %297 
					                                       f32_4 %466 = OpFAdd %464 %465 
					                                                      OpStore %297 %466 
					                                Uniform f32* %467 = OpAccessChain %14 %422 %94 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %469 = OpFNegate %468 
					                                Uniform f32* %470 = OpAccessChain %14 %422 %18 
					                                         f32 %471 = OpLoad %470 
					                                         f32 %472 = OpFAdd %469 %471 
					                                Private f32* %473 = OpAccessChain %372 %94 
					                                                      OpStore %473 %472 
					                                         f32 %474 = OpLoad %377 
					                                Private f32* %475 = OpAccessChain %372 %94 
					                                         f32 %476 = OpLoad %475 
					                                         f32 %477 = OpFMul %474 %476 
					                                Uniform f32* %478 = OpAccessChain %14 %422 %94 
					                                         f32 %479 = OpLoad %478 
					                                         f32 %480 = OpFAdd %477 %479 
					                                Private f32* %481 = OpAccessChain %372 %94 
					                                                      OpStore %481 %480 
					                                Private f32* %482 = OpAccessChain %372 %94 
					                                         f32 %483 = OpLoad %482 
					                                Uniform f32* %484 = OpAccessChain %14 %422 %18 
					                                         f32 %485 = OpLoad %484 
					                                         f32 %486 = OpExtInst %1 40 %483 %485 
					                                Private f32* %487 = OpAccessChain %372 %94 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %372 %94 
					                                         f32 %489 = OpLoad %488 
					                                Uniform f32* %490 = OpAccessChain %14 %422 %94 
					                                         f32 %491 = OpLoad %490 
					                                         f32 %492 = OpExtInst %1 37 %489 %491 
					                                Private f32* %493 = OpAccessChain %372 %94 
					                                                      OpStore %493 %492 
					                                       f32_3 %494 = OpLoad %372 
					                                       f32_4 %495 = OpVectorShuffle %494 %494 0 0 0 0 
					                                       f32_4 %496 = OpLoad %297 
					                                       f32_4 %497 = OpFMul %495 %496 
					                                       f32_4 %498 = OpLoad %35 
					                                       f32_4 %499 = OpFAdd %497 %498 
					                                                      OpStore %35 %499 
					                                Private f32* %500 = OpAccessChain %35 %88 
					                                         f32 %501 = OpLoad %500 
					                                Private f32* %502 = OpAccessChain %35 %18 
					                                         f32 %503 = OpLoad %502 
					                                         f32 %504 = OpExtInst %1 40 %501 %503 
					                                                      OpStore %335 %504 
					                                Private f32* %505 = OpAccessChain %35 %94 
					                                         f32 %506 = OpLoad %505 
					                                         f32 %507 = OpLoad %335 
					                                         f32 %508 = OpExtInst %1 40 %506 %507 
					                                                      OpStore %335 %508 
					                                         f32 %509 = OpLoad %335 
					                                         f32 %510 = OpFNegate %509 
					                                         f32 %511 = OpFAdd %510 %30 
					                                                      OpStore %335 %511 
					                                         f32 %512 = OpLoad %335 
					                                         f32 %513 = OpFDiv %30 %512 
					                                Private f32* %514 = OpAccessChain %154 %94 
					                                                      OpStore %514 %513 
					                                       f32_4 %515 = OpLoad %35 
					                                       f32_3 %516 = OpVectorShuffle %515 %515 0 1 2 
					                                       f32_3 %517 = OpLoad %154 
					                                       f32_3 %518 = OpVectorShuffle %517 %517 0 0 0 
					                                       f32_3 %519 = OpFMul %516 %518 
					                                       f32_4 %520 = OpLoad %35 
					                                       f32_4 %521 = OpVectorShuffle %520 %519 4 5 6 3 
					                                                      OpStore %35 %521 
					                                       f32_4 %524 = OpLoad %35 
					                                       f32_3 %525 = OpVectorShuffle %524 %524 0 1 2 
					                                       f32_4 %526 = OpLoad %523 
					                                       f32_4 %527 = OpVectorShuffle %526 %525 4 5 6 3 
					                                                      OpStore %523 %527 
					                                       f32_4 %529 = OpLoad %35 
					                                                      OpStore %528 %529 
					                                Private f32* %530 = OpAccessChain %35 %368 
					                                         f32 %531 = OpLoad %530 
					                                         f32 %533 = OpFMul %531 %532 
					                                 Output f32* %535 = OpAccessChain %523 %368 
					                                                      OpStore %535 %533 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[3];
						vec2 _Jitter;
						vec4 _SharpenParameters;
						vec4 _FinalBlendParameters;
					};
					layout(location = 1) uniform  sampler2D _CameraMotionVectorsTexture;
					layout(location = 2) uniform  sampler2D _MainTex;
					layout(location = 3) uniform  sampler2D _HistoryTex;
					layout(location = 0) in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec3 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec3 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec2 u_xlat12;
					float u_xlat16_12;
					vec2 u_xlat14;
					float u_xlat18;
					float u_xlat16_18;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat6.xy = _Jitter.xy * vec2(1.0, -1.0);
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat6.xy : _Jitter.xy;
					    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat12.xy = (-_MainTex_TexelSize.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_1.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat16_12 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_12 = max(u_xlat16_12, u_xlat10_1.x);
					    u_xlat16_12 = u_xlat16_12 + 1.0;
					    u_xlat16_12 = float(1.0) / u_xlat16_12;
					    u_xlat16_2.xyz = vec3(u_xlat16_12) * u_xlat10_1.xyz;
					    u_xlat12.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_3.xyz = texture(_MainTex, u_xlat0.xy).xyz;
					    u_xlat10_0.xyz = texture(_MainTex, u_xlat12.xy).xyz;
					    u_xlat16_18 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_18 = max(u_xlat16_18, u_xlat10_0.x);
					    u_xlat16_18 = u_xlat16_18 + 1.0;
					    u_xlat16_18 = float(1.0) / u_xlat16_18;
					    u_xlat16_4.xyz = vec3(u_xlat16_18) * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_1.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
					    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_4.xyz);
					    u_xlat16_4.xyz = (-u_xlat16_0.xyz) * vec3(0.166666999, 0.166666999, 0.166666999) + u_xlat10_3.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * _SharpenParameters.xxx;
					    u_xlat3.xyz = u_xlat4.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_3.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat16_0.xyz + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.142857, 0.142857, 0.142857);
					    u_xlat18 = max(u_xlat0.z, u_xlat0.y);
					    u_xlat18 = max(u_xlat18, u_xlat0.x);
					    u_xlat18 = u_xlat18 + 1.0;
					    u_xlat18 = float(1.0) / u_xlat18;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat6.x = max(u_xlat3.z, u_xlat3.y);
					    u_xlat6.x = max(u_xlat6.x, u_xlat3.x);
					    u_xlat6.x = u_xlat6.x + 1.0;
					    u_xlat6.x = float(1.0) / u_xlat6.x;
					    u_xlat3.xyz = u_xlat6.xxx * u_xlat3.xyz;
					    u_xlat6.x = dot(u_xlat3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
					    u_xlat6.xyz = -abs(u_xlat0.xxx) * vec3(4.0, 4.0, 4.0) + u_xlat16_1.xyz;
					    u_xlat1.xyz = abs(u_xlat0.xxx) * vec3(4.0, 4.0, 4.0) + u_xlat16_2.xyz;
					    u_xlat2.xyz = u_xlat6.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = (-u_xlat6.xyz) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat10_2.xy = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.zw).xy;
					    u_xlat14.xy = (-u_xlat10_2.xy) + vs_TEXCOORD0.zw;
					    u_xlat16_18 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlat16_18 = sqrt(u_xlat16_18);
					    u_xlat10_2 = texture(_HistoryTex, u_xlat14.xy);
					    u_xlat16_4.x = max(u_xlat10_2.z, u_xlat10_2.y);
					    u_xlat16_4.x = max(u_xlat10_2.x, u_xlat16_4.x);
					    u_xlat16_4.x = u_xlat16_4.x + 1.0;
					    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
					    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat16_4.xxx + (-u_xlat1.xyz);
					    u_xlat4.xyz = u_xlat10_2.xyz * u_xlat16_4.xxx;
					    u_xlat1.w = u_xlat10_2.w;
					    u_xlat0.xyz = u_xlat5.xyz / u_xlat0.xyz;
					    u_xlat6.x = max(abs(u_xlat0.z), abs(u_xlat0.y));
					    u_xlat0.x = max(u_xlat6.x, abs(u_xlat0.x));
					    u_xlat5.w = 0.0;
					    u_xlat2 = u_xlat5 / u_xlat0.xxxx;
					    u_xlatb0 = 1.0<u_xlat0.x;
					    u_xlat2 = u_xlat1 + u_xlat2;
					    u_xlat4.w = u_xlat1.w;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat4;
					    u_xlat0.x = (-_MainTex_TexelSize.z) * 0.00200000009 + u_xlat16_18;
					    u_xlat6.x = u_xlat16_18 * _FinalBlendParameters.z;
					    u_xlat12.x = _MainTex_TexelSize.z * 0.00150000001;
					    u_xlat12.x = float(1.0) / u_xlat12.x;
					    u_xlat0.x = u_xlat12.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat12.x;
					    u_xlat3.w = min(u_xlat0.x, 1.0);
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat0.x = (-_FinalBlendParameters.x) + _FinalBlendParameters.y;
					    u_xlat0.x = u_xlat6.x * u_xlat0.x + _FinalBlendParameters.x;
					    u_xlat0.x = max(u_xlat0.x, _FinalBlendParameters.y);
					    u_xlat0.x = min(u_xlat0.x, _FinalBlendParameters.x);
					    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat3;
					    u_xlat1.x = max(u_xlat0.z, u_xlat0.y);
					    u_xlat1.x = max(u_xlat0.x, u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    SV_Target1.xyz = u_xlat0.xyz;
					    SV_Target0 = u_xlat0;
					    SV_Target1.w = u_xlat0.w * 0.850000024;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 134120
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[5];
					};
					layout(binding = 1, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 38
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %28 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate %9 RelaxedPrecision 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate %13 RelaxedPrecision 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %17 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 22 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %28 Location 28 
					                                             OpDecorate %29 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                     %14 = OpTypeSampler 
					                                     %15 = OpTypePointer UniformConstant %14 
					            UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                     %18 = OpTypeSampledImage %10 
					                                     %20 = OpTypeVector %6 2 
					                                     %21 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %24 = OpTypeVector %6 4 
					                                     %27 = OpTypePointer Output %24 
					                       Output f32_4* %28 = OpVariable Output 
					                                 f32 %32 = OpConstant 3,674022E-40 
					                                     %33 = OpTypeInt 32 0 
					                                 u32 %34 = OpConstant 3 
					                                     %35 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD0 
					                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                             OpStore %9 %26 
					                               f32_3 %29 = OpLoad %9 
					                               f32_4 %30 = OpLoad %28 
					                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
					                                             OpStore %28 %31 
					                         Output f32* %36 = OpAccessChain %28 %34 
					                                             OpStore %36 %32 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(location = 0) uniform  sampler2D _MainTex;
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat10_0;
					void main()
					{
					    u_xlat10_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
			}
		}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 214828
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    vs_TEXCOORD0.y = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    vs_TEXCOORD0.xzw = in_TEXCOORD0.xxy;
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
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _CameraDepthTexture_TexelSize;
					uniform 	vec2 _Jitter;
					uniform 	vec4 _SharpenParameters;
					uniform 	vec4 _FinalBlendParameters;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _CameraMotionVectorsTexture;
					UNITY_LOCATION(2) uniform  sampler2D _MainTex;
					UNITY_LOCATION(3) uniform  sampler2D _HistoryTex;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_6;
					float u_xlat8;
					vec2 u_xlat14;
					float u_xlat15;
					vec2 u_xlat17;
					float u_xlat21;
					float u_xlat22;
					float u_xlat16_22;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + (-_Jitter.xy);
					    u_xlat14.xy = (-_MainTex_TexelSize.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat14.xy);
					    u_xlat14.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_4.xyz = u_xlat10_2.xyz + u_xlat10_2.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_4.xyz);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vec3(0.166666999, 0.166666999, 0.166666999) + u_xlat10_2.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * _SharpenParameters.xxx;
					    u_xlat2.xyz = u_xlat4.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_2.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = u_xlat2.xyz + u_xlat16_3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(0.142857, 0.142857, 0.142857);
					    u_xlat21 = max(u_xlat3.z, u_xlat3.y);
					    u_xlat21 = max(u_xlat21, u_xlat3.x);
					    u_xlat21 = u_xlat21 + 1.0;
					    u_xlat21 = float(1.0) / u_xlat21;
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
					    u_xlat21 = dot(u_xlat3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat22 = max(u_xlat2.z, u_xlat2.y);
					    u_xlat22 = max(u_xlat22, u_xlat2.x);
					    u_xlat22 = u_xlat22 + 1.0;
					    u_xlat22 = float(1.0) / u_xlat22;
					    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
					    u_xlat22 = dot(u_xlat2.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat21 = u_xlat21 + (-u_xlat22);
					    u_xlat16_22 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_22 = max(u_xlat16_22, u_xlat10_1.x);
					    u_xlat16_22 = u_xlat16_22 + 1.0;
					    u_xlat16_22 = float(1.0) / u_xlat16_22;
					    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat10_1.xyz;
					    u_xlat16_22 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_22 = max(u_xlat10_0.x, u_xlat16_22);
					    u_xlat16_22 = u_xlat16_22 + 1.0;
					    u_xlat16_22 = float(1.0) / u_xlat16_22;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(u_xlat16_22);
					    u_xlat16_3.xyz = min(u_xlat16_1.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat0.xyz = abs(vec3(u_xlat21)) * vec3(4.0, 4.0, 4.0) + u_xlat16_0.xyz;
					    u_xlat1.xyz = -abs(vec3(u_xlat21)) * vec3(4.0, 4.0, 4.0) + u_xlat16_3.xyz;
					    u_xlat3.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat3.xy = vs_TEXCOORD0.zw + (-_CameraDepthTexture_TexelSize.xy);
					    u_xlat3 = texture(_CameraDepthTexture, u_xlat3.xy).yzxw;
					    u_xlat4 = texture(_CameraDepthTexture, vs_TEXCOORD0.zw).yzxw;
					    u_xlatb22 = u_xlat4.z>=u_xlat3.z;
					    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
					    u_xlat3.x = float(-1.0);
					    u_xlat3.y = float(-1.0);
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat4.yyz);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat4.x = float(1.0);
					    u_xlat4.y = float(-1.0);
					    u_xlat5 = _CameraDepthTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.zwzw;
					    u_xlat10_6 = texture(_CameraDepthTexture, u_xlat5.xy);
					    u_xlat5 = texture(_CameraDepthTexture, u_xlat5.zw).yzxw;
					    u_xlat4.z = u_xlat10_6.x;
					    u_xlatb22 = u_xlat3.z>=u_xlat10_6.x;
					    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
					    u_xlat4.xyz = (-u_xlat3.yyz) + u_xlat4.xyz;
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat3.xyz;
					    u_xlat5.x = float(-1.0);
					    u_xlat5.y = float(1.0);
					    u_xlat5.w = float(0.0);
					    u_xlatb22 = u_xlat3.z>=u_xlat5.z;
					    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
					    u_xlat4.xyz = (-u_xlat3.xyz) + u_xlat5.xyz;
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat3.xyz;
					    u_xlat4.xy = vs_TEXCOORD0.zw + _CameraDepthTexture_TexelSize.xy;
					    u_xlat10_4 = texture(_CameraDepthTexture, u_xlat4.xy);
					    u_xlatb22 = u_xlat3.z>=u_xlat10_4.x;
					    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
					    u_xlat17.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
					    u_xlat3.xy = vec2(u_xlat22) * u_xlat17.xy + u_xlat3.xy;
					    u_xlat3.xy = u_xlat3.xy * _CameraDepthTexture_TexelSize.xy + vs_TEXCOORD0.zw;
					    u_xlat10_3 = texture(_CameraMotionVectorsTexture, u_xlat3.xy);
					    u_xlat17.xy = (-u_xlat10_3.xy) + vs_TEXCOORD0.zw;
					    u_xlat16_22 = dot(u_xlat10_3.xy, u_xlat10_3.xy);
					    u_xlat16_22 = sqrt(u_xlat16_22);
					    u_xlat10_3 = texture(_HistoryTex, u_xlat17.xy);
					    u_xlat16_4.x = max(u_xlat10_3.z, u_xlat10_3.y);
					    u_xlat16_4.x = max(u_xlat10_3.x, u_xlat16_4.x);
					    u_xlat16_4.x = u_xlat16_4.x + 1.0;
					    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
					    u_xlat5.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx + (-u_xlat0.xyz);
					    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx;
					    u_xlat0.w = u_xlat10_3.w;
					    u_xlat1.xyz = u_xlat5.xyz / u_xlat1.xyz;
					    u_xlat8 = max(abs(u_xlat1.z), abs(u_xlat1.y));
					    u_xlat1.x = max(u_xlat8, abs(u_xlat1.x));
					    u_xlat3 = u_xlat5 / u_xlat1.xxxx;
					    u_xlatb1 = 1.0<u_xlat1.x;
					    u_xlat3 = u_xlat0 + u_xlat3;
					    u_xlat4.w = u_xlat0.w;
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat3 : u_xlat4;
					    u_xlat1.x = (-_MainTex_TexelSize.z) * 0.00200000009 + u_xlat16_22;
					    u_xlat8 = u_xlat16_22 * _FinalBlendParameters.z;
					    u_xlat15 = _MainTex_TexelSize.z * 0.00150000001;
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat1.x = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat15 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat15;
					    u_xlat2.w = min(u_xlat1.x, 1.0);
					    u_xlat0 = u_xlat0 + (-u_xlat2);
					    u_xlat1.x = (-_FinalBlendParameters.x) + _FinalBlendParameters.y;
					    u_xlat1.x = u_xlat8 * u_xlat1.x + _FinalBlendParameters.x;
					    u_xlat1.x = max(u_xlat1.x, _FinalBlendParameters.y);
					    u_xlat1.x = min(u_xlat1.x, _FinalBlendParameters.x);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat2;
					    u_xlat1.x = max(u_xlat0.z, u_xlat0.y);
					    u_xlat1.x = max(u_xlat0.x, u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    SV_Target1.xyz = u_xlat0.xyz;
					    SV_Target0 = u_xlat0;
					    SV_Target1.w = u_xlat0.w * 0.850000024;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 122
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %99 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate vs_TEXCOORD0 Location 99 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                                            %101 = OpTypePointer Function %6 
					                                            %110 = OpTypePointer Output %6 
					                                            %112 = OpTypeVector %6 3 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %102 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                       bool %100 = OpLoad %84 
					                                                     OpSelectionMerge %104 None 
					                                                     OpBranchConditional %100 %103 %106 
					                                            %103 = OpLabel 
					                                        f32 %105 = OpLoad %91 
					                                                     OpStore %102 %105 
					                                                     OpBranch %104 
					                                            %106 = OpLabel 
					                                 Input f32* %107 = OpAccessChain %92 %68 
					                                        f32 %108 = OpLoad %107 
					                                                     OpStore %102 %108 
					                                                     OpBranch %104 
					                                            %104 = OpLabel 
					                                        f32 %109 = OpLoad %102 
					                                Output f32* %111 = OpAccessChain vs_TEXCOORD0 %68 
					                                                     OpStore %111 %109 
					                                      f32_4 %113 = OpLoad %92 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 0 1 
					                                      f32_4 %115 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %116 = OpVectorShuffle %115 %114 4 1 5 6 
					                                                     OpStore vs_TEXCOORD0 %116 
					                                Output f32* %117 = OpAccessChain %72 %22 %68 
					                                        f32 %118 = OpLoad %117 
					                                        f32 %119 = OpFNegate %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                                     OpStore %120 %119 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 721
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %52 %707 %712 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpMemberDecorate %12 4 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 52 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %75 DescriptorSet 75 
					                                                      OpDecorate %75 Binding 75 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %79 DescriptorSet 79 
					                                                      OpDecorate %79 Binding 79 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %312 DescriptorSet 312 
					                                                      OpDecorate %312 Binding 312 
					                                                      OpDecorate %314 DescriptorSet 314 
					                                                      OpDecorate %314 Binding 314 
					                                                      OpDecorate %487 RelaxedPrecision 
					                                                      OpDecorate %487 DescriptorSet 487 
					                                                      OpDecorate %487 Binding 487 
					                                                      OpDecorate %488 RelaxedPrecision 
					                                                      OpDecorate %489 RelaxedPrecision 
					                                                      OpDecorate %489 DescriptorSet 489 
					                                                      OpDecorate %489 Binding 489 
					                                                      OpDecorate %490 RelaxedPrecision 
					                                                      OpDecorate %495 RelaxedPrecision 
					                                                      OpDecorate %498 RelaxedPrecision 
					                                                      OpDecorate %499 RelaxedPrecision 
					                                                      OpDecorate %500 RelaxedPrecision 
					                                                      OpDecorate %504 RelaxedPrecision 
					                                                      OpDecorate %505 RelaxedPrecision 
					                                                      OpDecorate %506 RelaxedPrecision 
					                                                      OpDecorate %507 RelaxedPrecision 
					                                                      OpDecorate %508 RelaxedPrecision 
					                                                      OpDecorate %509 RelaxedPrecision 
					                                                      OpDecorate %510 RelaxedPrecision 
					                                                      OpDecorate %511 RelaxedPrecision 
					                                                      OpDecorate %512 RelaxedPrecision 
					                                                      OpDecorate %513 RelaxedPrecision 
					                                                      OpDecorate %513 DescriptorSet 513 
					                                                      OpDecorate %513 Binding 513 
					                                                      OpDecorate %514 RelaxedPrecision 
					                                                      OpDecorate %515 RelaxedPrecision 
					                                                      OpDecorate %515 DescriptorSet 515 
					                                                      OpDecorate %515 Binding 515 
					                                                      OpDecorate %516 RelaxedPrecision 
					                                                      OpDecorate %520 RelaxedPrecision 
					                                                      OpDecorate %522 RelaxedPrecision 
					                                                      OpDecorate %524 RelaxedPrecision 
					                                                      OpDecorate %525 RelaxedPrecision 
					                                                      OpDecorate %527 RelaxedPrecision 
					                                                      OpDecorate %528 RelaxedPrecision 
					                                                      OpDecorate %529 RelaxedPrecision 
					                                                      OpDecorate %530 RelaxedPrecision 
					                                                      OpDecorate %531 RelaxedPrecision 
					                                                      OpDecorate %532 RelaxedPrecision 
					                                                      OpDecorate %533 RelaxedPrecision 
					                                                      OpDecorate %535 RelaxedPrecision 
					                                                      OpDecorate %536 RelaxedPrecision 
					                                                      OpDecorate %537 RelaxedPrecision 
					                                                      OpDecorate %538 RelaxedPrecision 
					                                                      OpDecorate %539 RelaxedPrecision 
					                                                      OpDecorate %546 RelaxedPrecision 
					                                                      OpDecorate %547 RelaxedPrecision 
					                                                      OpDecorate %548 RelaxedPrecision 
					                                                      OpDecorate %549 RelaxedPrecision 
					                                                      OpDecorate %550 RelaxedPrecision 
					                                                      OpDecorate %555 RelaxedPrecision 
					                                                      OpDecorate %560 RelaxedPrecision 
					                                                      OpDecorate %602 RelaxedPrecision 
					                                                      OpDecorate %605 RelaxedPrecision 
					                                                      OpDecorate %691 RelaxedPrecision 
					                                                      OpDecorate %693 RelaxedPrecision 
					                                                      OpDecorate %694 RelaxedPrecision 
					                                                      OpDecorate %695 RelaxedPrecision 
					                                                      OpDecorate %696 RelaxedPrecision 
					                                                      OpDecorate %697 RelaxedPrecision 
					                                                      OpDecorate %701 RelaxedPrecision 
					                                                      OpDecorate %702 RelaxedPrecision 
					                                                      OpDecorate %707 Location 707 
					                                                      OpDecorate %712 Location 712 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 4 
					                                              %11 = OpTypeVector %9 2 
					                                              %12 = OpTypeStruct %10 %10 %11 %10 %10 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32_4; f32_4; f32_2; f32_4; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 0 
					                                              %17 = OpTypeInt 32 0 
					                                          u32 %18 = OpConstant 1 
					                                              %19 = OpTypePointer Uniform %9 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                              %24 = OpTypePointer Private %11 
					                               Private f32_2* %25 = OpVariable Private 
					                                          i32 %26 = OpConstant 2 
					                                              %27 = OpTypePointer Uniform %11 
					                                          f32 %30 = OpConstant 3,674022E-40 
					                                          f32 %31 = OpConstant 3,674022E-40 
					                                        f32_2 %32 = OpConstantComposite %30 %31 
					                                              %34 = OpTypePointer Private %10 
					                               Private f32_4* %35 = OpVariable Private 
					                                              %37 = OpTypePointer Function %11 
					                                              %51 = OpTypePointer Input %10 
					                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                               Private f32_2* %58 = OpVariable Private 
					                                              %59 = OpTypePointer Uniform %10 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                        f32_2 %65 = OpConstantComposite %64 %64 
					                                              %70 = OpTypeVector %9 3 
					                                              %71 = OpTypePointer Private %70 
					                               Private f32_3* %72 = OpVariable Private 
					                                              %73 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                              %74 = OpTypePointer UniformConstant %73 
					         UniformConstant read_only Texture2D* %75 = OpVariable UniformConstant 
					                                              %77 = OpTypeSampler 
					                                              %78 = OpTypePointer UniformConstant %77 
					                     UniformConstant sampler* %79 = OpVariable UniformConstant 
					                                              %81 = OpTypeSampledImage %73 
					                                              %86 = OpTypePointer Private %9 
					                                 Private f32* %87 = OpVariable Private 
					                                          u32 %88 = OpConstant 2 
					                                          u32 %94 = OpConstant 0 
					                                Private f32* %101 = OpVariable Private 
					                              Private f32_3* %104 = OpVariable Private 
					                              Private f32_3* %116 = OpVariable Private 
					                              Private f32_3* %124 = OpVariable Private 
					                                Private f32* %142 = OpVariable Private 
					                              Private f32_3* %145 = OpVariable Private 
					                              Private f32_3* %150 = OpVariable Private 
					                              Private f32_3* %154 = OpVariable Private 
					                                         f32 %165 = OpConstant 3,674022E-40 
					                                       f32_3 %166 = OpConstantComposite %165 %165 %165 
					                                         f32 %173 = OpConstant 3,674022E-40 
					                                       f32_3 %174 = OpConstantComposite %173 %173 %173 
					                              Private f32_4* %178 = OpVariable Private 
					                                         i32 %180 = OpConstant 3 
					                              Private f32_4* %187 = OpVariable Private 
					                                         f32 %190 = OpConstant 3,674022E-40 
					                                       f32_3 %191 = OpConstantComposite %190 %190 %190 
					                                       f32_3 %199 = OpConstantComposite %22 %22 %22 
					                                         f32 %211 = OpConstant 3,674022E-40 
					                                       f32_3 %212 = OpConstantComposite %211 %211 %211 
					                                         f32 %238 = OpConstant 3,674022E-40 
					                                         f32 %239 = OpConstant 3,674022E-40 
					                                         f32 %240 = OpConstant 3,674022E-40 
					                                       f32_3 %241 = OpConstantComposite %238 %239 %240 
					                                Private f32* %243 = OpVariable Private 
					                                Private f32* %268 = OpVariable Private 
					                              Private f32_3* %286 = OpVariable Private 
					                              Private f32_4* %294 = OpVariable Private 
					                                       f32_3 %296 = OpConstantComposite %64 %64 %64 
					                                         i32 %304 = OpConstant 1 
					        UniformConstant read_only Texture2D* %312 = OpVariable UniformConstant 
					                    UniformConstant sampler* %314 = OpVariable UniformConstant 
					                               Private bool* %330 = OpVariable Private 
					                                Private f32* %336 = OpVariable Private 
					                              Private f32_4* %363 = OpVariable Private 
					                                       f32_4 %367 = OpConstantComposite %30 %31 %31 %30 
					                              Private f32_3* %380 = OpVariable Private 
					                              Private f32_2* %461 = OpVariable Private 
					                                       f32_2 %465 = OpConstantComposite %30 %30 
					        UniformConstant read_only Texture2D* %487 = OpVariable UniformConstant 
					                    UniformConstant sampler* %489 = OpVariable UniformConstant 
					                                Private f32* %504 = OpVariable Private 
					                              Private f32_4* %512 = OpVariable Private 
					        UniformConstant read_only Texture2D* %513 = OpVariable UniformConstant 
					                    UniformConstant sampler* %515 = OpVariable UniformConstant 
					                                Private f32* %520 = OpVariable Private 
					                                         u32 %553 = OpConstant 3 
					                              Private f32_3* %557 = OpVariable Private 
					                                Private f32* %562 = OpVariable Private 
					                               Private bool* %581 = OpVariable Private 
					                                             %594 = OpTypeVector %6 4 
					                                         f32 %600 = OpConstant 3,674022E-40 
					                                         i32 %606 = OpConstant 4 
					                                Private f32* %610 = OpVariable Private 
					                                         f32 %613 = OpConstant 3,674022E-40 
					                                         f32 %628 = OpConstant 3,674022E-40 
					                                         f32 %630 = OpConstant 3,674022E-40 
					                                             %706 = OpTypePointer Output %10 
					                               Output f32_4* %707 = OpVariable Output 
					                               Output f32_4* %712 = OpVariable Output 
					                                         f32 %716 = OpConstant 3,674022E-40 
					                                             %718 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                              Function f32_2* %38 = OpVariable Function 
					                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
					                                          f32 %21 = OpLoad %20 
					                                         bool %23 = OpFOrdLessThan %21 %22 
					                                                      OpStore %8 %23 
					                               Uniform f32_2* %28 = OpAccessChain %14 %26 
					                                        f32_2 %29 = OpLoad %28 
					                                        f32_2 %33 = OpFMul %29 %32 
					                                                      OpStore %25 %33 
					                                         bool %36 = OpLoad %8 
					                                                      OpSelectionMerge %40 None 
					                                                      OpBranchConditional %36 %39 %42 
					                                              %39 = OpLabel 
					                                        f32_2 %41 = OpLoad %25 
					                                                      OpStore %38 %41 
					                                                      OpBranch %40 
					                                              %42 = OpLabel 
					                               Uniform f32_2* %43 = OpAccessChain %14 %26 
					                                        f32_2 %44 = OpLoad %43 
					                                                      OpStore %38 %44 
					                                                      OpBranch %40 
					                                              %40 = OpLabel 
					                                        f32_2 %45 = OpLoad %38 
					                                        f32_4 %46 = OpLoad %35 
					                                        f32_4 %47 = OpVectorShuffle %46 %45 4 5 2 3 
					                                                      OpStore %35 %47 
					                                        f32_4 %48 = OpLoad %35 
					                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                        f32_2 %50 = OpFNegate %49 
					                                        f32_4 %53 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
					                                        f32_2 %55 = OpFAdd %50 %54 
					                                        f32_4 %56 = OpLoad %35 
					                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
					                                                      OpStore %35 %57 
					                               Uniform f32_4* %60 = OpAccessChain %14 %16 
					                                        f32_4 %61 = OpLoad %60 
					                                        f32_2 %62 = OpVectorShuffle %61 %61 0 1 
					                                        f32_2 %63 = OpFNegate %62 
					                                        f32_2 %66 = OpFMul %63 %65 
					                                        f32_4 %67 = OpLoad %35 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                        f32_2 %69 = OpFAdd %66 %68 
					                                                      OpStore %58 %69 
					                          read_only Texture2D %76 = OpLoad %75 
					                                      sampler %80 = OpLoad %79 
					                   read_only Texture2DSampled %82 = OpSampledImage %76 %80 
					                                        f32_2 %83 = OpLoad %58 
					                                        f32_4 %84 = OpImageSampleImplicitLod %82 %83 
					                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                                      OpStore %72 %85 
					                                 Private f32* %89 = OpAccessChain %72 %88 
					                                          f32 %90 = OpLoad %89 
					                                 Private f32* %91 = OpAccessChain %72 %18 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpExtInst %1 40 %90 %92 
					                                                      OpStore %87 %93 
					                                 Private f32* %95 = OpAccessChain %72 %94 
					                                          f32 %96 = OpLoad %95 
					                                          f32 %97 = OpLoad %87 
					                                          f32 %98 = OpExtInst %1 40 %96 %97 
					                                                      OpStore %87 %98 
					                                          f32 %99 = OpLoad %87 
					                                         f32 %100 = OpFAdd %99 %30 
					                                                      OpStore %87 %100 
					                                         f32 %102 = OpLoad %87 
					                                         f32 %103 = OpFDiv %30 %102 
					                                                      OpStore %101 %103 
					                                         f32 %105 = OpLoad %101 
					                                       f32_3 %106 = OpCompositeConstruct %105 %105 %105 
					                                       f32_3 %107 = OpLoad %72 
					                                       f32_3 %108 = OpFMul %106 %107 
					                                                      OpStore %104 %108 
					                              Uniform f32_4* %109 = OpAccessChain %14 %16 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
					                                       f32_2 %112 = OpFMul %111 %65 
					                                       f32_4 %113 = OpLoad %35 
					                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
					                                       f32_2 %115 = OpFAdd %112 %114 
					                                                      OpStore %58 %115 
					                         read_only Texture2D %117 = OpLoad %75 
					                                     sampler %118 = OpLoad %79 
					                  read_only Texture2DSampled %119 = OpSampledImage %117 %118 
					                                       f32_4 %120 = OpLoad %35 
					                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                       f32_4 %122 = OpImageSampleImplicitLod %119 %121 
					                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
					                                                      OpStore %116 %123 
					                         read_only Texture2D %125 = OpLoad %75 
					                                     sampler %126 = OpLoad %79 
					                  read_only Texture2DSampled %127 = OpSampledImage %125 %126 
					                                       f32_2 %128 = OpLoad %58 
					                                       f32_4 %129 = OpImageSampleImplicitLod %127 %128 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
					                                                      OpStore %124 %130 
					                                Private f32* %131 = OpAccessChain %124 %88 
					                                         f32 %132 = OpLoad %131 
					                                Private f32* %133 = OpAccessChain %124 %18 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpExtInst %1 40 %132 %134 
					                                                      OpStore %87 %135 
					                                Private f32* %136 = OpAccessChain %124 %94 
					                                         f32 %137 = OpLoad %136 
					                                         f32 %138 = OpLoad %87 
					                                         f32 %139 = OpExtInst %1 40 %137 %138 
					                                                      OpStore %87 %139 
					                                         f32 %140 = OpLoad %87 
					                                         f32 %141 = OpFAdd %140 %30 
					                                                      OpStore %87 %141 
					                                         f32 %143 = OpLoad %87 
					                                         f32 %144 = OpFDiv %30 %143 
					                                                      OpStore %142 %144 
					                                         f32 %146 = OpLoad %142 
					                                       f32_3 %147 = OpCompositeConstruct %146 %146 %146 
					                                       f32_3 %148 = OpLoad %124 
					                                       f32_3 %149 = OpFMul %147 %148 
					                                                      OpStore %145 %149 
					                                       f32_3 %151 = OpLoad %124 
					                                       f32_3 %152 = OpLoad %72 
					                                       f32_3 %153 = OpFAdd %151 %152 
					                                                      OpStore %150 %153 
					                                       f32_3 %155 = OpLoad %104 
					                                       f32_3 %156 = OpLoad %145 
					                                       f32_3 %157 = OpExtInst %1 37 %155 %156 
					                                                      OpStore %154 %157 
					                                       f32_3 %158 = OpLoad %104 
					                                       f32_3 %159 = OpLoad %145 
					                                       f32_3 %160 = OpExtInst %1 40 %158 %159 
					                                                      OpStore %104 %160 
					                                       f32_3 %161 = OpLoad %116 
					                                       f32_3 %162 = OpLoad %116 
					                                       f32_3 %163 = OpFAdd %161 %162 
					                                                      OpStore %145 %163 
					                                       f32_3 %164 = OpLoad %150 
					                                       f32_3 %167 = OpFMul %164 %166 
					                                       f32_3 %168 = OpLoad %145 
					                                       f32_3 %169 = OpFNegate %168 
					                                       f32_3 %170 = OpFAdd %167 %169 
					                                                      OpStore %150 %170 
					                                       f32_3 %171 = OpLoad %150 
					                                       f32_3 %172 = OpFNegate %171 
					                                       f32_3 %175 = OpFMul %172 %174 
					                                       f32_3 %176 = OpLoad %116 
					                                       f32_3 %177 = OpFAdd %175 %176 
					                                                      OpStore %145 %177 
					                                       f32_3 %179 = OpLoad %145 
					                              Uniform f32_4* %181 = OpAccessChain %14 %180 
					                                       f32_4 %182 = OpLoad %181 
					                                       f32_3 %183 = OpVectorShuffle %182 %182 0 0 0 
					                                       f32_3 %184 = OpFMul %179 %183 
					                                       f32_4 %185 = OpLoad %178 
					                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
					                                                      OpStore %178 %186 
					                                       f32_4 %188 = OpLoad %178 
					                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
					                                       f32_3 %192 = OpFMul %189 %191 
					                                       f32_3 %193 = OpLoad %116 
					                                       f32_3 %194 = OpFAdd %192 %193 
					                                       f32_4 %195 = OpLoad %187 
					                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
					                                                      OpStore %187 %196 
					                                       f32_4 %197 = OpLoad %187 
					                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
					                                       f32_3 %200 = OpExtInst %1 40 %198 %199 
					                                       f32_4 %201 = OpLoad %187 
					                                       f32_4 %202 = OpVectorShuffle %201 %200 4 5 6 3 
					                                                      OpStore %187 %202 
					                                       f32_3 %203 = OpLoad %150 
					                                       f32_4 %204 = OpLoad %187 
					                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
					                                       f32_3 %206 = OpFAdd %203 %205 
					                                       f32_4 %207 = OpLoad %35 
					                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
					                                                      OpStore %35 %208 
					                                       f32_4 %209 = OpLoad %35 
					                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
					                                       f32_3 %213 = OpFMul %210 %212 
					                                       f32_4 %214 = OpLoad %35 
					                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
					                                                      OpStore %35 %215 
					                                Private f32* %216 = OpAccessChain %35 %88 
					                                         f32 %217 = OpLoad %216 
					                                Private f32* %218 = OpAccessChain %35 %18 
					                                         f32 %219 = OpLoad %218 
					                                         f32 %220 = OpExtInst %1 40 %217 %219 
					                                                      OpStore %87 %220 
					                                Private f32* %221 = OpAccessChain %35 %94 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpLoad %87 
					                                         f32 %224 = OpExtInst %1 40 %222 %223 
					                                                      OpStore %87 %224 
					                                         f32 %225 = OpLoad %87 
					                                         f32 %226 = OpFAdd %225 %30 
					                                                      OpStore %87 %226 
					                                         f32 %227 = OpLoad %87 
					                                         f32 %228 = OpFDiv %30 %227 
					                                                      OpStore %142 %228 
					                                         f32 %229 = OpLoad %142 
					                                       f32_3 %230 = OpCompositeConstruct %229 %229 %229 
					                                       f32_4 %231 = OpLoad %35 
					                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
					                                       f32_3 %233 = OpFMul %230 %232 
					                                       f32_4 %234 = OpLoad %35 
					                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
					                                                      OpStore %35 %235 
					                                       f32_4 %236 = OpLoad %35 
					                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
					                                         f32 %242 = OpDot %237 %241 
					                                                      OpStore %87 %242 
					                                Private f32* %244 = OpAccessChain %187 %88 
					                                         f32 %245 = OpLoad %244 
					                                Private f32* %246 = OpAccessChain %187 %18 
					                                         f32 %247 = OpLoad %246 
					                                         f32 %248 = OpExtInst %1 40 %245 %247 
					                                                      OpStore %243 %248 
					                                         f32 %249 = OpLoad %243 
					                                Private f32* %250 = OpAccessChain %187 %94 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpExtInst %1 40 %249 %251 
					                                                      OpStore %243 %252 
					                                         f32 %253 = OpLoad %243 
					                                         f32 %254 = OpFAdd %253 %30 
					                                                      OpStore %243 %254 
					                                         f32 %255 = OpLoad %243 
					                                         f32 %256 = OpFDiv %30 %255 
					                                Private f32* %257 = OpAccessChain %150 %94 
					                                                      OpStore %257 %256 
					                                       f32_3 %258 = OpLoad %150 
					                                       f32_3 %259 = OpVectorShuffle %258 %258 0 0 0 
					                                       f32_4 %260 = OpLoad %187 
					                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
					                                       f32_3 %262 = OpFMul %259 %261 
					                                       f32_4 %263 = OpLoad %35 
					                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
					                                                      OpStore %35 %264 
					                                       f32_4 %265 = OpLoad %35 
					                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
					                                         f32 %267 = OpDot %266 %241 
					                                                      OpStore %243 %267 
					                                         f32 %269 = OpLoad %243 
					                                         f32 %270 = OpFNegate %269 
					                                         f32 %271 = OpLoad %87 
					                                         f32 %272 = OpFAdd %270 %271 
					                                                      OpStore %268 %272 
					                                         f32 %273 = OpLoad %268 
					                                       f32_3 %274 = OpCompositeConstruct %273 %273 %273 
					                                       f32_3 %275 = OpExtInst %1 4 %274 
					                                       f32_3 %276 = OpFNegate %275 
					                                       f32_3 %277 = OpFMul %276 %166 
					                                       f32_3 %278 = OpLoad %154 
					                                       f32_3 %279 = OpFAdd %277 %278 
					                                                      OpStore %154 %279 
					                                         f32 %280 = OpLoad %268 
					                                       f32_3 %281 = OpCompositeConstruct %280 %280 %280 
					                                       f32_3 %282 = OpExtInst %1 4 %281 
					                                       f32_3 %283 = OpFMul %282 %166 
					                                       f32_3 %284 = OpLoad %104 
					                                       f32_3 %285 = OpFAdd %283 %284 
					                                                      OpStore %104 %285 
					                                       f32_3 %287 = OpLoad %154 
					                                       f32_3 %288 = OpFNegate %287 
					                                       f32_3 %289 = OpLoad %104 
					                                       f32_3 %290 = OpFAdd %288 %289 
					                                                      OpStore %286 %290 
					                                       f32_3 %291 = OpLoad %154 
					                                       f32_3 %292 = OpLoad %104 
					                                       f32_3 %293 = OpFAdd %291 %292 
					                                                      OpStore %154 %293 
					                                       f32_3 %295 = OpLoad %154 
					                                       f32_3 %297 = OpFMul %295 %296 
					                                       f32_4 %298 = OpLoad %294 
					                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
					                                                      OpStore %294 %299 
					                                       f32_3 %300 = OpLoad %286 
					                                       f32_3 %301 = OpFMul %300 %296 
					                                                      OpStore %104 %301 
					                                       f32_4 %302 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %303 = OpVectorShuffle %302 %302 2 3 
					                              Uniform f32_4* %305 = OpAccessChain %14 %304 
					                                       f32_4 %306 = OpLoad %305 
					                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
					                                       f32_2 %308 = OpFNegate %307 
					                                       f32_2 %309 = OpFAdd %303 %308 
					                                       f32_4 %310 = OpLoad %187 
					                                       f32_4 %311 = OpVectorShuffle %310 %309 4 5 2 3 
					                                                      OpStore %187 %311 
					                         read_only Texture2D %313 = OpLoad %312 
					                                     sampler %315 = OpLoad %314 
					                  read_only Texture2DSampled %316 = OpSampledImage %313 %315 
					                                       f32_4 %317 = OpLoad %187 
					                                       f32_2 %318 = OpVectorShuffle %317 %317 0 1 
					                                       f32_4 %319 = OpImageSampleImplicitLod %316 %318 
					                                         f32 %320 = OpCompositeExtract %319 0 
					                                Private f32* %321 = OpAccessChain %187 %88 
					                                                      OpStore %321 %320 
					                         read_only Texture2D %322 = OpLoad %312 
					                                     sampler %323 = OpLoad %314 
					                  read_only Texture2DSampled %324 = OpSampledImage %322 %323 
					                                       f32_4 %325 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %326 = OpVectorShuffle %325 %325 2 3 
					                                       f32_4 %327 = OpImageSampleImplicitLod %324 %326 
					                                         f32 %328 = OpCompositeExtract %327 0 
					                                Private f32* %329 = OpAccessChain %178 %88 
					                                                      OpStore %329 %328 
					                                Private f32* %331 = OpAccessChain %187 %88 
					                                         f32 %332 = OpLoad %331 
					                                Private f32* %333 = OpAccessChain %178 %88 
					                                         f32 %334 = OpLoad %333 
					                                        bool %335 = OpFOrdGreaterThanEqual %332 %334 
					                                                      OpStore %330 %335 
					                                        bool %337 = OpLoad %330 
					                                         f32 %338 = OpSelect %337 %30 %22 
					                                                      OpStore %336 %338 
					                                Private f32* %339 = OpAccessChain %187 %94 
					                                                      OpStore %339 %31 
					                                Private f32* %340 = OpAccessChain %187 %18 
					                                                      OpStore %340 %31 
					                                Private f32* %341 = OpAccessChain %178 %94 
					                                                      OpStore %341 %22 
					                                Private f32* %342 = OpAccessChain %178 %18 
					                                                      OpStore %342 %22 
					                                       f32_4 %343 = OpLoad %187 
					                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
					                                       f32_4 %345 = OpLoad %178 
					                                       f32_3 %346 = OpVectorShuffle %345 %345 1 1 2 
					                                       f32_3 %347 = OpFNegate %346 
					                                       f32_3 %348 = OpFAdd %344 %347 
					                                       f32_4 %349 = OpLoad %187 
					                                       f32_4 %350 = OpVectorShuffle %349 %348 4 5 6 3 
					                                                      OpStore %187 %350 
					                                         f32 %351 = OpLoad %336 
					                                       f32_3 %352 = OpCompositeConstruct %351 %351 %351 
					                                       f32_4 %353 = OpLoad %187 
					                                       f32_3 %354 = OpVectorShuffle %353 %353 0 1 2 
					                                       f32_3 %355 = OpFMul %352 %354 
					                                       f32_4 %356 = OpLoad %178 
					                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
					                                       f32_3 %358 = OpFAdd %355 %357 
					                                       f32_4 %359 = OpLoad %187 
					                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
					                                                      OpStore %187 %360 
					                                Private f32* %361 = OpAccessChain %178 %94 
					                                                      OpStore %361 %30 
					                                Private f32* %362 = OpAccessChain %178 %18 
					                                                      OpStore %362 %31 
					                              Uniform f32_4* %364 = OpAccessChain %14 %304 
					                                       f32_4 %365 = OpLoad %364 
					                                       f32_4 %366 = OpVectorShuffle %365 %365 0 1 0 1 
					                                       f32_4 %368 = OpFMul %366 %367 
					                                       f32_4 %369 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %370 = OpVectorShuffle %369 %369 2 3 2 3 
					                                       f32_4 %371 = OpFAdd %368 %370 
					                                                      OpStore %363 %371 
					                         read_only Texture2D %372 = OpLoad %312 
					                                     sampler %373 = OpLoad %314 
					                  read_only Texture2DSampled %374 = OpSampledImage %372 %373 
					                                       f32_4 %375 = OpLoad %363 
					                                       f32_2 %376 = OpVectorShuffle %375 %375 0 1 
					                                       f32_4 %377 = OpImageSampleImplicitLod %374 %376 
					                                         f32 %378 = OpCompositeExtract %377 0 
					                                Private f32* %379 = OpAccessChain %178 %88 
					                                                      OpStore %379 %378 
					                         read_only Texture2D %381 = OpLoad %312 
					                                     sampler %382 = OpLoad %314 
					                  read_only Texture2DSampled %383 = OpSampledImage %381 %382 
					                                       f32_4 %384 = OpLoad %363 
					                                       f32_2 %385 = OpVectorShuffle %384 %384 2 3 
					                                       f32_4 %386 = OpImageSampleImplicitLod %383 %385 
					                                         f32 %387 = OpCompositeExtract %386 0 
					                                Private f32* %388 = OpAccessChain %380 %88 
					                                                      OpStore %388 %387 
					                                Private f32* %389 = OpAccessChain %178 %88 
					                                         f32 %390 = OpLoad %389 
					                                Private f32* %391 = OpAccessChain %187 %88 
					                                         f32 %392 = OpLoad %391 
					                                        bool %393 = OpFOrdGreaterThanEqual %390 %392 
					                                                      OpStore %330 %393 
					                                        bool %394 = OpLoad %330 
					                                         f32 %395 = OpSelect %394 %30 %22 
					                                                      OpStore %336 %395 
					                                       f32_4 %396 = OpLoad %187 
					                                       f32_3 %397 = OpVectorShuffle %396 %396 1 1 2 
					                                       f32_3 %398 = OpFNegate %397 
					                                       f32_4 %399 = OpLoad %178 
					                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
					                                       f32_3 %401 = OpFAdd %398 %400 
					                                       f32_4 %402 = OpLoad %178 
					                                       f32_4 %403 = OpVectorShuffle %402 %401 4 5 6 3 
					                                                      OpStore %178 %403 
					                                         f32 %404 = OpLoad %336 
					                                       f32_3 %405 = OpCompositeConstruct %404 %404 %404 
					                                       f32_4 %406 = OpLoad %178 
					                                       f32_3 %407 = OpVectorShuffle %406 %406 0 1 2 
					                                       f32_3 %408 = OpFMul %405 %407 
					                                       f32_4 %409 = OpLoad %187 
					                                       f32_3 %410 = OpVectorShuffle %409 %409 0 1 2 
					                                       f32_3 %411 = OpFAdd %408 %410 
					                                       f32_4 %412 = OpLoad %187 
					                                       f32_4 %413 = OpVectorShuffle %412 %411 4 5 6 3 
					                                                      OpStore %187 %413 
					                                Private f32* %414 = OpAccessChain %380 %94 
					                                                      OpStore %414 %31 
					                                Private f32* %415 = OpAccessChain %380 %18 
					                                                      OpStore %415 %30 
					                                Private f32* %416 = OpAccessChain %380 %88 
					                                         f32 %417 = OpLoad %416 
					                                Private f32* %418 = OpAccessChain %187 %88 
					                                         f32 %419 = OpLoad %418 
					                                        bool %420 = OpFOrdGreaterThanEqual %417 %419 
					                                                      OpStore %330 %420 
					                                        bool %421 = OpLoad %330 
					                                         f32 %422 = OpSelect %421 %30 %22 
					                                                      OpStore %336 %422 
					                                       f32_4 %423 = OpLoad %187 
					                                       f32_3 %424 = OpVectorShuffle %423 %423 0 1 2 
					                                       f32_3 %425 = OpFNegate %424 
					                                       f32_3 %426 = OpLoad %380 
					                                       f32_3 %427 = OpFAdd %425 %426 
					                                       f32_4 %428 = OpLoad %178 
					                                       f32_4 %429 = OpVectorShuffle %428 %427 4 5 6 3 
					                                                      OpStore %178 %429 
					                                         f32 %430 = OpLoad %336 
					                                       f32_3 %431 = OpCompositeConstruct %430 %430 %430 
					                                       f32_4 %432 = OpLoad %178 
					                                       f32_3 %433 = OpVectorShuffle %432 %432 0 1 2 
					                                       f32_3 %434 = OpFMul %431 %433 
					                                       f32_4 %435 = OpLoad %187 
					                                       f32_3 %436 = OpVectorShuffle %435 %435 0 1 2 
					                                       f32_3 %437 = OpFAdd %434 %436 
					                                       f32_4 %438 = OpLoad %187 
					                                       f32_4 %439 = OpVectorShuffle %438 %437 4 5 6 3 
					                                                      OpStore %187 %439 
					                                       f32_4 %440 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %441 = OpVectorShuffle %440 %440 2 3 
					                              Uniform f32_4* %442 = OpAccessChain %14 %304 
					                                       f32_4 %443 = OpLoad %442 
					                                       f32_2 %444 = OpVectorShuffle %443 %443 0 1 
					                                       f32_2 %445 = OpFAdd %441 %444 
					                                       f32_4 %446 = OpLoad %178 
					                                       f32_4 %447 = OpVectorShuffle %446 %445 4 5 2 3 
					                                                      OpStore %178 %447 
					                         read_only Texture2D %448 = OpLoad %312 
					                                     sampler %449 = OpLoad %314 
					                  read_only Texture2DSampled %450 = OpSampledImage %448 %449 
					                                       f32_4 %451 = OpLoad %178 
					                                       f32_2 %452 = OpVectorShuffle %451 %451 0 1 
					                                       f32_4 %453 = OpImageSampleImplicitLod %450 %452 
					                                         f32 %454 = OpCompositeExtract %453 0 
					                                                      OpStore %336 %454 
					                                         f32 %455 = OpLoad %336 
					                                Private f32* %456 = OpAccessChain %187 %88 
					                                         f32 %457 = OpLoad %456 
					                                        bool %458 = OpFOrdGreaterThanEqual %455 %457 
					                                                      OpStore %330 %458 
					                                        bool %459 = OpLoad %330 
					                                         f32 %460 = OpSelect %459 %30 %22 
					                                                      OpStore %336 %460 
					                                       f32_4 %462 = OpLoad %187 
					                                       f32_2 %463 = OpVectorShuffle %462 %462 0 1 
					                                       f32_2 %464 = OpFNegate %463 
					                                       f32_2 %466 = OpFAdd %464 %465 
					                                                      OpStore %461 %466 
					                                         f32 %467 = OpLoad %336 
					                                       f32_2 %468 = OpCompositeConstruct %467 %467 
					                                       f32_2 %469 = OpLoad %461 
					                                       f32_2 %470 = OpFMul %468 %469 
					                                       f32_4 %471 = OpLoad %187 
					                                       f32_2 %472 = OpVectorShuffle %471 %471 0 1 
					                                       f32_2 %473 = OpFAdd %470 %472 
					                                       f32_4 %474 = OpLoad %187 
					                                       f32_4 %475 = OpVectorShuffle %474 %473 4 5 2 3 
					                                                      OpStore %187 %475 
					                                       f32_4 %476 = OpLoad %187 
					                                       f32_2 %477 = OpVectorShuffle %476 %476 0 1 
					                              Uniform f32_4* %478 = OpAccessChain %14 %304 
					                                       f32_4 %479 = OpLoad %478 
					                                       f32_2 %480 = OpVectorShuffle %479 %479 0 1 
					                                       f32_2 %481 = OpFMul %477 %480 
					                                       f32_4 %482 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %483 = OpVectorShuffle %482 %482 2 3 
					                                       f32_2 %484 = OpFAdd %481 %483 
					                                       f32_4 %485 = OpLoad %187 
					                                       f32_4 %486 = OpVectorShuffle %485 %484 4 5 2 3 
					                                                      OpStore %187 %486 
					                         read_only Texture2D %488 = OpLoad %487 
					                                     sampler %490 = OpLoad %489 
					                  read_only Texture2DSampled %491 = OpSampledImage %488 %490 
					                                       f32_4 %492 = OpLoad %187 
					                                       f32_2 %493 = OpVectorShuffle %492 %492 0 1 
					                                       f32_4 %494 = OpImageSampleImplicitLod %491 %493 
					                                       f32_2 %495 = OpVectorShuffle %494 %494 0 1 
					                                       f32_3 %496 = OpLoad %116 
					                                       f32_3 %497 = OpVectorShuffle %496 %495 3 4 2 
					                                                      OpStore %116 %497 
					                                       f32_3 %498 = OpLoad %116 
					                                       f32_2 %499 = OpVectorShuffle %498 %498 0 1 
					                                       f32_2 %500 = OpFNegate %499 
					                                       f32_4 %501 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %502 = OpVectorShuffle %501 %501 2 3 
					                                       f32_2 %503 = OpFAdd %500 %502 
					                                                      OpStore %461 %503 
					                                       f32_3 %505 = OpLoad %116 
					                                       f32_2 %506 = OpVectorShuffle %505 %505 0 1 
					                                       f32_3 %507 = OpLoad %116 
					                                       f32_2 %508 = OpVectorShuffle %507 %507 0 1 
					                                         f32 %509 = OpDot %506 %508 
					                                                      OpStore %504 %509 
					                                         f32 %510 = OpLoad %504 
					                                         f32 %511 = OpExtInst %1 31 %510 
					                                                      OpStore %504 %511 
					                         read_only Texture2D %514 = OpLoad %513 
					                                     sampler %516 = OpLoad %515 
					                  read_only Texture2DSampled %517 = OpSampledImage %514 %516 
					                                       f32_2 %518 = OpLoad %461 
					                                       f32_4 %519 = OpImageSampleImplicitLod %517 %518 
					                                                      OpStore %512 %519 
					                                Private f32* %521 = OpAccessChain %512 %88 
					                                         f32 %522 = OpLoad %521 
					                                Private f32* %523 = OpAccessChain %512 %18 
					                                         f32 %524 = OpLoad %523 
					                                         f32 %525 = OpExtInst %1 40 %522 %524 
					                                                      OpStore %520 %525 
					                                Private f32* %526 = OpAccessChain %512 %94 
					                                         f32 %527 = OpLoad %526 
					                                         f32 %528 = OpLoad %520 
					                                         f32 %529 = OpExtInst %1 40 %527 %528 
					                                                      OpStore %520 %529 
					                                         f32 %530 = OpLoad %520 
					                                         f32 %531 = OpFAdd %530 %30 
					                                                      OpStore %520 %531 
					                                         f32 %532 = OpLoad %520 
					                                         f32 %533 = OpFDiv %30 %532 
					                                Private f32* %534 = OpAccessChain %286 %94 
					                                                      OpStore %534 %533 
					                                       f32_4 %535 = OpLoad %512 
					                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
					                                       f32_3 %537 = OpLoad %286 
					                                       f32_3 %538 = OpVectorShuffle %537 %537 0 0 0 
					                                       f32_3 %539 = OpFMul %536 %538 
					                                       f32_4 %540 = OpLoad %294 
					                                       f32_3 %541 = OpVectorShuffle %540 %540 0 1 2 
					                                       f32_3 %542 = OpFNegate %541 
					                                       f32_3 %543 = OpFAdd %539 %542 
					                                       f32_4 %544 = OpLoad %178 
					                                       f32_4 %545 = OpVectorShuffle %544 %543 4 5 6 3 
					                                                      OpStore %178 %545 
					                                       f32_4 %546 = OpLoad %512 
					                                       f32_3 %547 = OpVectorShuffle %546 %546 0 1 2 
					                                       f32_3 %548 = OpLoad %286 
					                                       f32_3 %549 = OpVectorShuffle %548 %548 0 0 0 
					                                       f32_3 %550 = OpFMul %547 %549 
					                                       f32_4 %551 = OpLoad %187 
					                                       f32_4 %552 = OpVectorShuffle %551 %550 4 5 6 3 
					                                                      OpStore %187 %552 
					                                Private f32* %554 = OpAccessChain %512 %553 
					                                         f32 %555 = OpLoad %554 
					                                Private f32* %556 = OpAccessChain %294 %553 
					                                                      OpStore %556 %555 
					                                       f32_4 %558 = OpLoad %178 
					                                       f32_3 %559 = OpVectorShuffle %558 %558 0 1 2 
					                                       f32_3 %560 = OpLoad %104 
					                                       f32_3 %561 = OpFDiv %559 %560 
					                                                      OpStore %557 %561 
					                                Private f32* %563 = OpAccessChain %557 %88 
					                                         f32 %564 = OpLoad %563 
					                                         f32 %565 = OpExtInst %1 4 %564 
					                                Private f32* %566 = OpAccessChain %557 %18 
					                                         f32 %567 = OpLoad %566 
					                                         f32 %568 = OpExtInst %1 4 %567 
					                                         f32 %569 = OpExtInst %1 40 %565 %568 
					                                                      OpStore %562 %569 
					                                         f32 %570 = OpLoad %562 
					                                Private f32* %571 = OpAccessChain %557 %94 
					                                         f32 %572 = OpLoad %571 
					                                         f32 %573 = OpExtInst %1 4 %572 
					                                         f32 %574 = OpExtInst %1 40 %570 %573 
					                                Private f32* %575 = OpAccessChain %557 %94 
					                                                      OpStore %575 %574 
					                                Private f32* %576 = OpAccessChain %178 %553 
					                                                      OpStore %576 %22 
					                                       f32_4 %577 = OpLoad %178 
					                                       f32_3 %578 = OpLoad %557 
					                                       f32_4 %579 = OpVectorShuffle %578 %578 0 0 0 0 
					                                       f32_4 %580 = OpFDiv %577 %579 
					                                                      OpStore %363 %580 
					                                Private f32* %582 = OpAccessChain %557 %94 
					                                         f32 %583 = OpLoad %582 
					                                        bool %584 = OpFOrdLessThan %30 %583 
					                                                      OpStore %581 %584 
					                                       f32_4 %585 = OpLoad %294 
					                                       f32_4 %586 = OpLoad %363 
					                                       f32_4 %587 = OpFAdd %585 %586 
					                                                      OpStore %363 %587 
					                                Private f32* %588 = OpAccessChain %294 %553 
					                                         f32 %589 = OpLoad %588 
					                                Private f32* %590 = OpAccessChain %187 %553 
					                                                      OpStore %590 %589 
					                                        bool %591 = OpLoad %581 
					                                       f32_4 %592 = OpLoad %363 
					                                       f32_4 %593 = OpLoad %187 
					                                      bool_4 %595 = OpCompositeConstruct %591 %591 %591 %591 
					                                       f32_4 %596 = OpSelect %595 %592 %593 
					                                                      OpStore %294 %596 
					                                Uniform f32* %597 = OpAccessChain %14 %16 %88 
					                                         f32 %598 = OpLoad %597 
					                                         f32 %599 = OpFNegate %598 
					                                         f32 %601 = OpFMul %599 %600 
					                                         f32 %602 = OpLoad %504 
					                                         f32 %603 = OpFAdd %601 %602 
					                                Private f32* %604 = OpAccessChain %557 %94 
					                                                      OpStore %604 %603 
					                                         f32 %605 = OpLoad %504 
					                                Uniform f32* %607 = OpAccessChain %14 %606 %88 
					                                         f32 %608 = OpLoad %607 
					                                         f32 %609 = OpFMul %605 %608 
					                                                      OpStore %562 %609 
					                                Uniform f32* %611 = OpAccessChain %14 %16 %88 
					                                         f32 %612 = OpLoad %611 
					                                         f32 %614 = OpFMul %612 %613 
					                                                      OpStore %610 %614 
					                                         f32 %615 = OpLoad %610 
					                                         f32 %616 = OpFDiv %30 %615 
					                                                      OpStore %610 %616 
					                                         f32 %617 = OpLoad %610 
					                                Private f32* %618 = OpAccessChain %557 %94 
					                                         f32 %619 = OpLoad %618 
					                                         f32 %620 = OpFMul %617 %619 
					                                Private f32* %621 = OpAccessChain %557 %94 
					                                                      OpStore %621 %620 
					                                Private f32* %622 = OpAccessChain %557 %94 
					                                         f32 %623 = OpLoad %622 
					                                         f32 %624 = OpExtInst %1 43 %623 %22 %30 
					                                Private f32* %625 = OpAccessChain %557 %94 
					                                                      OpStore %625 %624 
					                                Private f32* %626 = OpAccessChain %557 %94 
					                                         f32 %627 = OpLoad %626 
					                                         f32 %629 = OpFMul %627 %628 
					                                         f32 %631 = OpFAdd %629 %630 
					                                                      OpStore %610 %631 
					                                Private f32* %632 = OpAccessChain %557 %94 
					                                         f32 %633 = OpLoad %632 
					                                Private f32* %634 = OpAccessChain %557 %94 
					                                         f32 %635 = OpLoad %634 
					                                         f32 %636 = OpFMul %633 %635 
					                                Private f32* %637 = OpAccessChain %557 %94 
					                                                      OpStore %637 %636 
					                                Private f32* %638 = OpAccessChain %557 %94 
					                                         f32 %639 = OpLoad %638 
					                                         f32 %640 = OpLoad %610 
					                                         f32 %641 = OpFMul %639 %640 
					                                Private f32* %642 = OpAccessChain %557 %94 
					                                                      OpStore %642 %641 
					                                Private f32* %643 = OpAccessChain %557 %94 
					                                         f32 %644 = OpLoad %643 
					                                         f32 %645 = OpExtInst %1 37 %644 %30 
					                                Private f32* %646 = OpAccessChain %35 %553 
					                                                      OpStore %646 %645 
					                                       f32_4 %647 = OpLoad %35 
					                                       f32_4 %648 = OpFNegate %647 
					                                       f32_4 %649 = OpLoad %294 
					                                       f32_4 %650 = OpFAdd %648 %649 
					                                                      OpStore %294 %650 
					                                Uniform f32* %651 = OpAccessChain %14 %606 %94 
					                                         f32 %652 = OpLoad %651 
					                                         f32 %653 = OpFNegate %652 
					                                Uniform f32* %654 = OpAccessChain %14 %606 %18 
					                                         f32 %655 = OpLoad %654 
					                                         f32 %656 = OpFAdd %653 %655 
					                                Private f32* %657 = OpAccessChain %557 %94 
					                                                      OpStore %657 %656 
					                                         f32 %658 = OpLoad %562 
					                                Private f32* %659 = OpAccessChain %557 %94 
					                                         f32 %660 = OpLoad %659 
					                                         f32 %661 = OpFMul %658 %660 
					                                Uniform f32* %662 = OpAccessChain %14 %606 %94 
					                                         f32 %663 = OpLoad %662 
					                                         f32 %664 = OpFAdd %661 %663 
					                                Private f32* %665 = OpAccessChain %557 %94 
					                                                      OpStore %665 %664 
					                                Private f32* %666 = OpAccessChain %557 %94 
					                                         f32 %667 = OpLoad %666 
					                                Uniform f32* %668 = OpAccessChain %14 %606 %18 
					                                         f32 %669 = OpLoad %668 
					                                         f32 %670 = OpExtInst %1 40 %667 %669 
					                                Private f32* %671 = OpAccessChain %557 %94 
					                                                      OpStore %671 %670 
					                                Private f32* %672 = OpAccessChain %557 %94 
					                                         f32 %673 = OpLoad %672 
					                                Uniform f32* %674 = OpAccessChain %14 %606 %94 
					                                         f32 %675 = OpLoad %674 
					                                         f32 %676 = OpExtInst %1 37 %673 %675 
					                                Private f32* %677 = OpAccessChain %557 %94 
					                                                      OpStore %677 %676 
					                                       f32_3 %678 = OpLoad %557 
					                                       f32_4 %679 = OpVectorShuffle %678 %678 0 0 0 0 
					                                       f32_4 %680 = OpLoad %294 
					                                       f32_4 %681 = OpFMul %679 %680 
					                                       f32_4 %682 = OpLoad %35 
					                                       f32_4 %683 = OpFAdd %681 %682 
					                                                      OpStore %35 %683 
					                                Private f32* %684 = OpAccessChain %35 %88 
					                                         f32 %685 = OpLoad %684 
					                                Private f32* %686 = OpAccessChain %35 %18 
					                                         f32 %687 = OpLoad %686 
					                                         f32 %688 = OpExtInst %1 40 %685 %687 
					                                                      OpStore %520 %688 
					                                Private f32* %689 = OpAccessChain %35 %94 
					                                         f32 %690 = OpLoad %689 
					                                         f32 %691 = OpLoad %520 
					                                         f32 %692 = OpExtInst %1 40 %690 %691 
					                                                      OpStore %520 %692 
					                                         f32 %693 = OpLoad %520 
					                                         f32 %694 = OpFNegate %693 
					                                         f32 %695 = OpFAdd %694 %30 
					                                                      OpStore %520 %695 
					                                         f32 %696 = OpLoad %520 
					                                         f32 %697 = OpFDiv %30 %696 
					                                Private f32* %698 = OpAccessChain %154 %94 
					                                                      OpStore %698 %697 
					                                       f32_4 %699 = OpLoad %35 
					                                       f32_3 %700 = OpVectorShuffle %699 %699 0 1 2 
					                                       f32_3 %701 = OpLoad %154 
					                                       f32_3 %702 = OpVectorShuffle %701 %701 0 0 0 
					                                       f32_3 %703 = OpFMul %700 %702 
					                                       f32_4 %704 = OpLoad %35 
					                                       f32_4 %705 = OpVectorShuffle %704 %703 4 5 6 3 
					                                                      OpStore %35 %705 
					                                       f32_4 %708 = OpLoad %35 
					                                       f32_3 %709 = OpVectorShuffle %708 %708 0 1 2 
					                                       f32_4 %710 = OpLoad %707 
					                                       f32_4 %711 = OpVectorShuffle %710 %709 4 5 6 3 
					                                                      OpStore %707 %711 
					                                       f32_4 %713 = OpLoad %35 
					                                                      OpStore %712 %713 
					                                Private f32* %714 = OpAccessChain %35 %553 
					                                         f32 %715 = OpLoad %714 
					                                         f32 %717 = OpFMul %715 %716 
					                                 Output f32* %719 = OpAccessChain %707 %553 
					                                                      OpStore %719 %717 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[2];
						vec4 _CameraDepthTexture_TexelSize;
						vec2 _Jitter;
						vec4 _SharpenParameters;
						vec4 _FinalBlendParameters;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _CameraMotionVectorsTexture;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HistoryTex;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_6;
					vec3 u_xlat7;
					float u_xlat8;
					vec2 u_xlat14;
					float u_xlat16_14;
					float u_xlat15;
					vec2 u_xlat16;
					float u_xlat21;
					float u_xlat16_21;
					float u_xlat22;
					float u_xlat16_22;
					bool u_xlatb22;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat7.xy = _Jitter.xy * vec2(1.0, -1.0);
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat7.xy : _Jitter.xy;
					    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat14.xy = (-_MainTex_TexelSize.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_14 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_14 = max(u_xlat16_14, u_xlat10_1.x);
					    u_xlat16_14 = u_xlat16_14 + 1.0;
					    u_xlat16_14 = float(1.0) / u_xlat16_14;
					    u_xlat16_2.xyz = vec3(u_xlat16_14) * u_xlat10_1.xyz;
					    u_xlat14.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat14.xy);
					    u_xlat16_21 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_21 = max(u_xlat16_21, u_xlat10_0.x);
					    u_xlat16_21 = u_xlat16_21 + 1.0;
					    u_xlat16_21 = float(1.0) / u_xlat16_21;
					    u_xlat16_4.xyz = vec3(u_xlat16_21) * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_1.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
					    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_4.xyz);
					    u_xlat16_4.xyz = (-u_xlat16_0.xyz) * vec3(0.166666999, 0.166666999, 0.166666999) + u_xlat10_3.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * _SharpenParameters.xxx;
					    u_xlat3.xyz = u_xlat4.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_3.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat16_0.xyz + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.142857, 0.142857, 0.142857);
					    u_xlat21 = max(u_xlat0.z, u_xlat0.y);
					    u_xlat21 = max(u_xlat21, u_xlat0.x);
					    u_xlat21 = u_xlat21 + 1.0;
					    u_xlat21 = float(1.0) / u_xlat21;
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat7.x = max(u_xlat3.z, u_xlat3.y);
					    u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
					    u_xlat7.x = u_xlat7.x + 1.0;
					    u_xlat7.x = float(1.0) / u_xlat7.x;
					    u_xlat3.xyz = u_xlat7.xxx * u_xlat3.xyz;
					    u_xlat7.x = dot(u_xlat3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
					    u_xlat7.xyz = -abs(u_xlat0.xxx) * vec3(4.0, 4.0, 4.0) + u_xlat16_1.xyz;
					    u_xlat1.xyz = abs(u_xlat0.xxx) * vec3(4.0, 4.0, 4.0) + u_xlat16_2.xyz;
					    u_xlat2.xyz = (-u_xlat7.xyz) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat7.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat2.xy = vs_TEXCOORD0.zw + (-_CameraDepthTexture_TexelSize.xy);
					    u_xlat2 = texture(_CameraDepthTexture, u_xlat2.xy).yzxw;
					    u_xlat4 = texture(_CameraDepthTexture, vs_TEXCOORD0.zw).yzxw;
					    u_xlatb22 = u_xlat2.z>=u_xlat4.z;
					    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
					    u_xlat2.x = float(-1.0);
					    u_xlat2.y = float(-1.0);
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat2.xyz = u_xlat2.xyz + (-u_xlat4.yyz);
					    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz + u_xlat4.xyz;
					    u_xlat4.x = float(1.0);
					    u_xlat4.y = float(-1.0);
					    u_xlat5 = _CameraDepthTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.zwzw;
					    u_xlat10_6 = texture(_CameraDepthTexture, u_xlat5.xy);
					    u_xlat5 = texture(_CameraDepthTexture, u_xlat5.zw).yzxw;
					    u_xlat4.z = u_xlat10_6.x;
					    u_xlatb22 = u_xlat10_6.x>=u_xlat2.z;
					    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
					    u_xlat4.xyz = (-u_xlat2.yyz) + u_xlat4.xyz;
					    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
					    u_xlat5.x = float(-1.0);
					    u_xlat5.y = float(1.0);
					    u_xlat5.w = float(0.0);
					    u_xlatb22 = u_xlat5.z>=u_xlat2.z;
					    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
					    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat5.xyz;
					    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
					    u_xlat4.xy = vs_TEXCOORD0.zw + _CameraDepthTexture_TexelSize.xy;
					    u_xlat10_4 = texture(_CameraDepthTexture, u_xlat4.xy);
					    u_xlatb22 = u_xlat10_4.x>=u_xlat2.z;
					    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
					    u_xlat16.xy = (-u_xlat2.xy) + vec2(1.0, 1.0);
					    u_xlat2.xy = vec2(u_xlat22) * u_xlat16.xy + u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * _CameraDepthTexture_TexelSize.xy + vs_TEXCOORD0.zw;
					    u_xlat10_2 = texture(_CameraMotionVectorsTexture, u_xlat2.xy);
					    u_xlat16.xy = (-u_xlat10_2.xy) + vs_TEXCOORD0.zw;
					    u_xlat16_22 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlat16_22 = sqrt(u_xlat16_22);
					    u_xlat10_2 = texture(_HistoryTex, u_xlat16.xy);
					    u_xlat16_4.x = max(u_xlat10_2.z, u_xlat10_2.y);
					    u_xlat16_4.x = max(u_xlat10_2.x, u_xlat16_4.x);
					    u_xlat16_4.x = u_xlat16_4.x + 1.0;
					    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
					    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat16_4.xxx + (-u_xlat0.xyz);
					    u_xlat4.xyz = u_xlat10_2.xyz * u_xlat16_4.xxx;
					    u_xlat0.w = u_xlat10_2.w;
					    u_xlat1.xyz = u_xlat5.xyz / u_xlat1.xyz;
					    u_xlat8 = max(abs(u_xlat1.z), abs(u_xlat1.y));
					    u_xlat1.x = max(u_xlat8, abs(u_xlat1.x));
					    u_xlat2 = u_xlat5 / u_xlat1.xxxx;
					    u_xlatb1 = 1.0<u_xlat1.x;
					    u_xlat2 = u_xlat0 + u_xlat2;
					    u_xlat4.w = u_xlat0.w;
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat4;
					    u_xlat1.x = (-_MainTex_TexelSize.z) * 0.00200000009 + u_xlat16_22;
					    u_xlat8 = u_xlat16_22 * _FinalBlendParameters.z;
					    u_xlat15 = _MainTex_TexelSize.z * 0.00150000001;
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat1.x = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat15 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * u_xlat15;
					    u_xlat3.w = min(u_xlat1.x, 1.0);
					    u_xlat0 = u_xlat0 + (-u_xlat3);
					    u_xlat1.x = (-_FinalBlendParameters.x) + _FinalBlendParameters.y;
					    u_xlat1.x = u_xlat8 * u_xlat1.x + _FinalBlendParameters.x;
					    u_xlat1.x = max(u_xlat1.x, _FinalBlendParameters.y);
					    u_xlat1.x = min(u_xlat1.x, _FinalBlendParameters.x);
					    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat3;
					    u_xlat1.x = max(u_xlat0.z, u_xlat0.y);
					    u_xlat1.x = max(u_xlat0.x, u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    SV_Target1.xyz = u_xlat0.xyz;
					    SV_Target0 = u_xlat0;
					    SV_Target1.w = u_xlat0.w * 0.850000024;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 287447
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    vs_TEXCOORD0.y = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    vs_TEXCOORD0.xzw = in_TEXCOORD0.xxy;
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
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec2 _Jitter;
					uniform 	vec4 _SharpenParameters;
					uniform 	vec4 _FinalBlendParameters;
					UNITY_LOCATION(0) uniform  sampler2D _CameraMotionVectorsTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					UNITY_LOCATION(2) uniform  sampler2D _HistoryTex;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat5;
					float u_xlat6;
					vec2 u_xlat12;
					vec2 u_xlat15;
					float u_xlat18;
					float u_xlat16_18;
					float u_xlat19;
					float u_xlat16_19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + (-_Jitter.xy);
					    u_xlat12.xy = (-_MainTex_TexelSize.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat12.xy);
					    u_xlat12.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat12.xy);
					    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_4.xyz = u_xlat10_2.xyz + u_xlat10_2.xyz;
					    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_4.xyz);
					    u_xlat16_4.xyz = (-u_xlat16_3.xyz) * vec3(0.166666999, 0.166666999, 0.166666999) + u_xlat10_2.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * _SharpenParameters.xxx;
					    u_xlat2.xyz = u_xlat4.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_2.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = u_xlat2.xyz + u_xlat16_3.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(0.142857, 0.142857, 0.142857);
					    u_xlat18 = max(u_xlat3.z, u_xlat3.y);
					    u_xlat18 = max(u_xlat18, u_xlat3.x);
					    u_xlat18 = u_xlat18 + 1.0;
					    u_xlat18 = float(1.0) / u_xlat18;
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
					    u_xlat18 = dot(u_xlat3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat19 = max(u_xlat2.z, u_xlat2.y);
					    u_xlat19 = max(u_xlat19, u_xlat2.x);
					    u_xlat19 = u_xlat19 + 1.0;
					    u_xlat19 = float(1.0) / u_xlat19;
					    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
					    u_xlat19 = dot(u_xlat2.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat18 = u_xlat18 + (-u_xlat19);
					    u_xlat16_19 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_19 = max(u_xlat16_19, u_xlat10_1.x);
					    u_xlat16_19 = u_xlat16_19 + 1.0;
					    u_xlat16_19 = float(1.0) / u_xlat16_19;
					    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat10_1.xyz;
					    u_xlat16_19 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_19 = max(u_xlat10_0.x, u_xlat16_19);
					    u_xlat16_19 = u_xlat16_19 + 1.0;
					    u_xlat16_19 = float(1.0) / u_xlat16_19;
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(u_xlat16_19);
					    u_xlat16_3.xyz = min(u_xlat16_1.xyz, u_xlat16_0.xyz);
					    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_1.xyz);
					    u_xlat0.xyz = abs(vec3(u_xlat18)) * vec3(4.0, 4.0, 4.0) + u_xlat16_0.xyz;
					    u_xlat1.xyz = -abs(vec3(u_xlat18)) * vec3(4.0, 4.0, 4.0) + u_xlat16_3.xyz;
					    u_xlat3.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat10_3 = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.zw);
					    u_xlat15.xy = (-u_xlat10_3.xy) + vs_TEXCOORD0.zw;
					    u_xlat16_18 = dot(u_xlat10_3.xy, u_xlat10_3.xy);
					    u_xlat16_18 = sqrt(u_xlat16_18);
					    u_xlat10_3 = texture(_HistoryTex, u_xlat15.xy);
					    u_xlat16_4.x = max(u_xlat10_3.z, u_xlat10_3.y);
					    u_xlat16_4.x = max(u_xlat10_3.x, u_xlat16_4.x);
					    u_xlat16_4.x = u_xlat16_4.x + 1.0;
					    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
					    u_xlat5.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx + (-u_xlat1.xyz);
					    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat16_4.xxx;
					    u_xlat1.w = u_xlat10_3.w;
					    u_xlat0.xyz = u_xlat5.xyz / u_xlat0.xyz;
					    u_xlat6 = max(abs(u_xlat0.z), abs(u_xlat0.y));
					    u_xlat0.x = max(u_xlat6, abs(u_xlat0.x));
					    u_xlat5.w = 0.0;
					    u_xlat3 = u_xlat5 / u_xlat0.xxxx;
					    u_xlatb0 = 1.0<u_xlat0.x;
					    u_xlat3 = u_xlat1 + u_xlat3;
					    u_xlat4.w = u_xlat1.w;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat3 : u_xlat4;
					    u_xlat0.x = (-_MainTex_TexelSize.z) * 0.00200000009 + u_xlat16_18;
					    u_xlat6 = u_xlat16_18 * _FinalBlendParameters.z;
					    u_xlat12.x = _MainTex_TexelSize.z * 0.00150000001;
					    u_xlat12.x = float(1.0) / u_xlat12.x;
					    u_xlat0.x = u_xlat12.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat12.x;
					    u_xlat2.w = min(u_xlat0.x, 1.0);
					    u_xlat1 = u_xlat1 + (-u_xlat2);
					    u_xlat0.x = (-_FinalBlendParameters.x) + _FinalBlendParameters.y;
					    u_xlat0.x = u_xlat6 * u_xlat0.x + _FinalBlendParameters.x;
					    u_xlat0.x = max(u_xlat0.x, _FinalBlendParameters.y);
					    u_xlat0.x = min(u_xlat0.x, _FinalBlendParameters.x);
					    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
					    u_xlat1.x = max(u_xlat0.z, u_xlat0.y);
					    u_xlat1.x = max(u_xlat0.x, u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    SV_Target1.xyz = u_xlat0.xyz;
					    SV_Target0 = u_xlat0;
					    SV_Target1.w = u_xlat0.w * 0.850000024;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 122
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %99 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate vs_TEXCOORD0 Location 99 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
					                                            %101 = OpTypePointer Function %6 
					                                            %110 = OpTypePointer Output %6 
					                                            %112 = OpTypeVector %6 3 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %102 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                       bool %100 = OpLoad %84 
					                                                     OpSelectionMerge %104 None 
					                                                     OpBranchConditional %100 %103 %106 
					                                            %103 = OpLabel 
					                                        f32 %105 = OpLoad %91 
					                                                     OpStore %102 %105 
					                                                     OpBranch %104 
					                                            %106 = OpLabel 
					                                 Input f32* %107 = OpAccessChain %92 %68 
					                                        f32 %108 = OpLoad %107 
					                                                     OpStore %102 %108 
					                                                     OpBranch %104 
					                                            %104 = OpLabel 
					                                        f32 %109 = OpLoad %102 
					                                Output f32* %111 = OpAccessChain vs_TEXCOORD0 %68 
					                                                     OpStore %111 %109 
					                                      f32_4 %113 = OpLoad %92 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 0 1 
					                                      f32_4 %115 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %116 = OpVectorShuffle %115 %114 4 1 5 6 
					                                                     OpStore vs_TEXCOORD0 %116 
					                                Output f32* %117 = OpAccessChain %72 %22 %68 
					                                        f32 %118 = OpLoad %117 
					                                        f32 %119 = OpFNegate %118 
					                                Output f32* %120 = OpAccessChain %72 %22 %68 
					                                                     OpStore %120 %119 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 537
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %52 %523 %528 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 52 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %75 DescriptorSet 75 
					                                                      OpDecorate %75 Binding 75 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %79 DescriptorSet 79 
					                                                      OpDecorate %79 Binding 79 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %98 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %303 DescriptorSet 303 
					                                                      OpDecorate %303 Binding 303 
					                                                      OpDecorate %304 RelaxedPrecision 
					                                                      OpDecorate %305 RelaxedPrecision 
					                                                      OpDecorate %305 DescriptorSet 305 
					                                                      OpDecorate %305 Binding 305 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %311 RelaxedPrecision 
					                                                      OpDecorate %315 RelaxedPrecision 
					                                                      OpDecorate %316 RelaxedPrecision 
					                                                      OpDecorate %317 RelaxedPrecision 
					                                                      OpDecorate %321 RelaxedPrecision 
					                                                      OpDecorate %322 RelaxedPrecision 
					                                                      OpDecorate %323 RelaxedPrecision 
					                                                      OpDecorate %324 RelaxedPrecision 
					                                                      OpDecorate %325 RelaxedPrecision 
					                                                      OpDecorate %326 RelaxedPrecision 
					                                                      OpDecorate %327 RelaxedPrecision 
					                                                      OpDecorate %328 RelaxedPrecision 
					                                                      OpDecorate %328 DescriptorSet 328 
					                                                      OpDecorate %328 Binding 328 
					                                                      OpDecorate %329 RelaxedPrecision 
					                                                      OpDecorate %330 RelaxedPrecision 
					                                                      OpDecorate %330 DescriptorSet 330 
					                                                      OpDecorate %330 Binding 330 
					                                                      OpDecorate %331 RelaxedPrecision 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                                      OpDecorate %337 RelaxedPrecision 
					                                                      OpDecorate %339 RelaxedPrecision 
					                                                      OpDecorate %340 RelaxedPrecision 
					                                                      OpDecorate %342 RelaxedPrecision 
					                                                      OpDecorate %343 RelaxedPrecision 
					                                                      OpDecorate %344 RelaxedPrecision 
					                                                      OpDecorate %345 RelaxedPrecision 
					                                                      OpDecorate %346 RelaxedPrecision 
					                                                      OpDecorate %347 RelaxedPrecision 
					                                                      OpDecorate %348 RelaxedPrecision 
					                                                      OpDecorate %350 RelaxedPrecision 
					                                                      OpDecorate %351 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %353 RelaxedPrecision 
					                                                      OpDecorate %354 RelaxedPrecision 
					                                                      OpDecorate %361 RelaxedPrecision 
					                                                      OpDecorate %362 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %365 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %418 RelaxedPrecision 
					                                                      OpDecorate %421 RelaxedPrecision 
					                                                      OpDecorate %507 RelaxedPrecision 
					                                                      OpDecorate %509 RelaxedPrecision 
					                                                      OpDecorate %510 RelaxedPrecision 
					                                                      OpDecorate %511 RelaxedPrecision 
					                                                      OpDecorate %512 RelaxedPrecision 
					                                                      OpDecorate %513 RelaxedPrecision 
					                                                      OpDecorate %517 RelaxedPrecision 
					                                                      OpDecorate %518 RelaxedPrecision 
					                                                      OpDecorate %523 Location 523 
					                                                      OpDecorate %528 Location 528 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 4 
					                                              %11 = OpTypeVector %9 2 
					                                              %12 = OpTypeStruct %10 %11 %10 %10 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32_4; f32_2; f32_4; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 0 
					                                              %17 = OpTypeInt 32 0 
					                                          u32 %18 = OpConstant 1 
					                                              %19 = OpTypePointer Uniform %9 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                              %24 = OpTypePointer Private %11 
					                               Private f32_2* %25 = OpVariable Private 
					                                          i32 %26 = OpConstant 1 
					                                              %27 = OpTypePointer Uniform %11 
					                                          f32 %30 = OpConstant 3,674022E-40 
					                                          f32 %31 = OpConstant 3,674022E-40 
					                                        f32_2 %32 = OpConstantComposite %30 %31 
					                                              %34 = OpTypePointer Private %10 
					                               Private f32_4* %35 = OpVariable Private 
					                                              %37 = OpTypePointer Function %11 
					                                              %51 = OpTypePointer Input %10 
					                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
					                               Private f32_2* %58 = OpVariable Private 
					                                              %59 = OpTypePointer Uniform %10 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                        f32_2 %65 = OpConstantComposite %64 %64 
					                                              %70 = OpTypeVector %9 3 
					                                              %71 = OpTypePointer Private %70 
					                               Private f32_3* %72 = OpVariable Private 
					                                              %73 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                              %74 = OpTypePointer UniformConstant %73 
					         UniformConstant read_only Texture2D* %75 = OpVariable UniformConstant 
					                                              %77 = OpTypeSampler 
					                                              %78 = OpTypePointer UniformConstant %77 
					                     UniformConstant sampler* %79 = OpVariable UniformConstant 
					                                              %81 = OpTypeSampledImage %73 
					                                              %86 = OpTypePointer Private %9 
					                                 Private f32* %87 = OpVariable Private 
					                                          u32 %88 = OpConstant 2 
					                                          u32 %94 = OpConstant 0 
					                                Private f32* %101 = OpVariable Private 
					                              Private f32_3* %104 = OpVariable Private 
					                              Private f32_3* %116 = OpVariable Private 
					                              Private f32_3* %124 = OpVariable Private 
					                                Private f32* %142 = OpVariable Private 
					                              Private f32_3* %145 = OpVariable Private 
					                              Private f32_3* %150 = OpVariable Private 
					                              Private f32_3* %154 = OpVariable Private 
					                                         f32 %165 = OpConstant 3,674022E-40 
					                                       f32_3 %166 = OpConstantComposite %165 %165 %165 
					                                         f32 %173 = OpConstant 3,674022E-40 
					                                       f32_3 %174 = OpConstantComposite %173 %173 %173 
					                              Private f32_4* %178 = OpVariable Private 
					                                         i32 %180 = OpConstant 2 
					                              Private f32_4* %187 = OpVariable Private 
					                                         f32 %190 = OpConstant 3,674022E-40 
					                                       f32_3 %191 = OpConstantComposite %190 %190 %190 
					                                       f32_3 %199 = OpConstantComposite %22 %22 %22 
					                                         f32 %211 = OpConstant 3,674022E-40 
					                                       f32_3 %212 = OpConstantComposite %211 %211 %211 
					                                         f32 %238 = OpConstant 3,674022E-40 
					                                         f32 %239 = OpConstant 3,674022E-40 
					                                         f32 %240 = OpConstant 3,674022E-40 
					                                       f32_3 %241 = OpConstantComposite %238 %239 %240 
					                                Private f32* %243 = OpVariable Private 
					                                Private f32* %268 = OpVariable Private 
					                              Private f32_3* %286 = OpVariable Private 
					                                       f32_3 %295 = OpConstantComposite %64 %64 %64 
					                              Private f32_4* %297 = OpVariable Private 
					                              Private f32_4* %302 = OpVariable Private 
					        UniformConstant read_only Texture2D* %303 = OpVariable UniformConstant 
					                    UniformConstant sampler* %305 = OpVariable UniformConstant 
					                              Private f32_2* %314 = OpVariable Private 
					        UniformConstant read_only Texture2D* %328 = OpVariable UniformConstant 
					                    UniformConstant sampler* %330 = OpVariable UniformConstant 
					                                Private f32* %335 = OpVariable Private 
					                                         u32 %368 = OpConstant 3 
					                              Private f32_3* %372 = OpVariable Private 
					                                Private f32* %377 = OpVariable Private 
					                              Private f32_4* %392 = OpVariable Private 
					                               Private bool* %397 = OpVariable Private 
					                                             %410 = OpTypeVector %6 4 
					                                         f32 %416 = OpConstant 3,674022E-40 
					                                         i32 %422 = OpConstant 3 
					                                Private f32* %426 = OpVariable Private 
					                                         f32 %429 = OpConstant 3,674022E-40 
					                                         f32 %444 = OpConstant 3,674022E-40 
					                                         f32 %446 = OpConstant 3,674022E-40 
					                                             %522 = OpTypePointer Output %10 
					                               Output f32_4* %523 = OpVariable Output 
					                               Output f32_4* %528 = OpVariable Output 
					                                         f32 %532 = OpConstant 3,674022E-40 
					                                             %534 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                              Function f32_2* %38 = OpVariable Function 
					                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
					                                          f32 %21 = OpLoad %20 
					                                         bool %23 = OpFOrdLessThan %21 %22 
					                                                      OpStore %8 %23 
					                               Uniform f32_2* %28 = OpAccessChain %14 %26 
					                                        f32_2 %29 = OpLoad %28 
					                                        f32_2 %33 = OpFMul %29 %32 
					                                                      OpStore %25 %33 
					                                         bool %36 = OpLoad %8 
					                                                      OpSelectionMerge %40 None 
					                                                      OpBranchConditional %36 %39 %42 
					                                              %39 = OpLabel 
					                                        f32_2 %41 = OpLoad %25 
					                                                      OpStore %38 %41 
					                                                      OpBranch %40 
					                                              %42 = OpLabel 
					                               Uniform f32_2* %43 = OpAccessChain %14 %26 
					                                        f32_2 %44 = OpLoad %43 
					                                                      OpStore %38 %44 
					                                                      OpBranch %40 
					                                              %40 = OpLabel 
					                                        f32_2 %45 = OpLoad %38 
					                                        f32_4 %46 = OpLoad %35 
					                                        f32_4 %47 = OpVectorShuffle %46 %45 4 5 2 3 
					                                                      OpStore %35 %47 
					                                        f32_4 %48 = OpLoad %35 
					                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                        f32_2 %50 = OpFNegate %49 
					                                        f32_4 %53 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
					                                        f32_2 %55 = OpFAdd %50 %54 
					                                        f32_4 %56 = OpLoad %35 
					                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
					                                                      OpStore %35 %57 
					                               Uniform f32_4* %60 = OpAccessChain %14 %16 
					                                        f32_4 %61 = OpLoad %60 
					                                        f32_2 %62 = OpVectorShuffle %61 %61 0 1 
					                                        f32_2 %63 = OpFNegate %62 
					                                        f32_2 %66 = OpFMul %63 %65 
					                                        f32_4 %67 = OpLoad %35 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                        f32_2 %69 = OpFAdd %66 %68 
					                                                      OpStore %58 %69 
					                          read_only Texture2D %76 = OpLoad %75 
					                                      sampler %80 = OpLoad %79 
					                   read_only Texture2DSampled %82 = OpSampledImage %76 %80 
					                                        f32_2 %83 = OpLoad %58 
					                                        f32_4 %84 = OpImageSampleImplicitLod %82 %83 
					                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                                      OpStore %72 %85 
					                                 Private f32* %89 = OpAccessChain %72 %88 
					                                          f32 %90 = OpLoad %89 
					                                 Private f32* %91 = OpAccessChain %72 %18 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpExtInst %1 40 %90 %92 
					                                                      OpStore %87 %93 
					                                 Private f32* %95 = OpAccessChain %72 %94 
					                                          f32 %96 = OpLoad %95 
					                                          f32 %97 = OpLoad %87 
					                                          f32 %98 = OpExtInst %1 40 %96 %97 
					                                                      OpStore %87 %98 
					                                          f32 %99 = OpLoad %87 
					                                         f32 %100 = OpFAdd %99 %30 
					                                                      OpStore %87 %100 
					                                         f32 %102 = OpLoad %87 
					                                         f32 %103 = OpFDiv %30 %102 
					                                                      OpStore %101 %103 
					                                         f32 %105 = OpLoad %101 
					                                       f32_3 %106 = OpCompositeConstruct %105 %105 %105 
					                                       f32_3 %107 = OpLoad %72 
					                                       f32_3 %108 = OpFMul %106 %107 
					                                                      OpStore %104 %108 
					                              Uniform f32_4* %109 = OpAccessChain %14 %16 
					                                       f32_4 %110 = OpLoad %109 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
					                                       f32_2 %112 = OpFMul %111 %65 
					                                       f32_4 %113 = OpLoad %35 
					                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
					                                       f32_2 %115 = OpFAdd %112 %114 
					                                                      OpStore %58 %115 
					                         read_only Texture2D %117 = OpLoad %75 
					                                     sampler %118 = OpLoad %79 
					                  read_only Texture2DSampled %119 = OpSampledImage %117 %118 
					                                       f32_4 %120 = OpLoad %35 
					                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                       f32_4 %122 = OpImageSampleImplicitLod %119 %121 
					                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
					                                                      OpStore %116 %123 
					                         read_only Texture2D %125 = OpLoad %75 
					                                     sampler %126 = OpLoad %79 
					                  read_only Texture2DSampled %127 = OpSampledImage %125 %126 
					                                       f32_2 %128 = OpLoad %58 
					                                       f32_4 %129 = OpImageSampleImplicitLod %127 %128 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
					                                                      OpStore %124 %130 
					                                Private f32* %131 = OpAccessChain %124 %88 
					                                         f32 %132 = OpLoad %131 
					                                Private f32* %133 = OpAccessChain %124 %18 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpExtInst %1 40 %132 %134 
					                                                      OpStore %87 %135 
					                                Private f32* %136 = OpAccessChain %124 %94 
					                                         f32 %137 = OpLoad %136 
					                                         f32 %138 = OpLoad %87 
					                                         f32 %139 = OpExtInst %1 40 %137 %138 
					                                                      OpStore %87 %139 
					                                         f32 %140 = OpLoad %87 
					                                         f32 %141 = OpFAdd %140 %30 
					                                                      OpStore %87 %141 
					                                         f32 %143 = OpLoad %87 
					                                         f32 %144 = OpFDiv %30 %143 
					                                                      OpStore %142 %144 
					                                         f32 %146 = OpLoad %142 
					                                       f32_3 %147 = OpCompositeConstruct %146 %146 %146 
					                                       f32_3 %148 = OpLoad %124 
					                                       f32_3 %149 = OpFMul %147 %148 
					                                                      OpStore %145 %149 
					                                       f32_3 %151 = OpLoad %124 
					                                       f32_3 %152 = OpLoad %72 
					                                       f32_3 %153 = OpFAdd %151 %152 
					                                                      OpStore %150 %153 
					                                       f32_3 %155 = OpLoad %104 
					                                       f32_3 %156 = OpLoad %145 
					                                       f32_3 %157 = OpExtInst %1 37 %155 %156 
					                                                      OpStore %154 %157 
					                                       f32_3 %158 = OpLoad %104 
					                                       f32_3 %159 = OpLoad %145 
					                                       f32_3 %160 = OpExtInst %1 40 %158 %159 
					                                                      OpStore %104 %160 
					                                       f32_3 %161 = OpLoad %116 
					                                       f32_3 %162 = OpLoad %116 
					                                       f32_3 %163 = OpFAdd %161 %162 
					                                                      OpStore %145 %163 
					                                       f32_3 %164 = OpLoad %150 
					                                       f32_3 %167 = OpFMul %164 %166 
					                                       f32_3 %168 = OpLoad %145 
					                                       f32_3 %169 = OpFNegate %168 
					                                       f32_3 %170 = OpFAdd %167 %169 
					                                                      OpStore %150 %170 
					                                       f32_3 %171 = OpLoad %150 
					                                       f32_3 %172 = OpFNegate %171 
					                                       f32_3 %175 = OpFMul %172 %174 
					                                       f32_3 %176 = OpLoad %116 
					                                       f32_3 %177 = OpFAdd %175 %176 
					                                                      OpStore %145 %177 
					                                       f32_3 %179 = OpLoad %145 
					                              Uniform f32_4* %181 = OpAccessChain %14 %180 
					                                       f32_4 %182 = OpLoad %181 
					                                       f32_3 %183 = OpVectorShuffle %182 %182 0 0 0 
					                                       f32_3 %184 = OpFMul %179 %183 
					                                       f32_4 %185 = OpLoad %178 
					                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
					                                                      OpStore %178 %186 
					                                       f32_4 %188 = OpLoad %178 
					                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
					                                       f32_3 %192 = OpFMul %189 %191 
					                                       f32_3 %193 = OpLoad %116 
					                                       f32_3 %194 = OpFAdd %192 %193 
					                                       f32_4 %195 = OpLoad %187 
					                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
					                                                      OpStore %187 %196 
					                                       f32_4 %197 = OpLoad %187 
					                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
					                                       f32_3 %200 = OpExtInst %1 40 %198 %199 
					                                       f32_4 %201 = OpLoad %187 
					                                       f32_4 %202 = OpVectorShuffle %201 %200 4 5 6 3 
					                                                      OpStore %187 %202 
					                                       f32_3 %203 = OpLoad %150 
					                                       f32_4 %204 = OpLoad %187 
					                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
					                                       f32_3 %206 = OpFAdd %203 %205 
					                                       f32_4 %207 = OpLoad %35 
					                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
					                                                      OpStore %35 %208 
					                                       f32_4 %209 = OpLoad %35 
					                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
					                                       f32_3 %213 = OpFMul %210 %212 
					                                       f32_4 %214 = OpLoad %35 
					                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
					                                                      OpStore %35 %215 
					                                Private f32* %216 = OpAccessChain %35 %88 
					                                         f32 %217 = OpLoad %216 
					                                Private f32* %218 = OpAccessChain %35 %18 
					                                         f32 %219 = OpLoad %218 
					                                         f32 %220 = OpExtInst %1 40 %217 %219 
					                                                      OpStore %87 %220 
					                                Private f32* %221 = OpAccessChain %35 %94 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpLoad %87 
					                                         f32 %224 = OpExtInst %1 40 %222 %223 
					                                                      OpStore %87 %224 
					                                         f32 %225 = OpLoad %87 
					                                         f32 %226 = OpFAdd %225 %30 
					                                                      OpStore %87 %226 
					                                         f32 %227 = OpLoad %87 
					                                         f32 %228 = OpFDiv %30 %227 
					                                                      OpStore %142 %228 
					                                         f32 %229 = OpLoad %142 
					                                       f32_3 %230 = OpCompositeConstruct %229 %229 %229 
					                                       f32_4 %231 = OpLoad %35 
					                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
					                                       f32_3 %233 = OpFMul %230 %232 
					                                       f32_4 %234 = OpLoad %35 
					                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
					                                                      OpStore %35 %235 
					                                       f32_4 %236 = OpLoad %35 
					                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
					                                         f32 %242 = OpDot %237 %241 
					                                                      OpStore %87 %242 
					                                Private f32* %244 = OpAccessChain %187 %88 
					                                         f32 %245 = OpLoad %244 
					                                Private f32* %246 = OpAccessChain %187 %18 
					                                         f32 %247 = OpLoad %246 
					                                         f32 %248 = OpExtInst %1 40 %245 %247 
					                                                      OpStore %243 %248 
					                                         f32 %249 = OpLoad %243 
					                                Private f32* %250 = OpAccessChain %187 %94 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpExtInst %1 40 %249 %251 
					                                                      OpStore %243 %252 
					                                         f32 %253 = OpLoad %243 
					                                         f32 %254 = OpFAdd %253 %30 
					                                                      OpStore %243 %254 
					                                         f32 %255 = OpLoad %243 
					                                         f32 %256 = OpFDiv %30 %255 
					                                Private f32* %257 = OpAccessChain %150 %94 
					                                                      OpStore %257 %256 
					                                       f32_3 %258 = OpLoad %150 
					                                       f32_3 %259 = OpVectorShuffle %258 %258 0 0 0 
					                                       f32_4 %260 = OpLoad %187 
					                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
					                                       f32_3 %262 = OpFMul %259 %261 
					                                       f32_4 %263 = OpLoad %35 
					                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
					                                                      OpStore %35 %264 
					                                       f32_4 %265 = OpLoad %35 
					                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
					                                         f32 %267 = OpDot %266 %241 
					                                                      OpStore %243 %267 
					                                         f32 %269 = OpLoad %243 
					                                         f32 %270 = OpFNegate %269 
					                                         f32 %271 = OpLoad %87 
					                                         f32 %272 = OpFAdd %270 %271 
					                                                      OpStore %268 %272 
					                                         f32 %273 = OpLoad %268 
					                                       f32_3 %274 = OpCompositeConstruct %273 %273 %273 
					                                       f32_3 %275 = OpExtInst %1 4 %274 
					                                       f32_3 %276 = OpFNegate %275 
					                                       f32_3 %277 = OpFMul %276 %166 
					                                       f32_3 %278 = OpLoad %154 
					                                       f32_3 %279 = OpFAdd %277 %278 
					                                                      OpStore %154 %279 
					                                         f32 %280 = OpLoad %268 
					                                       f32_3 %281 = OpCompositeConstruct %280 %280 %280 
					                                       f32_3 %282 = OpExtInst %1 4 %281 
					                                       f32_3 %283 = OpFMul %282 %166 
					                                       f32_3 %284 = OpLoad %104 
					                                       f32_3 %285 = OpFAdd %283 %284 
					                                                      OpStore %104 %285 
					                                       f32_3 %287 = OpLoad %154 
					                                       f32_3 %288 = OpLoad %104 
					                                       f32_3 %289 = OpFAdd %287 %288 
					                                                      OpStore %286 %289 
					                                       f32_3 %290 = OpLoad %154 
					                                       f32_3 %291 = OpFNegate %290 
					                                       f32_3 %292 = OpLoad %104 
					                                       f32_3 %293 = OpFAdd %291 %292 
					                                                      OpStore %154 %293 
					                                       f32_3 %294 = OpLoad %154 
					                                       f32_3 %296 = OpFMul %294 %295 
					                                                      OpStore %154 %296 
					                                       f32_3 %298 = OpLoad %286 
					                                       f32_3 %299 = OpFMul %298 %295 
					                                       f32_4 %300 = OpLoad %297 
					                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
					                                                      OpStore %297 %301 
					                         read_only Texture2D %304 = OpLoad %303 
					                                     sampler %306 = OpLoad %305 
					                  read_only Texture2DSampled %307 = OpSampledImage %304 %306 
					                                       f32_4 %308 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %309 = OpVectorShuffle %308 %308 2 3 
					                                       f32_4 %310 = OpImageSampleImplicitLod %307 %309 
					                                       f32_2 %311 = OpVectorShuffle %310 %310 0 1 
					                                       f32_4 %312 = OpLoad %302 
					                                       f32_4 %313 = OpVectorShuffle %312 %311 4 5 2 3 
					                                                      OpStore %302 %313 
					                                       f32_4 %315 = OpLoad %302 
					                                       f32_2 %316 = OpVectorShuffle %315 %315 0 1 
					                                       f32_2 %317 = OpFNegate %316 
					                                       f32_4 %318 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %319 = OpVectorShuffle %318 %318 2 3 
					                                       f32_2 %320 = OpFAdd %317 %319 
					                                                      OpStore %314 %320 
					                                       f32_4 %321 = OpLoad %302 
					                                       f32_2 %322 = OpVectorShuffle %321 %321 0 1 
					                                       f32_4 %323 = OpLoad %302 
					                                       f32_2 %324 = OpVectorShuffle %323 %323 0 1 
					                                         f32 %325 = OpDot %322 %324 
					                                                      OpStore %268 %325 
					                                         f32 %326 = OpLoad %268 
					                                         f32 %327 = OpExtInst %1 31 %326 
					                                                      OpStore %268 %327 
					                         read_only Texture2D %329 = OpLoad %328 
					                                     sampler %331 = OpLoad %330 
					                  read_only Texture2DSampled %332 = OpSampledImage %329 %331 
					                                       f32_2 %333 = OpLoad %314 
					                                       f32_4 %334 = OpImageSampleImplicitLod %332 %333 
					                                                      OpStore %302 %334 
					                                Private f32* %336 = OpAccessChain %302 %88 
					                                         f32 %337 = OpLoad %336 
					                                Private f32* %338 = OpAccessChain %302 %18 
					                                         f32 %339 = OpLoad %338 
					                                         f32 %340 = OpExtInst %1 40 %337 %339 
					                                                      OpStore %335 %340 
					                                Private f32* %341 = OpAccessChain %302 %94 
					                                         f32 %342 = OpLoad %341 
					                                         f32 %343 = OpLoad %335 
					                                         f32 %344 = OpExtInst %1 40 %342 %343 
					                                                      OpStore %335 %344 
					                                         f32 %345 = OpLoad %335 
					                                         f32 %346 = OpFAdd %345 %30 
					                                                      OpStore %335 %346 
					                                         f32 %347 = OpLoad %335 
					                                         f32 %348 = OpFDiv %30 %347 
					                                Private f32* %349 = OpAccessChain %286 %94 
					                                                      OpStore %349 %348 
					                                       f32_4 %350 = OpLoad %302 
					                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
					                                       f32_3 %352 = OpLoad %286 
					                                       f32_3 %353 = OpVectorShuffle %352 %352 0 0 0 
					                                       f32_3 %354 = OpFMul %351 %353 
					                                       f32_4 %355 = OpLoad %297 
					                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
					                                       f32_3 %357 = OpFNegate %356 
					                                       f32_3 %358 = OpFAdd %354 %357 
					                                       f32_4 %359 = OpLoad %178 
					                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
					                                                      OpStore %178 %360 
					                                       f32_4 %361 = OpLoad %302 
					                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
					                                       f32_3 %363 = OpLoad %286 
					                                       f32_3 %364 = OpVectorShuffle %363 %363 0 0 0 
					                                       f32_3 %365 = OpFMul %362 %364 
					                                       f32_4 %366 = OpLoad %187 
					                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
					                                                      OpStore %187 %367 
					                                Private f32* %369 = OpAccessChain %302 %368 
					                                         f32 %370 = OpLoad %369 
					                                Private f32* %371 = OpAccessChain %297 %368 
					                                                      OpStore %371 %370 
					                                       f32_4 %373 = OpLoad %178 
					                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
					                                       f32_3 %375 = OpLoad %154 
					                                       f32_3 %376 = OpFDiv %374 %375 
					                                                      OpStore %372 %376 
					                                Private f32* %378 = OpAccessChain %372 %88 
					                                         f32 %379 = OpLoad %378 
					                                         f32 %380 = OpExtInst %1 4 %379 
					                                Private f32* %381 = OpAccessChain %372 %18 
					                                         f32 %382 = OpLoad %381 
					                                         f32 %383 = OpExtInst %1 4 %382 
					                                         f32 %384 = OpExtInst %1 40 %380 %383 
					                                                      OpStore %377 %384 
					                                         f32 %385 = OpLoad %377 
					                                Private f32* %386 = OpAccessChain %372 %94 
					                                         f32 %387 = OpLoad %386 
					                                         f32 %388 = OpExtInst %1 4 %387 
					                                         f32 %389 = OpExtInst %1 40 %385 %388 
					                                Private f32* %390 = OpAccessChain %372 %94 
					                                                      OpStore %390 %389 
					                                Private f32* %391 = OpAccessChain %178 %368 
					                                                      OpStore %391 %22 
					                                       f32_4 %393 = OpLoad %178 
					                                       f32_3 %394 = OpLoad %372 
					                                       f32_4 %395 = OpVectorShuffle %394 %394 0 0 0 0 
					                                       f32_4 %396 = OpFDiv %393 %395 
					                                                      OpStore %392 %396 
					                                Private f32* %398 = OpAccessChain %372 %94 
					                                         f32 %399 = OpLoad %398 
					                                        bool %400 = OpFOrdLessThan %30 %399 
					                                                      OpStore %397 %400 
					                                       f32_4 %401 = OpLoad %297 
					                                       f32_4 %402 = OpLoad %392 
					                                       f32_4 %403 = OpFAdd %401 %402 
					                                                      OpStore %392 %403 
					                                Private f32* %404 = OpAccessChain %297 %368 
					                                         f32 %405 = OpLoad %404 
					                                Private f32* %406 = OpAccessChain %187 %368 
					                                                      OpStore %406 %405 
					                                        bool %407 = OpLoad %397 
					                                       f32_4 %408 = OpLoad %392 
					                                       f32_4 %409 = OpLoad %187 
					                                      bool_4 %411 = OpCompositeConstruct %407 %407 %407 %407 
					                                       f32_4 %412 = OpSelect %411 %408 %409 
					                                                      OpStore %297 %412 
					                                Uniform f32* %413 = OpAccessChain %14 %16 %88 
					                                         f32 %414 = OpLoad %413 
					                                         f32 %415 = OpFNegate %414 
					                                         f32 %417 = OpFMul %415 %416 
					                                         f32 %418 = OpLoad %268 
					                                         f32 %419 = OpFAdd %417 %418 
					                                Private f32* %420 = OpAccessChain %372 %94 
					                                                      OpStore %420 %419 
					                                         f32 %421 = OpLoad %268 
					                                Uniform f32* %423 = OpAccessChain %14 %422 %88 
					                                         f32 %424 = OpLoad %423 
					                                         f32 %425 = OpFMul %421 %424 
					                                                      OpStore %377 %425 
					                                Uniform f32* %427 = OpAccessChain %14 %16 %88 
					                                         f32 %428 = OpLoad %427 
					                                         f32 %430 = OpFMul %428 %429 
					                                                      OpStore %426 %430 
					                                         f32 %431 = OpLoad %426 
					                                         f32 %432 = OpFDiv %30 %431 
					                                                      OpStore %426 %432 
					                                         f32 %433 = OpLoad %426 
					                                Private f32* %434 = OpAccessChain %372 %94 
					                                         f32 %435 = OpLoad %434 
					                                         f32 %436 = OpFMul %433 %435 
					                                Private f32* %437 = OpAccessChain %372 %94 
					                                                      OpStore %437 %436 
					                                Private f32* %438 = OpAccessChain %372 %94 
					                                         f32 %439 = OpLoad %438 
					                                         f32 %440 = OpExtInst %1 43 %439 %22 %30 
					                                Private f32* %441 = OpAccessChain %372 %94 
					                                                      OpStore %441 %440 
					                                Private f32* %442 = OpAccessChain %372 %94 
					                                         f32 %443 = OpLoad %442 
					                                         f32 %445 = OpFMul %443 %444 
					                                         f32 %447 = OpFAdd %445 %446 
					                                                      OpStore %426 %447 
					                                Private f32* %448 = OpAccessChain %372 %94 
					                                         f32 %449 = OpLoad %448 
					                                Private f32* %450 = OpAccessChain %372 %94 
					                                         f32 %451 = OpLoad %450 
					                                         f32 %452 = OpFMul %449 %451 
					                                Private f32* %453 = OpAccessChain %372 %94 
					                                                      OpStore %453 %452 
					                                Private f32* %454 = OpAccessChain %372 %94 
					                                         f32 %455 = OpLoad %454 
					                                         f32 %456 = OpLoad %426 
					                                         f32 %457 = OpFMul %455 %456 
					                                Private f32* %458 = OpAccessChain %372 %94 
					                                                      OpStore %458 %457 
					                                Private f32* %459 = OpAccessChain %372 %94 
					                                         f32 %460 = OpLoad %459 
					                                         f32 %461 = OpExtInst %1 37 %460 %30 
					                                Private f32* %462 = OpAccessChain %35 %368 
					                                                      OpStore %462 %461 
					                                       f32_4 %463 = OpLoad %35 
					                                       f32_4 %464 = OpFNegate %463 
					                                       f32_4 %465 = OpLoad %297 
					                                       f32_4 %466 = OpFAdd %464 %465 
					                                                      OpStore %297 %466 
					                                Uniform f32* %467 = OpAccessChain %14 %422 %94 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %469 = OpFNegate %468 
					                                Uniform f32* %470 = OpAccessChain %14 %422 %18 
					                                         f32 %471 = OpLoad %470 
					                                         f32 %472 = OpFAdd %469 %471 
					                                Private f32* %473 = OpAccessChain %372 %94 
					                                                      OpStore %473 %472 
					                                         f32 %474 = OpLoad %377 
					                                Private f32* %475 = OpAccessChain %372 %94 
					                                         f32 %476 = OpLoad %475 
					                                         f32 %477 = OpFMul %474 %476 
					                                Uniform f32* %478 = OpAccessChain %14 %422 %94 
					                                         f32 %479 = OpLoad %478 
					                                         f32 %480 = OpFAdd %477 %479 
					                                Private f32* %481 = OpAccessChain %372 %94 
					                                                      OpStore %481 %480 
					                                Private f32* %482 = OpAccessChain %372 %94 
					                                         f32 %483 = OpLoad %482 
					                                Uniform f32* %484 = OpAccessChain %14 %422 %18 
					                                         f32 %485 = OpLoad %484 
					                                         f32 %486 = OpExtInst %1 40 %483 %485 
					                                Private f32* %487 = OpAccessChain %372 %94 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %372 %94 
					                                         f32 %489 = OpLoad %488 
					                                Uniform f32* %490 = OpAccessChain %14 %422 %94 
					                                         f32 %491 = OpLoad %490 
					                                         f32 %492 = OpExtInst %1 37 %489 %491 
					                                Private f32* %493 = OpAccessChain %372 %94 
					                                                      OpStore %493 %492 
					                                       f32_3 %494 = OpLoad %372 
					                                       f32_4 %495 = OpVectorShuffle %494 %494 0 0 0 0 
					                                       f32_4 %496 = OpLoad %297 
					                                       f32_4 %497 = OpFMul %495 %496 
					                                       f32_4 %498 = OpLoad %35 
					                                       f32_4 %499 = OpFAdd %497 %498 
					                                                      OpStore %35 %499 
					                                Private f32* %500 = OpAccessChain %35 %88 
					                                         f32 %501 = OpLoad %500 
					                                Private f32* %502 = OpAccessChain %35 %18 
					                                         f32 %503 = OpLoad %502 
					                                         f32 %504 = OpExtInst %1 40 %501 %503 
					                                                      OpStore %335 %504 
					                                Private f32* %505 = OpAccessChain %35 %94 
					                                         f32 %506 = OpLoad %505 
					                                         f32 %507 = OpLoad %335 
					                                         f32 %508 = OpExtInst %1 40 %506 %507 
					                                                      OpStore %335 %508 
					                                         f32 %509 = OpLoad %335 
					                                         f32 %510 = OpFNegate %509 
					                                         f32 %511 = OpFAdd %510 %30 
					                                                      OpStore %335 %511 
					                                         f32 %512 = OpLoad %335 
					                                         f32 %513 = OpFDiv %30 %512 
					                                Private f32* %514 = OpAccessChain %154 %94 
					                                                      OpStore %514 %513 
					                                       f32_4 %515 = OpLoad %35 
					                                       f32_3 %516 = OpVectorShuffle %515 %515 0 1 2 
					                                       f32_3 %517 = OpLoad %154 
					                                       f32_3 %518 = OpVectorShuffle %517 %517 0 0 0 
					                                       f32_3 %519 = OpFMul %516 %518 
					                                       f32_4 %520 = OpLoad %35 
					                                       f32_4 %521 = OpVectorShuffle %520 %519 4 5 6 3 
					                                                      OpStore %35 %521 
					                                       f32_4 %524 = OpLoad %35 
					                                       f32_3 %525 = OpVectorShuffle %524 %524 0 1 2 
					                                       f32_4 %526 = OpLoad %523 
					                                       f32_4 %527 = OpVectorShuffle %526 %525 4 5 6 3 
					                                                      OpStore %523 %527 
					                                       f32_4 %529 = OpLoad %35 
					                                                      OpStore %528 %529 
					                                Private f32* %530 = OpAccessChain %35 %368 
					                                         f32 %531 = OpLoad %530 
					                                         f32 %533 = OpFMul %531 %532 
					                                 Output f32* %535 = OpAccessChain %523 %368 
					                                                      OpStore %535 %533 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[3];
						vec2 _Jitter;
						vec4 _SharpenParameters;
						vec4 _FinalBlendParameters;
					};
					uniform  sampler2D _CameraMotionVectorsTexture;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _HistoryTex;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec2 u_xlat12;
					float u_xlat16_12;
					vec2 u_xlat14;
					float u_xlat18;
					float u_xlat16_18;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat6.xy = _Jitter.xy * vec2(1.0, -1.0);
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat6.xy : _Jitter.xy;
					    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat12.xy = (-_MainTex_TexelSize.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat12.xy);
					    u_xlat16_12 = max(u_xlat10_1.z, u_xlat10_1.y);
					    u_xlat16_12 = max(u_xlat16_12, u_xlat10_1.x);
					    u_xlat16_12 = u_xlat16_12 + 1.0;
					    u_xlat16_12 = float(1.0) / u_xlat16_12;
					    u_xlat16_2.xyz = vec3(u_xlat16_12) * u_xlat10_1.xyz;
					    u_xlat12.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat12.xy);
					    u_xlat16_18 = max(u_xlat10_0.z, u_xlat10_0.y);
					    u_xlat16_18 = max(u_xlat16_18, u_xlat10_0.x);
					    u_xlat16_18 = u_xlat16_18 + 1.0;
					    u_xlat16_18 = float(1.0) / u_xlat16_18;
					    u_xlat16_4.xyz = vec3(u_xlat16_18) * u_xlat10_0.xyz;
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_1.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
					    u_xlat16_2.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
					    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat10_3.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_4.xyz);
					    u_xlat16_4.xyz = (-u_xlat16_0.xyz) * vec3(0.166666999, 0.166666999, 0.166666999) + u_xlat10_3.xyz;
					    u_xlat4.xyz = u_xlat16_4.xyz * _SharpenParameters.xxx;
					    u_xlat3.xyz = u_xlat4.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_3.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat16_0.xyz + u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.142857, 0.142857, 0.142857);
					    u_xlat18 = max(u_xlat0.z, u_xlat0.y);
					    u_xlat18 = max(u_xlat18, u_xlat0.x);
					    u_xlat18 = u_xlat18 + 1.0;
					    u_xlat18 = float(1.0) / u_xlat18;
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat6.x = max(u_xlat3.z, u_xlat3.y);
					    u_xlat6.x = max(u_xlat6.x, u_xlat3.x);
					    u_xlat6.x = u_xlat6.x + 1.0;
					    u_xlat6.x = float(1.0) / u_xlat6.x;
					    u_xlat3.xyz = u_xlat6.xxx * u_xlat3.xyz;
					    u_xlat6.x = dot(u_xlat3.xyz, vec3(0.0396819152, 0.45802179, 0.00609653955));
					    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
					    u_xlat6.xyz = -abs(u_xlat0.xxx) * vec3(4.0, 4.0, 4.0) + u_xlat16_1.xyz;
					    u_xlat1.xyz = abs(u_xlat0.xxx) * vec3(4.0, 4.0, 4.0) + u_xlat16_2.xyz;
					    u_xlat2.xyz = u_xlat6.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = (-u_xlat6.xyz) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat10_2 = texture(_CameraMotionVectorsTexture, vs_TEXCOORD0.zw);
					    u_xlat14.xy = (-u_xlat10_2.xy) + vs_TEXCOORD0.zw;
					    u_xlat16_18 = dot(u_xlat10_2.xy, u_xlat10_2.xy);
					    u_xlat16_18 = sqrt(u_xlat16_18);
					    u_xlat10_2 = texture(_HistoryTex, u_xlat14.xy);
					    u_xlat16_4.x = max(u_xlat10_2.z, u_xlat10_2.y);
					    u_xlat16_4.x = max(u_xlat10_2.x, u_xlat16_4.x);
					    u_xlat16_4.x = u_xlat16_4.x + 1.0;
					    u_xlat16_4.x = float(1.0) / u_xlat16_4.x;
					    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat16_4.xxx + (-u_xlat1.xyz);
					    u_xlat4.xyz = u_xlat10_2.xyz * u_xlat16_4.xxx;
					    u_xlat1.w = u_xlat10_2.w;
					    u_xlat0.xyz = u_xlat5.xyz / u_xlat0.xyz;
					    u_xlat6.x = max(abs(u_xlat0.z), abs(u_xlat0.y));
					    u_xlat0.x = max(u_xlat6.x, abs(u_xlat0.x));
					    u_xlat5.w = 0.0;
					    u_xlat2 = u_xlat5 / u_xlat0.xxxx;
					    u_xlatb0 = 1.0<u_xlat0.x;
					    u_xlat2 = u_xlat1 + u_xlat2;
					    u_xlat4.w = u_xlat1.w;
					    u_xlat1 = (bool(u_xlatb0)) ? u_xlat2 : u_xlat4;
					    u_xlat0.x = (-_MainTex_TexelSize.z) * 0.00200000009 + u_xlat16_18;
					    u_xlat6.x = u_xlat16_18 * _FinalBlendParameters.z;
					    u_xlat12.x = _MainTex_TexelSize.z * 0.00150000001;
					    u_xlat12.x = float(1.0) / u_xlat12.x;
					    u_xlat0.x = u_xlat12.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat12.x;
					    u_xlat3.w = min(u_xlat0.x, 1.0);
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat0.x = (-_FinalBlendParameters.x) + _FinalBlendParameters.y;
					    u_xlat0.x = u_xlat6.x * u_xlat0.x + _FinalBlendParameters.x;
					    u_xlat0.x = max(u_xlat0.x, _FinalBlendParameters.y);
					    u_xlat0.x = min(u_xlat0.x, _FinalBlendParameters.x);
					    u_xlat0 = u_xlat0.xxxx * u_xlat1 + u_xlat3;
					    u_xlat1.x = max(u_xlat0.z, u_xlat0.y);
					    u_xlat1.x = max(u_xlat0.x, u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    SV_Target1.xyz = u_xlat0.xyz;
					    SV_Target0 = u_xlat0;
					    SV_Target1.w = u_xlat0.w * 0.850000024;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 366051
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#ifdef GL_ARB_shader_bit_encoding
					#extension GL_ARB_shader_bit_encoding : enable
					#endif
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 38
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %28 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate %9 RelaxedPrecision 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate %13 RelaxedPrecision 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %17 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 22 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %28 Location 28 
					                                             OpDecorate %29 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                     %14 = OpTypeSampler 
					                                     %15 = OpTypePointer UniformConstant %14 
					            UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                     %18 = OpTypeSampledImage %10 
					                                     %20 = OpTypeVector %6 2 
					                                     %21 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %24 = OpTypeVector %6 4 
					                                     %27 = OpTypePointer Output %24 
					                       Output f32_4* %28 = OpVariable Output 
					                                 f32 %32 = OpConstant 3,674022E-40 
					                                     %33 = OpTypeInt 32 0 
					                                 u32 %34 = OpConstant 3 
					                                     %35 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD0 
					                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                             OpStore %9 %26 
					                               f32_3 %29 = OpLoad %9 
					                               f32_4 %30 = OpLoad %28 
					                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
					                                             OpStore %28 %31 
					                         Output f32* %36 = OpAccessChain %28 %34 
					                                             OpStore %36 %32 
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
					
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    SV_Target0.w = 0.0;
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