Shader "CameraFilterPack/3D_Matrix" {
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
			GpuProgramID 21024
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
					uniform 	vec4 _Time;
					uniform 	vec4 _ZBufferParams;
					uniform 	float _Visualize;
					uniform 	vec4 _MatrixColor;
					uniform 	float _DepthLevel;
					uniform 	float _FixDistance;
					uniform 	float _LightIntensity;
					uniform 	float _MatrixSize;
					uniform 	float _MatrixSpeed;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(2) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					bool u_xlatb5;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat5.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat5.x;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat1 = vec4(_DepthLevel) * u_xlat0.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlatb5 = _Visualize==1.0;
					    if(u_xlatb5){
					        SV_Target0 = u_xlat1;
					        return;
					    }
					    u_xlat5.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat15 = _Time.x * _MatrixSpeed;
					    u_xlat0.x = _DepthLevel * u_xlat0.x + 0.699999988;
					    u_xlat1.xy = u_xlat5.xy / u_xlat0.xx;
					    u_xlat1.z = _Time.x * _MatrixSpeed + u_xlat1.y;
					    u_xlat2.xy = u_xlat1.xz * vec2(_MatrixSize);
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat4 = (-_MatrixColor) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat10_3.xxxx + (-u_xlat4);
					    u_xlat0.x = u_xlat15 * 0.5;
					    u_xlat2.z = u_xlat1.z * _MatrixSize + u_xlat0.x;
					    u_xlat15 = _MatrixSize * 0.800000012;
					    u_xlat1.xy = vec2(u_xlat15) * u_xlat2.xz;
					    u_xlat10_4 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat3 = u_xlat3 + u_xlat10_4.xxxx;
					    u_xlat1.z = u_xlat2.z * u_xlat15 + u_xlat0.x;
					    u_xlat2.xy = vec2(u_xlat15) * u_xlat1.xz;
					    u_xlat10_4 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat3 = u_xlat3 + u_xlat10_4.yyyy;
					    u_xlat2.z = u_xlat1.z * u_xlat15 + u_xlat0.x;
					    u_xlat0.xw = vec2(u_xlat15) * u_xlat2.xz;
					    u_xlat10_2 = texture(_MainTex2, u_xlat0.xw);
					    u_xlat2 = u_xlat10_2.zzzz + u_xlat3;
					    u_xlat0.x = u_xlat2.x * _DepthLevel;
					    u_xlat0.xy = u_xlat0.xx * vec2(0.00999999978, 0.00999999978) + u_xlat5.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.x = u_xlat1.w * _LightIntensity;
					    u_xlat1 = u_xlat1.xxxx * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat10_0;
					    u_xlat1 = u_xlat1 + u_xlat2;
					    u_xlat1 = (-u_xlat10_0) + u_xlat1;
					    SV_Target0 = vec4(_DepthLevel) * u_xlat1 + u_xlat10_0;
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
					; Bound: 333
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %111 %115 
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
					                                                      OpMemberDecorate %38 9 RelaxedPrecision 
					                                                      OpMemberDecorate %38 9 Offset 38 
					                                                      OpDecorate %38 Block 
					                                                      OpDecorate %40 DescriptorSet 40 
					                                                      OpDecorate %40 Binding 40 
					                                                      OpDecorate %111 Location 111 
					                                                      OpDecorate vs_TEXCOORD0 Location 115 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %170 DescriptorSet 170 
					                                                      OpDecorate %170 Binding 170 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %172 DescriptorSet 172 
					                                                      OpDecorate %172 Binding 172 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %244 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %296 DescriptorSet 296 
					                                                      OpDecorate %296 Binding 296 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %298 DescriptorSet 298 
					                                                      OpDecorate %298 Binding 298 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %316 RelaxedPrecision 
					                                                      OpDecorate %321 RelaxedPrecision 
					                                                      OpDecorate %322 RelaxedPrecision 
					                                                      OpDecorate %330 RelaxedPrecision 
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
					                                              %38 = OpTypeStruct %7 %7 %6 %7 %6 %6 %6 %6 %6 %7 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32_4; f32; f32_4; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
					                                              %41 = OpTypeInt 32 1 
					                                          i32 %42 = OpConstant 1 
					                                          u32 %43 = OpConstant 2 
					                                              %44 = OpTypePointer Uniform %6 
					                                          u32 %50 = OpConstant 3 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                              %60 = OpTypePointer Private %12 
					                               Private f32_2* %61 = OpVariable Private 
					                                          i32 %62 = OpConstant 5 
					                                          f32 %65 = OpConstant 3,674022E-40 
					                                          f32 %81 = OpConstant 3,674022E-40 
					                                          f32 %86 = OpConstant 3,674022E-40 
					                               Private f32_4* %89 = OpVariable Private 
					                                          i32 %90 = OpConstant 4 
					                                          f32 %97 = OpConstant 3,674022E-40 
					                                        f32_4 %98 = OpConstantComposite %97 %97 %97 %97 
					                                             %100 = OpTypeBool 
					                                             %101 = OpTypePointer Private %100 
					                               Private bool* %102 = OpVariable Private 
					                                         i32 %103 = OpConstant 2 
					                                             %110 = OpTypePointer Output %7 
					                               Output f32_4* %111 = OpVariable Output 
					                                             %114 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %117 = OpConstant 9 
					                                             %118 = OpTypePointer Uniform %7 
					                                Private f32* %127 = OpVariable Private 
					                                         i32 %128 = OpConstant 0 
					                                         i32 %131 = OpConstant 8 
					                                         f32 %140 = OpConstant 3,674022E-40 
					                                         u32 %154 = OpConstant 1 
					                              Private f32_4* %159 = OpVariable Private 
					                                         i32 %162 = OpConstant 7 
					                              Private f32_4* %169 = OpVariable Private 
					        UniformConstant read_only Texture2D* %170 = OpVariable UniformConstant 
					                    UniformConstant sampler* %172 = OpVariable UniformConstant 
					                              Private f32_4* %180 = OpVariable Private 
					                                         i32 %181 = OpConstant 3 
					                                       f32_4 %185 = OpConstantComposite %55 %55 %55 %55 
					                                         f32 %206 = OpConstant 3,674022E-40 
					                                Private f32* %215 = OpVariable Private 
					                                Private f32* %242 = OpVariable Private 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                       f32_2 %290 = OpConstantComposite %289 %289 
					        UniformConstant read_only Texture2D* %296 = OpVariable UniformConstant 
					                    UniformConstant sampler* %298 = OpVariable UniformConstant 
					                                         i32 %306 = OpConstant 6 
					                                         f32 %313 = OpConstant 3,674022E-40 
					                                       f32_4 %314 = OpConstantComposite %313 %313 %313 %313 
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
					                                 Uniform f32* %63 = OpAccessChain %40 %62 
					                                          f32 %64 = OpLoad %63 
					                                          f32 %66 = OpFMul %64 %65 
					                                 Private f32* %67 = OpAccessChain %61 %34 
					                                                      OpStore %67 %66 
					                                 Private f32* %68 = OpAccessChain %9 %34 
					                                          f32 %69 = OpLoad %68 
					                                 Private f32* %70 = OpAccessChain %61 %34 
					                                          f32 %71 = OpLoad %70 
					                                          f32 %72 = OpFDiv %69 %71 
					                                 Private f32* %73 = OpAccessChain %9 %34 
					                                                      OpStore %73 %72 
					                                 Private f32* %74 = OpAccessChain %9 %34 
					                                          f32 %75 = OpLoad %74 
					                                          f32 %76 = OpFNegate %75 
					                                          f32 %77 = OpFAdd %76 %55 
					                                 Private f32* %78 = OpAccessChain %9 %34 
					                                                      OpStore %78 %77 
					                                 Private f32* %79 = OpAccessChain %9 %34 
					                                          f32 %80 = OpLoad %79 
					                                          f32 %82 = OpExtInst %1 43 %80 %81 %55 
					                                 Private f32* %83 = OpAccessChain %9 %34 
					                                                      OpStore %83 %82 
					                                 Private f32* %84 = OpAccessChain %9 %34 
					                                          f32 %85 = OpLoad %84 
					                                          f32 %87 = OpFAdd %85 %86 
					                                 Private f32* %88 = OpAccessChain %9 %34 
					                                                      OpStore %88 %87 
					                                 Uniform f32* %91 = OpAccessChain %40 %90 
					                                          f32 %92 = OpLoad %91 
					                                        f32_4 %93 = OpCompositeConstruct %92 %92 %92 %92 
					                                        f32_4 %94 = OpLoad %9 
					                                        f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
					                                        f32_4 %96 = OpFMul %93 %95 
					                                        f32_4 %99 = OpFAdd %96 %98 
					                                                      OpStore %89 %99 
					                                Uniform f32* %104 = OpAccessChain %40 %103 
					                                         f32 %105 = OpLoad %104 
					                                        bool %106 = OpFOrdEqual %105 %55 
					                                                      OpStore %102 %106 
					                                        bool %107 = OpLoad %102 
					                                                      OpSelectionMerge %109 None 
					                                                      OpBranchConditional %107 %108 %109 
					                                             %108 = OpLabel 
					                                       f32_4 %112 = OpLoad %89 
					                                                      OpStore %111 %112 
					                                                      OpReturn
					                                             %109 = OpLabel 
					                                       f32_2 %116 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %119 = OpAccessChain %40 %117 
					                                       f32_4 %120 = OpLoad %119 
					                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                       f32_2 %122 = OpFMul %116 %121 
					                              Uniform f32_4* %123 = OpAccessChain %40 %117 
					                                       f32_4 %124 = OpLoad %123 
					                                       f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                       f32_2 %126 = OpFAdd %122 %125 
					                                                      OpStore %61 %126 
					                                Uniform f32* %129 = OpAccessChain %40 %128 %34 
					                                         f32 %130 = OpLoad %129 
					                                Uniform f32* %132 = OpAccessChain %40 %131 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFMul %130 %133 
					                                                      OpStore %127 %134 
					                                Uniform f32* %135 = OpAccessChain %40 %90 
					                                         f32 %136 = OpLoad %135 
					                                Private f32* %137 = OpAccessChain %9 %34 
					                                         f32 %138 = OpLoad %137 
					                                         f32 %139 = OpFMul %136 %138 
					                                         f32 %141 = OpFAdd %139 %140 
					                                Private f32* %142 = OpAccessChain %9 %34 
					                                                      OpStore %142 %141 
					                                       f32_2 %143 = OpLoad %61 
					                                       f32_4 %144 = OpLoad %9 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 0 0 
					                                       f32_2 %146 = OpFDiv %143 %145 
					                                       f32_4 %147 = OpLoad %89 
					                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 2 3 
					                                                      OpStore %89 %148 
					                                Uniform f32* %149 = OpAccessChain %40 %128 %34 
					                                         f32 %150 = OpLoad %149 
					                                Uniform f32* %151 = OpAccessChain %40 %131 
					                                         f32 %152 = OpLoad %151 
					                                         f32 %153 = OpFMul %150 %152 
					                                Private f32* %155 = OpAccessChain %89 %154 
					                                         f32 %156 = OpLoad %155 
					                                         f32 %157 = OpFAdd %153 %156 
					                                Private f32* %158 = OpAccessChain %89 %43 
					                                                      OpStore %158 %157 
					                                       f32_4 %160 = OpLoad %89 
					                                       f32_2 %161 = OpVectorShuffle %160 %160 0 2 
					                                Uniform f32* %163 = OpAccessChain %40 %162 
					                                         f32 %164 = OpLoad %163 
					                                       f32_2 %165 = OpCompositeConstruct %164 %164 
					                                       f32_2 %166 = OpFMul %161 %165 
					                                       f32_4 %167 = OpLoad %159 
					                                       f32_4 %168 = OpVectorShuffle %167 %166 4 5 2 3 
					                                                      OpStore %159 %168 
					                         read_only Texture2D %171 = OpLoad %170 
					                                     sampler %173 = OpLoad %172 
					                  read_only Texture2DSampled %174 = OpSampledImage %171 %173 
					                                       f32_4 %175 = OpLoad %159 
					                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
					                                       f32_4 %177 = OpImageSampleImplicitLod %174 %176 
					                                         f32 %178 = OpCompositeExtract %177 0 
					                                Private f32* %179 = OpAccessChain %169 %34 
					                                                      OpStore %179 %178 
					                              Uniform f32_4* %182 = OpAccessChain %40 %181 
					                                       f32_4 %183 = OpLoad %182 
					                                       f32_4 %184 = OpFNegate %183 
					                                       f32_4 %186 = OpFAdd %184 %185 
					                                                      OpStore %180 %186 
					                                       f32_4 %187 = OpLoad %169 
					                                       f32_4 %188 = OpVectorShuffle %187 %187 0 0 0 0 
					                                       f32_4 %189 = OpLoad %180 
					                                       f32_4 %190 = OpFNegate %189 
					                                       f32_4 %191 = OpFAdd %188 %190 
					                                                      OpStore %180 %191 
					                                         f32 %192 = OpLoad %127 
					                                         f32 %193 = OpFMul %192 %97 
					                                Private f32* %194 = OpAccessChain %9 %34 
					                                                      OpStore %194 %193 
					                                Private f32* %195 = OpAccessChain %89 %43 
					                                         f32 %196 = OpLoad %195 
					                                Uniform f32* %197 = OpAccessChain %40 %162 
					                                         f32 %198 = OpLoad %197 
					                                         f32 %199 = OpFMul %196 %198 
					                                Private f32* %200 = OpAccessChain %9 %34 
					                                         f32 %201 = OpLoad %200 
					                                         f32 %202 = OpFAdd %199 %201 
					                                Private f32* %203 = OpAccessChain %159 %43 
					                                                      OpStore %203 %202 
					                                Uniform f32* %204 = OpAccessChain %40 %162 
					                                         f32 %205 = OpLoad %204 
					                                         f32 %207 = OpFMul %205 %206 
					                                                      OpStore %127 %207 
					                                         f32 %208 = OpLoad %127 
					                                       f32_2 %209 = OpCompositeConstruct %208 %208 
					                                       f32_4 %210 = OpLoad %159 
					                                       f32_2 %211 = OpVectorShuffle %210 %210 0 2 
					                                       f32_2 %212 = OpFMul %209 %211 
					                                       f32_4 %213 = OpLoad %89 
					                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
					                                                      OpStore %89 %214 
					                         read_only Texture2D %216 = OpLoad %170 
					                                     sampler %217 = OpLoad %172 
					                  read_only Texture2DSampled %218 = OpSampledImage %216 %217 
					                                       f32_4 %219 = OpLoad %89 
					                                       f32_2 %220 = OpVectorShuffle %219 %219 0 1 
					                                       f32_4 %221 = OpImageSampleImplicitLod %218 %220 
					                                         f32 %222 = OpCompositeExtract %221 0 
					                                                      OpStore %215 %222 
					                                         f32 %223 = OpLoad %215 
					                                       f32_4 %224 = OpCompositeConstruct %223 %223 %223 %223 
					                                       f32_4 %225 = OpLoad %180 
					                                       f32_4 %226 = OpFAdd %224 %225 
					                                                      OpStore %180 %226 
					                                Private f32* %227 = OpAccessChain %159 %43 
					                                         f32 %228 = OpLoad %227 
					                                         f32 %229 = OpLoad %127 
					                                         f32 %230 = OpFMul %228 %229 
					                                Private f32* %231 = OpAccessChain %9 %34 
					                                         f32 %232 = OpLoad %231 
					                                         f32 %233 = OpFAdd %230 %232 
					                                Private f32* %234 = OpAccessChain %89 %43 
					                                                      OpStore %234 %233 
					                                         f32 %235 = OpLoad %127 
					                                       f32_2 %236 = OpCompositeConstruct %235 %235 
					                                       f32_4 %237 = OpLoad %89 
					                                       f32_2 %238 = OpVectorShuffle %237 %237 0 2 
					                                       f32_2 %239 = OpFMul %236 %238 
					                                       f32_4 %240 = OpLoad %159 
					                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 2 3 
					                                                      OpStore %159 %241 
					                         read_only Texture2D %243 = OpLoad %170 
					                                     sampler %244 = OpLoad %172 
					                  read_only Texture2DSampled %245 = OpSampledImage %243 %244 
					                                       f32_4 %246 = OpLoad %159 
					                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
					                                       f32_4 %248 = OpImageSampleImplicitLod %245 %247 
					                                         f32 %249 = OpCompositeExtract %248 1 
					                                                      OpStore %242 %249 
					                                         f32 %250 = OpLoad %242 
					                                       f32_4 %251 = OpCompositeConstruct %250 %250 %250 %250 
					                                       f32_4 %252 = OpLoad %180 
					                                       f32_4 %253 = OpFAdd %251 %252 
					                                                      OpStore %180 %253 
					                                Private f32* %254 = OpAccessChain %89 %43 
					                                         f32 %255 = OpLoad %254 
					                                         f32 %256 = OpLoad %127 
					                                         f32 %257 = OpFMul %255 %256 
					                                Private f32* %258 = OpAccessChain %9 %34 
					                                         f32 %259 = OpLoad %258 
					                                         f32 %260 = OpFAdd %257 %259 
					                                Private f32* %261 = OpAccessChain %159 %43 
					                                                      OpStore %261 %260 
					                                         f32 %262 = OpLoad %127 
					                                       f32_2 %263 = OpCompositeConstruct %262 %262 
					                                       f32_4 %264 = OpLoad %159 
					                                       f32_2 %265 = OpVectorShuffle %264 %264 0 2 
					                                       f32_2 %266 = OpFMul %263 %265 
					                                       f32_4 %267 = OpLoad %9 
					                                       f32_4 %268 = OpVectorShuffle %267 %266 4 1 2 5 
					                                                      OpStore %9 %268 
					                         read_only Texture2D %269 = OpLoad %170 
					                                     sampler %270 = OpLoad %172 
					                  read_only Texture2DSampled %271 = OpSampledImage %269 %270 
					                                       f32_4 %272 = OpLoad %9 
					                                       f32_2 %273 = OpVectorShuffle %272 %272 0 3 
					                                       f32_4 %274 = OpImageSampleImplicitLod %271 %273 
					                                         f32 %275 = OpCompositeExtract %274 2 
					                                Private f32* %276 = OpAccessChain %169 %34 
					                                                      OpStore %276 %275 
					                                       f32_4 %277 = OpLoad %169 
					                                       f32_4 %278 = OpVectorShuffle %277 %277 0 0 0 0 
					                                       f32_4 %279 = OpLoad %180 
					                                       f32_4 %280 = OpFAdd %278 %279 
					                                                      OpStore %159 %280 
					                                Private f32* %281 = OpAccessChain %159 %34 
					                                         f32 %282 = OpLoad %281 
					                                Uniform f32* %283 = OpAccessChain %40 %90 
					                                         f32 %284 = OpLoad %283 
					                                         f32 %285 = OpFMul %282 %284 
					                                Private f32* %286 = OpAccessChain %9 %34 
					                                                      OpStore %286 %285 
					                                       f32_4 %287 = OpLoad %9 
					                                       f32_2 %288 = OpVectorShuffle %287 %287 0 0 
					                                       f32_2 %291 = OpFMul %288 %290 
					                                       f32_2 %292 = OpLoad %61 
					                                       f32_2 %293 = OpFAdd %291 %292 
					                                       f32_4 %294 = OpLoad %9 
					                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 2 3 
					                                                      OpStore %9 %295 
					                         read_only Texture2D %297 = OpLoad %296 
					                                     sampler %299 = OpLoad %298 
					                  read_only Texture2DSampled %300 = OpSampledImage %297 %299 
					                                       f32_4 %301 = OpLoad %9 
					                                       f32_2 %302 = OpVectorShuffle %301 %301 0 1 
					                                       f32_4 %303 = OpImageSampleImplicitLod %300 %302 
					                                                      OpStore %169 %303 
					                                Private f32* %304 = OpAccessChain %89 %50 
					                                         f32 %305 = OpLoad %304 
					                                Uniform f32* %307 = OpAccessChain %40 %306 
					                                         f32 %308 = OpLoad %307 
					                                         f32 %309 = OpFMul %305 %308 
					                                Private f32* %310 = OpAccessChain %89 %34 
					                                                      OpStore %310 %309 
					                                       f32_4 %311 = OpLoad %89 
					                                       f32_4 %312 = OpVectorShuffle %311 %311 0 0 0 0 
					                                       f32_4 %315 = OpFMul %312 %314 
					                                       f32_4 %316 = OpLoad %169 
					                                       f32_4 %317 = OpFAdd %315 %316 
					                                                      OpStore %89 %317 
					                                       f32_4 %318 = OpLoad %89 
					                                       f32_4 %319 = OpLoad %159 
					                                       f32_4 %320 = OpFAdd %318 %319 
					                                                      OpStore %89 %320 
					                                       f32_4 %321 = OpLoad %169 
					                                       f32_4 %322 = OpFNegate %321 
					                                       f32_4 %323 = OpLoad %89 
					                                       f32_4 %324 = OpFAdd %322 %323 
					                                                      OpStore %89 %324 
					                                Uniform f32* %325 = OpAccessChain %40 %90 
					                                         f32 %326 = OpLoad %325 
					                                       f32_4 %327 = OpCompositeConstruct %326 %326 %326 %326 
					                                       f32_4 %328 = OpLoad %89 
					                                       f32_4 %329 = OpFMul %327 %328 
					                                       f32_4 %330 = OpLoad %169 
					                                       f32_4 %331 = OpFAdd %329 %330 
					                                                      OpStore %111 %331 
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
						vec4 unused_0_2;
						vec4 _MatrixColor;
						float _DepthLevel;
						float _FixDistance;
						float _LightIntensity;
						float _MatrixSize;
						float _MatrixSpeed;
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[6];
						vec4 _ZBufferParams;
						vec4 unused_1_3;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					bool u_xlatb5;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat5.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat5.x;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat1 = vec4(_DepthLevel) * u_xlat0.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlatb5 = _Visualize==1.0;
					    if(u_xlatb5){
					        SV_Target0 = u_xlat1;
					        return;
					    //ENDIF
					    }
					    u_xlat5.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat15 = _MatrixSpeed * _Time.x;
					    u_xlat0.x = _DepthLevel * u_xlat0.x + 0.699999988;
					    u_xlat1.xy = u_xlat5.xy / u_xlat0.xx;
					    u_xlat1.z = _Time.x * _MatrixSpeed + u_xlat1.y;
					    u_xlat2.xy = u_xlat1.xz * vec2(_MatrixSize);
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat4 = (-_MatrixColor) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat10_3.xxxx + (-u_xlat4);
					    u_xlat0.x = u_xlat15 * 0.5;
					    u_xlat2.z = u_xlat1.z * _MatrixSize + u_xlat0.x;
					    u_xlat15 = _MatrixSize * 0.800000012;
					    u_xlat1.xy = vec2(u_xlat15) * u_xlat2.xz;
					    u_xlat10_4 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat3 = u_xlat3 + u_xlat10_4.xxxx;
					    u_xlat1.z = u_xlat2.z * u_xlat15 + u_xlat0.x;
					    u_xlat2.xy = vec2(u_xlat15) * u_xlat1.xz;
					    u_xlat10_4 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat3 = u_xlat3 + u_xlat10_4.yyyy;
					    u_xlat2.z = u_xlat1.z * u_xlat15 + u_xlat0.x;
					    u_xlat0.xw = vec2(u_xlat15) * u_xlat2.xz;
					    u_xlat10_2 = texture(_MainTex2, u_xlat0.xw);
					    u_xlat2 = u_xlat10_2.zzzz + u_xlat3;
					    u_xlat0.x = u_xlat2.x * _DepthLevel;
					    u_xlat0.xy = u_xlat0.xx * vec2(0.00999999978, 0.00999999978) + u_xlat5.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.x = u_xlat1.w * _LightIntensity;
					    u_xlat1 = u_xlat1.xxxx * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat10_0;
					    u_xlat1 = u_xlat1 + u_xlat2;
					    u_xlat1 = (-u_xlat10_0) + u_xlat1;
					    SV_Target0 = vec4(_DepthLevel) * u_xlat1 + u_xlat10_0;
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