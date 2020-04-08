Shader "CameraFilterPack/EyesVision_2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 41233
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					float u_xlat8;
					vec2 u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = _TimeX * _Value3;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat4.x = u_xlat0.x * 2.0 + 23.0;
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlat4.x = dot(u_xlat4.xx, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat4.x);
					    u_xlat4.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat4.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat1.xy * vec2(-0.0240000002, 0.0160000008) + u_xlat4.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + vec2(0.075000003, 0.0500000007);
					    u_xlat9.xy = u_xlat4.xy * vec2(vec2(_Value, _Value));
					    u_xlat9.xy = vec2(vec2(_Value2, _Value2)) * vec2(_TimeX) + u_xlat9.xy;
					    u_xlat12 = cos(u_xlat9.y);
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat9.x = u_xlat9.x * 0.5 + 1.0;
					    u_xlat12 = u_xlat12 * 0.5 + 1.0;
					    u_xlat13 = sin(u_xlat12);
					    u_xlat2.x = u_xlat13 + u_xlat9.x;
					    u_xlat9.x = cos(u_xlat9.x);
					    u_xlat2.y = u_xlat12 + u_xlat9.x;
					    u_xlat1.xy = u_xlat2.xy * vec2(0.0199999996, 0.0199999996) + u_xlat1.xy;
					    u_xlat10_2 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(1.20000005, 1.20000005) + vec2(0.600000024, 0.600000024);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat0.w = u_xlat12 + -0.400000006;
					    u_xlat4.xy = u_xlat10_2.xy * vec2(0.0625, 0.0625) + u_xlat4.xy;
					    u_xlat1.x = (-u_xlat4.y) + 0.5;
					    u_xlat10_3 = texture(_MainTex, u_xlat4.xy);
					    u_xlat4.x = dot(u_xlat1.xx, u_xlat1.xx);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat8 = _TimeX * 0.5;
					    u_xlat8 = sin(u_xlat8);
					    u_xlat8 = u_xlat8 * u_xlat8;
					    u_xlat0.x = (-u_xlat8) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + u_xlat4.x;
					    u_xlat0.xw = u_xlat0.xw * vec2(-1.66666663, 4.99999952);
					    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
					    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.xz = u_xlat0.xw * u_xlat0.xw;
					    u_xlat0.x = (-u_xlat4.x) * u_xlat0.x + 1.0;
					    u_xlat4.x = u_xlat0.w * -2.0 + 3.0;
					    u_xlat0.x = u_xlat4.x * u_xlat0.z + u_xlat0.x;
					    u_xlat4.x = u_xlat0.x * _Value4;
					    u_xlat4.xyz = u_xlat4.xxx * (-u_xlat10_3.xyz) + u_xlat10_3.xyz;
					    u_xlat0.xyz = (-u_xlat0.xxx) + u_xlat4.xyz;
					    SV_Target0.xyz = u_xlat0.xyz + u_xlat10_2.xyz;
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
					; Bound: 385
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %87 %375 
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
					                                                      OpDecorate vs_TEXCOORD0 Location 87 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %212 RelaxedPrecision 
					                                                      OpDecorate %212 DescriptorSet 212 
					                                                      OpDecorate %212 Binding 212 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %216 DescriptorSet 216 
					                                                      OpDecorate %216 Binding 216 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %241 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %245 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %257 DescriptorSet 257 
					                                                      OpDecorate %257 Binding 257 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %259 DescriptorSet 259 
					                                                      OpDecorate %259 Binding 259 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %362 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %365 RelaxedPrecision 
					                                                      OpDecorate %375 Location 375 
					                                                      OpDecorate %378 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %10 %7 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32; f32; f32_2; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 0 
					                                              %16 = OpTypePointer Uniform %6 
					                                          i32 %19 = OpConstant 3 
					                                              %23 = OpTypeInt 32 0 
					                                          u32 %24 = OpConstant 0 
					                                              %25 = OpTypePointer Private %6 
					                                              %31 = OpTypeVector %6 3 
					                                              %32 = OpTypePointer Private %31 
					                               Private f32_3* %33 = OpVariable Private 
					                                          f32 %36 = OpConstant 3,674022E-40 
					                                          f32 %38 = OpConstant 3,674022E-40 
					                                          f32 %49 = OpConstant 3,674022E-40 
					                                          f32 %50 = OpConstant 3,674022E-40 
					                                        f32_2 %51 = OpConstantComposite %49 %50 
					                                          f32 %60 = OpConstant 3,674022E-40 
					                                              %63 = OpTypePointer Private %10 
					                               Private f32_2* %64 = OpVariable Private 
					                                          u32 %68 = OpConstant 1 
					                                              %86 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %89 = OpConstant 6 
					                                              %90 = OpTypePointer Uniform %7 
					                                         f32 %102 = OpConstant 3,674022E-40 
					                                         f32 %103 = OpConstant 3,674022E-40 
					                                       f32_2 %104 = OpConstantComposite %102 %103 
					                                         f32 %110 = OpConstant 3,674022E-40 
					                                       f32_2 %111 = OpConstantComposite %110 %110 
					                                         f32 %113 = OpConstant 3,674022E-40 
					                                         f32 %114 = OpConstant 3,674022E-40 
					                                       f32_2 %115 = OpConstantComposite %113 %114 
					                                             %117 = OpTypeBool 
					                                             %118 = OpTypePointer Private %117 
					                               Private bool* %119 = OpVariable Private 
					                                         i32 %120 = OpConstant 5 
					                                         f32 %123 = OpConstant 3,674022E-40 
					                              Private f32_2* %125 = OpVariable Private 
					                                         f32 %129 = OpConstant 3,674022E-40 
					                                       f32_2 %130 = OpConstantComposite %129 %129 
					                                             %133 = OpTypePointer Function %10 
					                                         i32 %143 = OpConstant 1 
					                                         i32 %153 = OpConstant 2 
					                                Private f32* %168 = OpVariable Private 
					                                         f32 %178 = OpConstant 3,674022E-40 
					                                Private f32* %185 = OpVariable Private 
					                              Private f32_2* %188 = OpVariable Private 
					                                         f32 %204 = OpConstant 3,674022E-40 
					                                       f32_2 %205 = OpConstantComposite %204 %204 
					                              Private f32_3* %209 = OpVariable Private 
					                                             %210 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %211 = OpTypePointer UniformConstant %210 
					        UniformConstant read_only Texture2D* %212 = OpVariable UniformConstant 
					                                             %214 = OpTypeSampler 
					                                             %215 = OpTypePointer UniformConstant %214 
					                    UniformConstant sampler* %216 = OpVariable UniformConstant 
					                                             %218 = OpTypeSampledImage %210 
					                                         f32 %225 = OpConstant 3,674022E-40 
					                                       f32_2 %226 = OpConstantComposite %225 %225 
					                                         f32 %228 = OpConstant 3,674022E-40 
					                                       f32_2 %229 = OpConstantComposite %228 %228 
					                                         f32 %237 = OpConstant 3,674022E-40 
					                                         u32 %239 = OpConstant 3 
					                                         f32 %243 = OpConstant 3,674022E-40 
					                                       f32_2 %244 = OpConstantComposite %243 %243 
					                              Private f32_3* %256 = OpVariable Private 
					        UniformConstant read_only Texture2D* %257 = OpVariable UniformConstant 
					                    UniformConstant sampler* %259 = OpVariable UniformConstant 
					                                Private f32* %276 = OpVariable Private 
					                                         f32 %303 = OpConstant 3,674022E-40 
					                                         f32 %304 = OpConstant 3,674022E-40 
					                                       f32_2 %305 = OpConstantComposite %303 %304 
					                                         f32 %318 = OpConstant 3,674022E-40 
					                                         f32 %320 = OpConstant 3,674022E-40 
					                                         u32 %345 = OpConstant 2 
					                                         i32 %355 = OpConstant 4 
					                                             %374 = OpTypePointer Output %7 
					                               Output f32_4* %375 = OpVariable Output 
					                                             %382 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                             Function f32_2* %134 = OpVariable Function 
					                                 Uniform f32* %17 = OpAccessChain %13 %15 
					                                          f32 %18 = OpLoad %17 
					                                 Uniform f32* %20 = OpAccessChain %13 %19 
					                                          f32 %21 = OpLoad %20 
					                                          f32 %22 = OpFMul %18 %21 
					                                 Private f32* %26 = OpAccessChain %9 %24 
					                                                      OpStore %26 %22 
					                                 Private f32* %27 = OpAccessChain %9 %24 
					                                          f32 %28 = OpLoad %27 
					                                          f32 %29 = OpExtInst %1 3 %28 
					                                 Private f32* %30 = OpAccessChain %9 %24 
					                                                      OpStore %30 %29 
					                                 Private f32* %34 = OpAccessChain %9 %24 
					                                          f32 %35 = OpLoad %34 
					                                          f32 %37 = OpFMul %35 %36 
					                                          f32 %39 = OpFAdd %37 %38 
					                                 Private f32* %40 = OpAccessChain %33 %24 
					                                                      OpStore %40 %39 
					                                 Private f32* %41 = OpAccessChain %9 %24 
					                                          f32 %42 = OpLoad %41 
					                                 Private f32* %43 = OpAccessChain %9 %24 
					                                          f32 %44 = OpLoad %43 
					                                          f32 %45 = OpFAdd %42 %44 
					                                 Private f32* %46 = OpAccessChain %9 %24 
					                                                      OpStore %46 %45 
					                                        f32_3 %47 = OpLoad %33 
					                                        f32_2 %48 = OpVectorShuffle %47 %47 0 0 
					                                          f32 %52 = OpDot %48 %51 
					                                 Private f32* %53 = OpAccessChain %33 %24 
					                                                      OpStore %53 %52 
					                                 Private f32* %54 = OpAccessChain %33 %24 
					                                          f32 %55 = OpLoad %54 
					                                          f32 %56 = OpExtInst %1 13 %55 
					                                 Private f32* %57 = OpAccessChain %33 %24 
					                                                      OpStore %57 %56 
					                                 Private f32* %58 = OpAccessChain %33 %24 
					                                          f32 %59 = OpLoad %58 
					                                          f32 %61 = OpFMul %59 %60 
					                                 Private f32* %62 = OpAccessChain %33 %24 
					                                                      OpStore %62 %61 
					                                 Private f32* %65 = OpAccessChain %33 %24 
					                                          f32 %66 = OpLoad %65 
					                                          f32 %67 = OpExtInst %1 10 %66 
					                                 Private f32* %69 = OpAccessChain %64 %68 
					                                                      OpStore %69 %67 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_2 %71 = OpVectorShuffle %70 %70 0 0 
					                                          f32 %72 = OpDot %71 %51 
					                                 Private f32* %73 = OpAccessChain %33 %24 
					                                                      OpStore %73 %72 
					                                 Private f32* %74 = OpAccessChain %33 %24 
					                                          f32 %75 = OpLoad %74 
					                                          f32 %76 = OpExtInst %1 13 %75 
					                                 Private f32* %77 = OpAccessChain %33 %24 
					                                                      OpStore %77 %76 
					                                 Private f32* %78 = OpAccessChain %33 %24 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFMul %79 %60 
					                                 Private f32* %81 = OpAccessChain %33 %24 
					                                                      OpStore %81 %80 
					                                 Private f32* %82 = OpAccessChain %33 %24 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %84 = OpExtInst %1 10 %83 
					                                 Private f32* %85 = OpAccessChain %64 %24 
					                                                      OpStore %85 %84 
					                                        f32_2 %88 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %91 = OpAccessChain %13 %89 
					                                        f32_4 %92 = OpLoad %91 
					                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                                        f32_2 %94 = OpFMul %88 %93 
					                               Uniform f32_4* %95 = OpAccessChain %13 %89 
					                                        f32_4 %96 = OpLoad %95 
					                                        f32_2 %97 = OpVectorShuffle %96 %96 2 3 
					                                        f32_2 %98 = OpFAdd %94 %97 
					                                        f32_3 %99 = OpLoad %33 
					                                       f32_3 %100 = OpVectorShuffle %99 %98 3 4 2 
					                                                      OpStore %33 %100 
					                                       f32_2 %101 = OpLoad %64 
					                                       f32_2 %105 = OpFMul %101 %104 
					                                       f32_3 %106 = OpLoad %33 
					                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
					                                       f32_2 %108 = OpFAdd %105 %107 
					                                                      OpStore %64 %108 
					                                       f32_2 %109 = OpLoad %64 
					                                       f32_2 %112 = OpFMul %109 %111 
					                                       f32_2 %116 = OpFAdd %112 %115 
					                                                      OpStore %64 %116 
					                                Uniform f32* %121 = OpAccessChain %13 %120 %68 
					                                         f32 %122 = OpLoad %121 
					                                        bool %124 = OpFOrdLessThan %122 %123 
					                                                      OpStore %119 %124 
					                                       f32_3 %126 = OpLoad %33 
					                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
					                                       f32_2 %128 = OpFNegate %127 
					                                       f32_2 %131 = OpFAdd %128 %130 
					                                                      OpStore %125 %131 
					                                        bool %132 = OpLoad %119 
					                                                      OpSelectionMerge %136 None 
					                                                      OpBranchConditional %132 %135 %138 
					                                             %135 = OpLabel 
					                                       f32_2 %137 = OpLoad %125 
					                                                      OpStore %134 %137 
					                                                      OpBranch %136 
					                                             %138 = OpLabel 
					                                       f32_3 %139 = OpLoad %33 
					                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
					                                                      OpStore %134 %140 
					                                                      OpBranch %136 
					                                             %136 = OpLabel 
					                                       f32_2 %141 = OpLoad %134 
					                                                      OpStore %125 %141 
					                                       f32_2 %142 = OpLoad %125 
					                                Uniform f32* %144 = OpAccessChain %13 %143 
					                                         f32 %145 = OpLoad %144 
					                                Uniform f32* %146 = OpAccessChain %13 %143 
					                                         f32 %147 = OpLoad %146 
					                                       f32_2 %148 = OpCompositeConstruct %145 %147 
					                                         f32 %149 = OpCompositeExtract %148 0 
					                                         f32 %150 = OpCompositeExtract %148 1 
					                                       f32_2 %151 = OpCompositeConstruct %149 %150 
					                                       f32_2 %152 = OpFMul %142 %151 
					                                                      OpStore %125 %152 
					                                Uniform f32* %154 = OpAccessChain %13 %153 
					                                         f32 %155 = OpLoad %154 
					                                Uniform f32* %156 = OpAccessChain %13 %153 
					                                         f32 %157 = OpLoad %156 
					                                       f32_2 %158 = OpCompositeConstruct %155 %157 
					                                         f32 %159 = OpCompositeExtract %158 0 
					                                         f32 %160 = OpCompositeExtract %158 1 
					                                       f32_2 %161 = OpCompositeConstruct %159 %160 
					                                Uniform f32* %162 = OpAccessChain %13 %15 
					                                         f32 %163 = OpLoad %162 
					                                       f32_2 %164 = OpCompositeConstruct %163 %163 
					                                       f32_2 %165 = OpFMul %161 %164 
					                                       f32_2 %166 = OpLoad %125 
					                                       f32_2 %167 = OpFAdd %165 %166 
					                                                      OpStore %125 %167 
					                                Private f32* %169 = OpAccessChain %125 %68 
					                                         f32 %170 = OpLoad %169 
					                                         f32 %171 = OpExtInst %1 14 %170 
					                                                      OpStore %168 %171 
					                                Private f32* %172 = OpAccessChain %125 %24 
					                                         f32 %173 = OpLoad %172 
					                                         f32 %174 = OpExtInst %1 13 %173 
					                                Private f32* %175 = OpAccessChain %125 %24 
					                                                      OpStore %175 %174 
					                                Private f32* %176 = OpAccessChain %125 %24 
					                                         f32 %177 = OpLoad %176 
					                                         f32 %179 = OpFMul %177 %178 
					                                         f32 %180 = OpFAdd %179 %129 
					                                Private f32* %181 = OpAccessChain %125 %24 
					                                                      OpStore %181 %180 
					                                         f32 %182 = OpLoad %168 
					                                         f32 %183 = OpFMul %182 %178 
					                                         f32 %184 = OpFAdd %183 %129 
					                                                      OpStore %168 %184 
					                                         f32 %186 = OpLoad %168 
					                                         f32 %187 = OpExtInst %1 13 %186 
					                                                      OpStore %185 %187 
					                                         f32 %189 = OpLoad %185 
					                                Private f32* %190 = OpAccessChain %125 %24 
					                                         f32 %191 = OpLoad %190 
					                                         f32 %192 = OpFAdd %189 %191 
					                                Private f32* %193 = OpAccessChain %188 %24 
					                                                      OpStore %193 %192 
					                                Private f32* %194 = OpAccessChain %125 %24 
					                                         f32 %195 = OpLoad %194 
					                                         f32 %196 = OpExtInst %1 14 %195 
					                                Private f32* %197 = OpAccessChain %125 %24 
					                                                      OpStore %197 %196 
					                                         f32 %198 = OpLoad %168 
					                                Private f32* %199 = OpAccessChain %125 %24 
					                                         f32 %200 = OpLoad %199 
					                                         f32 %201 = OpFAdd %198 %200 
					                                Private f32* %202 = OpAccessChain %188 %68 
					                                                      OpStore %202 %201 
					                                       f32_2 %203 = OpLoad %188 
					                                       f32_2 %206 = OpFMul %203 %205 
					                                       f32_2 %207 = OpLoad %64 
					                                       f32_2 %208 = OpFAdd %206 %207 
					                                                      OpStore %64 %208 
					                         read_only Texture2D %213 = OpLoad %212 
					                                     sampler %217 = OpLoad %216 
					                  read_only Texture2DSampled %219 = OpSampledImage %213 %217 
					                                       f32_2 %220 = OpLoad %64 
					                                       f32_4 %221 = OpImageSampleImplicitLod %219 %220 
					                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
					                                                      OpStore %209 %222 
					                                       f32_2 %223 = OpLoad %64 
					                                       f32_2 %224 = OpFNegate %223 
					                                       f32_2 %227 = OpFMul %224 %226 
					                                       f32_2 %230 = OpFAdd %227 %229 
					                                                      OpStore %64 %230 
					                                       f32_2 %231 = OpLoad %64 
					                                       f32_2 %232 = OpLoad %64 
					                                         f32 %233 = OpDot %231 %232 
					                                                      OpStore %168 %233 
					                                         f32 %234 = OpLoad %168 
					                                         f32 %235 = OpExtInst %1 31 %234 
					                                                      OpStore %168 %235 
					                                         f32 %236 = OpLoad %168 
					                                         f32 %238 = OpFAdd %236 %237 
					                                Private f32* %240 = OpAccessChain %9 %239 
					                                                      OpStore %240 %238 
					                                       f32_3 %241 = OpLoad %209 
					                                       f32_2 %242 = OpVectorShuffle %241 %241 0 1 
					                                       f32_2 %245 = OpFMul %242 %244 
					                                       f32_3 %246 = OpLoad %33 
					                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
					                                       f32_2 %248 = OpFAdd %245 %247 
					                                       f32_3 %249 = OpLoad %33 
					                                       f32_3 %250 = OpVectorShuffle %249 %248 3 4 2 
					                                                      OpStore %33 %250 
					                                Private f32* %251 = OpAccessChain %33 %68 
					                                         f32 %252 = OpLoad %251 
					                                         f32 %253 = OpFNegate %252 
					                                         f32 %254 = OpFAdd %253 %178 
					                                Private f32* %255 = OpAccessChain %64 %24 
					                                                      OpStore %255 %254 
					                         read_only Texture2D %258 = OpLoad %257 
					                                     sampler %260 = OpLoad %259 
					                  read_only Texture2DSampled %261 = OpSampledImage %258 %260 
					                                       f32_3 %262 = OpLoad %33 
					                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
					                                       f32_4 %264 = OpImageSampleImplicitLod %261 %263 
					                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
					                                                      OpStore %256 %265 
					                                       f32_2 %266 = OpLoad %64 
					                                       f32_2 %267 = OpVectorShuffle %266 %266 0 0 
					                                       f32_2 %268 = OpLoad %64 
					                                       f32_2 %269 = OpVectorShuffle %268 %268 0 0 
					                                         f32 %270 = OpDot %267 %269 
					                                Private f32* %271 = OpAccessChain %33 %24 
					                                                      OpStore %271 %270 
					                                Private f32* %272 = OpAccessChain %33 %24 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpExtInst %1 31 %273 
					                                Private f32* %275 = OpAccessChain %33 %24 
					                                                      OpStore %275 %274 
					                                Uniform f32* %277 = OpAccessChain %13 %15 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpFMul %278 %178 
					                                                      OpStore %276 %279 
					                                         f32 %280 = OpLoad %276 
					                                         f32 %281 = OpExtInst %1 13 %280 
					                                                      OpStore %276 %281 
					                                         f32 %282 = OpLoad %276 
					                                         f32 %283 = OpLoad %276 
					                                         f32 %284 = OpFMul %282 %283 
					                                                      OpStore %276 %284 
					                                         f32 %285 = OpLoad %276 
					                                         f32 %286 = OpFNegate %285 
					                                Private f32* %287 = OpAccessChain %9 %24 
					                                         f32 %288 = OpLoad %287 
					                                         f32 %289 = OpFMul %286 %288 
					                                Private f32* %290 = OpAccessChain %9 %24 
					                                         f32 %291 = OpLoad %290 
					                                         f32 %292 = OpFAdd %289 %291 
					                                Private f32* %293 = OpAccessChain %9 %24 
					                                                      OpStore %293 %292 
					                                Private f32* %294 = OpAccessChain %9 %24 
					                                         f32 %295 = OpLoad %294 
					                                         f32 %296 = OpFNegate %295 
					                                Private f32* %297 = OpAccessChain %33 %24 
					                                         f32 %298 = OpLoad %297 
					                                         f32 %299 = OpFAdd %296 %298 
					                                Private f32* %300 = OpAccessChain %9 %24 
					                                                      OpStore %300 %299 
					                                       f32_4 %301 = OpLoad %9 
					                                       f32_2 %302 = OpVectorShuffle %301 %301 0 3 
					                                       f32_2 %306 = OpFMul %302 %305 
					                                       f32_4 %307 = OpLoad %9 
					                                       f32_4 %308 = OpVectorShuffle %307 %306 4 1 2 5 
					                                                      OpStore %9 %308 
					                                       f32_4 %309 = OpLoad %9 
					                                       f32_2 %310 = OpVectorShuffle %309 %309 0 3 
					                                       f32_2 %311 = OpCompositeConstruct %123 %123 
					                                       f32_2 %312 = OpCompositeConstruct %129 %129 
					                                       f32_2 %313 = OpExtInst %1 43 %310 %311 %312 
					                                       f32_4 %314 = OpLoad %9 
					                                       f32_4 %315 = OpVectorShuffle %314 %313 4 1 2 5 
					                                                      OpStore %9 %315 
					                                Private f32* %316 = OpAccessChain %9 %24 
					                                         f32 %317 = OpLoad %316 
					                                         f32 %319 = OpFMul %317 %318 
					                                         f32 %321 = OpFAdd %319 %320 
					                                Private f32* %322 = OpAccessChain %33 %24 
					                                                      OpStore %322 %321 
					                                       f32_4 %323 = OpLoad %9 
					                                       f32_2 %324 = OpVectorShuffle %323 %323 0 3 
					                                       f32_4 %325 = OpLoad %9 
					                                       f32_2 %326 = OpVectorShuffle %325 %325 0 3 
					                                       f32_2 %327 = OpFMul %324 %326 
					                                       f32_4 %328 = OpLoad %9 
					                                       f32_4 %329 = OpVectorShuffle %328 %327 4 1 5 3 
					                                                      OpStore %9 %329 
					                                Private f32* %330 = OpAccessChain %33 %24 
					                                         f32 %331 = OpLoad %330 
					                                         f32 %332 = OpFNegate %331 
					                                Private f32* %333 = OpAccessChain %9 %24 
					                                         f32 %334 = OpLoad %333 
					                                         f32 %335 = OpFMul %332 %334 
					                                         f32 %336 = OpFAdd %335 %129 
					                                Private f32* %337 = OpAccessChain %9 %24 
					                                                      OpStore %337 %336 
					                                Private f32* %338 = OpAccessChain %9 %239 
					                                         f32 %339 = OpLoad %338 
					                                         f32 %340 = OpFMul %339 %318 
					                                         f32 %341 = OpFAdd %340 %320 
					                                Private f32* %342 = OpAccessChain %33 %24 
					                                                      OpStore %342 %341 
					                                Private f32* %343 = OpAccessChain %33 %24 
					                                         f32 %344 = OpLoad %343 
					                                Private f32* %346 = OpAccessChain %9 %345 
					                                         f32 %347 = OpLoad %346 
					                                         f32 %348 = OpFMul %344 %347 
					                                Private f32* %349 = OpAccessChain %9 %24 
					                                         f32 %350 = OpLoad %349 
					                                         f32 %351 = OpFAdd %348 %350 
					                                Private f32* %352 = OpAccessChain %9 %24 
					                                                      OpStore %352 %351 
					                                Private f32* %353 = OpAccessChain %9 %24 
					                                         f32 %354 = OpLoad %353 
					                                Uniform f32* %356 = OpAccessChain %13 %355 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %358 = OpFMul %354 %357 
					                                Private f32* %359 = OpAccessChain %33 %24 
					                                                      OpStore %359 %358 
					                                       f32_3 %360 = OpLoad %33 
					                                       f32_3 %361 = OpVectorShuffle %360 %360 0 0 0 
					                                       f32_3 %362 = OpLoad %256 
					                                       f32_3 %363 = OpFNegate %362 
					                                       f32_3 %364 = OpFMul %361 %363 
					                                       f32_3 %365 = OpLoad %256 
					                                       f32_3 %366 = OpFAdd %364 %365 
					                                                      OpStore %33 %366 
					                                       f32_4 %367 = OpLoad %9 
					                                       f32_3 %368 = OpVectorShuffle %367 %367 0 0 0 
					                                       f32_3 %369 = OpFNegate %368 
					                                       f32_3 %370 = OpLoad %33 
					                                       f32_3 %371 = OpFAdd %369 %370 
					                                       f32_4 %372 = OpLoad %9 
					                                       f32_4 %373 = OpVectorShuffle %372 %371 4 5 6 3 
					                                                      OpStore %9 %373 
					                                       f32_4 %376 = OpLoad %9 
					                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
					                                       f32_3 %378 = OpLoad %209 
					                                       f32_3 %379 = OpFAdd %377 %378 
					                                       f32_4 %380 = OpLoad %375 
					                                       f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
					                                                      OpStore %375 %381 
					                                 Output f32* %383 = OpAccessChain %375 %239 
					                                                      OpStore %383 %129 
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
						float _Value;
						float _Value2;
						float _Value3;
						float _Value4;
						vec4 unused_0_6;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					float u_xlat8;
					vec2 u_xlat9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = _TimeX * _Value3;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat4.x = u_xlat0.x * 2.0 + 23.0;
					    u_xlat0.x = u_xlat0.x + u_xlat0.x;
					    u_xlat4.x = dot(u_xlat4.xx, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat4.x);
					    u_xlat4.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat4.x);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat1.xy * vec2(-0.0240000002, 0.0160000008) + u_xlat4.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + vec2(0.075000003, 0.0500000007);
					    u_xlatb12 = _MainTex_TexelSize.y<0.0;
					    u_xlat9.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
					    u_xlat9.xy = (bool(u_xlatb12)) ? u_xlat9.xy : u_xlat4.xy;
					    u_xlat9.xy = u_xlat9.xy * vec2(vec2(_Value, _Value));
					    u_xlat9.xy = vec2(vec2(_Value2, _Value2)) * vec2(_TimeX) + u_xlat9.xy;
					    u_xlat12 = cos(u_xlat9.y);
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat9.x = u_xlat9.x * 0.5 + 1.0;
					    u_xlat12 = u_xlat12 * 0.5 + 1.0;
					    u_xlat13 = sin(u_xlat12);
					    u_xlat2.x = u_xlat13 + u_xlat9.x;
					    u_xlat9.x = cos(u_xlat9.x);
					    u_xlat2.y = u_xlat12 + u_xlat9.x;
					    u_xlat1.xy = u_xlat2.xy * vec2(0.0199999996, 0.0199999996) + u_xlat1.xy;
					    u_xlat10_2 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(1.20000005, 1.20000005) + vec2(0.600000024, 0.600000024);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat0.w = u_xlat12 + -0.400000006;
					    u_xlat4.xy = u_xlat10_2.xy * vec2(0.0625, 0.0625) + u_xlat4.xy;
					    u_xlat1.x = (-u_xlat4.y) + 0.5;
					    u_xlat10_3 = texture(_MainTex, u_xlat4.xy);
					    u_xlat4.x = dot(u_xlat1.xx, u_xlat1.xx);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat8 = _TimeX * 0.5;
					    u_xlat8 = sin(u_xlat8);
					    u_xlat8 = u_xlat8 * u_xlat8;
					    u_xlat0.x = (-u_xlat8) * u_xlat0.x + u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + u_xlat4.x;
					    u_xlat0.xw = u_xlat0.xw * vec2(-1.66666663, 4.99999952);
					    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
					    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.xz = u_xlat0.xw * u_xlat0.xw;
					    u_xlat0.x = (-u_xlat4.x) * u_xlat0.x + 1.0;
					    u_xlat4.x = u_xlat0.w * -2.0 + 3.0;
					    u_xlat0.x = u_xlat4.x * u_xlat0.z + u_xlat0.x;
					    u_xlat4.x = u_xlat0.x * _Value4;
					    u_xlat4.xyz = u_xlat4.xxx * (-u_xlat10_3.xyz) + u_xlat10_3.xyz;
					    u_xlat0.xyz = (-u_xlat0.xxx) + u_xlat4.xyz;
					    SV_Target0.xyz = u_xlat0.xyz + u_xlat10_2.xyz;
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