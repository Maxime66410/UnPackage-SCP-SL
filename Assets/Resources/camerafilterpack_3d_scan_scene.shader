Shader "CameraFilterPack/3D_Scan_Scene" {
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
			GpuProgramID 27581
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
					uniform 	vec4 _ColorRGB;
					uniform 	float _Near;
					uniform 	float _Far;
					uniform 	float _DepthLevel;
					uniform 	float _FixDistance;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat3;
					    u_xlat3 = _Far + _Near;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat3 = u_xlat3 + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat6 = u_xlat0.x * u_xlat3;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    u_xlat0 = u_xlat0.xxxx * vec4(u_xlat6);
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xyz = (-u_xlat0.www);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.w = 0.0;
					    u_xlat1 = vec4(vec4(_DepthLevel, _DepthLevel, _DepthLevel, _DepthLevel)) * u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = _ColorRGB * vec4(8.0, 8.0, 8.0, 8.0);
					    u_xlat0 = (-_ColorRGB) * vec4(8.0, 8.0, 8.0, 8.0) + u_xlat10_0;
					    SV_Target0 = u_xlat1 * u_xlat0 + u_xlat2;
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
					; Bound: 217
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %144 %148 
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
					                                                      OpMemberDecorate %38 7 RelaxedPrecision 
					                                                      OpMemberDecorate %38 7 Offset 38 
					                                                      OpDecorate %38 Block 
					                                                      OpDecorate %40 DescriptorSet 40 
					                                                      OpDecorate %40 Binding 40 
					                                                      OpDecorate %144 Location 144 
					                                                      OpDecorate vs_TEXCOORD0 Location 148 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %170 DescriptorSet 170 
					                                                      OpDecorate %170 Binding 170 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %172 DescriptorSet 172 
					                                                      OpDecorate %172 Binding 172 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
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
					                                              %38 = OpTypeStruct %7 %6 %7 %6 %6 %6 %6 %7 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32; f32_4; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
					                                              %41 = OpTypeInt 32 1 
					                                          i32 %42 = OpConstant 0 
					                                          u32 %43 = OpConstant 2 
					                                              %44 = OpTypePointer Uniform %6 
					                                          u32 %50 = OpConstant 3 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                 Private f32* %60 = OpVariable Private 
					                                          i32 %61 = OpConstant 6 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                          i32 %71 = OpConstant 4 
					                                          i32 %74 = OpConstant 3 
					                                          f32 %79 = OpConstant 3,674022E-40 
					                                         f32 %106 = OpConstant 3,674022E-40 
					                                         f32 %108 = OpConstant 3,674022E-40 
					                                Private f32* %116 = OpVariable Private 
					                                             %133 = OpTypeBool 
					                                             %134 = OpTypePointer Private %133 
					                               Private bool* %135 = OpVariable Private 
					                                         i32 %136 = OpConstant 1 
					                                             %143 = OpTypePointer Output %7 
					                               Output f32_4* %144 = OpVariable Output 
					                                             %147 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %150 = OpConstant 7 
					                                             %151 = OpTypePointer Uniform %7 
					                              Private f32_4* %162 = OpVariable Private 
					                                             %163 = OpTypeVector %6 3 
					                              Private f32_4* %169 = OpVariable Private 
					        UniformConstant read_only Texture2D* %170 = OpVariable UniformConstant 
					                    UniformConstant sampler* %172 = OpVariable UniformConstant 
					                                         i32 %179 = OpConstant 5 
					                                       f32_4 %196 = OpConstantComposite %55 %55 %55 %55 
					                              Private f32_4* %198 = OpVariable Private 
					                                         i32 %199 = OpConstant 2 
					                                         f32 %202 = OpConstant 3,674022E-40 
					                                       f32_4 %203 = OpConstantComposite %202 %202 %202 %202 
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
					                                 Uniform f32* %72 = OpAccessChain %40 %71 
					                                          f32 %73 = OpLoad %72 
					                                 Uniform f32* %75 = OpAccessChain %40 %74 
					                                          f32 %76 = OpLoad %75 
					                                          f32 %77 = OpFAdd %73 %76 
					                                                      OpStore %60 %77 
					                                          f32 %78 = OpLoad %60 
					                                          f32 %80 = OpExtInst %1 43 %78 %79 %55 
					                                                      OpStore %60 %80 
					                                          f32 %81 = OpLoad %60 
					                                 Uniform f32* %82 = OpAccessChain %40 %74 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %84 = OpFNegate %83 
					                                          f32 %85 = OpFAdd %81 %84 
					                                                      OpStore %60 %85 
					                                 Private f32* %86 = OpAccessChain %9 %34 
					                                          f32 %87 = OpLoad %86 
					                                 Uniform f32* %88 = OpAccessChain %40 %74 
					                                          f32 %89 = OpLoad %88 
					                                          f32 %90 = OpFNegate %89 
					                                          f32 %91 = OpFAdd %87 %90 
					                                 Private f32* %92 = OpAccessChain %9 %34 
					                                                      OpStore %92 %91 
					                                          f32 %93 = OpLoad %60 
					                                          f32 %94 = OpFDiv %55 %93 
					                                                      OpStore %60 %94 
					                                          f32 %95 = OpLoad %60 
					                                 Private f32* %96 = OpAccessChain %9 %34 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFMul %95 %97 
					                                 Private f32* %99 = OpAccessChain %9 %34 
					                                                      OpStore %99 %98 
					                                Private f32* %100 = OpAccessChain %9 %34 
					                                         f32 %101 = OpLoad %100 
					                                         f32 %102 = OpExtInst %1 43 %101 %79 %55 
					                                Private f32* %103 = OpAccessChain %9 %34 
					                                                      OpStore %103 %102 
					                                Private f32* %104 = OpAccessChain %9 %34 
					                                         f32 %105 = OpLoad %104 
					                                         f32 %107 = OpFMul %105 %106 
					                                         f32 %109 = OpFAdd %107 %108 
					                                                      OpStore %60 %109 
					                                Private f32* %110 = OpAccessChain %9 %34 
					                                         f32 %111 = OpLoad %110 
					                                Private f32* %112 = OpAccessChain %9 %34 
					                                         f32 %113 = OpLoad %112 
					                                         f32 %114 = OpFMul %111 %113 
					                                Private f32* %115 = OpAccessChain %9 %34 
					                                                      OpStore %115 %114 
					                                Private f32* %117 = OpAccessChain %9 %34 
					                                         f32 %118 = OpLoad %117 
					                                         f32 %119 = OpLoad %60 
					                                         f32 %120 = OpFMul %118 %119 
					                                                      OpStore %116 %120 
					                                         f32 %121 = OpLoad %60 
					                                         f32 %122 = OpFNegate %121 
					                                Private f32* %123 = OpAccessChain %9 %34 
					                                         f32 %124 = OpLoad %123 
					                                         f32 %125 = OpFMul %122 %124 
					                                         f32 %126 = OpFAdd %125 %55 
					                                Private f32* %127 = OpAccessChain %9 %34 
					                                                      OpStore %127 %126 
					                                       f32_4 %128 = OpLoad %9 
					                                       f32_4 %129 = OpVectorShuffle %128 %128 0 0 0 0 
					                                         f32 %130 = OpLoad %116 
					                                       f32_4 %131 = OpCompositeConstruct %130 %130 %130 %130 
					                                       f32_4 %132 = OpFMul %129 %131 
					                                                      OpStore %9 %132 
					                                Uniform f32* %137 = OpAccessChain %40 %136 
					                                         f32 %138 = OpLoad %137 
					                                        bool %139 = OpFOrdEqual %138 %55 
					                                                      OpStore %135 %139 
					                                        bool %140 = OpLoad %135 
					                                                      OpSelectionMerge %142 None 
					                                                      OpBranchConditional %140 %141 %142 
					                                             %141 = OpLabel 
					                                       f32_4 %145 = OpLoad %9 
					                                                      OpStore %144 %145 
					                                                      OpReturn
					                                             %142 = OpLabel 
					                                       f32_2 %149 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %152 = OpAccessChain %40 %150 
					                                       f32_4 %153 = OpLoad %152 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
					                                       f32_2 %155 = OpFMul %149 %154 
					                              Uniform f32_4* %156 = OpAccessChain %40 %150 
					                                       f32_4 %157 = OpLoad %156 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 2 3 
					                                       f32_2 %159 = OpFAdd %155 %158 
					                                       f32_4 %160 = OpLoad %9 
					                                       f32_4 %161 = OpVectorShuffle %160 %159 4 5 2 3 
					                                                      OpStore %9 %161 
					                                       f32_4 %164 = OpLoad %9 
					                                       f32_3 %165 = OpVectorShuffle %164 %164 3 3 3 
					                                       f32_3 %166 = OpFNegate %165 
					                                       f32_4 %167 = OpLoad %162 
					                                       f32_4 %168 = OpVectorShuffle %167 %166 4 5 6 3 
					                                                      OpStore %162 %168 
					                         read_only Texture2D %171 = OpLoad %170 
					                                     sampler %173 = OpLoad %172 
					                  read_only Texture2DSampled %174 = OpSampledImage %171 %173 
					                                       f32_4 %175 = OpLoad %9 
					                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
					                                       f32_4 %177 = OpImageSampleImplicitLod %174 %176 
					                                                      OpStore %169 %177 
					                                Private f32* %178 = OpAccessChain %162 %50 
					                                                      OpStore %178 %79 
					                                Uniform f32* %180 = OpAccessChain %40 %179 
					                                         f32 %181 = OpLoad %180 
					                                Uniform f32* %182 = OpAccessChain %40 %179 
					                                         f32 %183 = OpLoad %182 
					                                Uniform f32* %184 = OpAccessChain %40 %179 
					                                         f32 %185 = OpLoad %184 
					                                Uniform f32* %186 = OpAccessChain %40 %179 
					                                         f32 %187 = OpLoad %186 
					                                       f32_4 %188 = OpCompositeConstruct %181 %183 %185 %187 
					                                         f32 %189 = OpCompositeExtract %188 0 
					                                         f32 %190 = OpCompositeExtract %188 1 
					                                         f32 %191 = OpCompositeExtract %188 2 
					                                         f32 %192 = OpCompositeExtract %188 3 
					                                       f32_4 %193 = OpCompositeConstruct %189 %190 %191 %192 
					                                       f32_4 %194 = OpLoad %162 
					                                       f32_4 %195 = OpFMul %193 %194 
					                                       f32_4 %197 = OpFAdd %195 %196 
					                                                      OpStore %162 %197 
					                              Uniform f32_4* %200 = OpAccessChain %40 %199 
					                                       f32_4 %201 = OpLoad %200 
					                                       f32_4 %204 = OpFMul %201 %203 
					                                                      OpStore %198 %204 
					                              Uniform f32_4* %205 = OpAccessChain %40 %199 
					                                       f32_4 %206 = OpLoad %205 
					                                       f32_4 %207 = OpFNegate %206 
					                                       f32_4 %208 = OpFMul %207 %203 
					                                       f32_4 %209 = OpLoad %169 
					                                       f32_4 %210 = OpFAdd %208 %209 
					                                                      OpStore %9 %210 
					                                       f32_4 %211 = OpLoad %162 
					                                       f32_4 %212 = OpLoad %9 
					                                       f32_4 %213 = OpFMul %211 %212 
					                                       f32_4 %214 = OpLoad %198 
					                                       f32_4 %215 = OpFAdd %213 %214 
					                                                      OpStore %144 %215 
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
						vec4 _ColorRGB;
						float _Near;
						float _Far;
						float _DepthLevel;
						float _FixDistance;
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
					bool u_xlatb1;
					vec4 u_xlat2;
					float u_xlat3;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat3;
					    u_xlat3 = _Far + _Near;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat3 = u_xlat3 + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat6 = u_xlat0.x * u_xlat3;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    u_xlat0 = u_xlat0.xxxx * vec4(u_xlat6);
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    //ENDIF
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xyz = (-u_xlat0.www);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.w = 0.0;
					    u_xlat1 = vec4(vec4(_DepthLevel, _DepthLevel, _DepthLevel, _DepthLevel)) * u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = _ColorRGB * vec4(8.0, 8.0, 8.0, 8.0);
					    u_xlat0 = (-_ColorRGB) * vec4(8.0, 8.0, 8.0, 8.0) + u_xlat10_0;
					    SV_Target0 = u_xlat1 * u_xlat0 + u_xlat2;
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