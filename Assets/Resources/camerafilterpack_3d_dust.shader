Shader "CameraFilterPack/3D_Dust" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_ColorRGB ("_ColorRGB", Vector) = (1,1,1,1)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 20795
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[5];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
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
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
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
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD3.zw = u_xlat0.zw;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * u_xlat0.www + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD3.zw = u_xlat0.zw;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	float _Visualize;
					uniform 	float _Near;
					uniform 	float _Far;
					uniform 	float _FixDistance;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					int u_xlati2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					int u_xlati7;
					bool u_xlatb9;
					float u_xlat10;
					float u_xlat13;
					vec2 u_xlat14;
					bool u_xlatb14;
					bool u_xlatb16;
					float u_xlat17;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat7;
					    u_xlat7 = dot(vec2(_Near, _Far), vec2(4.0, 4.0));
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat7 = u_xlat7 + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat7 = float(1.0) / u_xlat7;
					    u_xlat0.x = u_xlat7 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat7;
					    u_xlatb14 = _Visualize==1.0;
					    if(u_xlatb14){
					        SV_Target0 = u_xlat0.xxxx;
					        return;
					    }
					    u_xlat14.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat14.xy);
					    u_xlat14.x = float(0.0);
					    u_xlat14.y = float(0.00400000019);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<100 ; u_xlati_loop_1++)
					    {
					        u_xlatb9 = u_xlat14.y<0.00200000009;
					        u_xlatb16 = 30.0<u_xlat14.x;
					        u_xlatb9 = u_xlatb16 || u_xlatb9;
					        if(u_xlatb9){
					            break;
					        }
					        u_xlat0.y = u_xlat14.y * 2.0 + u_xlat14.x;
					        u_xlat14.xy = u_xlat0.yx;
					    }
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat0.x = float(0.5);
					    u_xlati7 = int(0);
					    while(true){
					        u_xlatb21 = u_xlati7>=7;
					        if(u_xlatb21){break;}
					        u_xlat3.xyz = u_xlat0.xxx + vec3(20.0, -0.400000006, 2.0);
					        u_xlat21 = intBitsToFloat(int(0xFFC10000u)) / u_xlat3.x;
					        u_xlat4.xyz = vec3(u_xlat21);
					        u_xlat5.xyz = vec3(u_xlat21);
					        u_xlat3.x = float(1.39999998);
					        u_xlat24 = float(0.0);
					        u_xlat25 = 0.0;
					        while(true){
					            u_xlatb26 = 3.0<u_xlat25;
					            if(u_xlatb26){break;}
					            u_xlat6.xy = u_xlat5.xy + u_xlat5.xy;
					            u_xlat6.xyz = fract(u_xlat6.yxx);
					            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					            u_xlat6.xyz = u_xlat5.zzy * vec3(2.0, 2.0, 2.0) + abs(u_xlat6.xyz);
					            u_xlat6.xyz = fract(u_xlat6.xyz);
					            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					            u_xlat6.xyz = _Time.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + abs(u_xlat6.xyz);
					            u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
					            u_xlat3.x = u_xlat3.x * 1.5;
					            u_xlat4.xyz = u_xlat6.xyz * vec3(1.20000005, 1.20000005, 1.20000005);
					            u_xlat26 = fract(u_xlat4.y);
					            u_xlat26 = u_xlat26 + -0.5;
					            u_xlat26 = u_xlat6.x * 1.20000005 + abs(u_xlat26);
					            u_xlat26 = fract(u_xlat26);
					            u_xlat26 = u_xlat26 + -0.5;
					            u_xlat26 = u_xlat6.z * 1.20000005 + abs(u_xlat26);
					            u_xlat26 = fract(u_xlat26);
					            u_xlat26 = u_xlat26 + -0.5;
					            u_xlat26 = abs(u_xlat26) / u_xlat3.x;
					            u_xlat24 = u_xlat24 + u_xlat26;
					            u_xlat5.xyz = u_xlat5.xyz * vec3(1.79999995, 1.79999995, 1.79999995) + vec3(0.140000001, 0.140000001, 0.140000001);
					            u_xlat25 = u_xlat25 + 1.0;
					        }
					        u_xlat4.xyz = vec3(u_xlat21);
					        u_xlat5.xyz = vec3(u_xlat21);
					        u_xlat3.x = 1.39999998;
					        u_xlat25 = 0.0;
					        u_xlat26 = 0.0;
					        while(true){
					            u_xlatb6 = 3.0<u_xlat26;
					            if(u_xlatb6){break;}
					            u_xlat6.xy = u_xlat5.xy + u_xlat5.xy;
					            u_xlat6.xyz = fract(u_xlat6.yxx);
					            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					            u_xlat6.xyz = u_xlat5.zzy * vec3(2.0, 2.0, 2.0) + abs(u_xlat6.xyz);
					            u_xlat6.xyz = fract(u_xlat6.xyz);
					            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					            u_xlat6.xyz = _Time.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + abs(u_xlat6.xyz);
					            u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
					            u_xlat3.x = u_xlat3.x * 1.5;
					            u_xlat4.xyz = u_xlat6.xyz * vec3(1.20000005, 1.20000005, 1.20000005);
					            u_xlat13 = fract(u_xlat4.y);
					            u_xlat13 = u_xlat13 + -0.5;
					            u_xlat6.x = u_xlat6.x * 1.20000005 + abs(u_xlat13);
					            u_xlat6.x = fract(u_xlat6.x);
					            u_xlat6.x = u_xlat6.x + -0.5;
					            u_xlat6.x = u_xlat6.z * 1.20000005 + abs(u_xlat6.x);
					            u_xlat6.x = fract(u_xlat6.x);
					            u_xlat6.x = u_xlat6.x + -0.5;
					            u_xlat6.x = abs(u_xlat6.x) / u_xlat3.x;
					            u_xlat25 = u_xlat25 + u_xlat6.x;
					            u_xlat5.xyz = u_xlat5.xyz * vec3(1.79999995, 1.79999995, 1.79999995) + vec3(0.140000001, 0.140000001, 0.140000001);
					            u_xlat26 = u_xlat26 + 1.0;
					        }
					        u_xlat21 = u_xlat24 + (-u_xlat25);
					        u_xlat21 = u_xlat21 * 3.0;
					        u_xlat21 = max(u_xlat21, 0.100000001);
					        u_xlat21 = min(u_xlat21, 1.0);
					        u_xlat21 = (-u_xlat21) + 1.0;
					        u_xlat3.x = u_xlat0.x * 1.79999995;
					        u_xlat17 = u_xlat0.x * 0.75 + u_xlat3.z;
					        u_xlat17 = (-u_xlat3.y) + u_xlat17;
					        u_xlat10 = u_xlat14.x + (-u_xlat3.y);
					        u_xlat17 = float(1.0) / u_xlat17;
					        u_xlat10 = u_xlat17 * u_xlat10;
					        u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					        u_xlat17 = u_xlat10 * -2.0 + 3.0;
					        u_xlat10 = u_xlat10 * u_xlat10;
					        u_xlat10 = u_xlat10 * u_xlat17;
					        u_xlat10 = u_xlat10 * u_xlat24;
					        u_xlat10 = min(u_xlat10, 1.0);
					        u_xlat4.xyz = (-u_xlat2.xyz) + vec3(u_xlat21);
					        u_xlat2.xyz = vec3(u_xlat10) * u_xlat4.xyz + u_xlat2.xyz;
					        u_xlati7 = u_xlati7 + 1;
					        u_xlat0.x = u_xlat3.x;
					    }
					    u_xlat2.w = 1.0;
					    SV_Target0 = u_xlat10_1 + u_xlat2;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 171
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %11 %17 %85 %89 %90 %124 %134 %153 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                     OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                     OpDecorate vs_TEXCOORD0 Location 9 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %17 Location 17 
					                                                     OpDecorate %22 ArrayStride 22 
					                                                     OpDecorate %23 ArrayStride 23 
					                                                     OpMemberDecorate %24 0 Offset 24 
					                                                     OpMemberDecorate %24 1 Offset 24 
					                                                     OpMemberDecorate %24 2 Offset 24 
					                                                     OpDecorate %24 Block 
					                                                     OpDecorate %26 DescriptorSet 26 
					                                                     OpDecorate %26 Binding 26 
					                                                     OpMemberDecorate %83 0 BuiltIn 83 
					                                                     OpMemberDecorate %83 1 BuiltIn 83 
					                                                     OpMemberDecorate %83 2 BuiltIn 83 
					                                                     OpDecorate %83 Block 
					                                                     OpDecorate %89 Location 89 
					                                                     OpDecorate %90 Location 90 
					                                                     OpDecorate vs_TEXCOORD1 Location 124 
					                                                     OpDecorate vs_TEXCOORD2 Location 134 
					                                                     OpDecorate vs_TEXCOORD3 Location 153 
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
					                                             %24 = OpTypeStruct %13 %22 %23 
					                                             %25 = OpTypePointer Uniform %24 
					Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
					                                             %27 = OpTypeInt 32 1 
					                                         i32 %28 = OpConstant 1 
					                                             %29 = OpTypePointer Uniform %13 
					                                         i32 %33 = OpConstant 0 
					                                         i32 %41 = OpConstant 2 
					                                         i32 %50 = OpConstant 3 
					                              Private f32_4* %54 = OpVariable Private 
					                                         u32 %81 = OpConstant 1 
					                                             %82 = OpTypeArray %6 %81 
					                                             %83 = OpTypeStruct %13 %6 %82 
					                                             %84 = OpTypePointer Output %83 
					        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
					                                             %87 = OpTypePointer Output %13 
					                               Output f32_4* %89 = OpVariable Output 
					                                Input f32_4* %90 = OpVariable Input 
					                                             %92 = OpTypeVector %6 3 
					                                            %123 = OpTypePointer Output %92 
					                      Output f32_3* vs_TEXCOORD1 = OpVariable Output 
					                      Output f32_3* vs_TEXCOORD2 = OpVariable Output 
					                                            %137 = OpTypePointer Private %6 
					                                        u32 %140 = OpConstant 0 
					                                            %141 = OpTypePointer Uniform %6 
					                                        f32 %148 = OpConstant 3,674022E-40 
					                                      f32_3 %149 = OpConstantComposite %148 %148 %148 
					                      Output f32_4* vs_TEXCOORD3 = OpVariable Output 
					                                            %165 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_2 %12 = OpLoad %11 
					                                                     OpStore vs_TEXCOORD0 %12 
					                                       f32_4 %18 = OpLoad %17 
					                                       f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
					                              Uniform f32_4* %30 = OpAccessChain %26 %28 %28 
					                                       f32_4 %31 = OpLoad %30 
					                                       f32_4 %32 = OpFMul %19 %31 
					                                                     OpStore %15 %32 
					                              Uniform f32_4* %34 = OpAccessChain %26 %28 %33 
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
					                              Uniform f32_4* %57 = OpAccessChain %26 %41 %28 
					                                       f32_4 %58 = OpLoad %57 
					                                       f32_4 %59 = OpFMul %56 %58 
					                                                     OpStore %54 %59 
					                              Uniform f32_4* %60 = OpAccessChain %26 %41 %33 
					                                       f32_4 %61 = OpLoad %60 
					                                       f32_4 %62 = OpLoad %15 
					                                       f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
					                                       f32_4 %64 = OpFMul %61 %63 
					                                       f32_4 %65 = OpLoad %54 
					                                       f32_4 %66 = OpFAdd %64 %65 
					                                                     OpStore %54 %66 
					                              Uniform f32_4* %67 = OpAccessChain %26 %41 %41 
					                                       f32_4 %68 = OpLoad %67 
					                                       f32_4 %69 = OpLoad %15 
					                                       f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
					                                       f32_4 %71 = OpFMul %68 %70 
					                                       f32_4 %72 = OpLoad %54 
					                                       f32_4 %73 = OpFAdd %71 %72 
					                                                     OpStore %54 %73 
					                              Uniform f32_4* %74 = OpAccessChain %26 %41 %50 
					                                       f32_4 %75 = OpLoad %74 
					                                       f32_4 %76 = OpLoad %15 
					                                       f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
					                                       f32_4 %78 = OpFMul %75 %77 
					                                       f32_4 %79 = OpLoad %54 
					                                       f32_4 %80 = OpFAdd %78 %79 
					                                                     OpStore %15 %80 
					                                       f32_4 %86 = OpLoad %15 
					                               Output f32_4* %88 = OpAccessChain %85 %33 
					                                                     OpStore %88 %86 
					                                       f32_4 %91 = OpLoad %90 
					                                                     OpStore %89 %91 
					                                       f32_4 %93 = OpLoad %15 
					                                       f32_3 %94 = OpVectorShuffle %93 %93 1 1 1 
					                              Uniform f32_4* %95 = OpAccessChain %26 %28 %28 
					                                       f32_4 %96 = OpLoad %95 
					                                       f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
					                                       f32_3 %98 = OpFMul %94 %97 
					                                       f32_4 %99 = OpLoad %54 
					                                      f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
					                                                     OpStore %54 %100 
					                             Uniform f32_4* %101 = OpAccessChain %26 %28 %33 
					                                      f32_4 %102 = OpLoad %101 
					                                      f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
					                                      f32_4 %104 = OpLoad %15 
					                                      f32_3 %105 = OpVectorShuffle %104 %104 0 0 0 
					                                      f32_3 %106 = OpFMul %103 %105 
					                                      f32_4 %107 = OpLoad %54 
					                                      f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
					                                      f32_3 %109 = OpFAdd %106 %108 
					                                      f32_4 %110 = OpLoad %54 
					                                      f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
					                                                     OpStore %54 %111 
					                             Uniform f32_4* %112 = OpAccessChain %26 %28 %41 
					                                      f32_4 %113 = OpLoad %112 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
					                                      f32_4 %115 = OpLoad %15 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 2 2 2 
					                                      f32_3 %117 = OpFMul %114 %116 
					                                      f32_4 %118 = OpLoad %54 
					                                      f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
					                                      f32_3 %120 = OpFAdd %117 %119 
					                                      f32_4 %121 = OpLoad %54 
					                                      f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
					                                                     OpStore %54 %122 
					                             Uniform f32_4* %125 = OpAccessChain %26 %28 %50 
					                                      f32_4 %126 = OpLoad %125 
					                                      f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
					                                      f32_4 %128 = OpLoad %15 
					                                      f32_3 %129 = OpVectorShuffle %128 %128 3 3 3 
					                                      f32_3 %130 = OpFMul %127 %129 
					                                      f32_4 %131 = OpLoad %54 
					                                      f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                      f32_3 %133 = OpFAdd %130 %132 
					                                                     OpStore vs_TEXCOORD1 %133 
					                                      f32_4 %135 = OpLoad %15 
					                                      f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
					                                                     OpStore vs_TEXCOORD2 %136 
					                               Private f32* %138 = OpAccessChain %15 %81 
					                                        f32 %139 = OpLoad %138 
					                               Uniform f32* %142 = OpAccessChain %26 %33 %140 
					                                        f32 %143 = OpLoad %142 
					                                        f32 %144 = OpFMul %139 %143 
					                               Private f32* %145 = OpAccessChain %15 %81 
					                                                     OpStore %145 %144 
					                                      f32_4 %146 = OpLoad %15 
					                                      f32_3 %147 = OpVectorShuffle %146 %146 0 3 1 
					                                      f32_3 %150 = OpFMul %147 %149 
					                                      f32_4 %151 = OpLoad %54 
					                                      f32_4 %152 = OpVectorShuffle %151 %150 4 1 5 6 
					                                                     OpStore %54 %152 
					                                      f32_4 %154 = OpLoad %15 
					                                      f32_2 %155 = OpVectorShuffle %154 %154 2 3 
					                                      f32_4 %156 = OpLoad vs_TEXCOORD3 
					                                      f32_4 %157 = OpVectorShuffle %156 %155 0 1 4 5 
					                                                     OpStore vs_TEXCOORD3 %157 
					                                      f32_4 %158 = OpLoad %54 
					                                      f32_2 %159 = OpVectorShuffle %158 %158 2 2 
					                                      f32_4 %160 = OpLoad %54 
					                                      f32_2 %161 = OpVectorShuffle %160 %160 0 3 
					                                      f32_2 %162 = OpFAdd %159 %161 
					                                      f32_4 %163 = OpLoad vs_TEXCOORD3 
					                                      f32_4 %164 = OpVectorShuffle %163 %162 4 5 2 3 
					                                                     OpStore vs_TEXCOORD3 %164 
					                                Output f32* %166 = OpAccessChain %85 %33 %81 
					                                        f32 %167 = OpLoad %166 
					                                        f32 %168 = OpFNegate %167 
					                                Output f32* %169 = OpAccessChain %85 %33 %81 
					                                                     OpStore %169 %168 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 566
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %132 %140 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD3 Location 12 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpDecorate %24 DescriptorSet 24 
					                                                      OpDecorate %24 Binding 24 
					                                                      OpMemberDecorate %35 0 Offset 35 
					                                                      OpMemberDecorate %35 1 Offset 35 
					                                                      OpMemberDecorate %35 2 Offset 35 
					                                                      OpMemberDecorate %35 3 Offset 35 
					                                                      OpMemberDecorate %35 4 Offset 35 
					                                                      OpMemberDecorate %35 5 Offset 35 
					                                                      OpMemberDecorate %35 6 Offset 35 
					                                                      OpMemberDecorate %35 7 RelaxedPrecision 
					                                                      OpMemberDecorate %35 7 Offset 35 
					                                                      OpDecorate %35 Block 
					                                                      OpDecorate %37 DescriptorSet 37 
					                                                      OpDecorate %37 Binding 37 
					                                                      OpDecorate %132 Location 132 
					                                                      OpDecorate vs_TEXCOORD0 Location 140 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %177 DescriptorSet 177 
					                                                      OpDecorate %177 Binding 177 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %179 DescriptorSet 179 
					                                                      OpDecorate %179 Binding 179 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %561 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
					                                              %18 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %19 = OpTypePointer UniformConstant %18 
					         UniformConstant read_only Texture2D* %20 = OpVariable UniformConstant 
					                                              %22 = OpTypeSampler 
					                                              %23 = OpTypePointer UniformConstant %22 
					                     UniformConstant sampler* %24 = OpVariable UniformConstant 
					                                              %26 = OpTypeSampledImage %18 
					                                              %30 = OpTypeInt 32 0 
					                                          u32 %31 = OpConstant 0 
					                                              %33 = OpTypePointer Private %6 
					                                              %35 = OpTypeStruct %10 %10 %6 %6 %6 %6 %7 %10 
					                                              %36 = OpTypePointer Uniform %35 
					Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32_2; f32_4;}* %37 = OpVariable Uniform 
					                                              %38 = OpTypeInt 32 1 
					                                          i32 %39 = OpConstant 1 
					                                          u32 %40 = OpConstant 2 
					                                              %41 = OpTypePointer Uniform %6 
					                                          u32 %47 = OpConstant 3 
					                                          f32 %52 = OpConstant 3,674022E-40 
					                                 Private f32* %57 = OpVariable Private 
					                                          i32 %58 = OpConstant 5 
					                                          f32 %61 = OpConstant 3,674022E-40 
					                                          i32 %68 = OpConstant 3 
					                                          i32 %71 = OpConstant 4 
					                                          f32 %75 = OpConstant 3,674022E-40 
					                                        f32_2 %76 = OpConstantComposite %75 %75 
					                                          f32 %79 = OpConstant 3,674022E-40 
					                                         f32 %106 = OpConstant 3,674022E-40 
					                                         f32 %108 = OpConstant 3,674022E-40 
					                                             %121 = OpTypeBool 
					                                             %122 = OpTypePointer Private %121 
					                               Private bool* %123 = OpVariable Private 
					                                         i32 %124 = OpConstant 2 
					                                             %131 = OpTypePointer Output %10 
					                               Output f32_4* %132 = OpVariable Output 
					                                             %136 = OpTypeVector %6 3 
					                                             %137 = OpTypePointer Private %136 
					                              Private f32_3* %138 = OpVariable Private 
					                                             %139 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %142 = OpConstant 7 
					                                             %143 = OpTypePointer Uniform %10 
					                                         i32 %154 = OpConstant 6 
					                                         u32 %155 = OpConstant 1 
					                                Private f32* %159 = OpVariable Private 
					                                             %165 = OpTypePointer Function %6 
					                                             %175 = OpTypePointer Private %10 
					                              Private f32_4* %176 = OpVariable Private 
					        UniformConstant read_only Texture2D* %177 = OpVariable UniformConstant 
					                    UniformConstant sampler* %179 = OpVariable UniformConstant 
					                              Private f32_2* %185 = OpVariable Private 
					                                         f32 %187 = OpConstant 3,674022E-40 
					                                             %189 = OpTypePointer Function %38 
					                                         i32 %191 = OpConstant 0 
					                                         i32 %198 = OpConstant 100 
					                               Private bool* %200 = OpVariable Private 
					                                         f32 %203 = OpConstant 3,674022E-40 
					                               Private bool* %205 = OpVariable Private 
					                                         f32 %206 = OpConstant 3,674022E-40 
					                                         f32 %219 = OpConstant 3,674022E-40 
					                              Private f32_4* %229 = OpVariable Private 
					                                         f32 %233 = OpConstant 3,674022E-40 
					                                             %235 = OpTypePointer Private %38 
					                                Private i32* %236 = OpVariable Private 
					                                        bool %242 = OpConstantTrue 
					                               Private bool* %243 = OpVariable Private 
					                              Private f32_3* %250 = OpVariable Private 
					                                         f32 %253 = OpConstant 3,674022E-40 
					                                         f32 %254 = OpConstant 3,674022E-40 
					                                       f32_3 %255 = OpConstantComposite %253 %254 %219 
					                                         i32 %257 = OpConstant -4128768 
					                              Private f32_3* %262 = OpVariable Private 
					                              Private f32_3* %265 = OpVariable Private 
					                                         f32 %268 = OpConstant 3,674022E-40 
					                                Private f32* %270 = OpVariable Private 
					                                Private f32* %271 = OpVariable Private 
					                               Private bool* %277 = OpVariable Private 
					                              Private f32_3* %284 = OpVariable Private 
					                                         f32 %296 = OpConstant 3,674022E-40 
					                                       f32_3 %297 = OpConstantComposite %296 %296 %296 
					                                       f32_3 %301 = OpConstantComposite %219 %219 %219 
					                                         f32 %313 = OpConstant 3,674022E-40 
					                                       f32_3 %314 = OpConstantComposite %313 %313 %313 
					                                         f32 %324 = OpConstant 3,674022E-40 
					                                         f32 %328 = OpConstant 3,674022E-40 
					                                       f32_3 %329 = OpConstantComposite %328 %328 %328 
					                                Private f32* %331 = OpVariable Private 
					                                         f32 %366 = OpConstant 3,674022E-40 
					                                       f32_3 %367 = OpConstantComposite %366 %366 %366 
					                                         f32 %369 = OpConstant 3,674022E-40 
					                                       f32_3 %370 = OpConstantComposite %369 %369 %369 
					                               Private bool* %384 = OpVariable Private 
					                                Private f32* %429 = OpVariable Private 
					                                Private f32* %499 = OpVariable Private 
					                                         f32 %502 = OpConstant 3,674022E-40 
					                                Private f32* %512 = OpVariable Private 
					                                Private i32* %565 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %166 = OpVariable Function 
					                               Function i32* %190 = OpVariable Function 
					                                        f32_4 %13 = OpLoad vs_TEXCOORD3 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                        f32_4 %15 = OpLoad vs_TEXCOORD3 
					                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
					                                        f32_2 %17 = OpFDiv %14 %16 
					                                                      OpStore %9 %17 
					                          read_only Texture2D %21 = OpLoad %20 
					                                      sampler %25 = OpLoad %24 
					                   read_only Texture2DSampled %27 = OpSampledImage %21 %25 
					                                        f32_2 %28 = OpLoad %9 
					                                        f32_4 %29 = OpImageSampleImplicitLod %27 %28 
					                                          f32 %32 = OpCompositeExtract %29 0 
					                                 Private f32* %34 = OpAccessChain %9 %31 
					                                                      OpStore %34 %32 
					                                 Uniform f32* %42 = OpAccessChain %37 %39 %40 
					                                          f32 %43 = OpLoad %42 
					                                 Private f32* %44 = OpAccessChain %9 %31 
					                                          f32 %45 = OpLoad %44 
					                                          f32 %46 = OpFMul %43 %45 
					                                 Uniform f32* %48 = OpAccessChain %37 %39 %47 
					                                          f32 %49 = OpLoad %48 
					                                          f32 %50 = OpFAdd %46 %49 
					                                 Private f32* %51 = OpAccessChain %9 %31 
					                                                      OpStore %51 %50 
					                                 Private f32* %53 = OpAccessChain %9 %31 
					                                          f32 %54 = OpLoad %53 
					                                          f32 %55 = OpFDiv %52 %54 
					                                 Private f32* %56 = OpAccessChain %9 %31 
					                                                      OpStore %56 %55 
					                                 Uniform f32* %59 = OpAccessChain %37 %58 
					                                          f32 %60 = OpLoad %59 
					                                          f32 %62 = OpFMul %60 %61 
					                                                      OpStore %57 %62 
					                                 Private f32* %63 = OpAccessChain %9 %31 
					                                          f32 %64 = OpLoad %63 
					                                          f32 %65 = OpLoad %57 
					                                          f32 %66 = OpFDiv %64 %65 
					                                 Private f32* %67 = OpAccessChain %9 %31 
					                                                      OpStore %67 %66 
					                                 Uniform f32* %69 = OpAccessChain %37 %68 
					                                          f32 %70 = OpLoad %69 
					                                 Uniform f32* %72 = OpAccessChain %37 %71 
					                                          f32 %73 = OpLoad %72 
					                                        f32_2 %74 = OpCompositeConstruct %70 %73 
					                                          f32 %77 = OpDot %74 %76 
					                                                      OpStore %57 %77 
					                                          f32 %78 = OpLoad %57 
					                                          f32 %80 = OpExtInst %1 43 %78 %79 %52 
					                                                      OpStore %57 %80 
					                                          f32 %81 = OpLoad %57 
					                                 Uniform f32* %82 = OpAccessChain %37 %68 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %84 = OpFNegate %83 
					                                          f32 %85 = OpFAdd %81 %84 
					                                                      OpStore %57 %85 
					                                 Private f32* %86 = OpAccessChain %9 %31 
					                                          f32 %87 = OpLoad %86 
					                                 Uniform f32* %88 = OpAccessChain %37 %68 
					                                          f32 %89 = OpLoad %88 
					                                          f32 %90 = OpFNegate %89 
					                                          f32 %91 = OpFAdd %87 %90 
					                                 Private f32* %92 = OpAccessChain %9 %31 
					                                                      OpStore %92 %91 
					                                          f32 %93 = OpLoad %57 
					                                          f32 %94 = OpFDiv %52 %93 
					                                                      OpStore %57 %94 
					                                          f32 %95 = OpLoad %57 
					                                 Private f32* %96 = OpAccessChain %9 %31 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFMul %95 %97 
					                                 Private f32* %99 = OpAccessChain %9 %31 
					                                                      OpStore %99 %98 
					                                Private f32* %100 = OpAccessChain %9 %31 
					                                         f32 %101 = OpLoad %100 
					                                         f32 %102 = OpExtInst %1 43 %101 %79 %52 
					                                Private f32* %103 = OpAccessChain %9 %31 
					                                                      OpStore %103 %102 
					                                Private f32* %104 = OpAccessChain %9 %31 
					                                         f32 %105 = OpLoad %104 
					                                         f32 %107 = OpFMul %105 %106 
					                                         f32 %109 = OpFAdd %107 %108 
					                                                      OpStore %57 %109 
					                                Private f32* %110 = OpAccessChain %9 %31 
					                                         f32 %111 = OpLoad %110 
					                                Private f32* %112 = OpAccessChain %9 %31 
					                                         f32 %113 = OpLoad %112 
					                                         f32 %114 = OpFMul %111 %113 
					                                Private f32* %115 = OpAccessChain %9 %31 
					                                                      OpStore %115 %114 
					                                Private f32* %116 = OpAccessChain %9 %31 
					                                         f32 %117 = OpLoad %116 
					                                         f32 %118 = OpLoad %57 
					                                         f32 %119 = OpFMul %117 %118 
					                                Private f32* %120 = OpAccessChain %9 %31 
					                                                      OpStore %120 %119 
					                                Uniform f32* %125 = OpAccessChain %37 %124 
					                                         f32 %126 = OpLoad %125 
					                                        bool %127 = OpFOrdEqual %126 %52 
					                                                      OpStore %123 %127 
					                                        bool %128 = OpLoad %123 
					                                                      OpSelectionMerge %130 None 
					                                                      OpBranchConditional %128 %129 %130 
					                                             %129 = OpLabel 
					                                       f32_2 %133 = OpLoad %9 
					                                       f32_4 %134 = OpVectorShuffle %133 %133 0 0 0 0 
					                                                      OpStore %132 %134 
					                                                      OpReturn
					                                             %130 = OpLabel 
					                                       f32_2 %141 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %144 = OpAccessChain %37 %142 
					                                       f32_4 %145 = OpLoad %144 
					                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
					                                       f32_2 %147 = OpFMul %141 %146 
					                              Uniform f32_4* %148 = OpAccessChain %37 %142 
					                                       f32_4 %149 = OpLoad %148 
					                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
					                                       f32_2 %151 = OpFAdd %147 %150 
					                                       f32_3 %152 = OpLoad %138 
					                                       f32_3 %153 = OpVectorShuffle %152 %151 3 4 2 
					                                                      OpStore %138 %153 
					                                Uniform f32* %156 = OpAccessChain %37 %154 %155 
					                                         f32 %157 = OpLoad %156 
					                                        bool %158 = OpFOrdLessThan %157 %79 
					                                                      OpStore %123 %158 
					                                Private f32* %160 = OpAccessChain %138 %155 
					                                         f32 %161 = OpLoad %160 
					                                         f32 %162 = OpFNegate %161 
					                                         f32 %163 = OpFAdd %162 %52 
					                                                      OpStore %159 %163 
					                                        bool %164 = OpLoad %123 
					                                                      OpSelectionMerge %168 None 
					                                                      OpBranchConditional %164 %167 %170 
					                                             %167 = OpLabel 
					                                         f32 %169 = OpLoad %159 
					                                                      OpStore %166 %169 
					                                                      OpBranch %168 
					                                             %170 = OpLabel 
					                                Private f32* %171 = OpAccessChain %138 %155 
					                                         f32 %172 = OpLoad %171 
					                                                      OpStore %166 %172 
					                                                      OpBranch %168 
					                                             %168 = OpLabel 
					                                         f32 %173 = OpLoad %166 
					                                Private f32* %174 = OpAccessChain %138 %40 
					                                                      OpStore %174 %173 
					                         read_only Texture2D %178 = OpLoad %177 
					                                     sampler %180 = OpLoad %179 
					                  read_only Texture2DSampled %181 = OpSampledImage %178 %180 
					                                       f32_3 %182 = OpLoad %138 
					                                       f32_2 %183 = OpVectorShuffle %182 %182 0 2 
					                                       f32_4 %184 = OpImageSampleImplicitLod %181 %183 
					                                                      OpStore %176 %184 
					                                Private f32* %186 = OpAccessChain %185 %31 
					                                                      OpStore %186 %79 
					                                Private f32* %188 = OpAccessChain %185 %155 
					                                                      OpStore %188 %187 
					                                                      OpStore %190 %191 
					                                                      OpBranch %192 
					                                             %192 = OpLabel 
					                                                      OpLoopMerge %194 %195 None 
					                                                      OpBranch %196 
					                                             %196 = OpLabel 
					                                         i32 %197 = OpLoad %190 
					                                        bool %199 = OpSLessThan %197 %198 
					                                                      OpBranchConditional %199 %193 %194 
					                                             %193 = OpLabel 
					                                Private f32* %201 = OpAccessChain %185 %155 
					                                         f32 %202 = OpLoad %201 
					                                        bool %204 = OpFOrdLessThan %202 %203 
					                                                      OpStore %200 %204 
					                                Private f32* %207 = OpAccessChain %185 %31 
					                                         f32 %208 = OpLoad %207 
					                                        bool %209 = OpFOrdLessThan %206 %208 
					                                                      OpStore %205 %209 
					                                        bool %210 = OpLoad %205 
					                                        bool %211 = OpLoad %200 
					                                        bool %212 = OpLogicalOr %210 %211 
					                                                      OpStore %200 %212 
					                                        bool %213 = OpLoad %200 
					                                                      OpSelectionMerge %215 None 
					                                                      OpBranchConditional %213 %214 %215 
					                                             %214 = OpLabel 
					                                                      OpBranch %194 
					                                             %215 = OpLabel 
					                                Private f32* %217 = OpAccessChain %185 %155 
					                                         f32 %218 = OpLoad %217 
					                                         f32 %220 = OpFMul %218 %219 
					                                Private f32* %221 = OpAccessChain %185 %31 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpFAdd %220 %222 
					                                Private f32* %224 = OpAccessChain %9 %155 
					                                                      OpStore %224 %223 
					                                       f32_2 %225 = OpLoad %9 
					                                       f32_2 %226 = OpVectorShuffle %225 %225 1 0 
					                                                      OpStore %185 %226 
					                                                      OpBranch %195 
					                                             %195 = OpLabel 
					                                         i32 %227 = OpLoad %190 
					                                         i32 %228 = OpIAdd %227 %39 
					                                                      OpStore %190 %228 
					                                                      OpBranch %192 
					                                             %194 = OpLabel 
					                                Private f32* %230 = OpAccessChain %229 %31 
					                                                      OpStore %230 %79 
					                                Private f32* %231 = OpAccessChain %229 %155 
					                                                      OpStore %231 %79 
					                                Private f32* %232 = OpAccessChain %229 %40 
					                                                      OpStore %232 %79 
					                                Private f32* %234 = OpAccessChain %9 %31 
					                                                      OpStore %234 %233 
					                                                      OpStore %236 %191 
					                                                      OpBranch %237 
					                                             %237 = OpLabel 
					                                                      OpLoopMerge %239 %240 None 
					                                                      OpBranch %241 
					                                             %241 = OpLabel 
					                                                      OpBranchConditional %242 %238 %239 
					                                             %238 = OpLabel 
					                                         i32 %244 = OpLoad %236 
					                                        bool %245 = OpSGreaterThanEqual %244 %142 
					                                                      OpStore %243 %245 
					                                        bool %246 = OpLoad %243 
					                                                      OpSelectionMerge %248 None 
					                                                      OpBranchConditional %246 %247 %248 
					                                             %247 = OpLabel 
					                                                      OpBranch %239 
					                                             %248 = OpLabel 
					                                       f32_2 %251 = OpLoad %9 
					                                       f32_3 %252 = OpVectorShuffle %251 %251 0 0 0 
					                                       f32_3 %256 = OpFAdd %252 %255 
					                                                      OpStore %250 %256 
					                                         f32 %258 = OpBitcast %257 
					                                Private f32* %259 = OpAccessChain %250 %31 
					                                         f32 %260 = OpLoad %259 
					                                         f32 %261 = OpFDiv %258 %260 
					                                                      OpStore %159 %261 
					                                         f32 %263 = OpLoad %159 
					                                       f32_3 %264 = OpCompositeConstruct %263 %263 %263 
					                                                      OpStore %262 %264 
					                                         f32 %266 = OpLoad %159 
					                                       f32_3 %267 = OpCompositeConstruct %266 %266 %266 
					                                                      OpStore %265 %267 
					                                Private f32* %269 = OpAccessChain %250 %31 
					                                                      OpStore %269 %268 
					                                                      OpStore %270 %79 
					                                                      OpStore %271 %79 
					                                                      OpBranch %272 
					                                             %272 = OpLabel 
					                                                      OpLoopMerge %274 %275 None 
					                                                      OpBranch %276 
					                                             %276 = OpLabel 
					                                                      OpBranchConditional %242 %273 %274 
					                                             %273 = OpLabel 
					                                         f32 %278 = OpLoad %271 
					                                        bool %279 = OpFOrdLessThan %108 %278 
					                                                      OpStore %277 %279 
					                                        bool %280 = OpLoad %277 
					                                                      OpSelectionMerge %282 None 
					                                                      OpBranchConditional %280 %281 %282 
					                                             %281 = OpLabel 
					                                                      OpBranch %274 
					                                             %282 = OpLabel 
					                                       f32_3 %285 = OpLoad %265 
					                                       f32_2 %286 = OpVectorShuffle %285 %285 0 1 
					                                       f32_3 %287 = OpLoad %265 
					                                       f32_2 %288 = OpVectorShuffle %287 %287 0 1 
					                                       f32_2 %289 = OpFAdd %286 %288 
					                                       f32_3 %290 = OpLoad %284 
					                                       f32_3 %291 = OpVectorShuffle %290 %289 3 4 2 
					                                                      OpStore %284 %291 
					                                       f32_3 %292 = OpLoad %284 
					                                       f32_3 %293 = OpVectorShuffle %292 %292 1 0 0 
					                                       f32_3 %294 = OpExtInst %1 10 %293 
					                                                      OpStore %284 %294 
					                                       f32_3 %295 = OpLoad %284 
					                                       f32_3 %298 = OpFAdd %295 %297 
					                                                      OpStore %284 %298 
					                                       f32_3 %299 = OpLoad %265 
					                                       f32_3 %300 = OpVectorShuffle %299 %299 2 2 1 
					                                       f32_3 %302 = OpFMul %300 %301 
					                                       f32_3 %303 = OpLoad %284 
					                                       f32_3 %304 = OpExtInst %1 4 %303 
					                                       f32_3 %305 = OpFAdd %302 %304 
					                                                      OpStore %284 %305 
					                                       f32_3 %306 = OpLoad %284 
					                                       f32_3 %307 = OpExtInst %1 10 %306 
					                                                      OpStore %284 %307 
					                                       f32_3 %308 = OpLoad %284 
					                                       f32_3 %309 = OpFAdd %308 %297 
					                                                      OpStore %284 %309 
					                              Uniform f32_4* %310 = OpAccessChain %37 %191 
					                                       f32_4 %311 = OpLoad %310 
					                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
					                                       f32_3 %315 = OpFMul %312 %314 
					                                       f32_3 %316 = OpLoad %284 
					                                       f32_3 %317 = OpExtInst %1 4 %316 
					                                       f32_3 %318 = OpFAdd %315 %317 
					                                                      OpStore %284 %318 
					                                       f32_3 %319 = OpLoad %262 
					                                       f32_3 %320 = OpLoad %284 
					                                       f32_3 %321 = OpFAdd %319 %320 
					                                                      OpStore %284 %321 
					                                Private f32* %322 = OpAccessChain %250 %31 
					                                         f32 %323 = OpLoad %322 
					                                         f32 %325 = OpFMul %323 %324 
					                                Private f32* %326 = OpAccessChain %250 %31 
					                                                      OpStore %326 %325 
					                                       f32_3 %327 = OpLoad %284 
					                                       f32_3 %330 = OpFMul %327 %329 
					                                                      OpStore %262 %330 
					                                Private f32* %332 = OpAccessChain %262 %155 
					                                         f32 %333 = OpLoad %332 
					                                         f32 %334 = OpExtInst %1 10 %333 
					                                                      OpStore %331 %334 
					                                         f32 %335 = OpLoad %331 
					                                         f32 %336 = OpFAdd %335 %296 
					                                                      OpStore %331 %336 
					                                Private f32* %337 = OpAccessChain %284 %31 
					                                         f32 %338 = OpLoad %337 
					                                         f32 %339 = OpFMul %338 %328 
					                                         f32 %340 = OpLoad %331 
					                                         f32 %341 = OpExtInst %1 4 %340 
					                                         f32 %342 = OpFAdd %339 %341 
					                                                      OpStore %331 %342 
					                                         f32 %343 = OpLoad %331 
					                                         f32 %344 = OpExtInst %1 10 %343 
					                                                      OpStore %331 %344 
					                                         f32 %345 = OpLoad %331 
					                                         f32 %346 = OpFAdd %345 %296 
					                                                      OpStore %331 %346 
					                                Private f32* %347 = OpAccessChain %284 %40 
					                                         f32 %348 = OpLoad %347 
					                                         f32 %349 = OpFMul %348 %328 
					                                         f32 %350 = OpLoad %331 
					                                         f32 %351 = OpExtInst %1 4 %350 
					                                         f32 %352 = OpFAdd %349 %351 
					                                                      OpStore %331 %352 
					                                         f32 %353 = OpLoad %331 
					                                         f32 %354 = OpExtInst %1 10 %353 
					                                                      OpStore %331 %354 
					                                         f32 %355 = OpLoad %331 
					                                         f32 %356 = OpFAdd %355 %296 
					                                                      OpStore %331 %356 
					                                         f32 %357 = OpLoad %331 
					                                         f32 %358 = OpExtInst %1 4 %357 
					                                Private f32* %359 = OpAccessChain %250 %31 
					                                         f32 %360 = OpLoad %359 
					                                         f32 %361 = OpFDiv %358 %360 
					                                                      OpStore %331 %361 
					                                         f32 %362 = OpLoad %270 
					                                         f32 %363 = OpLoad %331 
					                                         f32 %364 = OpFAdd %362 %363 
					                                                      OpStore %270 %364 
					                                       f32_3 %365 = OpLoad %265 
					                                       f32_3 %368 = OpFMul %365 %367 
					                                       f32_3 %371 = OpFAdd %368 %370 
					                                                      OpStore %265 %371 
					                                         f32 %372 = OpLoad %271 
					                                         f32 %373 = OpFAdd %372 %52 
					                                                      OpStore %271 %373 
					                                                      OpBranch %275 
					                                             %275 = OpLabel 
					                                                      OpBranch %272 
					                                             %274 = OpLabel 
					                                         f32 %374 = OpLoad %159 
					                                       f32_3 %375 = OpCompositeConstruct %374 %374 %374 
					                                                      OpStore %262 %375 
					                                         f32 %376 = OpLoad %159 
					                                       f32_3 %377 = OpCompositeConstruct %376 %376 %376 
					                                                      OpStore %265 %377 
					                                Private f32* %378 = OpAccessChain %250 %31 
					                                                      OpStore %378 %268 
					                                                      OpStore %271 %79 
					                                                      OpStore %331 %79 
					                                                      OpBranch %379 
					                                             %379 = OpLabel 
					                                                      OpLoopMerge %381 %382 None 
					                                                      OpBranch %383 
					                                             %383 = OpLabel 
					                                                      OpBranchConditional %242 %380 %381 
					                                             %380 = OpLabel 
					                                         f32 %385 = OpLoad %331 
					                                        bool %386 = OpFOrdLessThan %108 %385 
					                                                      OpStore %384 %386 
					                                        bool %387 = OpLoad %384 
					                                                      OpSelectionMerge %389 None 
					                                                      OpBranchConditional %387 %388 %389 
					                                             %388 = OpLabel 
					                                                      OpBranch %381 
					                                             %389 = OpLabel 
					                                       f32_3 %391 = OpLoad %265 
					                                       f32_2 %392 = OpVectorShuffle %391 %391 0 1 
					                                       f32_3 %393 = OpLoad %265 
					                                       f32_2 %394 = OpVectorShuffle %393 %393 0 1 
					                                       f32_2 %395 = OpFAdd %392 %394 
					                                       f32_3 %396 = OpLoad %284 
					                                       f32_3 %397 = OpVectorShuffle %396 %395 3 4 2 
					                                                      OpStore %284 %397 
					                                       f32_3 %398 = OpLoad %284 
					                                       f32_3 %399 = OpVectorShuffle %398 %398 1 0 0 
					                                       f32_3 %400 = OpExtInst %1 10 %399 
					                                                      OpStore %284 %400 
					                                       f32_3 %401 = OpLoad %284 
					                                       f32_3 %402 = OpFAdd %401 %297 
					                                                      OpStore %284 %402 
					                                       f32_3 %403 = OpLoad %265 
					                                       f32_3 %404 = OpVectorShuffle %403 %403 2 2 1 
					                                       f32_3 %405 = OpFMul %404 %301 
					                                       f32_3 %406 = OpLoad %284 
					                                       f32_3 %407 = OpExtInst %1 4 %406 
					                                       f32_3 %408 = OpFAdd %405 %407 
					                                                      OpStore %284 %408 
					                                       f32_3 %409 = OpLoad %284 
					                                       f32_3 %410 = OpExtInst %1 10 %409 
					                                                      OpStore %284 %410 
					                                       f32_3 %411 = OpLoad %284 
					                                       f32_3 %412 = OpFAdd %411 %297 
					                                                      OpStore %284 %412 
					                              Uniform f32_4* %413 = OpAccessChain %37 %191 
					                                       f32_4 %414 = OpLoad %413 
					                                       f32_3 %415 = OpVectorShuffle %414 %414 0 1 2 
					                                       f32_3 %416 = OpFMul %415 %314 
					                                       f32_3 %417 = OpLoad %284 
					                                       f32_3 %418 = OpExtInst %1 4 %417 
					                                       f32_3 %419 = OpFAdd %416 %418 
					                                                      OpStore %284 %419 
					                                       f32_3 %420 = OpLoad %262 
					                                       f32_3 %421 = OpLoad %284 
					                                       f32_3 %422 = OpFAdd %420 %421 
					                                                      OpStore %284 %422 
					                                Private f32* %423 = OpAccessChain %250 %31 
					                                         f32 %424 = OpLoad %423 
					                                         f32 %425 = OpFMul %424 %324 
					                                Private f32* %426 = OpAccessChain %250 %31 
					                                                      OpStore %426 %425 
					                                       f32_3 %427 = OpLoad %284 
					                                       f32_3 %428 = OpFMul %427 %329 
					                                                      OpStore %262 %428 
					                                Private f32* %430 = OpAccessChain %262 %155 
					                                         f32 %431 = OpLoad %430 
					                                         f32 %432 = OpExtInst %1 10 %431 
					                                                      OpStore %429 %432 
					                                         f32 %433 = OpLoad %429 
					                                         f32 %434 = OpFAdd %433 %296 
					                                                      OpStore %429 %434 
					                                Private f32* %435 = OpAccessChain %284 %31 
					                                         f32 %436 = OpLoad %435 
					                                         f32 %437 = OpFMul %436 %328 
					                                         f32 %438 = OpLoad %429 
					                                         f32 %439 = OpExtInst %1 4 %438 
					                                         f32 %440 = OpFAdd %437 %439 
					                                Private f32* %441 = OpAccessChain %284 %31 
					                                                      OpStore %441 %440 
					                                Private f32* %442 = OpAccessChain %284 %31 
					                                         f32 %443 = OpLoad %442 
					                                         f32 %444 = OpExtInst %1 10 %443 
					                                Private f32* %445 = OpAccessChain %284 %31 
					                                                      OpStore %445 %444 
					                                Private f32* %446 = OpAccessChain %284 %31 
					                                         f32 %447 = OpLoad %446 
					                                         f32 %448 = OpFAdd %447 %296 
					                                Private f32* %449 = OpAccessChain %284 %31 
					                                                      OpStore %449 %448 
					                                Private f32* %450 = OpAccessChain %284 %40 
					                                         f32 %451 = OpLoad %450 
					                                         f32 %452 = OpFMul %451 %328 
					                                Private f32* %453 = OpAccessChain %284 %31 
					                                         f32 %454 = OpLoad %453 
					                                         f32 %455 = OpExtInst %1 4 %454 
					                                         f32 %456 = OpFAdd %452 %455 
					                                Private f32* %457 = OpAccessChain %284 %31 
					                                                      OpStore %457 %456 
					                                Private f32* %458 = OpAccessChain %284 %31 
					                                         f32 %459 = OpLoad %458 
					                                         f32 %460 = OpExtInst %1 10 %459 
					                                Private f32* %461 = OpAccessChain %284 %31 
					                                                      OpStore %461 %460 
					                                Private f32* %462 = OpAccessChain %284 %31 
					                                         f32 %463 = OpLoad %462 
					                                         f32 %464 = OpFAdd %463 %296 
					                                Private f32* %465 = OpAccessChain %284 %31 
					                                                      OpStore %465 %464 
					                                Private f32* %466 = OpAccessChain %284 %31 
					                                         f32 %467 = OpLoad %466 
					                                         f32 %468 = OpExtInst %1 4 %467 
					                                Private f32* %469 = OpAccessChain %250 %31 
					                                         f32 %470 = OpLoad %469 
					                                         f32 %471 = OpFDiv %468 %470 
					                                Private f32* %472 = OpAccessChain %284 %31 
					                                                      OpStore %472 %471 
					                                         f32 %473 = OpLoad %271 
					                                Private f32* %474 = OpAccessChain %284 %31 
					                                         f32 %475 = OpLoad %474 
					                                         f32 %476 = OpFAdd %473 %475 
					                                                      OpStore %271 %476 
					                                       f32_3 %477 = OpLoad %265 
					                                       f32_3 %478 = OpFMul %477 %367 
					                                       f32_3 %479 = OpFAdd %478 %370 
					                                                      OpStore %265 %479 
					                                         f32 %480 = OpLoad %331 
					                                         f32 %481 = OpFAdd %480 %52 
					                                                      OpStore %331 %481 
					                                                      OpBranch %382 
					                                             %382 = OpLabel 
					                                                      OpBranch %379 
					                                             %381 = OpLabel 
					                                         f32 %482 = OpLoad %270 
					                                         f32 %483 = OpLoad %271 
					                                         f32 %484 = OpFNegate %483 
					                                         f32 %485 = OpFAdd %482 %484 
					                                                      OpStore %159 %485 
					                                         f32 %486 = OpLoad %159 
					                                         f32 %487 = OpFMul %486 %108 
					                                                      OpStore %159 %487 
					                                         f32 %488 = OpLoad %159 
					                                         f32 %489 = OpExtInst %1 40 %488 %313 
					                                                      OpStore %159 %489 
					                                         f32 %490 = OpLoad %159 
					                                         f32 %491 = OpExtInst %1 37 %490 %52 
					                                                      OpStore %159 %491 
					                                         f32 %492 = OpLoad %159 
					                                         f32 %493 = OpFNegate %492 
					                                         f32 %494 = OpFAdd %493 %52 
					                                                      OpStore %159 %494 
					                                Private f32* %495 = OpAccessChain %9 %31 
					                                         f32 %496 = OpLoad %495 
					                                         f32 %497 = OpFMul %496 %366 
					                                Private f32* %498 = OpAccessChain %250 %31 
					                                                      OpStore %498 %497 
					                                Private f32* %500 = OpAccessChain %9 %31 
					                                         f32 %501 = OpLoad %500 
					                                         f32 %503 = OpFMul %501 %502 
					                                Private f32* %504 = OpAccessChain %250 %40 
					                                         f32 %505 = OpLoad %504 
					                                         f32 %506 = OpFAdd %503 %505 
					                                                      OpStore %499 %506 
					                                Private f32* %507 = OpAccessChain %250 %155 
					                                         f32 %508 = OpLoad %507 
					                                         f32 %509 = OpFNegate %508 
					                                         f32 %510 = OpLoad %499 
					                                         f32 %511 = OpFAdd %509 %510 
					                                                      OpStore %499 %511 
					                                Private f32* %513 = OpAccessChain %185 %31 
					                                         f32 %514 = OpLoad %513 
					                                Private f32* %515 = OpAccessChain %250 %155 
					                                         f32 %516 = OpLoad %515 
					                                         f32 %517 = OpFNegate %516 
					                                         f32 %518 = OpFAdd %514 %517 
					                                                      OpStore %512 %518 
					                                         f32 %519 = OpLoad %499 
					                                         f32 %520 = OpFDiv %52 %519 
					                                                      OpStore %499 %520 
					                                         f32 %521 = OpLoad %499 
					                                         f32 %522 = OpLoad %512 
					                                         f32 %523 = OpFMul %521 %522 
					                                                      OpStore %512 %523 
					                                         f32 %524 = OpLoad %512 
					                                         f32 %525 = OpExtInst %1 43 %524 %79 %52 
					                                                      OpStore %512 %525 
					                                         f32 %526 = OpLoad %512 
					                                         f32 %527 = OpFMul %526 %106 
					                                         f32 %528 = OpFAdd %527 %108 
					                                                      OpStore %499 %528 
					                                         f32 %529 = OpLoad %512 
					                                         f32 %530 = OpLoad %512 
					                                         f32 %531 = OpFMul %529 %530 
					                                                      OpStore %512 %531 
					                                         f32 %532 = OpLoad %512 
					                                         f32 %533 = OpLoad %499 
					                                         f32 %534 = OpFMul %532 %533 
					                                                      OpStore %512 %534 
					                                         f32 %535 = OpLoad %512 
					                                         f32 %536 = OpLoad %270 
					                                         f32 %537 = OpFMul %535 %536 
					                                                      OpStore %512 %537 
					                                         f32 %538 = OpLoad %512 
					                                         f32 %539 = OpExtInst %1 37 %538 %52 
					                                                      OpStore %512 %539 
					                                       f32_4 %540 = OpLoad %229 
					                                       f32_3 %541 = OpVectorShuffle %540 %540 0 1 2 
					                                       f32_3 %542 = OpFNegate %541 
					                                         f32 %543 = OpLoad %159 
					                                       f32_3 %544 = OpCompositeConstruct %543 %543 %543 
					                                       f32_3 %545 = OpFAdd %542 %544 
					                                                      OpStore %262 %545 
					                                         f32 %546 = OpLoad %512 
					                                       f32_3 %547 = OpCompositeConstruct %546 %546 %546 
					                                       f32_3 %548 = OpLoad %262 
					                                       f32_3 %549 = OpFMul %547 %548 
					                                       f32_4 %550 = OpLoad %229 
					                                       f32_3 %551 = OpVectorShuffle %550 %550 0 1 2 
					                                       f32_3 %552 = OpFAdd %549 %551 
					                                       f32_4 %553 = OpLoad %229 
					                                       f32_4 %554 = OpVectorShuffle %553 %552 4 5 6 3 
					                                                      OpStore %229 %554 
					                                         i32 %555 = OpLoad %236 
					                                         i32 %556 = OpIAdd %555 %39 
					                                                      OpStore %236 %556 
					                                Private f32* %557 = OpAccessChain %250 %31 
					                                         f32 %558 = OpLoad %557 
					                                Private f32* %559 = OpAccessChain %9 %31 
					                                                      OpStore %559 %558 
					                                                      OpBranch %240 
					                                             %240 = OpLabel 
					                                                      OpBranch %237 
					                                             %239 = OpLabel 
					                                Private f32* %560 = OpAccessChain %229 %47 
					                                                      OpStore %560 %52 
					                                       f32_4 %561 = OpLoad %176 
					                                       f32_4 %562 = OpLoad %229 
					                                       f32_4 %563 = OpFAdd %561 %562 
					                                                      OpStore %132 %563 
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
						float _Visualize;
						vec4 unused_0_2[2];
						float _Near;
						float _Far;
						float _FixDistance;
						vec2 _MainTex_TexelSize;
						vec4 unused_0_7[4];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[6];
						vec4 _ZBufferParams;
						vec4 unused_1_3;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					int u_xlati2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					bool u_xlatb6;
					float u_xlat7;
					int u_xlati7;
					bool u_xlatb9;
					float u_xlat10;
					float u_xlat13;
					vec2 u_xlat14;
					bool u_xlatb14;
					bool u_xlatb16;
					float u_xlat17;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat24;
					float u_xlat25;
					float u_xlat26;
					bool u_xlatb26;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat7;
					    u_xlat7 = dot(vec2(_Near, _Far), vec2(4.0, 4.0));
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat7 = u_xlat7 + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat7 = float(1.0) / u_xlat7;
					    u_xlat0.x = u_xlat7 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat7;
					    u_xlatb14 = _Visualize==1.0;
					    if(u_xlatb14){
					        SV_Target0 = u_xlat0.xxxx;
					        return;
					    //ENDIF
					    }
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb14 = _MainTex_TexelSize.xxxy.w<0.0;
					    u_xlat21 = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb14) ? u_xlat21 : u_xlat1.y;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xz);
					    u_xlat14.x = float(0.0);
					    u_xlat14.y = float(0.00400000019);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<100 ; u_xlati_loop_1++)
					    {
					        u_xlatb9 = u_xlat14.y<0.00200000009;
					        u_xlatb16 = 30.0<u_xlat14.x;
					        u_xlatb9 = u_xlatb16 || u_xlatb9;
					        if(u_xlatb9){
					            break;
					        //ENDIF
					        }
					        u_xlat0.y = u_xlat14.y * 2.0 + u_xlat14.x;
					        u_xlat14.xy = u_xlat0.yx;
					    }
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat0.x = float(0.5);
					    u_xlati7 = int(0);
					    while(true){
					        u_xlatb21 = u_xlati7>=7;
					        if(u_xlatb21){break;}
					        u_xlat3.xyz = u_xlat0.xxx + vec3(20.0, -0.400000006, 2.0);
					        u_xlat21 = intBitsToFloat(int(0xFFC10000u)) / u_xlat3.x;
					        u_xlat4.xyz = vec3(u_xlat21);
					        u_xlat5.xyz = vec3(u_xlat21);
					        u_xlat3.x = float(1.39999998);
					        u_xlat24 = float(0.0);
					        u_xlat25 = 0.0;
					        while(true){
					            u_xlatb26 = 3.0<u_xlat25;
					            if(u_xlatb26){break;}
					            u_xlat6.xy = u_xlat5.xy + u_xlat5.xy;
					            u_xlat6.xyz = fract(u_xlat6.yxx);
					            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					            u_xlat6.xyz = u_xlat5.zzy * vec3(2.0, 2.0, 2.0) + abs(u_xlat6.xyz);
					            u_xlat6.xyz = fract(u_xlat6.xyz);
					            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					            u_xlat6.xyz = _Time.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + abs(u_xlat6.xyz);
					            u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
					            u_xlat3.x = u_xlat3.x * 1.5;
					            u_xlat4.xyz = u_xlat6.xyz * vec3(1.20000005, 1.20000005, 1.20000005);
					            u_xlat26 = fract(u_xlat4.y);
					            u_xlat26 = u_xlat26 + -0.5;
					            u_xlat26 = u_xlat6.x * 1.20000005 + abs(u_xlat26);
					            u_xlat26 = fract(u_xlat26);
					            u_xlat26 = u_xlat26 + -0.5;
					            u_xlat26 = u_xlat6.z * 1.20000005 + abs(u_xlat26);
					            u_xlat26 = fract(u_xlat26);
					            u_xlat26 = u_xlat26 + -0.5;
					            u_xlat26 = abs(u_xlat26) / u_xlat3.x;
					            u_xlat24 = u_xlat24 + u_xlat26;
					            u_xlat5.xyz = u_xlat5.xyz * vec3(1.79999995, 1.79999995, 1.79999995) + vec3(0.140000001, 0.140000001, 0.140000001);
					            u_xlat25 = u_xlat25 + 1.0;
					        }
					        u_xlat4.xyz = vec3(u_xlat21);
					        u_xlat5.xyz = vec3(u_xlat21);
					        u_xlat3.x = 1.39999998;
					        u_xlat25 = 0.0;
					        u_xlat26 = 0.0;
					        while(true){
					            u_xlatb6 = 3.0<u_xlat26;
					            if(u_xlatb6){break;}
					            u_xlat6.xy = u_xlat5.xy + u_xlat5.xy;
					            u_xlat6.xyz = fract(u_xlat6.yxx);
					            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					            u_xlat6.xyz = u_xlat5.zzy * vec3(2.0, 2.0, 2.0) + abs(u_xlat6.xyz);
					            u_xlat6.xyz = fract(u_xlat6.xyz);
					            u_xlat6.xyz = u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
					            u_xlat6.xyz = _Time.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + abs(u_xlat6.xyz);
					            u_xlat6.xyz = u_xlat4.xyz + u_xlat6.xyz;
					            u_xlat3.x = u_xlat3.x * 1.5;
					            u_xlat4.xyz = u_xlat6.xyz * vec3(1.20000005, 1.20000005, 1.20000005);
					            u_xlat13 = fract(u_xlat4.y);
					            u_xlat13 = u_xlat13 + -0.5;
					            u_xlat6.x = u_xlat6.x * 1.20000005 + abs(u_xlat13);
					            u_xlat6.x = fract(u_xlat6.x);
					            u_xlat6.x = u_xlat6.x + -0.5;
					            u_xlat6.x = u_xlat6.z * 1.20000005 + abs(u_xlat6.x);
					            u_xlat6.x = fract(u_xlat6.x);
					            u_xlat6.x = u_xlat6.x + -0.5;
					            u_xlat6.x = abs(u_xlat6.x) / u_xlat3.x;
					            u_xlat25 = u_xlat25 + u_xlat6.x;
					            u_xlat5.xyz = u_xlat5.xyz * vec3(1.79999995, 1.79999995, 1.79999995) + vec3(0.140000001, 0.140000001, 0.140000001);
					            u_xlat26 = u_xlat26 + 1.0;
					        }
					        u_xlat21 = u_xlat24 + (-u_xlat25);
					        u_xlat21 = u_xlat21 * 3.0;
					        u_xlat21 = max(u_xlat21, 0.100000001);
					        u_xlat21 = min(u_xlat21, 1.0);
					        u_xlat21 = (-u_xlat21) + 1.0;
					        u_xlat3.x = u_xlat0.x * 1.79999995;
					        u_xlat17 = u_xlat0.x * 0.75 + u_xlat3.z;
					        u_xlat17 = (-u_xlat3.y) + u_xlat17;
					        u_xlat10 = u_xlat14.x + (-u_xlat3.y);
					        u_xlat17 = float(1.0) / u_xlat17;
					        u_xlat10 = u_xlat17 * u_xlat10;
					        u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					        u_xlat17 = u_xlat10 * -2.0 + 3.0;
					        u_xlat10 = u_xlat10 * u_xlat10;
					        u_xlat10 = u_xlat10 * u_xlat17;
					        u_xlat10 = u_xlat10 * u_xlat24;
					        u_xlat10 = min(u_xlat10, 1.0);
					        u_xlat4.xyz = (-u_xlat2.xyz) + vec3(u_xlat21);
					        u_xlat2.xyz = vec3(u_xlat10) * u_xlat4.xyz + u_xlat2.xyz;
					        u_xlati7 = u_xlati7 + 1;
					        u_xlat0.x = u_xlat3.x;
					    }
					    u_xlat2.w = 1.0;
					    SV_Target0 = u_xlat10_1 + u_xlat2;
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