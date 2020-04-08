Shader "CameraFilterPack/3D_Myst" {
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
			GpuProgramID 2664
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
					uniform 	vec3 _WorldSpaceCameraPos;
					uniform 	vec4 _ZBufferParams;
					uniform 	float _Visualize;
					uniform 	float _Near;
					uniform 	float _Far;
					uniform 	float _FixDistance;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(2) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat10;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat5 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat5;
					    u_xlat5 = _Far + _Near;
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat5 = u_xlat5 + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat5 = float(1.0) / u_xlat5;
					    u_xlat0.x = u_xlat5 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat10 = u_xlat0.x * u_xlat5;
					    u_xlat0.x = (-u_xlat5) * u_xlat0.x + 1.0;
					    u_xlat0 = vec4(u_xlat10) * u_xlat0.xxxx + vec4(u_xlat10);
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat2.y = _WorldSpaceCameraPos.y * 0.200000003 + u_xlat0.y;
					    u_xlat2.x = _Time.x * 2.0 + u_xlat0.x;
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat0.x = _Time.x * 2.0 + u_xlat2.x;
					    u_xlat0.y = u_xlat0.w * 0.400000006 + u_xlat2.y;
					    u_xlat2.xy = u_xlat0.xy * vec2(0.666666687, 0.666666687);
					    u_xlat10_4 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat0.z = u_xlat0.w * 1.20000005 + u_xlat2.y;
					    u_xlat0.xy = u_xlat0.xz * vec2(0.266666681, 0.400000006);
					    u_xlat10_2 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat16_0 = (-u_xlat10_3.x) + u_xlat10_4.x;
					    u_xlat16_0 = u_xlat10_2.z * u_xlat16_0 + u_xlat10_3.x;
					    u_xlat16_0 = u_xlat10_4.y + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_2.x + u_xlat16_0;
					    u_xlat0.x = u_xlat0.w * u_xlat16_0;
					    SV_Target0 = u_xlat0.xxxx * vec4(0.330000013, 0.330000013, 0.330000013, 0.330000013) + u_xlat10_1;
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
					; Bound: 301
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %162 %166 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD1 Location 11 
					                                                      OpDecorate %22 DescriptorSet 22 
					                                                      OpDecorate %22 Binding 22 
					                                                      OpDecorate %26 DescriptorSet 26 
					                                                      OpDecorate %26 Binding 26 
					                                                      OpMemberDecorate %39 0 Offset 39 
					                                                      OpMemberDecorate %39 1 Offset 39 
					                                                      OpMemberDecorate %39 2 Offset 39 
					                                                      OpMemberDecorate %39 3 Offset 39 
					                                                      OpMemberDecorate %39 4 Offset 39 
					                                                      OpMemberDecorate %39 5 Offset 39 
					                                                      OpMemberDecorate %39 6 Offset 39 
					                                                      OpMemberDecorate %39 7 RelaxedPrecision 
					                                                      OpMemberDecorate %39 7 Offset 39 
					                                                      OpDecorate %39 Block 
					                                                      OpDecorate %41 DescriptorSet 41 
					                                                      OpDecorate %41 Binding 41 
					                                                      OpDecorate %162 Location 162 
					                                                      OpDecorate vs_TEXCOORD0 Location 166 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %181 DescriptorSet 181 
					                                                      OpDecorate %181 Binding 181 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %183 DescriptorSet 183 
					                                                      OpDecorate %183 Binding 183 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %210 DescriptorSet 210 
					                                                      OpDecorate %210 Binding 210 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %212 RelaxedPrecision 
					                                                      OpDecorate %212 DescriptorSet 212 
					                                                      OpDecorate %212 Binding 212 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %241 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %246 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %287 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
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
					                                              %38 = OpTypeVector %6 3 
					                                              %39 = OpTypeStruct %7 %38 %7 %6 %6 %6 %6 %7 
					                                              %40 = OpTypePointer Uniform %39 
					Uniform struct {f32_4; f32_3; f32_4; f32; f32; f32; f32; f32_4;}* %41 = OpVariable Uniform 
					                                              %42 = OpTypeInt 32 1 
					                                          i32 %43 = OpConstant 2 
					                                          u32 %44 = OpConstant 2 
					                                              %45 = OpTypePointer Uniform %6 
					                                          u32 %51 = OpConstant 3 
					                                          f32 %56 = OpConstant 3,674022E-40 
					                                              %61 = OpTypePointer Private %12 
					                               Private f32_2* %62 = OpVariable Private 
					                                          i32 %63 = OpConstant 6 
					                                          f32 %66 = OpConstant 3,674022E-40 
					                                          i32 %75 = OpConstant 5 
					                                          i32 %78 = OpConstant 4 
					                                          f32 %85 = OpConstant 3,674022E-40 
					                                         f32 %118 = OpConstant 3,674022E-40 
					                                         f32 %120 = OpConstant 3,674022E-40 
					                                Private f32* %129 = OpVariable Private 
					                                             %151 = OpTypeBool 
					                                             %152 = OpTypePointer Private %151 
					                               Private bool* %153 = OpVariable Private 
					                                         i32 %154 = OpConstant 3 
					                                             %161 = OpTypePointer Output %7 
					                               Output f32_4* %162 = OpVariable Output 
					                                             %165 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %168 = OpConstant 7 
					                                             %169 = OpTypePointer Uniform %7 
					                              Private f32_4* %180 = OpVariable Private 
					        UniformConstant read_only Texture2D* %181 = OpVariable UniformConstant 
					                    UniformConstant sampler* %183 = OpVariable UniformConstant 
					                              Private f32_2* %189 = OpVariable Private 
					                                         i32 %190 = OpConstant 1 
					                                         u32 %191 = OpConstant 1 
					                                         f32 %194 = OpConstant 3,674022E-40 
					                                         i32 %200 = OpConstant 0 
					                                         f32 %203 = OpConstant 3,674022E-40 
					                                Private f32* %209 = OpVariable Private 
					        UniformConstant read_only Texture2D* %210 = OpVariable UniformConstant 
					                    UniformConstant sampler* %212 = OpVariable UniformConstant 
					                                             %218 = OpTypePointer Private %38 
					                              Private f32_3* %219 = OpVariable Private 
					                                         f32 %229 = OpConstant 3,674022E-40 
					                                         f32 %237 = OpConstant 3,674022E-40 
					                                       f32_2 %238 = OpConstantComposite %237 %237 
					                              Private f32_2* %240 = OpVariable Private 
					                                         f32 %249 = OpConstant 3,674022E-40 
					                                         f32 %257 = OpConstant 3,674022E-40 
					                                       f32_2 %258 = OpConstantComposite %257 %229 
					                              Private f32_2* %260 = OpVariable Private 
					                                Private f32* %267 = OpVariable Private 
					                                Private f32* %273 = OpVariable Private 
					                                         f32 %295 = OpConstant 3,674022E-40 
					                                       f32_4 %296 = OpConstantComposite %295 %295 %295 %295 
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
					                                 Uniform f32* %46 = OpAccessChain %41 %43 %44 
					                                          f32 %47 = OpLoad %46 
					                                 Private f32* %48 = OpAccessChain %9 %34 
					                                          f32 %49 = OpLoad %48 
					                                          f32 %50 = OpFMul %47 %49 
					                                 Uniform f32* %52 = OpAccessChain %41 %43 %51 
					                                          f32 %53 = OpLoad %52 
					                                          f32 %54 = OpFAdd %50 %53 
					                                 Private f32* %55 = OpAccessChain %9 %34 
					                                                      OpStore %55 %54 
					                                 Private f32* %57 = OpAccessChain %9 %34 
					                                          f32 %58 = OpLoad %57 
					                                          f32 %59 = OpFDiv %56 %58 
					                                 Private f32* %60 = OpAccessChain %9 %34 
					                                                      OpStore %60 %59 
					                                 Uniform f32* %64 = OpAccessChain %41 %63 
					                                          f32 %65 = OpLoad %64 
					                                          f32 %67 = OpFMul %65 %66 
					                                 Private f32* %68 = OpAccessChain %62 %34 
					                                                      OpStore %68 %67 
					                                 Private f32* %69 = OpAccessChain %9 %34 
					                                          f32 %70 = OpLoad %69 
					                                 Private f32* %71 = OpAccessChain %62 %34 
					                                          f32 %72 = OpLoad %71 
					                                          f32 %73 = OpFDiv %70 %72 
					                                 Private f32* %74 = OpAccessChain %9 %34 
					                                                      OpStore %74 %73 
					                                 Uniform f32* %76 = OpAccessChain %41 %75 
					                                          f32 %77 = OpLoad %76 
					                                 Uniform f32* %79 = OpAccessChain %41 %78 
					                                          f32 %80 = OpLoad %79 
					                                          f32 %81 = OpFAdd %77 %80 
					                                 Private f32* %82 = OpAccessChain %62 %34 
					                                                      OpStore %82 %81 
					                                 Private f32* %83 = OpAccessChain %62 %34 
					                                          f32 %84 = OpLoad %83 
					                                          f32 %86 = OpExtInst %1 43 %84 %85 %56 
					                                 Private f32* %87 = OpAccessChain %62 %34 
					                                                      OpStore %87 %86 
					                                 Private f32* %88 = OpAccessChain %62 %34 
					                                          f32 %89 = OpLoad %88 
					                                 Uniform f32* %90 = OpAccessChain %41 %78 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %92 = OpFNegate %91 
					                                          f32 %93 = OpFAdd %89 %92 
					                                 Private f32* %94 = OpAccessChain %62 %34 
					                                                      OpStore %94 %93 
					                                 Private f32* %95 = OpAccessChain %9 %34 
					                                          f32 %96 = OpLoad %95 
					                                 Uniform f32* %97 = OpAccessChain %41 %78 
					                                          f32 %98 = OpLoad %97 
					                                          f32 %99 = OpFNegate %98 
					                                         f32 %100 = OpFAdd %96 %99 
					                                Private f32* %101 = OpAccessChain %9 %34 
					                                                      OpStore %101 %100 
					                                Private f32* %102 = OpAccessChain %62 %34 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpFDiv %56 %103 
					                                Private f32* %105 = OpAccessChain %62 %34 
					                                                      OpStore %105 %104 
					                                Private f32* %106 = OpAccessChain %62 %34 
					                                         f32 %107 = OpLoad %106 
					                                Private f32* %108 = OpAccessChain %9 %34 
					                                         f32 %109 = OpLoad %108 
					                                         f32 %110 = OpFMul %107 %109 
					                                Private f32* %111 = OpAccessChain %9 %34 
					                                                      OpStore %111 %110 
					                                Private f32* %112 = OpAccessChain %9 %34 
					                                         f32 %113 = OpLoad %112 
					                                         f32 %114 = OpExtInst %1 43 %113 %85 %56 
					                                Private f32* %115 = OpAccessChain %9 %34 
					                                                      OpStore %115 %114 
					                                Private f32* %116 = OpAccessChain %9 %34 
					                                         f32 %117 = OpLoad %116 
					                                         f32 %119 = OpFMul %117 %118 
					                                         f32 %121 = OpFAdd %119 %120 
					                                Private f32* %122 = OpAccessChain %62 %34 
					                                                      OpStore %122 %121 
					                                Private f32* %123 = OpAccessChain %9 %34 
					                                         f32 %124 = OpLoad %123 
					                                Private f32* %125 = OpAccessChain %9 %34 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpFMul %124 %126 
					                                Private f32* %128 = OpAccessChain %9 %34 
					                                                      OpStore %128 %127 
					                                Private f32* %130 = OpAccessChain %9 %34 
					                                         f32 %131 = OpLoad %130 
					                                Private f32* %132 = OpAccessChain %62 %34 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFMul %131 %133 
					                                                      OpStore %129 %134 
					                                Private f32* %135 = OpAccessChain %62 %34 
					                                         f32 %136 = OpLoad %135 
					                                         f32 %137 = OpFNegate %136 
					                                Private f32* %138 = OpAccessChain %9 %34 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFMul %137 %139 
					                                         f32 %141 = OpFAdd %140 %56 
					                                Private f32* %142 = OpAccessChain %9 %34 
					                                                      OpStore %142 %141 
					                                         f32 %143 = OpLoad %129 
					                                       f32_4 %144 = OpCompositeConstruct %143 %143 %143 %143 
					                                       f32_4 %145 = OpLoad %9 
					                                       f32_4 %146 = OpVectorShuffle %145 %145 0 0 0 0 
					                                       f32_4 %147 = OpFMul %144 %146 
					                                         f32 %148 = OpLoad %129 
					                                       f32_4 %149 = OpCompositeConstruct %148 %148 %148 %148 
					                                       f32_4 %150 = OpFAdd %147 %149 
					                                                      OpStore %9 %150 
					                                Uniform f32* %155 = OpAccessChain %41 %154 
					                                         f32 %156 = OpLoad %155 
					                                        bool %157 = OpFOrdEqual %156 %56 
					                                                      OpStore %153 %157 
					                                        bool %158 = OpLoad %153 
					                                                      OpSelectionMerge %160 None 
					                                                      OpBranchConditional %158 %159 %160 
					                                             %159 = OpLabel 
					                                       f32_4 %163 = OpLoad %9 
					                                                      OpStore %162 %163 
					                                                      OpReturn
					                                             %160 = OpLabel 
					                                       f32_2 %167 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %170 = OpAccessChain %41 %168 
					                                       f32_4 %171 = OpLoad %170 
					                                       f32_2 %172 = OpVectorShuffle %171 %171 0 1 
					                                       f32_2 %173 = OpFMul %167 %172 
					                              Uniform f32_4* %174 = OpAccessChain %41 %168 
					                                       f32_4 %175 = OpLoad %174 
					                                       f32_2 %176 = OpVectorShuffle %175 %175 2 3 
					                                       f32_2 %177 = OpFAdd %173 %176 
					                                       f32_4 %178 = OpLoad %9 
					                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
					                                                      OpStore %9 %179 
					                         read_only Texture2D %182 = OpLoad %181 
					                                     sampler %184 = OpLoad %183 
					                  read_only Texture2DSampled %185 = OpSampledImage %182 %184 
					                                       f32_4 %186 = OpLoad %9 
					                                       f32_2 %187 = OpVectorShuffle %186 %186 0 1 
					                                       f32_4 %188 = OpImageSampleImplicitLod %185 %187 
					                                                      OpStore %180 %188 
					                                Uniform f32* %192 = OpAccessChain %41 %190 %191 
					                                         f32 %193 = OpLoad %192 
					                                         f32 %195 = OpFMul %193 %194 
					                                Private f32* %196 = OpAccessChain %9 %191 
					                                         f32 %197 = OpLoad %196 
					                                         f32 %198 = OpFAdd %195 %197 
					                                Private f32* %199 = OpAccessChain %189 %191 
					                                                      OpStore %199 %198 
					                                Uniform f32* %201 = OpAccessChain %41 %200 %34 
					                                         f32 %202 = OpLoad %201 
					                                         f32 %204 = OpFMul %202 %203 
					                                Private f32* %205 = OpAccessChain %9 %34 
					                                         f32 %206 = OpLoad %205 
					                                         f32 %207 = OpFAdd %204 %206 
					                                Private f32* %208 = OpAccessChain %189 %34 
					                                                      OpStore %208 %207 
					                         read_only Texture2D %211 = OpLoad %210 
					                                     sampler %213 = OpLoad %212 
					                  read_only Texture2DSampled %214 = OpSampledImage %211 %213 
					                                       f32_2 %215 = OpLoad %189 
					                                       f32_4 %216 = OpImageSampleImplicitLod %214 %215 
					                                         f32 %217 = OpCompositeExtract %216 0 
					                                                      OpStore %209 %217 
					                                Uniform f32* %220 = OpAccessChain %41 %200 %34 
					                                         f32 %221 = OpLoad %220 
					                                         f32 %222 = OpFMul %221 %203 
					                                Private f32* %223 = OpAccessChain %189 %34 
					                                         f32 %224 = OpLoad %223 
					                                         f32 %225 = OpFAdd %222 %224 
					                                Private f32* %226 = OpAccessChain %219 %34 
					                                                      OpStore %226 %225 
					                                Private f32* %227 = OpAccessChain %9 %51 
					                                         f32 %228 = OpLoad %227 
					                                         f32 %230 = OpFMul %228 %229 
					                                Private f32* %231 = OpAccessChain %189 %191 
					                                         f32 %232 = OpLoad %231 
					                                         f32 %233 = OpFAdd %230 %232 
					                                Private f32* %234 = OpAccessChain %219 %191 
					                                                      OpStore %234 %233 
					                                       f32_3 %235 = OpLoad %219 
					                                       f32_2 %236 = OpVectorShuffle %235 %235 0 1 
					                                       f32_2 %239 = OpFMul %236 %238 
					                                                      OpStore %62 %239 
					                         read_only Texture2D %241 = OpLoad %210 
					                                     sampler %242 = OpLoad %212 
					                  read_only Texture2DSampled %243 = OpSampledImage %241 %242 
					                                       f32_2 %244 = OpLoad %62 
					                                       f32_4 %245 = OpImageSampleImplicitLod %243 %244 
					                                       f32_2 %246 = OpVectorShuffle %245 %245 0 1 
					                                                      OpStore %240 %246 
					                                Private f32* %247 = OpAccessChain %9 %51 
					                                         f32 %248 = OpLoad %247 
					                                         f32 %250 = OpFMul %248 %249 
					                                Private f32* %251 = OpAccessChain %62 %191 
					                                         f32 %252 = OpLoad %251 
					                                         f32 %253 = OpFAdd %250 %252 
					                                Private f32* %254 = OpAccessChain %219 %44 
					                                                      OpStore %254 %253 
					                                       f32_3 %255 = OpLoad %219 
					                                       f32_2 %256 = OpVectorShuffle %255 %255 0 2 
					                                       f32_2 %259 = OpFMul %256 %258 
					                                                      OpStore %62 %259 
					                         read_only Texture2D %261 = OpLoad %210 
					                                     sampler %262 = OpLoad %212 
					                  read_only Texture2DSampled %263 = OpSampledImage %261 %262 
					                                       f32_2 %264 = OpLoad %62 
					                                       f32_4 %265 = OpImageSampleImplicitLod %263 %264 
					                                       f32_2 %266 = OpVectorShuffle %265 %265 0 2 
					                                                      OpStore %260 %266 
					                                         f32 %268 = OpLoad %209 
					                                         f32 %269 = OpFNegate %268 
					                                Private f32* %270 = OpAccessChain %240 %34 
					                                         f32 %271 = OpLoad %270 
					                                         f32 %272 = OpFAdd %269 %271 
					                                                      OpStore %267 %272 
					                                Private f32* %274 = OpAccessChain %260 %191 
					                                         f32 %275 = OpLoad %274 
					                                         f32 %276 = OpLoad %267 
					                                         f32 %277 = OpFMul %275 %276 
					                                         f32 %278 = OpLoad %209 
					                                         f32 %279 = OpFAdd %277 %278 
					                                                      OpStore %273 %279 
					                                Private f32* %280 = OpAccessChain %240 %191 
					                                         f32 %281 = OpLoad %280 
					                                         f32 %282 = OpLoad %273 
					                                         f32 %283 = OpFAdd %281 %282 
					                                                      OpStore %273 %283 
					                                Private f32* %284 = OpAccessChain %260 %34 
					                                         f32 %285 = OpLoad %284 
					                                         f32 %286 = OpLoad %273 
					                                         f32 %287 = OpFAdd %285 %286 
					                                                      OpStore %273 %287 
					                                Private f32* %288 = OpAccessChain %9 %51 
					                                         f32 %289 = OpLoad %288 
					                                         f32 %290 = OpLoad %273 
					                                         f32 %291 = OpFMul %289 %290 
					                                Private f32* %292 = OpAccessChain %9 %34 
					                                                      OpStore %292 %291 
					                                       f32_4 %293 = OpLoad %9 
					                                       f32_4 %294 = OpVectorShuffle %293 %293 0 0 0 0 
					                                       f32_4 %297 = OpFMul %294 %296 
					                                       f32_4 %298 = OpLoad %180 
					                                       f32_4 %299 = OpFAdd %297 %298 
					                                                      OpStore %162 %299 
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
						vec4 unused_0_6[2];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[2];
						vec4 _ZBufferParams;
						vec4 unused_1_5;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat10;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat5 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat5;
					    u_xlat5 = _Far + _Near;
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat5 = u_xlat5 + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat5 = float(1.0) / u_xlat5;
					    u_xlat0.x = u_xlat5 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat10 = u_xlat0.x * u_xlat5;
					    u_xlat0.x = (-u_xlat5) * u_xlat0.x + 1.0;
					    u_xlat0 = vec4(u_xlat10) * u_xlat0.xxxx + vec4(u_xlat10);
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    //ENDIF
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat2.y = _WorldSpaceCameraPos.y * 0.200000003 + u_xlat0.y;
					    u_xlat2.x = _Time.x * 2.0 + u_xlat0.x;
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat0.x = _Time.x * 2.0 + u_xlat2.x;
					    u_xlat0.y = u_xlat0.w * 0.400000006 + u_xlat2.y;
					    u_xlat2.xy = u_xlat0.xy * vec2(0.666666687, 0.666666687);
					    u_xlat10_4 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat0.z = u_xlat0.w * 1.20000005 + u_xlat2.y;
					    u_xlat0.xy = u_xlat0.xz * vec2(0.266666681, 0.400000006);
					    u_xlat10_2 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat16_0 = (-u_xlat10_3.x) + u_xlat10_4.x;
					    u_xlat16_0 = u_xlat10_2.z * u_xlat16_0 + u_xlat10_3.x;
					    u_xlat16_0 = u_xlat10_4.y + u_xlat16_0;
					    u_xlat16_0 = u_xlat10_2.x + u_xlat16_0;
					    u_xlat0.x = u_xlat0.w * u_xlat16_0;
					    SV_Target0 = u_xlat0.xxxx * vec4(0.330000013, 0.330000013, 0.330000013, 0.330000013) + u_xlat10_1;
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