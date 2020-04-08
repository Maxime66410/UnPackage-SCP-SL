Shader "CameraFilterPack/TV_BrokenGlass" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 28299
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
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
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_COLOR0 = in_COLOR0;
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat8;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat10_1 = texture(_MainTex2, u_xlat8.xy);
					    u_xlat2 = u_xlat0.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.0, 0.5, 0.5);
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.zw);
					    u_xlat3.xyz = u_xlat10_3.xyz * vec3(_Value3);
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_Value4, _Value4, _Value4)) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat10_2.xyz * vec3(vec3(_Value5, _Value5, _Value5)) + u_xlat1.xyz;
					    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.0, 0.5);
					    u_xlat10_2 = texture(_MainTex2, u_xlat8.xy);
					    u_xlat1.xyz = u_xlat10_2.xyz * vec3(vec3(_Value2, _Value2, _Value2)) + u_xlat1.xyz;
					    u_xlat0.xy = u_xlat1.xx * vec2(0.001953125, 0.001953125) + u_xlat0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat1.xyz * vec3(vec3(_Value, _Value, _Value)) + u_xlat10_0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 97
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 %88 %89 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 9 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %17 Location 17 
					                                              OpDecorate %22 ArrayStride 22 
					                                              OpDecorate %23 ArrayStride 23 
					                                              OpMemberDecorate %24 0 Offset 24 
					                                              OpMemberDecorate %24 1 Offset 24 
					                                              OpDecorate %24 Block 
					                                              OpDecorate %26 DescriptorSet 26 
					                                              OpDecorate %26 Binding 26 
					                                              OpMemberDecorate %76 0 BuiltIn 76 
					                                              OpMemberDecorate %76 1 BuiltIn 76 
					                                              OpMemberDecorate %76 2 BuiltIn 76 
					                                              OpDecorate %76 Block 
					                                              OpDecorate %88 Location 88 
					                                              OpDecorate %89 Location 89 
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
					                                      %24 = OpTypeStruct %22 %23 
					                                      %25 = OpTypePointer Uniform %24 
					Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
					                                      %27 = OpTypeInt 32 1 
					                                  i32 %28 = OpConstant 0 
					                                  i32 %29 = OpConstant 1 
					                                      %30 = OpTypePointer Uniform %13 
					                                  i32 %41 = OpConstant 2 
					                                  i32 %50 = OpConstant 3 
					                       Private f32_4* %54 = OpVariable Private 
					                                  u32 %74 = OpConstant 1 
					                                      %75 = OpTypeArray %6 %74 
					                                      %76 = OpTypeStruct %13 %6 %75 
					                                      %77 = OpTypePointer Output %76 
					 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
					                                      %86 = OpTypePointer Output %13 
					                        Output f32_4* %88 = OpVariable Output 
					                         Input f32_4* %89 = OpVariable Input 
					                                      %91 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                                f32_2 %12 = OpLoad %11 
					                                              OpStore vs_TEXCOORD0 %12 
					                                f32_4 %18 = OpLoad %17 
					                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
					                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
					                                f32_4 %32 = OpLoad %31 
					                                f32_4 %33 = OpFMul %19 %32 
					                                              OpStore %15 %33 
					                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
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
					                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
					                                f32_4 %58 = OpLoad %57 
					                                f32_4 %59 = OpFMul %56 %58 
					                                              OpStore %54 %59 
					                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
					                                f32_4 %61 = OpLoad %60 
					                                f32_4 %62 = OpLoad %15 
					                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
					                                f32_4 %64 = OpFMul %61 %63 
					                                f32_4 %65 = OpLoad %54 
					                                f32_4 %66 = OpFAdd %64 %65 
					                                              OpStore %54 %66 
					                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
					                                f32_4 %68 = OpLoad %67 
					                                f32_4 %69 = OpLoad %15 
					                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
					                                f32_4 %71 = OpFMul %68 %70 
					                                f32_4 %72 = OpLoad %54 
					                                f32_4 %73 = OpFAdd %71 %72 
					                                              OpStore %54 %73 
					                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
					                                f32_4 %80 = OpLoad %79 
					                                f32_4 %81 = OpLoad %15 
					                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
					                                f32_4 %83 = OpFMul %80 %82 
					                                f32_4 %84 = OpLoad %54 
					                                f32_4 %85 = OpFAdd %83 %84 
					                        Output f32_4* %87 = OpAccessChain %78 %28 
					                                              OpStore %87 %85 
					                                f32_4 %90 = OpLoad %89 
					                                              OpStore %88 %90 
					                          Output f32* %92 = OpAccessChain %78 %28 %74 
					                                  f32 %93 = OpLoad %92 
					                                  f32 %94 = OpFNegate %93 
					                          Output f32* %95 = OpAccessChain %78 %28 %74 
					                                              OpStore %95 %94 
					                                              OpReturn
					                                              OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 221
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %28 %198 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpMemberDecorate %12 4 Offset 12 
					                                                      OpMemberDecorate %12 5 Offset 12 
					                                                      OpMemberDecorate %12 6 RelaxedPrecision 
					                                                      OpMemberDecorate %12 6 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 28 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %69 RelaxedPrecision 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %72 DescriptorSet 72 
					                                                      OpDecorate %72 Binding 72 
					                                                      OpDecorate %73 RelaxedPrecision 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %76 DescriptorSet 76 
					                                                      OpDecorate %76 Binding 76 
					                                                      OpDecorate %77 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %105 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %142 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %188 DescriptorSet 188 
					                                                      OpDecorate %188 Binding 188 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %190 DescriptorSet 190 
					                                                      OpDecorate %190 Binding 190 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %198 Location 198 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 2 
					                                              %11 = OpTypeVector %9 4 
					                                              %12 = OpTypeStruct %9 %9 %9 %9 %9 %10 %11 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 5 
					                                              %17 = OpTypeInt 32 0 
					                                          u32 %18 = OpConstant 1 
					                                              %19 = OpTypePointer Uniform %9 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                              %24 = OpTypeVector %9 3 
					                                              %25 = OpTypePointer Private %24 
					                               Private f32_3* %26 = OpVariable Private 
					                                              %27 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %30 = OpConstant 6 
					                                              %31 = OpTypePointer Uniform %11 
					                                              %42 = OpTypePointer Private %9 
					                                 Private f32* %43 = OpVariable Private 
					                                          f32 %47 = OpConstant 3,674022E-40 
					                                              %50 = OpTypePointer Function %9 
					                                          u32 %59 = OpConstant 2 
					                               Private f32_3* %61 = OpVariable Private 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                        f32_2 %65 = OpConstantComposite %64 %64 
					                               Private f32_3* %69 = OpVariable Private 
					                                              %70 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                              %71 = OpTypePointer UniformConstant %70 
					         UniformConstant read_only Texture2D* %72 = OpVariable UniformConstant 
					                                              %74 = OpTypeSampler 
					                                              %75 = OpTypePointer UniformConstant %74 
					                     UniformConstant sampler* %76 = OpVariable UniformConstant 
					                                              %78 = OpTypeSampledImage %70 
					                                              %84 = OpTypePointer Private %11 
					                               Private f32_4* %85 = OpVariable Private 
					                                        f32_4 %88 = OpConstantComposite %64 %64 %64 %64 
					                                        f32_4 %90 = OpConstantComposite %64 %22 %64 %64 
					                                              %92 = OpTypePointer Private %10 
					                               Private f32_2* %93 = OpVariable Private 
					                                        f32_2 %97 = OpConstantComposite %22 %64 
					                               Private f32_3* %99 = OpVariable Private 
					                              Private f32_3* %106 = OpVariable Private 
					                              Private f32_3* %114 = OpVariable Private 
					                              Private f32_3* %122 = OpVariable Private 
					                                         i32 %124 = OpConstant 2 
					                                         i32 %130 = OpConstant 3 
					                                         i32 %146 = OpConstant 4 
					                                         i32 %162 = OpConstant 1 
					                                         f32 %179 = OpConstant 3,674022E-40 
					                                       f32_2 %180 = OpConstantComposite %179 %179 
					                              Private f32_3* %187 = OpVariable Private 
					        UniformConstant read_only Texture2D* %188 = OpVariable UniformConstant 
					                    UniformConstant sampler* %190 = OpVariable UniformConstant 
					                                             %197 = OpTypePointer Output %11 
					                               Output f32_4* %198 = OpVariable Output 
					                                         i32 %200 = OpConstant 0 
					                                         u32 %217 = OpConstant 3 
					                                             %218 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %51 = OpVariable Function 
					                                 Uniform f32* %20 = OpAccessChain %14 %16 %18 
					                                          f32 %21 = OpLoad %20 
					                                         bool %23 = OpFOrdLessThan %21 %22 
					                                                      OpStore %8 %23 
					                                        f32_2 %29 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %32 = OpAccessChain %14 %30 
					                                        f32_4 %33 = OpLoad %32 
					                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                        f32_2 %35 = OpFMul %29 %34 
					                               Uniform f32_4* %36 = OpAccessChain %14 %30 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
					                                        f32_2 %39 = OpFAdd %35 %38 
					                                        f32_3 %40 = OpLoad %26 
					                                        f32_3 %41 = OpVectorShuffle %40 %39 3 4 2 
					                                                      OpStore %26 %41 
					                                 Private f32* %44 = OpAccessChain %26 %18 
					                                          f32 %45 = OpLoad %44 
					                                          f32 %46 = OpFNegate %45 
					                                          f32 %48 = OpFAdd %46 %47 
					                                                      OpStore %43 %48 
					                                         bool %49 = OpLoad %8 
					                                                      OpSelectionMerge %53 None 
					                                                      OpBranchConditional %49 %52 %55 
					                                              %52 = OpLabel 
					                                          f32 %54 = OpLoad %43 
					                                                      OpStore %51 %54 
					                                                      OpBranch %53 
					                                              %55 = OpLabel 
					                                 Private f32* %56 = OpAccessChain %26 %18 
					                                          f32 %57 = OpLoad %56 
					                                                      OpStore %51 %57 
					                                                      OpBranch %53 
					                                              %53 = OpLabel 
					                                          f32 %58 = OpLoad %51 
					                                 Private f32* %60 = OpAccessChain %26 %59 
					                                                      OpStore %60 %58 
					                                        f32_3 %62 = OpLoad %26 
					                                        f32_2 %63 = OpVectorShuffle %62 %62 0 2 
					                                        f32_2 %66 = OpFMul %63 %65 
					                                        f32_3 %67 = OpLoad %61 
					                                        f32_3 %68 = OpVectorShuffle %67 %66 3 4 2 
					                                                      OpStore %61 %68 
					                          read_only Texture2D %73 = OpLoad %72 
					                                      sampler %77 = OpLoad %76 
					                   read_only Texture2DSampled %79 = OpSampledImage %73 %77 
					                                        f32_3 %80 = OpLoad %61 
					                                        f32_2 %81 = OpVectorShuffle %80 %80 0 1 
					                                        f32_4 %82 = OpImageSampleImplicitLod %79 %81 
					                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
					                                                      OpStore %69 %83 
					                                        f32_3 %86 = OpLoad %26 
					                                        f32_4 %87 = OpVectorShuffle %86 %86 0 2 0 2 
					                                        f32_4 %89 = OpFMul %87 %88 
					                                        f32_4 %91 = OpFAdd %89 %90 
					                                                      OpStore %85 %91 
					                                        f32_3 %94 = OpLoad %26 
					                                        f32_2 %95 = OpVectorShuffle %94 %94 0 2 
					                                        f32_2 %96 = OpFMul %95 %65 
					                                        f32_2 %98 = OpFAdd %96 %97 
					                                                      OpStore %93 %98 
					                         read_only Texture2D %100 = OpLoad %72 
					                                     sampler %101 = OpLoad %76 
					                  read_only Texture2DSampled %102 = OpSampledImage %100 %101 
					                                       f32_2 %103 = OpLoad %93 
					                                       f32_4 %104 = OpImageSampleImplicitLod %102 %103 
					                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
					                                                      OpStore %99 %105 
					                         read_only Texture2D %107 = OpLoad %72 
					                                     sampler %108 = OpLoad %76 
					                  read_only Texture2DSampled %109 = OpSampledImage %107 %108 
					                                       f32_4 %110 = OpLoad %85 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
					                                       f32_4 %112 = OpImageSampleImplicitLod %109 %111 
					                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
					                                                      OpStore %106 %113 
					                         read_only Texture2D %115 = OpLoad %72 
					                                     sampler %116 = OpLoad %76 
					                  read_only Texture2DSampled %117 = OpSampledImage %115 %116 
					                                       f32_4 %118 = OpLoad %85 
					                                       f32_2 %119 = OpVectorShuffle %118 %118 2 3 
					                                       f32_4 %120 = OpImageSampleImplicitLod %117 %119 
					                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
					                                                      OpStore %114 %121 
					                                       f32_3 %123 = OpLoad %106 
					                                Uniform f32* %125 = OpAccessChain %14 %124 
					                                         f32 %126 = OpLoad %125 
					                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
					                                       f32_3 %128 = OpFMul %123 %127 
					                                                      OpStore %122 %128 
					                                       f32_3 %129 = OpLoad %69 
					                                Uniform f32* %131 = OpAccessChain %14 %130 
					                                         f32 %132 = OpLoad %131 
					                                Uniform f32* %133 = OpAccessChain %14 %130 
					                                         f32 %134 = OpLoad %133 
					                                Uniform f32* %135 = OpAccessChain %14 %130 
					                                         f32 %136 = OpLoad %135 
					                                       f32_3 %137 = OpCompositeConstruct %132 %134 %136 
					                                         f32 %138 = OpCompositeExtract %137 0 
					                                         f32 %139 = OpCompositeExtract %137 1 
					                                         f32 %140 = OpCompositeExtract %137 2 
					                                       f32_3 %141 = OpCompositeConstruct %138 %139 %140 
					                                       f32_3 %142 = OpFMul %129 %141 
					                                       f32_3 %143 = OpLoad %122 
					                                       f32_3 %144 = OpFAdd %142 %143 
					                                                      OpStore %61 %144 
					                                       f32_3 %145 = OpLoad %114 
					                                Uniform f32* %147 = OpAccessChain %14 %146 
					                                         f32 %148 = OpLoad %147 
					                                Uniform f32* %149 = OpAccessChain %14 %146 
					                                         f32 %150 = OpLoad %149 
					                                Uniform f32* %151 = OpAccessChain %14 %146 
					                                         f32 %152 = OpLoad %151 
					                                       f32_3 %153 = OpCompositeConstruct %148 %150 %152 
					                                         f32 %154 = OpCompositeExtract %153 0 
					                                         f32 %155 = OpCompositeExtract %153 1 
					                                         f32 %156 = OpCompositeExtract %153 2 
					                                       f32_3 %157 = OpCompositeConstruct %154 %155 %156 
					                                       f32_3 %158 = OpFMul %145 %157 
					                                       f32_3 %159 = OpLoad %61 
					                                       f32_3 %160 = OpFAdd %158 %159 
					                                                      OpStore %61 %160 
					                                       f32_3 %161 = OpLoad %99 
					                                Uniform f32* %163 = OpAccessChain %14 %162 
					                                         f32 %164 = OpLoad %163 
					                                Uniform f32* %165 = OpAccessChain %14 %162 
					                                         f32 %166 = OpLoad %165 
					                                Uniform f32* %167 = OpAccessChain %14 %162 
					                                         f32 %168 = OpLoad %167 
					                                       f32_3 %169 = OpCompositeConstruct %164 %166 %168 
					                                         f32 %170 = OpCompositeExtract %169 0 
					                                         f32 %171 = OpCompositeExtract %169 1 
					                                         f32 %172 = OpCompositeExtract %169 2 
					                                       f32_3 %173 = OpCompositeConstruct %170 %171 %172 
					                                       f32_3 %174 = OpFMul %161 %173 
					                                       f32_3 %175 = OpLoad %61 
					                                       f32_3 %176 = OpFAdd %174 %175 
					                                                      OpStore %61 %176 
					                                       f32_3 %177 = OpLoad %61 
					                                       f32_2 %178 = OpVectorShuffle %177 %177 0 0 
					                                       f32_2 %181 = OpFMul %178 %180 
					                                       f32_3 %182 = OpLoad %26 
					                                       f32_2 %183 = OpVectorShuffle %182 %182 0 1 
					                                       f32_2 %184 = OpFAdd %181 %183 
					                                       f32_3 %185 = OpLoad %26 
					                                       f32_3 %186 = OpVectorShuffle %185 %184 3 4 2 
					                                                      OpStore %26 %186 
					                         read_only Texture2D %189 = OpLoad %188 
					                                     sampler %191 = OpLoad %190 
					                  read_only Texture2DSampled %192 = OpSampledImage %189 %191 
					                                       f32_3 %193 = OpLoad %26 
					                                       f32_2 %194 = OpVectorShuffle %193 %193 0 1 
					                                       f32_4 %195 = OpImageSampleImplicitLod %192 %194 
					                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
					                                                      OpStore %187 %196 
					                                       f32_3 %199 = OpLoad %61 
					                                Uniform f32* %201 = OpAccessChain %14 %200 
					                                         f32 %202 = OpLoad %201 
					                                Uniform f32* %203 = OpAccessChain %14 %200 
					                                         f32 %204 = OpLoad %203 
					                                Uniform f32* %205 = OpAccessChain %14 %200 
					                                         f32 %206 = OpLoad %205 
					                                       f32_3 %207 = OpCompositeConstruct %202 %204 %206 
					                                         f32 %208 = OpCompositeExtract %207 0 
					                                         f32 %209 = OpCompositeExtract %207 1 
					                                         f32 %210 = OpCompositeExtract %207 2 
					                                       f32_3 %211 = OpCompositeConstruct %208 %209 %210 
					                                       f32_3 %212 = OpFMul %199 %211 
					                                       f32_3 %213 = OpLoad %187 
					                                       f32_3 %214 = OpFAdd %212 %213 
					                                       f32_4 %215 = OpLoad %198 
					                                       f32_4 %216 = OpVectorShuffle %215 %214 4 5 6 3 
					                                                      OpStore %198 %216 
					                                 Output f32* %219 = OpAccessChain %198 %217 
					                                                      OpStore %219 %47 
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
						float _Value;
						float _Value2;
						float _Value3;
						float _Value4;
						float _Value5;
						vec4 unused_0_6;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec4 u_xlat10_4;
					float u_xlat5;
					vec2 u_xlat11;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5 = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb0) ? u_xlat5 : u_xlat1.y;
					    u_xlat0.xy = u_xlat1.xz * vec2(0.5, 0.5);
					    u_xlat10_0 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat2 = u_xlat1.xzxz * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.0, 0.5, 0.5);
					    u_xlat11.xy = u_xlat1.xz * vec2(0.5, 0.5) + vec2(0.0, 0.5);
					    u_xlat10_3 = texture(_MainTex2, u_xlat11.xy);
					    u_xlat10_4 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.zw);
					    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_Value3);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(vec3(_Value4, _Value4, _Value4)) + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat10_2.xyz * vec3(vec3(_Value5, _Value5, _Value5)) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat10_3.xyz * vec3(vec3(_Value2, _Value2, _Value2)) + u_xlat0.xyz;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.001953125, 0.001953125) + u_xlat1.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(vec3(_Value, _Value, _Value)) + u_xlat10_1.xyz;
					    SV_Target0.w = 1.0;
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