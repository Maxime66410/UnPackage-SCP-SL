Shader "CameraFilterPack/3D_Computer" {
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
			GpuProgramID 40121
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
					vec3 u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat3.x;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat1 = vec4(_DepthLevel) * u_xlat0.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlatb3 = _Visualize==1.0;
					    if(u_xlatb3){
					        SV_Target0 = u_xlat1;
					        return;
					    }
					    u_xlat0.x = _DepthLevel * u_xlat0.x + 0.699999988;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.z = _Time.x * _MatrixSpeed + u_xlat0.y;
					    u_xlat3.xz = vec2(_MatrixSize) + vec2(1.0, 0.5);
					    u_xlat0.xy = u_xlat3.xz * u_xlat0.xz;
					    u_xlat10_0 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat2 = (-_MatrixColor) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = u_xlat10_0.xxxx + (-u_xlat2);
					    u_xlat1.x = u_xlat0.x * _DepthLevel;
					    u_xlat1.xy = u_xlat1.xx * vec2(0.0199999996, 0.0199999996) + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.x = u_xlat1.w * _LightIntensity;
					    u_xlat1 = u_xlat1.xxxx * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat10_2;
					    u_xlat0 = u_xlat0 + u_xlat1;
					    u_xlat0 = (-u_xlat10_2) + u_xlat0;
					    SV_Target0 = vec4(_DepthLevel) * u_xlat0 + u_xlat10_2;
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
					; Bound: 234
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %112 %124 
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
					                                                      OpDecorate %38 Block 
					                                                      OpDecorate %40 DescriptorSet 40 
					                                                      OpDecorate %40 Binding 40 
					                                                      OpDecorate %112 Location 112 
					                                                      OpDecorate vs_TEXCOORD0 Location 124 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %159 DescriptorSet 159 
					                                                      OpDecorate %159 Binding 159 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
					                                                      OpDecorate %161 DescriptorSet 161 
					                                                      OpDecorate %161 Binding 161 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %197 DescriptorSet 197 
					                                                      OpDecorate %197 Binding 197 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %199 DescriptorSet 199 
					                                                      OpDecorate %199 Binding 199 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
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
					                                              %38 = OpTypeStruct %7 %7 %6 %7 %6 %6 %6 %6 %6 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32_4; f32; f32_4; f32; f32; f32; f32; f32;}* %40 = OpVariable Uniform 
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
					                                          f32 %82 = OpConstant 3,674022E-40 
					                                          f32 %87 = OpConstant 3,674022E-40 
					                               Private f32_4* %90 = OpVariable Private 
					                                          i32 %91 = OpConstant 4 
					                                          f32 %98 = OpConstant 3,674022E-40 
					                                        f32_4 %99 = OpConstantComposite %98 %98 %98 %98 
					                                             %101 = OpTypeBool 
					                                             %102 = OpTypePointer Private %101 
					                               Private bool* %103 = OpVariable Private 
					                                         i32 %104 = OpConstant 2 
					                                             %111 = OpTypePointer Output %7 
					                               Output f32_4* %112 = OpVariable Output 
					                                         f32 %120 = OpConstant 3,674022E-40 
					                                             %123 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %131 = OpConstant 0 
					                                         i32 %134 = OpConstant 8 
					                                         u32 %138 = OpConstant 1 
					                                         i32 %143 = OpConstant 7 
					                                       f32_2 %147 = OpConstantComposite %55 %98 
					                                Private f32* %158 = OpVariable Private 
					        UniformConstant read_only Texture2D* %159 = OpVariable UniformConstant 
					                    UniformConstant sampler* %161 = OpVariable UniformConstant 
					                              Private f32_4* %168 = OpVariable Private 
					                                         i32 %169 = OpConstant 3 
					                                             %170 = OpTypePointer Uniform %7 
					                                       f32_4 %174 = OpConstantComposite %55 %55 %55 %55 
					                                         f32 %189 = OpConstant 3,674022E-40 
					                                       f32_2 %190 = OpConstantComposite %189 %189 
					                              Private f32_4* %196 = OpVariable Private 
					        UniformConstant read_only Texture2D* %197 = OpVariable UniformConstant 
					                    UniformConstant sampler* %199 = OpVariable UniformConstant 
					                                         i32 %207 = OpConstant 6 
					                                         f32 %214 = OpConstant 3,674022E-40 
					                                       f32_4 %215 = OpConstantComposite %214 %214 %214 %214 
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
					                                 Private f32* %75 = OpAccessChain %9 %34 
					                                          f32 %76 = OpLoad %75 
					                                          f32 %77 = OpFNegate %76 
					                                          f32 %78 = OpFAdd %77 %55 
					                                 Private f32* %79 = OpAccessChain %9 %34 
					                                                      OpStore %79 %78 
					                                 Private f32* %80 = OpAccessChain %9 %34 
					                                          f32 %81 = OpLoad %80 
					                                          f32 %83 = OpExtInst %1 43 %81 %82 %55 
					                                 Private f32* %84 = OpAccessChain %9 %34 
					                                                      OpStore %84 %83 
					                                 Private f32* %85 = OpAccessChain %9 %34 
					                                          f32 %86 = OpLoad %85 
					                                          f32 %88 = OpFAdd %86 %87 
					                                 Private f32* %89 = OpAccessChain %9 %34 
					                                                      OpStore %89 %88 
					                                 Uniform f32* %92 = OpAccessChain %40 %91 
					                                          f32 %93 = OpLoad %92 
					                                        f32_4 %94 = OpCompositeConstruct %93 %93 %93 %93 
					                                        f32_4 %95 = OpLoad %9 
					                                        f32_4 %96 = OpVectorShuffle %95 %95 0 0 0 0 
					                                        f32_4 %97 = OpFMul %94 %96 
					                                       f32_4 %100 = OpFAdd %97 %99 
					                                                      OpStore %90 %100 
					                                Uniform f32* %105 = OpAccessChain %40 %104 
					                                         f32 %106 = OpLoad %105 
					                                        bool %107 = OpFOrdEqual %106 %55 
					                                                      OpStore %103 %107 
					                                        bool %108 = OpLoad %103 
					                                                      OpSelectionMerge %110 None 
					                                                      OpBranchConditional %108 %109 %110 
					                                             %109 = OpLabel 
					                                       f32_4 %113 = OpLoad %90 
					                                                      OpStore %112 %113 
					                                                      OpReturn
					                                             %110 = OpLabel 
					                                Uniform f32* %115 = OpAccessChain %40 %91 
					                                         f32 %116 = OpLoad %115 
					                                Private f32* %117 = OpAccessChain %9 %34 
					                                         f32 %118 = OpLoad %117 
					                                         f32 %119 = OpFMul %116 %118 
					                                         f32 %121 = OpFAdd %119 %120 
					                                Private f32* %122 = OpAccessChain %9 %34 
					                                                      OpStore %122 %121 
					                                       f32_2 %125 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %126 = OpLoad %9 
					                                       f32_2 %127 = OpVectorShuffle %126 %126 0 0 
					                                       f32_2 %128 = OpFDiv %125 %127 
					                                       f32_4 %129 = OpLoad %9 
					                                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 2 3 
					                                                      OpStore %9 %130 
					                                Uniform f32* %132 = OpAccessChain %40 %131 %34 
					                                         f32 %133 = OpLoad %132 
					                                Uniform f32* %135 = OpAccessChain %40 %134 
					                                         f32 %136 = OpLoad %135 
					                                         f32 %137 = OpFMul %133 %136 
					                                Private f32* %139 = OpAccessChain %9 %138 
					                                         f32 %140 = OpLoad %139 
					                                         f32 %141 = OpFAdd %137 %140 
					                                Private f32* %142 = OpAccessChain %9 %43 
					                                                      OpStore %142 %141 
					                                Uniform f32* %144 = OpAccessChain %40 %143 
					                                         f32 %145 = OpLoad %144 
					                                       f32_2 %146 = OpCompositeConstruct %145 %145 
					                                       f32_2 %148 = OpFAdd %146 %147 
					                                       f32_3 %149 = OpLoad %62 
					                                       f32_3 %150 = OpVectorShuffle %149 %148 3 1 4 
					                                                      OpStore %62 %150 
					                                       f32_3 %151 = OpLoad %62 
					                                       f32_2 %152 = OpVectorShuffle %151 %151 0 2 
					                                       f32_4 %153 = OpLoad %9 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 0 2 
					                                       f32_2 %155 = OpFMul %152 %154 
					                                       f32_4 %156 = OpLoad %9 
					                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 2 3 
					                                                      OpStore %9 %157 
					                         read_only Texture2D %160 = OpLoad %159 
					                                     sampler %162 = OpLoad %161 
					                  read_only Texture2DSampled %163 = OpSampledImage %160 %162 
					                                       f32_4 %164 = OpLoad %9 
					                                       f32_2 %165 = OpVectorShuffle %164 %164 0 1 
					                                       f32_4 %166 = OpImageSampleImplicitLod %163 %165 
					                                         f32 %167 = OpCompositeExtract %166 0 
					                                                      OpStore %158 %167 
					                              Uniform f32_4* %171 = OpAccessChain %40 %169 
					                                       f32_4 %172 = OpLoad %171 
					                                       f32_4 %173 = OpFNegate %172 
					                                       f32_4 %175 = OpFAdd %173 %174 
					                                                      OpStore %168 %175 
					                                         f32 %176 = OpLoad %158 
					                                       f32_4 %177 = OpCompositeConstruct %176 %176 %176 %176 
					                                       f32_4 %178 = OpLoad %168 
					                                       f32_4 %179 = OpFNegate %178 
					                                       f32_4 %180 = OpFAdd %177 %179 
					                                                      OpStore %9 %180 
					                                Private f32* %181 = OpAccessChain %9 %34 
					                                         f32 %182 = OpLoad %181 
					                                Uniform f32* %183 = OpAccessChain %40 %91 
					                                         f32 %184 = OpLoad %183 
					                                         f32 %185 = OpFMul %182 %184 
					                                Private f32* %186 = OpAccessChain %90 %34 
					                                                      OpStore %186 %185 
					                                       f32_4 %187 = OpLoad %90 
					                                       f32_2 %188 = OpVectorShuffle %187 %187 0 0 
					                                       f32_2 %191 = OpFMul %188 %190 
					                                       f32_2 %192 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %193 = OpFAdd %191 %192 
					                                       f32_4 %194 = OpLoad %90 
					                                       f32_4 %195 = OpVectorShuffle %194 %193 4 5 2 3 
					                                                      OpStore %90 %195 
					                         read_only Texture2D %198 = OpLoad %197 
					                                     sampler %200 = OpLoad %199 
					                  read_only Texture2DSampled %201 = OpSampledImage %198 %200 
					                                       f32_4 %202 = OpLoad %90 
					                                       f32_2 %203 = OpVectorShuffle %202 %202 0 1 
					                                       f32_4 %204 = OpImageSampleImplicitLod %201 %203 
					                                                      OpStore %196 %204 
					                                Private f32* %205 = OpAccessChain %90 %50 
					                                         f32 %206 = OpLoad %205 
					                                Uniform f32* %208 = OpAccessChain %40 %207 
					                                         f32 %209 = OpLoad %208 
					                                         f32 %210 = OpFMul %206 %209 
					                                Private f32* %211 = OpAccessChain %90 %34 
					                                                      OpStore %211 %210 
					                                       f32_4 %212 = OpLoad %90 
					                                       f32_4 %213 = OpVectorShuffle %212 %212 0 0 0 0 
					                                       f32_4 %216 = OpFMul %213 %215 
					                                       f32_4 %217 = OpLoad %196 
					                                       f32_4 %218 = OpFAdd %216 %217 
					                                                      OpStore %90 %218 
					                                       f32_4 %219 = OpLoad %9 
					                                       f32_4 %220 = OpLoad %90 
					                                       f32_4 %221 = OpFAdd %219 %220 
					                                                      OpStore %9 %221 
					                                       f32_4 %222 = OpLoad %196 
					                                       f32_4 %223 = OpFNegate %222 
					                                       f32_4 %224 = OpLoad %9 
					                                       f32_4 %225 = OpFAdd %223 %224 
					                                                      OpStore %9 %225 
					                                Uniform f32* %226 = OpAccessChain %40 %91 
					                                         f32 %227 = OpLoad %226 
					                                       f32_4 %228 = OpCompositeConstruct %227 %227 %227 %227 
					                                       f32_4 %229 = OpLoad %9 
					                                       f32_4 %230 = OpFMul %228 %229 
					                                       f32_4 %231 = OpLoad %196 
					                                       f32_4 %232 = OpFAdd %230 %231 
					                                                      OpStore %112 %232 
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
					vec3 u_xlat3;
					bool u_xlatb3;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat3.x;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = u_xlat0.x + -0.5;
					    u_xlat1 = vec4(_DepthLevel) * u_xlat0.xxxx + vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlatb3 = _Visualize==1.0;
					    if(u_xlatb3){
					        SV_Target0 = u_xlat1;
					        return;
					    //ENDIF
					    }
					    u_xlat0.x = _DepthLevel * u_xlat0.x + 0.699999988;
					    u_xlat0.xy = vs_TEXCOORD0.xy / u_xlat0.xx;
					    u_xlat0.z = _Time.x * _MatrixSpeed + u_xlat0.y;
					    u_xlat3.xz = vec2(_MatrixSize) + vec2(1.0, 0.5);
					    u_xlat0.xy = u_xlat3.xz * u_xlat0.xz;
					    u_xlat10_0 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat2 = (-_MatrixColor) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat0 = u_xlat10_0.xxxx + (-u_xlat2);
					    u_xlat1.x = u_xlat0.x * _DepthLevel;
					    u_xlat1.xy = u_xlat1.xx * vec2(0.0199999996, 0.0199999996) + vs_TEXCOORD0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.x = u_xlat1.w * _LightIntensity;
					    u_xlat1 = u_xlat1.xxxx * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat10_2;
					    u_xlat0 = u_xlat0 + u_xlat1;
					    u_xlat0 = (-u_xlat10_2) + u_xlat0;
					    SV_Target0 = vec4(_DepthLevel) * u_xlat0 + u_xlat10_2;
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