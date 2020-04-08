Shader "CameraFilterPack/3D_Distortion" {
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
			GpuProgramID 8126
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
					uniform 	float _Near;
					uniform 	float _Far;
					uniform 	float _FixDistance;
					uniform 	float _DistortionLevel;
					uniform 	float _DistortionSize;
					uniform 	float _LightIntensity;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					bool u_xlatb3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat3.x;
					    u_xlat3.x = _Far + _Near;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat3.x + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat6 = u_xlat0.x * u_xlat3.x;
					    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
					    u_xlat1 = u_xlat0.xxxx * vec4(u_xlat6);
					    u_xlatb3 = _Visualize==1.0;
					    if(u_xlatb3){
					        SV_Target0 = u_xlat1;
					        return;
					    }
					    u_xlat3.xz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat3.zx * vec2(_DistortionLevel);
					    u_xlat1.xy = _Time.xx * vec2(256.0, 256.0) + u_xlat1.xy;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _DistortionSize;
					    u_xlat2.x = u_xlat3.x + u_xlat1.x;
					    u_xlat1.x = cos(u_xlat1.y);
					    u_xlat1.x = u_xlat1.x / _DistortionSize;
					    u_xlat2.y = u_xlat3.z + u_xlat1.x;
					    u_xlat1.xy = (-u_xlat3.xz) + u_xlat2.xy;
					    u_xlat3.xz = u_xlat1.ww * u_xlat1.xy + u_xlat3.xz;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xz);
					    u_xlat0.x = (-u_xlat6) * u_xlat0.x + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat10_2;
					    u_xlat2 = u_xlat0 * vec4(vec4(_LightIntensity, _LightIntensity, _LightIntensity, _LightIntensity)) + (-u_xlat0);
					    SV_Target0 = u_xlat1.wwww * u_xlat2 + u_xlat0;
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
					; Bound: 299
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %160 %164 
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
					                                                      OpDecorate %160 Location 160 
					                                                      OpDecorate vs_TEXCOORD0 Location 164 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %252 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %253 DescriptorSet 253 
					                                                      OpDecorate %253 Binding 253 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %255 DescriptorSet 255 
					                                                      OpDecorate %255 Binding 255 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
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
					                                              %38 = OpTypeStruct %7 %7 %6 %6 %6 %6 %6 %6 %6 %7 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
					                                              %41 = OpTypeInt 32 1 
					                                          i32 %42 = OpConstant 1 
					                                          u32 %43 = OpConstant 2 
					                                              %44 = OpTypePointer Uniform %6 
					                                          u32 %50 = OpConstant 3 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                              %60 = OpTypeVector %6 3 
					                                              %61 = OpTypePointer Private %60 
					                               Private f32_3* %62 = OpVariable Private 
					                                          i32 %63 = OpConstant 5 
					                                          f32 %66 = OpConstant 3,674022E-40 
					                                          i32 %75 = OpConstant 4 
					                                          i32 %78 = OpConstant 3 
					                                          f32 %85 = OpConstant 3,674022E-40 
					                                         f32 %118 = OpConstant 3,674022E-40 
					                                         f32 %120 = OpConstant 3,674022E-40 
					                                Private f32* %129 = OpVariable Private 
					                              Private f32_4* %143 = OpVariable Private 
					                                             %149 = OpTypeBool 
					                                             %150 = OpTypePointer Private %149 
					                               Private bool* %151 = OpVariable Private 
					                                         i32 %152 = OpConstant 2 
					                                             %159 = OpTypePointer Output %7 
					                               Output f32_4* %160 = OpVariable Output 
					                                             %163 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %166 = OpConstant 9 
					                                             %167 = OpTypePointer Uniform %7 
					                                         i32 %180 = OpConstant 6 
					                                         i32 %187 = OpConstant 0 
					                                         f32 %191 = OpConstant 3,674022E-40 
					                                       f32_2 %192 = OpConstantComposite %191 %191 
					                                         i32 %205 = OpConstant 7 
					                              Private f32_4* %210 = OpVariable Private 
					                                         u32 %217 = OpConstant 1 
					                              Private f32_4* %252 = OpVariable Private 
					        UniformConstant read_only Texture2D* %253 = OpVariable UniformConstant 
					                    UniformConstant sampler* %255 = OpVariable UniformConstant 
					                                         i32 %273 = OpConstant 8 
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
					                                 Uniform f32* %64 = OpAccessChain %40 %63 
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
					                                 Uniform f32* %76 = OpAccessChain %40 %75 
					                                          f32 %77 = OpLoad %76 
					                                 Uniform f32* %79 = OpAccessChain %40 %78 
					                                          f32 %80 = OpLoad %79 
					                                          f32 %81 = OpFAdd %77 %80 
					                                 Private f32* %82 = OpAccessChain %62 %34 
					                                                      OpStore %82 %81 
					                                 Private f32* %83 = OpAccessChain %62 %34 
					                                          f32 %84 = OpLoad %83 
					                                          f32 %86 = OpExtInst %1 43 %84 %85 %55 
					                                 Private f32* %87 = OpAccessChain %62 %34 
					                                                      OpStore %87 %86 
					                                 Private f32* %88 = OpAccessChain %62 %34 
					                                          f32 %89 = OpLoad %88 
					                                 Uniform f32* %90 = OpAccessChain %40 %78 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %92 = OpFNegate %91 
					                                          f32 %93 = OpFAdd %89 %92 
					                                 Private f32* %94 = OpAccessChain %62 %34 
					                                                      OpStore %94 %93 
					                                 Private f32* %95 = OpAccessChain %9 %34 
					                                          f32 %96 = OpLoad %95 
					                                 Uniform f32* %97 = OpAccessChain %40 %78 
					                                          f32 %98 = OpLoad %97 
					                                          f32 %99 = OpFNegate %98 
					                                         f32 %100 = OpFAdd %96 %99 
					                                Private f32* %101 = OpAccessChain %9 %34 
					                                                      OpStore %101 %100 
					                                Private f32* %102 = OpAccessChain %62 %34 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpFDiv %55 %103 
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
					                                         f32 %114 = OpExtInst %1 43 %113 %85 %55 
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
					                                         f32 %141 = OpFAdd %140 %55 
					                                Private f32* %142 = OpAccessChain %9 %34 
					                                                      OpStore %142 %141 
					                                       f32_4 %144 = OpLoad %9 
					                                       f32_4 %145 = OpVectorShuffle %144 %144 0 0 0 0 
					                                         f32 %146 = OpLoad %129 
					                                       f32_4 %147 = OpCompositeConstruct %146 %146 %146 %146 
					                                       f32_4 %148 = OpFMul %145 %147 
					                                                      OpStore %143 %148 
					                                Uniform f32* %153 = OpAccessChain %40 %152 
					                                         f32 %154 = OpLoad %153 
					                                        bool %155 = OpFOrdEqual %154 %55 
					                                                      OpStore %151 %155 
					                                        bool %156 = OpLoad %151 
					                                                      OpSelectionMerge %158 None 
					                                                      OpBranchConditional %156 %157 %158 
					                                             %157 = OpLabel 
					                                       f32_4 %161 = OpLoad %143 
					                                                      OpStore %160 %161 
					                                                      OpReturn
					                                             %158 = OpLabel 
					                                       f32_2 %165 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %168 = OpAccessChain %40 %166 
					                                       f32_4 %169 = OpLoad %168 
					                                       f32_2 %170 = OpVectorShuffle %169 %169 0 1 
					                                       f32_2 %171 = OpFMul %165 %170 
					                              Uniform f32_4* %172 = OpAccessChain %40 %166 
					                                       f32_4 %173 = OpLoad %172 
					                                       f32_2 %174 = OpVectorShuffle %173 %173 2 3 
					                                       f32_2 %175 = OpFAdd %171 %174 
					                                       f32_3 %176 = OpLoad %62 
					                                       f32_3 %177 = OpVectorShuffle %176 %175 3 1 4 
					                                                      OpStore %62 %177 
					                                       f32_3 %178 = OpLoad %62 
					                                       f32_2 %179 = OpVectorShuffle %178 %178 2 0 
					                                Uniform f32* %181 = OpAccessChain %40 %180 
					                                         f32 %182 = OpLoad %181 
					                                       f32_2 %183 = OpCompositeConstruct %182 %182 
					                                       f32_2 %184 = OpFMul %179 %183 
					                                       f32_4 %185 = OpLoad %143 
					                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 2 3 
					                                                      OpStore %143 %186 
					                              Uniform f32_4* %188 = OpAccessChain %40 %187 
					                                       f32_4 %189 = OpLoad %188 
					                                       f32_2 %190 = OpVectorShuffle %189 %189 0 0 
					                                       f32_2 %193 = OpFMul %190 %192 
					                                       f32_4 %194 = OpLoad %143 
					                                       f32_2 %195 = OpVectorShuffle %194 %194 0 1 
					                                       f32_2 %196 = OpFAdd %193 %195 
					                                       f32_4 %197 = OpLoad %143 
					                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 2 3 
					                                                      OpStore %143 %198 
					                                Private f32* %199 = OpAccessChain %143 %34 
					                                         f32 %200 = OpLoad %199 
					                                         f32 %201 = OpExtInst %1 13 %200 
					                                Private f32* %202 = OpAccessChain %143 %34 
					                                                      OpStore %202 %201 
					                                Private f32* %203 = OpAccessChain %143 %34 
					                                         f32 %204 = OpLoad %203 
					                                Uniform f32* %206 = OpAccessChain %40 %205 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFDiv %204 %207 
					                                Private f32* %209 = OpAccessChain %143 %34 
					                                                      OpStore %209 %208 
					                                Private f32* %211 = OpAccessChain %62 %34 
					                                         f32 %212 = OpLoad %211 
					                                Private f32* %213 = OpAccessChain %143 %34 
					                                         f32 %214 = OpLoad %213 
					                                         f32 %215 = OpFAdd %212 %214 
					                                Private f32* %216 = OpAccessChain %210 %34 
					                                                      OpStore %216 %215 
					                                Private f32* %218 = OpAccessChain %143 %217 
					                                         f32 %219 = OpLoad %218 
					                                         f32 %220 = OpExtInst %1 14 %219 
					                                Private f32* %221 = OpAccessChain %143 %34 
					                                                      OpStore %221 %220 
					                                Private f32* %222 = OpAccessChain %143 %34 
					                                         f32 %223 = OpLoad %222 
					                                Uniform f32* %224 = OpAccessChain %40 %205 
					                                         f32 %225 = OpLoad %224 
					                                         f32 %226 = OpFDiv %223 %225 
					                                Private f32* %227 = OpAccessChain %143 %34 
					                                                      OpStore %227 %226 
					                                Private f32* %228 = OpAccessChain %62 %43 
					                                         f32 %229 = OpLoad %228 
					                                Private f32* %230 = OpAccessChain %143 %34 
					                                         f32 %231 = OpLoad %230 
					                                         f32 %232 = OpFAdd %229 %231 
					                                Private f32* %233 = OpAccessChain %210 %217 
					                                                      OpStore %233 %232 
					                                       f32_3 %234 = OpLoad %62 
					                                       f32_2 %235 = OpVectorShuffle %234 %234 0 2 
					                                       f32_2 %236 = OpFNegate %235 
					                                       f32_4 %237 = OpLoad %210 
					                                       f32_2 %238 = OpVectorShuffle %237 %237 0 1 
					                                       f32_2 %239 = OpFAdd %236 %238 
					                                       f32_4 %240 = OpLoad %143 
					                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 2 3 
					                                                      OpStore %143 %241 
					                                       f32_4 %242 = OpLoad %143 
					                                       f32_2 %243 = OpVectorShuffle %242 %242 3 3 
					                                       f32_4 %244 = OpLoad %143 
					                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
					                                       f32_2 %246 = OpFMul %243 %245 
					                                       f32_3 %247 = OpLoad %62 
					                                       f32_2 %248 = OpVectorShuffle %247 %247 0 2 
					                                       f32_2 %249 = OpFAdd %246 %248 
					                                       f32_3 %250 = OpLoad %62 
					                                       f32_3 %251 = OpVectorShuffle %250 %249 3 1 4 
					                                                      OpStore %62 %251 
					                         read_only Texture2D %254 = OpLoad %253 
					                                     sampler %256 = OpLoad %255 
					                  read_only Texture2DSampled %257 = OpSampledImage %254 %256 
					                                       f32_3 %258 = OpLoad %62 
					                                       f32_2 %259 = OpVectorShuffle %258 %258 0 2 
					                                       f32_4 %260 = OpImageSampleImplicitLod %257 %259 
					                                                      OpStore %252 %260 
					                                         f32 %261 = OpLoad %129 
					                                         f32 %262 = OpFNegate %261 
					                                Private f32* %263 = OpAccessChain %9 %34 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %265 = OpFMul %262 %264 
					                                         f32 %266 = OpFAdd %265 %55 
					                                Private f32* %267 = OpAccessChain %9 %34 
					                                                      OpStore %267 %266 
					                                       f32_4 %268 = OpLoad %9 
					                                       f32_4 %269 = OpVectorShuffle %268 %268 0 0 0 0 
					                                       f32_4 %270 = OpLoad %252 
					                                       f32_4 %271 = OpFMul %269 %270 
					                                                      OpStore %9 %271 
					                                       f32_4 %272 = OpLoad %9 
					                                Uniform f32* %274 = OpAccessChain %40 %273 
					                                         f32 %275 = OpLoad %274 
					                                Uniform f32* %276 = OpAccessChain %40 %273 
					                                         f32 %277 = OpLoad %276 
					                                Uniform f32* %278 = OpAccessChain %40 %273 
					                                         f32 %279 = OpLoad %278 
					                                Uniform f32* %280 = OpAccessChain %40 %273 
					                                         f32 %281 = OpLoad %280 
					                                       f32_4 %282 = OpCompositeConstruct %275 %277 %279 %281 
					                                         f32 %283 = OpCompositeExtract %282 0 
					                                         f32 %284 = OpCompositeExtract %282 1 
					                                         f32 %285 = OpCompositeExtract %282 2 
					                                         f32 %286 = OpCompositeExtract %282 3 
					                                       f32_4 %287 = OpCompositeConstruct %283 %284 %285 %286 
					                                       f32_4 %288 = OpFMul %272 %287 
					                                       f32_4 %289 = OpLoad %9 
					                                       f32_4 %290 = OpFNegate %289 
					                                       f32_4 %291 = OpFAdd %288 %290 
					                                                      OpStore %210 %291 
					                                       f32_4 %292 = OpLoad %143 
					                                       f32_4 %293 = OpVectorShuffle %292 %292 3 3 3 3 
					                                       f32_4 %294 = OpLoad %210 
					                                       f32_4 %295 = OpFMul %293 %294 
					                                       f32_4 %296 = OpLoad %9 
					                                       f32_4 %297 = OpFAdd %295 %296 
					                                                      OpStore %160 %297 
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
						float _LightIntensity;
						vec4 unused_0_9;
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
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					bool u_xlatb3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat3.x;
					    u_xlat3.x = _Far + _Near;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat3.x + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat6 = u_xlat0.x * u_xlat3.x;
					    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
					    u_xlat1 = u_xlat0.xxxx * vec4(u_xlat6);
					    u_xlatb3 = _Visualize==1.0;
					    if(u_xlatb3){
					        SV_Target0 = u_xlat1;
					        return;
					    //ENDIF
					    }
					    u_xlat3.xz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat3.zx * vec2(_DistortionLevel);
					    u_xlat1.xy = _Time.xx * vec2(256.0, 256.0) + u_xlat1.xy;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x / _DistortionSize;
					    u_xlat2.x = u_xlat3.x + u_xlat1.x;
					    u_xlat1.x = cos(u_xlat1.y);
					    u_xlat1.x = u_xlat1.x / _DistortionSize;
					    u_xlat2.y = u_xlat3.z + u_xlat1.x;
					    u_xlat1.xy = (-u_xlat3.xz) + u_xlat2.xy;
					    u_xlat3.xz = u_xlat1.ww * u_xlat1.xy + u_xlat3.xz;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xz);
					    u_xlat0.x = (-u_xlat6) * u_xlat0.x + 1.0;
					    u_xlat0 = u_xlat0.xxxx * u_xlat10_2;
					    u_xlat2 = u_xlat0 * vec4(vec4(_LightIntensity, _LightIntensity, _LightIntensity, _LightIntensity)) + (-u_xlat0);
					    SV_Target0 = u_xlat1.wwww * u_xlat2 + u_xlat0;
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