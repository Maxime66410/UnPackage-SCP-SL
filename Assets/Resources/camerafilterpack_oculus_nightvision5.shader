Shader "CameraFilterPack/Oculus_NightVision5" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 56463
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
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
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
					bvec2 u_xlatb2;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat16_5;
					vec2 u_xlat6;
					float u_xlat10;
					vec2 u_xlat12;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.25, 0.230000004, 10.0, 110.0);
					    u_xlat5.xz = sin(u_xlat0.yw);
					    u_xlat5.x = u_xlat5.x + _TimeX;
					    u_xlat15 = u_xlat5.z * 0.00999999978 + 0.790000021;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = u_xlat1.y * 2.0 + u_xlat0.x;
					    u_xlat5.y = u_xlat1.y * 250.0 + u_xlat0.z;
					    u_xlat5.xy = sin(u_xlat5.xy);
					    u_xlat10 = u_xlat5.y * 0.100000001 + 0.899999976;
					    u_xlat0.x = u_xlat5.x + u_xlat0.x;
					    u_xlat5.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat5.x) + u_xlat0.x;
					    u_xlatb2.xy = greaterThanEqual(u_xlat0.xxxx, vec4(0.400000006, 0.600000024, 0.0, 0.0)).xy;
					    u_xlat0.x = u_xlat0.x + -0.400000006;
					    u_xlat5.x = u_xlatb2.x ? 1.0 : float(0.0);
					    u_xlat16 = (u_xlatb2.y) ? -1.0 : -0.0;
					    u_xlat5.x = u_xlat5.x + u_xlat16;
					    u_xlat0.x = u_xlat5.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) * 4.99999952 + 1.0;
					    u_xlat0.x = u_xlat5.x * u_xlat0.x;
					    u_xlat5.x = cos(_TimeX);
					    u_xlat2.y = u_xlat5.x * _TimeX;
					    u_xlat2.x = _TimeX;
					    u_xlat12.xy = u_xlat1.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat2.xy = u_xlat2.xy * vec2(8.0, 16.0) + u_xlat12.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_5 = u_xlat10_2.x * u_xlat10_2.x;
					    u_xlat0.x = u_xlat16_5 * u_xlat0.x;
					    u_xlat2.y = _Blue_G + (-_Smooth);
					    u_xlat2.x = _Blue_R;
					    u_xlat2.z = _Blue_B;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat5.x = dot(u_xlat10_3.xyz, u_xlat2.xyz);
					    u_xlat2.z = u_xlat5.x + _Blue_C;
					    u_xlat4.y = _Red_G + (-_Smooth);
					    u_xlat4.xz = vec2(_Red_R, _Red_B);
					    u_xlat5.x = dot(u_xlat10_3.xyz, u_xlat4.xyz);
					    u_xlat2.x = u_xlat5.x + _Red_C;
					    u_xlat4.y = _Green_G + (-_Smooth);
					    u_xlat4.xz = vec2(_Green_R, _Green_B);
					    u_xlat5.x = dot(u_xlat10_3.xyz, u_xlat4.xyz);
					    u_xlat2.y = u_xlat5.x + _Green_C;
					    u_xlat2.xyz = u_xlat0.xxx * vec3(0.125, 0.125, 0.125) + u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.y * 30.0 + _TimeX;
					    u_xlat5.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat5.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 12.0;
					    u_xlat0.x = u_xlat0.x * 0.0769230798;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * 6.0;
					    u_xlat4.xy = (-u_xlat1.xy) + vec2(1.5, 1.5);
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * u_xlat4.y + 0.5;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat1.z = u_xlat1.x * 1.38888884;
					    u_xlat2.yz = (-u_xlat1.zy);
					    u_xlat2.x = (-u_xlat1.x) * 1.38888884 + (-_Dist);
					    u_xlat1.xy = u_xlat2.xz + vec2(0.694000006, 0.5);
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat15 = u_xlat15 + (-_Size);
					    u_xlat1.x = float(1.0) / (-_Smooth);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat6.x = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = (-u_xlat6.x) * u_xlat15 + 1.0;
					    u_xlat4.x = _Dist + 0.694000006;
					    u_xlat4.y = 0.5;
					    u_xlat6.xy = u_xlat2.yz + u_xlat4.xy;
					    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x + (-_Size);
					    u_xlat1.x = u_xlat1.x * u_xlat6.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat6.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat6.x) * u_xlat1.x + 1.0;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat0.xyz = vec3(u_xlat15) * (-u_xlat0.xyz) + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat10_3.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_3.xyz;
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
					; Bound: 574
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %53 %550 
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
					                                                      OpDecorate vs_TEXCOORD0 Location 53 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %59 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %204 DescriptorSet 204 
					                                                      OpDecorate %204 Binding 204 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %208 DescriptorSet 208 
					                                                      OpDecorate %208 Binding 208 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %219 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %244 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %307 RelaxedPrecision 
					                                                      OpDecorate %542 RelaxedPrecision 
					                                                      OpDecorate %543 RelaxedPrecision 
					                                                      OpDecorate %550 Location 550 
					                                                      OpDecorate %566 RelaxedPrecision 
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
					                                          f32 %19 = OpConstant 3,674022E-40 
					                                          f32 %20 = OpConstant 3,674022E-40 
					                                          f32 %21 = OpConstant 3,674022E-40 
					                                          f32 %22 = OpConstant 3,674022E-40 
					                                        f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
					                                              %25 = OpTypeVector %6 3 
					                                              %26 = OpTypePointer Private %25 
					                               Private f32_3* %27 = OpVariable Private 
					                                              %28 = OpTypeVector %6 2 
					                                              %34 = OpTypeInt 32 0 
					                                          u32 %35 = OpConstant 0 
					                                              %36 = OpTypePointer Private %6 
					                                 Private f32* %43 = OpVariable Private 
					                                          u32 %44 = OpConstant 2 
					                                          f32 %47 = OpConstant 3,674022E-40 
					                                          f32 %49 = OpConstant 3,674022E-40 
					                               Private f32_3* %51 = OpVariable Private 
					                                              %52 = OpTypePointer Input %28 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %55 = OpConstant 17 
					                                              %56 = OpTypePointer Uniform %7 
					                                          u32 %67 = OpConstant 1 
					                                          f32 %70 = OpConstant 3,674022E-40 
					                                          f32 %78 = OpConstant 3,674022E-40 
					                                 Private f32* %89 = OpVariable Private 
					                                          f32 %92 = OpConstant 3,674022E-40 
					                                          f32 %94 = OpConstant 3,674022E-40 
					                                             %113 = OpTypeBool 
					                                             %114 = OpTypeVector %113 2 
					                                             %115 = OpTypePointer Private %114 
					                             Private bool_2* %116 = OpVariable Private 
					                                         f32 %119 = OpConstant 3,674022E-40 
					                                         f32 %120 = OpConstant 3,674022E-40 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                                       f32_4 %122 = OpConstantComposite %119 %120 %121 %121 
					                                             %123 = OpTypeVector %113 4 
					                                         f32 %128 = OpConstant 3,674022E-40 
					                                             %131 = OpTypePointer Private %113 
					                                         f32 %134 = OpConstant 3,674022E-40 
					                                Private f32* %137 = OpVariable Private 
					                                         f32 %140 = OpConstant 3,674022E-40 
					                                         f32 %141 = OpConstant 3,674022E-40 
					                                         f32 %157 = OpConstant 3,674022E-40 
					                              Private f32_3* %171 = OpVariable Private 
					                                             %181 = OpTypePointer Private %28 
					                              Private f32_2* %182 = OpVariable Private 
					                                         f32 %185 = OpConstant 3,674022E-40 
					                                       f32_2 %186 = OpConstantComposite %185 %134 
					                                         f32 %188 = OpConstant 3,674022E-40 
					                                       f32_2 %189 = OpConstantComposite %134 %188 
					                                         f32 %193 = OpConstant 3,674022E-40 
					                                         f32 %194 = OpConstant 3,674022E-40 
					                                       f32_2 %195 = OpConstantComposite %193 %194 
					                                Private f32* %201 = OpVariable Private 
					                                             %202 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %203 = OpTypePointer UniformConstant %202 
					        UniformConstant read_only Texture2D* %204 = OpVariable UniformConstant 
					                                             %206 = OpTypeSampler 
					                                             %207 = OpTypePointer UniformConstant %206 
					                    UniformConstant sampler* %208 = OpVariable UniformConstant 
					                                             %210 = OpTypeSampledImage %202 
					                                Private f32* %216 = OpVariable Private 
					                                         i32 %225 = OpConstant 8 
					                                         i32 %228 = OpConstant 16 
					                                         i32 %234 = OpConstant 7 
					                                         i32 %238 = OpConstant 9 
					                              Private f32_3* %242 = OpVariable Private 
					                                         i32 %256 = OpConstant 12 
					                              Private f32_3* %261 = OpVariable Private 
					                                         i32 %262 = OpConstant 2 
					                                         i32 %270 = OpConstant 1 
					                                         i32 %273 = OpConstant 3 
					                                         i32 %285 = OpConstant 10 
					                                         i32 %290 = OpConstant 5 
					                                         i32 %298 = OpConstant 4 
					                                         i32 %301 = OpConstant 6 
					                                         i32 %313 = OpConstant 11 
					                                         f32 %320 = OpConstant 3,674022E-40 
					                                       f32_3 %321 = OpConstantComposite %320 %320 %320 
					                                         f32 %327 = OpConstant 3,674022E-40 
					                                         f32 %346 = OpConstant 3,674022E-40 
					                                         f32 %351 = OpConstant 3,674022E-40 
					                                         f32 %366 = OpConstant 3,674022E-40 
					                                         f32 %372 = OpConstant 3,674022E-40 
					                                       f32_2 %373 = OpConstantComposite %372 %372 
					                                         f32 %409 = OpConstant 3,674022E-40 
					                                         i32 %421 = OpConstant 15 
					                                         f32 %429 = OpConstant 3,674022E-40 
					                                       f32_2 %430 = OpConstantComposite %429 %185 
					                                         i32 %442 = OpConstant 14 
					                              Private f32_2* %458 = OpVariable Private 
					                                         f32 %460 = OpConstant 3,674022E-40 
					                                             %549 = OpTypePointer Output %7 
					                               Output f32_4* %550 = OpVariable Output 
					                                         i32 %551 = OpConstant 13 
					                                         u32 %570 = OpConstant 3 
					                                             %571 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                        f32_4 %18 = OpCompositeConstruct %17 %17 %17 %17 
					                                        f32_4 %24 = OpFMul %18 %23 
					                                                      OpStore %9 %24 
					                                        f32_4 %29 = OpLoad %9 
					                                        f32_2 %30 = OpVectorShuffle %29 %29 1 3 
					                                        f32_2 %31 = OpExtInst %1 13 %30 
					                                        f32_3 %32 = OpLoad %27 
					                                        f32_3 %33 = OpVectorShuffle %32 %31 3 1 4 
					                                                      OpStore %27 %33 
					                                 Private f32* %37 = OpAccessChain %27 %35 
					                                          f32 %38 = OpLoad %37 
					                                 Uniform f32* %39 = OpAccessChain %12 %14 
					                                          f32 %40 = OpLoad %39 
					                                          f32 %41 = OpFAdd %38 %40 
					                                 Private f32* %42 = OpAccessChain %27 %35 
					                                                      OpStore %42 %41 
					                                 Private f32* %45 = OpAccessChain %27 %44 
					                                          f32 %46 = OpLoad %45 
					                                          f32 %48 = OpFMul %46 %47 
					                                          f32 %50 = OpFAdd %48 %49 
					                                                      OpStore %43 %50 
					                                        f32_2 %54 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %57 = OpAccessChain %12 %55 
					                                        f32_4 %58 = OpLoad %57 
					                                        f32_2 %59 = OpVectorShuffle %58 %58 0 1 
					                                        f32_2 %60 = OpFMul %54 %59 
					                               Uniform f32_4* %61 = OpAccessChain %12 %55 
					                                        f32_4 %62 = OpLoad %61 
					                                        f32_2 %63 = OpVectorShuffle %62 %62 2 3 
					                                        f32_2 %64 = OpFAdd %60 %63 
					                                        f32_3 %65 = OpLoad %51 
					                                        f32_3 %66 = OpVectorShuffle %65 %64 3 4 2 
					                                                      OpStore %51 %66 
					                                 Private f32* %68 = OpAccessChain %51 %67 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %71 = OpFMul %69 %70 
					                                 Private f32* %72 = OpAccessChain %9 %35 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpFAdd %71 %73 
					                                 Private f32* %75 = OpAccessChain %9 %35 
					                                                      OpStore %75 %74 
					                                 Private f32* %76 = OpAccessChain %51 %67 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %79 = OpFMul %77 %78 
					                                 Private f32* %80 = OpAccessChain %9 %44 
					                                          f32 %81 = OpLoad %80 
					                                          f32 %82 = OpFAdd %79 %81 
					                                 Private f32* %83 = OpAccessChain %27 %67 
					                                                      OpStore %83 %82 
					                                        f32_3 %84 = OpLoad %27 
					                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                                        f32_2 %86 = OpExtInst %1 13 %85 
					                                        f32_3 %87 = OpLoad %27 
					                                        f32_3 %88 = OpVectorShuffle %87 %86 3 4 2 
					                                                      OpStore %27 %88 
					                                 Private f32* %90 = OpAccessChain %27 %67 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %93 = OpFMul %91 %92 
					                                          f32 %95 = OpFAdd %93 %94 
					                                                      OpStore %89 %95 
					                                 Private f32* %96 = OpAccessChain %27 %35 
					                                          f32 %97 = OpLoad %96 
					                                 Private f32* %98 = OpAccessChain %9 %35 
					                                          f32 %99 = OpLoad %98 
					                                         f32 %100 = OpFAdd %97 %99 
					                                Private f32* %101 = OpAccessChain %9 %35 
					                                                      OpStore %101 %100 
					                                Private f32* %102 = OpAccessChain %9 %35 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpExtInst %1 8 %103 
					                                Private f32* %105 = OpAccessChain %27 %35 
					                                                      OpStore %105 %104 
					                                Private f32* %106 = OpAccessChain %27 %35 
					                                         f32 %107 = OpLoad %106 
					                                         f32 %108 = OpFNegate %107 
					                                Private f32* %109 = OpAccessChain %9 %35 
					                                         f32 %110 = OpLoad %109 
					                                         f32 %111 = OpFAdd %108 %110 
					                                Private f32* %112 = OpAccessChain %9 %35 
					                                                      OpStore %112 %111 
					                                       f32_4 %117 = OpLoad %9 
					                                       f32_4 %118 = OpVectorShuffle %117 %117 0 0 0 0 
					                                      bool_4 %124 = OpFOrdGreaterThanEqual %118 %122 
					                                      bool_2 %125 = OpVectorShuffle %124 %124 0 1 
					                                                      OpStore %116 %125 
					                                Private f32* %126 = OpAccessChain %9 %35 
					                                         f32 %127 = OpLoad %126 
					                                         f32 %129 = OpFAdd %127 %128 
					                                Private f32* %130 = OpAccessChain %9 %35 
					                                                      OpStore %130 %129 
					                               Private bool* %132 = OpAccessChain %116 %35 
					                                        bool %133 = OpLoad %132 
					                                         f32 %135 = OpSelect %133 %134 %121 
					                                Private f32* %136 = OpAccessChain %27 %35 
					                                                      OpStore %136 %135 
					                               Private bool* %138 = OpAccessChain %116 %67 
					                                        bool %139 = OpLoad %138 
					                                         f32 %142 = OpSelect %139 %140 %141 
					                                                      OpStore %137 %142 
					                                Private f32* %143 = OpAccessChain %27 %35 
					                                         f32 %144 = OpLoad %143 
					                                         f32 %145 = OpLoad %137 
					                                         f32 %146 = OpFAdd %144 %145 
					                                Private f32* %147 = OpAccessChain %27 %35 
					                                                      OpStore %147 %146 
					                                Private f32* %148 = OpAccessChain %27 %35 
					                                         f32 %149 = OpLoad %148 
					                                Private f32* %150 = OpAccessChain %9 %35 
					                                         f32 %151 = OpLoad %150 
					                                         f32 %152 = OpFMul %149 %151 
					                                Private f32* %153 = OpAccessChain %9 %35 
					                                                      OpStore %153 %152 
					                                Private f32* %154 = OpAccessChain %9 %35 
					                                         f32 %155 = OpLoad %154 
					                                         f32 %156 = OpFNegate %155 
					                                         f32 %158 = OpFMul %156 %157 
					                                         f32 %159 = OpFAdd %158 %134 
					                                Private f32* %160 = OpAccessChain %9 %35 
					                                                      OpStore %160 %159 
					                                Private f32* %161 = OpAccessChain %27 %35 
					                                         f32 %162 = OpLoad %161 
					                                Private f32* %163 = OpAccessChain %9 %35 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpFMul %162 %164 
					                                Private f32* %166 = OpAccessChain %9 %35 
					                                                      OpStore %166 %165 
					                                Uniform f32* %167 = OpAccessChain %12 %14 
					                                         f32 %168 = OpLoad %167 
					                                         f32 %169 = OpExtInst %1 14 %168 
					                                Private f32* %170 = OpAccessChain %27 %35 
					                                                      OpStore %170 %169 
					                                Private f32* %172 = OpAccessChain %27 %35 
					                                         f32 %173 = OpLoad %172 
					                                Uniform f32* %174 = OpAccessChain %12 %14 
					                                         f32 %175 = OpLoad %174 
					                                         f32 %176 = OpFMul %173 %175 
					                                Private f32* %177 = OpAccessChain %171 %67 
					                                                      OpStore %177 %176 
					                                Uniform f32* %178 = OpAccessChain %12 %14 
					                                         f32 %179 = OpLoad %178 
					                                Private f32* %180 = OpAccessChain %171 %35 
					                                                      OpStore %180 %179 
					                                       f32_3 %183 = OpLoad %51 
					                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
					                                       f32_2 %187 = OpFMul %184 %186 
					                                       f32_2 %190 = OpFAdd %187 %189 
					                                                      OpStore %182 %190 
					                                       f32_3 %191 = OpLoad %171 
					                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
					                                       f32_2 %196 = OpFMul %192 %195 
					                                       f32_2 %197 = OpLoad %182 
					                                       f32_2 %198 = OpFAdd %196 %197 
					                                       f32_3 %199 = OpLoad %171 
					                                       f32_3 %200 = OpVectorShuffle %199 %198 3 4 2 
					                                                      OpStore %171 %200 
					                         read_only Texture2D %205 = OpLoad %204 
					                                     sampler %209 = OpLoad %208 
					                  read_only Texture2DSampled %211 = OpSampledImage %205 %209 
					                                       f32_3 %212 = OpLoad %171 
					                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
					                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
					                                         f32 %215 = OpCompositeExtract %214 0 
					                                                      OpStore %201 %215 
					                                         f32 %217 = OpLoad %201 
					                                         f32 %218 = OpLoad %201 
					                                         f32 %219 = OpFMul %217 %218 
					                                                      OpStore %216 %219 
					                                         f32 %220 = OpLoad %216 
					                                Private f32* %221 = OpAccessChain %9 %35 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpFMul %220 %222 
					                                Private f32* %224 = OpAccessChain %9 %35 
					                                                      OpStore %224 %223 
					                                Uniform f32* %226 = OpAccessChain %12 %225 
					                                         f32 %227 = OpLoad %226 
					                                Uniform f32* %229 = OpAccessChain %12 %228 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFNegate %230 
					                                         f32 %232 = OpFAdd %227 %231 
					                                Private f32* %233 = OpAccessChain %171 %67 
					                                                      OpStore %233 %232 
					                                Uniform f32* %235 = OpAccessChain %12 %234 
					                                         f32 %236 = OpLoad %235 
					                                Private f32* %237 = OpAccessChain %171 %35 
					                                                      OpStore %237 %236 
					                                Uniform f32* %239 = OpAccessChain %12 %238 
					                                         f32 %240 = OpLoad %239 
					                                Private f32* %241 = OpAccessChain %171 %44 
					                                                      OpStore %241 %240 
					                         read_only Texture2D %243 = OpLoad %204 
					                                     sampler %244 = OpLoad %208 
					                  read_only Texture2DSampled %245 = OpSampledImage %243 %244 
					                                       f32_3 %246 = OpLoad %51 
					                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
					                                       f32_4 %248 = OpImageSampleImplicitLod %245 %247 
					                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
					                                                      OpStore %242 %249 
					                                       f32_3 %250 = OpLoad %242 
					                                       f32_3 %251 = OpLoad %171 
					                                         f32 %252 = OpDot %250 %251 
					                                Private f32* %253 = OpAccessChain %27 %35 
					                                                      OpStore %253 %252 
					                                Private f32* %254 = OpAccessChain %27 %35 
					                                         f32 %255 = OpLoad %254 
					                                Uniform f32* %257 = OpAccessChain %12 %256 
					                                         f32 %258 = OpLoad %257 
					                                         f32 %259 = OpFAdd %255 %258 
					                                Private f32* %260 = OpAccessChain %171 %44 
					                                                      OpStore %260 %259 
					                                Uniform f32* %263 = OpAccessChain %12 %262 
					                                         f32 %264 = OpLoad %263 
					                                Uniform f32* %265 = OpAccessChain %12 %228 
					                                         f32 %266 = OpLoad %265 
					                                         f32 %267 = OpFNegate %266 
					                                         f32 %268 = OpFAdd %264 %267 
					                                Private f32* %269 = OpAccessChain %261 %67 
					                                                      OpStore %269 %268 
					                                Uniform f32* %271 = OpAccessChain %12 %270 
					                                         f32 %272 = OpLoad %271 
					                                Uniform f32* %274 = OpAccessChain %12 %273 
					                                         f32 %275 = OpLoad %274 
					                                       f32_2 %276 = OpCompositeConstruct %272 %275 
					                                       f32_3 %277 = OpLoad %261 
					                                       f32_3 %278 = OpVectorShuffle %277 %276 3 1 4 
					                                                      OpStore %261 %278 
					                                       f32_3 %279 = OpLoad %242 
					                                       f32_3 %280 = OpLoad %261 
					                                         f32 %281 = OpDot %279 %280 
					                                Private f32* %282 = OpAccessChain %27 %35 
					                                                      OpStore %282 %281 
					                                Private f32* %283 = OpAccessChain %27 %35 
					                                         f32 %284 = OpLoad %283 
					                                Uniform f32* %286 = OpAccessChain %12 %285 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFAdd %284 %287 
					                                Private f32* %289 = OpAccessChain %171 %35 
					                                                      OpStore %289 %288 
					                                Uniform f32* %291 = OpAccessChain %12 %290 
					                                         f32 %292 = OpLoad %291 
					                                Uniform f32* %293 = OpAccessChain %12 %228 
					                                         f32 %294 = OpLoad %293 
					                                         f32 %295 = OpFNegate %294 
					                                         f32 %296 = OpFAdd %292 %295 
					                                Private f32* %297 = OpAccessChain %261 %67 
					                                                      OpStore %297 %296 
					                                Uniform f32* %299 = OpAccessChain %12 %298 
					                                         f32 %300 = OpLoad %299 
					                                Uniform f32* %302 = OpAccessChain %12 %301 
					                                         f32 %303 = OpLoad %302 
					                                       f32_2 %304 = OpCompositeConstruct %300 %303 
					                                       f32_3 %305 = OpLoad %261 
					                                       f32_3 %306 = OpVectorShuffle %305 %304 3 1 4 
					                                                      OpStore %261 %306 
					                                       f32_3 %307 = OpLoad %242 
					                                       f32_3 %308 = OpLoad %261 
					                                         f32 %309 = OpDot %307 %308 
					                                Private f32* %310 = OpAccessChain %27 %35 
					                                                      OpStore %310 %309 
					                                Private f32* %311 = OpAccessChain %27 %35 
					                                         f32 %312 = OpLoad %311 
					                                Uniform f32* %314 = OpAccessChain %12 %313 
					                                         f32 %315 = OpLoad %314 
					                                         f32 %316 = OpFAdd %312 %315 
					                                Private f32* %317 = OpAccessChain %171 %67 
					                                                      OpStore %317 %316 
					                                       f32_4 %318 = OpLoad %9 
					                                       f32_3 %319 = OpVectorShuffle %318 %318 0 0 0 
					                                       f32_3 %322 = OpFMul %319 %321 
					                                       f32_3 %323 = OpLoad %171 
					                                       f32_3 %324 = OpFAdd %322 %323 
					                                                      OpStore %171 %324 
					                                Private f32* %325 = OpAccessChain %51 %67 
					                                         f32 %326 = OpLoad %325 
					                                         f32 %328 = OpFMul %326 %327 
					                                Uniform f32* %329 = OpAccessChain %12 %14 
					                                         f32 %330 = OpLoad %329 
					                                         f32 %331 = OpFAdd %328 %330 
					                                Private f32* %332 = OpAccessChain %9 %35 
					                                                      OpStore %332 %331 
					                                Private f32* %333 = OpAccessChain %9 %35 
					                                         f32 %334 = OpLoad %333 
					                                         f32 %335 = OpExtInst %1 8 %334 
					                                Private f32* %336 = OpAccessChain %27 %35 
					                                                      OpStore %336 %335 
					                                Private f32* %337 = OpAccessChain %27 %35 
					                                         f32 %338 = OpLoad %337 
					                                         f32 %339 = OpFNegate %338 
					                                Private f32* %340 = OpAccessChain %9 %35 
					                                         f32 %341 = OpLoad %340 
					                                         f32 %342 = OpFAdd %339 %341 
					                                Private f32* %343 = OpAccessChain %9 %35 
					                                                      OpStore %343 %342 
					                                Private f32* %344 = OpAccessChain %9 %35 
					                                         f32 %345 = OpLoad %344 
					                                         f32 %347 = OpFAdd %345 %346 
					                                Private f32* %348 = OpAccessChain %9 %35 
					                                                      OpStore %348 %347 
					                                Private f32* %349 = OpAccessChain %9 %35 
					                                         f32 %350 = OpLoad %349 
					                                         f32 %352 = OpFMul %350 %351 
					                                Private f32* %353 = OpAccessChain %9 %35 
					                                                      OpStore %353 %352 
					                                       f32_4 %354 = OpLoad %9 
					                                       f32_3 %355 = OpVectorShuffle %354 %354 0 0 0 
					                                       f32_3 %356 = OpLoad %171 
					                                       f32_3 %357 = OpFMul %355 %356 
					                                                      OpStore %171 %357 
					                                Private f32* %358 = OpAccessChain %51 %35 
					                                         f32 %359 = OpLoad %358 
					                                Private f32* %360 = OpAccessChain %51 %67 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpFMul %359 %361 
					                                Private f32* %363 = OpAccessChain %9 %35 
					                                                      OpStore %363 %362 
					                                Private f32* %364 = OpAccessChain %9 %35 
					                                         f32 %365 = OpLoad %364 
					                                         f32 %367 = OpFMul %365 %366 
					                                Private f32* %368 = OpAccessChain %9 %35 
					                                                      OpStore %368 %367 
					                                       f32_3 %369 = OpLoad %51 
					                                       f32_2 %370 = OpVectorShuffle %369 %369 0 1 
					                                       f32_2 %371 = OpFNegate %370 
					                                       f32_2 %374 = OpFAdd %371 %373 
					                                       f32_3 %375 = OpLoad %261 
					                                       f32_3 %376 = OpVectorShuffle %375 %374 3 4 2 
					                                                      OpStore %261 %376 
					                                Private f32* %377 = OpAccessChain %9 %35 
					                                         f32 %378 = OpLoad %377 
					                                Private f32* %379 = OpAccessChain %261 %35 
					                                         f32 %380 = OpLoad %379 
					                                         f32 %381 = OpFMul %378 %380 
					                                Private f32* %382 = OpAccessChain %9 %35 
					                                                      OpStore %382 %381 
					                                Private f32* %383 = OpAccessChain %9 %35 
					                                         f32 %384 = OpLoad %383 
					                                Private f32* %385 = OpAccessChain %261 %67 
					                                         f32 %386 = OpLoad %385 
					                                         f32 %387 = OpFMul %384 %386 
					                                         f32 %388 = OpFAdd %387 %185 
					                                Private f32* %389 = OpAccessChain %9 %35 
					                                                      OpStore %389 %388 
					                                       f32_4 %390 = OpLoad %9 
					                                       f32_3 %391 = OpVectorShuffle %390 %390 0 0 0 
					                                       f32_3 %392 = OpLoad %171 
					                                       f32_3 %393 = OpFMul %391 %392 
					                                                      OpStore %171 %393 
					                                         f32 %394 = OpLoad %89 
					                                       f32_3 %395 = OpCompositeConstruct %394 %394 %394 
					                                       f32_3 %396 = OpLoad %171 
					                                       f32_3 %397 = OpFMul %395 %396 
					                                       f32_4 %398 = OpLoad %9 
					                                       f32_4 %399 = OpVectorShuffle %398 %397 4 5 6 3 
					                                                      OpStore %9 %399 
					                                         f32 %400 = OpLoad %43 
					                                       f32_3 %401 = OpCompositeConstruct %400 %400 %400 
					                                       f32_4 %402 = OpLoad %9 
					                                       f32_3 %403 = OpVectorShuffle %402 %402 0 1 2 
					                                       f32_3 %404 = OpFMul %401 %403 
					                                       f32_4 %405 = OpLoad %9 
					                                       f32_4 %406 = OpVectorShuffle %405 %404 4 5 6 3 
					                                                      OpStore %9 %406 
					                                Private f32* %407 = OpAccessChain %51 %35 
					                                         f32 %408 = OpLoad %407 
					                                         f32 %410 = OpFMul %408 %409 
					                                Private f32* %411 = OpAccessChain %51 %44 
					                                                      OpStore %411 %410 
					                                       f32_3 %412 = OpLoad %51 
					                                       f32_2 %413 = OpVectorShuffle %412 %412 2 1 
					                                       f32_2 %414 = OpFNegate %413 
					                                       f32_3 %415 = OpLoad %171 
					                                       f32_3 %416 = OpVectorShuffle %415 %414 0 3 4 
					                                                      OpStore %171 %416 
					                                Private f32* %417 = OpAccessChain %51 %35 
					                                         f32 %418 = OpLoad %417 
					                                         f32 %419 = OpFNegate %418 
					                                         f32 %420 = OpFMul %419 %409 
					                                Uniform f32* %422 = OpAccessChain %12 %421 
					                                         f32 %423 = OpLoad %422 
					                                         f32 %424 = OpFNegate %423 
					                                         f32 %425 = OpFAdd %420 %424 
					                                Private f32* %426 = OpAccessChain %171 %35 
					                                                      OpStore %426 %425 
					                                       f32_3 %427 = OpLoad %171 
					                                       f32_2 %428 = OpVectorShuffle %427 %427 0 2 
					                                       f32_2 %431 = OpFAdd %428 %430 
					                                       f32_3 %432 = OpLoad %51 
					                                       f32_3 %433 = OpVectorShuffle %432 %431 3 4 2 
					                                                      OpStore %51 %433 
					                                       f32_3 %434 = OpLoad %51 
					                                       f32_2 %435 = OpVectorShuffle %434 %434 0 1 
					                                       f32_3 %436 = OpLoad %51 
					                                       f32_2 %437 = OpVectorShuffle %436 %436 0 1 
					                                         f32 %438 = OpDot %435 %437 
					                                                      OpStore %43 %438 
					                                         f32 %439 = OpLoad %43 
					                                         f32 %440 = OpExtInst %1 31 %439 
					                                                      OpStore %43 %440 
					                                         f32 %441 = OpLoad %43 
					                                Uniform f32* %443 = OpAccessChain %12 %442 
					                                         f32 %444 = OpLoad %443 
					                                         f32 %445 = OpFNegate %444 
					                                         f32 %446 = OpFAdd %441 %445 
					                                                      OpStore %43 %446 
					                                Uniform f32* %447 = OpAccessChain %12 %228 
					                                         f32 %448 = OpLoad %447 
					                                         f32 %449 = OpFNegate %448 
					                                         f32 %450 = OpFDiv %134 %449 
					                                Private f32* %451 = OpAccessChain %51 %35 
					                                                      OpStore %451 %450 
					                                         f32 %452 = OpLoad %43 
					                                Private f32* %453 = OpAccessChain %51 %35 
					                                         f32 %454 = OpLoad %453 
					                                         f32 %455 = OpFMul %452 %454 
					                                                      OpStore %43 %455 
					                                         f32 %456 = OpLoad %43 
					                                         f32 %457 = OpExtInst %1 43 %456 %121 %134 
					                                                      OpStore %43 %457 
					                                         f32 %459 = OpLoad %43 
					                                         f32 %461 = OpFMul %459 %460 
					                                         f32 %462 = OpFAdd %461 %188 
					                                Private f32* %463 = OpAccessChain %458 %35 
					                                                      OpStore %463 %462 
					                                         f32 %464 = OpLoad %43 
					                                         f32 %465 = OpLoad %43 
					                                         f32 %466 = OpFMul %464 %465 
					                                                      OpStore %43 %466 
					                                Private f32* %467 = OpAccessChain %458 %35 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %469 = OpFNegate %468 
					                                         f32 %470 = OpLoad %43 
					                                         f32 %471 = OpFMul %469 %470 
					                                         f32 %472 = OpFAdd %471 %134 
					                                                      OpStore %43 %472 
					                                Uniform f32* %473 = OpAccessChain %12 %421 
					                                         f32 %474 = OpLoad %473 
					                                         f32 %475 = OpFAdd %474 %429 
					                                Private f32* %476 = OpAccessChain %261 %35 
					                                                      OpStore %476 %475 
					                                Private f32* %477 = OpAccessChain %261 %67 
					                                                      OpStore %477 %185 
					                                       f32_3 %478 = OpLoad %171 
					                                       f32_2 %479 = OpVectorShuffle %478 %478 1 2 
					                                       f32_3 %480 = OpLoad %261 
					                                       f32_2 %481 = OpVectorShuffle %480 %480 0 1 
					                                       f32_2 %482 = OpFAdd %479 %481 
					                                                      OpStore %458 %482 
					                                       f32_2 %483 = OpLoad %458 
					                                       f32_2 %484 = OpLoad %458 
					                                         f32 %485 = OpDot %483 %484 
					                                Private f32* %486 = OpAccessChain %458 %35 
					                                                      OpStore %486 %485 
					                                Private f32* %487 = OpAccessChain %458 %35 
					                                         f32 %488 = OpLoad %487 
					                                         f32 %489 = OpExtInst %1 31 %488 
					                                Private f32* %490 = OpAccessChain %458 %35 
					                                                      OpStore %490 %489 
					                                Private f32* %491 = OpAccessChain %458 %35 
					                                         f32 %492 = OpLoad %491 
					                                Uniform f32* %493 = OpAccessChain %12 %442 
					                                         f32 %494 = OpLoad %493 
					                                         f32 %495 = OpFNegate %494 
					                                         f32 %496 = OpFAdd %492 %495 
					                                Private f32* %497 = OpAccessChain %458 %35 
					                                                      OpStore %497 %496 
					                                Private f32* %498 = OpAccessChain %51 %35 
					                                         f32 %499 = OpLoad %498 
					                                Private f32* %500 = OpAccessChain %458 %35 
					                                         f32 %501 = OpLoad %500 
					                                         f32 %502 = OpFMul %499 %501 
					                                Private f32* %503 = OpAccessChain %51 %35 
					                                                      OpStore %503 %502 
					                                Private f32* %504 = OpAccessChain %51 %35 
					                                         f32 %505 = OpLoad %504 
					                                         f32 %506 = OpExtInst %1 43 %505 %121 %134 
					                                Private f32* %507 = OpAccessChain %51 %35 
					                                                      OpStore %507 %506 
					                                Private f32* %508 = OpAccessChain %51 %35 
					                                         f32 %509 = OpLoad %508 
					                                         f32 %510 = OpFMul %509 %460 
					                                         f32 %511 = OpFAdd %510 %188 
					                                Private f32* %512 = OpAccessChain %458 %35 
					                                                      OpStore %512 %511 
					                                Private f32* %513 = OpAccessChain %51 %35 
					                                         f32 %514 = OpLoad %513 
					                                Private f32* %515 = OpAccessChain %51 %35 
					                                         f32 %516 = OpLoad %515 
					                                         f32 %517 = OpFMul %514 %516 
					                                Private f32* %518 = OpAccessChain %51 %35 
					                                                      OpStore %518 %517 
					                                Private f32* %519 = OpAccessChain %458 %35 
					                                         f32 %520 = OpLoad %519 
					                                         f32 %521 = OpFNegate %520 
					                                Private f32* %522 = OpAccessChain %51 %35 
					                                         f32 %523 = OpLoad %522 
					                                         f32 %524 = OpFMul %521 %523 
					                                         f32 %525 = OpFAdd %524 %134 
					                                Private f32* %526 = OpAccessChain %51 %35 
					                                                      OpStore %526 %525 
					                                         f32 %527 = OpLoad %43 
					                                Private f32* %528 = OpAccessChain %51 %35 
					                                         f32 %529 = OpLoad %528 
					                                         f32 %530 = OpFMul %527 %529 
					                                                      OpStore %43 %530 
					                                         f32 %531 = OpLoad %43 
					                                       f32_3 %532 = OpCompositeConstruct %531 %531 %531 
					                                       f32_4 %533 = OpLoad %9 
					                                       f32_3 %534 = OpVectorShuffle %533 %533 0 1 2 
					                                       f32_3 %535 = OpFNegate %534 
					                                       f32_3 %536 = OpFMul %532 %535 
					                                       f32_4 %537 = OpLoad %9 
					                                       f32_3 %538 = OpVectorShuffle %537 %537 0 1 2 
					                                       f32_3 %539 = OpFAdd %536 %538 
					                                       f32_4 %540 = OpLoad %9 
					                                       f32_4 %541 = OpVectorShuffle %540 %539 4 5 6 3 
					                                                      OpStore %9 %541 
					                                       f32_3 %542 = OpLoad %242 
					                                       f32_3 %543 = OpFNegate %542 
					                                       f32_4 %544 = OpLoad %9 
					                                       f32_3 %545 = OpVectorShuffle %544 %544 0 1 2 
					                                       f32_3 %546 = OpFAdd %543 %545 
					                                       f32_4 %547 = OpLoad %9 
					                                       f32_4 %548 = OpVectorShuffle %547 %546 4 5 6 3 
					                                                      OpStore %9 %548 
					                                Uniform f32* %552 = OpAccessChain %12 %551 
					                                         f32 %553 = OpLoad %552 
					                                Uniform f32* %554 = OpAccessChain %12 %551 
					                                         f32 %555 = OpLoad %554 
					                                Uniform f32* %556 = OpAccessChain %12 %551 
					                                         f32 %557 = OpLoad %556 
					                                       f32_3 %558 = OpCompositeConstruct %553 %555 %557 
					                                         f32 %559 = OpCompositeExtract %558 0 
					                                         f32 %560 = OpCompositeExtract %558 1 
					                                         f32 %561 = OpCompositeExtract %558 2 
					                                       f32_3 %562 = OpCompositeConstruct %559 %560 %561 
					                                       f32_4 %563 = OpLoad %9 
					                                       f32_3 %564 = OpVectorShuffle %563 %563 0 1 2 
					                                       f32_3 %565 = OpFMul %562 %564 
					                                       f32_3 %566 = OpLoad %242 
					                                       f32_3 %567 = OpFAdd %565 %566 
					                                       f32_4 %568 = OpLoad %550 
					                                       f32_4 %569 = OpVectorShuffle %568 %567 4 5 6 3 
					                                                      OpStore %550 %569 
					                                 Output f32* %572 = OpAccessChain %550 %570 
					                                                      OpStore %572 %134 
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
						float _Red_R;
						float _Red_G;
						float _Red_B;
						float _Green_R;
						float _Green_G;
						float _Green_B;
						float _Blue_R;
						float _Blue_G;
						float _Blue_B;
						float _Red_C;
						float _Green_C;
						float _Blue_C;
						float _FadeFX;
						float _Size;
						float _Dist;
						float _Smooth;
						vec4 unused_0_18[2];
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec2 u_xlatb2;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					float u_xlat16_5;
					vec2 u_xlat6;
					float u_xlat10;
					vec2 u_xlat12;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(0.25, 0.230000004, 10.0, 110.0);
					    u_xlat5.xz = sin(u_xlat0.yw);
					    u_xlat5.x = u_xlat5.x + _TimeX;
					    u_xlat15 = u_xlat5.z * 0.00999999978 + 0.790000021;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.x = u_xlat1.y * 2.0 + u_xlat0.x;
					    u_xlat5.y = u_xlat1.y * 250.0 + u_xlat0.z;
					    u_xlat5.xy = sin(u_xlat5.xy);
					    u_xlat10 = u_xlat5.y * 0.100000001 + 0.899999976;
					    u_xlat0.x = u_xlat5.x + u_xlat0.x;
					    u_xlat5.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat5.x) + u_xlat0.x;
					    u_xlatb2.xy = greaterThanEqual(u_xlat0.xxxx, vec4(0.400000006, 0.600000024, 0.0, 0.0)).xy;
					    u_xlat0.x = u_xlat0.x + -0.400000006;
					    u_xlat5.x = u_xlatb2.x ? 1.0 : float(0.0);
					    u_xlat16 = (u_xlatb2.y) ? -1.0 : -0.0;
					    u_xlat5.x = u_xlat5.x + u_xlat16;
					    u_xlat0.x = u_xlat5.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) * 4.99999952 + 1.0;
					    u_xlat0.x = u_xlat5.x * u_xlat0.x;
					    u_xlat5.x = cos(_TimeX);
					    u_xlat2.y = u_xlat5.x * _TimeX;
					    u_xlat2.x = _TimeX;
					    u_xlat12.xy = u_xlat1.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat2.xy = u_xlat2.xy * vec2(8.0, 16.0) + u_xlat12.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_5 = u_xlat10_2.x * u_xlat10_2.x;
					    u_xlat0.x = u_xlat16_5 * u_xlat0.x;
					    u_xlat2.y = _Blue_G + (-_Smooth);
					    u_xlat2.x = _Blue_R;
					    u_xlat2.z = _Blue_B;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat5.x = dot(u_xlat10_3.xyz, u_xlat2.xyz);
					    u_xlat2.z = u_xlat5.x + _Blue_C;
					    u_xlat4.y = _Red_G + (-_Smooth);
					    u_xlat4.xz = vec2(_Red_R, _Red_B);
					    u_xlat5.x = dot(u_xlat10_3.xyz, u_xlat4.xyz);
					    u_xlat2.x = u_xlat5.x + _Red_C;
					    u_xlat4.y = _Green_G + (-_Smooth);
					    u_xlat4.xz = vec2(_Green_R, _Green_B);
					    u_xlat5.x = dot(u_xlat10_3.xyz, u_xlat4.xyz);
					    u_xlat2.y = u_xlat5.x + _Green_C;
					    u_xlat2.xyz = u_xlat0.xxx * vec3(0.125, 0.125, 0.125) + u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.y * 30.0 + _TimeX;
					    u_xlat5.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat5.x) + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 12.0;
					    u_xlat0.x = u_xlat0.x * 0.0769230798;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = u_xlat1.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * 6.0;
					    u_xlat4.xy = (-u_xlat1.xy) + vec2(1.5, 1.5);
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat0.x = u_xlat0.x * u_xlat4.y + 0.5;
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat1.z = u_xlat1.x * 1.38888884;
					    u_xlat2.yz = (-u_xlat1.zy);
					    u_xlat2.x = (-u_xlat1.x) * 1.38888884 + (-_Dist);
					    u_xlat1.xy = u_xlat2.xz + vec2(0.694000006, 0.5);
					    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat15 = u_xlat15 + (-_Size);
					    u_xlat1.x = float(1.0) / (-_Smooth);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat6.x = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = (-u_xlat6.x) * u_xlat15 + 1.0;
					    u_xlat4.x = _Dist + 0.694000006;
					    u_xlat4.y = 0.5;
					    u_xlat6.xy = u_xlat2.yz + u_xlat4.xy;
					    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x + (-_Size);
					    u_xlat1.x = u_xlat1.x * u_xlat6.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat6.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat6.x) * u_xlat1.x + 1.0;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat0.xyz = vec3(u_xlat15) * (-u_xlat0.xyz) + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat10_3.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_3.xyz;
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