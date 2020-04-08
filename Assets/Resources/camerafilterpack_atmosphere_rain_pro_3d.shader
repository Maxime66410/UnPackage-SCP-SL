Shader "CameraFilterPack/Atmosphere_Rain_Pro_3D" {
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
			GpuProgramID 12104
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
					out vec4 vs_TEXCOORD1;
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
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
					out vec4 vs_TEXCOORD1;
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
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	float _TimeX;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform 	float _Value7;
					uniform 	float _Value8;
					uniform 	float _Visualize;
					uniform 	float Drop_Near;
					uniform 	float Drop_Far;
					uniform 	float Drop_With_Obj;
					uniform 	float Drop_Floor_Fluid;
					uniform 	float Myst;
					uniform 	vec4 Myst_Color;
					uniform 	float _FixDistance;
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D Texture2;
					UNITY_LOCATION(2) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					vec4 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					float u_xlat7;
					float u_xlat16_7;
					vec2 u_xlat8;
					vec2 u_xlat9;
					float u_xlat16_9;
					vec2 u_xlat14;
					bool u_xlatb14;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat7;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat7 = (-Drop_Near) + Drop_Far;
					    u_xlat0.x = u_xlat0.x + (-Drop_Near);
					    u_xlat7 = float(1.0) / u_xlat7;
					    u_xlat0.x = u_xlat7 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1 = u_xlat0.xxxx * vec4(u_xlat7);
					    u_xlatb14 = _Visualize==1.0;
					    if(u_xlatb14){
					        SV_Target0 = u_xlat1;
					        return;
					    }
					    u_xlat14.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = (-u_xlat7) * u_xlat0.x + 1.0;
					    u_xlat1.xy = u_xlat0.xx * vec2(Drop_Floor_Fluid, Drop_With_Obj);
					    u_xlat7 = u_xlat1.x * (-_Value3) + _Value3;
					    u_xlat1.xz = u_xlat14.xy * vec2(vec2(_Value5, _Value5));
					    u_xlat2.x = _TimeX * _Value4;
					    u_xlat1.x = u_xlat7 * u_xlat1.z + u_xlat1.x;
					    u_xlat9.x = _Value2 * 0.25;
					    u_xlat3.x = u_xlat1.x * 3.0 + 0.100000001;
					    u_xlat4 = u_xlat2.xxxx * vec4(0.800000012, 0.00999999978, 1.20000005, 0.200000003);
					    u_xlat3.y = u_xlat1.z * 3.0 + u_xlat4.x;
					    u_xlat10_5 = texture(Texture2, u_xlat3.xy);
					    u_xlat1.x = u_xlat9.x * u_xlat10_5.x;
					    u_xlat5.x = u_xlat3.x * 0.649999976 + 0.100000001;
					    u_xlat5.y = u_xlat3.y * 0.649999976 + u_xlat2.x;
					    u_xlat10_3 = texture(Texture2, u_xlat5.xy);
					    u_xlat15 = u_xlat9.x * u_xlat10_3.x;
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat1.x = u_xlat1.x * 0.300000012 + u_xlat15;
					    u_xlat3.x = u_xlat5.x * 0.649999976 + 0.100000001;
					    u_xlat3.y = u_xlat5.y * 0.649999976 + u_xlat4.z;
					    u_xlat10_5 = texture(Texture2, u_xlat3.xy);
					    u_xlat15 = u_xlat9.x * u_xlat10_5.x;
					    u_xlat1.x = u_xlat15 * 0.699999988 + u_xlat1.x;
					    u_xlat5.x = u_xlat3.x * 0.5 + 0.100000001;
					    u_xlat5.y = u_xlat3.y * 0.5 + u_xlat4.z;
					    u_xlat10_3 = texture(Texture2, u_xlat5.xy);
					    u_xlat15 = u_xlat9.x * u_xlat10_3.x;
					    u_xlat1.x = u_xlat15 * 0.899999976 + u_xlat1.x;
					    u_xlat3.x = u_xlat5.x * 0.400000006 + 0.100000001;
					    u_xlat3.y = u_xlat5.y * 0.400000006 + u_xlat4.z;
					    u_xlat10_3 = texture(Texture2, u_xlat3.xy);
					    u_xlat15 = u_xlat9.x * u_xlat10_3.x;
					    u_xlat1.x = u_xlat15 * 0.899999976 + u_xlat1.x;
					    u_xlat1.x = u_xlat1.y * (-u_xlat1.x) + u_xlat1.x;
					    u_xlat10_3 = texture(_MainTex, u_xlat14.xy);
					    u_xlat8.x = u_xlat1.w * _Value6;
					    u_xlat8.xy = u_xlat1.xx * u_xlat8.xx + u_xlat14.xy;
					    u_xlat10_5 = texture(_MainTex, u_xlat8.xy);
					    u_xlat1 = u_xlat1.xxxx + u_xlat10_5;
					    u_xlat1 = (-u_xlat10_3) + u_xlat1;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat1 + u_xlat10_3;
					    u_xlat4.x = u_xlat14.x * 0.00100000005 + u_xlat4.w;
					    u_xlat10_4 = texture(Texture2, u_xlat4.xy);
					    u_xlat9.x = u_xlat9.x * u_xlat10_4.y;
					    u_xlat9.x = dot(u_xlat9.xx, vec2(vec2(_Value7, _Value7)));
					    u_xlat1 = u_xlat1 + u_xlat9.xxxx;
					    u_xlat4 = u_xlat14.xyxy * _ScreenResolution.xyxy + vec4(2.0, 4.0, 2.0, -4.0);
					    u_xlat4 = u_xlat4 / _ScreenResolution.xyxy;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_4 = (-u_xlat10_4) + u_xlat10_5;
					    u_xlat9.xy = u_xlat14.xy * _ScreenResolution.xy + vec2(-2.0, 4.0);
					    u_xlat9.xy = u_xlat9.xy / _ScreenResolution.xy;
					    u_xlat10_6 = texture(_MainTex, u_xlat9.xy);
					    u_xlat16_5 = u_xlat10_5 + (-u_xlat10_6);
					    u_xlat16_4 = abs(u_xlat16_4) + abs(u_xlat16_5);
					    u_xlat16_9 = dot(u_xlat16_4, u_xlat16_4);
					    u_xlat16_9 = sqrt(u_xlat16_9);
					    u_xlat4.xy = u_xlat14.xy + vec2(0.400000006, 0.400000006);
					    u_xlat14.x = u_xlat0.x * 16.0;
					    u_xlat14.x = floor(u_xlat14.x);
					    u_xlat14.x = u_xlat14.x * 0.0625;
					    u_xlat4.z = u_xlat4.x * 2.0;
					    u_xlat14.xy = u_xlat4.zy / u_xlat14.xx;
					    u_xlat16 = u_xlat2.x * 64.0;
					    u_xlat16 = floor(u_xlat16);
					    u_xlat14.xy = vec2(u_xlat16) * vec2(0.015625, 0.0625) + u_xlat14.xy;
					    u_xlat7 = u_xlat7 * u_xlat2.x;
					    u_xlat4.x = (-u_xlat7) * 0.550000012 + u_xlat14.x;
					    u_xlat4.y = (-u_xlat2.x) * 0.150000006 + u_xlat14.y;
					    u_xlat10_4 = texture(Texture2, u_xlat4.xy);
					    u_xlat16_7 = u_xlat16_9 * u_xlat10_4.z;
					    u_xlat7 = u_xlat16_7 * _Value8;
					    u_xlat1 = vec4(u_xlat7) * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
					    u_xlat1 = (-u_xlat10_3) + u_xlat1;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat1 + u_xlat10_3;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * Myst;
					    u_xlat2 = (-u_xlat1) + Myst_Color;
					    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat1;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 127
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %11 %17 %85 %89 %90 %109 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
					                                                     OpDecorate vs_TEXCOORD1 Location 109 
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
					                                             %92 = OpTypePointer Private %6 
					                                         u32 %95 = OpConstant 0 
					                                             %96 = OpTypePointer Uniform %6 
					                                            %101 = OpTypeVector %6 3 
					                                        f32 %104 = OpConstant 3,674022E-40 
					                                      f32_3 %105 = OpConstantComposite %104 %104 %104 
					                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                            %121 = OpTypePointer Output %6 
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
					                                Private f32* %93 = OpAccessChain %15 %81 
					                                         f32 %94 = OpLoad %93 
					                                Uniform f32* %97 = OpAccessChain %26 %33 %95 
					                                         f32 %98 = OpLoad %97 
					                                         f32 %99 = OpFMul %94 %98 
					                               Private f32* %100 = OpAccessChain %15 %81 
					                                                     OpStore %100 %99 
					                                      f32_4 %102 = OpLoad %15 
					                                      f32_3 %103 = OpVectorShuffle %102 %102 0 3 1 
					                                      f32_3 %106 = OpFMul %103 %105 
					                                      f32_4 %107 = OpLoad %54 
					                                      f32_4 %108 = OpVectorShuffle %107 %106 4 1 5 6 
					                                                     OpStore %54 %108 
					                                      f32_4 %110 = OpLoad %15 
					                                      f32_2 %111 = OpVectorShuffle %110 %110 2 3 
					                                      f32_4 %112 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %113 = OpVectorShuffle %112 %111 0 1 4 5 
					                                                     OpStore vs_TEXCOORD1 %113 
					                                      f32_4 %114 = OpLoad %54 
					                                      f32_2 %115 = OpVectorShuffle %114 %114 2 2 
					                                      f32_4 %116 = OpLoad %54 
					                                      f32_2 %117 = OpVectorShuffle %116 %116 0 3 
					                                      f32_2 %118 = OpFAdd %115 %117 
					                                      f32_4 %119 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
					                                                     OpStore vs_TEXCOORD1 %120 
					                                Output f32* %122 = OpAccessChain %85 %33 %81 
					                                        f32 %123 = OpLoad %122 
					                                        f32 %124 = OpFNegate %123 
					                                Output f32* %125 = OpAccessChain %85 %33 %81 
					                                                     OpStore %125 %124 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 717
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %136 %140 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD1 Location 12 
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
					                                                      OpMemberDecorate %35 7 Offset 35 
					                                                      OpMemberDecorate %35 8 Offset 35 
					                                                      OpMemberDecorate %35 9 Offset 35 
					                                                      OpMemberDecorate %35 10 Offset 35 
					                                                      OpMemberDecorate %35 11 Offset 35 
					                                                      OpMemberDecorate %35 12 Offset 35 
					                                                      OpMemberDecorate %35 13 Offset 35 
					                                                      OpMemberDecorate %35 14 Offset 35 
					                                                      OpMemberDecorate %35 15 Offset 35 
					                                                      OpMemberDecorate %35 16 Offset 35 
					                                                      OpMemberDecorate %35 17 Offset 35 
					                                                      OpMemberDecorate %35 18 Offset 35 
					                                                      OpMemberDecorate %35 19 Offset 35 
					                                                      OpMemberDecorate %35 20 RelaxedPrecision 
					                                                      OpMemberDecorate %35 20 Offset 35 
					                                                      OpDecorate %35 Block 
					                                                      OpDecorate %37 DescriptorSet 37 
					                                                      OpDecorate %37 Binding 37 
					                                                      OpDecorate %136 Location 136 
					                                                      OpDecorate vs_TEXCOORD0 Location 140 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %265 DescriptorSet 265 
					                                                      OpDecorate %265 Binding 265 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %267 DescriptorSet 267 
					                                                      OpDecorate %267 Binding 267 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %324 RelaxedPrecision 
					                                                      OpDecorate %325 RelaxedPrecision 
					                                                      OpDecorate %329 RelaxedPrecision 
					                                                      OpDecorate %331 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %353 RelaxedPrecision 
					                                                      OpDecorate %358 RelaxedPrecision 
					                                                      OpDecorate %360 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %383 RelaxedPrecision 
					                                                      OpDecorate %387 RelaxedPrecision 
					                                                      OpDecorate %389 RelaxedPrecision 
					                                                      OpDecorate %407 RelaxedPrecision 
					                                                      OpDecorate %408 RelaxedPrecision 
					                                                      OpDecorate %408 DescriptorSet 408 
					                                                      OpDecorate %408 Binding 408 
					                                                      OpDecorate %409 RelaxedPrecision 
					                                                      OpDecorate %410 RelaxedPrecision 
					                                                      OpDecorate %410 DescriptorSet 410 
					                                                      OpDecorate %410 Binding 410 
					                                                      OpDecorate %411 RelaxedPrecision 
					                                                      OpDecorate %433 RelaxedPrecision 
					                                                      OpDecorate %434 RelaxedPrecision 
					                                                      OpDecorate %435 RelaxedPrecision 
					                                                      OpDecorate %441 RelaxedPrecision 
					                                                      OpDecorate %442 RelaxedPrecision 
					                                                      OpDecorate %443 RelaxedPrecision 
					                                                      OpDecorate %444 RelaxedPrecision 
					                                                      OpDecorate %445 RelaxedPrecision 
					                                                      OpDecorate %465 RelaxedPrecision 
					                                                      OpDecorate %475 RelaxedPrecision 
					                                                      OpDecorate %476 RelaxedPrecision 
					                                                      OpDecorate %477 RelaxedPrecision 
					                                                      OpDecorate %482 RelaxedPrecision 
					                                                      OpDecorate %484 RelaxedPrecision 
					                                                      OpDecorate %519 RelaxedPrecision 
					                                                      OpDecorate %520 RelaxedPrecision 
					                                                      OpDecorate %525 RelaxedPrecision 
					                                                      OpDecorate %526 RelaxedPrecision 
					                                                      OpDecorate %527 RelaxedPrecision 
					                                                      OpDecorate %532 RelaxedPrecision 
					                                                      OpDecorate %533 RelaxedPrecision 
					                                                      OpDecorate %534 RelaxedPrecision 
					                                                      OpDecorate %535 RelaxedPrecision 
					                                                      OpDecorate %536 RelaxedPrecision 
					                                                      OpDecorate %558 RelaxedPrecision 
					                                                      OpDecorate %559 RelaxedPrecision 
					                                                      OpDecorate %560 RelaxedPrecision 
					                                                      OpDecorate %565 RelaxedPrecision 
					                                                      OpDecorate %566 RelaxedPrecision 
					                                                      OpDecorate %567 RelaxedPrecision 
					                                                      OpDecorate %568 RelaxedPrecision 
					                                                      OpDecorate %569 RelaxedPrecision 
					                                                      OpDecorate %570 RelaxedPrecision 
					                                                      OpDecorate %571 RelaxedPrecision 
					                                                      OpDecorate %572 RelaxedPrecision 
					                                                      OpDecorate %573 RelaxedPrecision 
					                                                      OpDecorate %574 RelaxedPrecision 
					                                                      OpDecorate %575 RelaxedPrecision 
					                                                      OpDecorate %576 RelaxedPrecision 
					                                                      OpDecorate %577 RelaxedPrecision 
					                                                      OpDecorate %578 RelaxedPrecision 
					                                                      OpDecorate %579 RelaxedPrecision 
					                                                      OpDecorate %580 RelaxedPrecision 
					                                                      OpDecorate %646 RelaxedPrecision 
					                                                      OpDecorate %647 RelaxedPrecision 
					                                                      OpDecorate %648 RelaxedPrecision 
					                                                      OpDecorate %653 RelaxedPrecision 
					                                                      OpDecorate %654 RelaxedPrecision 
					                                                      OpDecorate %655 RelaxedPrecision 
					                                                      OpDecorate %656 RelaxedPrecision 
					                                                      OpDecorate %657 RelaxedPrecision 
					                                                      OpDecorate %658 RelaxedPrecision 
					                                                      OpDecorate %670 RelaxedPrecision 
					                                                      OpDecorate %671 RelaxedPrecision 
					                                                      OpDecorate %690 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
					                                              %35 = OpTypeStruct %10 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %10 %6 %10 %7 %10 
					                                              %36 = OpTypePointer Uniform %35 
					Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4; f32; f32_4; f32_2; f32_4;}* %37 = OpVariable Uniform 
					                                              %38 = OpTypeInt 32 1 
					                                          i32 %39 = OpConstant 0 
					                                          u32 %40 = OpConstant 2 
					                                              %41 = OpTypePointer Uniform %6 
					                                          u32 %47 = OpConstant 3 
					                                          f32 %52 = OpConstant 3,674022E-40 
					                               Private f32_2* %57 = OpVariable Private 
					                                          i32 %58 = OpConstant 17 
					                                          f32 %61 = OpConstant 3,674022E-40 
					                                          f32 %72 = OpConstant 3,674022E-40 
					                                          i32 %75 = OpConstant 11 
					                                          i32 %79 = OpConstant 12 
					                                         f32 %107 = OpConstant 3,674022E-40 
					                                         f32 %109 = OpConstant 3,674022E-40 
					                                             %118 = OpTypePointer Private %10 
					                              Private f32_4* %119 = OpVariable Private 
					                                             %125 = OpTypeBool 
					                                             %126 = OpTypePointer Private %125 
					                               Private bool* %127 = OpVariable Private 
					                                         i32 %128 = OpConstant 10 
					                                             %135 = OpTypePointer Output %10 
					                               Output f32_4* %136 = OpVariable Output 
					                                             %139 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %142 = OpConstant 20 
					                                             %143 = OpTypePointer Uniform %10 
					                                         i32 %154 = OpConstant 19 
					                                         u32 %155 = OpConstant 1 
					                                Private f32* %159 = OpVariable Private 
					                                             %165 = OpTypePointer Function %6 
					                                         i32 %185 = OpConstant 14 
					                                         i32 %188 = OpConstant 13 
					                                         i32 %195 = OpConstant 4 
					                              Private f32_4* %204 = OpVariable Private 
					                                         i32 %207 = OpConstant 6 
					                                         i32 %219 = OpConstant 1 
					                                         i32 %222 = OpConstant 5 
					                                Private f32* %235 = OpVariable Private 
					                                         i32 %236 = OpConstant 3 
					                                         f32 %239 = OpConstant 3,674022E-40 
					                              Private f32_2* %241 = OpVariable Private 
					                                         f32 %245 = OpConstant 3,674022E-40 
					                              Private f32_4* %248 = OpVariable Private 
					                                         f32 %251 = OpConstant 3,674022E-40 
					                                         f32 %252 = OpConstant 3,674022E-40 
					                                         f32 %253 = OpConstant 3,674022E-40 
					                                         f32 %254 = OpConstant 3,674022E-40 
					                                       f32_4 %255 = OpConstantComposite %251 %252 %253 %254 
					                                Private f32* %264 = OpVariable Private 
					        UniformConstant read_only Texture2D* %265 = OpVariable UniformConstant 
					                    UniformConstant sampler* %267 = OpVariable UniformConstant 
					                              Private f32_4* %277 = OpVariable Private 
					                                         f32 %280 = OpConstant 3,674022E-40 
					                                Private f32* %290 = OpVariable Private 
					                                Private f32* %298 = OpVariable Private 
					                                         f32 %303 = OpConstant 3,674022E-40 
					                                         f32 %307 = OpConstant 3,674022E-40 
					                                         f32 %334 = OpConstant 3,674022E-40 
					                                         f32 %363 = OpConstant 3,674022E-40 
					                                         f32 %371 = OpConstant 3,674022E-40 
					                                Private f32* %397 = OpVariable Private 
					                              Private f32_4* %407 = OpVariable Private 
					        UniformConstant read_only Texture2D* %408 = OpVariable UniformConstant 
					                    UniformConstant sampler* %410 = OpVariable UniformConstant 
					                                Private f32* %416 = OpVariable Private 
					                                         i32 %419 = OpConstant 7 
					                              Private f32_4* %433 = OpVariable Private 
					                                         i32 %448 = OpConstant 2 
					                                         f32 %469 = OpConstant 3,674022E-40 
					                                Private f32* %475 = OpVariable Private 
					                                         i32 %488 = OpConstant 8 
					                                         i32 %504 = OpConstant 18 
					                                         f32 %509 = OpConstant 3,674022E-40 
					                                         f32 %510 = OpConstant 3,674022E-40 
					                                         f32 %511 = OpConstant 3,674022E-40 
					                                       f32_4 %512 = OpConstantComposite %509 %510 %509 %511 
					                              Private f32_4* %525 = OpVariable Private 
					                              Private f32_4* %532 = OpVariable Private 
					                                             %537 = OpTypeVector %6 3 
					                                             %538 = OpTypePointer Private %537 
					                              Private f32_3* %539 = OpVariable Private 
					                                       f32_2 %546 = OpConstantComposite %107 %510 
					                              Private f32_4* %558 = OpVariable Private 
					                              Private f32_4* %565 = OpVariable Private 
					                                Private f32* %575 = OpVariable Private 
					                                       f32_2 %583 = OpConstantComposite %371 %371 
					                                         f32 %589 = OpConstant 3,674022E-40 
					                                         f32 %596 = OpConstant 3,674022E-40 
					                                       f32_2 %597 = OpConstantComposite %509 %596 
					                                Private f32* %608 = OpVariable Private 
					                                         f32 %610 = OpConstant 3,674022E-40 
					                                         f32 %616 = OpConstant 3,674022E-40 
					                                       f32_2 %617 = OpConstantComposite %616 %596 
					                                         f32 %632 = OpConstant 3,674022E-40 
					                                         f32 %640 = OpConstant 3,674022E-40 
					                                Private f32* %646 = OpVariable Private 
					                                Private f32* %654 = OpVariable Private 
					                                         i32 %659 = OpConstant 9 
					                                       f32_4 %666 = OpConstantComposite %239 %239 %239 %239 
					                                         i32 %699 = OpConstant 15 
					                                         i32 %706 = OpConstant 16 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %166 = OpVariable Function 
					                                        f32_4 %13 = OpLoad vs_TEXCOORD1 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                        f32_4 %15 = OpLoad vs_TEXCOORD1 
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
					                                 Private f32* %63 = OpAccessChain %57 %31 
					                                                      OpStore %63 %62 
					                                 Private f32* %64 = OpAccessChain %9 %31 
					                                          f32 %65 = OpLoad %64 
					                                 Private f32* %66 = OpAccessChain %57 %31 
					                                          f32 %67 = OpLoad %66 
					                                          f32 %68 = OpFDiv %65 %67 
					                                 Private f32* %69 = OpAccessChain %9 %31 
					                                                      OpStore %69 %68 
					                                 Private f32* %70 = OpAccessChain %9 %31 
					                                          f32 %71 = OpLoad %70 
					                                          f32 %73 = OpExtInst %1 43 %71 %72 %52 
					                                 Private f32* %74 = OpAccessChain %9 %31 
					                                                      OpStore %74 %73 
					                                 Uniform f32* %76 = OpAccessChain %37 %75 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpFNegate %77 
					                                 Uniform f32* %80 = OpAccessChain %37 %79 
					                                          f32 %81 = OpLoad %80 
					                                          f32 %82 = OpFAdd %78 %81 
					                                 Private f32* %83 = OpAccessChain %57 %31 
					                                                      OpStore %83 %82 
					                                 Private f32* %84 = OpAccessChain %9 %31 
					                                          f32 %85 = OpLoad %84 
					                                 Uniform f32* %86 = OpAccessChain %37 %75 
					                                          f32 %87 = OpLoad %86 
					                                          f32 %88 = OpFNegate %87 
					                                          f32 %89 = OpFAdd %85 %88 
					                                 Private f32* %90 = OpAccessChain %9 %31 
					                                                      OpStore %90 %89 
					                                 Private f32* %91 = OpAccessChain %57 %31 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpFDiv %52 %92 
					                                 Private f32* %94 = OpAccessChain %57 %31 
					                                                      OpStore %94 %93 
					                                 Private f32* %95 = OpAccessChain %57 %31 
					                                          f32 %96 = OpLoad %95 
					                                 Private f32* %97 = OpAccessChain %9 %31 
					                                          f32 %98 = OpLoad %97 
					                                          f32 %99 = OpFMul %96 %98 
					                                Private f32* %100 = OpAccessChain %9 %31 
					                                                      OpStore %100 %99 
					                                Private f32* %101 = OpAccessChain %9 %31 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpExtInst %1 43 %102 %72 %52 
					                                Private f32* %104 = OpAccessChain %9 %31 
					                                                      OpStore %104 %103 
					                                Private f32* %105 = OpAccessChain %9 %31 
					                                         f32 %106 = OpLoad %105 
					                                         f32 %108 = OpFMul %106 %107 
					                                         f32 %110 = OpFAdd %108 %109 
					                                Private f32* %111 = OpAccessChain %57 %31 
					                                                      OpStore %111 %110 
					                                Private f32* %112 = OpAccessChain %9 %31 
					                                         f32 %113 = OpLoad %112 
					                                Private f32* %114 = OpAccessChain %9 %31 
					                                         f32 %115 = OpLoad %114 
					                                         f32 %116 = OpFMul %113 %115 
					                                Private f32* %117 = OpAccessChain %9 %31 
					                                                      OpStore %117 %116 
					                                       f32_2 %120 = OpLoad %9 
					                                       f32_4 %121 = OpVectorShuffle %120 %120 0 0 0 0 
					                                       f32_2 %122 = OpLoad %57 
					                                       f32_4 %123 = OpVectorShuffle %122 %122 0 0 0 0 
					                                       f32_4 %124 = OpFMul %121 %123 
					                                                      OpStore %119 %124 
					                                Uniform f32* %129 = OpAccessChain %37 %128 
					                                         f32 %130 = OpLoad %129 
					                                        bool %131 = OpFOrdEqual %130 %52 
					                                                      OpStore %127 %131 
					                                        bool %132 = OpLoad %127 
					                                                      OpSelectionMerge %134 None 
					                                                      OpBranchConditional %132 %133 %134 
					                                             %133 = OpLabel 
					                                       f32_4 %137 = OpLoad %119 
					                                                      OpStore %136 %137 
					                                                      OpReturn
					                                             %134 = OpLabel 
					                                       f32_2 %141 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %144 = OpAccessChain %37 %142 
					                                       f32_4 %145 = OpLoad %144 
					                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
					                                       f32_2 %147 = OpFMul %141 %146 
					                              Uniform f32_4* %148 = OpAccessChain %37 %142 
					                                       f32_4 %149 = OpLoad %148 
					                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
					                                       f32_2 %151 = OpFAdd %147 %150 
					                                       f32_4 %152 = OpLoad %119 
					                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 2 3 
					                                                      OpStore %119 %153 
					                                Uniform f32* %156 = OpAccessChain %37 %154 %155 
					                                         f32 %157 = OpLoad %156 
					                                        bool %158 = OpFOrdLessThan %157 %72 
					                                                      OpStore %127 %158 
					                                Private f32* %160 = OpAccessChain %119 %155 
					                                         f32 %161 = OpLoad %160 
					                                         f32 %162 = OpFNegate %161 
					                                         f32 %163 = OpFAdd %162 %52 
					                                                      OpStore %159 %163 
					                                        bool %164 = OpLoad %127 
					                                                      OpSelectionMerge %168 None 
					                                                      OpBranchConditional %164 %167 %170 
					                                             %167 = OpLabel 
					                                         f32 %169 = OpLoad %159 
					                                                      OpStore %166 %169 
					                                                      OpBranch %168 
					                                             %170 = OpLabel 
					                                Private f32* %171 = OpAccessChain %119 %155 
					                                         f32 %172 = OpLoad %171 
					                                                      OpStore %166 %172 
					                                                      OpBranch %168 
					                                             %168 = OpLabel 
					                                         f32 %173 = OpLoad %166 
					                                Private f32* %174 = OpAccessChain %119 %40 
					                                                      OpStore %174 %173 
					                                Private f32* %175 = OpAccessChain %57 %31 
					                                         f32 %176 = OpLoad %175 
					                                         f32 %177 = OpFNegate %176 
					                                Private f32* %178 = OpAccessChain %9 %31 
					                                         f32 %179 = OpLoad %178 
					                                         f32 %180 = OpFMul %177 %179 
					                                         f32 %181 = OpFAdd %180 %52 
					                                Private f32* %182 = OpAccessChain %9 %31 
					                                                      OpStore %182 %181 
					                                       f32_2 %183 = OpLoad %9 
					                                       f32_2 %184 = OpVectorShuffle %183 %183 0 0 
					                                Uniform f32* %186 = OpAccessChain %37 %185 
					                                         f32 %187 = OpLoad %186 
					                                Uniform f32* %189 = OpAccessChain %37 %188 
					                                         f32 %190 = OpLoad %189 
					                                       f32_2 %191 = OpCompositeConstruct %187 %190 
					                                       f32_2 %192 = OpFMul %184 %191 
					                                                      OpStore %57 %192 
					                                Private f32* %193 = OpAccessChain %57 %31 
					                                         f32 %194 = OpLoad %193 
					                                Uniform f32* %196 = OpAccessChain %37 %195 
					                                         f32 %197 = OpLoad %196 
					                                         f32 %198 = OpFNegate %197 
					                                         f32 %199 = OpFMul %194 %198 
					                                Uniform f32* %200 = OpAccessChain %37 %195 
					                                         f32 %201 = OpLoad %200 
					                                         f32 %202 = OpFAdd %199 %201 
					                                Private f32* %203 = OpAccessChain %57 %31 
					                                                      OpStore %203 %202 
					                                       f32_4 %205 = OpLoad %119 
					                                       f32_2 %206 = OpVectorShuffle %205 %205 0 2 
					                                Uniform f32* %208 = OpAccessChain %37 %207 
					                                         f32 %209 = OpLoad %208 
					                                Uniform f32* %210 = OpAccessChain %37 %207 
					                                         f32 %211 = OpLoad %210 
					                                       f32_2 %212 = OpCompositeConstruct %209 %211 
					                                         f32 %213 = OpCompositeExtract %212 0 
					                                         f32 %214 = OpCompositeExtract %212 1 
					                                       f32_2 %215 = OpCompositeConstruct %213 %214 
					                                       f32_2 %216 = OpFMul %206 %215 
					                                       f32_4 %217 = OpLoad %204 
					                                       f32_4 %218 = OpVectorShuffle %217 %216 4 5 2 3 
					                                                      OpStore %204 %218 
					                                Uniform f32* %220 = OpAccessChain %37 %219 
					                                         f32 %221 = OpLoad %220 
					                                Uniform f32* %223 = OpAccessChain %37 %222 
					                                         f32 %224 = OpLoad %223 
					                                         f32 %225 = OpFMul %221 %224 
					                                                      OpStore %159 %225 
					                                Private f32* %226 = OpAccessChain %57 %31 
					                                         f32 %227 = OpLoad %226 
					                                Private f32* %228 = OpAccessChain %204 %155 
					                                         f32 %229 = OpLoad %228 
					                                         f32 %230 = OpFMul %227 %229 
					                                Private f32* %231 = OpAccessChain %204 %31 
					                                         f32 %232 = OpLoad %231 
					                                         f32 %233 = OpFAdd %230 %232 
					                                Private f32* %234 = OpAccessChain %204 %31 
					                                                      OpStore %234 %233 
					                                Uniform f32* %237 = OpAccessChain %37 %236 
					                                         f32 %238 = OpLoad %237 
					                                         f32 %240 = OpFMul %238 %239 
					                                                      OpStore %235 %240 
					                                Private f32* %242 = OpAccessChain %204 %31 
					                                         f32 %243 = OpLoad %242 
					                                         f32 %244 = OpFMul %243 %109 
					                                         f32 %246 = OpFAdd %244 %245 
					                                Private f32* %247 = OpAccessChain %241 %31 
					                                                      OpStore %247 %246 
					                                         f32 %249 = OpLoad %159 
					                                       f32_4 %250 = OpCompositeConstruct %249 %249 %249 %249 
					                                       f32_4 %256 = OpFMul %250 %255 
					                                                      OpStore %248 %256 
					                                Private f32* %257 = OpAccessChain %204 %155 
					                                         f32 %258 = OpLoad %257 
					                                         f32 %259 = OpFMul %258 %109 
					                                Private f32* %260 = OpAccessChain %248 %31 
					                                         f32 %261 = OpLoad %260 
					                                         f32 %262 = OpFAdd %259 %261 
					                                Private f32* %263 = OpAccessChain %241 %155 
					                                                      OpStore %263 %262 
					                         read_only Texture2D %266 = OpLoad %265 
					                                     sampler %268 = OpLoad %267 
					                  read_only Texture2DSampled %269 = OpSampledImage %266 %268 
					                                       f32_2 %270 = OpLoad %241 
					                                       f32_4 %271 = OpImageSampleImplicitLod %269 %270 
					                                         f32 %272 = OpCompositeExtract %271 0 
					                                                      OpStore %264 %272 
					                                         f32 %273 = OpLoad %235 
					                                         f32 %274 = OpLoad %264 
					                                         f32 %275 = OpFMul %273 %274 
					                                Private f32* %276 = OpAccessChain %204 %31 
					                                                      OpStore %276 %275 
					                                Private f32* %278 = OpAccessChain %241 %31 
					                                         f32 %279 = OpLoad %278 
					                                         f32 %281 = OpFMul %279 %280 
					                                         f32 %282 = OpFAdd %281 %245 
					                                Private f32* %283 = OpAccessChain %277 %31 
					                                                      OpStore %283 %282 
					                                Private f32* %284 = OpAccessChain %241 %155 
					                                         f32 %285 = OpLoad %284 
					                                         f32 %286 = OpFMul %285 %280 
					                                         f32 %287 = OpLoad %159 
					                                         f32 %288 = OpFAdd %286 %287 
					                                Private f32* %289 = OpAccessChain %277 %155 
					                                                      OpStore %289 %288 
					                         read_only Texture2D %291 = OpLoad %265 
					                                     sampler %292 = OpLoad %267 
					                  read_only Texture2DSampled %293 = OpSampledImage %291 %292 
					                                       f32_4 %294 = OpLoad %277 
					                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
					                                       f32_4 %296 = OpImageSampleImplicitLod %293 %295 
					                                         f32 %297 = OpCompositeExtract %296 0 
					                                                      OpStore %290 %297 
					                                         f32 %299 = OpLoad %235 
					                                         f32 %300 = OpLoad %290 
					                                         f32 %301 = OpFMul %299 %300 
					                                                      OpStore %298 %301 
					                                         f32 %302 = OpLoad %298 
					                                         f32 %304 = OpFMul %302 %303 
					                                                      OpStore %298 %304 
					                                Private f32* %305 = OpAccessChain %204 %31 
					                                         f32 %306 = OpLoad %305 
					                                         f32 %308 = OpFMul %306 %307 
					                                         f32 %309 = OpLoad %298 
					                                         f32 %310 = OpFAdd %308 %309 
					                                Private f32* %311 = OpAccessChain %204 %31 
					                                                      OpStore %311 %310 
					                                Private f32* %312 = OpAccessChain %277 %31 
					                                         f32 %313 = OpLoad %312 
					                                         f32 %314 = OpFMul %313 %280 
					                                         f32 %315 = OpFAdd %314 %245 
					                                Private f32* %316 = OpAccessChain %241 %31 
					                                                      OpStore %316 %315 
					                                Private f32* %317 = OpAccessChain %277 %155 
					                                         f32 %318 = OpLoad %317 
					                                         f32 %319 = OpFMul %318 %280 
					                                Private f32* %320 = OpAccessChain %248 %40 
					                                         f32 %321 = OpLoad %320 
					                                         f32 %322 = OpFAdd %319 %321 
					                                Private f32* %323 = OpAccessChain %241 %155 
					                                                      OpStore %323 %322 
					                         read_only Texture2D %324 = OpLoad %265 
					                                     sampler %325 = OpLoad %267 
					                  read_only Texture2DSampled %326 = OpSampledImage %324 %325 
					                                       f32_2 %327 = OpLoad %241 
					                                       f32_4 %328 = OpImageSampleImplicitLod %326 %327 
					                                         f32 %329 = OpCompositeExtract %328 0 
					                                                      OpStore %290 %329 
					                                         f32 %330 = OpLoad %235 
					                                         f32 %331 = OpLoad %290 
					                                         f32 %332 = OpFMul %330 %331 
					                                                      OpStore %298 %332 
					                                         f32 %333 = OpLoad %298 
					                                         f32 %335 = OpFMul %333 %334 
					                                Private f32* %336 = OpAccessChain %204 %31 
					                                         f32 %337 = OpLoad %336 
					                                         f32 %338 = OpFAdd %335 %337 
					                                Private f32* %339 = OpAccessChain %204 %31 
					                                                      OpStore %339 %338 
					                                Private f32* %340 = OpAccessChain %241 %31 
					                                         f32 %341 = OpLoad %340 
					                                         f32 %342 = OpFMul %341 %303 
					                                         f32 %343 = OpFAdd %342 %245 
					                                Private f32* %344 = OpAccessChain %277 %31 
					                                                      OpStore %344 %343 
					                                Private f32* %345 = OpAccessChain %241 %155 
					                                         f32 %346 = OpLoad %345 
					                                         f32 %347 = OpFMul %346 %303 
					                                Private f32* %348 = OpAccessChain %248 %40 
					                                         f32 %349 = OpLoad %348 
					                                         f32 %350 = OpFAdd %347 %349 
					                                Private f32* %351 = OpAccessChain %277 %155 
					                                                      OpStore %351 %350 
					                         read_only Texture2D %352 = OpLoad %265 
					                                     sampler %353 = OpLoad %267 
					                  read_only Texture2DSampled %354 = OpSampledImage %352 %353 
					                                       f32_4 %355 = OpLoad %277 
					                                       f32_2 %356 = OpVectorShuffle %355 %355 0 1 
					                                       f32_4 %357 = OpImageSampleImplicitLod %354 %356 
					                                         f32 %358 = OpCompositeExtract %357 0 
					                                                      OpStore %290 %358 
					                                         f32 %359 = OpLoad %235 
					                                         f32 %360 = OpLoad %290 
					                                         f32 %361 = OpFMul %359 %360 
					                                                      OpStore %298 %361 
					                                         f32 %362 = OpLoad %298 
					                                         f32 %364 = OpFMul %362 %363 
					                                Private f32* %365 = OpAccessChain %204 %31 
					                                         f32 %366 = OpLoad %365 
					                                         f32 %367 = OpFAdd %364 %366 
					                                Private f32* %368 = OpAccessChain %204 %31 
					                                                      OpStore %368 %367 
					                                Private f32* %369 = OpAccessChain %277 %31 
					                                         f32 %370 = OpLoad %369 
					                                         f32 %372 = OpFMul %370 %371 
					                                         f32 %373 = OpFAdd %372 %245 
					                                Private f32* %374 = OpAccessChain %241 %31 
					                                                      OpStore %374 %373 
					                                Private f32* %375 = OpAccessChain %277 %155 
					                                         f32 %376 = OpLoad %375 
					                                         f32 %377 = OpFMul %376 %371 
					                                Private f32* %378 = OpAccessChain %248 %40 
					                                         f32 %379 = OpLoad %378 
					                                         f32 %380 = OpFAdd %377 %379 
					                                Private f32* %381 = OpAccessChain %241 %155 
					                                                      OpStore %381 %380 
					                         read_only Texture2D %382 = OpLoad %265 
					                                     sampler %383 = OpLoad %267 
					                  read_only Texture2DSampled %384 = OpSampledImage %382 %383 
					                                       f32_2 %385 = OpLoad %241 
					                                       f32_4 %386 = OpImageSampleImplicitLod %384 %385 
					                                         f32 %387 = OpCompositeExtract %386 0 
					                                                      OpStore %290 %387 
					                                         f32 %388 = OpLoad %235 
					                                         f32 %389 = OpLoad %290 
					                                         f32 %390 = OpFMul %388 %389 
					                                                      OpStore %298 %390 
					                                         f32 %391 = OpLoad %298 
					                                         f32 %392 = OpFMul %391 %363 
					                                Private f32* %393 = OpAccessChain %204 %31 
					                                         f32 %394 = OpLoad %393 
					                                         f32 %395 = OpFAdd %392 %394 
					                                Private f32* %396 = OpAccessChain %204 %31 
					                                                      OpStore %396 %395 
					                                Private f32* %398 = OpAccessChain %57 %155 
					                                         f32 %399 = OpLoad %398 
					                                Private f32* %400 = OpAccessChain %204 %31 
					                                         f32 %401 = OpLoad %400 
					                                         f32 %402 = OpFNegate %401 
					                                         f32 %403 = OpFMul %399 %402 
					                                Private f32* %404 = OpAccessChain %204 %31 
					                                         f32 %405 = OpLoad %404 
					                                         f32 %406 = OpFAdd %403 %405 
					                                                      OpStore %397 %406 
					                         read_only Texture2D %409 = OpLoad %408 
					                                     sampler %411 = OpLoad %410 
					                  read_only Texture2DSampled %412 = OpSampledImage %409 %411 
					                                       f32_4 %413 = OpLoad %119 
					                                       f32_2 %414 = OpVectorShuffle %413 %413 0 1 
					                                       f32_4 %415 = OpImageSampleImplicitLod %412 %414 
					                                                      OpStore %407 %415 
					                                Private f32* %417 = OpAccessChain %119 %47 
					                                         f32 %418 = OpLoad %417 
					                                Uniform f32* %420 = OpAccessChain %37 %419 
					                                         f32 %421 = OpLoad %420 
					                                         f32 %422 = OpFMul %418 %421 
					                                                      OpStore %416 %422 
					                                         f32 %423 = OpLoad %397 
					                                       f32_2 %424 = OpCompositeConstruct %423 %423 
					                                         f32 %425 = OpLoad %416 
					                                       f32_2 %426 = OpCompositeConstruct %425 %425 
					                                       f32_2 %427 = OpFMul %424 %426 
					                                       f32_4 %428 = OpLoad %119 
					                                       f32_2 %429 = OpVectorShuffle %428 %428 0 1 
					                                       f32_2 %430 = OpFAdd %427 %429 
					                                       f32_4 %431 = OpLoad %204 
					                                       f32_4 %432 = OpVectorShuffle %431 %430 4 5 2 3 
					                                                      OpStore %204 %432 
					                         read_only Texture2D %434 = OpLoad %408 
					                                     sampler %435 = OpLoad %410 
					                  read_only Texture2DSampled %436 = OpSampledImage %434 %435 
					                                       f32_4 %437 = OpLoad %204 
					                                       f32_2 %438 = OpVectorShuffle %437 %437 0 1 
					                                       f32_4 %439 = OpImageSampleImplicitLod %436 %438 
					                                                      OpStore %433 %439 
					                                         f32 %440 = OpLoad %397 
					                                       f32_4 %441 = OpCompositeConstruct %440 %440 %440 %440 
					                                       f32_4 %442 = OpLoad %433 
					                                       f32_4 %443 = OpFAdd %441 %442 
					                                                      OpStore %277 %443 
					                                       f32_4 %444 = OpLoad %407 
					                                       f32_4 %445 = OpFNegate %444 
					                                       f32_4 %446 = OpLoad %277 
					                                       f32_4 %447 = OpFAdd %445 %446 
					                                                      OpStore %277 %447 
					                                Uniform f32* %449 = OpAccessChain %37 %448 
					                                         f32 %450 = OpLoad %449 
					                                Uniform f32* %451 = OpAccessChain %37 %448 
					                                         f32 %452 = OpLoad %451 
					                                Uniform f32* %453 = OpAccessChain %37 %448 
					                                         f32 %454 = OpLoad %453 
					                                Uniform f32* %455 = OpAccessChain %37 %448 
					                                         f32 %456 = OpLoad %455 
					                                       f32_4 %457 = OpCompositeConstruct %450 %452 %454 %456 
					                                         f32 %458 = OpCompositeExtract %457 0 
					                                         f32 %459 = OpCompositeExtract %457 1 
					                                         f32 %460 = OpCompositeExtract %457 2 
					                                         f32 %461 = OpCompositeExtract %457 3 
					                                       f32_4 %462 = OpCompositeConstruct %458 %459 %460 %461 
					                                       f32_4 %463 = OpLoad %277 
					                                       f32_4 %464 = OpFMul %462 %463 
					                                       f32_4 %465 = OpLoad %407 
					                                       f32_4 %466 = OpFAdd %464 %465 
					                                                      OpStore %277 %466 
					                                Private f32* %467 = OpAccessChain %119 %31 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %470 = OpFMul %468 %469 
					                                Private f32* %471 = OpAccessChain %248 %47 
					                                         f32 %472 = OpLoad %471 
					                                         f32 %473 = OpFAdd %470 %472 
					                                Private f32* %474 = OpAccessChain %248 %31 
					                                                      OpStore %474 %473 
					                         read_only Texture2D %476 = OpLoad %265 
					                                     sampler %477 = OpLoad %267 
					                  read_only Texture2DSampled %478 = OpSampledImage %476 %477 
					                                       f32_4 %479 = OpLoad %248 
					                                       f32_2 %480 = OpVectorShuffle %479 %479 0 1 
					                                       f32_4 %481 = OpImageSampleImplicitLod %478 %480 
					                                         f32 %482 = OpCompositeExtract %481 1 
					                                                      OpStore %475 %482 
					                                         f32 %483 = OpLoad %235 
					                                         f32 %484 = OpLoad %475 
					                                         f32 %485 = OpFMul %483 %484 
					                                                      OpStore %397 %485 
					                                         f32 %486 = OpLoad %397 
					                                       f32_2 %487 = OpCompositeConstruct %486 %486 
					                                Uniform f32* %489 = OpAccessChain %37 %488 
					                                         f32 %490 = OpLoad %489 
					                                Uniform f32* %491 = OpAccessChain %37 %488 
					                                         f32 %492 = OpLoad %491 
					                                       f32_2 %493 = OpCompositeConstruct %490 %492 
					                                         f32 %494 = OpCompositeExtract %493 0 
					                                         f32 %495 = OpCompositeExtract %493 1 
					                                       f32_2 %496 = OpCompositeConstruct %494 %495 
					                                         f32 %497 = OpDot %487 %496 
					                                                      OpStore %397 %497 
					                                         f32 %498 = OpLoad %397 
					                                       f32_4 %499 = OpCompositeConstruct %498 %498 %498 %498 
					                                       f32_4 %500 = OpLoad %277 
					                                       f32_4 %501 = OpFAdd %499 %500 
					                                                      OpStore %204 %501 
					                                       f32_4 %502 = OpLoad %119 
					                                       f32_4 %503 = OpVectorShuffle %502 %502 0 1 0 1 
					                              Uniform f32_4* %505 = OpAccessChain %37 %504 
					                                       f32_4 %506 = OpLoad %505 
					                                       f32_4 %507 = OpVectorShuffle %506 %506 0 1 0 1 
					                                       f32_4 %508 = OpFMul %503 %507 
					                                       f32_4 %513 = OpFAdd %508 %512 
					                                                      OpStore %248 %513 
					                                       f32_4 %514 = OpLoad %248 
					                              Uniform f32_4* %515 = OpAccessChain %37 %504 
					                                       f32_4 %516 = OpLoad %515 
					                                       f32_4 %517 = OpVectorShuffle %516 %516 0 1 0 1 
					                                       f32_4 %518 = OpFDiv %514 %517 
					                                                      OpStore %248 %518 
					                         read_only Texture2D %519 = OpLoad %408 
					                                     sampler %520 = OpLoad %410 
					                  read_only Texture2DSampled %521 = OpSampledImage %519 %520 
					                                       f32_4 %522 = OpLoad %248 
					                                       f32_2 %523 = OpVectorShuffle %522 %522 0 1 
					                                       f32_4 %524 = OpImageSampleImplicitLod %521 %523 
					                                                      OpStore %433 %524 
					                         read_only Texture2D %526 = OpLoad %408 
					                                     sampler %527 = OpLoad %410 
					                  read_only Texture2DSampled %528 = OpSampledImage %526 %527 
					                                       f32_4 %529 = OpLoad %248 
					                                       f32_2 %530 = OpVectorShuffle %529 %529 2 3 
					                                       f32_4 %531 = OpImageSampleImplicitLod %528 %530 
					                                                      OpStore %525 %531 
					                                       f32_4 %533 = OpLoad %525 
					                                       f32_4 %534 = OpFNegate %533 
					                                       f32_4 %535 = OpLoad %433 
					                                       f32_4 %536 = OpFAdd %534 %535 
					                                                      OpStore %532 %536 
					                                       f32_4 %540 = OpLoad %119 
					                                       f32_2 %541 = OpVectorShuffle %540 %540 0 1 
					                              Uniform f32_4* %542 = OpAccessChain %37 %504 
					                                       f32_4 %543 = OpLoad %542 
					                                       f32_2 %544 = OpVectorShuffle %543 %543 0 1 
					                                       f32_2 %545 = OpFMul %541 %544 
					                                       f32_2 %547 = OpFAdd %545 %546 
					                                       f32_3 %548 = OpLoad %539 
					                                       f32_3 %549 = OpVectorShuffle %548 %547 3 1 4 
					                                                      OpStore %539 %549 
					                                       f32_3 %550 = OpLoad %539 
					                                       f32_2 %551 = OpVectorShuffle %550 %550 0 2 
					                              Uniform f32_4* %552 = OpAccessChain %37 %504 
					                                       f32_4 %553 = OpLoad %552 
					                                       f32_2 %554 = OpVectorShuffle %553 %553 0 1 
					                                       f32_2 %555 = OpFDiv %551 %554 
					                                       f32_3 %556 = OpLoad %539 
					                                       f32_3 %557 = OpVectorShuffle %556 %555 3 1 4 
					                                                      OpStore %539 %557 
					                         read_only Texture2D %559 = OpLoad %408 
					                                     sampler %560 = OpLoad %410 
					                  read_only Texture2DSampled %561 = OpSampledImage %559 %560 
					                                       f32_3 %562 = OpLoad %539 
					                                       f32_2 %563 = OpVectorShuffle %562 %562 0 2 
					                                       f32_4 %564 = OpImageSampleImplicitLod %561 %563 
					                                                      OpStore %558 %564 
					                                       f32_4 %566 = OpLoad %433 
					                                       f32_4 %567 = OpLoad %558 
					                                       f32_4 %568 = OpFNegate %567 
					                                       f32_4 %569 = OpFAdd %566 %568 
					                                                      OpStore %565 %569 
					                                       f32_4 %570 = OpLoad %532 
					                                       f32_4 %571 = OpExtInst %1 4 %570 
					                                       f32_4 %572 = OpLoad %565 
					                                       f32_4 %573 = OpExtInst %1 4 %572 
					                                       f32_4 %574 = OpFAdd %571 %573 
					                                                      OpStore %532 %574 
					                                       f32_4 %576 = OpLoad %532 
					                                       f32_4 %577 = OpLoad %532 
					                                         f32 %578 = OpDot %576 %577 
					                                                      OpStore %575 %578 
					                                         f32 %579 = OpLoad %575 
					                                         f32 %580 = OpExtInst %1 31 %579 
					                                                      OpStore %575 %580 
					                                       f32_4 %581 = OpLoad %119 
					                                       f32_2 %582 = OpVectorShuffle %581 %581 0 2 
					                                       f32_2 %584 = OpFAdd %582 %583 
					                                       f32_4 %585 = OpLoad %119 
					                                       f32_4 %586 = OpVectorShuffle %585 %584 4 5 2 3 
					                                                      OpStore %119 %586 
					                                Private f32* %587 = OpAccessChain %9 %31 
					                                         f32 %588 = OpLoad %587 
					                                         f32 %590 = OpFMul %588 %589 
					                                                      OpStore %416 %590 
					                                         f32 %591 = OpLoad %416 
					                                         f32 %592 = OpExtInst %1 8 %591 
					                                Private f32* %593 = OpAccessChain %119 %47 
					                                                      OpStore %593 %592 
					                                       f32_4 %594 = OpLoad %119 
					                                       f32_2 %595 = OpVectorShuffle %594 %594 0 3 
					                                       f32_2 %598 = OpFMul %595 %597 
					                                       f32_4 %599 = OpLoad %119 
					                                       f32_4 %600 = OpVectorShuffle %599 %598 0 1 4 5 
					                                                      OpStore %119 %600 
					                                       f32_4 %601 = OpLoad %119 
					                                       f32_2 %602 = OpVectorShuffle %601 %601 2 1 
					                                       f32_4 %603 = OpLoad %119 
					                                       f32_2 %604 = OpVectorShuffle %603 %603 3 3 
					                                       f32_2 %605 = OpFDiv %602 %604 
					                                       f32_4 %606 = OpLoad %119 
					                                       f32_4 %607 = OpVectorShuffle %606 %605 4 5 2 3 
					                                                      OpStore %119 %607 
					                                         f32 %609 = OpLoad %159 
					                                         f32 %611 = OpFMul %609 %610 
					                                                      OpStore %608 %611 
					                                         f32 %612 = OpLoad %608 
					                                         f32 %613 = OpExtInst %1 8 %612 
					                                                      OpStore %608 %613 
					                                         f32 %614 = OpLoad %608 
					                                       f32_2 %615 = OpCompositeConstruct %614 %614 
					                                       f32_2 %618 = OpFMul %615 %617 
					                                       f32_4 %619 = OpLoad %119 
					                                       f32_2 %620 = OpVectorShuffle %619 %619 0 1 
					                                       f32_2 %621 = OpFAdd %618 %620 
					                                       f32_4 %622 = OpLoad %119 
					                                       f32_4 %623 = OpVectorShuffle %622 %621 4 5 2 3 
					                                                      OpStore %119 %623 
					                                Private f32* %624 = OpAccessChain %57 %31 
					                                         f32 %625 = OpLoad %624 
					                                         f32 %626 = OpLoad %159 
					                                         f32 %627 = OpFMul %625 %626 
					                                Private f32* %628 = OpAccessChain %57 %31 
					                                                      OpStore %628 %627 
					                                Private f32* %629 = OpAccessChain %57 %31 
					                                         f32 %630 = OpLoad %629 
					                                         f32 %631 = OpFNegate %630 
					                                         f32 %633 = OpFMul %631 %632 
					                                Private f32* %634 = OpAccessChain %119 %31 
					                                         f32 %635 = OpLoad %634 
					                                         f32 %636 = OpFAdd %633 %635 
					                                Private f32* %637 = OpAccessChain %248 %31 
					                                                      OpStore %637 %636 
					                                         f32 %638 = OpLoad %159 
					                                         f32 %639 = OpFNegate %638 
					                                         f32 %641 = OpFMul %639 %640 
					                                Private f32* %642 = OpAccessChain %119 %155 
					                                         f32 %643 = OpLoad %642 
					                                         f32 %644 = OpFAdd %641 %643 
					                                Private f32* %645 = OpAccessChain %248 %155 
					                                                      OpStore %645 %644 
					                         read_only Texture2D %647 = OpLoad %265 
					                                     sampler %648 = OpLoad %267 
					                  read_only Texture2DSampled %649 = OpSampledImage %647 %648 
					                                       f32_4 %650 = OpLoad %248 
					                                       f32_2 %651 = OpVectorShuffle %650 %650 0 1 
					                                       f32_4 %652 = OpImageSampleImplicitLod %649 %651 
					                                         f32 %653 = OpCompositeExtract %652 2 
					                                                      OpStore %646 %653 
					                                         f32 %655 = OpLoad %646 
					                                         f32 %656 = OpLoad %575 
					                                         f32 %657 = OpFMul %655 %656 
					                                                      OpStore %654 %657 
					                                         f32 %658 = OpLoad %654 
					                                Uniform f32* %660 = OpAccessChain %37 %659 
					                                         f32 %661 = OpLoad %660 
					                                         f32 %662 = OpFMul %658 %661 
					                                Private f32* %663 = OpAccessChain %57 %31 
					                                                      OpStore %663 %662 
					                                       f32_2 %664 = OpLoad %57 
					                                       f32_4 %665 = OpVectorShuffle %664 %664 0 0 0 0 
					                                       f32_4 %667 = OpFMul %665 %666 
					                                       f32_4 %668 = OpLoad %204 
					                                       f32_4 %669 = OpFAdd %667 %668 
					                                                      OpStore %119 %669 
					                                       f32_4 %670 = OpLoad %407 
					                                       f32_4 %671 = OpFNegate %670 
					                                       f32_4 %672 = OpLoad %119 
					                                       f32_4 %673 = OpFAdd %671 %672 
					                                                      OpStore %119 %673 
					                                Uniform f32* %674 = OpAccessChain %37 %448 
					                                         f32 %675 = OpLoad %674 
					                                Uniform f32* %676 = OpAccessChain %37 %448 
					                                         f32 %677 = OpLoad %676 
					                                Uniform f32* %678 = OpAccessChain %37 %448 
					                                         f32 %679 = OpLoad %678 
					                                Uniform f32* %680 = OpAccessChain %37 %448 
					                                         f32 %681 = OpLoad %680 
					                                       f32_4 %682 = OpCompositeConstruct %675 %677 %679 %681 
					                                         f32 %683 = OpCompositeExtract %682 0 
					                                         f32 %684 = OpCompositeExtract %682 1 
					                                         f32 %685 = OpCompositeExtract %682 2 
					                                         f32 %686 = OpCompositeExtract %682 3 
					                                       f32_4 %687 = OpCompositeConstruct %683 %684 %685 %686 
					                                       f32_4 %688 = OpLoad %119 
					                                       f32_4 %689 = OpFMul %687 %688 
					                                       f32_4 %690 = OpLoad %407 
					                                       f32_4 %691 = OpFAdd %689 %690 
					                                                      OpStore %119 %691 
					                                Private f32* %692 = OpAccessChain %9 %31 
					                                         f32 %693 = OpLoad %692 
					                                         f32 %694 = OpFNegate %693 
					                                         f32 %695 = OpFAdd %694 %52 
					                                Private f32* %696 = OpAccessChain %9 %31 
					                                                      OpStore %696 %695 
					                                Private f32* %697 = OpAccessChain %9 %31 
					                                         f32 %698 = OpLoad %697 
					                                Uniform f32* %700 = OpAccessChain %37 %699 
					                                         f32 %701 = OpLoad %700 
					                                         f32 %702 = OpFMul %698 %701 
					                                Private f32* %703 = OpAccessChain %9 %31 
					                                                      OpStore %703 %702 
					                                       f32_4 %704 = OpLoad %119 
					                                       f32_4 %705 = OpFNegate %704 
					                              Uniform f32_4* %707 = OpAccessChain %37 %706 
					                                       f32_4 %708 = OpLoad %707 
					                                       f32_4 %709 = OpFAdd %705 %708 
					                                                      OpStore %204 %709 
					                                       f32_2 %710 = OpLoad %9 
					                                       f32_4 %711 = OpVectorShuffle %710 %710 0 0 0 0 
					                                       f32_4 %712 = OpLoad %204 
					                                       f32_4 %713 = OpFMul %711 %712 
					                                       f32_4 %714 = OpLoad %119 
					                                       f32_4 %715 = OpFAdd %713 %714 
					                                                      OpStore %136 %715 
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
						float _Value5;
						float _Value6;
						float _Value7;
						float _Value8;
						float _Visualize;
						float Drop_Near;
						float Drop_Far;
						float Drop_With_Obj;
						float Drop_Floor_Fluid;
						float Myst;
						vec4 Myst_Color;
						float _FixDistance;
						vec4 _ScreenResolution;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D Texture2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec2 u_xlat7;
					float u_xlat16_7;
					vec3 u_xlat8;
					float u_xlat9;
					float u_xlat14;
					float u_xlat16_14;
					bool u_xlatb14;
					float u_xlat15;
					float u_xlat16;
					float u_xlat21;
					float u_xlat22;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat7.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat7.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat7.x = (-Drop_Near) + Drop_Far;
					    u_xlat0.x = u_xlat0.x + (-Drop_Near);
					    u_xlat7.x = float(1.0) / u_xlat7.x;
					    u_xlat0.x = u_xlat7.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1 = u_xlat0.xxxx * u_xlat7.xxxx;
					    u_xlatb14 = _Visualize==1.0;
					    if(u_xlatb14){
					        SV_Target0 = u_xlat1;
					        return;
					    //ENDIF
					    }
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb14 = _MainTex_TexelSize.y<0.0;
					    u_xlat21 = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb14) ? u_xlat21 : u_xlat1.y;
					    u_xlat0.x = (-u_xlat7.x) * u_xlat0.x + 1.0;
					    u_xlat7.xy = u_xlat0.xx * vec2(Drop_Floor_Fluid, Drop_With_Obj);
					    u_xlat7.x = u_xlat7.x * (-_Value3) + _Value3;
					    u_xlat2.xy = u_xlat1.xz * vec2(vec2(_Value5, _Value5));
					    u_xlat21 = _TimeX * _Value4;
					    u_xlat2.x = u_xlat7.x * u_xlat2.y + u_xlat2.x;
					    u_xlat16 = _Value2 * 0.25;
					    u_xlat3.x = u_xlat2.x * 3.0 + 0.100000001;
					    u_xlat4 = vec4(u_xlat21) * vec4(0.800000012, 0.00999999978, 1.20000005, 0.200000003);
					    u_xlat3.y = u_xlat2.y * 3.0 + u_xlat4.x;
					    u_xlat10_5 = texture(Texture2, u_xlat3.xy);
					    u_xlat2.x = u_xlat16 * u_xlat10_5.x;
					    u_xlat5.x = u_xlat3.x * 0.649999976 + 0.100000001;
					    u_xlat5.y = u_xlat3.y * 0.649999976 + u_xlat21;
					    u_xlat10_3 = texture(Texture2, u_xlat5.xy);
					    u_xlat9 = u_xlat16 * u_xlat10_3.x;
					    u_xlat9 = u_xlat9 * 0.5;
					    u_xlat2.x = u_xlat2.x * 0.300000012 + u_xlat9;
					    u_xlat3.x = u_xlat5.x * 0.649999976 + 0.100000001;
					    u_xlat3.y = u_xlat5.y * 0.649999976 + u_xlat4.z;
					    u_xlat10_5 = texture(Texture2, u_xlat3.xy);
					    u_xlat9 = u_xlat16 * u_xlat10_5.x;
					    u_xlat2.x = u_xlat9 * 0.699999988 + u_xlat2.x;
					    u_xlat5.x = u_xlat3.x * 0.5 + 0.100000001;
					    u_xlat5.y = u_xlat3.y * 0.5 + u_xlat4.z;
					    u_xlat10_3 = texture(Texture2, u_xlat5.xy);
					    u_xlat9 = u_xlat16 * u_xlat10_3.x;
					    u_xlat2.x = u_xlat9 * 0.899999976 + u_xlat2.x;
					    u_xlat3.x = u_xlat5.x * 0.400000006 + 0.100000001;
					    u_xlat3.y = u_xlat5.y * 0.400000006 + u_xlat4.z;
					    u_xlat10_3 = texture(Texture2, u_xlat3.xy);
					    u_xlat9 = u_xlat16 * u_xlat10_3.x;
					    u_xlat2.x = u_xlat9 * 0.899999976 + u_xlat2.x;
					    u_xlat14 = u_xlat7.y * (-u_xlat2.x) + u_xlat2.x;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat22 = u_xlat1.w * _Value6;
					    u_xlat2.xy = vec2(u_xlat14) * vec2(u_xlat22) + u_xlat1.xy;
					    u_xlat10_5 = texture(_MainTex, u_xlat2.xy);
					    u_xlat5 = vec4(u_xlat14) + u_xlat10_5;
					    u_xlat5 = (-u_xlat10_3) + u_xlat5;
					    u_xlat5 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat5 + u_xlat10_3;
					    u_xlat4.x = u_xlat1.x * 0.00100000005 + u_xlat4.w;
					    u_xlat10_4 = texture(Texture2, u_xlat4.xy);
					    u_xlat14 = u_xlat16 * u_xlat10_4.y;
					    u_xlat14 = dot(vec2(u_xlat14), vec2(vec2(_Value7, _Value7)));
					    u_xlat2 = vec4(u_xlat14) + u_xlat5;
					    u_xlat4 = u_xlat1.xyxy * _ScreenResolution.xyxy + vec4(2.0, 4.0, 2.0, -4.0);
					    u_xlat4 = u_xlat4 / _ScreenResolution.xyxy;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_4 = (-u_xlat10_4) + u_xlat10_5;
					    u_xlat8.xz = u_xlat1.xy * _ScreenResolution.xy + vec2(-2.0, 4.0);
					    u_xlat8.xz = u_xlat8.xz / _ScreenResolution.xy;
					    u_xlat10_6 = texture(_MainTex, u_xlat8.xz);
					    u_xlat16_5 = u_xlat10_5 + (-u_xlat10_6);
					    u_xlat16_4 = abs(u_xlat16_4) + abs(u_xlat16_5);
					    u_xlat16_14 = dot(u_xlat16_4, u_xlat16_4);
					    u_xlat16_14 = sqrt(u_xlat16_14);
					    u_xlat1.xy = u_xlat1.xz + vec2(0.400000006, 0.400000006);
					    u_xlat22 = u_xlat0.x * 16.0;
					    u_xlat1.w = floor(u_xlat22);
					    u_xlat1.zw = u_xlat1.xw * vec2(2.0, 0.0625);
					    u_xlat1.xy = u_xlat1.zy / u_xlat1.ww;
					    u_xlat15 = u_xlat21 * 64.0;
					    u_xlat15 = floor(u_xlat15);
					    u_xlat1.xy = vec2(u_xlat15) * vec2(0.015625, 0.0625) + u_xlat1.xy;
					    u_xlat7.x = u_xlat7.x * u_xlat21;
					    u_xlat4.x = (-u_xlat7.x) * 0.550000012 + u_xlat1.x;
					    u_xlat4.y = (-u_xlat21) * 0.150000006 + u_xlat1.y;
					    u_xlat10_1 = texture(Texture2, u_xlat4.xy);
					    u_xlat16_7 = u_xlat16_14 * u_xlat10_1.z;
					    u_xlat7.x = u_xlat16_7 * _Value8;
					    u_xlat1 = u_xlat7.xxxx * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat2;
					    u_xlat1 = (-u_xlat10_3) + u_xlat1;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * u_xlat1 + u_xlat10_3;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * Myst;
					    u_xlat2 = (-u_xlat1) + Myst_Color;
					    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat1;
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