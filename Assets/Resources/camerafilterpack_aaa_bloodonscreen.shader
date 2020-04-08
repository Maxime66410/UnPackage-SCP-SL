Shader "CameraFilterPack/AAA_BloodOnScreen" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 43765
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
					uniform 	vec4 _Time;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	vec4 _Color2;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec2 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec3 u_xlat5;
					vec2 u_xlat8;
					vec2 u_xlat16_8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.x = u_xlat0.y * 0.200000003 + 0.519999981;
					    u_xlat8.x = (-u_xlat0.y) * 0.5 + u_xlat8.x;
					    u_xlat1.xyz = u_xlat0.yxy * vec3(0.5, 16.0, 0.119999997);
					    u_xlat8.x = _Value * u_xlat8.x + u_xlat1.x;
					    u_xlat12 = sin(u_xlat1.y);
					    u_xlat12 = u_xlat12 * _Value;
					    u_xlat1.y = u_xlat12 * 0.03125 + u_xlat8.x;
					    u_xlat8.x = _Time.x * _Value5;
					    u_xlat8.xy = u_xlat8.xx * vec2(8.0, 9.60000038);
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat1.x = (-u_xlat8.x) * 0.125 + u_xlat0.x;
					    u_xlat2.xy = u_xlat8.xy * vec2(0.125, 0.25) + u_xlat0.xx;
					    u_xlat10_3 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat8.x = _Value * 16.0;
					    u_xlat12 = u_xlat10_3.x / u_xlat8.x;
					    u_xlat1.xy = u_xlat0.yy * vec2(0.100000001, 0.0199999996) + vec2(0.519999981, 0.620000005);
					    u_xlat1.x = (-u_xlat0.y) * 0.119999997 + u_xlat1.x;
					    u_xlat5.x = (-u_xlat0.y) * 0.0799999982 + u_xlat1.y;
					    u_xlat1.x = _Value * u_xlat1.x + u_xlat1.z;
					    u_xlat9.xy = u_xlat0.xy * vec2(4.0, 0.0799999982);
					    u_xlat9.x = sin(u_xlat9.x);
					    u_xlat5.x = _Value * u_xlat5.x + u_xlat9.y;
					    u_xlat9.x = u_xlat9.x * _Value;
					    u_xlat2.z = u_xlat9.x * 0.0078125 + u_xlat1.x;
					    u_xlat2.w = u_xlat9.x * 0.0078125 + u_xlat5.x;
					    u_xlat1.xy = vec2(u_xlat12) + u_xlat2.xz;
					    u_xlat10_1 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat16_1.xy = u_xlat10_1.xy + u_xlat10_3.xy;
					    u_xlat8.x = u_xlat16_1.x / u_xlat8.x;
					    u_xlat8.xy = u_xlat8.xx + u_xlat2.yw;
					    u_xlat10_2 = texture(_MainTex2, u_xlat8.xy);
					    u_xlat16_8.xy = u_xlat16_1.xy + u_xlat10_2.xy;
					    u_xlat16_1.x = u_xlat16_8.x * 0.0500000007;
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					    u_xlat0.xy = u_xlat16_1.xx * vec2(vec2(_Value4, _Value4)) + u_xlat0.xy;
					    u_xlat1.x = u_xlat16_1.x * _Value4;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat16_8.x * _Value4;
					    u_xlat5.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * _Color2.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_2.xyz;
					    u_xlat5.x = _Value * _Value3;
					    u_xlat12 = (-u_xlat16_8.y) * u_xlat5.x + u_xlat1.x;
					    u_xlat12 = u_xlat12 * _Value4;
					    u_xlat1.x = _Value3 * u_xlat12 + (-u_xlat12);
					    u_xlat1.xyz = _Color2.xyz * u_xlat1.xxx + vec3(u_xlat12);
					    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
					; Bound: 415
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %28 %406 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpMemberDecorate %12 4 Offset 12 
					                                                      OpMemberDecorate %12 5 Offset 12 
					                                                      OpMemberDecorate %12 6 Offset 12 
					                                                      OpMemberDecorate %12 7 Offset 12 
					                                                      OpMemberDecorate %12 8 RelaxedPrecision 
					                                                      OpMemberDecorate %12 8 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 28 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %176 DescriptorSet 176 
					                                                      OpDecorate %176 Binding 176 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %180 DescriptorSet 180 
					                                                      OpDecorate %180 Binding 180 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %210 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %219 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %224 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %282 RelaxedPrecision 
					                                                      OpDecorate %283 RelaxedPrecision 
					                                                      OpDecorate %288 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %291 RelaxedPrecision 
					                                                      OpDecorate %292 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %309 RelaxedPrecision 
					                                                      OpDecorate %310 RelaxedPrecision 
					                                                      OpDecorate %311 RelaxedPrecision 
					                                                      OpDecorate %312 RelaxedPrecision 
					                                                      OpDecorate %313 RelaxedPrecision 
					                                                      OpDecorate %320 RelaxedPrecision 
					                                                      OpDecorate %325 RelaxedPrecision 
					                                                      OpDecorate %326 RelaxedPrecision 
					                                                      OpDecorate %326 DescriptorSet 326 
					                                                      OpDecorate %326 Binding 326 
					                                                      OpDecorate %327 RelaxedPrecision 
					                                                      OpDecorate %328 RelaxedPrecision 
					                                                      OpDecorate %328 DescriptorSet 328 
					                                                      OpDecorate %328 Binding 328 
					                                                      OpDecorate %329 RelaxedPrecision 
					                                                      OpDecorate %334 RelaxedPrecision 
					                                                      OpDecorate %336 RelaxedPrecision 
					                                                      OpDecorate %362 RelaxedPrecision 
					                                                      OpDecorate %372 RelaxedPrecision 
					                                                      OpDecorate %373 RelaxedPrecision 
					                                                      OpDecorate %406 Location 406 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 4 
					                                              %11 = OpTypeVector %9 2 
					                                              %12 = OpTypeStruct %10 %9 %9 %9 %9 %9 %10 %11 %10 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32_4; f32; f32; f32; f32; f32; f32_4; f32_2; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 7 
					                                              %17 = OpTypeInt 32 0 
					                                          u32 %18 = OpConstant 1 
					                                              %19 = OpTypePointer Uniform %9 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                              %24 = OpTypeVector %9 3 
					                                              %25 = OpTypePointer Private %24 
					                               Private f32_3* %26 = OpVariable Private 
					                                              %27 = OpTypePointer Input %11 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %30 = OpConstant 8 
					                                              %31 = OpTypePointer Uniform %10 
					                                              %42 = OpTypePointer Private %9 
					                                 Private f32* %43 = OpVariable Private 
					                                          f32 %47 = OpConstant 3,674022E-40 
					                                              %50 = OpTypePointer Function %9 
					                                              %59 = OpTypePointer Private %11 
					                               Private f32_2* %60 = OpVariable Private 
					                                          f32 %63 = OpConstant 3,674022E-40 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                        f32_2 %65 = OpConstantComposite %63 %64 
					                                          f32 %67 = OpConstant 3,674022E-40 
					                                        f32_2 %68 = OpConstantComposite %67 %67 
					                                          f32 %73 = OpConstant 3,674022E-40 
					                                          f32 %74 = OpConstant 3,674022E-40 
					                                        f32_2 %75 = OpConstantComposite %73 %74 
					                               Private f32_3* %79 = OpVariable Private 
					                                          i32 %85 = OpConstant 1 
					                                         f32 %101 = OpConstant 3,674022E-40 
					                                         f32 %102 = OpConstant 3,674022E-40 
					                                       f32_2 %103 = OpConstantComposite %101 %102 
					                              Private f32_3* %125 = OpVariable Private 
					                                         f32 %128 = OpConstant 3,674022E-40 
					                                         f32 %129 = OpConstant 3,674022E-40 
					                                       f32_2 %130 = OpConstantComposite %128 %129 
					                                         i32 %136 = OpConstant 0 
					                                         u32 %137 = OpConstant 0 
					                                         i32 %140 = OpConstant 5 
					                                         f32 %147 = OpConstant 3,674022E-40 
					                                         f32 %148 = OpConstant 3,674022E-40 
					                                       f32_2 %149 = OpConstantComposite %147 %148 
					                                         f32 %156 = OpConstant 3,674022E-40 
					                                             %162 = OpTypePointer Private %10 
					                              Private f32_4* %163 = OpVariable Private 
					                                         f32 %165 = OpConstant 3,674022E-40 
					                                       f32_2 %166 = OpConstantComposite %156 %165 
					                              Private f32_2* %173 = OpVariable Private 
					                                             %174 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                             %175 = OpTypePointer UniformConstant %174 
					        UniformConstant read_only Texture2D* %176 = OpVariable UniformConstant 
					                                             %178 = OpTypeSampler 
					                                             %179 = OpTypePointer UniformConstant %178 
					                    UniformConstant sampler* %180 = OpVariable UniformConstant 
					                                             %182 = OpTypeSampledImage %174 
					                                         u32 %188 = OpConstant 2 
					                                Private f32* %192 = OpVariable Private 
					                              Private f32_3* %208 = OpVariable Private 
					                              Private f32_2* %218 = OpVariable Private 
					                                         f32 %228 = OpConstant 3,674022E-40 
					                                         f32 %230 = OpConstant 3,674022E-40 
					                                         f32 %235 = OpConstant 3,674022E-40 
					                                Private f32* %241 = OpVariable Private 
					                              Private f32_3* %257 = OpVariable Private 
					                                         u32 %272 = OpConstant 3 
					                              Private f32_2* %281 = OpVariable Private 
					                              Private f32_2* %289 = OpVariable Private 
					                                         f32 %295 = OpConstant 3,674022E-40 
					                                         i32 %304 = OpConstant 4 
					                              Private f32_3* %325 = OpVariable Private 
					        UniformConstant read_only Texture2D* %326 = OpVariable UniformConstant 
					                    UniformConstant sampler* %328 = OpVariable UniformConstant 
					                                         i32 %341 = OpConstant 2 
					                                         i32 %353 = OpConstant 6 
					                                         i32 %366 = OpConstant 3 
					                                             %405 = OpTypePointer Output %10 
					                               Output f32_4* %406 = OpVariable Output 
					                                             %412 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %51 = OpVariable Function 
					                               Function f32* %248 = OpVariable Function 
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
					                                                      OpStore %43 %58 
					                                          f32 %61 = OpLoad %43 
					                                        f32_2 %62 = OpCompositeConstruct %61 %61 
					                                        f32_2 %66 = OpFMul %62 %65 
					                                        f32_2 %69 = OpFAdd %66 %68 
					                                                      OpStore %60 %69 
					                                          f32 %70 = OpLoad %43 
					                                        f32_2 %71 = OpCompositeConstruct %70 %70 
					                                        f32_2 %72 = OpFNegate %71 
					                                        f32_2 %76 = OpFMul %72 %75 
					                                        f32_2 %77 = OpLoad %60 
					                                        f32_2 %78 = OpFAdd %76 %77 
					                                                      OpStore %60 %78 
					                                          f32 %80 = OpLoad %43 
					                                        f32_2 %81 = OpCompositeConstruct %80 %80 
					                                        f32_2 %82 = OpFMul %81 %75 
					                                        f32_3 %83 = OpLoad %79 
					                                        f32_3 %84 = OpVectorShuffle %83 %82 3 4 2 
					                                                      OpStore %79 %84 
					                                 Uniform f32* %86 = OpAccessChain %14 %85 
					                                          f32 %87 = OpLoad %86 
					                                 Uniform f32* %88 = OpAccessChain %14 %85 
					                                          f32 %89 = OpLoad %88 
					                                        f32_2 %90 = OpCompositeConstruct %87 %89 
					                                          f32 %91 = OpCompositeExtract %90 0 
					                                          f32 %92 = OpCompositeExtract %90 1 
					                                        f32_2 %93 = OpCompositeConstruct %91 %92 
					                                        f32_2 %94 = OpLoad %60 
					                                        f32_2 %95 = OpFMul %93 %94 
					                                        f32_3 %96 = OpLoad %79 
					                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
					                                        f32_2 %98 = OpFAdd %95 %97 
					                                                      OpStore %60 %98 
					                                        f32_3 %99 = OpLoad %26 
					                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
					                                       f32_2 %104 = OpFMul %100 %103 
					                                       f32_3 %105 = OpLoad %79 
					                                       f32_3 %106 = OpVectorShuffle %105 %104 3 4 2 
					                                                      OpStore %79 %106 
					                                       f32_3 %107 = OpLoad %79 
					                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
					                                       f32_2 %109 = OpExtInst %1 13 %108 
					                                       f32_3 %110 = OpLoad %79 
					                                       f32_3 %111 = OpVectorShuffle %110 %109 3 4 2 
					                                                      OpStore %79 %111 
					                                       f32_3 %112 = OpLoad %79 
					                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
					                                Uniform f32* %114 = OpAccessChain %14 %85 
					                                         f32 %115 = OpLoad %114 
					                                Uniform f32* %116 = OpAccessChain %14 %85 
					                                         f32 %117 = OpLoad %116 
					                                       f32_2 %118 = OpCompositeConstruct %115 %117 
					                                         f32 %119 = OpCompositeExtract %118 0 
					                                         f32 %120 = OpCompositeExtract %118 1 
					                                       f32_2 %121 = OpCompositeConstruct %119 %120 
					                                       f32_2 %122 = OpFMul %113 %121 
					                                       f32_3 %123 = OpLoad %79 
					                                       f32_3 %124 = OpVectorShuffle %123 %122 3 4 2 
					                                                      OpStore %79 %124 
					                                       f32_3 %126 = OpLoad %79 
					                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
					                                       f32_2 %131 = OpFMul %127 %130 
					                                       f32_2 %132 = OpLoad %60 
					                                       f32_2 %133 = OpFAdd %131 %132 
					                                       f32_3 %134 = OpLoad %125 
					                                       f32_3 %135 = OpVectorShuffle %134 %133 0 3 4 
					                                                      OpStore %125 %135 
					                                Uniform f32* %138 = OpAccessChain %14 %136 %137 
					                                         f32 %139 = OpLoad %138 
					                                Uniform f32* %141 = OpAccessChain %14 %140 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFMul %139 %142 
					                                Private f32* %144 = OpAccessChain %60 %137 
					                                                      OpStore %144 %143 
					                                       f32_2 %145 = OpLoad %60 
					                                       f32_2 %146 = OpVectorShuffle %145 %145 0 0 
					                                       f32_2 %150 = OpFMul %146 %149 
					                                                      OpStore %60 %150 
					                                       f32_2 %151 = OpLoad %60 
					                                       f32_2 %152 = OpExtInst %1 13 %151 
					                                                      OpStore %60 %152 
					                                Private f32* %153 = OpAccessChain %60 %137 
					                                         f32 %154 = OpLoad %153 
					                                         f32 %155 = OpFNegate %154 
					                                         f32 %157 = OpFMul %155 %156 
					                                Private f32* %158 = OpAccessChain %26 %137 
					                                         f32 %159 = OpLoad %158 
					                                         f32 %160 = OpFAdd %157 %159 
					                                Private f32* %161 = OpAccessChain %125 %137 
					                                                      OpStore %161 %160 
					                                       f32_2 %164 = OpLoad %60 
					                                       f32_2 %167 = OpFMul %164 %166 
					                                       f32_3 %168 = OpLoad %26 
					                                       f32_2 %169 = OpVectorShuffle %168 %168 0 0 
					                                       f32_2 %170 = OpFAdd %167 %169 
					                                       f32_4 %171 = OpLoad %163 
					                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 2 3 
					                                                      OpStore %163 %172 
					                         read_only Texture2D %177 = OpLoad %176 
					                                     sampler %181 = OpLoad %180 
					                  read_only Texture2DSampled %183 = OpSampledImage %177 %181 
					                                       f32_3 %184 = OpLoad %125 
					                                       f32_2 %185 = OpVectorShuffle %184 %184 0 1 
					                                       f32_4 %186 = OpImageSampleImplicitLod %183 %185 
					                                       f32_2 %187 = OpVectorShuffle %186 %186 0 1 
					                                                      OpStore %173 %187 
					                                Private f32* %189 = OpAccessChain %125 %188 
					                                         f32 %190 = OpLoad %189 
					                                Private f32* %191 = OpAccessChain %163 %188 
					                                                      OpStore %191 %190 
					                                Uniform f32* %193 = OpAccessChain %14 %85 
					                                         f32 %194 = OpLoad %193 
					                                         f32 %195 = OpFMul %194 %101 
					                                                      OpStore %192 %195 
					                                Private f32* %196 = OpAccessChain %173 %137 
					                                         f32 %197 = OpLoad %196 
					                                         f32 %198 = OpLoad %192 
					                                         f32 %199 = OpFDiv %197 %198 
					                                Private f32* %200 = OpAccessChain %79 %137 
					                                                      OpStore %200 %199 
					                                       f32_3 %201 = OpLoad %79 
					                                       f32_2 %202 = OpVectorShuffle %201 %201 0 0 
					                                       f32_4 %203 = OpLoad %163 
					                                       f32_2 %204 = OpVectorShuffle %203 %203 0 2 
					                                       f32_2 %205 = OpFAdd %202 %204 
					                                       f32_3 %206 = OpLoad %79 
					                                       f32_3 %207 = OpVectorShuffle %206 %205 3 1 4 
					                                                      OpStore %79 %207 
					                         read_only Texture2D %209 = OpLoad %176 
					                                     sampler %210 = OpLoad %180 
					                  read_only Texture2DSampled %211 = OpSampledImage %209 %210 
					                                       f32_3 %212 = OpLoad %79 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 2 
					                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
					                                       f32_2 %215 = OpVectorShuffle %214 %214 0 1 
					                                       f32_3 %216 = OpLoad %208 
					                                       f32_3 %217 = OpVectorShuffle %216 %215 3 1 4 
					                                                      OpStore %208 %217 
					                                       f32_2 %219 = OpLoad %173 
					                                       f32_3 %220 = OpLoad %208 
					                                       f32_2 %221 = OpVectorShuffle %220 %220 0 2 
					                                       f32_2 %222 = OpFAdd %219 %221 
					                                                      OpStore %218 %222 
					                                Private f32* %223 = OpAccessChain %218 %137 
					                                         f32 %224 = OpLoad %223 
					                                         f32 %225 = OpLoad %192 
					                                         f32 %226 = OpFDiv %224 %225 
					                                                      OpStore %192 %226 
					                                         f32 %227 = OpLoad %43 
					                                         f32 %229 = OpFMul %227 %228 
					                                         f32 %231 = OpFAdd %229 %230 
					                                Private f32* %232 = OpAccessChain %79 %137 
					                                                      OpStore %232 %231 
					                                         f32 %233 = OpLoad %43 
					                                         f32 %234 = OpFNegate %233 
					                                         f32 %236 = OpFMul %234 %235 
					                                Private f32* %237 = OpAccessChain %79 %137 
					                                         f32 %238 = OpLoad %237 
					                                         f32 %239 = OpFAdd %236 %238 
					                                Private f32* %240 = OpAccessChain %79 %137 
					                                                      OpStore %240 %239 
					                                         f32 %242 = OpLoad %43 
					                                         f32 %243 = OpFMul %242 %235 
					                                                      OpStore %241 %243 
					                                         f32 %244 = OpLoad %43 
					                                         f32 %245 = OpFNegate %244 
					                                         f32 %246 = OpFAdd %245 %47 
					                                                      OpStore %43 %246 
					                                        bool %247 = OpLoad %8 
					                                                      OpSelectionMerge %250 None 
					                                                      OpBranchConditional %247 %249 %252 
					                                             %249 = OpLabel 
					                                         f32 %251 = OpLoad %43 
					                                                      OpStore %248 %251 
					                                                      OpBranch %250 
					                                             %252 = OpLabel 
					                                Private f32* %253 = OpAccessChain %26 %18 
					                                         f32 %254 = OpLoad %253 
					                                                      OpStore %248 %254 
					                                                      OpBranch %250 
					                                             %250 = OpLabel 
					                                         f32 %255 = OpLoad %248 
					                                Private f32* %256 = OpAccessChain %26 %188 
					                                                      OpStore %256 %255 
					                                Uniform f32* %258 = OpAccessChain %14 %85 
					                                         f32 %259 = OpLoad %258 
					                                Private f32* %260 = OpAccessChain %79 %137 
					                                         f32 %261 = OpLoad %260 
					                                         f32 %262 = OpFMul %259 %261 
					                                         f32 %263 = OpLoad %241 
					                                         f32 %264 = OpFAdd %262 %263 
					                                Private f32* %265 = OpAccessChain %257 %137 
					                                                      OpStore %265 %264 
					                                Private f32* %266 = OpAccessChain %79 %18 
					                                         f32 %267 = OpLoad %266 
					                                         f32 %268 = OpFMul %267 %129 
					                                Private f32* %269 = OpAccessChain %257 %137 
					                                         f32 %270 = OpLoad %269 
					                                         f32 %271 = OpFAdd %268 %270 
					                                Private f32* %273 = OpAccessChain %163 %272 
					                                                      OpStore %273 %271 
					                                         f32 %274 = OpLoad %192 
					                                       f32_2 %275 = OpCompositeConstruct %274 %274 
					                                       f32_4 %276 = OpLoad %163 
					                                       f32_2 %277 = OpVectorShuffle %276 %276 1 3 
					                                       f32_2 %278 = OpFAdd %275 %277 
					                                       f32_3 %279 = OpLoad %257 
					                                       f32_3 %280 = OpVectorShuffle %279 %278 3 4 2 
					                                                      OpStore %257 %280 
					                         read_only Texture2D %282 = OpLoad %176 
					                                     sampler %283 = OpLoad %180 
					                  read_only Texture2DSampled %284 = OpSampledImage %282 %283 
					                                       f32_3 %285 = OpLoad %257 
					                                       f32_2 %286 = OpVectorShuffle %285 %285 0 1 
					                                       f32_4 %287 = OpImageSampleImplicitLod %284 %286 
					                                       f32_2 %288 = OpVectorShuffle %287 %287 0 1 
					                                                      OpStore %281 %288 
					                                       f32_2 %290 = OpLoad %281 
					                                       f32_2 %291 = OpLoad %218 
					                                       f32_2 %292 = OpFAdd %290 %291 
					                                                      OpStore %289 %292 
					                                Private f32* %293 = OpAccessChain %289 %137 
					                                         f32 %294 = OpLoad %293 
					                                         f32 %296 = OpFMul %294 %295 
					                                Private f32* %297 = OpAccessChain %218 %137 
					                                                      OpStore %297 %296 
					                                Private f32* %298 = OpAccessChain %218 %137 
					                                         f32 %299 = OpLoad %298 
					                                         f32 %300 = OpExtInst %1 43 %299 %22 %47 
					                                Private f32* %301 = OpAccessChain %218 %137 
					                                                      OpStore %301 %300 
					                                       f32_2 %302 = OpLoad %218 
					                                       f32_2 %303 = OpVectorShuffle %302 %302 0 0 
					                                Uniform f32* %305 = OpAccessChain %14 %304 
					                                         f32 %306 = OpLoad %305 
					                                Uniform f32* %307 = OpAccessChain %14 %304 
					                                         f32 %308 = OpLoad %307 
					                                       f32_2 %309 = OpCompositeConstruct %306 %308 
					                                         f32 %310 = OpCompositeExtract %309 0 
					                                         f32 %311 = OpCompositeExtract %309 1 
					                                       f32_2 %312 = OpCompositeConstruct %310 %311 
					                                       f32_2 %313 = OpFMul %303 %312 
					                                       f32_3 %314 = OpLoad %26 
					                                       f32_2 %315 = OpVectorShuffle %314 %314 0 2 
					                                       f32_2 %316 = OpFAdd %313 %315 
					                                       f32_3 %317 = OpLoad %26 
					                                       f32_3 %318 = OpVectorShuffle %317 %316 3 4 2 
					                                                      OpStore %26 %318 
					                                Private f32* %319 = OpAccessChain %218 %137 
					                                         f32 %320 = OpLoad %319 
					                                Uniform f32* %321 = OpAccessChain %14 %304 
					                                         f32 %322 = OpLoad %321 
					                                         f32 %323 = OpFMul %320 %322 
					                                Private f32* %324 = OpAccessChain %60 %137 
					                                                      OpStore %324 %323 
					                         read_only Texture2D %327 = OpLoad %326 
					                                     sampler %329 = OpLoad %328 
					                  read_only Texture2DSampled %330 = OpSampledImage %327 %329 
					                                       f32_3 %331 = OpLoad %26 
					                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
					                                       f32_4 %333 = OpImageSampleImplicitLod %330 %332 
					                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
					                                                      OpStore %325 %334 
					                                Private f32* %335 = OpAccessChain %289 %137 
					                                         f32 %336 = OpLoad %335 
					                                Uniform f32* %337 = OpAccessChain %14 %304 
					                                         f32 %338 = OpLoad %337 
					                                         f32 %339 = OpFMul %336 %338 
					                                Private f32* %340 = OpAccessChain %257 %137 
					                                                      OpStore %340 %339 
					                                Uniform f32* %342 = OpAccessChain %14 %341 
					                                         f32 %343 = OpLoad %342 
					                                Uniform f32* %344 = OpAccessChain %14 %341 
					                                         f32 %345 = OpLoad %344 
					                                Uniform f32* %346 = OpAccessChain %14 %341 
					                                         f32 %347 = OpLoad %346 
					                                       f32_3 %348 = OpCompositeConstruct %343 %345 %347 
					                                         f32 %349 = OpCompositeExtract %348 0 
					                                         f32 %350 = OpCompositeExtract %348 1 
					                                         f32 %351 = OpCompositeExtract %348 2 
					                                       f32_3 %352 = OpCompositeConstruct %349 %350 %351 
					                              Uniform f32_4* %354 = OpAccessChain %14 %353 
					                                       f32_4 %355 = OpLoad %354 
					                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
					                                       f32_3 %357 = OpFMul %352 %356 
					                                                      OpStore %79 %357 
					                                       f32_3 %358 = OpLoad %257 
					                                       f32_3 %359 = OpVectorShuffle %358 %358 0 0 0 
					                                       f32_3 %360 = OpLoad %79 
					                                       f32_3 %361 = OpFMul %359 %360 
					                                       f32_3 %362 = OpLoad %325 
					                                       f32_3 %363 = OpFAdd %361 %362 
					                                                      OpStore %26 %363 
					                                Uniform f32* %364 = OpAccessChain %14 %85 
					                                         f32 %365 = OpLoad %364 
					                                Uniform f32* %367 = OpAccessChain %14 %366 
					                                         f32 %368 = OpLoad %367 
					                                         f32 %369 = OpFMul %365 %368 
					                                Private f32* %370 = OpAccessChain %257 %137 
					                                                      OpStore %370 %369 
					                                Private f32* %371 = OpAccessChain %289 %18 
					                                         f32 %372 = OpLoad %371 
					                                         f32 %373 = OpFNegate %372 
					                                Private f32* %374 = OpAccessChain %257 %137 
					                                         f32 %375 = OpLoad %374 
					                                         f32 %376 = OpFMul %373 %375 
					                                Private f32* %377 = OpAccessChain %60 %137 
					                                         f32 %378 = OpLoad %377 
					                                         f32 %379 = OpFAdd %376 %378 
					                                Private f32* %380 = OpAccessChain %257 %137 
					                                                      OpStore %380 %379 
					                                Private f32* %381 = OpAccessChain %257 %137 
					                                         f32 %382 = OpLoad %381 
					                                Uniform f32* %383 = OpAccessChain %14 %304 
					                                         f32 %384 = OpLoad %383 
					                                         f32 %385 = OpFMul %382 %384 
					                                Private f32* %386 = OpAccessChain %257 %137 
					                                                      OpStore %386 %385 
					                                Uniform f32* %387 = OpAccessChain %14 %366 
					                                         f32 %388 = OpLoad %387 
					                                Private f32* %389 = OpAccessChain %257 %137 
					                                         f32 %390 = OpLoad %389 
					                                         f32 %391 = OpFMul %388 %390 
					                                Private f32* %392 = OpAccessChain %257 %137 
					                                         f32 %393 = OpLoad %392 
					                                         f32 %394 = OpFNegate %393 
					                                         f32 %395 = OpFAdd %391 %394 
					                                                      OpStore %43 %395 
					                              Uniform f32_4* %396 = OpAccessChain %14 %353 
					                                       f32_4 %397 = OpLoad %396 
					                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
					                                         f32 %399 = OpLoad %43 
					                                       f32_3 %400 = OpCompositeConstruct %399 %399 %399 
					                                       f32_3 %401 = OpFMul %398 %400 
					                                       f32_3 %402 = OpLoad %257 
					                                       f32_3 %403 = OpVectorShuffle %402 %402 0 0 0 
					                                       f32_3 %404 = OpFAdd %401 %403 
					                                                      OpStore %257 %404 
					                                       f32_3 %407 = OpLoad %257 
					                                       f32_3 %408 = OpLoad %26 
					                                       f32_3 %409 = OpFAdd %407 %408 
					                                       f32_4 %410 = OpLoad %406 
					                                       f32_4 %411 = OpVectorShuffle %410 %409 4 5 6 3 
					                                                      OpStore %406 %411 
					                                 Output f32* %413 = OpAccessChain %406 %272 
					                                                      OpStore %413 %47 
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
						vec4 _Color2;
						vec4 unused_0_7;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat16_2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_5;
					float u_xlat6;
					vec2 u_xlat12;
					float u_xlat16_12;
					float u_xlat18;
					float u_xlat19;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6 = (-u_xlat1.y) + 1.0;
					    u_xlat6 = (u_xlatb0) ? u_xlat6 : u_xlat1.y;
					    u_xlat12.xy = vec2(u_xlat6) * vec2(0.200000003, 0.100000001) + vec2(0.519999981, 0.519999981);
					    u_xlat12.xy = (-vec2(u_xlat6)) * vec2(0.5, 0.119999997) + u_xlat12.xy;
					    u_xlat2.xy = vec2(u_xlat6) * vec2(0.5, 0.119999997);
					    u_xlat12.xy = vec2(vec2(_Value, _Value)) * u_xlat12.xy + u_xlat2.xy;
					    u_xlat2.xy = u_xlat1.xx * vec2(16.0, 4.0);
					    u_xlat2.xy = sin(u_xlat2.xy);
					    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_Value, _Value));
					    u_xlat3.yz = u_xlat2.xy * vec2(0.03125, 0.0078125) + u_xlat12.xy;
					    u_xlat12.x = _Value5 * _Time.x;
					    u_xlat12.xy = u_xlat12.xx * vec2(8.0, 9.60000038);
					    u_xlat12.xy = sin(u_xlat12.xy);
					    u_xlat3.x = (-u_xlat12.x) * 0.125 + u_xlat1.x;
					    u_xlat4.xy = u_xlat12.xy * vec2(0.125, 0.25) + u_xlat1.xx;
					    u_xlat10_5 = texture(_MainTex2, u_xlat3.xy);
					    u_xlat4.z = u_xlat3.z;
					    u_xlat12.x = _Value * 16.0;
					    u_xlat18 = u_xlat10_5.x / u_xlat12.x;
					    u_xlat2.xz = vec2(u_xlat18) + u_xlat4.xz;
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xz);
					    u_xlat16_2.xz = u_xlat10_3.xy + u_xlat10_5.xy;
					    u_xlat12.x = u_xlat16_2.x / u_xlat12.x;
					    u_xlat18 = u_xlat6 * 0.0199999996 + 0.620000005;
					    u_xlat18 = (-u_xlat6) * 0.0799999982 + u_xlat18;
					    u_xlat19 = u_xlat6 * 0.0799999982;
					    u_xlat6 = (-u_xlat6) + 1.0;
					    u_xlat1.z = (u_xlatb0) ? u_xlat6 : u_xlat1.y;
					    u_xlat0.x = _Value * u_xlat18 + u_xlat19;
					    u_xlat4.w = u_xlat2.y * 0.0078125 + u_xlat0.x;
					    u_xlat0.xy = u_xlat12.xx + u_xlat4.yw;
					    u_xlat10_0 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat16_0.xy = u_xlat10_0.xy + u_xlat16_2.xz;
					    u_xlat16_12 = u_xlat16_0.x * 0.0500000007;
					    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
					    u_xlat1.xy = vec2(u_xlat16_12) * vec2(vec2(_Value4, _Value4)) + u_xlat1.xz;
					    u_xlat12.x = u_xlat16_12 * _Value4;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.x = u_xlat16_0.x * _Value4;
					    u_xlat2.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * _Color2.xyz;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
					    u_xlat0.x = _Value * _Value3;
					    u_xlat0.x = (-u_xlat16_0.y) * u_xlat0.x + u_xlat12.x;
					    u_xlat0.x = u_xlat0.x * _Value4;
					    u_xlat6 = _Value3 * u_xlat0.x + (-u_xlat0.x);
					    u_xlat0.xyz = _Color2.xyz * vec3(u_xlat6) + u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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