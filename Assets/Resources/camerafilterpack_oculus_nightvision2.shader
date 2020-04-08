Shader "CameraFilterPack/Oculus_NightVision2" {
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
			GpuProgramID 28164
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat6;
					bvec2 u_xlatb6;
					vec2 u_xlat8;
					float u_xlat12;
					float u_xlat13;
					float u_xlat16_13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = u_xlat0.xy * vec2(0.100000001, 1.0);
					    u_xlat8.x = dot(u_xlat8.xy, vec2(12.9898005, 78.2330017));
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 43758.5469 + _TimeX;
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 0.5 + 0.5;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 1.0;
					    u_xlat1.x = _Blue_R;
					    u_xlat1.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat12 = dot(u_xlat10_2.xyz, u_xlat1.xyz);
					    u_xlat1.z = u_xlat12 + _Blue_C;
					    u_xlat12 = dot(u_xlat10_2.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat1.x = u_xlat12 + _Red_C;
					    u_xlat12 = dot(u_xlat10_2.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat1.y = u_xlat12 + _Green_C;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat8.xxx + (-u_xlat10_2.xyz);
					    u_xlat1.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat1.xyz + u_xlat10_2.xyz;
					    u_xlat2 = vec4(_TimeX) * vec4(0.25, 0.230000004, 10.0, 110.0);
					    u_xlat8.xy = sin(u_xlat2.yw);
					    u_xlat8.x = u_xlat8.x + _TimeX;
					    u_xlat12 = u_xlat8.y * 0.00999999978 + 0.790000021;
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat13 = u_xlat0.y * 2.0 + u_xlat2.x;
					    u_xlat2.x = u_xlat0.y * 300.0 + u_xlat2.z;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * 0.100000001 + 0.899999976;
					    u_xlat8.x = u_xlat8.x + u_xlat13;
					    u_xlat13 = floor(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + (-u_xlat13);
					    u_xlatb6.xy = greaterThanEqual(u_xlat8.xxxx, vec4(0.400000006, 0.600000024, 0.0, 0.0)).xy;
					    u_xlat8.x = u_xlat8.x + -0.400000006;
					    u_xlat13 = u_xlatb6.x ? 1.0 : float(0.0);
					    u_xlat6.x = (u_xlatb6.y) ? -1.0 : -0.0;
					    u_xlat13 = u_xlat13 + u_xlat6.x;
					    u_xlat8.x = u_xlat8.x * u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 4.99999952 + 1.0;
					    u_xlat8.x = u_xlat13 * u_xlat8.x;
					    u_xlat13 = cos(_TimeX);
					    u_xlat3.y = u_xlat13 * _TimeX;
					    u_xlat3.x = _TimeX;
					    u_xlat6.xy = u_xlat0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat6.xy = u_xlat3.xy * vec2(8.0, 16.0) + u_xlat6.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_13 = u_xlat10_3.x * u_xlat10_3.x;
					    u_xlat1.xyz = u_xlat8.xxx * vec3(u_xlat16_13) + u_xlat1.xyz;
					    u_xlat8.x = u_xlat0.y * 30.0 + _TimeX;
					    u_xlat13 = floor(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + (-u_xlat13);
					    u_xlat8.x = u_xlat8.x + 12.0;
					    u_xlat8.x = u_xlat8.x * 0.0769230798;
					    u_xlat1.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = u_xlat0.x * u_xlat0.y;
					    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.5, 1.5);
					    u_xlat8.x = u_xlat8.x * 6.0;
					    u_xlat0.x = u_xlat0.x * u_xlat8.x;
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat0.yy);
					    u_xlat0.x = u_xlat0.x + 0.5;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
					; Bound: 428
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %417 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %15 0 Offset 15 
					                                                      OpMemberDecorate %15 1 Offset 15 
					                                                      OpMemberDecorate %15 2 Offset 15 
					                                                      OpMemberDecorate %15 3 Offset 15 
					                                                      OpMemberDecorate %15 4 Offset 15 
					                                                      OpMemberDecorate %15 5 Offset 15 
					                                                      OpMemberDecorate %15 6 Offset 15 
					                                                      OpMemberDecorate %15 7 Offset 15 
					                                                      OpMemberDecorate %15 8 Offset 15 
					                                                      OpMemberDecorate %15 9 Offset 15 
					                                                      OpMemberDecorate %15 10 Offset 15 
					                                                      OpMemberDecorate %15 11 Offset 15 
					                                                      OpMemberDecorate %15 12 Offset 15 
					                                                      OpMemberDecorate %15 13 Offset 15 
					                                                      OpMemberDecorate %15 14 RelaxedPrecision 
					                                                      OpMemberDecorate %15 14 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %23 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %95 DescriptorSet 95 
					                                                      OpDecorate %95 Binding 95 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %99 RelaxedPrecision 
					                                                      OpDecorate %99 DescriptorSet 99 
					                                                      OpDecorate %99 Binding 99 
					                                                      OpDecorate %100 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %324 RelaxedPrecision 
					                                                      OpDecorate %325 RelaxedPrecision 
					                                                      OpDecorate %326 RelaxedPrecision 
					                                                      OpDecorate %330 RelaxedPrecision 
					                                                      OpDecorate %331 RelaxedPrecision 
					                                                      OpDecorate %332 RelaxedPrecision 
					                                                      OpDecorate %333 RelaxedPrecision 
					                                                      OpDecorate %334 RelaxedPrecision 
					                                                      OpDecorate %337 RelaxedPrecision 
					                                                      OpDecorate %417 Location 417 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeVector %6 4 
					                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %14 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 14 
					                                              %20 = OpTypePointer Uniform %14 
					                                              %31 = OpTypePointer Private %10 
					                               Private f32_2* %32 = OpVariable Private 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                          f32 %36 = OpConstant 3,674022E-40 
					                                        f32_2 %37 = OpConstantComposite %35 %36 
					                                          f32 %40 = OpConstant 3,674022E-40 
					                                          f32 %41 = OpConstant 3,674022E-40 
					                                        f32_2 %42 = OpConstantComposite %40 %41 
					                                              %44 = OpTypeInt 32 0 
					                                          u32 %45 = OpConstant 0 
					                                              %46 = OpTypePointer Private %6 
					                                          f32 %54 = OpConstant 3,674022E-40 
					                                          i32 %56 = OpConstant 0 
					                                              %57 = OpTypePointer Uniform %6 
					                                          f32 %68 = OpConstant 3,674022E-40 
					                               Private f32_3* %78 = OpVariable Private 
					                                          i32 %79 = OpConstant 7 
					                                          i32 %83 = OpConstant 8 
					                                          i32 %86 = OpConstant 9 
					                               Private f32_3* %92 = OpVariable Private 
					                                              %93 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %94 = OpTypePointer UniformConstant %93 
					         UniformConstant read_only Texture2D* %95 = OpVariable UniformConstant 
					                                              %97 = OpTypeSampler 
					                                              %98 = OpTypePointer UniformConstant %97 
					                     UniformConstant sampler* %99 = OpVariable UniformConstant 
					                                             %101 = OpTypeSampledImage %93 
					                                Private f32* %107 = OpVariable Private 
					                                         i32 %112 = OpConstant 12 
					                                         u32 %116 = OpConstant 2 
					                                         i32 %119 = OpConstant 1 
					                                         i32 %122 = OpConstant 2 
					                                         i32 %125 = OpConstant 3 
					                                         i32 %131 = OpConstant 10 
					                                         i32 %137 = OpConstant 4 
					                                         i32 %140 = OpConstant 5 
					                                         i32 %143 = OpConstant 6 
					                                         i32 %149 = OpConstant 11 
					                                         u32 %153 = OpConstant 1 
					                                         i32 %162 = OpConstant 13 
					                                             %178 = OpTypePointer Private %14 
					                              Private f32_4* %179 = OpVariable Private 
					                                         f32 %183 = OpConstant 3,674022E-40 
					                                         f32 %184 = OpConstant 3,674022E-40 
					                                         f32 %185 = OpConstant 3,674022E-40 
					                                         f32 %186 = OpConstant 3,674022E-40 
					                                       f32_4 %187 = OpConstantComposite %183 %184 %185 %186 
					                                         f32 %200 = OpConstant 3,674022E-40 
					                                         f32 %202 = OpConstant 3,674022E-40 
					                                Private f32* %208 = OpVariable Private 
					                                         f32 %211 = OpConstant 3,674022E-40 
					                                         f32 %218 = OpConstant 3,674022E-40 
					                                         f32 %231 = OpConstant 3,674022E-40 
					                                             %248 = OpTypeBool 
					                                             %249 = OpTypeVector %248 2 
					                                             %250 = OpTypePointer Private %249 
					                             Private bool_2* %251 = OpVariable Private 
					                                         f32 %254 = OpConstant 3,674022E-40 
					                                         f32 %255 = OpConstant 3,674022E-40 
					                                         f32 %256 = OpConstant 3,674022E-40 
					                                       f32_4 %257 = OpConstantComposite %254 %255 %256 %256 
					                                             %258 = OpTypeVector %248 4 
					                                         f32 %263 = OpConstant 3,674022E-40 
					                                             %266 = OpTypePointer Private %248 
					                              Private f32_2* %270 = OpVariable Private 
					                                         f32 %273 = OpConstant 3,674022E-40 
					                                         f32 %274 = OpConstant 3,674022E-40 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                              Private f32_2* %301 = OpVariable Private 
					                                       f32_2 %312 = OpConstantComposite %68 %36 
					                                         f32 %314 = OpConstant 3,674022E-40 
					                                       f32_2 %315 = OpConstantComposite %36 %314 
					                                         f32 %318 = OpConstant 3,674022E-40 
					                                         f32 %319 = OpConstant 3,674022E-40 
					                                       f32_2 %320 = OpConstantComposite %318 %319 
					                                Private f32* %324 = OpVariable Private 
					                                Private f32* %331 = OpVariable Private 
					                                         f32 %344 = OpConstant 3,674022E-40 
					                                         f32 %361 = OpConstant 3,674022E-40 
					                                         f32 %366 = OpConstant 3,674022E-40 
					                                         f32 %382 = OpConstant 3,674022E-40 
					                                       f32_2 %383 = OpConstantComposite %382 %382 
					                                         f32 %389 = OpConstant 3,674022E-40 
					                                             %416 = OpTypePointer Output %14 
					                               Output f32_4* %417 = OpVariable Output 
					                                         u32 %424 = OpConstant 3 
					                                             %425 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %21 = OpAccessChain %17 %19 
					                                        f32_4 %22 = OpLoad %21 
					                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
					                                        f32_2 %24 = OpFMul %13 %23 
					                               Uniform f32_4* %25 = OpAccessChain %17 %19 
					                                        f32_4 %26 = OpLoad %25 
					                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
					                                        f32_2 %28 = OpFAdd %24 %27 
					                                        f32_3 %29 = OpLoad %9 
					                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
					                                                      OpStore %9 %30 
					                                        f32_3 %33 = OpLoad %9 
					                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                        f32_2 %38 = OpFMul %34 %37 
					                                                      OpStore %32 %38 
					                                        f32_2 %39 = OpLoad %32 
					                                          f32 %43 = OpDot %39 %42 
					                                 Private f32* %47 = OpAccessChain %32 %45 
					                                                      OpStore %47 %43 
					                                 Private f32* %48 = OpAccessChain %32 %45 
					                                          f32 %49 = OpLoad %48 
					                                          f32 %50 = OpExtInst %1 13 %49 
					                                 Private f32* %51 = OpAccessChain %32 %45 
					                                                      OpStore %51 %50 
					                                 Private f32* %52 = OpAccessChain %32 %45 
					                                          f32 %53 = OpLoad %52 
					                                          f32 %55 = OpFMul %53 %54 
					                                 Uniform f32* %58 = OpAccessChain %17 %56 
					                                          f32 %59 = OpLoad %58 
					                                          f32 %60 = OpFAdd %55 %59 
					                                 Private f32* %61 = OpAccessChain %32 %45 
					                                                      OpStore %61 %60 
					                                 Private f32* %62 = OpAccessChain %32 %45 
					                                          f32 %63 = OpLoad %62 
					                                          f32 %64 = OpExtInst %1 10 %63 
					                                 Private f32* %65 = OpAccessChain %32 %45 
					                                                      OpStore %65 %64 
					                                 Private f32* %66 = OpAccessChain %32 %45 
					                                          f32 %67 = OpLoad %66 
					                                          f32 %69 = OpFMul %67 %68 
					                                          f32 %70 = OpFAdd %69 %68 
					                                 Private f32* %71 = OpAccessChain %32 %45 
					                                                      OpStore %71 %70 
					                                 Private f32* %72 = OpAccessChain %32 %45 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpFNegate %73 
					                                          f32 %75 = OpFMul %74 %68 
					                                          f32 %76 = OpFAdd %75 %36 
					                                 Private f32* %77 = OpAccessChain %32 %45 
					                                                      OpStore %77 %76 
					                                 Uniform f32* %80 = OpAccessChain %17 %79 
					                                          f32 %81 = OpLoad %80 
					                                 Private f32* %82 = OpAccessChain %78 %45 
					                                                      OpStore %82 %81 
					                                 Uniform f32* %84 = OpAccessChain %17 %83 
					                                          f32 %85 = OpLoad %84 
					                                 Uniform f32* %87 = OpAccessChain %17 %86 
					                                          f32 %88 = OpLoad %87 
					                                        f32_2 %89 = OpCompositeConstruct %85 %88 
					                                        f32_3 %90 = OpLoad %78 
					                                        f32_3 %91 = OpVectorShuffle %90 %89 0 3 4 
					                                                      OpStore %78 %91 
					                          read_only Texture2D %96 = OpLoad %95 
					                                     sampler %100 = OpLoad %99 
					                  read_only Texture2DSampled %102 = OpSampledImage %96 %100 
					                                       f32_3 %103 = OpLoad %9 
					                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
					                                       f32_4 %105 = OpImageSampleImplicitLod %102 %104 
					                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
					                                                      OpStore %92 %106 
					                                       f32_3 %108 = OpLoad %92 
					                                       f32_3 %109 = OpLoad %78 
					                                         f32 %110 = OpDot %108 %109 
					                                                      OpStore %107 %110 
					                                         f32 %111 = OpLoad %107 
					                                Uniform f32* %113 = OpAccessChain %17 %112 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %115 = OpFAdd %111 %114 
					                                Private f32* %117 = OpAccessChain %78 %116 
					                                                      OpStore %117 %115 
					                                       f32_3 %118 = OpLoad %92 
					                                Uniform f32* %120 = OpAccessChain %17 %119 
					                                         f32 %121 = OpLoad %120 
					                                Uniform f32* %123 = OpAccessChain %17 %122 
					                                         f32 %124 = OpLoad %123 
					                                Uniform f32* %126 = OpAccessChain %17 %125 
					                                         f32 %127 = OpLoad %126 
					                                       f32_3 %128 = OpCompositeConstruct %121 %124 %127 
					                                         f32 %129 = OpDot %118 %128 
					                                                      OpStore %107 %129 
					                                         f32 %130 = OpLoad %107 
					                                Uniform f32* %132 = OpAccessChain %17 %131 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFAdd %130 %133 
					                                Private f32* %135 = OpAccessChain %78 %45 
					                                                      OpStore %135 %134 
					                                       f32_3 %136 = OpLoad %92 
					                                Uniform f32* %138 = OpAccessChain %17 %137 
					                                         f32 %139 = OpLoad %138 
					                                Uniform f32* %141 = OpAccessChain %17 %140 
					                                         f32 %142 = OpLoad %141 
					                                Uniform f32* %144 = OpAccessChain %17 %143 
					                                         f32 %145 = OpLoad %144 
					                                       f32_3 %146 = OpCompositeConstruct %139 %142 %145 
					                                         f32 %147 = OpDot %136 %146 
					                                                      OpStore %107 %147 
					                                         f32 %148 = OpLoad %107 
					                                Uniform f32* %150 = OpAccessChain %17 %149 
					                                         f32 %151 = OpLoad %150 
					                                         f32 %152 = OpFAdd %148 %151 
					                                Private f32* %154 = OpAccessChain %78 %153 
					                                                      OpStore %154 %152 
					                                       f32_3 %155 = OpLoad %78 
					                                       f32_2 %156 = OpLoad %32 
					                                       f32_3 %157 = OpVectorShuffle %156 %156 0 0 0 
					                                       f32_3 %158 = OpFMul %155 %157 
					                                       f32_3 %159 = OpLoad %92 
					                                       f32_3 %160 = OpFNegate %159 
					                                       f32_3 %161 = OpFAdd %158 %160 
					                                                      OpStore %78 %161 
					                                Uniform f32* %163 = OpAccessChain %17 %162 
					                                         f32 %164 = OpLoad %163 
					                                Uniform f32* %165 = OpAccessChain %17 %162 
					                                         f32 %166 = OpLoad %165 
					                                Uniform f32* %167 = OpAccessChain %17 %162 
					                                         f32 %168 = OpLoad %167 
					                                       f32_3 %169 = OpCompositeConstruct %164 %166 %168 
					                                         f32 %170 = OpCompositeExtract %169 0 
					                                         f32 %171 = OpCompositeExtract %169 1 
					                                         f32 %172 = OpCompositeExtract %169 2 
					                                       f32_3 %173 = OpCompositeConstruct %170 %171 %172 
					                                       f32_3 %174 = OpLoad %78 
					                                       f32_3 %175 = OpFMul %173 %174 
					                                       f32_3 %176 = OpLoad %92 
					                                       f32_3 %177 = OpFAdd %175 %176 
					                                                      OpStore %78 %177 
					                                Uniform f32* %180 = OpAccessChain %17 %56 
					                                         f32 %181 = OpLoad %180 
					                                       f32_4 %182 = OpCompositeConstruct %181 %181 %181 %181 
					                                       f32_4 %188 = OpFMul %182 %187 
					                                                      OpStore %179 %188 
					                                       f32_4 %189 = OpLoad %179 
					                                       f32_2 %190 = OpVectorShuffle %189 %189 1 3 
					                                       f32_2 %191 = OpExtInst %1 13 %190 
					                                                      OpStore %32 %191 
					                                Private f32* %192 = OpAccessChain %32 %45 
					                                         f32 %193 = OpLoad %192 
					                                Uniform f32* %194 = OpAccessChain %17 %56 
					                                         f32 %195 = OpLoad %194 
					                                         f32 %196 = OpFAdd %193 %195 
					                                Private f32* %197 = OpAccessChain %32 %45 
					                                                      OpStore %197 %196 
					                                Private f32* %198 = OpAccessChain %32 %153 
					                                         f32 %199 = OpLoad %198 
					                                         f32 %201 = OpFMul %199 %200 
					                                         f32 %203 = OpFAdd %201 %202 
					                                                      OpStore %107 %203 
					                                Private f32* %204 = OpAccessChain %32 %45 
					                                         f32 %205 = OpLoad %204 
					                                         f32 %206 = OpExtInst %1 13 %205 
					                                Private f32* %207 = OpAccessChain %32 %45 
					                                                      OpStore %207 %206 
					                                Private f32* %209 = OpAccessChain %9 %153 
					                                         f32 %210 = OpLoad %209 
					                                         f32 %212 = OpFMul %210 %211 
					                                Private f32* %213 = OpAccessChain %179 %45 
					                                         f32 %214 = OpLoad %213 
					                                         f32 %215 = OpFAdd %212 %214 
					                                                      OpStore %208 %215 
					                                Private f32* %216 = OpAccessChain %9 %153 
					                                         f32 %217 = OpLoad %216 
					                                         f32 %219 = OpFMul %217 %218 
					                                Private f32* %220 = OpAccessChain %179 %116 
					                                         f32 %221 = OpLoad %220 
					                                         f32 %222 = OpFAdd %219 %221 
					                                Private f32* %223 = OpAccessChain %179 %45 
					                                                      OpStore %223 %222 
					                                Private f32* %224 = OpAccessChain %179 %45 
					                                         f32 %225 = OpLoad %224 
					                                         f32 %226 = OpExtInst %1 13 %225 
					                                Private f32* %227 = OpAccessChain %179 %45 
					                                                      OpStore %227 %226 
					                                Private f32* %228 = OpAccessChain %179 %45 
					                                         f32 %229 = OpLoad %228 
					                                         f32 %230 = OpFMul %229 %35 
					                                         f32 %232 = OpFAdd %230 %231 
					                                Private f32* %233 = OpAccessChain %179 %45 
					                                                      OpStore %233 %232 
					                                Private f32* %234 = OpAccessChain %32 %45 
					                                         f32 %235 = OpLoad %234 
					                                         f32 %236 = OpLoad %208 
					                                         f32 %237 = OpFAdd %235 %236 
					                                Private f32* %238 = OpAccessChain %32 %45 
					                                                      OpStore %238 %237 
					                                Private f32* %239 = OpAccessChain %32 %45 
					                                         f32 %240 = OpLoad %239 
					                                         f32 %241 = OpExtInst %1 8 %240 
					                                                      OpStore %208 %241 
					                                Private f32* %242 = OpAccessChain %32 %45 
					                                         f32 %243 = OpLoad %242 
					                                         f32 %244 = OpLoad %208 
					                                         f32 %245 = OpFNegate %244 
					                                         f32 %246 = OpFAdd %243 %245 
					                                Private f32* %247 = OpAccessChain %32 %45 
					                                                      OpStore %247 %246 
					                                       f32_2 %252 = OpLoad %32 
					                                       f32_4 %253 = OpVectorShuffle %252 %252 0 0 0 0 
					                                      bool_4 %259 = OpFOrdGreaterThanEqual %253 %257 
					                                      bool_2 %260 = OpVectorShuffle %259 %259 0 1 
					                                                      OpStore %251 %260 
					                                Private f32* %261 = OpAccessChain %32 %45 
					                                         f32 %262 = OpLoad %261 
					                                         f32 %264 = OpFAdd %262 %263 
					                                Private f32* %265 = OpAccessChain %32 %45 
					                                                      OpStore %265 %264 
					                               Private bool* %267 = OpAccessChain %251 %45 
					                                        bool %268 = OpLoad %267 
					                                         f32 %269 = OpSelect %268 %36 %256 
					                                                      OpStore %208 %269 
					                               Private bool* %271 = OpAccessChain %251 %153 
					                                        bool %272 = OpLoad %271 
					                                         f32 %275 = OpSelect %272 %273 %274 
					                                Private f32* %276 = OpAccessChain %270 %45 
					                                                      OpStore %276 %275 
					                                         f32 %277 = OpLoad %208 
					                                Private f32* %278 = OpAccessChain %270 %45 
					                                         f32 %279 = OpLoad %278 
					                                         f32 %280 = OpFAdd %277 %279 
					                                                      OpStore %208 %280 
					                                Private f32* %281 = OpAccessChain %32 %45 
					                                         f32 %282 = OpLoad %281 
					                                         f32 %283 = OpLoad %208 
					                                         f32 %284 = OpFMul %282 %283 
					                                Private f32* %285 = OpAccessChain %32 %45 
					                                                      OpStore %285 %284 
					                                Private f32* %286 = OpAccessChain %32 %45 
					                                         f32 %287 = OpLoad %286 
					                                         f32 %288 = OpFNegate %287 
					                                         f32 %290 = OpFMul %288 %289 
					                                         f32 %291 = OpFAdd %290 %36 
					                                Private f32* %292 = OpAccessChain %32 %45 
					                                                      OpStore %292 %291 
					                                         f32 %293 = OpLoad %208 
					                                Private f32* %294 = OpAccessChain %32 %45 
					                                         f32 %295 = OpLoad %294 
					                                         f32 %296 = OpFMul %293 %295 
					                                Private f32* %297 = OpAccessChain %32 %45 
					                                                      OpStore %297 %296 
					                                Uniform f32* %298 = OpAccessChain %17 %56 
					                                         f32 %299 = OpLoad %298 
					                                         f32 %300 = OpExtInst %1 14 %299 
					                                                      OpStore %208 %300 
					                                         f32 %302 = OpLoad %208 
					                                Uniform f32* %303 = OpAccessChain %17 %56 
					                                         f32 %304 = OpLoad %303 
					                                         f32 %305 = OpFMul %302 %304 
					                                Private f32* %306 = OpAccessChain %301 %153 
					                                                      OpStore %306 %305 
					                                Uniform f32* %307 = OpAccessChain %17 %56 
					                                         f32 %308 = OpLoad %307 
					                                Private f32* %309 = OpAccessChain %301 %45 
					                                                      OpStore %309 %308 
					                                       f32_3 %310 = OpLoad %9 
					                                       f32_2 %311 = OpVectorShuffle %310 %310 0 1 
					                                       f32_2 %313 = OpFMul %311 %312 
					                                       f32_2 %316 = OpFAdd %313 %315 
					                                                      OpStore %270 %316 
					                                       f32_2 %317 = OpLoad %301 
					                                       f32_2 %321 = OpFMul %317 %320 
					                                       f32_2 %322 = OpLoad %270 
					                                       f32_2 %323 = OpFAdd %321 %322 
					                                                      OpStore %270 %323 
					                         read_only Texture2D %325 = OpLoad %95 
					                                     sampler %326 = OpLoad %99 
					                  read_only Texture2DSampled %327 = OpSampledImage %325 %326 
					                                       f32_2 %328 = OpLoad %270 
					                                       f32_4 %329 = OpImageSampleImplicitLod %327 %328 
					                                         f32 %330 = OpCompositeExtract %329 0 
					                                                      OpStore %324 %330 
					                                         f32 %332 = OpLoad %324 
					                                         f32 %333 = OpLoad %324 
					                                         f32 %334 = OpFMul %332 %333 
					                                                      OpStore %331 %334 
					                                       f32_2 %335 = OpLoad %32 
					                                       f32_3 %336 = OpVectorShuffle %335 %335 0 0 0 
					                                         f32 %337 = OpLoad %331 
					                                       f32_3 %338 = OpCompositeConstruct %337 %337 %337 
					                                       f32_3 %339 = OpFMul %336 %338 
					                                       f32_3 %340 = OpLoad %78 
					                                       f32_3 %341 = OpFAdd %339 %340 
					                                                      OpStore %78 %341 
					                                Private f32* %342 = OpAccessChain %9 %153 
					                                         f32 %343 = OpLoad %342 
					                                         f32 %345 = OpFMul %343 %344 
					                                Uniform f32* %346 = OpAccessChain %17 %56 
					                                         f32 %347 = OpLoad %346 
					                                         f32 %348 = OpFAdd %345 %347 
					                                Private f32* %349 = OpAccessChain %32 %45 
					                                                      OpStore %349 %348 
					                                Private f32* %350 = OpAccessChain %32 %45 
					                                         f32 %351 = OpLoad %350 
					                                         f32 %352 = OpExtInst %1 8 %351 
					                                                      OpStore %208 %352 
					                                Private f32* %353 = OpAccessChain %32 %45 
					                                         f32 %354 = OpLoad %353 
					                                         f32 %355 = OpLoad %208 
					                                         f32 %356 = OpFNegate %355 
					                                         f32 %357 = OpFAdd %354 %356 
					                                Private f32* %358 = OpAccessChain %32 %45 
					                                                      OpStore %358 %357 
					                                Private f32* %359 = OpAccessChain %32 %45 
					                                         f32 %360 = OpLoad %359 
					                                         f32 %362 = OpFAdd %360 %361 
					                                Private f32* %363 = OpAccessChain %32 %45 
					                                                      OpStore %363 %362 
					                                Private f32* %364 = OpAccessChain %32 %45 
					                                         f32 %365 = OpLoad %364 
					                                         f32 %367 = OpFMul %365 %366 
					                                Private f32* %368 = OpAccessChain %32 %45 
					                                                      OpStore %368 %367 
					                                       f32_2 %369 = OpLoad %32 
					                                       f32_3 %370 = OpVectorShuffle %369 %369 0 0 0 
					                                       f32_3 %371 = OpLoad %78 
					                                       f32_3 %372 = OpFMul %370 %371 
					                                                      OpStore %78 %372 
					                                Private f32* %373 = OpAccessChain %9 %45 
					                                         f32 %374 = OpLoad %373 
					                                Private f32* %375 = OpAccessChain %9 %153 
					                                         f32 %376 = OpLoad %375 
					                                         f32 %377 = OpFMul %374 %376 
					                                Private f32* %378 = OpAccessChain %32 %45 
					                                                      OpStore %378 %377 
					                                       f32_3 %379 = OpLoad %9 
					                                       f32_2 %380 = OpVectorShuffle %379 %379 0 1 
					                                       f32_2 %381 = OpFNegate %380 
					                                       f32_2 %384 = OpFAdd %381 %383 
					                                       f32_3 %385 = OpLoad %9 
					                                       f32_3 %386 = OpVectorShuffle %385 %384 3 4 2 
					                                                      OpStore %9 %386 
					                                Private f32* %387 = OpAccessChain %32 %45 
					                                         f32 %388 = OpLoad %387 
					                                         f32 %390 = OpFMul %388 %389 
					                                Private f32* %391 = OpAccessChain %32 %45 
					                                                      OpStore %391 %390 
					                                Private f32* %392 = OpAccessChain %9 %45 
					                                         f32 %393 = OpLoad %392 
					                                Private f32* %394 = OpAccessChain %32 %45 
					                                         f32 %395 = OpLoad %394 
					                                         f32 %396 = OpFMul %393 %395 
					                                Private f32* %397 = OpAccessChain %9 %45 
					                                                      OpStore %397 %396 
					                                       f32_3 %398 = OpLoad %9 
					                                       f32_2 %399 = OpVectorShuffle %398 %398 0 0 
					                                       f32_3 %400 = OpLoad %9 
					                                       f32_2 %401 = OpVectorShuffle %400 %400 1 1 
					                                         f32 %402 = OpDot %399 %401 
					                                Private f32* %403 = OpAccessChain %9 %45 
					                                                      OpStore %403 %402 
					                                Private f32* %404 = OpAccessChain %9 %45 
					                                         f32 %405 = OpLoad %404 
					                                         f32 %406 = OpFAdd %405 %68 
					                                Private f32* %407 = OpAccessChain %9 %45 
					                                                      OpStore %407 %406 
					                                       f32_3 %408 = OpLoad %9 
					                                       f32_3 %409 = OpVectorShuffle %408 %408 0 0 0 
					                                       f32_3 %410 = OpLoad %78 
					                                       f32_3 %411 = OpFMul %409 %410 
					                                                      OpStore %9 %411 
					                                       f32_4 %412 = OpLoad %179 
					                                       f32_3 %413 = OpVectorShuffle %412 %412 0 0 0 
					                                       f32_3 %414 = OpLoad %9 
					                                       f32_3 %415 = OpFMul %413 %414 
					                                                      OpStore %9 %415 
					                                         f32 %418 = OpLoad %107 
					                                       f32_3 %419 = OpCompositeConstruct %418 %418 %418 
					                                       f32_3 %420 = OpLoad %9 
					                                       f32_3 %421 = OpFMul %419 %420 
					                                       f32_4 %422 = OpLoad %417 
					                                       f32_4 %423 = OpVectorShuffle %422 %421 4 5 6 3 
					                                                      OpStore %417 %423 
					                                 Output f32* %426 = OpAccessChain %417 %424 
					                                                      OpStore %426 %36 
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
						vec4 unused_0_15;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat6;
					bvec2 u_xlatb6;
					vec2 u_xlat8;
					float u_xlat12;
					float u_xlat13;
					float u_xlat16_13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = u_xlat0.xy * vec2(0.100000001, 1.0);
					    u_xlat8.x = dot(u_xlat8.xy, vec2(12.9898005, 78.2330017));
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 43758.5469 + _TimeX;
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 0.5 + 0.5;
					    u_xlat8.x = (-u_xlat8.x) * 0.5 + 1.0;
					    u_xlat1.x = _Blue_R;
					    u_xlat1.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat12 = dot(u_xlat10_2.xyz, u_xlat1.xyz);
					    u_xlat1.z = u_xlat12 + _Blue_C;
					    u_xlat12 = dot(u_xlat10_2.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat1.x = u_xlat12 + _Red_C;
					    u_xlat12 = dot(u_xlat10_2.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat1.y = u_xlat12 + _Green_C;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat8.xxx + (-u_xlat10_2.xyz);
					    u_xlat1.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat1.xyz + u_xlat10_2.xyz;
					    u_xlat2 = vec4(_TimeX) * vec4(0.25, 0.230000004, 10.0, 110.0);
					    u_xlat8.xy = sin(u_xlat2.yw);
					    u_xlat8.x = u_xlat8.x + _TimeX;
					    u_xlat12 = u_xlat8.y * 0.00999999978 + 0.790000021;
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat13 = u_xlat0.y * 2.0 + u_xlat2.x;
					    u_xlat2.x = u_xlat0.y * 300.0 + u_xlat2.z;
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * 0.100000001 + 0.899999976;
					    u_xlat8.x = u_xlat8.x + u_xlat13;
					    u_xlat13 = floor(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + (-u_xlat13);
					    u_xlatb6.xy = greaterThanEqual(u_xlat8.xxxx, vec4(0.400000006, 0.600000024, 0.0, 0.0)).xy;
					    u_xlat8.x = u_xlat8.x + -0.400000006;
					    u_xlat13 = u_xlatb6.x ? 1.0 : float(0.0);
					    u_xlat6.x = (u_xlatb6.y) ? -1.0 : -0.0;
					    u_xlat13 = u_xlat13 + u_xlat6.x;
					    u_xlat8.x = u_xlat8.x * u_xlat13;
					    u_xlat8.x = (-u_xlat8.x) * 4.99999952 + 1.0;
					    u_xlat8.x = u_xlat13 * u_xlat8.x;
					    u_xlat13 = cos(_TimeX);
					    u_xlat3.y = u_xlat13 * _TimeX;
					    u_xlat3.x = _TimeX;
					    u_xlat6.xy = u_xlat0.xy * vec2(0.5, 1.0) + vec2(1.0, 3.0);
					    u_xlat6.xy = u_xlat3.xy * vec2(8.0, 16.0) + u_xlat6.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_13 = u_xlat10_3.x * u_xlat10_3.x;
					    u_xlat1.xyz = u_xlat8.xxx * vec3(u_xlat16_13) + u_xlat1.xyz;
					    u_xlat8.x = u_xlat0.y * 30.0 + _TimeX;
					    u_xlat13 = floor(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + (-u_xlat13);
					    u_xlat8.x = u_xlat8.x + 12.0;
					    u_xlat8.x = u_xlat8.x * 0.0769230798;
					    u_xlat1.xyz = u_xlat8.xxx * u_xlat1.xyz;
					    u_xlat8.x = u_xlat0.x * u_xlat0.y;
					    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.5, 1.5);
					    u_xlat8.x = u_xlat8.x * 6.0;
					    u_xlat0.x = u_xlat0.x * u_xlat8.x;
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat0.yy);
					    u_xlat0.x = u_xlat0.x + 0.5;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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