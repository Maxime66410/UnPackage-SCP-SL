Shader "CameraFilterPack/Vision_Blood_Fast" {
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
			GpuProgramID 35193
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec2 u_xlat20;
					float u_xlat30;
					int u_xlati30;
					int u_xlati31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat1.z = 0.5;
					    u_xlat10_2 = texture(_MainTex, vec2(0.100000001, 0.5));
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1.xyz;
					    u_xlat20.x = _TimeX * 0.5;
					    u_xlat20.x = sin(u_xlat20.x);
					    u_xlat3.xyz = u_xlat1.xyz;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<3 ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat20.xxx * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					        u_xlat7.xyz = u_xlat6.xyz;
					        u_xlat8.z = u_xlat5.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<7 ; u_xlati_loop_2++)
					        {
					            u_xlat9.xyz = u_xlat7.zyx + vec3(-0.400000006, -0.400000006, -0.400000006);
					            u_xlat7.xyz = abs(u_xlat9.xyz) + vec3(-0.899999976, -0.899999976, -0.899999976);
					            u_xlat32 = dot(u_xlat3.xyz, u_xlat7.xyz);
					            u_xlat32 = abs(u_xlat32) * -1.80336881;
					            u_xlat32 = exp2(u_xlat32);
					            u_xlat8.z = u_xlat32 + u_xlat8.z;
					        }
					        u_xlat5.xy = u_xlat8.zz * vec2(0.333333343, 0.0333333351);
					        u_xlat3.xyz = u_xlat2.xyz * u_xlat5.xxx + u_xlat3.xyz;
					        u_xlat5.zw = u_xlat5.xx * u_xlat5.xy;
					        u_xlat8.xy = u_xlat5.zy * u_xlat5.wz;
					        u_xlat4.xyz = u_xlat8.xyz * vec3(3.1730001, -0.0410000011, -0.00033333333) + u_xlat4.xyz;
					    }
					    u_xlat20.x = _Value + -0.0500000007;
					    u_xlat20.x = u_xlat20.x + (-_Value2);
					    u_xlat1.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat30 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat20.y = sqrt(u_xlat30);
					    u_xlat20.xy = u_xlat20.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat20.x = float(1.0) / u_xlat20.x;
					    u_xlat20.x = u_xlat20.x * u_xlat20.y;
					    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
					    u_xlat30 = u_xlat20.x * -2.0 + 3.0;
					    u_xlat20.x = u_xlat20.x * u_xlat20.x;
					    u_xlat20.x = (-u_xlat30) * u_xlat20.x + 1.0;
					    u_xlat1.xyz = u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.415888339, 0.415888339, 0.415888339) + vec3(-0.5, -0.5, -0.5);
					    u_xlat30 = u_xlat1.x * 0.5;
					    u_xlat2.xy = u_xlat0.xy * vec2(u_xlat30);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat10_2.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyw = u_xlat1.xyz + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = u_xlat20.xxx * u_xlat0.xyw + u_xlat10_2.xyz;
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
					; Bound: 324
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %11 %304 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpDecorate vs_TEXCOORD0 Location 11 
					                                                OpMemberDecorate %14 0 Offset 14 
					                                                OpMemberDecorate %14 1 Offset 14 
					                                                OpMemberDecorate %14 2 Offset 14 
					                                                OpMemberDecorate %14 3 RelaxedPrecision 
					                                                OpMemberDecorate %14 3 Offset 14 
					                                                OpDecorate %14 Block 
					                                                OpDecorate %16 DescriptorSet 16 
					                                                OpDecorate %16 Binding 16 
					                                                OpDecorate %21 RelaxedPrecision 
					                                                OpDecorate %22 RelaxedPrecision 
					                                                OpDecorate %25 RelaxedPrecision 
					                                                OpDecorate %26 RelaxedPrecision 
					                                                OpDecorate %42 RelaxedPrecision 
					                                                OpDecorate %45 RelaxedPrecision 
					                                                OpDecorate %45 DescriptorSet 45 
					                                                OpDecorate %45 Binding 45 
					                                                OpDecorate %46 RelaxedPrecision 
					                                                OpDecorate %49 RelaxedPrecision 
					                                                OpDecorate %49 DescriptorSet 49 
					                                                OpDecorate %49 Binding 49 
					                                                OpDecorate %50 RelaxedPrecision 
					                                                OpDecorate %55 RelaxedPrecision 
					                                                OpDecorate %56 RelaxedPrecision 
					                                                OpDecorate %58 RelaxedPrecision 
					                                                OpDecorate %61 RelaxedPrecision 
					                                                OpDecorate %279 RelaxedPrecision 
					                                                OpDecorate %280 RelaxedPrecision 
					                                                OpDecorate %285 RelaxedPrecision 
					                                                OpDecorate %287 RelaxedPrecision 
					                                                OpDecorate %289 RelaxedPrecision 
					                                                OpDecorate %290 RelaxedPrecision 
					                                                OpDecorate %291 RelaxedPrecision 
					                                                OpDecorate %295 RelaxedPrecision 
					                                                OpDecorate %298 RelaxedPrecision 
					                                                OpDecorate %299 RelaxedPrecision 
					                                                OpDecorate %300 RelaxedPrecision 
					                                                OpDecorate %304 Location 304 
					                                                OpDecorate %309 RelaxedPrecision 
					                                                OpDecorate %310 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 2 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_2* %9 = OpVariable Private 
					                                        %10 = OpTypePointer Input %7 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                        %13 = OpTypeVector %6 4 
					                                        %14 = OpTypeStruct %6 %6 %6 %13 
					                                        %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                        %17 = OpTypeInt 32 1 
					                                    i32 %18 = OpConstant 3 
					                                        %19 = OpTypePointer Uniform %13 
					                                        %28 = OpTypeVector %6 3 
					                                        %29 = OpTypePointer Private %28 
					                         Private f32_3* %30 = OpVariable Private 
					                                    f32 %32 = OpConstant 3,674022E-40 
					                                  f32_2 %33 = OpConstantComposite %32 %32 
					                                    f32 %37 = OpConstant 3,674022E-40 
					                                        %38 = OpTypeInt 32 0 
					                                    u32 %39 = OpConstant 2 
					                                        %40 = OpTypePointer Private %6 
					                         Private f32_3* %42 = OpVariable Private 
					                                        %43 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %44 = OpTypePointer UniformConstant %43 
					   UniformConstant read_only Texture2D* %45 = OpVariable UniformConstant 
					                                        %47 = OpTypeSampler 
					                                        %48 = OpTypePointer UniformConstant %47 
					               UniformConstant sampler* %49 = OpVariable UniformConstant 
					                                        %51 = OpTypeSampledImage %43 
					                                    f32 %53 = OpConstant 3,674022E-40 
					                                  f32_2 %54 = OpConstantComposite %53 %37 
					                         Private f32_3* %57 = OpVariable Private 
					                                    f32 %59 = OpConstant 3,674022E-40 
					                                  f32_3 %60 = OpConstantComposite %59 %59 %59 
					                         Private f32_2* %64 = OpVariable Private 
					                                    i32 %65 = OpConstant 0 
					                                        %66 = OpTypePointer Uniform %6 
					                                    u32 %70 = OpConstant 0 
					                         Private f32_3* %76 = OpVariable Private 
					                         Private f32_3* %78 = OpVariable Private 
					                                    f32 %79 = OpConstant 3,674022E-40 
					                                    u32 %81 = OpConstant 1 
					                                        %84 = OpTypePointer Private %13 
					                         Private f32_4* %85 = OpVariable Private 
					                                        %87 = OpTypePointer Function %17 
					                                        %95 = OpTypeBool 
					                         Private f32_3* %97 = OpVariable Private 
					                                 f32_3 %100 = OpConstantComposite %37 %37 %37 
					                        Private f32_3* %104 = OpVariable Private 
					                        Private f32_3* %106 = OpVariable Private 
					                                   i32 %117 = OpConstant 7 
					                        Private f32_3* %119 = OpVariable Private 
					                                   f32 %122 = OpConstant 3,674022E-40 
					                                 f32_3 %123 = OpConstantComposite %122 %122 %122 
					                                   f32 %127 = OpConstant 3,674022E-40 
					                                 f32_3 %128 = OpConstantComposite %127 %127 %127 
					                          Private f32* %130 = OpVariable Private 
					                                   f32 %136 = OpConstant 3,674022E-40 
					                                   i32 %146 = OpConstant 1 
					                                   f32 %150 = OpConstant 3,674022E-40 
					                                   f32 %151 = OpConstant 3,674022E-40 
					                                 f32_2 %152 = OpConstantComposite %150 %151 
					                                   f32 %177 = OpConstant 3,674022E-40 
					                                   f32 %178 = OpConstant 3,674022E-40 
					                                   f32 %179 = OpConstant 3,674022E-40 
					                                 f32_3 %180 = OpConstantComposite %177 %178 %179 
					                                   f32 %188 = OpConstant 3,674022E-40 
					                                   i32 %193 = OpConstant 2 
					                                 f32_2 %201 = OpConstantComposite %37 %37 
					                          Private f32* %205 = OpVariable Private 
					                                   f32 %225 = OpConstant 3,674022E-40 
					                                   f32 %242 = OpConstant 3,674022E-40 
					                                   f32 %244 = OpConstant 3,674022E-40 
					                                 f32_3 %260 = OpConstantComposite %225 %225 %225 
					                                   f32 %265 = OpConstant 3,674022E-40 
					                                 f32_3 %266 = OpConstantComposite %265 %265 %265 
					                                 f32_3 %268 = OpConstantComposite %32 %32 %32 
					                        Private f32_4* %289 = OpVariable Private 
					                                       %303 = OpTypePointer Output %13 
					                         Output f32_4* %304 = OpVariable Output 
					                                   u32 %314 = OpConstant 3 
					                                       %315 = OpTypePointer Output %6 
					                                       %318 = OpTypePointer Private %17 
					                          Private i32* %319 = OpVariable Private 
					                          Private i32* %320 = OpVariable Private 
					                                       %321 = OpTypePointer Private %95 
					                         Private bool* %322 = OpVariable Private 
					                         Private bool* %323 = OpVariable Private 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                          Function i32* %88 = OpVariable Function 
					                         Function i32* %110 = OpVariable Function 
					                                  f32_2 %12 = OpLoad vs_TEXCOORD0 
					                         Uniform f32_4* %20 = OpAccessChain %16 %18 
					                                  f32_4 %21 = OpLoad %20 
					                                  f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                                  f32_2 %23 = OpFMul %12 %22 
					                         Uniform f32_4* %24 = OpAccessChain %16 %18 
					                                  f32_4 %25 = OpLoad %24 
					                                  f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                                  f32_2 %27 = OpFAdd %23 %26 
					                                                OpStore %9 %27 
					                                  f32_2 %31 = OpLoad %9 
					                                  f32_2 %34 = OpFAdd %31 %33 
					                                  f32_3 %35 = OpLoad %30 
					                                  f32_3 %36 = OpVectorShuffle %35 %34 3 4 2 
					                                                OpStore %30 %36 
					                           Private f32* %41 = OpAccessChain %30 %39 
					                                                OpStore %41 %37 
					                    read_only Texture2D %46 = OpLoad %45 
					                                sampler %50 = OpLoad %49 
					             read_only Texture2DSampled %52 = OpSampledImage %46 %50 
					                                  f32_4 %55 = OpImageSampleImplicitLod %52 %54 
					                                  f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
					                                                OpStore %42 %56 
					                                  f32_3 %58 = OpLoad %42 
					                                  f32_3 %61 = OpFMul %58 %60 
					                                  f32_3 %62 = OpLoad %30 
					                                  f32_3 %63 = OpFAdd %61 %62 
					                                                OpStore %57 %63 
					                           Uniform f32* %67 = OpAccessChain %16 %65 
					                                    f32 %68 = OpLoad %67 
					                                    f32 %69 = OpFMul %68 %37 
					                           Private f32* %71 = OpAccessChain %64 %70 
					                                                OpStore %71 %69 
					                           Private f32* %72 = OpAccessChain %64 %70 
					                                    f32 %73 = OpLoad %72 
					                                    f32 %74 = OpExtInst %1 13 %73 
					                           Private f32* %75 = OpAccessChain %64 %70 
					                                                OpStore %75 %74 
					                                  f32_3 %77 = OpLoad %30 
					                                                OpStore %76 %77 
					                           Private f32* %80 = OpAccessChain %78 %70 
					                                                OpStore %80 %79 
					                           Private f32* %82 = OpAccessChain %78 %81 
					                                                OpStore %82 %79 
					                           Private f32* %83 = OpAccessChain %78 %39 
					                                                OpStore %83 %79 
					                           Private f32* %86 = OpAccessChain %85 %70 
					                                                OpStore %86 %79 
					                                                OpStore %88 %65 
					                                                OpBranch %89 
					                                        %89 = OpLabel 
					                                                OpLoopMerge %91 %92 None 
					                                                OpBranch %93 
					                                        %93 = OpLabel 
					                                    i32 %94 = OpLoad %88 
					                                   bool %96 = OpSLessThan %94 %18 
					                                                OpBranchConditional %96 %90 %91 
					                                        %90 = OpLabel 
					                                  f32_2 %98 = OpLoad %64 
					                                  f32_3 %99 = OpVectorShuffle %98 %98 0 0 0 
					                                 f32_3 %101 = OpFMul %99 %100 
					                                 f32_3 %102 = OpLoad %76 
					                                 f32_3 %103 = OpFAdd %101 %102 
					                                                OpStore %97 %103 
					                                 f32_3 %105 = OpLoad %97 
					                                                OpStore %104 %105 
					                          Private f32* %107 = OpAccessChain %85 %70 
					                                   f32 %108 = OpLoad %107 
					                          Private f32* %109 = OpAccessChain %106 %39 
					                                                OpStore %109 %108 
					                                                OpStore %110 %65 
					                                                OpBranch %111 
					                                       %111 = OpLabel 
					                                                OpLoopMerge %113 %114 None 
					                                                OpBranch %115 
					                                       %115 = OpLabel 
					                                   i32 %116 = OpLoad %110 
					                                  bool %118 = OpSLessThan %116 %117 
					                                                OpBranchConditional %118 %112 %113 
					                                       %112 = OpLabel 
					                                 f32_3 %120 = OpLoad %104 
					                                 f32_3 %121 = OpVectorShuffle %120 %120 2 1 0 
					                                 f32_3 %124 = OpFAdd %121 %123 
					                                                OpStore %119 %124 
					                                 f32_3 %125 = OpLoad %119 
					                                 f32_3 %126 = OpExtInst %1 4 %125 
					                                 f32_3 %129 = OpFAdd %126 %128 
					                                                OpStore %104 %129 
					                                 f32_3 %131 = OpLoad %76 
					                                 f32_3 %132 = OpLoad %104 
					                                   f32 %133 = OpDot %131 %132 
					                                                OpStore %130 %133 
					                                   f32 %134 = OpLoad %130 
					                                   f32 %135 = OpExtInst %1 4 %134 
					                                   f32 %137 = OpFMul %135 %136 
					                                                OpStore %130 %137 
					                                   f32 %138 = OpLoad %130 
					                                   f32 %139 = OpExtInst %1 29 %138 
					                                                OpStore %130 %139 
					                                   f32 %140 = OpLoad %130 
					                          Private f32* %141 = OpAccessChain %106 %39 
					                                   f32 %142 = OpLoad %141 
					                                   f32 %143 = OpFAdd %140 %142 
					                          Private f32* %144 = OpAccessChain %106 %39 
					                                                OpStore %144 %143 
					                                                OpBranch %114 
					                                       %114 = OpLabel 
					                                   i32 %145 = OpLoad %110 
					                                   i32 %147 = OpIAdd %145 %146 
					                                                OpStore %110 %147 
					                                                OpBranch %111 
					                                       %113 = OpLabel 
					                                 f32_3 %148 = OpLoad %106 
					                                 f32_2 %149 = OpVectorShuffle %148 %148 2 2 
					                                 f32_2 %153 = OpFMul %149 %152 
					                                 f32_4 %154 = OpLoad %85 
					                                 f32_4 %155 = OpVectorShuffle %154 %153 4 5 2 3 
					                                                OpStore %85 %155 
					                                 f32_3 %156 = OpLoad %57 
					                                 f32_4 %157 = OpLoad %85 
					                                 f32_3 %158 = OpVectorShuffle %157 %157 0 0 0 
					                                 f32_3 %159 = OpFMul %156 %158 
					                                 f32_3 %160 = OpLoad %76 
					                                 f32_3 %161 = OpFAdd %159 %160 
					                                                OpStore %76 %161 
					                                 f32_4 %162 = OpLoad %85 
					                                 f32_2 %163 = OpVectorShuffle %162 %162 0 0 
					                                 f32_4 %164 = OpLoad %85 
					                                 f32_2 %165 = OpVectorShuffle %164 %164 0 1 
					                                 f32_2 %166 = OpFMul %163 %165 
					                                 f32_4 %167 = OpLoad %85 
					                                 f32_4 %168 = OpVectorShuffle %167 %166 0 1 4 5 
					                                                OpStore %85 %168 
					                                 f32_4 %169 = OpLoad %85 
					                                 f32_2 %170 = OpVectorShuffle %169 %169 2 1 
					                                 f32_4 %171 = OpLoad %85 
					                                 f32_2 %172 = OpVectorShuffle %171 %171 3 2 
					                                 f32_2 %173 = OpFMul %170 %172 
					                                 f32_3 %174 = OpLoad %106 
					                                 f32_3 %175 = OpVectorShuffle %174 %173 3 4 2 
					                                                OpStore %106 %175 
					                                 f32_3 %176 = OpLoad %106 
					                                 f32_3 %181 = OpFMul %176 %180 
					                                 f32_3 %182 = OpLoad %78 
					                                 f32_3 %183 = OpFAdd %181 %182 
					                                                OpStore %78 %183 
					                                                OpBranch %92 
					                                        %92 = OpLabel 
					                                   i32 %184 = OpLoad %88 
					                                   i32 %185 = OpIAdd %184 %146 
					                                                OpStore %88 %185 
					                                                OpBranch %89 
					                                        %91 = OpLabel 
					                          Uniform f32* %186 = OpAccessChain %16 %146 
					                                   f32 %187 = OpLoad %186 
					                                   f32 %189 = OpFAdd %187 %188 
					                          Private f32* %190 = OpAccessChain %64 %70 
					                                                OpStore %190 %189 
					                          Private f32* %191 = OpAccessChain %64 %70 
					                                   f32 %192 = OpLoad %191 
					                          Uniform f32* %194 = OpAccessChain %16 %193 
					                                   f32 %195 = OpLoad %194 
					                                   f32 %196 = OpFNegate %195 
					                                   f32 %197 = OpFAdd %192 %196 
					                          Private f32* %198 = OpAccessChain %64 %70 
					                                                OpStore %198 %197 
					                                 f32_2 %199 = OpLoad %9 
					                                 f32_2 %200 = OpFNegate %199 
					                                 f32_2 %202 = OpFAdd %200 %201 
					                                 f32_3 %203 = OpLoad %30 
					                                 f32_3 %204 = OpVectorShuffle %203 %202 3 4 2 
					                                                OpStore %30 %204 
					                                 f32_3 %206 = OpLoad %30 
					                                 f32_2 %207 = OpVectorShuffle %206 %206 0 1 
					                                 f32_3 %208 = OpLoad %30 
					                                 f32_2 %209 = OpVectorShuffle %208 %208 0 1 
					                                   f32 %210 = OpDot %207 %209 
					                                                OpStore %205 %210 
					                                   f32 %211 = OpLoad %205 
					                                   f32 %212 = OpExtInst %1 31 %211 
					                          Private f32* %213 = OpAccessChain %64 %81 
					                                                OpStore %213 %212 
					                                 f32_2 %214 = OpLoad %64 
					                          Uniform f32* %215 = OpAccessChain %16 %146 
					                                   f32 %216 = OpLoad %215 
					                          Uniform f32* %217 = OpAccessChain %16 %146 
					                                   f32 %218 = OpLoad %217 
					                                 f32_2 %219 = OpCompositeConstruct %216 %218 
					                                   f32 %220 = OpCompositeExtract %219 0 
					                                   f32 %221 = OpCompositeExtract %219 1 
					                                 f32_2 %222 = OpCompositeConstruct %220 %221 
					                                 f32_2 %223 = OpFNegate %222 
					                                 f32_2 %224 = OpFAdd %214 %223 
					                                                OpStore %64 %224 
					                          Private f32* %226 = OpAccessChain %64 %70 
					                                   f32 %227 = OpLoad %226 
					                                   f32 %228 = OpFDiv %225 %227 
					                          Private f32* %229 = OpAccessChain %64 %70 
					                                                OpStore %229 %228 
					                          Private f32* %230 = OpAccessChain %64 %70 
					                                   f32 %231 = OpLoad %230 
					                          Private f32* %232 = OpAccessChain %64 %81 
					                                   f32 %233 = OpLoad %232 
					                                   f32 %234 = OpFMul %231 %233 
					                          Private f32* %235 = OpAccessChain %64 %70 
					                                                OpStore %235 %234 
					                          Private f32* %236 = OpAccessChain %64 %70 
					                                   f32 %237 = OpLoad %236 
					                                   f32 %238 = OpExtInst %1 43 %237 %79 %225 
					                          Private f32* %239 = OpAccessChain %64 %70 
					                                                OpStore %239 %238 
					                          Private f32* %240 = OpAccessChain %64 %70 
					                                   f32 %241 = OpLoad %240 
					                                   f32 %243 = OpFMul %241 %242 
					                                   f32 %245 = OpFAdd %243 %244 
					                                                OpStore %205 %245 
					                          Private f32* %246 = OpAccessChain %64 %70 
					                                   f32 %247 = OpLoad %246 
					                          Private f32* %248 = OpAccessChain %64 %70 
					                                   f32 %249 = OpLoad %248 
					                                   f32 %250 = OpFMul %247 %249 
					                          Private f32* %251 = OpAccessChain %64 %70 
					                                                OpStore %251 %250 
					                                   f32 %252 = OpLoad %205 
					                                   f32 %253 = OpFNegate %252 
					                          Private f32* %254 = OpAccessChain %64 %70 
					                                   f32 %255 = OpLoad %254 
					                                   f32 %256 = OpFMul %253 %255 
					                                   f32 %257 = OpFAdd %256 %225 
					                          Private f32* %258 = OpAccessChain %64 %70 
					                                                OpStore %258 %257 
					                                 f32_3 %259 = OpLoad %78 
					                                 f32_3 %261 = OpFAdd %259 %260 
					                                                OpStore %30 %261 
					                                 f32_3 %262 = OpLoad %30 
					                                 f32_3 %263 = OpExtInst %1 30 %262 
					                                                OpStore %30 %263 
					                                 f32_3 %264 = OpLoad %30 
					                                 f32_3 %267 = OpFMul %264 %266 
					                                 f32_3 %269 = OpFAdd %267 %268 
					                                                OpStore %30 %269 
					                          Private f32* %270 = OpAccessChain %30 %70 
					                                   f32 %271 = OpLoad %270 
					                                   f32 %272 = OpFMul %271 %37 
					                                                OpStore %205 %272 
					                                 f32_2 %273 = OpLoad %9 
					                                   f32 %274 = OpLoad %205 
					                                 f32_2 %275 = OpCompositeConstruct %274 %274 
					                                 f32_2 %276 = OpFMul %273 %275 
					                                 f32_3 %277 = OpLoad %57 
					                                 f32_3 %278 = OpVectorShuffle %277 %276 3 4 2 
					                                                OpStore %57 %278 
					                   read_only Texture2D %279 = OpLoad %45 
					                               sampler %280 = OpLoad %49 
					            read_only Texture2DSampled %281 = OpSampledImage %279 %280 
					                                 f32_3 %282 = OpLoad %57 
					                                 f32_2 %283 = OpVectorShuffle %282 %282 0 1 
					                                 f32_4 %284 = OpImageSampleImplicitLod %281 %283 
					                                 f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
					                                                OpStore %42 %285 
					                                 f32_3 %286 = OpLoad %30 
					                                 f32_3 %287 = OpLoad %42 
					                                 f32_3 %288 = OpFAdd %286 %287 
					                                                OpStore %30 %288 
					                   read_only Texture2D %290 = OpLoad %45 
					                               sampler %291 = OpLoad %49 
					            read_only Texture2DSampled %292 = OpSampledImage %290 %291 
					                                 f32_2 %293 = OpLoad %9 
					                                 f32_4 %294 = OpImageSampleImplicitLod %292 %293 
					                                 f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
					                                 f32_4 %296 = OpLoad %289 
					                                 f32_4 %297 = OpVectorShuffle %296 %295 4 5 2 6 
					                                                OpStore %289 %297 
					                                 f32_4 %298 = OpLoad %289 
					                                 f32_3 %299 = OpVectorShuffle %298 %298 0 1 3 
					                                 f32_3 %300 = OpFNegate %299 
					                                 f32_3 %301 = OpLoad %30 
					                                 f32_3 %302 = OpFAdd %300 %301 
					                                                OpStore %30 %302 
					                                 f32_2 %305 = OpLoad %64 
					                                 f32_3 %306 = OpVectorShuffle %305 %305 0 0 0 
					                                 f32_3 %307 = OpLoad %30 
					                                 f32_3 %308 = OpFMul %306 %307 
					                                 f32_4 %309 = OpLoad %289 
					                                 f32_3 %310 = OpVectorShuffle %309 %309 0 1 3 
					                                 f32_3 %311 = OpFAdd %308 %310 
					                                 f32_4 %312 = OpLoad %304 
					                                 f32_4 %313 = OpVectorShuffle %312 %311 4 5 6 3 
					                                                OpStore %304 %313 
					                           Output f32* %316 = OpAccessChain %304 %314 
					                                                OpStore %316 %225 
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
						vec4 unused_0_4[2];
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
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec2 u_xlat20;
					float u_xlat30;
					int u_xlati30;
					int u_xlati31;
					bool u_xlatb31;
					float u_xlat32;
					bool u_xlatb32;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat1.z = 0.5;
					    u_xlat10_2 = texture(_MainTex, vec2(0.100000001, 0.5));
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1.xyz;
					    u_xlat20.x = _TimeX * 0.5;
					    u_xlat20.x = sin(u_xlat20.x);
					    u_xlat3.xyz = u_xlat1.xyz;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<3 ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat20.xxx * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					        u_xlat7.xyz = u_xlat6.xyz;
					        u_xlat8.z = u_xlat5.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<7 ; u_xlati_loop_2++)
					        {
					            u_xlat9.xyz = u_xlat7.zyx + vec3(-0.400000006, -0.400000006, -0.400000006);
					            u_xlat7.xyz = abs(u_xlat9.xyz) + vec3(-0.899999976, -0.899999976, -0.899999976);
					            u_xlat32 = dot(u_xlat3.xyz, u_xlat7.xyz);
					            u_xlat32 = abs(u_xlat32) * -1.80336881;
					            u_xlat32 = exp2(u_xlat32);
					            u_xlat8.z = u_xlat32 + u_xlat8.z;
					        }
					        u_xlat5.xy = u_xlat8.zz * vec2(0.333333343, 0.0333333351);
					        u_xlat3.xyz = u_xlat2.xyz * u_xlat5.xxx + u_xlat3.xyz;
					        u_xlat5.zw = u_xlat5.xx * u_xlat5.xy;
					        u_xlat8.xy = u_xlat5.zy * u_xlat5.wz;
					        u_xlat4.xyz = u_xlat8.xyz * vec3(3.1730001, -0.0410000011, -0.00033333333) + u_xlat4.xyz;
					    }
					    u_xlat20.x = _Value + -0.0500000007;
					    u_xlat20.x = u_xlat20.x + (-_Value2);
					    u_xlat1.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat30 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat20.y = sqrt(u_xlat30);
					    u_xlat20.xy = u_xlat20.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat20.x = float(1.0) / u_xlat20.x;
					    u_xlat20.x = u_xlat20.x * u_xlat20.y;
					    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
					    u_xlat30 = u_xlat20.x * -2.0 + 3.0;
					    u_xlat20.x = u_xlat20.x * u_xlat20.x;
					    u_xlat20.x = (-u_xlat30) * u_xlat20.x + 1.0;
					    u_xlat1.xyz = u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.415888339, 0.415888339, 0.415888339) + vec3(-0.5, -0.5, -0.5);
					    u_xlat30 = u_xlat1.x * 0.5;
					    u_xlat2.xy = u_xlat0.xy * vec2(u_xlat30);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat10_2.xyz;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyw = u_xlat1.xyz + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = u_xlat20.xxx * u_xlat0.xyw + u_xlat10_2.xyz;
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