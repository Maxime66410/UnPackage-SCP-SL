Shader "CameraFilterPack/NightVisionFX" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 52196
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
					uniform 	float _OnOff;
					uniform 	float _Vignette;
					uniform 	float _Vignette_Alpha;
					uniform 	float _Greenness;
					uniform 	float _Distortion;
					uniform 	float _Noise;
					uniform 	float _Intensity;
					uniform 	float _Light;
					uniform 	float _Light2;
					uniform 	float _Line;
					uniform 	float _Color_R;
					uniform 	float _Color_G;
					uniform 	float _Color_B;
					uniform 	float _Size;
					uniform 	float _Dist;
					uniform 	float _Smooth;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat8;
					vec2 u_xlat10;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = vec2(_TimeX) * vec2(8.0, 10.0);
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat2.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlat8.xy = u_xlat8.xy * vec2(1.20000005, 1.20000005);
					    u_xlat13 = dot(u_xlat2.yy, u_xlat2.xx);
					    u_xlat13 = u_xlat13 + 0.829999983;
					    u_xlat8.xy = u_xlat8.xy * vec2(u_xlat13) + vec2(0.5, 0.5);
					    u_xlat8.xy = (-u_xlat1.xy) + u_xlat8.xy;
					    u_xlat8.xy = vec2(vec2(_Distortion, _Distortion)) * u_xlat8.xy + u_xlat1.xy;
					    u_xlat2.xy = u_xlat0.xx * u_xlat8.xy;
					    u_xlat0.x = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Noise;
					    u_xlat10_2 = texture(_MainTex, u_xlat8.xy);
					    u_xlat8.x = u_xlat8.y * _Light;
					    u_xlat4 = u_xlat8.x * 300.0 + u_xlat0.y;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat4 = u_xlat4 * 0.100000001 + -0.199999988;
					    u_xlat4 = _Line * u_xlat4 + 1.0;
					    u_xlat0.xzw = u_xlat0.xxx * vec3(0.5, 0.5, 0.5) + u_xlat10_2.xyz;
					    u_xlat2.xy = vec2(vec2(_Vignette, _Vignette)) + vec2(0.150000006, 0.25);
					    u_xlat10.xy = (-u_xlat1.xy) + vec2(0.5, 0.5);
					    u_xlat13 = dot(u_xlat10.xy, u_xlat10.xy);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat2.xy = (-u_xlat2.xy) + vec2(u_xlat13);
					    u_xlat2.xy = u_xlat2.xy * vec2(2.85714293, -4.0);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat10.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * u_xlat10.xy;
					    u_xlat0.xzw = (-u_xlat2.xxx) * vec3(vec3(_Vignette_Alpha, _Vignette_Alpha, _Vignette_Alpha)) + u_xlat0.xzw;
					    u_xlat0.xzw = u_xlat2.yyy * vec3(vec3(_Light2, _Light2, _Light2)) + u_xlat0.xzw;
					    u_xlat0.xzw = u_xlat0.xzw + vec3(vec3(_Intensity, _Intensity, _Intensity));
					    u_xlat13 = _Greenness * 0.25 + 1.54999995;
					    u_xlat2.y = u_xlat0.z * u_xlat13;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.550000012, 0.550000012);
					    u_xlat3.yz = u_xlat2.yz * vec2(u_xlat4) + vec2(_Color_G, _Color_B);
					    u_xlat3.x = u_xlat2.x * u_xlat4 + _Color_R;
					    u_xlat0.xyz = u_xlat0.xzw + (-u_xlat3.xyz);
					    u_xlat0.xyz = vec3(vec3(_OnOff, _OnOff, _OnOff)) * u_xlat0.xyz + u_xlat3.xyz;
					    u_xlat1.z = u_xlat1.x * 1.38888884;
					    u_xlat2.yz = (-u_xlat1.zy);
					    u_xlat2.x = (-u_xlat1.x) * 1.38888884 + (-_Dist);
					    u_xlat1.xy = u_xlat2.xz + vec2(0.694000006, 0.5);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 + (-_Size);
					    u_xlat1.x = float(1.0) / (-_Smooth);
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat5.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat5.x) * u_xlat12 + 1.0;
					    u_xlat3.x = _Dist + 0.694000006;
					    u_xlat3.y = 0.5;
					    u_xlat5.xy = u_xlat2.yz + u_xlat3.xy;
					    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat5.x = sqrt(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x + (-_Size);
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat5.x) * u_xlat1.x + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * (-u_xlat0.xyz) + u_xlat0.xyz;
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
					; Bound: 528
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %37 %512 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %10 0 Offset 10 
					                                                      OpMemberDecorate %10 1 Offset 10 
					                                                      OpMemberDecorate %10 2 Offset 10 
					                                                      OpMemberDecorate %10 3 Offset 10 
					                                                      OpMemberDecorate %10 4 Offset 10 
					                                                      OpMemberDecorate %10 5 Offset 10 
					                                                      OpMemberDecorate %10 6 Offset 10 
					                                                      OpMemberDecorate %10 7 Offset 10 
					                                                      OpMemberDecorate %10 8 Offset 10 
					                                                      OpMemberDecorate %10 9 Offset 10 
					                                                      OpMemberDecorate %10 10 Offset 10 
					                                                      OpMemberDecorate %10 11 Offset 10 
					                                                      OpMemberDecorate %10 12 Offset 10 
					                                                      OpMemberDecorate %10 13 Offset 10 
					                                                      OpMemberDecorate %10 14 Offset 10 
					                                                      OpMemberDecorate %10 15 Offset 10 
					                                                      OpMemberDecorate %10 16 Offset 10 
					                                                      OpMemberDecorate %10 17 RelaxedPrecision 
					                                                      OpMemberDecorate %10 17 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 37 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %43 RelaxedPrecision 
					                                                      OpDecorate %46 RelaxedPrecision 
					                                                      OpDecorate %47 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %139 DescriptorSet 139 
					                                                      OpDecorate %139 Binding 139 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %143 DescriptorSet 143 
					                                                      OpDecorate %143 Binding 143 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %512 Location 512 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 0 
					                                              %15 = OpTypePointer Uniform %6 
					                                              %18 = OpTypeVector %6 2 
					                                          f32 %20 = OpConstant 3,674022E-40 
					                                          f32 %21 = OpConstant 3,674022E-40 
					                                        f32_2 %22 = OpConstantComposite %20 %21 
					                                              %26 = OpTypeInt 32 0 
					                                          u32 %27 = OpConstant 0 
					                                              %28 = OpTypePointer Private %6 
					                                              %33 = OpTypeVector %6 3 
					                                              %34 = OpTypePointer Private %33 
					                               Private f32_3* %35 = OpVariable Private 
					                                              %36 = OpTypePointer Input %18 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %39 = OpConstant 17 
					                                              %40 = OpTypePointer Uniform %7 
					                                              %51 = OpTypePointer Private %18 
					                               Private f32_2* %52 = OpVariable Private 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                        f32_2 %56 = OpConstantComposite %55 %55 
					                               Private f32_3* %58 = OpVariable Private 
					                                          f32 %65 = OpConstant 3,674022E-40 
					                                        f32_2 %66 = OpConstantComposite %65 %65 
					                                 Private f32* %68 = OpVariable Private 
					                                          f32 %75 = OpConstant 3,674022E-40 
					                                          f32 %81 = OpConstant 3,674022E-40 
					                                        f32_2 %82 = OpConstantComposite %81 %81 
					                                          i32 %89 = OpConstant 5 
					                                         f32 %111 = OpConstant 3,674022E-40 
					                                         f32 %112 = OpConstant 3,674022E-40 
					                                       f32_2 %113 = OpConstantComposite %111 %112 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                         i32 %131 = OpConstant 6 
					                              Private f32_3* %136 = OpVariable Private 
					                                             %137 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %138 = OpTypePointer UniformConstant %137 
					        UniformConstant read_only Texture2D* %139 = OpVariable UniformConstant 
					                                             %141 = OpTypeSampler 
					                                             %142 = OpTypePointer UniformConstant %141 
					                    UniformConstant sampler* %143 = OpVariable UniformConstant 
					                                             %145 = OpTypeSampledImage %137 
					                                         u32 %150 = OpConstant 1 
					                                         i32 %153 = OpConstant 8 
					                                Private f32* %158 = OpVariable Private 
					                                         f32 %161 = OpConstant 3,674022E-40 
					                                         f32 %169 = OpConstant 3,674022E-40 
					                                         f32 %171 = OpConstant 3,674022E-40 
					                                         i32 %173 = OpConstant 10 
					                                         f32 %178 = OpConstant 3,674022E-40 
					                                       f32_3 %182 = OpConstantComposite %81 %81 %81 
					                                         i32 %188 = OpConstant 2 
					                                         f32 %197 = OpConstant 3,674022E-40 
					                                         f32 %198 = OpConstant 3,674022E-40 
					                                       f32_2 %199 = OpConstantComposite %197 %198 
					                              Private f32_2* %203 = OpVariable Private 
					                                         f32 %223 = OpConstant 3,674022E-40 
					                                         f32 %224 = OpConstant 3,674022E-40 
					                                       f32_2 %225 = OpConstantComposite %223 %224 
					                                         f32 %231 = OpConstant 3,674022E-40 
					                                         f32 %239 = OpConstant 3,674022E-40 
					                                       f32_2 %240 = OpConstantComposite %239 %239 
					                                         f32 %242 = OpConstant 3,674022E-40 
					                                       f32_2 %243 = OpConstantComposite %242 %242 
					                                         i32 %261 = OpConstant 3 
					                                         i32 %281 = OpConstant 9 
					                                         i32 %301 = OpConstant 7 
					                                         i32 %316 = OpConstant 4 
					                                         f32 %320 = OpConstant 3,674022E-40 
					                                         u32 %322 = OpConstant 2 
					                                         f32 %330 = OpConstant 3,674022E-40 
					                                       f32_2 %331 = OpConstantComposite %330 %330 
					                              Private f32_3* %335 = OpVariable Private 
					                                         i32 %341 = OpConstant 12 
					                                         i32 %344 = OpConstant 13 
					                                         i32 %355 = OpConstant 11 
					                                         i32 %367 = OpConstant 1 
					                                         f32 %388 = OpConstant 3,674022E-40 
					                                         i32 %400 = OpConstant 15 
					                                         f32 %408 = OpConstant 3,674022E-40 
					                                       f32_2 %409 = OpConstantComposite %408 %81 
					                                Private f32* %413 = OpVariable Private 
					                                         i32 %422 = OpConstant 14 
					                                         i32 %427 = OpConstant 16 
					                              Private f32_2* %439 = OpVariable Private 
					                                             %511 = OpTypePointer Output %7 
					                               Output f32_4* %512 = OpVariable Output 
					                                         u32 %524 = OpConstant 3 
					                                             %525 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                        f32_2 %19 = OpCompositeConstruct %17 %17 
					                                        f32_2 %23 = OpFMul %19 %22 
					                                        f32_4 %24 = OpLoad %9 
					                                        f32_4 %25 = OpVectorShuffle %24 %23 4 5 2 3 
					                                                      OpStore %9 %25 
					                                 Private f32* %29 = OpAccessChain %9 %27 
					                                          f32 %30 = OpLoad %29 
					                                          f32 %31 = OpExtInst %1 8 %30 
					                                 Private f32* %32 = OpAccessChain %9 %27 
					                                                      OpStore %32 %31 
					                                        f32_2 %38 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %41 = OpAccessChain %12 %39 
					                                        f32_4 %42 = OpLoad %41 
					                                        f32_2 %43 = OpVectorShuffle %42 %42 0 1 
					                                        f32_2 %44 = OpFMul %38 %43 
					                               Uniform f32_4* %45 = OpAccessChain %12 %39 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_2 %47 = OpVectorShuffle %46 %46 2 3 
					                                        f32_2 %48 = OpFAdd %44 %47 
					                                        f32_3 %49 = OpLoad %35 
					                                        f32_3 %50 = OpVectorShuffle %49 %48 3 4 2 
					                                                      OpStore %35 %50 
					                                        f32_3 %53 = OpLoad %35 
					                                        f32_2 %54 = OpVectorShuffle %53 %53 0 1 
					                                        f32_2 %57 = OpFAdd %54 %56 
					                                                      OpStore %52 %57 
					                                        f32_2 %59 = OpLoad %52 
					                                        f32_2 %60 = OpLoad %52 
					                                        f32_2 %61 = OpFMul %59 %60 
					                                        f32_3 %62 = OpLoad %58 
					                                        f32_3 %63 = OpVectorShuffle %62 %61 3 4 2 
					                                                      OpStore %58 %63 
					                                        f32_2 %64 = OpLoad %52 
					                                        f32_2 %67 = OpFMul %64 %66 
					                                                      OpStore %52 %67 
					                                        f32_3 %69 = OpLoad %58 
					                                        f32_2 %70 = OpVectorShuffle %69 %69 1 1 
					                                        f32_3 %71 = OpLoad %58 
					                                        f32_2 %72 = OpVectorShuffle %71 %71 0 0 
					                                          f32 %73 = OpDot %70 %72 
					                                                      OpStore %68 %73 
					                                          f32 %74 = OpLoad %68 
					                                          f32 %76 = OpFAdd %74 %75 
					                                                      OpStore %68 %76 
					                                        f32_2 %77 = OpLoad %52 
					                                          f32 %78 = OpLoad %68 
					                                        f32_2 %79 = OpCompositeConstruct %78 %78 
					                                        f32_2 %80 = OpFMul %77 %79 
					                                        f32_2 %83 = OpFAdd %80 %82 
					                                                      OpStore %52 %83 
					                                        f32_3 %84 = OpLoad %35 
					                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                                        f32_2 %86 = OpFNegate %85 
					                                        f32_2 %87 = OpLoad %52 
					                                        f32_2 %88 = OpFAdd %86 %87 
					                                                      OpStore %52 %88 
					                                 Uniform f32* %90 = OpAccessChain %12 %89 
					                                          f32 %91 = OpLoad %90 
					                                 Uniform f32* %92 = OpAccessChain %12 %89 
					                                          f32 %93 = OpLoad %92 
					                                        f32_2 %94 = OpCompositeConstruct %91 %93 
					                                          f32 %95 = OpCompositeExtract %94 0 
					                                          f32 %96 = OpCompositeExtract %94 1 
					                                        f32_2 %97 = OpCompositeConstruct %95 %96 
					                                        f32_2 %98 = OpLoad %52 
					                                        f32_2 %99 = OpFMul %97 %98 
					                                       f32_3 %100 = OpLoad %35 
					                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
					                                       f32_2 %102 = OpFAdd %99 %101 
					                                                      OpStore %52 %102 
					                                       f32_4 %103 = OpLoad %9 
					                                       f32_2 %104 = OpVectorShuffle %103 %103 0 0 
					                                       f32_2 %105 = OpLoad %52 
					                                       f32_2 %106 = OpFMul %104 %105 
					                                       f32_3 %107 = OpLoad %58 
					                                       f32_3 %108 = OpVectorShuffle %107 %106 3 4 2 
					                                                      OpStore %58 %108 
					                                       f32_3 %109 = OpLoad %58 
					                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
					                                         f32 %114 = OpDot %110 %113 
					                                Private f32* %115 = OpAccessChain %9 %27 
					                                                      OpStore %115 %114 
					                                Private f32* %116 = OpAccessChain %9 %27 
					                                         f32 %117 = OpLoad %116 
					                                         f32 %118 = OpExtInst %1 13 %117 
					                                Private f32* %119 = OpAccessChain %9 %27 
					                                                      OpStore %119 %118 
					                                Private f32* %120 = OpAccessChain %9 %27 
					                                         f32 %121 = OpLoad %120 
					                                         f32 %123 = OpFMul %121 %122 
					                                Private f32* %124 = OpAccessChain %9 %27 
					                                                      OpStore %124 %123 
					                                Private f32* %125 = OpAccessChain %9 %27 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpExtInst %1 10 %126 
					                                Private f32* %128 = OpAccessChain %9 %27 
					                                                      OpStore %128 %127 
					                                Private f32* %129 = OpAccessChain %9 %27 
					                                         f32 %130 = OpLoad %129 
					                                Uniform f32* %132 = OpAccessChain %12 %131 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFMul %130 %133 
					                                Private f32* %135 = OpAccessChain %9 %27 
					                                                      OpStore %135 %134 
					                         read_only Texture2D %140 = OpLoad %139 
					                                     sampler %144 = OpLoad %143 
					                  read_only Texture2DSampled %146 = OpSampledImage %140 %144 
					                                       f32_2 %147 = OpLoad %52 
					                                       f32_4 %148 = OpImageSampleImplicitLod %146 %147 
					                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
					                                                      OpStore %136 %149 
					                                Private f32* %151 = OpAccessChain %52 %150 
					                                         f32 %152 = OpLoad %151 
					                                Uniform f32* %154 = OpAccessChain %12 %153 
					                                         f32 %155 = OpLoad %154 
					                                         f32 %156 = OpFMul %152 %155 
					                                Private f32* %157 = OpAccessChain %52 %27 
					                                                      OpStore %157 %156 
					                                Private f32* %159 = OpAccessChain %52 %27 
					                                         f32 %160 = OpLoad %159 
					                                         f32 %162 = OpFMul %160 %161 
					                                Private f32* %163 = OpAccessChain %9 %150 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpFAdd %162 %164 
					                                                      OpStore %158 %165 
					                                         f32 %166 = OpLoad %158 
					                                         f32 %167 = OpExtInst %1 13 %166 
					                                                      OpStore %158 %167 
					                                         f32 %168 = OpLoad %158 
					                                         f32 %170 = OpFMul %168 %169 
					                                         f32 %172 = OpFAdd %170 %171 
					                                                      OpStore %158 %172 
					                                Uniform f32* %174 = OpAccessChain %12 %173 
					                                         f32 %175 = OpLoad %174 
					                                         f32 %176 = OpLoad %158 
					                                         f32 %177 = OpFMul %175 %176 
					                                         f32 %179 = OpFAdd %177 %178 
					                                                      OpStore %158 %179 
					                                       f32_4 %180 = OpLoad %9 
					                                       f32_3 %181 = OpVectorShuffle %180 %180 0 0 0 
					                                       f32_3 %183 = OpFMul %181 %182 
					                                       f32_3 %184 = OpLoad %136 
					                                       f32_3 %185 = OpFAdd %183 %184 
					                                       f32_4 %186 = OpLoad %9 
					                                       f32_4 %187 = OpVectorShuffle %186 %185 4 1 5 6 
					                                                      OpStore %9 %187 
					                                Uniform f32* %189 = OpAccessChain %12 %188 
					                                         f32 %190 = OpLoad %189 
					                                Uniform f32* %191 = OpAccessChain %12 %188 
					                                         f32 %192 = OpLoad %191 
					                                       f32_2 %193 = OpCompositeConstruct %190 %192 
					                                         f32 %194 = OpCompositeExtract %193 0 
					                                         f32 %195 = OpCompositeExtract %193 1 
					                                       f32_2 %196 = OpCompositeConstruct %194 %195 
					                                       f32_2 %200 = OpFAdd %196 %199 
					                                       f32_3 %201 = OpLoad %58 
					                                       f32_3 %202 = OpVectorShuffle %201 %200 3 4 2 
					                                                      OpStore %58 %202 
					                                       f32_3 %204 = OpLoad %35 
					                                       f32_2 %205 = OpVectorShuffle %204 %204 0 1 
					                                       f32_2 %206 = OpFNegate %205 
					                                       f32_2 %207 = OpFAdd %206 %82 
					                                                      OpStore %203 %207 
					                                       f32_2 %208 = OpLoad %203 
					                                       f32_2 %209 = OpLoad %203 
					                                         f32 %210 = OpDot %208 %209 
					                                                      OpStore %68 %210 
					                                         f32 %211 = OpLoad %68 
					                                         f32 %212 = OpExtInst %1 31 %211 
					                                                      OpStore %68 %212 
					                                       f32_3 %213 = OpLoad %58 
					                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
					                                       f32_2 %215 = OpFNegate %214 
					                                         f32 %216 = OpLoad %68 
					                                       f32_2 %217 = OpCompositeConstruct %216 %216 
					                                       f32_2 %218 = OpFAdd %215 %217 
					                                       f32_3 %219 = OpLoad %58 
					                                       f32_3 %220 = OpVectorShuffle %219 %218 3 4 2 
					                                                      OpStore %58 %220 
					                                       f32_3 %221 = OpLoad %58 
					                                       f32_2 %222 = OpVectorShuffle %221 %221 0 1 
					                                       f32_2 %226 = OpFMul %222 %225 
					                                       f32_3 %227 = OpLoad %58 
					                                       f32_3 %228 = OpVectorShuffle %227 %226 3 4 2 
					                                                      OpStore %58 %228 
					                                       f32_3 %229 = OpLoad %58 
					                                       f32_2 %230 = OpVectorShuffle %229 %229 0 1 
					                                       f32_2 %232 = OpCompositeConstruct %231 %231 
					                                       f32_2 %233 = OpCompositeConstruct %178 %178 
					                                       f32_2 %234 = OpExtInst %1 43 %230 %232 %233 
					                                       f32_3 %235 = OpLoad %58 
					                                       f32_3 %236 = OpVectorShuffle %235 %234 3 4 2 
					                                                      OpStore %58 %236 
					                                       f32_3 %237 = OpLoad %58 
					                                       f32_2 %238 = OpVectorShuffle %237 %237 0 1 
					                                       f32_2 %241 = OpFMul %238 %240 
					                                       f32_2 %244 = OpFAdd %241 %243 
					                                                      OpStore %203 %244 
					                                       f32_3 %245 = OpLoad %58 
					                                       f32_2 %246 = OpVectorShuffle %245 %245 0 1 
					                                       f32_3 %247 = OpLoad %58 
					                                       f32_2 %248 = OpVectorShuffle %247 %247 0 1 
					                                       f32_2 %249 = OpFMul %246 %248 
					                                       f32_3 %250 = OpLoad %58 
					                                       f32_3 %251 = OpVectorShuffle %250 %249 3 4 2 
					                                                      OpStore %58 %251 
					                                       f32_3 %252 = OpLoad %58 
					                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
					                                       f32_2 %254 = OpLoad %203 
					                                       f32_2 %255 = OpFMul %253 %254 
					                                       f32_3 %256 = OpLoad %58 
					                                       f32_3 %257 = OpVectorShuffle %256 %255 3 4 2 
					                                                      OpStore %58 %257 
					                                       f32_3 %258 = OpLoad %58 
					                                       f32_3 %259 = OpVectorShuffle %258 %258 0 0 0 
					                                       f32_3 %260 = OpFNegate %259 
					                                Uniform f32* %262 = OpAccessChain %12 %261 
					                                         f32 %263 = OpLoad %262 
					                                Uniform f32* %264 = OpAccessChain %12 %261 
					                                         f32 %265 = OpLoad %264 
					                                Uniform f32* %266 = OpAccessChain %12 %261 
					                                         f32 %267 = OpLoad %266 
					                                       f32_3 %268 = OpCompositeConstruct %263 %265 %267 
					                                         f32 %269 = OpCompositeExtract %268 0 
					                                         f32 %270 = OpCompositeExtract %268 1 
					                                         f32 %271 = OpCompositeExtract %268 2 
					                                       f32_3 %272 = OpCompositeConstruct %269 %270 %271 
					                                       f32_3 %273 = OpFMul %260 %272 
					                                       f32_4 %274 = OpLoad %9 
					                                       f32_3 %275 = OpVectorShuffle %274 %274 0 2 3 
					                                       f32_3 %276 = OpFAdd %273 %275 
					                                       f32_4 %277 = OpLoad %9 
					                                       f32_4 %278 = OpVectorShuffle %277 %276 4 1 5 6 
					                                                      OpStore %9 %278 
					                                       f32_3 %279 = OpLoad %58 
					                                       f32_3 %280 = OpVectorShuffle %279 %279 1 1 1 
					                                Uniform f32* %282 = OpAccessChain %12 %281 
					                                         f32 %283 = OpLoad %282 
					                                Uniform f32* %284 = OpAccessChain %12 %281 
					                                         f32 %285 = OpLoad %284 
					                                Uniform f32* %286 = OpAccessChain %12 %281 
					                                         f32 %287 = OpLoad %286 
					                                       f32_3 %288 = OpCompositeConstruct %283 %285 %287 
					                                         f32 %289 = OpCompositeExtract %288 0 
					                                         f32 %290 = OpCompositeExtract %288 1 
					                                         f32 %291 = OpCompositeExtract %288 2 
					                                       f32_3 %292 = OpCompositeConstruct %289 %290 %291 
					                                       f32_3 %293 = OpFMul %280 %292 
					                                       f32_4 %294 = OpLoad %9 
					                                       f32_3 %295 = OpVectorShuffle %294 %294 0 2 3 
					                                       f32_3 %296 = OpFAdd %293 %295 
					                                       f32_4 %297 = OpLoad %9 
					                                       f32_4 %298 = OpVectorShuffle %297 %296 4 1 5 6 
					                                                      OpStore %9 %298 
					                                       f32_4 %299 = OpLoad %9 
					                                       f32_3 %300 = OpVectorShuffle %299 %299 0 2 3 
					                                Uniform f32* %302 = OpAccessChain %12 %301 
					                                         f32 %303 = OpLoad %302 
					                                Uniform f32* %304 = OpAccessChain %12 %301 
					                                         f32 %305 = OpLoad %304 
					                                Uniform f32* %306 = OpAccessChain %12 %301 
					                                         f32 %307 = OpLoad %306 
					                                       f32_3 %308 = OpCompositeConstruct %303 %305 %307 
					                                         f32 %309 = OpCompositeExtract %308 0 
					                                         f32 %310 = OpCompositeExtract %308 1 
					                                         f32 %311 = OpCompositeExtract %308 2 
					                                       f32_3 %312 = OpCompositeConstruct %309 %310 %311 
					                                       f32_3 %313 = OpFAdd %300 %312 
					                                       f32_4 %314 = OpLoad %9 
					                                       f32_4 %315 = OpVectorShuffle %314 %313 4 1 5 6 
					                                                      OpStore %9 %315 
					                                Uniform f32* %317 = OpAccessChain %12 %316 
					                                         f32 %318 = OpLoad %317 
					                                         f32 %319 = OpFMul %318 %198 
					                                         f32 %321 = OpFAdd %319 %320 
					                                                      OpStore %68 %321 
					                                Private f32* %323 = OpAccessChain %9 %322 
					                                         f32 %324 = OpLoad %323 
					                                         f32 %325 = OpLoad %68 
					                                         f32 %326 = OpFMul %324 %325 
					                                Private f32* %327 = OpAccessChain %58 %150 
					                                                      OpStore %327 %326 
					                                       f32_4 %328 = OpLoad %9 
					                                       f32_2 %329 = OpVectorShuffle %328 %328 0 3 
					                                       f32_2 %332 = OpFMul %329 %331 
					                                       f32_3 %333 = OpLoad %58 
					                                       f32_3 %334 = OpVectorShuffle %333 %332 3 1 4 
					                                                      OpStore %58 %334 
					                                       f32_3 %336 = OpLoad %58 
					                                       f32_2 %337 = OpVectorShuffle %336 %336 1 2 
					                                         f32 %338 = OpLoad %158 
					                                       f32_2 %339 = OpCompositeConstruct %338 %338 
					                                       f32_2 %340 = OpFMul %337 %339 
					                                Uniform f32* %342 = OpAccessChain %12 %341 
					                                         f32 %343 = OpLoad %342 
					                                Uniform f32* %345 = OpAccessChain %12 %344 
					                                         f32 %346 = OpLoad %345 
					                                       f32_2 %347 = OpCompositeConstruct %343 %346 
					                                       f32_2 %348 = OpFAdd %340 %347 
					                                       f32_3 %349 = OpLoad %335 
					                                       f32_3 %350 = OpVectorShuffle %349 %348 0 3 4 
					                                                      OpStore %335 %350 
					                                Private f32* %351 = OpAccessChain %58 %27 
					                                         f32 %352 = OpLoad %351 
					                                         f32 %353 = OpLoad %158 
					                                         f32 %354 = OpFMul %352 %353 
					                                Uniform f32* %356 = OpAccessChain %12 %355 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %358 = OpFAdd %354 %357 
					                                Private f32* %359 = OpAccessChain %335 %27 
					                                                      OpStore %359 %358 
					                                       f32_4 %360 = OpLoad %9 
					                                       f32_3 %361 = OpVectorShuffle %360 %360 0 2 3 
					                                       f32_3 %362 = OpLoad %335 
					                                       f32_3 %363 = OpFNegate %362 
					                                       f32_3 %364 = OpFAdd %361 %363 
					                                       f32_4 %365 = OpLoad %9 
					                                       f32_4 %366 = OpVectorShuffle %365 %364 4 5 6 3 
					                                                      OpStore %9 %366 
					                                Uniform f32* %368 = OpAccessChain %12 %367 
					                                         f32 %369 = OpLoad %368 
					                                Uniform f32* %370 = OpAccessChain %12 %367 
					                                         f32 %371 = OpLoad %370 
					                                Uniform f32* %372 = OpAccessChain %12 %367 
					                                         f32 %373 = OpLoad %372 
					                                       f32_3 %374 = OpCompositeConstruct %369 %371 %373 
					                                         f32 %375 = OpCompositeExtract %374 0 
					                                         f32 %376 = OpCompositeExtract %374 1 
					                                         f32 %377 = OpCompositeExtract %374 2 
					                                       f32_3 %378 = OpCompositeConstruct %375 %376 %377 
					                                       f32_4 %379 = OpLoad %9 
					                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
					                                       f32_3 %381 = OpFMul %378 %380 
					                                       f32_3 %382 = OpLoad %335 
					                                       f32_3 %383 = OpFAdd %381 %382 
					                                       f32_4 %384 = OpLoad %9 
					                                       f32_4 %385 = OpVectorShuffle %384 %383 4 5 6 3 
					                                                      OpStore %9 %385 
					                                Private f32* %386 = OpAccessChain %35 %27 
					                                         f32 %387 = OpLoad %386 
					                                         f32 %389 = OpFMul %387 %388 
					                                Private f32* %390 = OpAccessChain %35 %322 
					                                                      OpStore %390 %389 
					                                       f32_3 %391 = OpLoad %35 
					                                       f32_2 %392 = OpVectorShuffle %391 %391 2 1 
					                                       f32_2 %393 = OpFNegate %392 
					                                       f32_3 %394 = OpLoad %58 
					                                       f32_3 %395 = OpVectorShuffle %394 %393 0 3 4 
					                                                      OpStore %58 %395 
					                                Private f32* %396 = OpAccessChain %35 %27 
					                                         f32 %397 = OpLoad %396 
					                                         f32 %398 = OpFNegate %397 
					                                         f32 %399 = OpFMul %398 %388 
					                                Uniform f32* %401 = OpAccessChain %12 %400 
					                                         f32 %402 = OpLoad %401 
					                                         f32 %403 = OpFNegate %402 
					                                         f32 %404 = OpFAdd %399 %403 
					                                Private f32* %405 = OpAccessChain %58 %27 
					                                                      OpStore %405 %404 
					                                       f32_3 %406 = OpLoad %58 
					                                       f32_2 %407 = OpVectorShuffle %406 %406 0 2 
					                                       f32_2 %410 = OpFAdd %407 %409 
					                                       f32_3 %411 = OpLoad %35 
					                                       f32_3 %412 = OpVectorShuffle %411 %410 3 4 2 
					                                                      OpStore %35 %412 
					                                       f32_3 %414 = OpLoad %35 
					                                       f32_2 %415 = OpVectorShuffle %414 %414 0 1 
					                                       f32_3 %416 = OpLoad %35 
					                                       f32_2 %417 = OpVectorShuffle %416 %416 0 1 
					                                         f32 %418 = OpDot %415 %417 
					                                                      OpStore %413 %418 
					                                         f32 %419 = OpLoad %413 
					                                         f32 %420 = OpExtInst %1 31 %419 
					                                                      OpStore %413 %420 
					                                         f32 %421 = OpLoad %413 
					                                Uniform f32* %423 = OpAccessChain %12 %422 
					                                         f32 %424 = OpLoad %423 
					                                         f32 %425 = OpFNegate %424 
					                                         f32 %426 = OpFAdd %421 %425 
					                                                      OpStore %413 %426 
					                                Uniform f32* %428 = OpAccessChain %12 %427 
					                                         f32 %429 = OpLoad %428 
					                                         f32 %430 = OpFNegate %429 
					                                         f32 %431 = OpFDiv %178 %430 
					                                Private f32* %432 = OpAccessChain %35 %27 
					                                                      OpStore %432 %431 
					                                         f32 %433 = OpLoad %413 
					                                Private f32* %434 = OpAccessChain %35 %27 
					                                         f32 %435 = OpLoad %434 
					                                         f32 %436 = OpFMul %433 %435 
					                                                      OpStore %413 %436 
					                                         f32 %437 = OpLoad %413 
					                                         f32 %438 = OpExtInst %1 43 %437 %231 %178 
					                                                      OpStore %413 %438 
					                                         f32 %440 = OpLoad %413 
					                                         f32 %441 = OpFMul %440 %239 
					                                         f32 %442 = OpFAdd %441 %242 
					                                Private f32* %443 = OpAccessChain %439 %27 
					                                                      OpStore %443 %442 
					                                         f32 %444 = OpLoad %413 
					                                         f32 %445 = OpLoad %413 
					                                         f32 %446 = OpFMul %444 %445 
					                                                      OpStore %413 %446 
					                                Private f32* %447 = OpAccessChain %439 %27 
					                                         f32 %448 = OpLoad %447 
					                                         f32 %449 = OpFNegate %448 
					                                         f32 %450 = OpLoad %413 
					                                         f32 %451 = OpFMul %449 %450 
					                                         f32 %452 = OpFAdd %451 %178 
					                                                      OpStore %413 %452 
					                                Uniform f32* %453 = OpAccessChain %12 %400 
					                                         f32 %454 = OpLoad %453 
					                                         f32 %455 = OpFAdd %454 %408 
					                                Private f32* %456 = OpAccessChain %335 %27 
					                                                      OpStore %456 %455 
					                                Private f32* %457 = OpAccessChain %335 %150 
					                                                      OpStore %457 %81 
					                                       f32_3 %458 = OpLoad %58 
					                                       f32_2 %459 = OpVectorShuffle %458 %458 1 2 
					                                       f32_3 %460 = OpLoad %335 
					                                       f32_2 %461 = OpVectorShuffle %460 %460 0 1 
					                                       f32_2 %462 = OpFAdd %459 %461 
					                                                      OpStore %439 %462 
					                                       f32_2 %463 = OpLoad %439 
					                                       f32_2 %464 = OpLoad %439 
					                                         f32 %465 = OpDot %463 %464 
					                                Private f32* %466 = OpAccessChain %439 %27 
					                                                      OpStore %466 %465 
					                                Private f32* %467 = OpAccessChain %439 %27 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %469 = OpExtInst %1 31 %468 
					                                Private f32* %470 = OpAccessChain %439 %27 
					                                                      OpStore %470 %469 
					                                Private f32* %471 = OpAccessChain %439 %27 
					                                         f32 %472 = OpLoad %471 
					                                Uniform f32* %473 = OpAccessChain %12 %422 
					                                         f32 %474 = OpLoad %473 
					                                         f32 %475 = OpFNegate %474 
					                                         f32 %476 = OpFAdd %472 %475 
					                                Private f32* %477 = OpAccessChain %439 %27 
					                                                      OpStore %477 %476 
					                                Private f32* %478 = OpAccessChain %35 %27 
					                                         f32 %479 = OpLoad %478 
					                                Private f32* %480 = OpAccessChain %439 %27 
					                                         f32 %481 = OpLoad %480 
					                                         f32 %482 = OpFMul %479 %481 
					                                Private f32* %483 = OpAccessChain %35 %27 
					                                                      OpStore %483 %482 
					                                Private f32* %484 = OpAccessChain %35 %27 
					                                         f32 %485 = OpLoad %484 
					                                         f32 %486 = OpExtInst %1 43 %485 %231 %178 
					                                Private f32* %487 = OpAccessChain %35 %27 
					                                                      OpStore %487 %486 
					                                Private f32* %488 = OpAccessChain %35 %27 
					                                         f32 %489 = OpLoad %488 
					                                         f32 %490 = OpFMul %489 %239 
					                                         f32 %491 = OpFAdd %490 %242 
					                                Private f32* %492 = OpAccessChain %439 %27 
					                                                      OpStore %492 %491 
					                                Private f32* %493 = OpAccessChain %35 %27 
					                                         f32 %494 = OpLoad %493 
					                                Private f32* %495 = OpAccessChain %35 %27 
					                                         f32 %496 = OpLoad %495 
					                                         f32 %497 = OpFMul %494 %496 
					                                Private f32* %498 = OpAccessChain %35 %27 
					                                                      OpStore %498 %497 
					                                Private f32* %499 = OpAccessChain %439 %27 
					                                         f32 %500 = OpLoad %499 
					                                         f32 %501 = OpFNegate %500 
					                                Private f32* %502 = OpAccessChain %35 %27 
					                                         f32 %503 = OpLoad %502 
					                                         f32 %504 = OpFMul %501 %503 
					                                         f32 %505 = OpFAdd %504 %178 
					                                Private f32* %506 = OpAccessChain %35 %27 
					                                                      OpStore %506 %505 
					                                         f32 %507 = OpLoad %413 
					                                Private f32* %508 = OpAccessChain %35 %27 
					                                         f32 %509 = OpLoad %508 
					                                         f32 %510 = OpFMul %507 %509 
					                                                      OpStore %413 %510 
					                                         f32 %513 = OpLoad %413 
					                                       f32_3 %514 = OpCompositeConstruct %513 %513 %513 
					                                       f32_4 %515 = OpLoad %9 
					                                       f32_3 %516 = OpVectorShuffle %515 %515 0 1 2 
					                                       f32_3 %517 = OpFNegate %516 
					                                       f32_3 %518 = OpFMul %514 %517 
					                                       f32_4 %519 = OpLoad %9 
					                                       f32_3 %520 = OpVectorShuffle %519 %519 0 1 2 
					                                       f32_3 %521 = OpFAdd %518 %520 
					                                       f32_4 %522 = OpLoad %512 
					                                       f32_4 %523 = OpVectorShuffle %522 %521 4 5 6 3 
					                                                      OpStore %512 %523 
					                                 Output f32* %526 = OpAccessChain %512 %524 
					                                                      OpStore %526 %178 
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
						float _OnOff;
						float _Vignette;
						float _Vignette_Alpha;
						vec4 unused_0_5;
						float _Greenness;
						float _Distortion;
						float _Noise;
						float _Intensity;
						float _Light;
						float _Light2;
						float _Line;
						float _Color_R;
						float _Color_G;
						float _Color_B;
						float _Size;
						float _Dist;
						float _Smooth;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat8;
					vec2 u_xlat10;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = vec2(_TimeX) * vec2(8.0, 10.0);
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat2.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlat8.xy = u_xlat8.xy * vec2(1.20000005, 1.20000005);
					    u_xlat13 = dot(u_xlat2.yy, u_xlat2.xx);
					    u_xlat13 = u_xlat13 + 0.829999983;
					    u_xlat8.xy = u_xlat8.xy * vec2(u_xlat13) + vec2(0.5, 0.5);
					    u_xlat8.xy = (-u_xlat1.xy) + u_xlat8.xy;
					    u_xlat8.xy = vec2(vec2(_Distortion, _Distortion)) * u_xlat8.xy + u_xlat1.xy;
					    u_xlat2.xy = u_xlat0.xx * u_xlat8.xy;
					    u_xlat0.x = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Noise;
					    u_xlat10_2 = texture(_MainTex, u_xlat8.xy);
					    u_xlat8.x = u_xlat8.y * _Light;
					    u_xlat4 = u_xlat8.x * 300.0 + u_xlat0.y;
					    u_xlat4 = sin(u_xlat4);
					    u_xlat4 = u_xlat4 * 0.100000001 + -0.199999988;
					    u_xlat4 = _Line * u_xlat4 + 1.0;
					    u_xlat0.xzw = u_xlat0.xxx * vec3(0.5, 0.5, 0.5) + u_xlat10_2.xyz;
					    u_xlat2.xy = vec2(vec2(_Vignette, _Vignette)) + vec2(0.150000006, 0.25);
					    u_xlat10.xy = (-u_xlat1.xy) + vec2(0.5, 0.5);
					    u_xlat13 = dot(u_xlat10.xy, u_xlat10.xy);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat2.xy = (-u_xlat2.xy) + vec2(u_xlat13);
					    u_xlat2.xy = u_xlat2.xy * vec2(2.85714293, -4.0);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat10.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlat2.xy = u_xlat2.xy * u_xlat10.xy;
					    u_xlat0.xzw = (-u_xlat2.xxx) * vec3(vec3(_Vignette_Alpha, _Vignette_Alpha, _Vignette_Alpha)) + u_xlat0.xzw;
					    u_xlat0.xzw = u_xlat2.yyy * vec3(vec3(_Light2, _Light2, _Light2)) + u_xlat0.xzw;
					    u_xlat0.xzw = u_xlat0.xzw + vec3(vec3(_Intensity, _Intensity, _Intensity));
					    u_xlat13 = _Greenness * 0.25 + 1.54999995;
					    u_xlat2.y = u_xlat0.z * u_xlat13;
					    u_xlat2.xz = u_xlat0.xw * vec2(0.550000012, 0.550000012);
					    u_xlat3.yz = u_xlat2.yz * vec2(u_xlat4) + vec2(_Color_G, _Color_B);
					    u_xlat3.x = u_xlat2.x * u_xlat4 + _Color_R;
					    u_xlat0.xyz = u_xlat0.xzw + (-u_xlat3.xyz);
					    u_xlat0.xyz = vec3(vec3(_OnOff, _OnOff, _OnOff)) * u_xlat0.xyz + u_xlat3.xyz;
					    u_xlat1.z = u_xlat1.x * 1.38888884;
					    u_xlat2.yz = (-u_xlat1.zy);
					    u_xlat2.x = (-u_xlat1.x) * 1.38888884 + (-_Dist);
					    u_xlat1.xy = u_xlat2.xz + vec2(0.694000006, 0.5);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat12 + (-_Size);
					    u_xlat1.x = float(1.0) / (-_Smooth);
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat5.x = u_xlat12 * -2.0 + 3.0;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = (-u_xlat5.x) * u_xlat12 + 1.0;
					    u_xlat3.x = _Dist + 0.694000006;
					    u_xlat3.y = 0.5;
					    u_xlat5.xy = u_xlat2.yz + u_xlat3.xy;
					    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat5.x = sqrt(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x + (-_Size);
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat5.x) * u_xlat1.x + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    SV_Target0.xyz = vec3(u_xlat12) * (-u_xlat0.xyz) + u_xlat0.xyz;
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