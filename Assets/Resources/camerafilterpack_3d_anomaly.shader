Shader "CameraFilterPack/3D_Anomaly" {
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
			GpuProgramID 50590
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_0.xyz = in_TEXCOORD0.xyx;
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
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD2 = phase0_Output0_0.zw;
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
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    phase0_Output0_0 = in_TEXCOORD0.xyxy;
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
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD2 = phase0_Output0_0.zw;
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
					uniform 	float _Value2;
					uniform 	float _Visualize;
					uniform 	float Anomaly_Distortion;
					uniform 	float Anomaly_Distortion_Size;
					uniform 	float Anomaly_Intensity;
					uniform 	float Anomaly_Near;
					uniform 	float Anomaly_Far;
					uniform 	float Anomaly_With_Obj;
					uniform 	float _FixDistance;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					float u_xlat6;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat6 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat6;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6 = (-Anomaly_Near) + Anomaly_Far;
					    u_xlat0.x = u_xlat0.x + (-Anomaly_Near);
					    u_xlat6 = float(1.0) / u_xlat6;
					    u_xlat0.x = u_xlat6 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0 = u_xlat0.xxxx * vec4(u_xlat6);
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat12 = _Time.x * 20.0;
					    u_xlat2.x = u_xlat0.y * Anomaly_Distortion_Size;
					    u_xlat2.x = u_xlat2.x * 0.649999976 + u_xlat12;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat3 = vec4(vec4(Anomaly_Distortion, Anomaly_Distortion, Anomaly_Distortion, Anomaly_Distortion)) * vec4(32.0, 64.0, 96.0, 128.0);
					    u_xlat2 = u_xlat2.xxxx / u_xlat3;
					    u_xlat2 = u_xlat0.xxxx + u_xlat2;
					    u_xlat4 = u_xlat2 * vec4(Anomaly_Distortion_Size) + vec4(u_xlat12);
					    u_xlat4 = cos(u_xlat4);
					    u_xlat3 = u_xlat4 / u_xlat3;
					    u_xlat3 = u_xlat0.yyyy + u_xlat3.xzyw;
					    u_xlat4.xz = u_xlat2.xy;
					    u_xlat4.yw = u_xlat3.xz;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_4 = u_xlat10_4 * vec4(0.25, 0.25, 0.25, 0.25);
					    u_xlat16_4 = u_xlat10_5 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat16_4;
					    u_xlat3.xz = u_xlat2.zw;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_2 = u_xlat10_2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat16_4;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_2 = u_xlat10_3 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat16_2;
					    u_xlat2 = u_xlat16_2 * vec4(vec4(Anomaly_Intensity, Anomaly_Intensity, Anomaly_Intensity, Anomaly_Intensity));
					    u_xlat2 = u_xlat2 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
					    u_xlat0.x = u_xlat0.w * Anomaly_With_Obj;
					    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 162
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %30 %58 %116 %120 %121 %137 %150 %153 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpDecorate %13 ArrayStride 13 
					                                                      OpDecorate %14 ArrayStride 14 
					                                                      OpMemberDecorate %16 0 Offset 16 
					                                                      OpMemberDecorate %16 1 Offset 16 
					                                                      OpMemberDecorate %16 2 Offset 16 
					                                                      OpMemberDecorate %16 3 Offset 16 
					                                                      OpDecorate %16 Block 
					                                                      OpDecorate %18 DescriptorSet 18 
					                                                      OpDecorate %18 Binding 18 
					                                                      OpDecorate %30 Location 30 
					                                                      OpDecorate %58 Location 58 
					                                                      OpMemberDecorate %114 0 BuiltIn 114 
					                                                      OpMemberDecorate %114 1 BuiltIn 114 
					                                                      OpMemberDecorate %114 2 BuiltIn 114 
					                                                      OpDecorate %114 Block 
					                                                      OpDecorate %120 Location 120 
					                                                      OpDecorate %121 Location 121 
					                                                      OpDecorate vs_TEXCOORD1 Location 137 
					                                                      OpDecorate vs_TEXCOORD0 Location 150 
					                                                      OpDecorate vs_TEXCOORD2 Location 153 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 4 
					                                              %11 = OpTypeInt 32 0 
					                                          u32 %12 = OpConstant 4 
					                                              %13 = OpTypeArray %10 %12 
					                                              %14 = OpTypeArray %10 %12 
					                                              %15 = OpTypeVector %9 2 
					                                              %16 = OpTypeStruct %10 %13 %14 %15 
					                                              %17 = OpTypePointer Uniform %16 
					Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_2;}* %18 = OpVariable Uniform 
					                                              %19 = OpTypeInt 32 1 
					                                          i32 %20 = OpConstant 3 
					                                          u32 %21 = OpConstant 1 
					                                              %22 = OpTypePointer Uniform %9 
					                                          f32 %25 = OpConstant 3,674022E-40 
					                                              %27 = OpTypePointer Private %9 
					                                 Private f32* %28 = OpVariable Private 
					                                              %29 = OpTypePointer Input %15 
					                                 Input f32_2* %30 = OpVariable Input 
					                                              %31 = OpTypePointer Input %9 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                              %37 = OpTypePointer Private %10 
					                               Private f32_4* %38 = OpVariable Private 
					                                              %40 = OpTypePointer Function %9 
					                                          u32 %49 = OpConstant 3 
					                                              %51 = OpTypeVector %9 3 
					                               Private f32_4* %56 = OpVariable Private 
					                                              %57 = OpTypePointer Input %10 
					                                 Input f32_4* %58 = OpVariable Input 
					                                          i32 %61 = OpConstant 1 
					                                              %62 = OpTypePointer Uniform %10 
					                                          i32 %66 = OpConstant 0 
					                                          i32 %74 = OpConstant 2 
					                               Private f32_4* %86 = OpVariable Private 
					                                             %113 = OpTypeArray %9 %21 
					                                             %114 = OpTypeStruct %10 %9 %113 
					                                             %115 = OpTypePointer Output %114 
					        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
					                                             %118 = OpTypePointer Output %10 
					                               Output f32_4* %120 = OpVariable Output 
					                                Input f32_4* %121 = OpVariable Input 
					                                         u32 %125 = OpConstant 0 
					                                         f32 %132 = OpConstant 3,674022E-40 
					                                       f32_3 %133 = OpConstantComposite %132 %132 %132 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                             %149 = OpTypePointer Output %15 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                       Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                             %156 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %41 = OpVariable Function 
					                                 Uniform f32* %23 = OpAccessChain %18 %20 %21 
					                                          f32 %24 = OpLoad %23 
					                                         bool %26 = OpFOrdLessThan %24 %25 
					                                                      OpStore %8 %26 
					                                   Input f32* %32 = OpAccessChain %30 %21 
					                                          f32 %33 = OpLoad %32 
					                                          f32 %34 = OpFNegate %33 
					                                          f32 %36 = OpFAdd %34 %35 
					                                                      OpStore %28 %36 
					                                         bool %39 = OpLoad %8 
					                                                      OpSelectionMerge %43 None 
					                                                      OpBranchConditional %39 %42 %45 
					                                              %42 = OpLabel 
					                                          f32 %44 = OpLoad %28 
					                                                      OpStore %41 %44 
					                                                      OpBranch %43 
					                                              %45 = OpLabel 
					                                   Input f32* %46 = OpAccessChain %30 %21 
					                                          f32 %47 = OpLoad %46 
					                                                      OpStore %41 %47 
					                                                      OpBranch %43 
					                                              %43 = OpLabel 
					                                          f32 %48 = OpLoad %41 
					                                 Private f32* %50 = OpAccessChain %38 %49 
					                                                      OpStore %50 %48 
					                                        f32_2 %52 = OpLoad %30 
					                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 0 
					                                        f32_4 %54 = OpLoad %38 
					                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
					                                                      OpStore %38 %55 
					                                        f32_4 %59 = OpLoad %58 
					                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
					                               Uniform f32_4* %63 = OpAccessChain %18 %61 %61 
					                                        f32_4 %64 = OpLoad %63 
					                                        f32_4 %65 = OpFMul %60 %64 
					                                                      OpStore %56 %65 
					                               Uniform f32_4* %67 = OpAccessChain %18 %61 %66 
					                                        f32_4 %68 = OpLoad %67 
					                                        f32_4 %69 = OpLoad %58 
					                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
					                                        f32_4 %71 = OpFMul %68 %70 
					                                        f32_4 %72 = OpLoad %56 
					                                        f32_4 %73 = OpFAdd %71 %72 
					                                                      OpStore %56 %73 
					                               Uniform f32_4* %75 = OpAccessChain %18 %61 %74 
					                                        f32_4 %76 = OpLoad %75 
					                                        f32_4 %77 = OpLoad %58 
					                                        f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
					                                        f32_4 %79 = OpFMul %76 %78 
					                                        f32_4 %80 = OpLoad %56 
					                                        f32_4 %81 = OpFAdd %79 %80 
					                                                      OpStore %56 %81 
					                                        f32_4 %82 = OpLoad %56 
					                               Uniform f32_4* %83 = OpAccessChain %18 %61 %20 
					                                        f32_4 %84 = OpLoad %83 
					                                        f32_4 %85 = OpFAdd %82 %84 
					                                                      OpStore %56 %85 
					                                        f32_4 %87 = OpLoad %56 
					                                        f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
					                               Uniform f32_4* %89 = OpAccessChain %18 %74 %61 
					                                        f32_4 %90 = OpLoad %89 
					                                        f32_4 %91 = OpFMul %88 %90 
					                                                      OpStore %86 %91 
					                               Uniform f32_4* %92 = OpAccessChain %18 %74 %66 
					                                        f32_4 %93 = OpLoad %92 
					                                        f32_4 %94 = OpLoad %56 
					                                        f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
					                                        f32_4 %96 = OpFMul %93 %95 
					                                        f32_4 %97 = OpLoad %86 
					                                        f32_4 %98 = OpFAdd %96 %97 
					                                                      OpStore %86 %98 
					                               Uniform f32_4* %99 = OpAccessChain %18 %74 %74 
					                                       f32_4 %100 = OpLoad %99 
					                                       f32_4 %101 = OpLoad %56 
					                                       f32_4 %102 = OpVectorShuffle %101 %101 2 2 2 2 
					                                       f32_4 %103 = OpFMul %100 %102 
					                                       f32_4 %104 = OpLoad %86 
					                                       f32_4 %105 = OpFAdd %103 %104 
					                                                      OpStore %86 %105 
					                              Uniform f32_4* %106 = OpAccessChain %18 %74 %20 
					                                       f32_4 %107 = OpLoad %106 
					                                       f32_4 %108 = OpLoad %56 
					                                       f32_4 %109 = OpVectorShuffle %108 %108 3 3 3 3 
					                                       f32_4 %110 = OpFMul %107 %109 
					                                       f32_4 %111 = OpLoad %86 
					                                       f32_4 %112 = OpFAdd %110 %111 
					                                                      OpStore %56 %112 
					                                       f32_4 %117 = OpLoad %56 
					                               Output f32_4* %119 = OpAccessChain %116 %66 
					                                                      OpStore %119 %117 
					                                       f32_4 %122 = OpLoad %121 
					                                                      OpStore %120 %122 
					                                Private f32* %123 = OpAccessChain %56 %21 
					                                         f32 %124 = OpLoad %123 
					                                Uniform f32* %126 = OpAccessChain %18 %66 %125 
					                                         f32 %127 = OpLoad %126 
					                                         f32 %128 = OpFMul %124 %127 
					                                Private f32* %129 = OpAccessChain %56 %21 
					                                                      OpStore %129 %128 
					                                       f32_4 %130 = OpLoad %56 
					                                       f32_3 %131 = OpVectorShuffle %130 %130 0 3 1 
					                                       f32_3 %134 = OpFMul %131 %133 
					                                       f32_4 %135 = OpLoad %86 
					                                       f32_4 %136 = OpVectorShuffle %135 %134 4 1 5 6 
					                                                      OpStore %86 %136 
					                                       f32_4 %138 = OpLoad %56 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
					                                       f32_4 %140 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %141 = OpVectorShuffle %140 %139 0 1 4 5 
					                                                      OpStore vs_TEXCOORD1 %141 
					                                       f32_4 %142 = OpLoad %86 
					                                       f32_2 %143 = OpVectorShuffle %142 %142 2 2 
					                                       f32_4 %144 = OpLoad %86 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 0 3 
					                                       f32_2 %146 = OpFAdd %143 %145 
					                                       f32_4 %147 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 2 3 
					                                                      OpStore vs_TEXCOORD1 %148 
					                                       f32_4 %151 = OpLoad %38 
					                                       f32_2 %152 = OpVectorShuffle %151 %151 0 1 
					                                                      OpStore vs_TEXCOORD0 %152 
					                                       f32_4 %154 = OpLoad %38 
					                                       f32_2 %155 = OpVectorShuffle %154 %154 2 3 
					                                                      OpStore vs_TEXCOORD2 %155 
					                                 Output f32* %157 = OpAccessChain %116 %66 %21 
					                                         f32 %158 = OpLoad %157 
					                                         f32 %159 = OpFNegate %158 
					                                 Output f32* %160 = OpAccessChain %116 %66 %21 
					                                                      OpStore %160 %159 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 338
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %130 %134 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD1 Location 11 
					                                                      OpDecorate %22 DescriptorSet 22 
					                                                      OpDecorate %22 Binding 22 
					                                                      OpDecorate %26 DescriptorSet 26 
					                                                      OpDecorate %26 Binding 26 
					                                                      OpMemberDecorate %38 0 Offset 38 
					                                                      OpMemberDecorate %38 1 Offset 38 
					                                                      OpMemberDecorate %38 2 Offset 38 
					                                                      OpMemberDecorate %38 3 Offset 38 
					                                                      OpMemberDecorate %38 4 Offset 38 
					                                                      OpMemberDecorate %38 5 Offset 38 
					                                                      OpMemberDecorate %38 6 Offset 38 
					                                                      OpMemberDecorate %38 7 Offset 38 
					                                                      OpMemberDecorate %38 8 Offset 38 
					                                                      OpMemberDecorate %38 9 Offset 38 
					                                                      OpMemberDecorate %38 10 Offset 38 
					                                                      OpMemberDecorate %38 11 RelaxedPrecision 
					                                                      OpMemberDecorate %38 11 Offset 38 
					                                                      OpDecorate %38 Block 
					                                                      OpDecorate %40 DescriptorSet 40 
					                                                      OpDecorate %40 Binding 40 
					                                                      OpDecorate %130 Location 130 
					                                                      OpDecorate vs_TEXCOORD0 Location 134 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %149 DescriptorSet 149 
					                                                      OpDecorate %149 Binding 149 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %151 DescriptorSet 151 
					                                                      OpDecorate %151 Binding 151 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %241 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %247 RelaxedPrecision 
					                                                      OpDecorate %248 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %274 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %304 RelaxedPrecision 
					                                                      OpDecorate %305 RelaxedPrecision 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                              %12 = OpTypeVector %6 2 
					                                              %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %21 = OpTypePointer UniformConstant %20 
					         UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
					                                              %24 = OpTypeSampler 
					                                              %25 = OpTypePointer UniformConstant %24 
					                     UniformConstant sampler* %26 = OpVariable UniformConstant 
					                                              %28 = OpTypeSampledImage %20 
					                                              %33 = OpTypeInt 32 0 
					                                          u32 %34 = OpConstant 0 
					                                              %36 = OpTypePointer Private %6 
					                                              %38 = OpTypeStruct %7 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
					                                              %41 = OpTypeInt 32 1 
					                                          i32 %42 = OpConstant 1 
					                                          u32 %43 = OpConstant 2 
					                                              %44 = OpTypePointer Uniform %6 
					                                          u32 %50 = OpConstant 3 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                 Private f32* %60 = OpVariable Private 
					                                          i32 %61 = OpConstant 10 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                          f32 %73 = OpConstant 3,674022E-40 
					                                          i32 %76 = OpConstant 7 
					                                          i32 %80 = OpConstant 8 
					                                         f32 %104 = OpConstant 3,674022E-40 
					                                         f32 %106 = OpConstant 3,674022E-40 
					                                             %119 = OpTypeBool 
					                                             %120 = OpTypePointer Private %119 
					                               Private bool* %121 = OpVariable Private 
					                                         i32 %122 = OpConstant 3 
					                                             %129 = OpTypePointer Output %7 
					                               Output f32_4* %130 = OpVariable Output 
					                                             %133 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %136 = OpConstant 11 
					                                             %137 = OpTypePointer Uniform %7 
					                              Private f32_4* %148 = OpVariable Private 
					        UniformConstant read_only Texture2D* %149 = OpVariable UniformConstant 
					                    UniformConstant sampler* %151 = OpVariable UniformConstant 
					                                Private f32* %157 = OpVariable Private 
					                                         i32 %158 = OpConstant 0 
					                                         f32 %161 = OpConstant 3,674022E-40 
					                              Private f32_4* %163 = OpVariable Private 
					                                         u32 %164 = OpConstant 1 
					                                         i32 %167 = OpConstant 5 
					                                         f32 %174 = OpConstant 3,674022E-40 
					                              Private f32_4* %183 = OpVariable Private 
					                                         i32 %184 = OpConstant 4 
					                                         f32 %199 = OpConstant 3,674022E-40 
					                                         f32 %200 = OpConstant 3,674022E-40 
					                                         f32 %201 = OpConstant 3,674022E-40 
					                                         f32 %202 = OpConstant 3,674022E-40 
					                                       f32_4 %203 = OpConstantComposite %199 %200 %201 %202 
					                              Private f32_4* %213 = OpVariable Private 
					                              Private f32_4* %240 = OpVariable Private 
					                              Private f32_4* %247 = OpVariable Private 
					                              Private f32_4* %254 = OpVariable Private 
					                                         f32 %256 = OpConstant 3,674022E-40 
					                                       f32_4 %257 = OpConstantComposite %256 %256 %256 %256 
					                              Private f32_4* %267 = OpVariable Private 
					                              Private f32_4* %274 = OpVariable Private 
					                              Private f32_4* %279 = OpVariable Private 
					                                         i32 %291 = OpConstant 6 
					                                         i32 %308 = OpConstant 2 
					                                         i32 %326 = OpConstant 9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_4 %13 = OpLoad vs_TEXCOORD1 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                        f32_4 %15 = OpLoad vs_TEXCOORD1 
					                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
					                                        f32_2 %17 = OpFDiv %14 %16 
					                                        f32_4 %18 = OpLoad %9 
					                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
					                                                      OpStore %9 %19 
					                          read_only Texture2D %23 = OpLoad %22 
					                                      sampler %27 = OpLoad %26 
					                   read_only Texture2DSampled %29 = OpSampledImage %23 %27 
					                                        f32_4 %30 = OpLoad %9 
					                                        f32_2 %31 = OpVectorShuffle %30 %30 0 1 
					                                        f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                          f32 %35 = OpCompositeExtract %32 0 
					                                 Private f32* %37 = OpAccessChain %9 %34 
					                                                      OpStore %37 %35 
					                                 Uniform f32* %45 = OpAccessChain %40 %42 %43 
					                                          f32 %46 = OpLoad %45 
					                                 Private f32* %47 = OpAccessChain %9 %34 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpFMul %46 %48 
					                                 Uniform f32* %51 = OpAccessChain %40 %42 %50 
					                                          f32 %52 = OpLoad %51 
					                                          f32 %53 = OpFAdd %49 %52 
					                                 Private f32* %54 = OpAccessChain %9 %34 
					                                                      OpStore %54 %53 
					                                 Private f32* %56 = OpAccessChain %9 %34 
					                                          f32 %57 = OpLoad %56 
					                                          f32 %58 = OpFDiv %55 %57 
					                                 Private f32* %59 = OpAccessChain %9 %34 
					                                                      OpStore %59 %58 
					                                 Uniform f32* %62 = OpAccessChain %40 %61 
					                                          f32 %63 = OpLoad %62 
					                                          f32 %65 = OpFMul %63 %64 
					                                                      OpStore %60 %65 
					                                 Private f32* %66 = OpAccessChain %9 %34 
					                                          f32 %67 = OpLoad %66 
					                                          f32 %68 = OpLoad %60 
					                                          f32 %69 = OpFDiv %67 %68 
					                                 Private f32* %70 = OpAccessChain %9 %34 
					                                                      OpStore %70 %69 
					                                 Private f32* %71 = OpAccessChain %9 %34 
					                                          f32 %72 = OpLoad %71 
					                                          f32 %74 = OpExtInst %1 43 %72 %73 %55 
					                                 Private f32* %75 = OpAccessChain %9 %34 
					                                                      OpStore %75 %74 
					                                 Uniform f32* %77 = OpAccessChain %40 %76 
					                                          f32 %78 = OpLoad %77 
					                                          f32 %79 = OpFNegate %78 
					                                 Uniform f32* %81 = OpAccessChain %40 %80 
					                                          f32 %82 = OpLoad %81 
					                                          f32 %83 = OpFAdd %79 %82 
					                                                      OpStore %60 %83 
					                                 Private f32* %84 = OpAccessChain %9 %34 
					                                          f32 %85 = OpLoad %84 
					                                 Uniform f32* %86 = OpAccessChain %40 %76 
					                                          f32 %87 = OpLoad %86 
					                                          f32 %88 = OpFNegate %87 
					                                          f32 %89 = OpFAdd %85 %88 
					                                 Private f32* %90 = OpAccessChain %9 %34 
					                                                      OpStore %90 %89 
					                                          f32 %91 = OpLoad %60 
					                                          f32 %92 = OpFDiv %55 %91 
					                                                      OpStore %60 %92 
					                                          f32 %93 = OpLoad %60 
					                                 Private f32* %94 = OpAccessChain %9 %34 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFMul %93 %95 
					                                 Private f32* %97 = OpAccessChain %9 %34 
					                                                      OpStore %97 %96 
					                                 Private f32* %98 = OpAccessChain %9 %34 
					                                          f32 %99 = OpLoad %98 
					                                         f32 %100 = OpExtInst %1 43 %99 %73 %55 
					                                Private f32* %101 = OpAccessChain %9 %34 
					                                                      OpStore %101 %100 
					                                Private f32* %102 = OpAccessChain %9 %34 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %105 = OpFMul %103 %104 
					                                         f32 %107 = OpFAdd %105 %106 
					                                                      OpStore %60 %107 
					                                Private f32* %108 = OpAccessChain %9 %34 
					                                         f32 %109 = OpLoad %108 
					                                Private f32* %110 = OpAccessChain %9 %34 
					                                         f32 %111 = OpLoad %110 
					                                         f32 %112 = OpFMul %109 %111 
					                                Private f32* %113 = OpAccessChain %9 %34 
					                                                      OpStore %113 %112 
					                                       f32_4 %114 = OpLoad %9 
					                                       f32_4 %115 = OpVectorShuffle %114 %114 0 0 0 0 
					                                         f32 %116 = OpLoad %60 
					                                       f32_4 %117 = OpCompositeConstruct %116 %116 %116 %116 
					                                       f32_4 %118 = OpFMul %115 %117 
					                                                      OpStore %9 %118 
					                                Uniform f32* %123 = OpAccessChain %40 %122 
					                                         f32 %124 = OpLoad %123 
					                                        bool %125 = OpFOrdEqual %124 %55 
					                                                      OpStore %121 %125 
					                                        bool %126 = OpLoad %121 
					                                                      OpSelectionMerge %128 None 
					                                                      OpBranchConditional %126 %127 %128 
					                                             %127 = OpLabel 
					                                       f32_4 %131 = OpLoad %9 
					                                                      OpStore %130 %131 
					                                                      OpReturn
					                                             %128 = OpLabel 
					                                       f32_2 %135 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %138 = OpAccessChain %40 %136 
					                                       f32_4 %139 = OpLoad %138 
					                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
					                                       f32_2 %141 = OpFMul %135 %140 
					                              Uniform f32_4* %142 = OpAccessChain %40 %136 
					                                       f32_4 %143 = OpLoad %142 
					                                       f32_2 %144 = OpVectorShuffle %143 %143 2 3 
					                                       f32_2 %145 = OpFAdd %141 %144 
					                                       f32_4 %146 = OpLoad %9 
					                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
					                                                      OpStore %9 %147 
					                         read_only Texture2D %150 = OpLoad %149 
					                                     sampler %152 = OpLoad %151 
					                  read_only Texture2DSampled %153 = OpSampledImage %150 %152 
					                                       f32_4 %154 = OpLoad %9 
					                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
					                                       f32_4 %156 = OpImageSampleImplicitLod %153 %155 
					                                                      OpStore %148 %156 
					                                Uniform f32* %159 = OpAccessChain %40 %158 %34 
					                                         f32 %160 = OpLoad %159 
					                                         f32 %162 = OpFMul %160 %161 
					                                                      OpStore %157 %162 
					                                Private f32* %165 = OpAccessChain %9 %164 
					                                         f32 %166 = OpLoad %165 
					                                Uniform f32* %168 = OpAccessChain %40 %167 
					                                         f32 %169 = OpLoad %168 
					                                         f32 %170 = OpFMul %166 %169 
					                                Private f32* %171 = OpAccessChain %163 %34 
					                                                      OpStore %171 %170 
					                                Private f32* %172 = OpAccessChain %163 %34 
					                                         f32 %173 = OpLoad %172 
					                                         f32 %175 = OpFMul %173 %174 
					                                         f32 %176 = OpLoad %157 
					                                         f32 %177 = OpFAdd %175 %176 
					                                Private f32* %178 = OpAccessChain %163 %34 
					                                                      OpStore %178 %177 
					                                Private f32* %179 = OpAccessChain %163 %34 
					                                         f32 %180 = OpLoad %179 
					                                         f32 %181 = OpExtInst %1 13 %180 
					                                Private f32* %182 = OpAccessChain %163 %34 
					                                                      OpStore %182 %181 
					                                Uniform f32* %185 = OpAccessChain %40 %184 
					                                         f32 %186 = OpLoad %185 
					                                Uniform f32* %187 = OpAccessChain %40 %184 
					                                         f32 %188 = OpLoad %187 
					                                Uniform f32* %189 = OpAccessChain %40 %184 
					                                         f32 %190 = OpLoad %189 
					                                Uniform f32* %191 = OpAccessChain %40 %184 
					                                         f32 %192 = OpLoad %191 
					                                       f32_4 %193 = OpCompositeConstruct %186 %188 %190 %192 
					                                         f32 %194 = OpCompositeExtract %193 0 
					                                         f32 %195 = OpCompositeExtract %193 1 
					                                         f32 %196 = OpCompositeExtract %193 2 
					                                         f32 %197 = OpCompositeExtract %193 3 
					                                       f32_4 %198 = OpCompositeConstruct %194 %195 %196 %197 
					                                       f32_4 %204 = OpFMul %198 %203 
					                                                      OpStore %183 %204 
					                                       f32_4 %205 = OpLoad %163 
					                                       f32_4 %206 = OpVectorShuffle %205 %205 0 0 0 0 
					                                       f32_4 %207 = OpLoad %183 
					                                       f32_4 %208 = OpFDiv %206 %207 
					                                                      OpStore %163 %208 
					                                       f32_4 %209 = OpLoad %9 
					                                       f32_4 %210 = OpVectorShuffle %209 %209 0 0 0 0 
					                                       f32_4 %211 = OpLoad %163 
					                                       f32_4 %212 = OpFAdd %210 %211 
					                                                      OpStore %163 %212 
					                                       f32_4 %214 = OpLoad %163 
					                                Uniform f32* %215 = OpAccessChain %40 %167 
					                                         f32 %216 = OpLoad %215 
					                                       f32_4 %217 = OpCompositeConstruct %216 %216 %216 %216 
					                                       f32_4 %218 = OpFMul %214 %217 
					                                         f32 %219 = OpLoad %157 
					                                       f32_4 %220 = OpCompositeConstruct %219 %219 %219 %219 
					                                       f32_4 %221 = OpFAdd %218 %220 
					                                                      OpStore %213 %221 
					                                       f32_4 %222 = OpLoad %213 
					                                       f32_4 %223 = OpExtInst %1 14 %222 
					                                                      OpStore %213 %223 
					                                       f32_4 %224 = OpLoad %213 
					                                       f32_4 %225 = OpLoad %183 
					                                       f32_4 %226 = OpFDiv %224 %225 
					                                                      OpStore %183 %226 
					                                       f32_4 %227 = OpLoad %9 
					                                       f32_4 %228 = OpVectorShuffle %227 %227 1 1 1 1 
					                                       f32_4 %229 = OpLoad %183 
					                                       f32_4 %230 = OpVectorShuffle %229 %229 0 2 1 3 
					                                       f32_4 %231 = OpFAdd %228 %230 
					                                                      OpStore %183 %231 
					                                       f32_4 %232 = OpLoad %163 
					                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
					                                       f32_4 %234 = OpLoad %213 
					                                       f32_4 %235 = OpVectorShuffle %234 %233 4 1 5 3 
					                                                      OpStore %213 %235 
					                                       f32_4 %236 = OpLoad %183 
					                                       f32_2 %237 = OpVectorShuffle %236 %236 0 2 
					                                       f32_4 %238 = OpLoad %213 
					                                       f32_4 %239 = OpVectorShuffle %238 %237 0 4 2 5 
					                                                      OpStore %213 %239 
					                         read_only Texture2D %241 = OpLoad %149 
					                                     sampler %242 = OpLoad %151 
					                  read_only Texture2DSampled %243 = OpSampledImage %241 %242 
					                                       f32_4 %244 = OpLoad %213 
					                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
					                                       f32_4 %246 = OpImageSampleImplicitLod %243 %245 
					                                                      OpStore %240 %246 
					                         read_only Texture2D %248 = OpLoad %149 
					                                     sampler %249 = OpLoad %151 
					                  read_only Texture2DSampled %250 = OpSampledImage %248 %249 
					                                       f32_4 %251 = OpLoad %213 
					                                       f32_2 %252 = OpVectorShuffle %251 %251 2 3 
					                                       f32_4 %253 = OpImageSampleImplicitLod %250 %252 
					                                                      OpStore %247 %253 
					                                       f32_4 %255 = OpLoad %247 
					                                       f32_4 %258 = OpFMul %255 %257 
					                                                      OpStore %254 %258 
					                                       f32_4 %259 = OpLoad %240 
					                                       f32_4 %260 = OpFMul %259 %257 
					                                       f32_4 %261 = OpLoad %254 
					                                       f32_4 %262 = OpFAdd %260 %261 
					                                                      OpStore %254 %262 
					                                       f32_4 %263 = OpLoad %163 
					                                       f32_2 %264 = OpVectorShuffle %263 %263 2 3 
					                                       f32_4 %265 = OpLoad %183 
					                                       f32_4 %266 = OpVectorShuffle %265 %264 4 1 5 3 
					                                                      OpStore %183 %266 
					                         read_only Texture2D %268 = OpLoad %149 
					                                     sampler %269 = OpLoad %151 
					                  read_only Texture2DSampled %270 = OpSampledImage %268 %269 
					                                       f32_4 %271 = OpLoad %183 
					                                       f32_2 %272 = OpVectorShuffle %271 %271 0 1 
					                                       f32_4 %273 = OpImageSampleImplicitLod %270 %272 
					                                                      OpStore %267 %273 
					                                       f32_4 %275 = OpLoad %267 
					                                       f32_4 %276 = OpFMul %275 %257 
					                                       f32_4 %277 = OpLoad %254 
					                                       f32_4 %278 = OpFAdd %276 %277 
					                                                      OpStore %274 %278 
					                         read_only Texture2D %280 = OpLoad %149 
					                                     sampler %281 = OpLoad %151 
					                  read_only Texture2DSampled %282 = OpSampledImage %280 %281 
					                                       f32_4 %283 = OpLoad %183 
					                                       f32_2 %284 = OpVectorShuffle %283 %283 2 3 
					                                       f32_4 %285 = OpImageSampleImplicitLod %282 %284 
					                                                      OpStore %279 %285 
					                                       f32_4 %286 = OpLoad %279 
					                                       f32_4 %287 = OpFMul %286 %257 
					                                       f32_4 %288 = OpLoad %274 
					                                       f32_4 %289 = OpFAdd %287 %288 
					                                                      OpStore %274 %289 
					                                       f32_4 %290 = OpLoad %274 
					                                Uniform f32* %292 = OpAccessChain %40 %291 
					                                         f32 %293 = OpLoad %292 
					                                Uniform f32* %294 = OpAccessChain %40 %291 
					                                         f32 %295 = OpLoad %294 
					                                Uniform f32* %296 = OpAccessChain %40 %291 
					                                         f32 %297 = OpLoad %296 
					                                Uniform f32* %298 = OpAccessChain %40 %291 
					                                         f32 %299 = OpLoad %298 
					                                       f32_4 %300 = OpCompositeConstruct %293 %295 %297 %299 
					                                         f32 %301 = OpCompositeExtract %300 0 
					                                         f32 %302 = OpCompositeExtract %300 1 
					                                         f32 %303 = OpCompositeExtract %300 2 
					                                         f32 %304 = OpCompositeExtract %300 3 
					                                       f32_4 %305 = OpCompositeConstruct %301 %302 %303 %304 
					                                       f32_4 %306 = OpFMul %290 %305 
					                                                      OpStore %163 %306 
					                                       f32_4 %307 = OpLoad %163 
					                                Uniform f32* %309 = OpAccessChain %40 %308 
					                                         f32 %310 = OpLoad %309 
					                                Uniform f32* %311 = OpAccessChain %40 %308 
					                                         f32 %312 = OpLoad %311 
					                                Uniform f32* %313 = OpAccessChain %40 %308 
					                                         f32 %314 = OpLoad %313 
					                                Uniform f32* %315 = OpAccessChain %40 %308 
					                                         f32 %316 = OpLoad %315 
					                                       f32_4 %317 = OpCompositeConstruct %310 %312 %314 %316 
					                                         f32 %318 = OpCompositeExtract %317 0 
					                                         f32 %319 = OpCompositeExtract %317 1 
					                                         f32 %320 = OpCompositeExtract %317 2 
					                                         f32 %321 = OpCompositeExtract %317 3 
					                                       f32_4 %322 = OpCompositeConstruct %318 %319 %320 %321 
					                                       f32_4 %323 = OpFMul %307 %322 
					                                                      OpStore %163 %323 
					                                Private f32* %324 = OpAccessChain %9 %50 
					                                         f32 %325 = OpLoad %324 
					                                Uniform f32* %327 = OpAccessChain %40 %326 
					                                         f32 %328 = OpLoad %327 
					                                         f32 %329 = OpFMul %325 %328 
					                                Private f32* %330 = OpAccessChain %9 %34 
					                                                      OpStore %330 %329 
					                                       f32_4 %331 = OpLoad %9 
					                                       f32_4 %332 = OpVectorShuffle %331 %331 0 0 0 0 
					                                       f32_4 %333 = OpLoad %163 
					                                       f32_4 %334 = OpFMul %332 %333 
					                                       f32_4 %335 = OpLoad %148 
					                                       f32_4 %336 = OpFAdd %334 %335 
					                                                      OpStore %130 %336 
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
						float _Value2;
						float _Visualize;
						float Anomaly_Distortion;
						float Anomaly_Distortion_Size;
						float Anomaly_Intensity;
						float Anomaly_Near;
						float Anomaly_Far;
						float Anomaly_With_Obj;
						float _FixDistance;
						vec4 unused_0_10[2];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[6];
						vec4 _ZBufferParams;
						vec4 unused_1_3;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					float u_xlat6;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat6 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat6;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6 = (-Anomaly_Near) + Anomaly_Far;
					    u_xlat0.x = u_xlat0.x + (-Anomaly_Near);
					    u_xlat6 = float(1.0) / u_xlat6;
					    u_xlat0.x = u_xlat6 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0 = u_xlat0.xxxx * vec4(u_xlat6);
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    //ENDIF
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat12 = _Time.x * 20.0;
					    u_xlat2.x = u_xlat0.y * Anomaly_Distortion_Size;
					    u_xlat2.x = u_xlat2.x * 0.649999976 + u_xlat12;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat3 = vec4(vec4(Anomaly_Distortion, Anomaly_Distortion, Anomaly_Distortion, Anomaly_Distortion)) * vec4(32.0, 64.0, 96.0, 128.0);
					    u_xlat2 = u_xlat2.xxxx / u_xlat3;
					    u_xlat2 = u_xlat0.xxxx + u_xlat2;
					    u_xlat4 = u_xlat2 * vec4(Anomaly_Distortion_Size) + vec4(u_xlat12);
					    u_xlat4 = cos(u_xlat4);
					    u_xlat3 = u_xlat4 / u_xlat3;
					    u_xlat3 = u_xlat0.yyyy + u_xlat3.xzyw;
					    u_xlat4.xz = u_xlat2.xy;
					    u_xlat4.yw = u_xlat3.xz;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_4 = u_xlat10_4 * vec4(0.25, 0.25, 0.25, 0.25);
					    u_xlat16_4 = u_xlat10_5 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat16_4;
					    u_xlat3.xz = u_xlat2.zw;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat16_2 = u_xlat10_2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat16_4;
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_2 = u_xlat10_3 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat16_2;
					    u_xlat2 = u_xlat16_2 * vec4(vec4(Anomaly_Intensity, Anomaly_Intensity, Anomaly_Intensity, Anomaly_Intensity));
					    u_xlat2 = u_xlat2 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
					    u_xlat0.x = u_xlat0.w * Anomaly_With_Obj;
					    SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat10_1;
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