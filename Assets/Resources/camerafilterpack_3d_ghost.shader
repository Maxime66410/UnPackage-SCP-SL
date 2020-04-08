Shader "CameraFilterPack/3D_Ghost" {
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
			GpuProgramID 11469
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
					uniform 	float _Visualize;
					uniform 	float _Value2;
					uniform 	float GhostPosX;
					uniform 	float GhostPosY;
					uniform 	float GhostFade;
					uniform 	float GhostFade2;
					uniform 	float GhostSize;
					uniform 	float Drop_Near;
					uniform 	float Drop_Far;
					uniform 	float Drop_With_Obj;
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
					vec4 u_xlat16_3;
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
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = (-Drop_Near) + Drop_Far;
					    u_xlat0.x = u_xlat0.x + (-Drop_Near);
					    u_xlat5 = float(1.0) / u_xlat5;
					    u_xlat0.x = u_xlat5 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0 = u_xlat0.xxxx * vec4(u_xlat5);
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
					    u_xlat10 = (-GhostSize) + 1.0;
					    u_xlat2.x = u_xlat10 * 0.5 + GhostPosX;
					    u_xlat2.y = u_xlat10 * 0.5 + GhostPosY;
					    u_xlat0.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat10_1 + u_xlat10_3;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat16_3 + u_xlat10_4;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat16_3 + u_xlat10_4;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_2 = u_xlat10_2 + u_xlat16_3;
					    u_xlat2 = u_xlat16_2 / vec4(vec4(GhostFade2, GhostFade2, GhostFade2, GhostFade2));
					    u_xlat2 = u_xlat2 + (-vec4(vec4(GhostFade, GhostFade, GhostFade, GhostFade)));
					    u_xlat2 = u_xlat2 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
					    u_xlat0.x = u_xlat0.w * Drop_With_Obj;
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
					; Bound: 371
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
					                                                      OpMemberDecorate %38 11 Offset 38 
					                                                      OpMemberDecorate %38 12 RelaxedPrecision 
					                                                      OpMemberDecorate %38 12 Offset 38 
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
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %241 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %301 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %304 RelaxedPrecision 
					                                                      OpDecorate %305 RelaxedPrecision 
					                                                      OpDecorate %315 RelaxedPrecision 
					                                                      OpDecorate %316 RelaxedPrecision 
					                                                      OpDecorate %317 RelaxedPrecision 
					                                                      OpDecorate %318 RelaxedPrecision 
					                                                      OpDecorate %319 RelaxedPrecision 
					                                                      OpDecorate %320 RelaxedPrecision 
					                                                      OpDecorate %321 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
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
					                                              %38 = OpTypeStruct %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
					                                              %41 = OpTypeInt 32 1 
					                                          i32 %42 = OpConstant 0 
					                                          u32 %43 = OpConstant 2 
					                                              %44 = OpTypePointer Uniform %6 
					                                          u32 %50 = OpConstant 3 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                 Private f32* %60 = OpVariable Private 
					                                          i32 %61 = OpConstant 11 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                          f32 %73 = OpConstant 3,674022E-40 
					                                          i32 %76 = OpConstant 8 
					                                          i32 %80 = OpConstant 9 
					                                         f32 %104 = OpConstant 3,674022E-40 
					                                         f32 %106 = OpConstant 3,674022E-40 
					                                             %119 = OpTypeBool 
					                                             %120 = OpTypePointer Private %119 
					                               Private bool* %121 = OpVariable Private 
					                                         i32 %122 = OpConstant 1 
					                                             %129 = OpTypePointer Output %7 
					                               Output f32_4* %130 = OpVariable Output 
					                                             %133 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %136 = OpConstant 12 
					                                             %137 = OpTypePointer Uniform %7 
					                              Private f32_4* %148 = OpVariable Private 
					        UniformConstant read_only Texture2D* %149 = OpVariable UniformConstant 
					                    UniformConstant sampler* %151 = OpVariable UniformConstant 
					                                         i32 %159 = OpConstant 7 
					                                Private f32* %171 = OpVariable Private 
					                              Private f32_4* %176 = OpVariable Private 
					                                         f32 %178 = OpConstant 3,674022E-40 
					                                         i32 %180 = OpConstant 3 
					                                         i32 %187 = OpConstant 4 
					                                         u32 %191 = OpConstant 1 
					                              Private f32_4* %201 = OpVariable Private 
					                              Private f32_4* %208 = OpVariable Private 
					                              Private f32_4* %233 = OpVariable Private 
					                              Private f32_4* %294 = OpVariable Private 
					                              Private f32_4* %301 = OpVariable Private 
					                                         i32 %306 = OpConstant 6 
					                                         i32 %323 = OpConstant 5 
					                                         i32 %341 = OpConstant 2 
					                                         i32 %359 = OpConstant 10 
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
					                                       f32_4 %157 = OpLoad %9 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
					                                Uniform f32* %160 = OpAccessChain %40 %159 
					                                         f32 %161 = OpLoad %160 
					                                Uniform f32* %162 = OpAccessChain %40 %159 
					                                         f32 %163 = OpLoad %162 
					                                       f32_2 %164 = OpCompositeConstruct %161 %163 
					                                         f32 %165 = OpCompositeExtract %164 0 
					                                         f32 %166 = OpCompositeExtract %164 1 
					                                       f32_2 %167 = OpCompositeConstruct %165 %166 
					                                       f32_2 %168 = OpFDiv %158 %167 
					                                       f32_4 %169 = OpLoad %9 
					                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 2 3 
					                                                      OpStore %9 %170 
					                                Uniform f32* %172 = OpAccessChain %40 %159 
					                                         f32 %173 = OpLoad %172 
					                                         f32 %174 = OpFNegate %173 
					                                         f32 %175 = OpFAdd %174 %55 
					                                                      OpStore %171 %175 
					                                         f32 %177 = OpLoad %171 
					                                         f32 %179 = OpFMul %177 %178 
					                                Uniform f32* %181 = OpAccessChain %40 %180 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpFAdd %179 %182 
					                                Private f32* %184 = OpAccessChain %176 %34 
					                                                      OpStore %184 %183 
					                                         f32 %185 = OpLoad %171 
					                                         f32 %186 = OpFMul %185 %178 
					                                Uniform f32* %188 = OpAccessChain %40 %187 
					                                         f32 %189 = OpLoad %188 
					                                         f32 %190 = OpFAdd %186 %189 
					                                Private f32* %192 = OpAccessChain %176 %191 
					                                                      OpStore %192 %190 
					                                       f32_4 %193 = OpLoad %9 
					                                       f32_2 %194 = OpVectorShuffle %193 %193 0 1 
					                                       f32_4 %195 = OpLoad %176 
					                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
					                                       f32_2 %197 = OpFNegate %196 
					                                       f32_2 %198 = OpFAdd %194 %197 
					                                       f32_4 %199 = OpLoad %9 
					                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 2 3 
					                                                      OpStore %9 %200 
					                         read_only Texture2D %202 = OpLoad %149 
					                                     sampler %203 = OpLoad %151 
					                  read_only Texture2DSampled %204 = OpSampledImage %202 %203 
					                                       f32_4 %205 = OpLoad %9 
					                                       f32_2 %206 = OpVectorShuffle %205 %205 0 1 
					                                       f32_4 %207 = OpImageSampleImplicitLod %204 %206 
					                                                      OpStore %201 %207 
					                                       f32_4 %209 = OpLoad %148 
					                                       f32_4 %210 = OpLoad %201 
					                                       f32_4 %211 = OpFAdd %209 %210 
					                                                      OpStore %208 %211 
					                                       f32_4 %212 = OpLoad %9 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
					                                Uniform f32* %214 = OpAccessChain %40 %159 
					                                         f32 %215 = OpLoad %214 
					                                Uniform f32* %216 = OpAccessChain %40 %159 
					                                         f32 %217 = OpLoad %216 
					                                       f32_2 %218 = OpCompositeConstruct %215 %217 
					                                         f32 %219 = OpCompositeExtract %218 0 
					                                         f32 %220 = OpCompositeExtract %218 1 
					                                       f32_2 %221 = OpCompositeConstruct %219 %220 
					                                       f32_2 %222 = OpFDiv %213 %221 
					                                       f32_4 %223 = OpLoad %9 
					                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 2 3 
					                                                      OpStore %9 %224 
					                                       f32_4 %225 = OpLoad %176 
					                                       f32_2 %226 = OpVectorShuffle %225 %225 0 1 
					                                       f32_2 %227 = OpFNegate %226 
					                                       f32_4 %228 = OpLoad %9 
					                                       f32_2 %229 = OpVectorShuffle %228 %228 0 1 
					                                       f32_2 %230 = OpFAdd %227 %229 
					                                       f32_4 %231 = OpLoad %9 
					                                       f32_4 %232 = OpVectorShuffle %231 %230 4 5 2 3 
					                                                      OpStore %9 %232 
					                         read_only Texture2D %234 = OpLoad %149 
					                                     sampler %235 = OpLoad %151 
					                  read_only Texture2DSampled %236 = OpSampledImage %234 %235 
					                                       f32_4 %237 = OpLoad %9 
					                                       f32_2 %238 = OpVectorShuffle %237 %237 0 1 
					                                       f32_4 %239 = OpImageSampleImplicitLod %236 %238 
					                                                      OpStore %233 %239 
					                                       f32_4 %240 = OpLoad %208 
					                                       f32_4 %241 = OpLoad %233 
					                                       f32_4 %242 = OpFAdd %240 %241 
					                                                      OpStore %208 %242 
					                                       f32_4 %243 = OpLoad %9 
					                                       f32_2 %244 = OpVectorShuffle %243 %243 0 1 
					                                Uniform f32* %245 = OpAccessChain %40 %159 
					                                         f32 %246 = OpLoad %245 
					                                Uniform f32* %247 = OpAccessChain %40 %159 
					                                         f32 %248 = OpLoad %247 
					                                       f32_2 %249 = OpCompositeConstruct %246 %248 
					                                         f32 %250 = OpCompositeExtract %249 0 
					                                         f32 %251 = OpCompositeExtract %249 1 
					                                       f32_2 %252 = OpCompositeConstruct %250 %251 
					                                       f32_2 %253 = OpFDiv %244 %252 
					                                       f32_4 %254 = OpLoad %9 
					                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 2 3 
					                                                      OpStore %9 %255 
					                                       f32_4 %256 = OpLoad %176 
					                                       f32_2 %257 = OpVectorShuffle %256 %256 0 1 
					                                       f32_2 %258 = OpFNegate %257 
					                                       f32_4 %259 = OpLoad %9 
					                                       f32_2 %260 = OpVectorShuffle %259 %259 0 1 
					                                       f32_2 %261 = OpFAdd %258 %260 
					                                       f32_4 %262 = OpLoad %9 
					                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
					                                                      OpStore %9 %263 
					                         read_only Texture2D %264 = OpLoad %149 
					                                     sampler %265 = OpLoad %151 
					                  read_only Texture2DSampled %266 = OpSampledImage %264 %265 
					                                       f32_4 %267 = OpLoad %9 
					                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
					                                       f32_4 %269 = OpImageSampleImplicitLod %266 %268 
					                                                      OpStore %233 %269 
					                                       f32_4 %270 = OpLoad %208 
					                                       f32_4 %271 = OpLoad %233 
					                                       f32_4 %272 = OpFAdd %270 %271 
					                                                      OpStore %208 %272 
					                                       f32_4 %273 = OpLoad %9 
					                                       f32_2 %274 = OpVectorShuffle %273 %273 0 1 
					                                Uniform f32* %275 = OpAccessChain %40 %159 
					                                         f32 %276 = OpLoad %275 
					                                Uniform f32* %277 = OpAccessChain %40 %159 
					                                         f32 %278 = OpLoad %277 
					                                       f32_2 %279 = OpCompositeConstruct %276 %278 
					                                         f32 %280 = OpCompositeExtract %279 0 
					                                         f32 %281 = OpCompositeExtract %279 1 
					                                       f32_2 %282 = OpCompositeConstruct %280 %281 
					                                       f32_2 %283 = OpFDiv %274 %282 
					                                       f32_4 %284 = OpLoad %9 
					                                       f32_4 %285 = OpVectorShuffle %284 %283 4 5 2 3 
					                                                      OpStore %9 %285 
					                                       f32_4 %286 = OpLoad %176 
					                                       f32_2 %287 = OpVectorShuffle %286 %286 0 1 
					                                       f32_2 %288 = OpFNegate %287 
					                                       f32_4 %289 = OpLoad %9 
					                                       f32_2 %290 = OpVectorShuffle %289 %289 0 1 
					                                       f32_2 %291 = OpFAdd %288 %290 
					                                       f32_4 %292 = OpLoad %9 
					                                       f32_4 %293 = OpVectorShuffle %292 %291 4 5 2 3 
					                                                      OpStore %9 %293 
					                         read_only Texture2D %295 = OpLoad %149 
					                                     sampler %296 = OpLoad %151 
					                  read_only Texture2DSampled %297 = OpSampledImage %295 %296 
					                                       f32_4 %298 = OpLoad %9 
					                                       f32_2 %299 = OpVectorShuffle %298 %298 0 1 
					                                       f32_4 %300 = OpImageSampleImplicitLod %297 %299 
					                                                      OpStore %294 %300 
					                                       f32_4 %302 = OpLoad %294 
					                                       f32_4 %303 = OpLoad %208 
					                                       f32_4 %304 = OpFAdd %302 %303 
					                                                      OpStore %301 %304 
					                                       f32_4 %305 = OpLoad %301 
					                                Uniform f32* %307 = OpAccessChain %40 %306 
					                                         f32 %308 = OpLoad %307 
					                                Uniform f32* %309 = OpAccessChain %40 %306 
					                                         f32 %310 = OpLoad %309 
					                                Uniform f32* %311 = OpAccessChain %40 %306 
					                                         f32 %312 = OpLoad %311 
					                                Uniform f32* %313 = OpAccessChain %40 %306 
					                                         f32 %314 = OpLoad %313 
					                                       f32_4 %315 = OpCompositeConstruct %308 %310 %312 %314 
					                                         f32 %316 = OpCompositeExtract %315 0 
					                                         f32 %317 = OpCompositeExtract %315 1 
					                                         f32 %318 = OpCompositeExtract %315 2 
					                                         f32 %319 = OpCompositeExtract %315 3 
					                                       f32_4 %320 = OpCompositeConstruct %316 %317 %318 %319 
					                                       f32_4 %321 = OpFDiv %305 %320 
					                                                      OpStore %176 %321 
					                                       f32_4 %322 = OpLoad %176 
					                                Uniform f32* %324 = OpAccessChain %40 %323 
					                                         f32 %325 = OpLoad %324 
					                                Uniform f32* %326 = OpAccessChain %40 %323 
					                                         f32 %327 = OpLoad %326 
					                                Uniform f32* %328 = OpAccessChain %40 %323 
					                                         f32 %329 = OpLoad %328 
					                                Uniform f32* %330 = OpAccessChain %40 %323 
					                                         f32 %331 = OpLoad %330 
					                                       f32_4 %332 = OpCompositeConstruct %325 %327 %329 %331 
					                                         f32 %333 = OpCompositeExtract %332 0 
					                                         f32 %334 = OpCompositeExtract %332 1 
					                                         f32 %335 = OpCompositeExtract %332 2 
					                                         f32 %336 = OpCompositeExtract %332 3 
					                                       f32_4 %337 = OpCompositeConstruct %333 %334 %335 %336 
					                                       f32_4 %338 = OpFNegate %337 
					                                       f32_4 %339 = OpFAdd %322 %338 
					                                                      OpStore %176 %339 
					                                       f32_4 %340 = OpLoad %176 
					                                Uniform f32* %342 = OpAccessChain %40 %341 
					                                         f32 %343 = OpLoad %342 
					                                Uniform f32* %344 = OpAccessChain %40 %341 
					                                         f32 %345 = OpLoad %344 
					                                Uniform f32* %346 = OpAccessChain %40 %341 
					                                         f32 %347 = OpLoad %346 
					                                Uniform f32* %348 = OpAccessChain %40 %341 
					                                         f32 %349 = OpLoad %348 
					                                       f32_4 %350 = OpCompositeConstruct %343 %345 %347 %349 
					                                         f32 %351 = OpCompositeExtract %350 0 
					                                         f32 %352 = OpCompositeExtract %350 1 
					                                         f32 %353 = OpCompositeExtract %350 2 
					                                         f32 %354 = OpCompositeExtract %350 3 
					                                       f32_4 %355 = OpCompositeConstruct %351 %352 %353 %354 
					                                       f32_4 %356 = OpFMul %340 %355 
					                                                      OpStore %176 %356 
					                                Private f32* %357 = OpAccessChain %9 %50 
					                                         f32 %358 = OpLoad %357 
					                                Uniform f32* %360 = OpAccessChain %40 %359 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpFMul %358 %361 
					                                Private f32* %363 = OpAccessChain %9 %34 
					                                                      OpStore %363 %362 
					                                       f32_4 %364 = OpLoad %9 
					                                       f32_4 %365 = OpVectorShuffle %364 %364 0 0 0 0 
					                                       f32_4 %366 = OpLoad %176 
					                                       f32_4 %367 = OpFMul %365 %366 
					                                       f32_4 %368 = OpLoad %148 
					                                       f32_4 %369 = OpFAdd %367 %368 
					                                                      OpStore %130 %369 
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
						float _Value2;
						float GhostPosX;
						float GhostPosY;
						float GhostFade;
						float GhostFade2;
						float GhostSize;
						float Drop_Near;
						float Drop_Far;
						float Drop_With_Obj;
						float _FixDistance;
						vec4 unused_0_12[2];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
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
					vec4 u_xlat16_3;
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
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = (-Drop_Near) + Drop_Far;
					    u_xlat0.x = u_xlat0.x + (-Drop_Near);
					    u_xlat5 = float(1.0) / u_xlat5;
					    u_xlat0.x = u_xlat5 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0 = u_xlat0.xxxx * vec4(u_xlat5);
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    //ENDIF
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
					    u_xlat10 = (-GhostSize) + 1.0;
					    u_xlat2.x = u_xlat10 * 0.5 + GhostPosX;
					    u_xlat2.y = u_xlat10 * 0.5 + GhostPosY;
					    u_xlat0.xy = u_xlat0.xy + (-u_xlat2.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat10_1 + u_xlat10_3;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat16_3 + u_xlat10_4;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat16_3 + u_xlat10_4;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(GhostSize, GhostSize));
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_2 = u_xlat10_2 + u_xlat16_3;
					    u_xlat2 = u_xlat16_2 / vec4(vec4(GhostFade2, GhostFade2, GhostFade2, GhostFade2));
					    u_xlat2 = u_xlat2 + (-vec4(vec4(GhostFade, GhostFade, GhostFade, GhostFade)));
					    u_xlat2 = u_xlat2 * vec4(vec4(_Value2, _Value2, _Value2, _Value2));
					    u_xlat0.x = u_xlat0.w * Drop_With_Obj;
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