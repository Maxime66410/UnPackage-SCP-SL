Shader "CameraFilterPack/Atmosphere_Fog" {
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
			GpuProgramID 43150
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
					uniform 	vec4 _ColorRGB;
					uniform 	float _Near;
					uniform 	float _Far;
					uniform 	float _DepthLevel;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat2 = (-_Near) + _Far;
					    u_xlat2 = float(1.0) / u_xlat2;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat2;
					    u_xlat0.xyz = (-u_xlat0.xxx);
					    u_xlat0.w = 0.0;
					    u_xlat0 = vec4(vec4(_DepthLevel, _DepthLevel, _DepthLevel, _DepthLevel)) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = u_xlat10_1 + (-_ColorRGB);
					    SV_Target0 = u_xlat0 * u_xlat1 + _ColorRGB;
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
					; Bound: 178
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %140 %170 
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
					                                                      OpMemberDecorate %38 5 RelaxedPrecision 
					                                                      OpMemberDecorate %38 5 Offset 38 
					                                                      OpDecorate %38 Block 
					                                                      OpDecorate %40 DescriptorSet 40 
					                                                      OpDecorate %40 Binding 40 
					                                                      OpDecorate vs_TEXCOORD0 Location 140 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %155 DescriptorSet 155 
					                                                      OpDecorate %155 Binding 155 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %157 DescriptorSet 157 
					                                                      OpDecorate %157 Binding 157 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %170 Location 170 
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
					                                              %38 = OpTypeStruct %7 %7 %6 %6 %6 %7 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32_4; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
					                                              %41 = OpTypeInt 32 1 
					                                          i32 %42 = OpConstant 0 
					                                              %43 = OpTypePointer Uniform %6 
					                                          u32 %49 = OpConstant 1 
					                                          f32 %54 = OpConstant 3,674022E-40 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                          i32 %69 = OpConstant 2 
					                                 Private f32* %75 = OpVariable Private 
					                                          i32 %79 = OpConstant 3 
					                                          f32 %96 = OpConstant 3,674022E-40 
					                                          f32 %98 = OpConstant 3,674022E-40 
					                                             %111 = OpTypeVector %6 3 
					                                         u32 %117 = OpConstant 3 
					                                         i32 %119 = OpConstant 4 
					                                       f32_4 %136 = OpConstantComposite %54 %54 %54 %54 
					                              Private f32_4* %138 = OpVariable Private 
					                                             %139 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %142 = OpConstant 5 
					                                             %143 = OpTypePointer Uniform %7 
					                              Private f32_4* %154 = OpVariable Private 
					        UniformConstant read_only Texture2D* %155 = OpVariable UniformConstant 
					                    UniformConstant sampler* %157 = OpVariable UniformConstant 
					                                         i32 %164 = OpConstant 1 
					                                             %169 = OpTypePointer Output %7 
					                               Output f32_4* %170 = OpVariable Output 
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
					                                 Uniform f32* %44 = OpAccessChain %40 %42 %34 
					                                          f32 %45 = OpLoad %44 
					                                 Private f32* %46 = OpAccessChain %9 %34 
					                                          f32 %47 = OpLoad %46 
					                                          f32 %48 = OpFMul %45 %47 
					                                 Uniform f32* %50 = OpAccessChain %40 %42 %49 
					                                          f32 %51 = OpLoad %50 
					                                          f32 %52 = OpFAdd %48 %51 
					                                 Private f32* %53 = OpAccessChain %9 %34 
					                                                      OpStore %53 %52 
					                                 Private f32* %55 = OpAccessChain %9 %34 
					                                          f32 %56 = OpLoad %55 
					                                          f32 %57 = OpFDiv %54 %56 
					                                 Private f32* %58 = OpAccessChain %9 %34 
					                                                      OpStore %58 %57 
					                                 Private f32* %59 = OpAccessChain %9 %34 
					                                          f32 %60 = OpLoad %59 
					                                 Private f32* %61 = OpAccessChain %9 %34 
					                                                      OpStore %61 %60 
					                                 Private f32* %62 = OpAccessChain %9 %34 
					                                          f32 %63 = OpLoad %62 
					                                          f32 %65 = OpExtInst %1 43 %63 %64 %54 
					                                 Private f32* %66 = OpAccessChain %9 %34 
					                                                      OpStore %66 %65 
					                                 Private f32* %67 = OpAccessChain %9 %34 
					                                          f32 %68 = OpLoad %67 
					                                 Uniform f32* %70 = OpAccessChain %40 %69 
					                                          f32 %71 = OpLoad %70 
					                                          f32 %72 = OpFNegate %71 
					                                          f32 %73 = OpFAdd %68 %72 
					                                 Private f32* %74 = OpAccessChain %9 %34 
					                                                      OpStore %74 %73 
					                                 Uniform f32* %76 = OpAccessChain %40 %69 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpFNegate %77 
					                                 Uniform f32* %80 = OpAccessChain %40 %79 
					                                          f32 %81 = OpLoad %80 
					                                          f32 %82 = OpFAdd %78 %81 
					                                                      OpStore %75 %82 
					                                          f32 %83 = OpLoad %75 
					                                          f32 %84 = OpFDiv %54 %83 
					                                                      OpStore %75 %84 
					                                          f32 %85 = OpLoad %75 
					                                 Private f32* %86 = OpAccessChain %9 %34 
					                                          f32 %87 = OpLoad %86 
					                                          f32 %88 = OpFMul %85 %87 
					                                 Private f32* %89 = OpAccessChain %9 %34 
					                                                      OpStore %89 %88 
					                                 Private f32* %90 = OpAccessChain %9 %34 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %92 = OpExtInst %1 43 %91 %64 %54 
					                                 Private f32* %93 = OpAccessChain %9 %34 
					                                                      OpStore %93 %92 
					                                 Private f32* %94 = OpAccessChain %9 %34 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %97 = OpFMul %95 %96 
					                                          f32 %99 = OpFAdd %97 %98 
					                                                      OpStore %75 %99 
					                                Private f32* %100 = OpAccessChain %9 %34 
					                                         f32 %101 = OpLoad %100 
					                                Private f32* %102 = OpAccessChain %9 %34 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpFMul %101 %103 
					                                Private f32* %105 = OpAccessChain %9 %34 
					                                                      OpStore %105 %104 
					                                Private f32* %106 = OpAccessChain %9 %34 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpLoad %75 
					                                         f32 %109 = OpFMul %107 %108 
					                                Private f32* %110 = OpAccessChain %9 %34 
					                                                      OpStore %110 %109 
					                                       f32_4 %112 = OpLoad %9 
					                                       f32_3 %113 = OpVectorShuffle %112 %112 0 0 0 
					                                       f32_3 %114 = OpFNegate %113 
					                                       f32_4 %115 = OpLoad %9 
					                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
					                                                      OpStore %9 %116 
					                                Private f32* %118 = OpAccessChain %9 %117 
					                                                      OpStore %118 %64 
					                                Uniform f32* %120 = OpAccessChain %40 %119 
					                                         f32 %121 = OpLoad %120 
					                                Uniform f32* %122 = OpAccessChain %40 %119 
					                                         f32 %123 = OpLoad %122 
					                                Uniform f32* %124 = OpAccessChain %40 %119 
					                                         f32 %125 = OpLoad %124 
					                                Uniform f32* %126 = OpAccessChain %40 %119 
					                                         f32 %127 = OpLoad %126 
					                                       f32_4 %128 = OpCompositeConstruct %121 %123 %125 %127 
					                                         f32 %129 = OpCompositeExtract %128 0 
					                                         f32 %130 = OpCompositeExtract %128 1 
					                                         f32 %131 = OpCompositeExtract %128 2 
					                                         f32 %132 = OpCompositeExtract %128 3 
					                                       f32_4 %133 = OpCompositeConstruct %129 %130 %131 %132 
					                                       f32_4 %134 = OpLoad %9 
					                                       f32_4 %135 = OpFMul %133 %134 
					                                       f32_4 %137 = OpFAdd %135 %136 
					                                                      OpStore %9 %137 
					                                       f32_2 %141 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %144 = OpAccessChain %40 %142 
					                                       f32_4 %145 = OpLoad %144 
					                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
					                                       f32_2 %147 = OpFMul %141 %146 
					                              Uniform f32_4* %148 = OpAccessChain %40 %142 
					                                       f32_4 %149 = OpLoad %148 
					                                       f32_2 %150 = OpVectorShuffle %149 %149 2 3 
					                                       f32_2 %151 = OpFAdd %147 %150 
					                                       f32_4 %152 = OpLoad %138 
					                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 2 3 
					                                                      OpStore %138 %153 
					                         read_only Texture2D %156 = OpLoad %155 
					                                     sampler %158 = OpLoad %157 
					                  read_only Texture2DSampled %159 = OpSampledImage %156 %158 
					                                       f32_4 %160 = OpLoad %138 
					                                       f32_2 %161 = OpVectorShuffle %160 %160 0 1 
					                                       f32_4 %162 = OpImageSampleImplicitLod %159 %161 
					                                                      OpStore %154 %162 
					                                       f32_4 %163 = OpLoad %154 
					                              Uniform f32_4* %165 = OpAccessChain %40 %164 
					                                       f32_4 %166 = OpLoad %165 
					                                       f32_4 %167 = OpFNegate %166 
					                                       f32_4 %168 = OpFAdd %163 %167 
					                                                      OpStore %138 %168 
					                                       f32_4 %171 = OpLoad %9 
					                                       f32_4 %172 = OpLoad %138 
					                                       f32_4 %173 = OpFMul %171 %172 
					                              Uniform f32_4* %174 = OpAccessChain %40 %164 
					                                       f32_4 %175 = OpLoad %174 
					                                       f32_4 %176 = OpFAdd %173 %175 
					                                                      OpStore %170 %176 
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
						vec4 unused_0_0[4];
						vec4 _ColorRGB;
						float _Near;
						float _Far;
						float _DepthLevel;
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat2 = (-_Near) + _Far;
					    u_xlat2 = float(1.0) / u_xlat2;
					    u_xlat0.x = u_xlat2 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat2;
					    u_xlat0.xyz = (-u_xlat0.xxx);
					    u_xlat0.w = 0.0;
					    u_xlat0 = vec4(vec4(_DepthLevel, _DepthLevel, _DepthLevel, _DepthLevel)) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = u_xlat10_1 + (-_ColorRGB);
					    SV_Target0 = u_xlat0 * u_xlat1 + _ColorRGB;
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