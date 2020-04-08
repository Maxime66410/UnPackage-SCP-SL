Shader "CameraFilterPack/Blend2Camera_SplitScreen3D" {
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
			GpuProgramID 33550
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
					uniform 	float _Near;
					uniform 	float _Far;
					uniform 	float _FixDistance;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					UNITY_LOCATION(2) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					float u_xlat3;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat3;
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat3 = _Far + _Near;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat3 = u_xlat3 + (-_Near);
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = min(u_xlat0.xxx, vec3(1.0, 1.0, 1.0));
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_2 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_2 = (-u_xlat10_1) + u_xlat10_2;
					    u_xlat0.w = 1.0;
					    SV_Target0 = u_xlat0 * u_xlat16_2 + u_xlat10_1;
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
					; Bound: 208
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %146 %201 
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
					                                                      OpDecorate vs_TEXCOORD0 Location 146 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %177 DescriptorSet 177 
					                                                      OpDecorate %177 Binding 177 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %179 DescriptorSet 179 
					                                                      OpDecorate %179 Binding 179 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %186 DescriptorSet 186 
					                                                      OpDecorate %186 Binding 186 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %188 DescriptorSet 188 
					                                                      OpDecorate %188 Binding 188 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %201 Location 201 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
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
					                                              %38 = OpTypeStruct %7 %6 %6 %6 %12 %7 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32; f32; f32; f32_2; f32_4;}* %40 = OpVariable Uniform 
					                                              %41 = OpTypeInt 32 1 
					                                          i32 %42 = OpConstant 0 
					                                          u32 %43 = OpConstant 2 
					                                              %44 = OpTypePointer Uniform %6 
					                                          u32 %50 = OpConstant 3 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                 Private f32* %60 = OpVariable Private 
					                                          i32 %61 = OpConstant 3 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                          i32 %73 = OpConstant 1 
					                                          i32 %79 = OpConstant 2 
					                                          f32 %86 = OpConstant 3,674022E-40 
					                                         f32 %106 = OpConstant 3,674022E-40 
					                                         f32 %108 = OpConstant 3,674022E-40 
					                                             %128 = OpTypeVector %6 3 
					                                       f32_3 %131 = OpConstantComposite %55 %55 %55 
					                                             %135 = OpTypeBool 
					                                             %136 = OpTypePointer Private %135 
					                               Private bool* %137 = OpVariable Private 
					                                         i32 %138 = OpConstant 4 
					                                         u32 %139 = OpConstant 1 
					                                             %143 = OpTypePointer Private %128 
					                              Private f32_3* %144 = OpVariable Private 
					                                             %145 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %148 = OpConstant 5 
					                                             %149 = OpTypePointer Uniform %7 
					                                Private f32* %160 = OpVariable Private 
					                                             %166 = OpTypePointer Function %6 
					                              Private f32_4* %176 = OpVariable Private 
					        UniformConstant read_only Texture2D* %177 = OpVariable UniformConstant 
					                    UniformConstant sampler* %179 = OpVariable UniformConstant 
					                              Private f32_4* %185 = OpVariable Private 
					        UniformConstant read_only Texture2D* %186 = OpVariable UniformConstant 
					                    UniformConstant sampler* %188 = OpVariable UniformConstant 
					                              Private f32_4* %194 = OpVariable Private 
					                                             %200 = OpTypePointer Output %7 
					                               Output f32_4* %201 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %167 = OpVariable Function 
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
					                                 Uniform f32* %74 = OpAccessChain %40 %73 
					                                          f32 %75 = OpLoad %74 
					                                          f32 %76 = OpFNegate %75 
					                                          f32 %77 = OpFAdd %72 %76 
					                                 Private f32* %78 = OpAccessChain %9 %34 
					                                                      OpStore %78 %77 
					                                 Uniform f32* %80 = OpAccessChain %40 %79 
					                                          f32 %81 = OpLoad %80 
					                                 Uniform f32* %82 = OpAccessChain %40 %73 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %84 = OpFAdd %81 %83 
					                                                      OpStore %60 %84 
					                                          f32 %85 = OpLoad %60 
					                                          f32 %87 = OpExtInst %1 43 %85 %86 %55 
					                                                      OpStore %60 %87 
					                                          f32 %88 = OpLoad %60 
					                                 Uniform f32* %89 = OpAccessChain %40 %73 
					                                          f32 %90 = OpLoad %89 
					                                          f32 %91 = OpFNegate %90 
					                                          f32 %92 = OpFAdd %88 %91 
					                                                      OpStore %60 %92 
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
					                                         f32 %102 = OpExtInst %1 43 %101 %86 %55 
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
					                                         f32 %116 = OpLoad %60 
					                                         f32 %117 = OpFNegate %116 
					                                Private f32* %118 = OpAccessChain %9 %34 
					                                         f32 %119 = OpLoad %118 
					                                         f32 %120 = OpFMul %117 %119 
					                                         f32 %121 = OpFAdd %120 %55 
					                                Private f32* %122 = OpAccessChain %9 %34 
					                                                      OpStore %122 %121 
					                                Private f32* %123 = OpAccessChain %9 %34 
					                                         f32 %124 = OpLoad %123 
					                                         f32 %125 = OpFNegate %124 
					                                         f32 %126 = OpFAdd %125 %55 
					                                Private f32* %127 = OpAccessChain %9 %34 
					                                                      OpStore %127 %126 
					                                       f32_4 %129 = OpLoad %9 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 0 0 0 
					                                       f32_3 %132 = OpExtInst %1 37 %130 %131 
					                                       f32_4 %133 = OpLoad %9 
					                                       f32_4 %134 = OpVectorShuffle %133 %132 4 5 6 3 
					                                                      OpStore %9 %134 
					                                Uniform f32* %140 = OpAccessChain %40 %138 %139 
					                                         f32 %141 = OpLoad %140 
					                                        bool %142 = OpFOrdLessThan %141 %86 
					                                                      OpStore %137 %142 
					                                       f32_2 %147 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %150 = OpAccessChain %40 %148 
					                                       f32_4 %151 = OpLoad %150 
					                                       f32_2 %152 = OpVectorShuffle %151 %151 0 1 
					                                       f32_2 %153 = OpFMul %147 %152 
					                              Uniform f32_4* %154 = OpAccessChain %40 %148 
					                                       f32_4 %155 = OpLoad %154 
					                                       f32_2 %156 = OpVectorShuffle %155 %155 2 3 
					                                       f32_2 %157 = OpFAdd %153 %156 
					                                       f32_3 %158 = OpLoad %144 
					                                       f32_3 %159 = OpVectorShuffle %158 %157 3 4 2 
					                                                      OpStore %144 %159 
					                                Private f32* %161 = OpAccessChain %144 %139 
					                                         f32 %162 = OpLoad %161 
					                                         f32 %163 = OpFNegate %162 
					                                         f32 %164 = OpFAdd %163 %55 
					                                                      OpStore %160 %164 
					                                        bool %165 = OpLoad %137 
					                                                      OpSelectionMerge %169 None 
					                                                      OpBranchConditional %165 %168 %171 
					                                             %168 = OpLabel 
					                                         f32 %170 = OpLoad %160 
					                                                      OpStore %167 %170 
					                                                      OpBranch %169 
					                                             %171 = OpLabel 
					                                Private f32* %172 = OpAccessChain %144 %139 
					                                         f32 %173 = OpLoad %172 
					                                                      OpStore %167 %173 
					                                                      OpBranch %169 
					                                             %169 = OpLabel 
					                                         f32 %174 = OpLoad %167 
					                                Private f32* %175 = OpAccessChain %144 %43 
					                                                      OpStore %175 %174 
					                         read_only Texture2D %178 = OpLoad %177 
					                                     sampler %180 = OpLoad %179 
					                  read_only Texture2DSampled %181 = OpSampledImage %178 %180 
					                                       f32_3 %182 = OpLoad %144 
					                                       f32_2 %183 = OpVectorShuffle %182 %182 0 2 
					                                       f32_4 %184 = OpImageSampleImplicitLod %181 %183 
					                                                      OpStore %176 %184 
					                         read_only Texture2D %187 = OpLoad %186 
					                                     sampler %189 = OpLoad %188 
					                  read_only Texture2DSampled %190 = OpSampledImage %187 %189 
					                                       f32_3 %191 = OpLoad %144 
					                                       f32_2 %192 = OpVectorShuffle %191 %191 0 2 
					                                       f32_4 %193 = OpImageSampleImplicitLod %190 %192 
					                                                      OpStore %185 %193 
					                                       f32_4 %195 = OpLoad %176 
					                                       f32_4 %196 = OpLoad %185 
					                                       f32_4 %197 = OpFNegate %196 
					                                       f32_4 %198 = OpFAdd %195 %197 
					                                                      OpStore %194 %198 
					                                Private f32* %199 = OpAccessChain %9 %50 
					                                                      OpStore %199 %55 
					                                       f32_4 %202 = OpLoad %9 
					                                       f32_4 %203 = OpLoad %194 
					                                       f32_4 %204 = OpFMul %202 %203 
					                                       f32_4 %205 = OpLoad %185 
					                                       f32_4 %206 = OpFAdd %204 %205 
					                                                      OpStore %201 %206 
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
						vec4 unused_0_0[5];
						float _Near;
						float _Far;
						float _FixDistance;
						vec4 unused_0_4;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					float u_xlat3;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat3 = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat3;
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat3 = _Far + _Near;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat3 = u_xlat3 + (-_Near);
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = min(u_xlat0.xxx, vec3(1.0, 1.0, 1.0));
					    u_xlatb1 = _MainTex_TexelSize.y<0.0;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4 = (-u_xlat2.y) + 1.0;
					    u_xlat2.z = (u_xlatb1) ? u_xlat4 : u_xlat2.y;
					    u_xlat10_1 = texture(_MainTex2, u_xlat2.xz);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xz);
					    u_xlat16_1 = u_xlat10_1 + (-u_xlat10_2);
					    u_xlat0.w = 1.0;
					    SV_Target0 = u_xlat0 * u_xlat16_1 + u_xlat10_2;
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