Shader "CameraFilterPack/3D_BlackHole" {
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
			GpuProgramID 6450
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
					uniform 	float _Near;
					uniform 	float _Far;
					uniform 	float _FixDistance;
					uniform 	float _DistortionLevel;
					uniform 	float _DistortionSize;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat2.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat2.x;
					    u_xlat2.x = _Far + _Near;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat2.x = u_xlat2.x + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat4 = u_xlat0.x * u_xlat2.x;
					    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
					    u_xlat1 = u_xlat0.xxxx * vec4(u_xlat4);
					    u_xlatb2 = _Visualize==1.0;
					    if(u_xlatb2){
					        SV_Target0 = u_xlat1;
					        return;
					    }
					    u_xlat2.xz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat2.xz + vec2(-0.5, -0.5);
					    u_xlat1.xy = u_xlat1.xy + u_xlat1.xy;
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.w) * 4.0 + u_xlat1.x;
					    u_xlat0.x = u_xlat4 * u_xlat0.x + (-u_xlat1.x);
					    u_xlat0.x = u_xlat0.x + (-_DistortionSize);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat4 = u_xlat0.x * _DistortionLevel;
					    u_xlat2.xy = vec2(u_xlat4) * u_xlat1.ww + u_xlat2.xz;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    SV_Target0 = (-u_xlat0.xxxx) * vec4(_DistortionLevel) + u_xlat10_1;
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
					; Bound: 280
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %158 %162 
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
					                                                      OpMemberDecorate %35 7 RelaxedPrecision 
					                                                      OpMemberDecorate %35 7 Offset 35 
					                                                      OpDecorate %35 Block 
					                                                      OpDecorate %37 DescriptorSet 37 
					                                                      OpDecorate %37 Binding 37 
					                                                      OpDecorate %158 Location 158 
					                                                      OpDecorate vs_TEXCOORD0 Location 162 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %262 DescriptorSet 262 
					                                                      OpDecorate %262 Binding 262 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %264 DescriptorSet 264 
					                                                      OpDecorate %264 Binding 264 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
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
					                                              %35 = OpTypeStruct %10 %6 %6 %6 %6 %6 %6 %10 
					                                              %36 = OpTypePointer Uniform %35 
					Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32_4;}* %37 = OpVariable Uniform 
					                                              %38 = OpTypeInt 32 1 
					                                          i32 %39 = OpConstant 0 
					                                          u32 %40 = OpConstant 2 
					                                              %41 = OpTypePointer Uniform %6 
					                                          u32 %47 = OpConstant 3 
					                                          f32 %52 = OpConstant 3,674022E-40 
					                                              %57 = OpTypeVector %6 3 
					                                              %58 = OpTypePointer Private %57 
					                               Private f32_3* %59 = OpVariable Private 
					                                          i32 %60 = OpConstant 4 
					                                          f32 %63 = OpConstant 3,674022E-40 
					                                          i32 %72 = OpConstant 3 
					                                          i32 %75 = OpConstant 2 
					                                          f32 %82 = OpConstant 3,674022E-40 
					                                         f32 %115 = OpConstant 3,674022E-40 
					                                         f32 %117 = OpConstant 3,674022E-40 
					                                Private f32* %126 = OpVariable Private 
					                                             %140 = OpTypePointer Private %10 
					                              Private f32_4* %141 = OpVariable Private 
					                                             %147 = OpTypeBool 
					                                             %148 = OpTypePointer Private %147 
					                               Private bool* %149 = OpVariable Private 
					                                         i32 %150 = OpConstant 1 
					                                             %157 = OpTypePointer Output %10 
					                               Output f32_4* %158 = OpVariable Output 
					                                             %161 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %164 = OpConstant 7 
					                                             %165 = OpTypePointer Uniform %10 
					                                         f32 %178 = OpConstant 3,674022E-40 
					                                       f32_2 %179 = OpConstantComposite %178 %178 
					                                         f32 %203 = OpConstant 3,674022E-40 
					                                         i32 %220 = OpConstant 6 
					                                         i32 %247 = OpConstant 5 
					                              Private f32_4* %261 = OpVariable Private 
					        UniformConstant read_only Texture2D* %262 = OpVariable UniformConstant 
					                    UniformConstant sampler* %264 = OpVariable UniformConstant 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
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
					                                 Uniform f32* %61 = OpAccessChain %37 %60 
					                                          f32 %62 = OpLoad %61 
					                                          f32 %64 = OpFMul %62 %63 
					                                 Private f32* %65 = OpAccessChain %59 %31 
					                                                      OpStore %65 %64 
					                                 Private f32* %66 = OpAccessChain %9 %31 
					                                          f32 %67 = OpLoad %66 
					                                 Private f32* %68 = OpAccessChain %59 %31 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpFDiv %67 %69 
					                                 Private f32* %71 = OpAccessChain %9 %31 
					                                                      OpStore %71 %70 
					                                 Uniform f32* %73 = OpAccessChain %37 %72 
					                                          f32 %74 = OpLoad %73 
					                                 Uniform f32* %76 = OpAccessChain %37 %75 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpFAdd %74 %77 
					                                 Private f32* %79 = OpAccessChain %59 %31 
					                                                      OpStore %79 %78 
					                                 Private f32* %80 = OpAccessChain %59 %31 
					                                          f32 %81 = OpLoad %80 
					                                          f32 %83 = OpExtInst %1 43 %81 %82 %52 
					                                 Private f32* %84 = OpAccessChain %59 %31 
					                                                      OpStore %84 %83 
					                                 Private f32* %85 = OpAccessChain %59 %31 
					                                          f32 %86 = OpLoad %85 
					                                 Uniform f32* %87 = OpAccessChain %37 %75 
					                                          f32 %88 = OpLoad %87 
					                                          f32 %89 = OpFNegate %88 
					                                          f32 %90 = OpFAdd %86 %89 
					                                 Private f32* %91 = OpAccessChain %59 %31 
					                                                      OpStore %91 %90 
					                                 Private f32* %92 = OpAccessChain %9 %31 
					                                          f32 %93 = OpLoad %92 
					                                 Uniform f32* %94 = OpAccessChain %37 %75 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFNegate %95 
					                                          f32 %97 = OpFAdd %93 %96 
					                                 Private f32* %98 = OpAccessChain %9 %31 
					                                                      OpStore %98 %97 
					                                 Private f32* %99 = OpAccessChain %59 %31 
					                                         f32 %100 = OpLoad %99 
					                                         f32 %101 = OpFDiv %52 %100 
					                                Private f32* %102 = OpAccessChain %59 %31 
					                                                      OpStore %102 %101 
					                                Private f32* %103 = OpAccessChain %59 %31 
					                                         f32 %104 = OpLoad %103 
					                                Private f32* %105 = OpAccessChain %9 %31 
					                                         f32 %106 = OpLoad %105 
					                                         f32 %107 = OpFMul %104 %106 
					                                Private f32* %108 = OpAccessChain %9 %31 
					                                                      OpStore %108 %107 
					                                Private f32* %109 = OpAccessChain %9 %31 
					                                         f32 %110 = OpLoad %109 
					                                         f32 %111 = OpExtInst %1 43 %110 %82 %52 
					                                Private f32* %112 = OpAccessChain %9 %31 
					                                                      OpStore %112 %111 
					                                Private f32* %113 = OpAccessChain %9 %31 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %116 = OpFMul %114 %115 
					                                         f32 %118 = OpFAdd %116 %117 
					                                Private f32* %119 = OpAccessChain %59 %31 
					                                                      OpStore %119 %118 
					                                Private f32* %120 = OpAccessChain %9 %31 
					                                         f32 %121 = OpLoad %120 
					                                Private f32* %122 = OpAccessChain %9 %31 
					                                         f32 %123 = OpLoad %122 
					                                         f32 %124 = OpFMul %121 %123 
					                                Private f32* %125 = OpAccessChain %9 %31 
					                                                      OpStore %125 %124 
					                                Private f32* %127 = OpAccessChain %9 %31 
					                                         f32 %128 = OpLoad %127 
					                                Private f32* %129 = OpAccessChain %59 %31 
					                                         f32 %130 = OpLoad %129 
					                                         f32 %131 = OpFMul %128 %130 
					                                                      OpStore %126 %131 
					                                Private f32* %132 = OpAccessChain %59 %31 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFNegate %133 
					                                Private f32* %135 = OpAccessChain %9 %31 
					                                         f32 %136 = OpLoad %135 
					                                         f32 %137 = OpFMul %134 %136 
					                                         f32 %138 = OpFAdd %137 %52 
					                                Private f32* %139 = OpAccessChain %9 %31 
					                                                      OpStore %139 %138 
					                                       f32_2 %142 = OpLoad %9 
					                                       f32_4 %143 = OpVectorShuffle %142 %142 0 0 0 0 
					                                         f32 %144 = OpLoad %126 
					                                       f32_4 %145 = OpCompositeConstruct %144 %144 %144 %144 
					                                       f32_4 %146 = OpFMul %143 %145 
					                                                      OpStore %141 %146 
					                                Uniform f32* %151 = OpAccessChain %37 %150 
					                                         f32 %152 = OpLoad %151 
					                                        bool %153 = OpFOrdEqual %152 %52 
					                                                      OpStore %149 %153 
					                                        bool %154 = OpLoad %149 
					                                                      OpSelectionMerge %156 None 
					                                                      OpBranchConditional %154 %155 %156 
					                                             %155 = OpLabel 
					                                       f32_4 %159 = OpLoad %141 
					                                                      OpStore %158 %159 
					                                                      OpReturn
					                                             %156 = OpLabel 
					                                       f32_2 %163 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %166 = OpAccessChain %37 %164 
					                                       f32_4 %167 = OpLoad %166 
					                                       f32_2 %168 = OpVectorShuffle %167 %167 0 1 
					                                       f32_2 %169 = OpFMul %163 %168 
					                              Uniform f32_4* %170 = OpAccessChain %37 %164 
					                                       f32_4 %171 = OpLoad %170 
					                                       f32_2 %172 = OpVectorShuffle %171 %171 2 3 
					                                       f32_2 %173 = OpFAdd %169 %172 
					                                       f32_3 %174 = OpLoad %59 
					                                       f32_3 %175 = OpVectorShuffle %174 %173 3 1 4 
					                                                      OpStore %59 %175 
					                                       f32_3 %176 = OpLoad %59 
					                                       f32_2 %177 = OpVectorShuffle %176 %176 0 2 
					                                       f32_2 %180 = OpFAdd %177 %179 
					                                       f32_4 %181 = OpLoad %141 
					                                       f32_4 %182 = OpVectorShuffle %181 %180 4 5 2 3 
					                                                      OpStore %141 %182 
					                                       f32_4 %183 = OpLoad %141 
					                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
					                                       f32_4 %185 = OpLoad %141 
					                                       f32_2 %186 = OpVectorShuffle %185 %185 0 1 
					                                       f32_2 %187 = OpFAdd %184 %186 
					                                       f32_4 %188 = OpLoad %141 
					                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 2 3 
					                                                      OpStore %141 %189 
					                                       f32_4 %190 = OpLoad %141 
					                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
					                                       f32_4 %192 = OpLoad %141 
					                                       f32_2 %193 = OpVectorShuffle %192 %192 0 1 
					                                         f32 %194 = OpDot %191 %193 
					                                Private f32* %195 = OpAccessChain %141 %31 
					                                                      OpStore %195 %194 
					                                Private f32* %196 = OpAccessChain %141 %31 
					                                         f32 %197 = OpLoad %196 
					                                         f32 %198 = OpExtInst %1 31 %197 
					                                Private f32* %199 = OpAccessChain %141 %31 
					                                                      OpStore %199 %198 
					                                Private f32* %200 = OpAccessChain %141 %47 
					                                         f32 %201 = OpLoad %200 
					                                         f32 %202 = OpFNegate %201 
					                                         f32 %204 = OpFMul %202 %203 
					                                Private f32* %205 = OpAccessChain %141 %31 
					                                         f32 %206 = OpLoad %205 
					                                         f32 %207 = OpFAdd %204 %206 
					                                Private f32* %208 = OpAccessChain %141 %31 
					                                                      OpStore %208 %207 
					                                         f32 %209 = OpLoad %126 
					                                Private f32* %210 = OpAccessChain %9 %31 
					                                         f32 %211 = OpLoad %210 
					                                         f32 %212 = OpFMul %209 %211 
					                                Private f32* %213 = OpAccessChain %141 %31 
					                                         f32 %214 = OpLoad %213 
					                                         f32 %215 = OpFNegate %214 
					                                         f32 %216 = OpFAdd %212 %215 
					                                Private f32* %217 = OpAccessChain %9 %31 
					                                                      OpStore %217 %216 
					                                Private f32* %218 = OpAccessChain %9 %31 
					                                         f32 %219 = OpLoad %218 
					                                Uniform f32* %221 = OpAccessChain %37 %220 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpFNegate %222 
					                                         f32 %224 = OpFAdd %219 %223 
					                                Private f32* %225 = OpAccessChain %9 %31 
					                                                      OpStore %225 %224 
					                                Private f32* %226 = OpAccessChain %9 %31 
					                                         f32 %227 = OpLoad %226 
					                                         f32 %228 = OpExtInst %1 43 %227 %82 %52 
					                                Private f32* %229 = OpAccessChain %9 %31 
					                                                      OpStore %229 %228 
					                                Private f32* %230 = OpAccessChain %9 %31 
					                                         f32 %231 = OpLoad %230 
					                                         f32 %232 = OpFMul %231 %115 
					                                         f32 %233 = OpFAdd %232 %117 
					                                                      OpStore %126 %233 
					                                Private f32* %234 = OpAccessChain %9 %31 
					                                         f32 %235 = OpLoad %234 
					                                Private f32* %236 = OpAccessChain %9 %31 
					                                         f32 %237 = OpLoad %236 
					                                         f32 %238 = OpFMul %235 %237 
					                                Private f32* %239 = OpAccessChain %9 %31 
					                                                      OpStore %239 %238 
					                                Private f32* %240 = OpAccessChain %9 %31 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpLoad %126 
					                                         f32 %243 = OpFMul %241 %242 
					                                Private f32* %244 = OpAccessChain %9 %31 
					                                                      OpStore %244 %243 
					                                Private f32* %245 = OpAccessChain %9 %31 
					                                         f32 %246 = OpLoad %245 
					                                Uniform f32* %248 = OpAccessChain %37 %247 
					                                         f32 %249 = OpLoad %248 
					                                         f32 %250 = OpFMul %246 %249 
					                                                      OpStore %126 %250 
					                                         f32 %251 = OpLoad %126 
					                                       f32_2 %252 = OpCompositeConstruct %251 %251 
					                                       f32_4 %253 = OpLoad %141 
					                                       f32_2 %254 = OpVectorShuffle %253 %253 3 3 
					                                       f32_2 %255 = OpFMul %252 %254 
					                                       f32_3 %256 = OpLoad %59 
					                                       f32_2 %257 = OpVectorShuffle %256 %256 0 2 
					                                       f32_2 %258 = OpFAdd %255 %257 
					                                       f32_3 %259 = OpLoad %59 
					                                       f32_3 %260 = OpVectorShuffle %259 %258 3 4 2 
					                                                      OpStore %59 %260 
					                         read_only Texture2D %263 = OpLoad %262 
					                                     sampler %265 = OpLoad %264 
					                  read_only Texture2DSampled %266 = OpSampledImage %263 %265 
					                                       f32_3 %267 = OpLoad %59 
					                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
					                                       f32_4 %269 = OpImageSampleImplicitLod %266 %268 
					                                                      OpStore %261 %269 
					                                       f32_2 %270 = OpLoad %9 
					                                       f32_4 %271 = OpVectorShuffle %270 %270 0 0 0 0 
					                                       f32_4 %272 = OpFNegate %271 
					                                Uniform f32* %273 = OpAccessChain %37 %247 
					                                         f32 %274 = OpLoad %273 
					                                       f32_4 %275 = OpCompositeConstruct %274 %274 %274 %274 
					                                       f32_4 %276 = OpFMul %272 %275 
					                                       f32_4 %277 = OpLoad %261 
					                                       f32_4 %278 = OpFAdd %276 %277 
					                                                      OpStore %158 %278 
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
						float _DistortionLevel;
						float _DistortionSize;
						vec4 unused_0_8;
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
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					bool u_xlatb2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat2.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat2.x;
					    u_xlat2.x = _Far + _Near;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat2.x = u_xlat2.x + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat4 = u_xlat0.x * u_xlat2.x;
					    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
					    u_xlat1 = u_xlat0.xxxx * vec4(u_xlat4);
					    u_xlatb2 = _Visualize==1.0;
					    if(u_xlatb2){
					        SV_Target0 = u_xlat1;
					        return;
					    //ENDIF
					    }
					    u_xlat2.xz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat2.xz + vec2(-0.5, -0.5);
					    u_xlat1.xy = u_xlat1.xy + u_xlat1.xy;
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = (-u_xlat1.w) * 4.0 + u_xlat1.x;
					    u_xlat0.x = u_xlat4 * u_xlat0.x + (-u_xlat1.x);
					    u_xlat0.x = u_xlat0.x + (-_DistortionSize);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat4 = u_xlat0.x * _DistortionLevel;
					    u_xlat2.xy = vec2(u_xlat4) * u_xlat1.ww + u_xlat2.xz;
					    u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
					    SV_Target0 = (-u_xlat0.xxxx) * vec4(_DistortionLevel) + u_xlat10_1;
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