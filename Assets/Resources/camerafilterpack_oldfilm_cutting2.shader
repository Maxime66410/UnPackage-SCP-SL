Shader "CameraFilterPack/OldFilm_Cutting2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 27946
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
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
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
					    u_xlat16_0.xyw = u_xlat10_1.xyz * vec3(-2.0, -2.0, -2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyw = vec3(_Value3) * u_xlat16_0.xyw + u_xlat10_1.xyz;
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyw;
					    u_xlat0.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz + (-vec3(vec3(_Value, _Value, _Value)));
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
					; Bound: 276
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %74 %254 
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
					                                                      OpDecorate vs_TEXCOORD0 Location 74 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %102 DescriptorSet 102 
					                                                      OpDecorate %102 Binding 102 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %106 DescriptorSet 106 
					                                                      OpDecorate %106 Binding 106 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %112 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %238 DescriptorSet 238 
					                                                      OpDecorate %238 Binding 238 
					                                                      OpDecorate %239 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %240 DescriptorSet 240 
					                                                      OpDecorate %240 Binding 240 
					                                                      OpDecorate %241 RelaxedPrecision 
					                                                      OpDecorate %245 RelaxedPrecision 
					                                                      OpDecorate %246 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %254 Location 254 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypeVector %6 4 
					                                              %12 = OpTypeStruct %6 %6 %6 %6 %6 %10 %11 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 0 
					                                              %17 = OpTypePointer Uniform %6 
					                                          f32 %20 = OpConstant 3,674022E-40 
					                                              %22 = OpTypeInt 32 0 
					                                          u32 %23 = OpConstant 0 
					                                              %24 = OpTypePointer Private %6 
					                                 Private f32* %30 = OpVariable Private 
					                                          f32 %33 = OpConstant 3,674022E-40 
					                                          f32 %34 = OpConstant 3,674022E-40 
					                                        f32_2 %35 = OpConstantComposite %33 %34 
					                                          f32 %39 = OpConstant 3,674022E-40 
					                                          f32 %52 = OpConstant 3,674022E-40 
					                                              %55 = OpTypePointer Private %11 
					                               Private f32_4* %56 = OpVariable Private 
					                                          u32 %60 = OpConstant 1 
					                                              %73 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %76 = OpConstant 6 
					                                              %77 = OpTypePointer Uniform %11 
					                                              %88 = OpTypePointer Private %10 
					                               Private f32_2* %89 = OpVariable Private 
					                                          f32 %92 = OpConstant 3,674022E-40 
					                                          f32 %93 = OpConstant 3,674022E-40 
					                                        f32_2 %94 = OpConstantComposite %92 %93 
					                               Private f32_4* %99 = OpVariable Private 
					                                             %100 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %101 = OpTypePointer UniformConstant %100 
					        UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
					                                             %104 = OpTypeSampler 
					                                             %105 = OpTypePointer UniformConstant %104 
					                    UniformConstant sampler* %106 = OpVariable UniformConstant 
					                                             %108 = OpTypeSampledImage %100 
					                              Private f32_3* %115 = OpVariable Private 
					                                         f32 %118 = OpConstant 3,674022E-40 
					                                       f32_3 %119 = OpConstantComposite %118 %118 %118 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                                       f32_3 %122 = OpConstantComposite %121 %121 %121 
					                                         i32 %124 = OpConstant 4 
					                                       f32_2 %138 = OpConstantComposite %121 %121 
					                              Private f32_2* %140 = OpVariable Private 
					                                         f32 %161 = OpConstant 3,674022E-40 
					                                         f32 %170 = OpConstant 3,674022E-40 
					                                         i32 %179 = OpConstant 3 
					                                         f32 %191 = OpConstant 3,674022E-40 
					                                         f32 %192 = OpConstant 3,674022E-40 
					                                         f32 %193 = OpConstant 3,674022E-40 
					                                       f32_3 %194 = OpConstantComposite %191 %192 %193 
					                                             %199 = OpTypeBool 
					                                             %200 = OpTypePointer Private %199 
					                               Private bool* %201 = OpVariable Private 
					                                         i32 %202 = OpConstant 5 
					                                         f32 %205 = OpConstant 3,674022E-40 
					                                             %208 = OpTypePointer Function %10 
					                                         f32 %221 = OpConstant 3,674022E-40 
					                                         i32 %229 = OpConstant 1 
					                              Private f32_3* %237 = OpVariable Private 
					        UniformConstant read_only Texture2D* %238 = OpVariable UniformConstant 
					                    UniformConstant sampler* %240 = OpVariable UniformConstant 
					                                         f32 %247 = OpConstant 3,674022E-40 
					                                       f32_3 %248 = OpConstantComposite %247 %247 %247 
					                                             %253 = OpTypePointer Output %11 
					                               Output f32_4* %254 = OpVariable Output 
					                                         i32 %256 = OpConstant 2 
					                                         u32 %272 = OpConstant 3 
					                                             %273 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                             Function f32_2* %209 = OpVariable Function 
					                                 Uniform f32* %18 = OpAccessChain %14 %16 
					                                          f32 %19 = OpLoad %18 
					                                          f32 %21 = OpFMul %19 %20 
					                                 Private f32* %25 = OpAccessChain %9 %23 
					                                                      OpStore %25 %21 
					                                 Private f32* %26 = OpAccessChain %9 %23 
					                                          f32 %27 = OpLoad %26 
					                                          f32 %28 = OpExtInst %1 3 %27 
					                                 Private f32* %29 = OpAccessChain %9 %23 
					                                                      OpStore %29 %28 
					                                        f32_3 %31 = OpLoad %9 
					                                        f32_2 %32 = OpVectorShuffle %31 %31 0 0 
					                                          f32 %36 = OpDot %32 %35 
					                                                      OpStore %30 %36 
					                                 Private f32* %37 = OpAccessChain %9 %23 
					                                          f32 %38 = OpLoad %37 
					                                          f32 %40 = OpFAdd %38 %39 
					                                 Private f32* %41 = OpAccessChain %9 %23 
					                                                      OpStore %41 %40 
					                                        f32_3 %42 = OpLoad %9 
					                                        f32_2 %43 = OpVectorShuffle %42 %42 0 0 
					                                          f32 %44 = OpDot %43 %35 
					                                 Private f32* %45 = OpAccessChain %9 %23 
					                                                      OpStore %45 %44 
					                                 Private f32* %46 = OpAccessChain %9 %23 
					                                          f32 %47 = OpLoad %46 
					                                          f32 %48 = OpExtInst %1 13 %47 
					                                 Private f32* %49 = OpAccessChain %9 %23 
					                                                      OpStore %49 %48 
					                                 Private f32* %50 = OpAccessChain %9 %23 
					                                          f32 %51 = OpLoad %50 
					                                          f32 %53 = OpFMul %51 %52 
					                                 Private f32* %54 = OpAccessChain %9 %23 
					                                                      OpStore %54 %53 
					                                 Private f32* %57 = OpAccessChain %9 %23 
					                                          f32 %58 = OpLoad %57 
					                                          f32 %59 = OpExtInst %1 10 %58 
					                                 Private f32* %61 = OpAccessChain %56 %60 
					                                                      OpStore %61 %59 
					                                          f32 %62 = OpLoad %30 
					                                          f32 %63 = OpExtInst %1 13 %62 
					                                 Private f32* %64 = OpAccessChain %9 %23 
					                                                      OpStore %64 %63 
					                                 Private f32* %65 = OpAccessChain %9 %23 
					                                          f32 %66 = OpLoad %65 
					                                          f32 %67 = OpFMul %66 %52 
					                                 Private f32* %68 = OpAccessChain %9 %23 
					                                                      OpStore %68 %67 
					                                 Private f32* %69 = OpAccessChain %9 %23 
					                                          f32 %70 = OpLoad %69 
					                                          f32 %71 = OpExtInst %1 10 %70 
					                                 Private f32* %72 = OpAccessChain %56 %23 
					                                                      OpStore %72 %71 
					                                        f32_2 %75 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %78 = OpAccessChain %14 %76 
					                                        f32_4 %79 = OpLoad %78 
					                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
					                                        f32_2 %81 = OpFMul %75 %80 
					                               Uniform f32_4* %82 = OpAccessChain %14 %76 
					                                        f32_4 %83 = OpLoad %82 
					                                        f32_2 %84 = OpVectorShuffle %83 %83 2 3 
					                                        f32_2 %85 = OpFAdd %81 %84 
					                                        f32_3 %86 = OpLoad %9 
					                                        f32_3 %87 = OpVectorShuffle %86 %85 3 4 2 
					                                                      OpStore %9 %87 
					                                        f32_4 %90 = OpLoad %56 
					                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
					                                        f32_2 %95 = OpFMul %91 %94 
					                                        f32_3 %96 = OpLoad %9 
					                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
					                                        f32_2 %98 = OpFAdd %95 %97 
					                                                      OpStore %89 %98 
					                         read_only Texture2D %103 = OpLoad %102 
					                                     sampler %107 = OpLoad %106 
					                  read_only Texture2DSampled %109 = OpSampledImage %103 %107 
					                                       f32_2 %110 = OpLoad %89 
					                                       f32_4 %111 = OpImageSampleImplicitLod %109 %110 
					                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
					                                       f32_4 %113 = OpLoad %99 
					                                       f32_4 %114 = OpVectorShuffle %113 %112 4 1 5 6 
					                                                      OpStore %99 %114 
					                                       f32_4 %116 = OpLoad %99 
					                                       f32_3 %117 = OpVectorShuffle %116 %116 0 2 3 
					                                       f32_3 %120 = OpFMul %117 %119 
					                                       f32_3 %123 = OpFAdd %120 %122 
					                                                      OpStore %115 %123 
					                                Uniform f32* %125 = OpAccessChain %14 %124 
					                                         f32 %126 = OpLoad %125 
					                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
					                                       f32_3 %128 = OpLoad %115 
					                                       f32_3 %129 = OpFMul %127 %128 
					                                       f32_4 %130 = OpLoad %99 
					                                       f32_3 %131 = OpVectorShuffle %130 %130 0 2 3 
					                                       f32_3 %132 = OpFAdd %129 %131 
					                                       f32_4 %133 = OpLoad %56 
					                                       f32_4 %134 = OpVectorShuffle %133 %132 4 1 5 6 
					                                                      OpStore %56 %134 
					                                       f32_3 %135 = OpLoad %9 
					                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
					                                       f32_2 %137 = OpFNegate %136 
					                                       f32_2 %139 = OpFAdd %137 %138 
					                                                      OpStore %89 %139 
					                                Private f32* %141 = OpAccessChain %9 %23 
					                                         f32 %142 = OpLoad %141 
					                                Private f32* %143 = OpAccessChain %89 %23 
					                                         f32 %144 = OpLoad %143 
					                                         f32 %145 = OpFMul %142 %144 
					                                Private f32* %146 = OpAccessChain %140 %23 
					                                                      OpStore %146 %145 
					                                Private f32* %147 = OpAccessChain %9 %60 
					                                         f32 %148 = OpLoad %147 
					                                Private f32* %149 = OpAccessChain %140 %23 
					                                         f32 %150 = OpLoad %149 
					                                         f32 %151 = OpFMul %148 %150 
					                                Private f32* %152 = OpAccessChain %140 %23 
					                                                      OpStore %152 %151 
					                                Private f32* %153 = OpAccessChain %89 %60 
					                                         f32 %154 = OpLoad %153 
					                                Private f32* %155 = OpAccessChain %140 %23 
					                                         f32 %156 = OpLoad %155 
					                                         f32 %157 = OpFMul %154 %156 
					                                Private f32* %158 = OpAccessChain %140 %23 
					                                                      OpStore %158 %157 
					                                Private f32* %159 = OpAccessChain %140 %23 
					                                         f32 %160 = OpLoad %159 
					                                         f32 %162 = OpFMul %160 %161 
					                                Private f32* %163 = OpAccessChain %140 %23 
					                                                      OpStore %163 %162 
					                                Private f32* %164 = OpAccessChain %140 %23 
					                                         f32 %165 = OpLoad %164 
					                                         f32 %166 = OpExtInst %1 30 %165 
					                                Private f32* %167 = OpAccessChain %140 %23 
					                                                      OpStore %167 %166 
					                                Private f32* %168 = OpAccessChain %140 %23 
					                                         f32 %169 = OpLoad %168 
					                                         f32 %171 = OpFMul %169 %170 
					                                Private f32* %172 = OpAccessChain %140 %23 
					                                                      OpStore %172 %171 
					                                Private f32* %173 = OpAccessChain %140 %23 
					                                         f32 %174 = OpLoad %173 
					                                         f32 %175 = OpExtInst %1 29 %174 
					                                Private f32* %176 = OpAccessChain %140 %23 
					                                                      OpStore %176 %175 
					                                Private f32* %177 = OpAccessChain %140 %23 
					                                         f32 %178 = OpLoad %177 
					                                Uniform f32* %180 = OpAccessChain %14 %179 
					                                         f32 %181 = OpLoad %180 
					                                         f32 %182 = OpFAdd %178 %181 
					                                Private f32* %183 = OpAccessChain %140 %23 
					                                                      OpStore %183 %182 
					                                       f32_4 %184 = OpLoad %56 
					                                       f32_3 %185 = OpVectorShuffle %184 %184 0 2 3 
					                                       f32_2 %186 = OpLoad %140 
					                                       f32_3 %187 = OpVectorShuffle %186 %186 0 0 0 
					                                       f32_3 %188 = OpFMul %185 %187 
					                                       f32_4 %189 = OpLoad %56 
					                                       f32_4 %190 = OpVectorShuffle %189 %188 4 1 5 6 
					                                                      OpStore %56 %190 
					                                       f32_4 %195 = OpLoad %56 
					                                       f32_3 %196 = OpVectorShuffle %195 %195 0 2 3 
					                                         f32 %197 = OpDot %194 %196 
					                                Private f32* %198 = OpAccessChain %56 %23 
					                                                      OpStore %198 %197 
					                                Uniform f32* %203 = OpAccessChain %14 %202 %60 
					                                         f32 %204 = OpLoad %203 
					                                        bool %206 = OpFOrdLessThan %204 %205 
					                                                      OpStore %201 %206 
					                                        bool %207 = OpLoad %201 
					                                                      OpSelectionMerge %211 None 
					                                                      OpBranchConditional %207 %210 %213 
					                                             %210 = OpLabel 
					                                       f32_2 %212 = OpLoad %89 
					                                                      OpStore %209 %212 
					                                                      OpBranch %211 
					                                             %213 = OpLabel 
					                                       f32_3 %214 = OpLoad %9 
					                                       f32_2 %215 = OpVectorShuffle %214 %214 0 1 
					                                                      OpStore %209 %215 
					                                                      OpBranch %211 
					                                             %211 = OpLabel 
					                                       f32_2 %216 = OpLoad %209 
					                                       f32_3 %217 = OpLoad %9 
					                                       f32_3 %218 = OpVectorShuffle %217 %216 3 4 2 
					                                                      OpStore %9 %218 
					                                Private f32* %219 = OpAccessChain %56 %60 
					                                         f32 %220 = OpLoad %219 
					                                         f32 %222 = OpFMul %220 %221 
					                                Private f32* %223 = OpAccessChain %9 %60 
					                                         f32 %224 = OpLoad %223 
					                                         f32 %225 = OpFAdd %222 %224 
					                                Private f32* %226 = OpAccessChain %140 %60 
					                                                      OpStore %226 %225 
					                                Uniform f32* %227 = OpAccessChain %14 %16 
					                                         f32 %228 = OpLoad %227 
					                                Uniform f32* %230 = OpAccessChain %14 %229 
					                                         f32 %231 = OpLoad %230 
					                                         f32 %232 = OpFMul %228 %231 
					                                Private f32* %233 = OpAccessChain %9 %23 
					                                         f32 %234 = OpLoad %233 
					                                         f32 %235 = OpFAdd %232 %234 
					                                Private f32* %236 = OpAccessChain %140 %23 
					                                                      OpStore %236 %235 
					                         read_only Texture2D %239 = OpLoad %238 
					                                     sampler %241 = OpLoad %240 
					                  read_only Texture2DSampled %242 = OpSampledImage %239 %241 
					                                       f32_2 %243 = OpLoad %140 
					                                       f32_4 %244 = OpImageSampleImplicitLod %242 %243 
					                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
					                                                      OpStore %237 %245 
					                                       f32_3 %246 = OpLoad %237 
					                                       f32_3 %249 = OpFMul %246 %248 
					                                       f32_4 %250 = OpLoad %56 
					                                       f32_3 %251 = OpVectorShuffle %250 %250 0 0 0 
					                                       f32_3 %252 = OpFAdd %249 %251 
					                                                      OpStore %9 %252 
					                                       f32_3 %255 = OpLoad %9 
					                                Uniform f32* %257 = OpAccessChain %14 %256 
					                                         f32 %258 = OpLoad %257 
					                                Uniform f32* %259 = OpAccessChain %14 %256 
					                                         f32 %260 = OpLoad %259 
					                                Uniform f32* %261 = OpAccessChain %14 %256 
					                                         f32 %262 = OpLoad %261 
					                                       f32_3 %263 = OpCompositeConstruct %258 %260 %262 
					                                         f32 %264 = OpCompositeExtract %263 0 
					                                         f32 %265 = OpCompositeExtract %263 1 
					                                         f32 %266 = OpCompositeExtract %263 2 
					                                       f32_3 %267 = OpCompositeConstruct %264 %265 %266 
					                                       f32_3 %268 = OpFNegate %267 
					                                       f32_3 %269 = OpFAdd %255 %268 
					                                       f32_4 %270 = OpLoad %254 
					                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 6 3 
					                                                      OpStore %254 %271 
					                                 Output f32* %274 = OpAccessChain %254 %272 
					                                                      OpStore %274 %121 
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
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec2 u_xlat6;
					bool u_xlatb7;
					void main()
					{
					    u_xlat0.x = _TimeX * 15.0;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat3 = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = u_xlat0.x + 23.0;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat3);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat1.xy * vec2(-0.00800000038, 0.00400000019) + u_xlat0.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_1.xzw = u_xlat10_2.xyz * vec3(-2.0, -2.0, -2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xzw = vec3(_Value3) * u_xlat16_1.xzw + u_xlat10_2.xyz;
					    u_xlat6.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat2.x = u_xlat0.x * u_xlat6.x;
					    u_xlat2.x = u_xlat0.y * u_xlat2.x;
					    u_xlat2.x = u_xlat6.y * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * 16.0;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * 0.400000006;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x + _Value2;
					    u_xlat1.xzw = u_xlat1.xzw * u_xlat2.xxx;
					    u_xlat1.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xzw);
					    u_xlatb7 = _MainTex_TexelSize.y<0.0;
					    u_xlat0.xy = (bool(u_xlatb7)) ? u_xlat6.xy : u_xlat0.xy;
					    u_xlat2.y = u_xlat1.y * 0.00999999978 + u_xlat0.y;
					    u_xlat2.x = _TimeX * _Speed + u_xlat0.x;
					    u_xlat10_0 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat1.xxx;
					    SV_Target0.xyz = u_xlat0.xyz + (-vec3(vec3(_Value, _Value, _Value)));
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