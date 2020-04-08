Shader "CameraFilterPack/OldFilm_Cutting1" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 3476
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
					uniform 	float _TimeX;
					uniform 	float _Speed;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6 = u_xlat0.x * 16.0;
					    u_xlat1.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat6 = u_xlat6 * u_xlat1.x;
					    u_xlat6 = u_xlat0.y * u_xlat6;
					    u_xlat6 = u_xlat1.y * u_xlat6;
					    u_xlat6 = log2(u_xlat6);
					    u_xlat6 = u_xlat6 * 0.400000006;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat6 = u_xlat6 + _Value2;
					    u_xlat9 = _TimeX * 15.0;
					    u_xlat9 = trunc(u_xlat9);
					    u_xlat1.x = u_xlat9 + 23.0;
					    u_xlat9 = dot(vec2(u_xlat9), vec2(12.9898005, 78.2330017));
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * 43758.5469;
					    u_xlat2.x = fract(u_xlat9);
					    u_xlat9 = dot(u_xlat1.xx, vec2(12.9898005, 78.2330017));
					    u_xlat9 = sin(u_xlat9);
					    u_xlat9 = u_xlat9 * 43758.5469;
					    u_xlat2.y = fract(u_xlat9);
					    u_xlat1.xyw = u_xlat2.xyy * vec3(-0.00800000038, 0.00400000019, 0.00999999978) + u_xlat0.xyy;
					    u_xlat1.z = _TimeX * _Speed + u_xlat0.x;
					    u_xlat10_2 = texture(_MainTex2, u_xlat1.zw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_0.xyw = u_xlat10_2.xyz * vec3(4.0, 4.0, 4.0);
					    u_xlat2.xyz = u_xlat10_1.xyz / vec3(u_xlat6);
					    u_xlat2.xyz = (-u_xlat10_1.xyz) * vec3(u_xlat6) + u_xlat2.xyz;
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat10_1.xyz;
					    u_xlat1.xyz = vec3(_Value3) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat6 = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xyz);
					    u_xlat6 = u_xlat6 * _Value;
					    SV_Target0.xyz = vec3(u_xlat6) / u_xlat16_0.xyw;
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
					; Bound: 280
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %73 %268 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpMemberDecorate %11 5 Offset 11 
					                                                      OpMemberDecorate %11 6 RelaxedPrecision 
					                                                      OpMemberDecorate %11 6 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 73 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %99 DescriptorSet 99 
					                                                      OpDecorate %99 Binding 99 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %103 DescriptorSet 103 
					                                                      OpDecorate %103 Binding 103 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %165 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %248 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %249 DescriptorSet 249 
					                                                      OpDecorate %249 Binding 249 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %251 DescriptorSet 251 
					                                                      OpDecorate %251 Binding 251 
					                                                      OpDecorate %252 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %268 Location 268 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %7 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 0 
					                                              %16 = OpTypePointer Uniform %6 
					                                          f32 %19 = OpConstant 3,674022E-40 
					                                              %21 = OpTypeInt 32 0 
					                                          u32 %22 = OpConstant 0 
					                                              %23 = OpTypePointer Private %6 
					                                 Private f32* %29 = OpVariable Private 
					                                          f32 %32 = OpConstant 3,674022E-40 
					                                          f32 %33 = OpConstant 3,674022E-40 
					                                        f32_2 %34 = OpConstantComposite %32 %33 
					                                          f32 %38 = OpConstant 3,674022E-40 
					                                          f32 %51 = OpConstant 3,674022E-40 
					                                              %54 = OpTypePointer Private %10 
					                               Private f32_4* %55 = OpVariable Private 
					                                          u32 %59 = OpConstant 1 
					                                              %72 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %76 = OpConstant 6 
					                                              %77 = OpTypePointer Uniform %10 
					                               Private f32_2* %86 = OpVariable Private 
					                                          f32 %89 = OpConstant 3,674022E-40 
					                                          f32 %90 = OpConstant 3,674022E-40 
					                                        f32_2 %91 = OpConstantComposite %89 %90 
					                               Private f32_4* %96 = OpVariable Private 
					                                              %97 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %98 = OpTypePointer UniformConstant %97 
					         UniformConstant read_only Texture2D* %99 = OpVariable UniformConstant 
					                                             %101 = OpTypeSampler 
					                                             %102 = OpTypePointer UniformConstant %101 
					                    UniformConstant sampler* %103 = OpVariable UniformConstant 
					                                             %105 = OpTypeSampledImage %97 
					                                             %109 = OpTypeVector %6 3 
					                                         f32 %115 = OpConstant 3,674022E-40 
					                              Private f32_2* %118 = OpVariable Private 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                                       f32_2 %122 = OpConstantComposite %121 %121 
					                                         f32 %148 = OpConstant 3,674022E-40 
					                                         i32 %157 = OpConstant 3 
					                                             %162 = OpTypePointer Private %109 
					                              Private f32_3* %163 = OpVariable Private 
					                                         i32 %184 = OpConstant 4 
					                                         f32 %195 = OpConstant 3,674022E-40 
					                                         f32 %196 = OpConstant 3,674022E-40 
					                                         f32 %197 = OpConstant 3,674022E-40 
					                                       f32_3 %198 = OpConstantComposite %195 %196 %197 
					                                         i32 %205 = OpConstant 2 
					                                             %210 = OpTypeBool 
					                                             %211 = OpTypePointer Private %210 
					                               Private bool* %212 = OpVariable Private 
					                                         i32 %213 = OpConstant 5 
					                                         f32 %216 = OpConstant 3,674022E-40 
					                                             %219 = OpTypePointer Function %6 
					                                         i32 %232 = OpConstant 1 
					                                         f32 %242 = OpConstant 3,674022E-40 
					                              Private f32_4* %248 = OpVariable Private 
					        UniformConstant read_only Texture2D* %249 = OpVariable UniformConstant 
					                    UniformConstant sampler* %251 = OpVariable UniformConstant 
					                              Private f32_4* %259 = OpVariable Private 
					                                         f32 %262 = OpConstant 3,674022E-40 
					                                       f32_3 %263 = OpConstantComposite %262 %262 %262 
					                                             %267 = OpTypePointer Output %10 
					                               Output f32_4* %268 = OpVariable Output 
					                                         u32 %276 = OpConstant 3 
					                                             %277 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %220 = OpVariable Function 
					                                 Uniform f32* %17 = OpAccessChain %13 %15 
					                                          f32 %18 = OpLoad %17 
					                                          f32 %20 = OpFMul %18 %19 
					                                 Private f32* %24 = OpAccessChain %9 %22 
					                                                      OpStore %24 %20 
					                                 Private f32* %25 = OpAccessChain %9 %22 
					                                          f32 %26 = OpLoad %25 
					                                          f32 %27 = OpExtInst %1 3 %26 
					                                 Private f32* %28 = OpAccessChain %9 %22 
					                                                      OpStore %28 %27 
					                                        f32_2 %30 = OpLoad %9 
					                                        f32_2 %31 = OpVectorShuffle %30 %30 0 0 
					                                          f32 %35 = OpDot %31 %34 
					                                                      OpStore %29 %35 
					                                 Private f32* %36 = OpAccessChain %9 %22 
					                                          f32 %37 = OpLoad %36 
					                                          f32 %39 = OpFAdd %37 %38 
					                                 Private f32* %40 = OpAccessChain %9 %22 
					                                                      OpStore %40 %39 
					                                        f32_2 %41 = OpLoad %9 
					                                        f32_2 %42 = OpVectorShuffle %41 %41 0 0 
					                                          f32 %43 = OpDot %42 %34 
					                                 Private f32* %44 = OpAccessChain %9 %22 
					                                                      OpStore %44 %43 
					                                 Private f32* %45 = OpAccessChain %9 %22 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %47 = OpExtInst %1 13 %46 
					                                 Private f32* %48 = OpAccessChain %9 %22 
					                                                      OpStore %48 %47 
					                                 Private f32* %49 = OpAccessChain %9 %22 
					                                          f32 %50 = OpLoad %49 
					                                          f32 %52 = OpFMul %50 %51 
					                                 Private f32* %53 = OpAccessChain %9 %22 
					                                                      OpStore %53 %52 
					                                 Private f32* %56 = OpAccessChain %9 %22 
					                                          f32 %57 = OpLoad %56 
					                                          f32 %58 = OpExtInst %1 10 %57 
					                                 Private f32* %60 = OpAccessChain %55 %59 
					                                                      OpStore %60 %58 
					                                          f32 %61 = OpLoad %29 
					                                          f32 %62 = OpExtInst %1 13 %61 
					                                 Private f32* %63 = OpAccessChain %9 %22 
					                                                      OpStore %63 %62 
					                                 Private f32* %64 = OpAccessChain %9 %22 
					                                          f32 %65 = OpLoad %64 
					                                          f32 %66 = OpFMul %65 %51 
					                                 Private f32* %67 = OpAccessChain %9 %22 
					                                                      OpStore %67 %66 
					                                 Private f32* %68 = OpAccessChain %9 %22 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpExtInst %1 10 %69 
					                                 Private f32* %71 = OpAccessChain %55 %22 
					                                                      OpStore %71 %70 
					                                        f32_2 %74 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %75 = OpVectorShuffle %74 %74 1 0 
					                               Uniform f32_4* %78 = OpAccessChain %13 %76 
					                                        f32_4 %79 = OpLoad %78 
					                                        f32_2 %80 = OpVectorShuffle %79 %79 1 0 
					                                        f32_2 %81 = OpFMul %75 %80 
					                               Uniform f32_4* %82 = OpAccessChain %13 %76 
					                                        f32_4 %83 = OpLoad %82 
					                                        f32_2 %84 = OpVectorShuffle %83 %83 3 2 
					                                        f32_2 %85 = OpFAdd %81 %84 
					                                                      OpStore %9 %85 
					                                        f32_4 %87 = OpLoad %55 
					                                        f32_2 %88 = OpVectorShuffle %87 %87 0 1 
					                                        f32_2 %92 = OpFMul %88 %91 
					                                        f32_2 %93 = OpLoad %9 
					                                        f32_2 %94 = OpVectorShuffle %93 %93 1 0 
					                                        f32_2 %95 = OpFAdd %92 %94 
					                                                      OpStore %86 %95 
					                         read_only Texture2D %100 = OpLoad %99 
					                                     sampler %104 = OpLoad %103 
					                  read_only Texture2DSampled %106 = OpSampledImage %100 %104 
					                                       f32_2 %107 = OpLoad %86 
					                                       f32_4 %108 = OpImageSampleImplicitLod %106 %107 
					                                       f32_3 %110 = OpVectorShuffle %108 %108 0 1 2 
					                                       f32_4 %111 = OpLoad %96 
					                                       f32_4 %112 = OpVectorShuffle %111 %110 4 1 5 6 
					                                                      OpStore %96 %112 
					                                Private f32* %113 = OpAccessChain %9 %59 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %116 = OpFMul %114 %115 
					                                Private f32* %117 = OpAccessChain %86 %22 
					                                                      OpStore %117 %116 
					                                       f32_2 %119 = OpLoad %9 
					                                       f32_2 %120 = OpFNegate %119 
					                                       f32_2 %123 = OpFAdd %120 %122 
					                                                      OpStore %118 %123 
					                                Private f32* %124 = OpAccessChain %86 %22 
					                                         f32 %125 = OpLoad %124 
					                                Private f32* %126 = OpAccessChain %118 %59 
					                                         f32 %127 = OpLoad %126 
					                                         f32 %128 = OpFMul %125 %127 
					                                Private f32* %129 = OpAccessChain %86 %22 
					                                                      OpStore %129 %128 
					                                Private f32* %130 = OpAccessChain %9 %22 
					                                         f32 %131 = OpLoad %130 
					                                Private f32* %132 = OpAccessChain %86 %22 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFMul %131 %133 
					                                Private f32* %135 = OpAccessChain %86 %22 
					                                                      OpStore %135 %134 
					                                Private f32* %136 = OpAccessChain %118 %22 
					                                         f32 %137 = OpLoad %136 
					                                Private f32* %138 = OpAccessChain %86 %22 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFMul %137 %139 
					                                Private f32* %141 = OpAccessChain %86 %22 
					                                                      OpStore %141 %140 
					                                Private f32* %142 = OpAccessChain %86 %22 
					                                         f32 %143 = OpLoad %142 
					                                         f32 %144 = OpExtInst %1 30 %143 
					                                Private f32* %145 = OpAccessChain %86 %22 
					                                                      OpStore %145 %144 
					                                Private f32* %146 = OpAccessChain %86 %22 
					                                         f32 %147 = OpLoad %146 
					                                         f32 %149 = OpFMul %147 %148 
					                                Private f32* %150 = OpAccessChain %86 %22 
					                                                      OpStore %150 %149 
					                                Private f32* %151 = OpAccessChain %86 %22 
					                                         f32 %152 = OpLoad %151 
					                                         f32 %153 = OpExtInst %1 29 %152 
					                                Private f32* %154 = OpAccessChain %86 %22 
					                                                      OpStore %154 %153 
					                                Private f32* %155 = OpAccessChain %86 %22 
					                                         f32 %156 = OpLoad %155 
					                                Uniform f32* %158 = OpAccessChain %13 %157 
					                                         f32 %159 = OpLoad %158 
					                                         f32 %160 = OpFAdd %156 %159 
					                                Private f32* %161 = OpAccessChain %86 %22 
					                                                      OpStore %161 %160 
					                                       f32_4 %164 = OpLoad %96 
					                                       f32_3 %165 = OpVectorShuffle %164 %164 0 2 3 
					                                       f32_2 %166 = OpLoad %86 
					                                       f32_3 %167 = OpVectorShuffle %166 %166 0 0 0 
					                                       f32_3 %168 = OpFDiv %165 %167 
					                                                      OpStore %163 %168 
					                                       f32_4 %169 = OpLoad %96 
					                                       f32_3 %170 = OpVectorShuffle %169 %169 0 2 3 
					                                       f32_3 %171 = OpFNegate %170 
					                                       f32_2 %172 = OpLoad %86 
					                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
					                                       f32_3 %174 = OpFMul %171 %173 
					                                       f32_3 %175 = OpLoad %163 
					                                       f32_3 %176 = OpFAdd %174 %175 
					                                                      OpStore %163 %176 
					                                       f32_2 %177 = OpLoad %86 
					                                       f32_3 %178 = OpVectorShuffle %177 %177 0 0 0 
					                                       f32_4 %179 = OpLoad %96 
					                                       f32_3 %180 = OpVectorShuffle %179 %179 0 2 3 
					                                       f32_3 %181 = OpFMul %178 %180 
					                                       f32_4 %182 = OpLoad %55 
					                                       f32_4 %183 = OpVectorShuffle %182 %181 4 1 5 6 
					                                                      OpStore %55 %183 
					                                Uniform f32* %185 = OpAccessChain %13 %184 
					                                         f32 %186 = OpLoad %185 
					                                       f32_3 %187 = OpCompositeConstruct %186 %186 %186 
					                                       f32_3 %188 = OpLoad %163 
					                                       f32_3 %189 = OpFMul %187 %188 
					                                       f32_4 %190 = OpLoad %55 
					                                       f32_3 %191 = OpVectorShuffle %190 %190 0 2 3 
					                                       f32_3 %192 = OpFAdd %189 %191 
					                                       f32_4 %193 = OpLoad %55 
					                                       f32_4 %194 = OpVectorShuffle %193 %192 4 1 5 6 
					                                                      OpStore %55 %194 
					                                       f32_4 %199 = OpLoad %55 
					                                       f32_3 %200 = OpVectorShuffle %199 %199 0 2 3 
					                                         f32 %201 = OpDot %198 %200 
					                                Private f32* %202 = OpAccessChain %86 %22 
					                                                      OpStore %202 %201 
					                                Private f32* %203 = OpAccessChain %86 %22 
					                                         f32 %204 = OpLoad %203 
					                                Uniform f32* %206 = OpAccessChain %13 %205 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFMul %204 %207 
					                                Private f32* %209 = OpAccessChain %86 %22 
					                                                      OpStore %209 %208 
					                                Uniform f32* %214 = OpAccessChain %13 %213 %59 
					                                         f32 %215 = OpLoad %214 
					                                        bool %217 = OpFOrdLessThan %215 %216 
					                                                      OpStore %212 %217 
					                                        bool %218 = OpLoad %212 
					                                                      OpSelectionMerge %222 None 
					                                                      OpBranchConditional %218 %221 %225 
					                                             %221 = OpLabel 
					                                Private f32* %223 = OpAccessChain %118 %22 
					                                         f32 %224 = OpLoad %223 
					                                                      OpStore %220 %224 
					                                                      OpBranch %222 
					                                             %225 = OpLabel 
					                                Private f32* %226 = OpAccessChain %9 %22 
					                                         f32 %227 = OpLoad %226 
					                                                      OpStore %220 %227 
					                                                      OpBranch %222 
					                                             %222 = OpLabel 
					                                         f32 %228 = OpLoad %220 
					                                Private f32* %229 = OpAccessChain %9 %22 
					                                                      OpStore %229 %228 
					                                Uniform f32* %230 = OpAccessChain %13 %15 
					                                         f32 %231 = OpLoad %230 
					                                Uniform f32* %233 = OpAccessChain %13 %232 
					                                         f32 %234 = OpLoad %233 
					                                         f32 %235 = OpFMul %231 %234 
					                                Private f32* %236 = OpAccessChain %9 %59 
					                                         f32 %237 = OpLoad %236 
					                                         f32 %238 = OpFAdd %235 %237 
					                                Private f32* %239 = OpAccessChain %118 %22 
					                                                      OpStore %239 %238 
					                                Private f32* %240 = OpAccessChain %55 %59 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %243 = OpFMul %241 %242 
					                                Private f32* %244 = OpAccessChain %9 %22 
					                                         f32 %245 = OpLoad %244 
					                                         f32 %246 = OpFAdd %243 %245 
					                                Private f32* %247 = OpAccessChain %118 %59 
					                                                      OpStore %247 %246 
					                         read_only Texture2D %250 = OpLoad %249 
					                                     sampler %252 = OpLoad %251 
					                  read_only Texture2DSampled %253 = OpSampledImage %250 %252 
					                                       f32_2 %254 = OpLoad %118 
					                                       f32_4 %255 = OpImageSampleImplicitLod %253 %254 
					                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
					                                       f32_4 %257 = OpLoad %248 
					                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 2 6 
					                                                      OpStore %248 %258 
					                                       f32_4 %260 = OpLoad %248 
					                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 3 
					                                       f32_3 %264 = OpFMul %261 %263 
					                                       f32_4 %265 = OpLoad %259 
					                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 6 
					                                                      OpStore %259 %266 
					                                       f32_2 %269 = OpLoad %86 
					                                       f32_3 %270 = OpVectorShuffle %269 %269 0 0 0 
					                                       f32_4 %271 = OpLoad %259 
					                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 3 
					                                       f32_3 %273 = OpFDiv %270 %272 
					                                       f32_4 %274 = OpLoad %268 
					                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
					                                                      OpStore %268 %275 
					                                 Output f32* %278 = OpAccessChain %268 %276 
					                                                      OpStore %278 %121 
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
						float _TimeX;
						float _Speed;
						float _Value;
						float _Value2;
						float _Value3;
						vec4 unused_0_6;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat16_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.x = _TimeX * 15.0;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat4 = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = u_xlat0.x + 23.0;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat4);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat8.xy = u_xlat1.xy * vec2(-0.00800000038, 0.00400000019) + u_xlat0.yx;
					    u_xlat10_2 = texture(_MainTex, u_xlat8.xy);
					    u_xlat8.x = u_xlat0.y * 16.0;
					    u_xlat1.xz = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat8.x = u_xlat8.x * u_xlat1.z;
					    u_xlat8.x = u_xlat0.x * u_xlat8.x;
					    u_xlat8.x = u_xlat1.x * u_xlat8.x;
					    u_xlat8.x = log2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 0.400000006;
					    u_xlat8.x = exp2(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + _Value2;
					    u_xlat3.xyz = u_xlat10_2.xyz / u_xlat8.xxx;
					    u_xlat3.xyz = (-u_xlat10_2.xyz) * u_xlat8.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat10_2.xyz;
					    u_xlat2.xyz = vec3(_Value3) * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat8.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat2.xyz);
					    u_xlat8.x = u_xlat8.x * _Value;
					    u_xlatb12 = _MainTex_TexelSize.y<0.0;
					    u_xlat0.x = (u_xlatb12) ? u_xlat1.x : u_xlat0.x;
					    u_xlat2.x = _TimeX * _Speed + u_xlat0.y;
					    u_xlat2.y = u_xlat1.y * 0.00999999978 + u_xlat0.x;
					    u_xlat10_1 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat16_0.xyw = u_xlat10_1.xyz * vec3(4.0, 4.0, 4.0);
					    SV_Target0.xyz = u_xlat8.xxx / u_xlat16_0.xyw;
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