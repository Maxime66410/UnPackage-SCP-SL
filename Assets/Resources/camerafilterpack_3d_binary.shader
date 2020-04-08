Shader "CameraFilterPack/3D_Binary" {
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
			GpuProgramID 63119
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
					uniform 	float _FadeFromBinary;
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
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat16_4;
					float u_xlat5;
					float u_xlat10;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat5 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat5;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat0.x = _DepthLevel * u_xlat0.x + 0.5;
					    u_xlat5 = (-u_xlat0.x) + 1.0;
					    u_xlat0 = vec4(vec4(_FadeFromBinary, _FadeFromBinary, _FadeFromBinary, _FadeFromBinary)) * vec4(u_xlat5) + u_xlat0.xxxx;
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = u_xlat0.w * 32.0;
					    u_xlat10 = floor(u_xlat10);
					    u_xlat15 = u_xlat10 * 0.03125;
					    u_xlat10 = u_xlat10 * 0.03125 + 0.200000003;
					    u_xlat10 = (-_FadeFromBinary) * 0.5 + u_xlat10;
					    u_xlat1.yz = u_xlat0.xy / vec2(u_xlat10);
					    u_xlat1.x = (-_Time.x) * _MatrixSpeed + u_xlat1.y;
					    u_xlat2.xyz = vec3(_MatrixSize, _MatrixSize, _LightIntensity) + vec3(1.0, 0.5, -1.0);
					    u_xlat1.xy = u_xlat1.xz * u_xlat2.xy;
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat3 = (-_MatrixColor) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = u_xlat10_1.xxxx + (-u_xlat3);
					    u_xlat10 = u_xlat1.x * _DepthLevel;
					    u_xlat0.xy = vec2(u_xlat10) * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_4 = u_xlat10_3 + u_xlat10_3;
					    u_xlat0 = vec4(u_xlat15) * u_xlat2.zzzz + u_xlat16_4;
					    u_xlat0 = u_xlat0 + u_xlat1;
					    u_xlat0 = (-u_xlat10_3) + u_xlat0;
					    SV_Target0 = vec4(_DepthLevel) * u_xlat0 + u_xlat10_3;
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
					; Bound: 284
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %131 %135 
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
					                                                      OpMemberDecorate %38 10 RelaxedPrecision 
					                                                      OpMemberDecorate %38 10 Offset 38 
					                                                      OpDecorate %38 Block 
					                                                      OpDecorate %40 DescriptorSet 40 
					                                                      OpDecorate %40 Binding 40 
					                                                      OpDecorate %131 Location 131 
					                                                      OpDecorate vs_TEXCOORD0 Location 135 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %214 DescriptorSet 214 
					                                                      OpDecorate %214 Binding 214 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %216 DescriptorSet 216 
					                                                      OpDecorate %216 Binding 216 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %250 DescriptorSet 250 
					                                                      OpDecorate %250 Binding 250 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %252 RelaxedPrecision 
					                                                      OpDecorate %252 DescriptorSet 252 
					                                                      OpDecorate %252 Binding 252 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
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
					                                              %38 = OpTypeStruct %7 %7 %6 %7 %6 %6 %6 %6 %6 %6 %7 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32_4; f32; f32_4; f32; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
					                                              %41 = OpTypeInt 32 1 
					                                          i32 %42 = OpConstant 1 
					                                          u32 %43 = OpConstant 2 
					                                              %44 = OpTypePointer Uniform %6 
					                                          u32 %50 = OpConstant 3 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                 Private f32* %60 = OpVariable Private 
					                                          i32 %61 = OpConstant 6 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                          f32 %78 = OpConstant 3,674022E-40 
					                                          f32 %83 = OpConstant 3,674022E-40 
					                                          i32 %86 = OpConstant 4 
					                                          f32 %92 = OpConstant 3,674022E-40 
					                                          i32 %99 = OpConstant 5 
					                                             %120 = OpTypeBool 
					                                             %121 = OpTypePointer Private %120 
					                               Private bool* %122 = OpVariable Private 
					                                         i32 %123 = OpConstant 2 
					                                             %130 = OpTypePointer Output %7 
					                               Output f32_4* %131 = OpVariable Output 
					                                             %134 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %137 = OpConstant 10 
					                                             %138 = OpTypePointer Uniform %7 
					                                Private f32* %149 = OpVariable Private 
					                                         f32 %152 = OpConstant 3,674022E-40 
					                                Private f32* %156 = OpVariable Private 
					                                         f32 %158 = OpConstant 3,674022E-40 
					                                         f32 %162 = OpConstant 3,674022E-40 
					                              Private f32_4* %170 = OpVariable Private 
					                                         i32 %178 = OpConstant 0 
					                                         i32 %182 = OpConstant 9 
					                                         u32 %186 = OpConstant 1 
					                                             %191 = OpTypeVector %6 3 
					                                             %192 = OpTypePointer Private %191 
					                              Private f32_3* %193 = OpVariable Private 
					                                         i32 %194 = OpConstant 8 
					                                         i32 %199 = OpConstant 7 
					                                         f32 %203 = OpConstant 3,674022E-40 
					                                       f32_3 %204 = OpConstantComposite %55 %92 %203 
					                                Private f32* %213 = OpVariable Private 
					        UniformConstant read_only Texture2D* %214 = OpVariable UniformConstant 
					                    UniformConstant sampler* %216 = OpVariable UniformConstant 
					                                         i32 %223 = OpConstant 3 
					                                       f32_4 %227 = OpConstantComposite %55 %55 %55 %55 
					                                         f32 %241 = OpConstant 3,674022E-40 
					                                       f32_2 %242 = OpConstantComposite %241 %241 
					                              Private f32_4* %249 = OpVariable Private 
					        UniformConstant read_only Texture2D* %250 = OpVariable UniformConstant 
					                    UniformConstant sampler* %252 = OpVariable UniformConstant 
					                              Private f32_4* %258 = OpVariable Private 
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
					                                          f32 %73 = OpFNegate %72 
					                                          f32 %74 = OpFAdd %73 %55 
					                                 Private f32* %75 = OpAccessChain %9 %34 
					                                                      OpStore %75 %74 
					                                 Private f32* %76 = OpAccessChain %9 %34 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %79 = OpExtInst %1 43 %77 %78 %55 
					                                 Private f32* %80 = OpAccessChain %9 %34 
					                                                      OpStore %80 %79 
					                                 Private f32* %81 = OpAccessChain %9 %34 
					                                          f32 %82 = OpLoad %81 
					                                          f32 %84 = OpFAdd %82 %83 
					                                 Private f32* %85 = OpAccessChain %9 %34 
					                                                      OpStore %85 %84 
					                                 Uniform f32* %87 = OpAccessChain %40 %86 
					                                          f32 %88 = OpLoad %87 
					                                 Private f32* %89 = OpAccessChain %9 %34 
					                                          f32 %90 = OpLoad %89 
					                                          f32 %91 = OpFMul %88 %90 
					                                          f32 %93 = OpFAdd %91 %92 
					                                 Private f32* %94 = OpAccessChain %9 %34 
					                                                      OpStore %94 %93 
					                                 Private f32* %95 = OpAccessChain %9 %34 
					                                          f32 %96 = OpLoad %95 
					                                          f32 %97 = OpFNegate %96 
					                                          f32 %98 = OpFAdd %97 %55 
					                                                      OpStore %60 %98 
					                                Uniform f32* %100 = OpAccessChain %40 %99 
					                                         f32 %101 = OpLoad %100 
					                                Uniform f32* %102 = OpAccessChain %40 %99 
					                                         f32 %103 = OpLoad %102 
					                                Uniform f32* %104 = OpAccessChain %40 %99 
					                                         f32 %105 = OpLoad %104 
					                                Uniform f32* %106 = OpAccessChain %40 %99 
					                                         f32 %107 = OpLoad %106 
					                                       f32_4 %108 = OpCompositeConstruct %101 %103 %105 %107 
					                                         f32 %109 = OpCompositeExtract %108 0 
					                                         f32 %110 = OpCompositeExtract %108 1 
					                                         f32 %111 = OpCompositeExtract %108 2 
					                                         f32 %112 = OpCompositeExtract %108 3 
					                                       f32_4 %113 = OpCompositeConstruct %109 %110 %111 %112 
					                                         f32 %114 = OpLoad %60 
					                                       f32_4 %115 = OpCompositeConstruct %114 %114 %114 %114 
					                                       f32_4 %116 = OpFMul %113 %115 
					                                       f32_4 %117 = OpLoad %9 
					                                       f32_4 %118 = OpVectorShuffle %117 %117 0 0 0 0 
					                                       f32_4 %119 = OpFAdd %116 %118 
					                                                      OpStore %9 %119 
					                                Uniform f32* %124 = OpAccessChain %40 %123 
					                                         f32 %125 = OpLoad %124 
					                                        bool %126 = OpFOrdEqual %125 %55 
					                                                      OpStore %122 %126 
					                                        bool %127 = OpLoad %122 
					                                                      OpSelectionMerge %129 None 
					                                                      OpBranchConditional %127 %128 %129 
					                                             %128 = OpLabel 
					                                       f32_4 %132 = OpLoad %9 
					                                                      OpStore %131 %132 
					                                                      OpReturn
					                                             %129 = OpLabel 
					                                       f32_2 %136 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %139 = OpAccessChain %40 %137 
					                                       f32_4 %140 = OpLoad %139 
					                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
					                                       f32_2 %142 = OpFMul %136 %141 
					                              Uniform f32_4* %143 = OpAccessChain %40 %137 
					                                       f32_4 %144 = OpLoad %143 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 2 3 
					                                       f32_2 %146 = OpFAdd %142 %145 
					                                       f32_4 %147 = OpLoad %9 
					                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 2 3 
					                                                      OpStore %9 %148 
					                                Private f32* %150 = OpAccessChain %9 %50 
					                                         f32 %151 = OpLoad %150 
					                                         f32 %153 = OpFMul %151 %152 
					                                                      OpStore %149 %153 
					                                         f32 %154 = OpLoad %149 
					                                         f32 %155 = OpExtInst %1 8 %154 
					                                                      OpStore %149 %155 
					                                         f32 %157 = OpLoad %149 
					                                         f32 %159 = OpFMul %157 %158 
					                                                      OpStore %156 %159 
					                                         f32 %160 = OpLoad %149 
					                                         f32 %161 = OpFMul %160 %158 
					                                         f32 %163 = OpFAdd %161 %162 
					                                                      OpStore %149 %163 
					                                Uniform f32* %164 = OpAccessChain %40 %99 
					                                         f32 %165 = OpLoad %164 
					                                         f32 %166 = OpFNegate %165 
					                                         f32 %167 = OpFMul %166 %92 
					                                         f32 %168 = OpLoad %149 
					                                         f32 %169 = OpFAdd %167 %168 
					                                                      OpStore %149 %169 
					                                       f32_4 %171 = OpLoad %9 
					                                       f32_2 %172 = OpVectorShuffle %171 %171 0 1 
					                                         f32 %173 = OpLoad %149 
					                                       f32_2 %174 = OpCompositeConstruct %173 %173 
					                                       f32_2 %175 = OpFDiv %172 %174 
					                                       f32_4 %176 = OpLoad %170 
					                                       f32_4 %177 = OpVectorShuffle %176 %175 0 4 5 3 
					                                                      OpStore %170 %177 
					                                Uniform f32* %179 = OpAccessChain %40 %178 %34 
					                                         f32 %180 = OpLoad %179 
					                                         f32 %181 = OpFNegate %180 
					                                Uniform f32* %183 = OpAccessChain %40 %182 
					                                         f32 %184 = OpLoad %183 
					                                         f32 %185 = OpFMul %181 %184 
					                                Private f32* %187 = OpAccessChain %170 %186 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpFAdd %185 %188 
					                                Private f32* %190 = OpAccessChain %170 %34 
					                                                      OpStore %190 %189 
					                                Uniform f32* %195 = OpAccessChain %40 %194 
					                                         f32 %196 = OpLoad %195 
					                                Uniform f32* %197 = OpAccessChain %40 %194 
					                                         f32 %198 = OpLoad %197 
					                                Uniform f32* %200 = OpAccessChain %40 %199 
					                                         f32 %201 = OpLoad %200 
					                                       f32_3 %202 = OpCompositeConstruct %196 %198 %201 
					                                       f32_3 %205 = OpFAdd %202 %204 
					                                                      OpStore %193 %205 
					                                       f32_4 %206 = OpLoad %170 
					                                       f32_2 %207 = OpVectorShuffle %206 %206 0 2 
					                                       f32_3 %208 = OpLoad %193 
					                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
					                                       f32_2 %210 = OpFMul %207 %209 
					                                       f32_4 %211 = OpLoad %170 
					                                       f32_4 %212 = OpVectorShuffle %211 %210 4 5 2 3 
					                                                      OpStore %170 %212 
					                         read_only Texture2D %215 = OpLoad %214 
					                                     sampler %217 = OpLoad %216 
					                  read_only Texture2DSampled %218 = OpSampledImage %215 %217 
					                                       f32_4 %219 = OpLoad %170 
					                                       f32_2 %220 = OpVectorShuffle %219 %219 0 1 
					                                       f32_4 %221 = OpImageSampleImplicitLod %218 %220 
					                                         f32 %222 = OpCompositeExtract %221 0 
					                                                      OpStore %213 %222 
					                              Uniform f32_4* %224 = OpAccessChain %40 %223 
					                                       f32_4 %225 = OpLoad %224 
					                                       f32_4 %226 = OpFNegate %225 
					                                       f32_4 %228 = OpFAdd %226 %227 
					                                                      OpStore %170 %228 
					                                         f32 %229 = OpLoad %213 
					                                       f32_4 %230 = OpCompositeConstruct %229 %229 %229 %229 
					                                       f32_4 %231 = OpLoad %170 
					                                       f32_4 %232 = OpFNegate %231 
					                                       f32_4 %233 = OpFAdd %230 %232 
					                                                      OpStore %170 %233 
					                                Private f32* %234 = OpAccessChain %170 %34 
					                                         f32 %235 = OpLoad %234 
					                                Uniform f32* %236 = OpAccessChain %40 %86 
					                                         f32 %237 = OpLoad %236 
					                                         f32 %238 = OpFMul %235 %237 
					                                                      OpStore %149 %238 
					                                         f32 %239 = OpLoad %149 
					                                       f32_2 %240 = OpCompositeConstruct %239 %239 
					                                       f32_2 %243 = OpFMul %240 %242 
					                                       f32_4 %244 = OpLoad %9 
					                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
					                                       f32_2 %246 = OpFAdd %243 %245 
					                                       f32_4 %247 = OpLoad %9 
					                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 2 3 
					                                                      OpStore %9 %248 
					                         read_only Texture2D %251 = OpLoad %250 
					                                     sampler %253 = OpLoad %252 
					                  read_only Texture2DSampled %254 = OpSampledImage %251 %253 
					                                       f32_4 %255 = OpLoad %9 
					                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
					                                       f32_4 %257 = OpImageSampleImplicitLod %254 %256 
					                                                      OpStore %249 %257 
					                                       f32_4 %259 = OpLoad %249 
					                                       f32_4 %260 = OpLoad %249 
					                                       f32_4 %261 = OpFAdd %259 %260 
					                                                      OpStore %258 %261 
					                                         f32 %262 = OpLoad %156 
					                                       f32_4 %263 = OpCompositeConstruct %262 %262 %262 %262 
					                                       f32_3 %264 = OpLoad %193 
					                                       f32_4 %265 = OpVectorShuffle %264 %264 2 2 2 2 
					                                       f32_4 %266 = OpFMul %263 %265 
					                                       f32_4 %267 = OpLoad %258 
					                                       f32_4 %268 = OpFAdd %266 %267 
					                                                      OpStore %9 %268 
					                                       f32_4 %269 = OpLoad %9 
					                                       f32_4 %270 = OpLoad %170 
					                                       f32_4 %271 = OpFAdd %269 %270 
					                                                      OpStore %9 %271 
					                                       f32_4 %272 = OpLoad %249 
					                                       f32_4 %273 = OpFNegate %272 
					                                       f32_4 %274 = OpLoad %9 
					                                       f32_4 %275 = OpFAdd %273 %274 
					                                                      OpStore %9 %275 
					                                Uniform f32* %276 = OpAccessChain %40 %86 
					                                         f32 %277 = OpLoad %276 
					                                       f32_4 %278 = OpCompositeConstruct %277 %277 %277 %277 
					                                       f32_4 %279 = OpLoad %9 
					                                       f32_4 %280 = OpFMul %278 %279 
					                                       f32_4 %281 = OpLoad %249 
					                                       f32_4 %282 = OpFAdd %280 %281 
					                                                      OpStore %131 %282 
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
						float _FadeFromBinary;
						float _FixDistance;
						float _LightIntensity;
						float _MatrixSize;
						float _MatrixSpeed;
						vec4 unused_0_10;
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
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat16_4;
					float u_xlat5;
					float u_xlat10;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat5 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat5;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat0.x = _DepthLevel * u_xlat0.x + 0.5;
					    u_xlat5 = (-u_xlat0.x) + 1.0;
					    u_xlat0 = vec4(vec4(_FadeFromBinary, _FadeFromBinary, _FadeFromBinary, _FadeFromBinary)) * vec4(u_xlat5) + u_xlat0.xxxx;
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    //ENDIF
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = u_xlat0.w * 32.0;
					    u_xlat10 = floor(u_xlat10);
					    u_xlat15 = u_xlat10 * 0.03125;
					    u_xlat10 = u_xlat10 * 0.03125 + 0.200000003;
					    u_xlat10 = (-_FadeFromBinary) * 0.5 + u_xlat10;
					    u_xlat1.yz = u_xlat0.xy / vec2(u_xlat10);
					    u_xlat1.x = (-_Time.x) * _MatrixSpeed + u_xlat1.y;
					    u_xlat2.xyz = vec3(_MatrixSize, _MatrixSize, _LightIntensity) + vec3(1.0, 0.5, -1.0);
					    u_xlat1.xy = u_xlat1.xz * u_xlat2.xy;
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat3 = (-_MatrixColor) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = u_xlat10_1.xxxx + (-u_xlat3);
					    u_xlat10 = u_xlat1.x * _DepthLevel;
					    u_xlat0.xy = vec2(u_xlat10) * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_4 = u_xlat10_3 + u_xlat10_3;
					    u_xlat0 = vec4(u_xlat15) * u_xlat2.zzzz + u_xlat16_4;
					    u_xlat0 = u_xlat0 + u_xlat1;
					    u_xlat0 = (-u_xlat10_3) + u_xlat0;
					    SV_Target0 = vec4(_DepthLevel) * u_xlat0 + u_xlat10_3;
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