Shader "CameraFilterPack/Drawing_Curve" {
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
			GpuProgramID 59118
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bvec4 u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat10_3;
					bvec4 u_xlatb3;
					vec2 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat7;
					bvec3 u_xlatb7;
					bool u_xlatb10;
					vec2 u_xlat11;
					bvec2 u_xlatb11;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD0.xyx * _MainTex_ST.xyx + _MainTex_ST.zwz;
					    u_xlat1.xyz = u_xlat0.yyz * vec3(0.707099974, -10.0, 10.0);
					    u_xlat15 = u_xlat0.z * -0.707099974 + (-u_xlat1.x);
					    u_xlat1.xyz = sin(u_xlat1.yzy);
					    u_xlat15 = u_xlat15 * 10.0;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat16 = dot(u_xlat0.zy, vec2(0.707099974, -0.707099974));
					    u_xlat16 = _Value * 0.000195312503 + u_xlat16;
					    u_xlat15 = (-u_xlat15) * 0.0299999993 + u_xlat16;
					    u_xlat2.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.001953125, 0.000390625006, 0.000781250012);
					    u_xlat15 = u_xlat15 / u_xlat2.x;
					    u_xlatb16 = u_xlat15>=(-u_xlat15);
					    u_xlat15 = fract(abs(u_xlat15));
					    u_xlat15 = (u_xlatb16) ? u_xlat15 : (-u_xlat15);
					    u_xlat15 = u_xlat2.x * u_xlat15;
					    u_xlat16 = _Value * 0.000390625006 + (-u_xlat15);
					    u_xlatb15 = u_xlat15<u_xlat2.y;
					    u_xlat16 = u_xlat16 / u_xlat2.y;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat16 = u_xlat16 * 0.333333343;
					    u_xlat16 = abs(u_xlat16) + 0.833333313;
					    u_xlat16 = min(u_xlat16, 1.0);
					    u_xlat10_3 = texture(_MainTex, u_xlat0.zy);
					    u_xlat7 = dot(u_xlat10_3.xzy, vec3(0.300000012, 0.300000012, 0.400000006));
					    u_xlatb3 = lessThan(vec4(u_xlat7), vec4(0.75, 0.629999995, 0.50999999, 0.390000015));
					    u_xlatb7.xz = lessThan(vec4(u_xlat7), vec4(0.270000011, 0.0, 0.150000036, 0.150000036)).xz;
					    u_xlatb15 = u_xlatb15 && u_xlatb3.x;
					    u_xlat15 = (u_xlatb15) ? u_xlat16 : 1.0;
					    u_xlat4.xy = vec2(vec2(_Value, _Value)) * vec2(0.000390625006, 0.000781250012) + u_xlat0.zy;
					    u_xlat0.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.000585937523, 0.0009765625, 0.00117187505) + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat1.xyz) * vec3(0.0299999993, 0.0299999993, 0.0299999993) + u_xlat0.xyz;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(0.0299999993, 0.0299999993) + u_xlat4.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xx;
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat2.xxx;
					    u_xlatb11.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat2.xx * u_xlat1.xy;
					    u_xlat11.x = _Value * 0.000781250012 + (-u_xlat1.x);
					    u_xlat11.x = u_xlat11.x / u_xlat2.z;
					    u_xlat11.x = u_xlat11.x + -0.5;
					    u_xlat11.x = u_xlat11.x * 1.66666663;
					    u_xlat11.x = abs(u_xlat11.x) + 0.166666701;
					    u_xlat11.x = min(u_xlat15, u_xlat11.x);
					    u_xlatb1.x = u_xlat1.x<u_xlat2.z;
					    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
					    u_xlat15 = (u_xlatb1.x) ? u_xlat11.x : u_xlat15;
					    u_xlatb1.xzw = greaterThanEqual(u_xlat0.xxyz, (-u_xlat0.xxyz)).xzw;
					    u_xlat0.xyz = fract(abs(u_xlat0.xyz));
					    {
					        vec3 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb1.z) ? u_xlat0.y : (-u_xlat0.y);
					        hlslcc_movcTemp.z = (u_xlatb1.w) ? u_xlat0.z : (-u_xlat0.z);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
					    u_xlat1.x = _Value * 0.00117187505 + (-u_xlat0.x);
					    u_xlat11.xy = vec2(vec2(_Value, _Value)) * vec2(0.00117187505, 0.00156250002);
					    u_xlat1.x = u_xlat1.x / u_xlat11.x;
					    u_xlat1.x = u_xlat1.x + -0.5;
					    u_xlat1.x = u_xlat1.x + u_xlat1.x;
					    u_xlat1.x = min(u_xlat15, abs(u_xlat1.x));
					    u_xlatb0 = u_xlat0.x<u_xlat11.x;
					    u_xlatb0 = u_xlatb3.z && u_xlatb0;
					    u_xlat0.x = (u_xlatb0) ? u_xlat1.x : u_xlat15;
					    u_xlat15 = _Value * 0.00156250002 + (-u_xlat1.y);
					    u_xlatb1.x = u_xlat1.y<u_xlat11.y;
					    u_xlat15 = u_xlat15 / u_xlat11.y;
					    u_xlat15 = u_xlat15 + -0.5;
					    u_xlat15 = u_xlat15 * 2.5;
					    u_xlat15 = abs(u_xlat15) + -0.249999985;
					    u_xlat15 = min(u_xlat0.x, u_xlat15);
					    u_xlatb1.x = u_xlatb3.w && u_xlatb1.x;
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat15 : u_xlat0.x;
					    u_xlat15 = _Value * 0.001953125 + (-u_xlat0.y);
					    u_xlat15 = u_xlat15 / u_xlat2.x;
					    u_xlatb5 = u_xlat0.y<u_xlat2.x;
					    u_xlatb5 = u_xlatb7.x && u_xlatb5;
					    u_xlat15 = u_xlat15 + -0.5;
					    u_xlat15 = u_xlat15 * 3.33333325;
					    u_xlat15 = abs(u_xlat15) + -0.666666627;
					    u_xlat15 = min(u_xlat0.x, u_xlat15);
					    u_xlat0.x = (u_xlatb5) ? u_xlat15 : u_xlat0.x;
					    u_xlat5 = _Value * 0.00234375009 + (-u_xlat0.z);
					    u_xlat15 = _Value * 0.00234375009;
					    u_xlat5 = u_xlat5 / u_xlat15;
					    u_xlatb10 = u_xlat0.z<u_xlat15;
					    u_xlatb10 = u_xlatb7.z && u_xlatb10;
					    u_xlat5 = u_xlat5 + -0.5;
					    u_xlat5 = u_xlat5 * 5.0;
					    u_xlat5 = abs(u_xlat5) + -1.5;
					    u_xlat5 = min(u_xlat0.x, u_xlat5);
					    SV_Target0.xyz = (bool(u_xlatb10)) ? vec3(u_xlat5) : u_xlat0.xxx;
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
					; Bound: 639
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %12 %623 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 12 
					                                              OpMemberDecorate %16 0 Offset 16 
					                                              OpMemberDecorate %16 1 RelaxedPrecision 
					                                              OpMemberDecorate %16 1 Offset 16 
					                                              OpDecorate %16 Block 
					                                              OpDecorate %18 DescriptorSet 18 
					                                              OpDecorate %18 Binding 18 
					                                              OpDecorate %23 RelaxedPrecision 
					                                              OpDecorate %24 RelaxedPrecision 
					                                              OpDecorate %27 RelaxedPrecision 
					                                              OpDecorate %28 RelaxedPrecision 
					                                              OpDecorate %151 RelaxedPrecision 
					                                              OpDecorate %154 RelaxedPrecision 
					                                              OpDecorate %154 DescriptorSet 154 
					                                              OpDecorate %154 Binding 154 
					                                              OpDecorate %155 RelaxedPrecision 
					                                              OpDecorate %158 RelaxedPrecision 
					                                              OpDecorate %158 DescriptorSet 158 
					                                              OpDecorate %158 Binding 158 
					                                              OpDecorate %159 RelaxedPrecision 
					                                              OpDecorate %165 RelaxedPrecision 
					                                              OpDecorate %167 RelaxedPrecision 
					                                              OpDecorate %168 RelaxedPrecision 
					                                              OpDecorate %172 RelaxedPrecision 
					                                              OpDecorate %623 Location 623 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 3 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_3* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 2 
					                                      %11 = OpTypePointer Input %10 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %15 = OpTypeVector %6 4 
					                                      %16 = OpTypeStruct %6 %15 
					                                      %17 = OpTypePointer Uniform %16 
					        Uniform struct {f32; f32_4;}* %18 = OpVariable Uniform 
					                                      %19 = OpTypeInt 32 1 
					                                  i32 %20 = OpConstant 1 
					                                      %21 = OpTypePointer Uniform %15 
					                       Private f32_3* %30 = OpVariable Private 
					                                  f32 %33 = OpConstant 3,674022E-40 
					                                  f32 %34 = OpConstant 3,674022E-40 
					                                  f32 %35 = OpConstant 3,674022E-40 
					                                f32_3 %36 = OpConstantComposite %33 %34 %35 
					                                      %38 = OpTypePointer Private %6 
					                         Private f32* %39 = OpVariable Private 
					                                      %40 = OpTypeInt 32 0 
					                                  u32 %41 = OpConstant 2 
					                                  f32 %44 = OpConstant 3,674022E-40 
					                                  u32 %46 = OpConstant 0 
					                         Private f32* %58 = OpVariable Private 
					                                f32_2 %61 = OpConstantComposite %33 %44 
					                                  i32 %63 = OpConstant 0 
					                                      %64 = OpTypePointer Uniform %6 
					                                  f32 %67 = OpConstant 3,674022E-40 
					                                  f32 %73 = OpConstant 3,674022E-40 
					                       Private f32_3* %77 = OpVariable Private 
					                                  f32 %89 = OpConstant 3,674022E-40 
					                                  f32 %90 = OpConstant 3,674022E-40 
					                                  f32 %91 = OpConstant 3,674022E-40 
					                                f32_3 %92 = OpConstantComposite %89 %90 %91 
					                                      %98 = OpTypeBool 
					                                      %99 = OpTypePointer Private %98 
					                       Private bool* %100 = OpVariable Private 
					                                     %109 = OpTypePointer Function %6 
					                       Private bool* %128 = OpVariable Private 
					                                 u32 %130 = OpConstant 1 
					                                 f32 %139 = OpConstant 3,674022E-40 
					                                 f32 %142 = OpConstant 3,674022E-40 
					                                 f32 %146 = OpConstant 3,674022E-40 
					                                 f32 %149 = OpConstant 3,674022E-40 
					                      Private f32_3* %151 = OpVariable Private 
					                                     %152 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %153 = OpTypePointer UniformConstant %152 
					UniformConstant read_only Texture2D* %154 = OpVariable UniformConstant 
					                                     %156 = OpTypeSampler 
					                                     %157 = OpTypePointer UniformConstant %156 
					            UniformConstant sampler* %158 = OpVariable UniformConstant 
					                                     %160 = OpTypeSampledImage %152 
					                        Private f32* %166 = OpVariable Private 
					                                 f32 %169 = OpConstant 3,674022E-40 
					                                 f32 %170 = OpConstant 3,674022E-40 
					                               f32_3 %171 = OpConstantComposite %169 %169 %170 
					                                     %173 = OpTypeVector %98 4 
					                                     %174 = OpTypePointer Private %173 
					                     Private bool_4* %175 = OpVariable Private 
					                                 f32 %178 = OpConstant 3,674022E-40 
					                                 f32 %179 = OpConstant 3,674022E-40 
					                                 f32 %180 = OpConstant 3,674022E-40 
					                                 f32 %181 = OpConstant 3,674022E-40 
					                               f32_4 %182 = OpConstantComposite %178 %179 %180 %181 
					                                     %184 = OpTypeVector %98 3 
					                                     %185 = OpTypePointer Private %184 
					                     Private bool_3* %186 = OpVariable Private 
					                                 f32 %189 = OpConstant 3,674022E-40 
					                                 f32 %190 = OpConstant 3,674022E-40 
					                                 f32 %191 = OpConstant 3,674022E-40 
					                               f32_4 %192 = OpConstantComposite %189 %190 %191 %191 
					                                     %194 = OpTypeVector %98 2 
					                                     %205 = OpTypePointer Private %10 
					                      Private f32_2* %206 = OpVariable Private 
					                               f32_2 %215 = OpConstantComposite %90 %91 
					                                 f32 %231 = OpConstant 3,674022E-40 
					                                 f32 %232 = OpConstant 3,674022E-40 
					                                 f32 %233 = OpConstant 3,674022E-40 
					                               f32_3 %234 = OpConstantComposite %231 %232 %233 
					                               f32_3 %240 = OpConstantComposite %73 %73 %73 
					                               f32_2 %247 = OpConstantComposite %73 %73 
					                                     %264 = OpTypePointer Private %194 
					                     Private bool_2* %265 = OpVariable Private 
					                                     %279 = OpTypePointer Function %7 
					                      Private f32_2* %316 = OpVariable Private 
					                                 f32 %337 = OpConstant 3,674022E-40 
					                                 f32 %343 = OpConstant 3,674022E-40 
					                     Private bool_4* %351 = OpVariable Private 
					                                 u32 %414 = OpConstant 3 
					                                 f32 %449 = OpConstant 3,674022E-40 
					                               f32_2 %450 = OpConstantComposite %233 %449 
					                       Private bool* %474 = OpVariable Private 
					                                 f32 %514 = OpConstant 3,674022E-40 
					                                 f32 %518 = OpConstant 3,674022E-40 
					                       Private bool* %552 = OpVariable Private 
					                                 f32 %565 = OpConstant 3,674022E-40 
					                                 f32 %569 = OpConstant 3,674022E-40 
					                        Private f32* %585 = OpVariable Private 
					                                 f32 %588 = OpConstant 3,674022E-40 
					                       Private bool* %600 = OpVariable Private 
					                                 f32 %612 = OpConstant 3,674022E-40 
					                                 f32 %616 = OpConstant 3,674022E-40 
					                                     %622 = OpTypePointer Output %15 
					                       Output f32_4* %623 = OpVariable Output 
					                                     %636 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Function f32* %110 = OpVariable Function 
					                     Function f32_3* %280 = OpVariable Function 
					                       Function f32* %284 = OpVariable Function 
					                       Function f32* %297 = OpVariable Function 
					                       Function f32* %366 = OpVariable Function 
					                     Function f32_3* %386 = OpVariable Function 
					                       Function f32* %390 = OpVariable Function 
					                       Function f32* %403 = OpVariable Function 
					                       Function f32* %417 = OpVariable Function 
					                       Function f32* %485 = OpVariable Function 
					                       Function f32* %532 = OpVariable Function 
					                       Function f32* %576 = OpVariable Function 
					                     Function f32_3* %625 = OpVariable Function 
					                                f32_2 %13 = OpLoad vs_TEXCOORD0 
					                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 0 
					                       Uniform f32_4* %22 = OpAccessChain %18 %20 
					                                f32_4 %23 = OpLoad %22 
					                                f32_3 %24 = OpVectorShuffle %23 %23 0 1 0 
					                                f32_3 %25 = OpFMul %14 %24 
					                       Uniform f32_4* %26 = OpAccessChain %18 %20 
					                                f32_4 %27 = OpLoad %26 
					                                f32_3 %28 = OpVectorShuffle %27 %27 2 3 2 
					                                f32_3 %29 = OpFAdd %25 %28 
					                                              OpStore %9 %29 
					                                f32_3 %31 = OpLoad %9 
					                                f32_3 %32 = OpVectorShuffle %31 %31 1 1 2 
					                                f32_3 %37 = OpFMul %32 %36 
					                                              OpStore %30 %37 
					                         Private f32* %42 = OpAccessChain %9 %41 
					                                  f32 %43 = OpLoad %42 
					                                  f32 %45 = OpFMul %43 %44 
					                         Private f32* %47 = OpAccessChain %30 %46 
					                                  f32 %48 = OpLoad %47 
					                                  f32 %49 = OpFNegate %48 
					                                  f32 %50 = OpFAdd %45 %49 
					                                              OpStore %39 %50 
					                                f32_3 %51 = OpLoad %30 
					                                f32_3 %52 = OpVectorShuffle %51 %51 1 2 1 
					                                f32_3 %53 = OpExtInst %1 13 %52 
					                                              OpStore %30 %53 
					                                  f32 %54 = OpLoad %39 
					                                  f32 %55 = OpFMul %54 %35 
					                                              OpStore %39 %55 
					                                  f32 %56 = OpLoad %39 
					                                  f32 %57 = OpExtInst %1 13 %56 
					                                              OpStore %39 %57 
					                                f32_3 %59 = OpLoad %9 
					                                f32_2 %60 = OpVectorShuffle %59 %59 2 1 
					                                  f32 %62 = OpDot %60 %61 
					                                              OpStore %58 %62 
					                         Uniform f32* %65 = OpAccessChain %18 %63 
					                                  f32 %66 = OpLoad %65 
					                                  f32 %68 = OpFMul %66 %67 
					                                  f32 %69 = OpLoad %58 
					                                  f32 %70 = OpFAdd %68 %69 
					                                              OpStore %58 %70 
					                                  f32 %71 = OpLoad %39 
					                                  f32 %72 = OpFNegate %71 
					                                  f32 %74 = OpFMul %72 %73 
					                                  f32 %75 = OpLoad %58 
					                                  f32 %76 = OpFAdd %74 %75 
					                                              OpStore %39 %76 
					                         Uniform f32* %78 = OpAccessChain %18 %63 
					                                  f32 %79 = OpLoad %78 
					                         Uniform f32* %80 = OpAccessChain %18 %63 
					                                  f32 %81 = OpLoad %80 
					                         Uniform f32* %82 = OpAccessChain %18 %63 
					                                  f32 %83 = OpLoad %82 
					                                f32_3 %84 = OpCompositeConstruct %79 %81 %83 
					                                  f32 %85 = OpCompositeExtract %84 0 
					                                  f32 %86 = OpCompositeExtract %84 1 
					                                  f32 %87 = OpCompositeExtract %84 2 
					                                f32_3 %88 = OpCompositeConstruct %85 %86 %87 
					                                f32_3 %93 = OpFMul %88 %92 
					                                              OpStore %77 %93 
					                                  f32 %94 = OpLoad %39 
					                         Private f32* %95 = OpAccessChain %77 %46 
					                                  f32 %96 = OpLoad %95 
					                                  f32 %97 = OpFDiv %94 %96 
					                                              OpStore %39 %97 
					                                 f32 %101 = OpLoad %39 
					                                 f32 %102 = OpLoad %39 
					                                 f32 %103 = OpFNegate %102 
					                                bool %104 = OpFOrdGreaterThanEqual %101 %103 
					                                              OpStore %100 %104 
					                                 f32 %105 = OpLoad %39 
					                                 f32 %106 = OpExtInst %1 4 %105 
					                                 f32 %107 = OpExtInst %1 10 %106 
					                                              OpStore %39 %107 
					                                bool %108 = OpLoad %100 
					                                              OpSelectionMerge %112 None 
					                                              OpBranchConditional %108 %111 %114 
					                                     %111 = OpLabel 
					                                 f32 %113 = OpLoad %39 
					                                              OpStore %110 %113 
					                                              OpBranch %112 
					                                     %114 = OpLabel 
					                                 f32 %115 = OpLoad %39 
					                                 f32 %116 = OpFNegate %115 
					                                              OpStore %110 %116 
					                                              OpBranch %112 
					                                     %112 = OpLabel 
					                                 f32 %117 = OpLoad %110 
					                                              OpStore %39 %117 
					                        Private f32* %118 = OpAccessChain %77 %46 
					                                 f32 %119 = OpLoad %118 
					                                 f32 %120 = OpLoad %39 
					                                 f32 %121 = OpFMul %119 %120 
					                                              OpStore %39 %121 
					                        Uniform f32* %122 = OpAccessChain %18 %63 
					                                 f32 %123 = OpLoad %122 
					                                 f32 %124 = OpFMul %123 %90 
					                                 f32 %125 = OpLoad %39 
					                                 f32 %126 = OpFNegate %125 
					                                 f32 %127 = OpFAdd %124 %126 
					                                              OpStore %58 %127 
					                                 f32 %129 = OpLoad %39 
					                        Private f32* %131 = OpAccessChain %77 %130 
					                                 f32 %132 = OpLoad %131 
					                                bool %133 = OpFOrdLessThan %129 %132 
					                                              OpStore %128 %133 
					                                 f32 %134 = OpLoad %58 
					                        Private f32* %135 = OpAccessChain %77 %130 
					                                 f32 %136 = OpLoad %135 
					                                 f32 %137 = OpFDiv %134 %136 
					                                              OpStore %58 %137 
					                                 f32 %138 = OpLoad %58 
					                                 f32 %140 = OpFAdd %138 %139 
					                                              OpStore %58 %140 
					                                 f32 %141 = OpLoad %58 
					                                 f32 %143 = OpFMul %141 %142 
					                                              OpStore %58 %143 
					                                 f32 %144 = OpLoad %58 
					                                 f32 %145 = OpExtInst %1 4 %144 
					                                 f32 %147 = OpFAdd %145 %146 
					                                              OpStore %58 %147 
					                                 f32 %148 = OpLoad %58 
					                                 f32 %150 = OpExtInst %1 37 %148 %149 
					                                              OpStore %58 %150 
					                 read_only Texture2D %155 = OpLoad %154 
					                             sampler %159 = OpLoad %158 
					          read_only Texture2DSampled %161 = OpSampledImage %155 %159 
					                               f32_3 %162 = OpLoad %9 
					                               f32_2 %163 = OpVectorShuffle %162 %162 2 1 
					                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
					                               f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
					                                              OpStore %151 %165 
					                               f32_3 %167 = OpLoad %151 
					                               f32_3 %168 = OpVectorShuffle %167 %167 0 2 1 
					                                 f32 %172 = OpDot %168 %171 
					                                              OpStore %166 %172 
					                                 f32 %176 = OpLoad %166 
					                               f32_4 %177 = OpCompositeConstruct %176 %176 %176 %176 
					                              bool_4 %183 = OpFOrdLessThan %177 %182 
					                                              OpStore %175 %183 
					                                 f32 %187 = OpLoad %166 
					                               f32_4 %188 = OpCompositeConstruct %187 %187 %187 %187 
					                              bool_4 %193 = OpFOrdLessThan %188 %192 
					                              bool_2 %195 = OpVectorShuffle %193 %193 0 2 
					                              bool_3 %196 = OpLoad %186 
					                              bool_3 %197 = OpVectorShuffle %196 %195 3 1 4 
					                                              OpStore %186 %197 
					                                bool %198 = OpLoad %128 
					                       Private bool* %199 = OpAccessChain %175 %46 
					                                bool %200 = OpLoad %199 
					                                bool %201 = OpLogicalAnd %198 %200 
					                                              OpStore %128 %201 
					                                bool %202 = OpLoad %128 
					                                 f32 %203 = OpLoad %58 
					                                 f32 %204 = OpSelect %202 %203 %149 
					                                              OpStore %39 %204 
					                        Uniform f32* %207 = OpAccessChain %18 %63 
					                                 f32 %208 = OpLoad %207 
					                        Uniform f32* %209 = OpAccessChain %18 %63 
					                                 f32 %210 = OpLoad %209 
					                               f32_2 %211 = OpCompositeConstruct %208 %210 
					                                 f32 %212 = OpCompositeExtract %211 0 
					                                 f32 %213 = OpCompositeExtract %211 1 
					                               f32_2 %214 = OpCompositeConstruct %212 %213 
					                               f32_2 %216 = OpFMul %214 %215 
					                               f32_3 %217 = OpLoad %9 
					                               f32_2 %218 = OpVectorShuffle %217 %217 2 1 
					                               f32_2 %219 = OpFAdd %216 %218 
					                                              OpStore %206 %219 
					                        Uniform f32* %220 = OpAccessChain %18 %63 
					                                 f32 %221 = OpLoad %220 
					                        Uniform f32* %222 = OpAccessChain %18 %63 
					                                 f32 %223 = OpLoad %222 
					                        Uniform f32* %224 = OpAccessChain %18 %63 
					                                 f32 %225 = OpLoad %224 
					                               f32_3 %226 = OpCompositeConstruct %221 %223 %225 
					                                 f32 %227 = OpCompositeExtract %226 0 
					                                 f32 %228 = OpCompositeExtract %226 1 
					                                 f32 %229 = OpCompositeExtract %226 2 
					                               f32_3 %230 = OpCompositeConstruct %227 %228 %229 
					                               f32_3 %235 = OpFMul %230 %234 
					                               f32_3 %236 = OpLoad %9 
					                               f32_3 %237 = OpFAdd %235 %236 
					                                              OpStore %9 %237 
					                               f32_3 %238 = OpLoad %30 
					                               f32_3 %239 = OpFNegate %238 
					                               f32_3 %241 = OpFMul %239 %240 
					                               f32_3 %242 = OpLoad %9 
					                               f32_3 %243 = OpFAdd %241 %242 
					                                              OpStore %9 %243 
					                               f32_3 %244 = OpLoad %30 
					                               f32_2 %245 = OpVectorShuffle %244 %244 0 1 
					                               f32_2 %246 = OpFNegate %245 
					                               f32_2 %248 = OpFMul %246 %247 
					                               f32_2 %249 = OpLoad %206 
					                               f32_2 %250 = OpFAdd %248 %249 
					                               f32_3 %251 = OpLoad %30 
					                               f32_3 %252 = OpVectorShuffle %251 %250 3 4 2 
					                                              OpStore %30 %252 
					                               f32_3 %253 = OpLoad %30 
					                               f32_2 %254 = OpVectorShuffle %253 %253 0 1 
					                               f32_3 %255 = OpLoad %77 
					                               f32_2 %256 = OpVectorShuffle %255 %255 0 0 
					                               f32_2 %257 = OpFDiv %254 %256 
					                               f32_3 %258 = OpLoad %30 
					                               f32_3 %259 = OpVectorShuffle %258 %257 3 4 2 
					                                              OpStore %30 %259 
					                               f32_3 %260 = OpLoad %9 
					                               f32_3 %261 = OpLoad %77 
					                               f32_3 %262 = OpVectorShuffle %261 %261 0 0 0 
					                               f32_3 %263 = OpFDiv %260 %262 
					                                              OpStore %9 %263 
					                               f32_3 %266 = OpLoad %30 
					                               f32_4 %267 = OpVectorShuffle %266 %266 0 1 0 1 
					                               f32_3 %268 = OpLoad %30 
					                               f32_4 %269 = OpVectorShuffle %268 %268 0 1 0 1 
					                               f32_4 %270 = OpFNegate %269 
					                              bool_4 %271 = OpFOrdGreaterThanEqual %267 %270 
					                              bool_2 %272 = OpVectorShuffle %271 %271 0 1 
					                                              OpStore %265 %272 
					                               f32_3 %273 = OpLoad %30 
					                               f32_2 %274 = OpVectorShuffle %273 %273 0 1 
					                               f32_2 %275 = OpExtInst %1 4 %274 
					                               f32_2 %276 = OpExtInst %1 10 %275 
					                               f32_3 %277 = OpLoad %30 
					                               f32_3 %278 = OpVectorShuffle %277 %276 3 4 2 
					                                              OpStore %30 %278 
					                               f32_3 %281 = OpLoad %30 
					                                              OpStore %280 %281 
					                       Private bool* %282 = OpAccessChain %265 %46 
					                                bool %283 = OpLoad %282 
					                                              OpSelectionMerge %286 None 
					                                              OpBranchConditional %283 %285 %289 
					                                     %285 = OpLabel 
					                        Private f32* %287 = OpAccessChain %30 %46 
					                                 f32 %288 = OpLoad %287 
					                                              OpStore %284 %288 
					                                              OpBranch %286 
					                                     %289 = OpLabel 
					                        Private f32* %290 = OpAccessChain %30 %46 
					                                 f32 %291 = OpLoad %290 
					                                 f32 %292 = OpFNegate %291 
					                                              OpStore %284 %292 
					                                              OpBranch %286 
					                                     %286 = OpLabel 
					                                 f32 %293 = OpLoad %284 
					                       Function f32* %294 = OpAccessChain %280 %46 
					                                              OpStore %294 %293 
					                       Private bool* %295 = OpAccessChain %265 %130 
					                                bool %296 = OpLoad %295 
					                                              OpSelectionMerge %299 None 
					                                              OpBranchConditional %296 %298 %302 
					                                     %298 = OpLabel 
					                        Private f32* %300 = OpAccessChain %30 %130 
					                                 f32 %301 = OpLoad %300 
					                                              OpStore %297 %301 
					                                              OpBranch %299 
					                                     %302 = OpLabel 
					                        Private f32* %303 = OpAccessChain %30 %130 
					                                 f32 %304 = OpLoad %303 
					                                 f32 %305 = OpFNegate %304 
					                                              OpStore %297 %305 
					                                              OpBranch %299 
					                                     %299 = OpLabel 
					                                 f32 %306 = OpLoad %297 
					                       Function f32* %307 = OpAccessChain %280 %130 
					                                              OpStore %307 %306 
					                               f32_3 %308 = OpLoad %280 
					                                              OpStore %30 %308 
					                               f32_3 %309 = OpLoad %77 
					                               f32_2 %310 = OpVectorShuffle %309 %309 0 0 
					                               f32_3 %311 = OpLoad %30 
					                               f32_2 %312 = OpVectorShuffle %311 %311 0 1 
					                               f32_2 %313 = OpFMul %310 %312 
					                               f32_3 %314 = OpLoad %30 
					                               f32_3 %315 = OpVectorShuffle %314 %313 3 4 2 
					                                              OpStore %30 %315 
					                        Uniform f32* %317 = OpAccessChain %18 %63 
					                                 f32 %318 = OpLoad %317 
					                                 f32 %319 = OpFMul %318 %91 
					                        Private f32* %320 = OpAccessChain %30 %46 
					                                 f32 %321 = OpLoad %320 
					                                 f32 %322 = OpFNegate %321 
					                                 f32 %323 = OpFAdd %319 %322 
					                        Private f32* %324 = OpAccessChain %316 %46 
					                                              OpStore %324 %323 
					                        Private f32* %325 = OpAccessChain %316 %46 
					                                 f32 %326 = OpLoad %325 
					                        Private f32* %327 = OpAccessChain %77 %41 
					                                 f32 %328 = OpLoad %327 
					                                 f32 %329 = OpFDiv %326 %328 
					                        Private f32* %330 = OpAccessChain %316 %46 
					                                              OpStore %330 %329 
					                        Private f32* %331 = OpAccessChain %316 %46 
					                                 f32 %332 = OpLoad %331 
					                                 f32 %333 = OpFAdd %332 %139 
					                        Private f32* %334 = OpAccessChain %316 %46 
					                                              OpStore %334 %333 
					                        Private f32* %335 = OpAccessChain %316 %46 
					                                 f32 %336 = OpLoad %335 
					                                 f32 %338 = OpFMul %336 %337 
					                        Private f32* %339 = OpAccessChain %316 %46 
					                                              OpStore %339 %338 
					                        Private f32* %340 = OpAccessChain %316 %46 
					                                 f32 %341 = OpLoad %340 
					                                 f32 %342 = OpExtInst %1 4 %341 
					                                 f32 %344 = OpFAdd %342 %343 
					                        Private f32* %345 = OpAccessChain %316 %46 
					                                              OpStore %345 %344 
					                                 f32 %346 = OpLoad %39 
					                        Private f32* %347 = OpAccessChain %316 %46 
					                                 f32 %348 = OpLoad %347 
					                                 f32 %349 = OpExtInst %1 37 %346 %348 
					                        Private f32* %350 = OpAccessChain %316 %46 
					                                              OpStore %350 %349 
					                        Private f32* %352 = OpAccessChain %30 %46 
					                                 f32 %353 = OpLoad %352 
					                        Private f32* %354 = OpAccessChain %77 %41 
					                                 f32 %355 = OpLoad %354 
					                                bool %356 = OpFOrdLessThan %353 %355 
					                       Private bool* %357 = OpAccessChain %351 %46 
					                                              OpStore %357 %356 
					                       Private bool* %358 = OpAccessChain %175 %130 
					                                bool %359 = OpLoad %358 
					                       Private bool* %360 = OpAccessChain %351 %46 
					                                bool %361 = OpLoad %360 
					                                bool %362 = OpLogicalAnd %359 %361 
					                       Private bool* %363 = OpAccessChain %351 %46 
					                                              OpStore %363 %362 
					                       Private bool* %364 = OpAccessChain %351 %46 
					                                bool %365 = OpLoad %364 
					                                              OpSelectionMerge %368 None 
					                                              OpBranchConditional %365 %367 %371 
					                                     %367 = OpLabel 
					                        Private f32* %369 = OpAccessChain %316 %46 
					                                 f32 %370 = OpLoad %369 
					                                              OpStore %366 %370 
					                                              OpBranch %368 
					                                     %371 = OpLabel 
					                                 f32 %372 = OpLoad %39 
					                                              OpStore %366 %372 
					                                              OpBranch %368 
					                                     %368 = OpLabel 
					                                 f32 %373 = OpLoad %366 
					                                              OpStore %39 %373 
					                               f32_3 %374 = OpLoad %9 
					                               f32_4 %375 = OpVectorShuffle %374 %374 0 0 1 2 
					                               f32_3 %376 = OpLoad %9 
					                               f32_4 %377 = OpVectorShuffle %376 %376 0 0 1 2 
					                               f32_4 %378 = OpFNegate %377 
					                              bool_4 %379 = OpFOrdGreaterThanEqual %375 %378 
					                              bool_3 %380 = OpVectorShuffle %379 %379 0 2 3 
					                              bool_4 %381 = OpLoad %351 
					                              bool_4 %382 = OpVectorShuffle %381 %380 4 1 5 6 
					                                              OpStore %351 %382 
					                               f32_3 %383 = OpLoad %9 
					                               f32_3 %384 = OpExtInst %1 4 %383 
					                               f32_3 %385 = OpExtInst %1 10 %384 
					                                              OpStore %9 %385 
					                               f32_3 %387 = OpLoad %9 
					                                              OpStore %386 %387 
					                       Private bool* %388 = OpAccessChain %351 %46 
					                                bool %389 = OpLoad %388 
					                                              OpSelectionMerge %392 None 
					                                              OpBranchConditional %389 %391 %395 
					                                     %391 = OpLabel 
					                        Private f32* %393 = OpAccessChain %9 %46 
					                                 f32 %394 = OpLoad %393 
					                                              OpStore %390 %394 
					                                              OpBranch %392 
					                                     %395 = OpLabel 
					                        Private f32* %396 = OpAccessChain %9 %46 
					                                 f32 %397 = OpLoad %396 
					                                 f32 %398 = OpFNegate %397 
					                                              OpStore %390 %398 
					                                              OpBranch %392 
					                                     %392 = OpLabel 
					                                 f32 %399 = OpLoad %390 
					                       Function f32* %400 = OpAccessChain %386 %46 
					                                              OpStore %400 %399 
					                       Private bool* %401 = OpAccessChain %351 %41 
					                                bool %402 = OpLoad %401 
					                                              OpSelectionMerge %405 None 
					                                              OpBranchConditional %402 %404 %408 
					                                     %404 = OpLabel 
					                        Private f32* %406 = OpAccessChain %9 %130 
					                                 f32 %407 = OpLoad %406 
					                                              OpStore %403 %407 
					                                              OpBranch %405 
					                                     %408 = OpLabel 
					                        Private f32* %409 = OpAccessChain %9 %130 
					                                 f32 %410 = OpLoad %409 
					                                 f32 %411 = OpFNegate %410 
					                                              OpStore %403 %411 
					                                              OpBranch %405 
					                                     %405 = OpLabel 
					                                 f32 %412 = OpLoad %403 
					                       Function f32* %413 = OpAccessChain %386 %130 
					                                              OpStore %413 %412 
					                       Private bool* %415 = OpAccessChain %351 %414 
					                                bool %416 = OpLoad %415 
					                                              OpSelectionMerge %419 None 
					                                              OpBranchConditional %416 %418 %422 
					                                     %418 = OpLabel 
					                        Private f32* %420 = OpAccessChain %9 %41 
					                                 f32 %421 = OpLoad %420 
					                                              OpStore %417 %421 
					                                              OpBranch %419 
					                                     %422 = OpLabel 
					                        Private f32* %423 = OpAccessChain %9 %41 
					                                 f32 %424 = OpLoad %423 
					                                 f32 %425 = OpFNegate %424 
					                                              OpStore %417 %425 
					                                              OpBranch %419 
					                                     %419 = OpLabel 
					                                 f32 %426 = OpLoad %417 
					                       Function f32* %427 = OpAccessChain %386 %41 
					                                              OpStore %427 %426 
					                               f32_3 %428 = OpLoad %386 
					                                              OpStore %9 %428 
					                               f32_3 %429 = OpLoad %77 
					                               f32_3 %430 = OpVectorShuffle %429 %429 0 0 0 
					                               f32_3 %431 = OpLoad %9 
					                               f32_3 %432 = OpFMul %430 %431 
					                                              OpStore %9 %432 
					                        Uniform f32* %433 = OpAccessChain %18 %63 
					                                 f32 %434 = OpLoad %433 
					                                 f32 %435 = OpFMul %434 %233 
					                        Private f32* %436 = OpAccessChain %9 %46 
					                                 f32 %437 = OpLoad %436 
					                                 f32 %438 = OpFNegate %437 
					                                 f32 %439 = OpFAdd %435 %438 
					                        Private f32* %440 = OpAccessChain %30 %46 
					                                              OpStore %440 %439 
					                        Uniform f32* %441 = OpAccessChain %18 %63 
					                                 f32 %442 = OpLoad %441 
					                        Uniform f32* %443 = OpAccessChain %18 %63 
					                                 f32 %444 = OpLoad %443 
					                               f32_2 %445 = OpCompositeConstruct %442 %444 
					                                 f32 %446 = OpCompositeExtract %445 0 
					                                 f32 %447 = OpCompositeExtract %445 1 
					                               f32_2 %448 = OpCompositeConstruct %446 %447 
					                               f32_2 %451 = OpFMul %448 %450 
					                                              OpStore %316 %451 
					                        Private f32* %452 = OpAccessChain %30 %46 
					                                 f32 %453 = OpLoad %452 
					                        Private f32* %454 = OpAccessChain %316 %46 
					                                 f32 %455 = OpLoad %454 
					                                 f32 %456 = OpFDiv %453 %455 
					                        Private f32* %457 = OpAccessChain %30 %46 
					                                              OpStore %457 %456 
					                        Private f32* %458 = OpAccessChain %30 %46 
					                                 f32 %459 = OpLoad %458 
					                                 f32 %460 = OpFAdd %459 %139 
					                        Private f32* %461 = OpAccessChain %30 %46 
					                                              OpStore %461 %460 
					                        Private f32* %462 = OpAccessChain %30 %46 
					                                 f32 %463 = OpLoad %462 
					                        Private f32* %464 = OpAccessChain %30 %46 
					                                 f32 %465 = OpLoad %464 
					                                 f32 %466 = OpFAdd %463 %465 
					                        Private f32* %467 = OpAccessChain %30 %46 
					                                              OpStore %467 %466 
					                                 f32 %468 = OpLoad %39 
					                        Private f32* %469 = OpAccessChain %30 %46 
					                                 f32 %470 = OpLoad %469 
					                                 f32 %471 = OpExtInst %1 4 %470 
					                                 f32 %472 = OpExtInst %1 37 %468 %471 
					                        Private f32* %473 = OpAccessChain %30 %46 
					                                              OpStore %473 %472 
					                        Private f32* %475 = OpAccessChain %9 %46 
					                                 f32 %476 = OpLoad %475 
					                        Private f32* %477 = OpAccessChain %316 %46 
					                                 f32 %478 = OpLoad %477 
					                                bool %479 = OpFOrdLessThan %476 %478 
					                                              OpStore %474 %479 
					                       Private bool* %480 = OpAccessChain %175 %41 
					                                bool %481 = OpLoad %480 
					                                bool %482 = OpLoad %474 
					                                bool %483 = OpLogicalAnd %481 %482 
					                                              OpStore %474 %483 
					                                bool %484 = OpLoad %474 
					                                              OpSelectionMerge %487 None 
					                                              OpBranchConditional %484 %486 %490 
					                                     %486 = OpLabel 
					                        Private f32* %488 = OpAccessChain %30 %46 
					                                 f32 %489 = OpLoad %488 
					                                              OpStore %485 %489 
					                                              OpBranch %487 
					                                     %490 = OpLabel 
					                                 f32 %491 = OpLoad %39 
					                                              OpStore %485 %491 
					                                              OpBranch %487 
					                                     %487 = OpLabel 
					                                 f32 %492 = OpLoad %485 
					                        Private f32* %493 = OpAccessChain %9 %46 
					                                              OpStore %493 %492 
					                        Uniform f32* %494 = OpAccessChain %18 %63 
					                                 f32 %495 = OpLoad %494 
					                                 f32 %496 = OpFMul %495 %449 
					                        Private f32* %497 = OpAccessChain %30 %130 
					                                 f32 %498 = OpLoad %497 
					                                 f32 %499 = OpFNegate %498 
					                                 f32 %500 = OpFAdd %496 %499 
					                                              OpStore %39 %500 
					                        Private f32* %501 = OpAccessChain %30 %130 
					                                 f32 %502 = OpLoad %501 
					                        Private f32* %503 = OpAccessChain %316 %130 
					                                 f32 %504 = OpLoad %503 
					                                bool %505 = OpFOrdLessThan %502 %504 
					                       Private bool* %506 = OpAccessChain %351 %46 
					                                              OpStore %506 %505 
					                                 f32 %507 = OpLoad %39 
					                        Private f32* %508 = OpAccessChain %316 %130 
					                                 f32 %509 = OpLoad %508 
					                                 f32 %510 = OpFDiv %507 %509 
					                                              OpStore %39 %510 
					                                 f32 %511 = OpLoad %39 
					                                 f32 %512 = OpFAdd %511 %139 
					                                              OpStore %39 %512 
					                                 f32 %513 = OpLoad %39 
					                                 f32 %515 = OpFMul %513 %514 
					                                              OpStore %39 %515 
					                                 f32 %516 = OpLoad %39 
					                                 f32 %517 = OpExtInst %1 4 %516 
					                                 f32 %519 = OpFAdd %517 %518 
					                                              OpStore %39 %519 
					                        Private f32* %520 = OpAccessChain %9 %46 
					                                 f32 %521 = OpLoad %520 
					                                 f32 %522 = OpLoad %39 
					                                 f32 %523 = OpExtInst %1 37 %521 %522 
					                                              OpStore %39 %523 
					                       Private bool* %524 = OpAccessChain %175 %414 
					                                bool %525 = OpLoad %524 
					                       Private bool* %526 = OpAccessChain %351 %46 
					                                bool %527 = OpLoad %526 
					                                bool %528 = OpLogicalAnd %525 %527 
					                       Private bool* %529 = OpAccessChain %351 %46 
					                                              OpStore %529 %528 
					                       Private bool* %530 = OpAccessChain %351 %46 
					                                bool %531 = OpLoad %530 
					                                              OpSelectionMerge %534 None 
					                                              OpBranchConditional %531 %533 %536 
					                                     %533 = OpLabel 
					                                 f32 %535 = OpLoad %39 
					                                              OpStore %532 %535 
					                                              OpBranch %534 
					                                     %536 = OpLabel 
					                        Private f32* %537 = OpAccessChain %9 %46 
					                                 f32 %538 = OpLoad %537 
					                                              OpStore %532 %538 
					                                              OpBranch %534 
					                                     %534 = OpLabel 
					                                 f32 %539 = OpLoad %532 
					                        Private f32* %540 = OpAccessChain %9 %46 
					                                              OpStore %540 %539 
					                        Uniform f32* %541 = OpAccessChain %18 %63 
					                                 f32 %542 = OpLoad %541 
					                                 f32 %543 = OpFMul %542 %89 
					                        Private f32* %544 = OpAccessChain %9 %130 
					                                 f32 %545 = OpLoad %544 
					                                 f32 %546 = OpFNegate %545 
					                                 f32 %547 = OpFAdd %543 %546 
					                                              OpStore %39 %547 
					                                 f32 %548 = OpLoad %39 
					                        Private f32* %549 = OpAccessChain %77 %46 
					                                 f32 %550 = OpLoad %549 
					                                 f32 %551 = OpFDiv %548 %550 
					                                              OpStore %39 %551 
					                        Private f32* %553 = OpAccessChain %9 %130 
					                                 f32 %554 = OpLoad %553 
					                        Private f32* %555 = OpAccessChain %77 %46 
					                                 f32 %556 = OpLoad %555 
					                                bool %557 = OpFOrdLessThan %554 %556 
					                                              OpStore %552 %557 
					                       Private bool* %558 = OpAccessChain %186 %46 
					                                bool %559 = OpLoad %558 
					                                bool %560 = OpLoad %552 
					                                bool %561 = OpLogicalAnd %559 %560 
					                                              OpStore %552 %561 
					                                 f32 %562 = OpLoad %39 
					                                 f32 %563 = OpFAdd %562 %139 
					                                              OpStore %39 %563 
					                                 f32 %564 = OpLoad %39 
					                                 f32 %566 = OpFMul %564 %565 
					                                              OpStore %39 %566 
					                                 f32 %567 = OpLoad %39 
					                                 f32 %568 = OpExtInst %1 4 %567 
					                                 f32 %570 = OpFAdd %568 %569 
					                                              OpStore %39 %570 
					                        Private f32* %571 = OpAccessChain %9 %46 
					                                 f32 %572 = OpLoad %571 
					                                 f32 %573 = OpLoad %39 
					                                 f32 %574 = OpExtInst %1 37 %572 %573 
					                                              OpStore %39 %574 
					                                bool %575 = OpLoad %552 
					                                              OpSelectionMerge %578 None 
					                                              OpBranchConditional %575 %577 %580 
					                                     %577 = OpLabel 
					                                 f32 %579 = OpLoad %39 
					                                              OpStore %576 %579 
					                                              OpBranch %578 
					                                     %580 = OpLabel 
					                        Private f32* %581 = OpAccessChain %9 %46 
					                                 f32 %582 = OpLoad %581 
					                                              OpStore %576 %582 
					                                              OpBranch %578 
					                                     %578 = OpLabel 
					                                 f32 %583 = OpLoad %576 
					                        Private f32* %584 = OpAccessChain %9 %46 
					                                              OpStore %584 %583 
					                        Uniform f32* %586 = OpAccessChain %18 %63 
					                                 f32 %587 = OpLoad %586 
					                                 f32 %589 = OpFMul %587 %588 
					                        Private f32* %590 = OpAccessChain %9 %41 
					                                 f32 %591 = OpLoad %590 
					                                 f32 %592 = OpFNegate %591 
					                                 f32 %593 = OpFAdd %589 %592 
					                                              OpStore %585 %593 
					                        Uniform f32* %594 = OpAccessChain %18 %63 
					                                 f32 %595 = OpLoad %594 
					                                 f32 %596 = OpFMul %595 %588 
					                                              OpStore %39 %596 
					                                 f32 %597 = OpLoad %585 
					                                 f32 %598 = OpLoad %39 
					                                 f32 %599 = OpFDiv %597 %598 
					                                              OpStore %585 %599 
					                        Private f32* %601 = OpAccessChain %9 %41 
					                                 f32 %602 = OpLoad %601 
					                                 f32 %603 = OpLoad %39 
					                                bool %604 = OpFOrdLessThan %602 %603 
					                                              OpStore %600 %604 
					                       Private bool* %605 = OpAccessChain %186 %41 
					                                bool %606 = OpLoad %605 
					                                bool %607 = OpLoad %600 
					                                bool %608 = OpLogicalAnd %606 %607 
					                                              OpStore %600 %608 
					                                 f32 %609 = OpLoad %585 
					                                 f32 %610 = OpFAdd %609 %139 
					                                              OpStore %585 %610 
					                                 f32 %611 = OpLoad %585 
					                                 f32 %613 = OpFMul %611 %612 
					                                              OpStore %585 %613 
					                                 f32 %614 = OpLoad %585 
					                                 f32 %615 = OpExtInst %1 4 %614 
					                                 f32 %617 = OpFAdd %615 %616 
					                                              OpStore %585 %617 
					                        Private f32* %618 = OpAccessChain %9 %46 
					                                 f32 %619 = OpLoad %618 
					                                 f32 %620 = OpLoad %585 
					                                 f32 %621 = OpExtInst %1 37 %619 %620 
					                                              OpStore %585 %621 
					                                bool %624 = OpLoad %600 
					                                              OpSelectionMerge %627 None 
					                                              OpBranchConditional %624 %626 %630 
					                                     %626 = OpLabel 
					                                 f32 %628 = OpLoad %585 
					                               f32_3 %629 = OpCompositeConstruct %628 %628 %628 
					                                              OpStore %625 %629 
					                                              OpBranch %627 
					                                     %630 = OpLabel 
					                               f32_3 %631 = OpLoad %9 
					                               f32_3 %632 = OpVectorShuffle %631 %631 0 0 0 
					                                              OpStore %625 %632 
					                                              OpBranch %627 
					                                     %627 = OpLabel 
					                               f32_3 %633 = OpLoad %625 
					                               f32_4 %634 = OpLoad %623 
					                               f32_4 %635 = OpVectorShuffle %634 %633 4 5 6 3 
					                                              OpStore %623 %635 
					                         Output f32* %637 = OpAccessChain %623 %414 
					                                              OpStore %637 %149 
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
						vec4 unused_0_2;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bvec4 u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat10_3;
					bvec4 u_xlatb3;
					vec2 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat7;
					bvec3 u_xlatb7;
					bool u_xlatb10;
					vec2 u_xlat11;
					bvec2 u_xlatb11;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD0.xyx * _MainTex_ST.xyx + _MainTex_ST.zwz;
					    u_xlat1.xyz = u_xlat0.yyz * vec3(0.707099974, -10.0, 10.0);
					    u_xlat15 = u_xlat0.z * -0.707099974 + (-u_xlat1.x);
					    u_xlat1.xyz = sin(u_xlat1.yzy);
					    u_xlat15 = u_xlat15 * 10.0;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat16 = dot(u_xlat0.zy, vec2(0.707099974, -0.707099974));
					    u_xlat16 = _Value * 0.000195312503 + u_xlat16;
					    u_xlat15 = (-u_xlat15) * 0.0299999993 + u_xlat16;
					    u_xlat2.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.001953125, 0.000390625006, 0.000781250012);
					    u_xlat15 = u_xlat15 / u_xlat2.x;
					    u_xlatb16 = u_xlat15>=(-u_xlat15);
					    u_xlat15 = fract(abs(u_xlat15));
					    u_xlat15 = (u_xlatb16) ? u_xlat15 : (-u_xlat15);
					    u_xlat15 = u_xlat2.x * u_xlat15;
					    u_xlat16 = _Value * 0.000390625006 + (-u_xlat15);
					    u_xlatb15 = u_xlat15<u_xlat2.y;
					    u_xlat16 = u_xlat16 / u_xlat2.y;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat16 = u_xlat16 * 0.333333343;
					    u_xlat16 = abs(u_xlat16) + 0.833333313;
					    u_xlat16 = min(u_xlat16, 1.0);
					    u_xlat10_3 = texture(_MainTex, u_xlat0.zy);
					    u_xlat7 = dot(u_xlat10_3.xzy, vec3(0.300000012, 0.300000012, 0.400000006));
					    u_xlatb3 = lessThan(vec4(u_xlat7), vec4(0.75, 0.629999995, 0.50999999, 0.390000015));
					    u_xlatb7.xz = lessThan(vec4(u_xlat7), vec4(0.270000011, 0.0, 0.150000036, 0.150000036)).xz;
					    u_xlatb15 = u_xlatb15 && u_xlatb3.x;
					    u_xlat15 = (u_xlatb15) ? u_xlat16 : 1.0;
					    u_xlat4.xy = vec2(vec2(_Value, _Value)) * vec2(0.000390625006, 0.000781250012) + u_xlat0.zy;
					    u_xlat0.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.000585937523, 0.0009765625, 0.00117187505) + u_xlat0.xyz;
					    u_xlat0.xyz = (-u_xlat1.xyz) * vec3(0.0299999993, 0.0299999993, 0.0299999993) + u_xlat0.xyz;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(0.0299999993, 0.0299999993) + u_xlat4.xy;
					    u_xlat1.xy = u_xlat1.xy / u_xlat2.xx;
					    u_xlat0.xyz = u_xlat0.xyz / u_xlat2.xxx;
					    u_xlatb11.xy = greaterThanEqual(u_xlat1.xyxy, (-u_xlat1.xyxy)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat1.y : (-u_xlat1.y);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xy = u_xlat2.xx * u_xlat1.xy;
					    u_xlat11.x = _Value * 0.000781250012 + (-u_xlat1.x);
					    u_xlat11.x = u_xlat11.x / u_xlat2.z;
					    u_xlat11.x = u_xlat11.x + -0.5;
					    u_xlat11.x = u_xlat11.x * 1.66666663;
					    u_xlat11.x = abs(u_xlat11.x) + 0.166666701;
					    u_xlat11.x = min(u_xlat15, u_xlat11.x);
					    u_xlatb1.x = u_xlat1.x<u_xlat2.z;
					    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
					    u_xlat15 = (u_xlatb1.x) ? u_xlat11.x : u_xlat15;
					    u_xlatb1.xzw = greaterThanEqual(u_xlat0.xxyz, (-u_xlat0.xxyz)).xzw;
					    u_xlat0.xyz = fract(abs(u_xlat0.xyz));
					    {
					        vec3 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb1.z) ? u_xlat0.y : (-u_xlat0.y);
					        hlslcc_movcTemp.z = (u_xlatb1.w) ? u_xlat0.z : (-u_xlat0.z);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
					    u_xlat1.x = _Value * 0.00117187505 + (-u_xlat0.x);
					    u_xlat11.xy = vec2(vec2(_Value, _Value)) * vec2(0.00117187505, 0.00156250002);
					    u_xlat1.x = u_xlat1.x / u_xlat11.x;
					    u_xlat1.x = u_xlat1.x + -0.5;
					    u_xlat1.x = u_xlat1.x + u_xlat1.x;
					    u_xlat1.x = min(u_xlat15, abs(u_xlat1.x));
					    u_xlatb0 = u_xlat0.x<u_xlat11.x;
					    u_xlatb0 = u_xlatb3.z && u_xlatb0;
					    u_xlat0.x = (u_xlatb0) ? u_xlat1.x : u_xlat15;
					    u_xlat15 = _Value * 0.00156250002 + (-u_xlat1.y);
					    u_xlatb1.x = u_xlat1.y<u_xlat11.y;
					    u_xlat15 = u_xlat15 / u_xlat11.y;
					    u_xlat15 = u_xlat15 + -0.5;
					    u_xlat15 = u_xlat15 * 2.5;
					    u_xlat15 = abs(u_xlat15) + -0.249999985;
					    u_xlat15 = min(u_xlat0.x, u_xlat15);
					    u_xlatb1.x = u_xlatb3.w && u_xlatb1.x;
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat15 : u_xlat0.x;
					    u_xlat15 = _Value * 0.001953125 + (-u_xlat0.y);
					    u_xlat15 = u_xlat15 / u_xlat2.x;
					    u_xlatb5 = u_xlat0.y<u_xlat2.x;
					    u_xlatb5 = u_xlatb7.x && u_xlatb5;
					    u_xlat15 = u_xlat15 + -0.5;
					    u_xlat15 = u_xlat15 * 3.33333325;
					    u_xlat15 = abs(u_xlat15) + -0.666666627;
					    u_xlat15 = min(u_xlat0.x, u_xlat15);
					    u_xlat0.x = (u_xlatb5) ? u_xlat15 : u_xlat0.x;
					    u_xlat5 = _Value * 0.00234375009 + (-u_xlat0.z);
					    u_xlat15 = _Value * 0.00234375009;
					    u_xlat5 = u_xlat5 / u_xlat15;
					    u_xlatb10 = u_xlat0.z<u_xlat15;
					    u_xlatb10 = u_xlatb7.z && u_xlatb10;
					    u_xlat5 = u_xlat5 + -0.5;
					    u_xlat5 = u_xlat5 * 5.0;
					    u_xlat5 = abs(u_xlat5) + -1.5;
					    u_xlat5 = min(u_xlat0.x, u_xlat5);
					    SV_Target0.xyz = (bool(u_xlatb10)) ? vec3(u_xlat5) : u_xlat0.xxx;
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