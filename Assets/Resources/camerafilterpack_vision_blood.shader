Shader "CameraFilterPack/Vision_Blood" {
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
			GpuProgramID 58434
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
					vec3 u_xlat15;
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
					    u_xlat0.z = 1.0;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat10_2 = texture(_MainTex, vec2(0.100000001, 0.5));
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1.xyz;
					    u_xlat20.x = _TimeX * 0.5;
					    u_xlat20.x = sin(u_xlat20.x);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat3.xyz = u_xlat1.xyz;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat20.xxx * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					        u_xlat7.xyz = u_xlat6.xyz;
					        u_xlat8.z = u_xlat5.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<10 ; u_xlati_loop_2++)
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
					        u_xlat15.xyz = u_xlat8.xyz * vec3(3.1730001, -0.0410000011, -0.00033333333);
					        u_xlat4.xyz = u_xlat4.xyz * vec3(0.970000029, 0.970000029, 0.970000029) + u_xlat15.xyz;
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
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.277258873, 0.277258873, 0.277258873) + vec3(-0.5, -0.5, -0.5);
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
					; Bound: 336
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %12 %316 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpDecorate vs_TEXCOORD0 Location 12 
					                                                OpMemberDecorate %15 0 Offset 15 
					                                                OpMemberDecorate %15 1 Offset 15 
					                                                OpMemberDecorate %15 2 Offset 15 
					                                                OpMemberDecorate %15 3 RelaxedPrecision 
					                                                OpMemberDecorate %15 3 Offset 15 
					                                                OpDecorate %15 Block 
					                                                OpDecorate %17 DescriptorSet 17 
					                                                OpDecorate %17 Binding 17 
					                                                OpDecorate %22 RelaxedPrecision 
					                                                OpDecorate %23 RelaxedPrecision 
					                                                OpDecorate %26 RelaxedPrecision 
					                                                OpDecorate %27 RelaxedPrecision 
					                                                OpDecorate %41 RelaxedPrecision 
					                                                OpDecorate %44 RelaxedPrecision 
					                                                OpDecorate %44 DescriptorSet 44 
					                                                OpDecorate %44 Binding 44 
					                                                OpDecorate %45 RelaxedPrecision 
					                                                OpDecorate %48 RelaxedPrecision 
					                                                OpDecorate %48 DescriptorSet 48 
					                                                OpDecorate %48 Binding 48 
					                                                OpDecorate %49 RelaxedPrecision 
					                                                OpDecorate %55 RelaxedPrecision 
					                                                OpDecorate %56 RelaxedPrecision 
					                                                OpDecorate %58 RelaxedPrecision 
					                                                OpDecorate %61 RelaxedPrecision 
					                                                OpDecorate %290 RelaxedPrecision 
					                                                OpDecorate %291 RelaxedPrecision 
					                                                OpDecorate %296 RelaxedPrecision 
					                                                OpDecorate %298 RelaxedPrecision 
					                                                OpDecorate %300 RelaxedPrecision 
					                                                OpDecorate %301 RelaxedPrecision 
					                                                OpDecorate %302 RelaxedPrecision 
					                                                OpDecorate %307 RelaxedPrecision 
					                                                OpDecorate %310 RelaxedPrecision 
					                                                OpDecorate %311 RelaxedPrecision 
					                                                OpDecorate %312 RelaxedPrecision 
					                                                OpDecorate %316 Location 316 
					                                                OpDecorate %321 RelaxedPrecision 
					                                                OpDecorate %322 RelaxedPrecision 
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
					                                        %15 = OpTypeStruct %6 %6 %6 %14 
					                                        %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                        %18 = OpTypeInt 32 1 
					                                    i32 %19 = OpConstant 3 
					                                        %20 = OpTypePointer Uniform %14 
					                                    f32 %31 = OpConstant 3,674022E-40 
					                                        %32 = OpTypeInt 32 0 
					                                    u32 %33 = OpConstant 2 
					                                        %34 = OpTypePointer Private %6 
					                         Private f32_3* %36 = OpVariable Private 
					                                    f32 %38 = OpConstant 3,674022E-40 
					                                  f32_3 %39 = OpConstantComposite %38 %38 %38 
					                         Private f32_3* %41 = OpVariable Private 
					                                        %42 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %43 = OpTypePointer UniformConstant %42 
					   UniformConstant read_only Texture2D* %44 = OpVariable UniformConstant 
					                                        %46 = OpTypeSampler 
					                                        %47 = OpTypePointer UniformConstant %46 
					               UniformConstant sampler* %48 = OpVariable UniformConstant 
					                                        %50 = OpTypeSampledImage %42 
					                                    f32 %52 = OpConstant 3,674022E-40 
					                                    f32 %53 = OpConstant 3,674022E-40 
					                                  f32_2 %54 = OpConstantComposite %52 %53 
					                         Private f32_3* %57 = OpVariable Private 
					                                    f32 %59 = OpConstant 3,674022E-40 
					                                  f32_3 %60 = OpConstantComposite %59 %59 %59 
					                                        %64 = OpTypePointer Private %10 
					                         Private f32_2* %65 = OpVariable Private 
					                                    i32 %66 = OpConstant 0 
					                                        %67 = OpTypePointer Uniform %6 
					                                    u32 %71 = OpConstant 0 
					                                    f32 %78 = OpConstant 3,674022E-40 
					                                  f32_3 %79 = OpConstantComposite %78 %78 %78 
					                         Private f32_3* %81 = OpVariable Private 
					                         Private f32_3* %83 = OpVariable Private 
					                                    f32 %84 = OpConstant 3,674022E-40 
					                                    u32 %86 = OpConstant 1 
					                                        %89 = OpTypePointer Private %14 
					                         Private f32_4* %90 = OpVariable Private 
					                                        %92 = OpTypePointer Function %18 
					                                   i32 %100 = OpConstant 12 
					                                       %101 = OpTypeBool 
					                        Private f32_3* %103 = OpVariable Private 
					                                 f32_3 %106 = OpConstantComposite %53 %53 %53 
					                        Private f32_3* %110 = OpVariable Private 
					                        Private f32_3* %112 = OpVariable Private 
					                                   i32 %123 = OpConstant 10 
					                        Private f32_3* %125 = OpVariable Private 
					                                   f32 %128 = OpConstant 3,674022E-40 
					                                 f32_3 %129 = OpConstantComposite %128 %128 %128 
					                                   f32 %133 = OpConstant 3,674022E-40 
					                                 f32_3 %134 = OpConstantComposite %133 %133 %133 
					                          Private f32* %136 = OpVariable Private 
					                                   f32 %142 = OpConstant 3,674022E-40 
					                                   i32 %152 = OpConstant 1 
					                                   f32 %156 = OpConstant 3,674022E-40 
					                                   f32 %157 = OpConstant 3,674022E-40 
					                                 f32_2 %158 = OpConstantComposite %156 %157 
					                        Private f32_3* %182 = OpVariable Private 
					                                   f32 %184 = OpConstant 3,674022E-40 
					                                   f32 %185 = OpConstant 3,674022E-40 
					                                   f32 %186 = OpConstant 3,674022E-40 
					                                 f32_3 %187 = OpConstantComposite %184 %185 %186 
					                                   f32 %190 = OpConstant 3,674022E-40 
					                                 f32_3 %191 = OpConstantComposite %190 %190 %190 
					                                   f32 %199 = OpConstant 3,674022E-40 
					                                   i32 %204 = OpConstant 2 
					                                 f32_2 %213 = OpConstantComposite %53 %53 
					                          Private f32* %217 = OpVariable Private 
					                                   f32 %253 = OpConstant 3,674022E-40 
					                                   f32 %255 = OpConstant 3,674022E-40 
					                                 f32_3 %271 = OpConstantComposite %31 %31 %31 
					                                   f32 %276 = OpConstant 3,674022E-40 
					                                 f32_3 %277 = OpConstantComposite %276 %276 %276 
					                        Private f32_4* %300 = OpVariable Private 
					                                       %315 = OpTypePointer Output %14 
					                         Output f32_4* %316 = OpVariable Output 
					                                   u32 %326 = OpConstant 3 
					                                       %327 = OpTypePointer Output %6 
					                                       %330 = OpTypePointer Private %18 
					                          Private i32* %331 = OpVariable Private 
					                          Private i32* %332 = OpVariable Private 
					                                       %333 = OpTypePointer Private %101 
					                         Private bool* %334 = OpVariable Private 
					                         Private bool* %335 = OpVariable Private 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                          Function i32* %93 = OpVariable Function 
					                         Function i32* %116 = OpVariable Function 
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
					                           Private f32* %35 = OpAccessChain %9 %33 
					                                                OpStore %35 %31 
					                                  f32_3 %37 = OpLoad %9 
					                                  f32_3 %40 = OpFAdd %37 %39 
					                                                OpStore %36 %40 
					                    read_only Texture2D %45 = OpLoad %44 
					                                sampler %49 = OpLoad %48 
					             read_only Texture2DSampled %51 = OpSampledImage %45 %49 
					                                  f32_4 %55 = OpImageSampleImplicitLod %51 %54 
					                                  f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
					                                                OpStore %41 %56 
					                                  f32_3 %58 = OpLoad %41 
					                                  f32_3 %61 = OpFMul %58 %60 
					                                  f32_3 %62 = OpLoad %36 
					                                  f32_3 %63 = OpFAdd %61 %62 
					                                                OpStore %57 %63 
					                           Uniform f32* %68 = OpAccessChain %17 %66 
					                                    f32 %69 = OpLoad %68 
					                                    f32 %70 = OpFMul %69 %53 
					                           Private f32* %72 = OpAccessChain %65 %71 
					                                                OpStore %72 %70 
					                           Private f32* %73 = OpAccessChain %65 %71 
					                                    f32 %74 = OpLoad %73 
					                                    f32 %75 = OpExtInst %1 13 %74 
					                           Private f32* %76 = OpAccessChain %65 %71 
					                                                OpStore %76 %75 
					                                  f32_3 %77 = OpLoad %57 
					                                  f32_3 %80 = OpFMul %77 %79 
					                                                OpStore %57 %80 
					                                  f32_3 %82 = OpLoad %36 
					                                                OpStore %81 %82 
					                           Private f32* %85 = OpAccessChain %83 %71 
					                                                OpStore %85 %84 
					                           Private f32* %87 = OpAccessChain %83 %86 
					                                                OpStore %87 %84 
					                           Private f32* %88 = OpAccessChain %83 %33 
					                                                OpStore %88 %84 
					                           Private f32* %91 = OpAccessChain %90 %71 
					                                                OpStore %91 %84 
					                                                OpStore %93 %66 
					                                                OpBranch %94 
					                                        %94 = OpLabel 
					                                                OpLoopMerge %96 %97 None 
					                                                OpBranch %98 
					                                        %98 = OpLabel 
					                                    i32 %99 = OpLoad %93 
					                                  bool %102 = OpSLessThan %99 %100 
					                                                OpBranchConditional %102 %95 %96 
					                                        %95 = OpLabel 
					                                 f32_2 %104 = OpLoad %65 
					                                 f32_3 %105 = OpVectorShuffle %104 %104 0 0 0 
					                                 f32_3 %107 = OpFMul %105 %106 
					                                 f32_3 %108 = OpLoad %81 
					                                 f32_3 %109 = OpFAdd %107 %108 
					                                                OpStore %103 %109 
					                                 f32_3 %111 = OpLoad %103 
					                                                OpStore %110 %111 
					                          Private f32* %113 = OpAccessChain %90 %71 
					                                   f32 %114 = OpLoad %113 
					                          Private f32* %115 = OpAccessChain %112 %33 
					                                                OpStore %115 %114 
					                                                OpStore %116 %66 
					                                                OpBranch %117 
					                                       %117 = OpLabel 
					                                                OpLoopMerge %119 %120 None 
					                                                OpBranch %121 
					                                       %121 = OpLabel 
					                                   i32 %122 = OpLoad %116 
					                                  bool %124 = OpSLessThan %122 %123 
					                                                OpBranchConditional %124 %118 %119 
					                                       %118 = OpLabel 
					                                 f32_3 %126 = OpLoad %110 
					                                 f32_3 %127 = OpVectorShuffle %126 %126 2 1 0 
					                                 f32_3 %130 = OpFAdd %127 %129 
					                                                OpStore %125 %130 
					                                 f32_3 %131 = OpLoad %125 
					                                 f32_3 %132 = OpExtInst %1 4 %131 
					                                 f32_3 %135 = OpFAdd %132 %134 
					                                                OpStore %110 %135 
					                                 f32_3 %137 = OpLoad %81 
					                                 f32_3 %138 = OpLoad %110 
					                                   f32 %139 = OpDot %137 %138 
					                                                OpStore %136 %139 
					                                   f32 %140 = OpLoad %136 
					                                   f32 %141 = OpExtInst %1 4 %140 
					                                   f32 %143 = OpFMul %141 %142 
					                                                OpStore %136 %143 
					                                   f32 %144 = OpLoad %136 
					                                   f32 %145 = OpExtInst %1 29 %144 
					                                                OpStore %136 %145 
					                                   f32 %146 = OpLoad %136 
					                          Private f32* %147 = OpAccessChain %112 %33 
					                                   f32 %148 = OpLoad %147 
					                                   f32 %149 = OpFAdd %146 %148 
					                          Private f32* %150 = OpAccessChain %112 %33 
					                                                OpStore %150 %149 
					                                                OpBranch %120 
					                                       %120 = OpLabel 
					                                   i32 %151 = OpLoad %116 
					                                   i32 %153 = OpIAdd %151 %152 
					                                                OpStore %116 %153 
					                                                OpBranch %117 
					                                       %119 = OpLabel 
					                                 f32_3 %154 = OpLoad %112 
					                                 f32_2 %155 = OpVectorShuffle %154 %154 2 2 
					                                 f32_2 %159 = OpFMul %155 %158 
					                                 f32_4 %160 = OpLoad %90 
					                                 f32_4 %161 = OpVectorShuffle %160 %159 4 5 2 3 
					                                                OpStore %90 %161 
					                                 f32_3 %162 = OpLoad %57 
					                                 f32_4 %163 = OpLoad %90 
					                                 f32_3 %164 = OpVectorShuffle %163 %163 0 0 0 
					                                 f32_3 %165 = OpFMul %162 %164 
					                                 f32_3 %166 = OpLoad %81 
					                                 f32_3 %167 = OpFAdd %165 %166 
					                                                OpStore %81 %167 
					                                 f32_4 %168 = OpLoad %90 
					                                 f32_2 %169 = OpVectorShuffle %168 %168 0 0 
					                                 f32_4 %170 = OpLoad %90 
					                                 f32_2 %171 = OpVectorShuffle %170 %170 0 1 
					                                 f32_2 %172 = OpFMul %169 %171 
					                                 f32_4 %173 = OpLoad %90 
					                                 f32_4 %174 = OpVectorShuffle %173 %172 0 1 4 5 
					                                                OpStore %90 %174 
					                                 f32_4 %175 = OpLoad %90 
					                                 f32_2 %176 = OpVectorShuffle %175 %175 2 1 
					                                 f32_4 %177 = OpLoad %90 
					                                 f32_2 %178 = OpVectorShuffle %177 %177 3 2 
					                                 f32_2 %179 = OpFMul %176 %178 
					                                 f32_3 %180 = OpLoad %112 
					                                 f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
					                                                OpStore %112 %181 
					                                 f32_3 %183 = OpLoad %112 
					                                 f32_3 %188 = OpFMul %183 %187 
					                                                OpStore %182 %188 
					                                 f32_3 %189 = OpLoad %83 
					                                 f32_3 %192 = OpFMul %189 %191 
					                                 f32_3 %193 = OpLoad %182 
					                                 f32_3 %194 = OpFAdd %192 %193 
					                                                OpStore %83 %194 
					                                                OpBranch %97 
					                                        %97 = OpLabel 
					                                   i32 %195 = OpLoad %93 
					                                   i32 %196 = OpIAdd %195 %152 
					                                                OpStore %93 %196 
					                                                OpBranch %94 
					                                        %96 = OpLabel 
					                          Uniform f32* %197 = OpAccessChain %17 %152 
					                                   f32 %198 = OpLoad %197 
					                                   f32 %200 = OpFAdd %198 %199 
					                          Private f32* %201 = OpAccessChain %65 %71 
					                                                OpStore %201 %200 
					                          Private f32* %202 = OpAccessChain %65 %71 
					                                   f32 %203 = OpLoad %202 
					                          Uniform f32* %205 = OpAccessChain %17 %204 
					                                   f32 %206 = OpLoad %205 
					                                   f32 %207 = OpFNegate %206 
					                                   f32 %208 = OpFAdd %203 %207 
					                          Private f32* %209 = OpAccessChain %65 %71 
					                                                OpStore %209 %208 
					                                 f32_3 %210 = OpLoad %9 
					                                 f32_2 %211 = OpVectorShuffle %210 %210 0 1 
					                                 f32_2 %212 = OpFNegate %211 
					                                 f32_2 %214 = OpFAdd %212 %213 
					                                 f32_3 %215 = OpLoad %36 
					                                 f32_3 %216 = OpVectorShuffle %215 %214 3 4 2 
					                                                OpStore %36 %216 
					                                 f32_3 %218 = OpLoad %36 
					                                 f32_2 %219 = OpVectorShuffle %218 %218 0 1 
					                                 f32_3 %220 = OpLoad %36 
					                                 f32_2 %221 = OpVectorShuffle %220 %220 0 1 
					                                   f32 %222 = OpDot %219 %221 
					                                                OpStore %217 %222 
					                                   f32 %223 = OpLoad %217 
					                                   f32 %224 = OpExtInst %1 31 %223 
					                          Private f32* %225 = OpAccessChain %65 %86 
					                                                OpStore %225 %224 
					                                 f32_2 %226 = OpLoad %65 
					                          Uniform f32* %227 = OpAccessChain %17 %152 
					                                   f32 %228 = OpLoad %227 
					                          Uniform f32* %229 = OpAccessChain %17 %152 
					                                   f32 %230 = OpLoad %229 
					                                 f32_2 %231 = OpCompositeConstruct %228 %230 
					                                   f32 %232 = OpCompositeExtract %231 0 
					                                   f32 %233 = OpCompositeExtract %231 1 
					                                 f32_2 %234 = OpCompositeConstruct %232 %233 
					                                 f32_2 %235 = OpFNegate %234 
					                                 f32_2 %236 = OpFAdd %226 %235 
					                                                OpStore %65 %236 
					                          Private f32* %237 = OpAccessChain %65 %71 
					                                   f32 %238 = OpLoad %237 
					                                   f32 %239 = OpFDiv %31 %238 
					                          Private f32* %240 = OpAccessChain %65 %71 
					                                                OpStore %240 %239 
					                          Private f32* %241 = OpAccessChain %65 %71 
					                                   f32 %242 = OpLoad %241 
					                          Private f32* %243 = OpAccessChain %65 %86 
					                                   f32 %244 = OpLoad %243 
					                                   f32 %245 = OpFMul %242 %244 
					                          Private f32* %246 = OpAccessChain %65 %71 
					                                                OpStore %246 %245 
					                          Private f32* %247 = OpAccessChain %65 %71 
					                                   f32 %248 = OpLoad %247 
					                                   f32 %249 = OpExtInst %1 43 %248 %84 %31 
					                          Private f32* %250 = OpAccessChain %65 %71 
					                                                OpStore %250 %249 
					                          Private f32* %251 = OpAccessChain %65 %71 
					                                   f32 %252 = OpLoad %251 
					                                   f32 %254 = OpFMul %252 %253 
					                                   f32 %256 = OpFAdd %254 %255 
					                                                OpStore %217 %256 
					                          Private f32* %257 = OpAccessChain %65 %71 
					                                   f32 %258 = OpLoad %257 
					                          Private f32* %259 = OpAccessChain %65 %71 
					                                   f32 %260 = OpLoad %259 
					                                   f32 %261 = OpFMul %258 %260 
					                          Private f32* %262 = OpAccessChain %65 %71 
					                                                OpStore %262 %261 
					                                   f32 %263 = OpLoad %217 
					                                   f32 %264 = OpFNegate %263 
					                          Private f32* %265 = OpAccessChain %65 %71 
					                                   f32 %266 = OpLoad %265 
					                                   f32 %267 = OpFMul %264 %266 
					                                   f32 %268 = OpFAdd %267 %31 
					                          Private f32* %269 = OpAccessChain %65 %71 
					                                                OpStore %269 %268 
					                                 f32_3 %270 = OpLoad %83 
					                                 f32_3 %272 = OpFAdd %270 %271 
					                                                OpStore %36 %272 
					                                 f32_3 %273 = OpLoad %36 
					                                 f32_3 %274 = OpExtInst %1 30 %273 
					                                                OpStore %36 %274 
					                                 f32_3 %275 = OpLoad %36 
					                                 f32_3 %278 = OpFMul %275 %277 
					                                 f32_3 %279 = OpFAdd %278 %39 
					                                                OpStore %36 %279 
					                          Private f32* %280 = OpAccessChain %36 %71 
					                                   f32 %281 = OpLoad %280 
					                                   f32 %282 = OpFMul %281 %53 
					                                                OpStore %217 %282 
					                                 f32_3 %283 = OpLoad %9 
					                                 f32_2 %284 = OpVectorShuffle %283 %283 0 1 
					                                   f32 %285 = OpLoad %217 
					                                 f32_2 %286 = OpCompositeConstruct %285 %285 
					                                 f32_2 %287 = OpFMul %284 %286 
					                                 f32_3 %288 = OpLoad %57 
					                                 f32_3 %289 = OpVectorShuffle %288 %287 3 4 2 
					                                                OpStore %57 %289 
					                   read_only Texture2D %290 = OpLoad %44 
					                               sampler %291 = OpLoad %48 
					            read_only Texture2DSampled %292 = OpSampledImage %290 %291 
					                                 f32_3 %293 = OpLoad %57 
					                                 f32_2 %294 = OpVectorShuffle %293 %293 0 1 
					                                 f32_4 %295 = OpImageSampleImplicitLod %292 %294 
					                                 f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
					                                                OpStore %41 %296 
					                                 f32_3 %297 = OpLoad %36 
					                                 f32_3 %298 = OpLoad %41 
					                                 f32_3 %299 = OpFAdd %297 %298 
					                                                OpStore %36 %299 
					                   read_only Texture2D %301 = OpLoad %44 
					                               sampler %302 = OpLoad %48 
					            read_only Texture2DSampled %303 = OpSampledImage %301 %302 
					                                 f32_3 %304 = OpLoad %9 
					                                 f32_2 %305 = OpVectorShuffle %304 %304 0 1 
					                                 f32_4 %306 = OpImageSampleImplicitLod %303 %305 
					                                 f32_3 %307 = OpVectorShuffle %306 %306 0 1 2 
					                                 f32_4 %308 = OpLoad %300 
					                                 f32_4 %309 = OpVectorShuffle %308 %307 4 5 2 6 
					                                                OpStore %300 %309 
					                                 f32_4 %310 = OpLoad %300 
					                                 f32_3 %311 = OpVectorShuffle %310 %310 0 1 3 
					                                 f32_3 %312 = OpFNegate %311 
					                                 f32_3 %313 = OpLoad %36 
					                                 f32_3 %314 = OpFAdd %312 %313 
					                                                OpStore %36 %314 
					                                 f32_2 %317 = OpLoad %65 
					                                 f32_3 %318 = OpVectorShuffle %317 %317 0 0 0 
					                                 f32_3 %319 = OpLoad %36 
					                                 f32_3 %320 = OpFMul %318 %319 
					                                 f32_4 %321 = OpLoad %300 
					                                 f32_3 %322 = OpVectorShuffle %321 %321 0 1 3 
					                                 f32_3 %323 = OpFAdd %320 %322 
					                                 f32_4 %324 = OpLoad %316 
					                                 f32_4 %325 = OpVectorShuffle %324 %323 4 5 6 3 
					                                                OpStore %316 %325 
					                           Output f32* %328 = OpAccessChain %316 %326 
					                                                OpStore %328 %31 
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
					vec3 u_xlat15;
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
					    u_xlat0.z = 1.0;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat10_2 = texture(_MainTex, vec2(0.100000001, 0.5));
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1.xyz;
					    u_xlat20.x = _TimeX * 0.5;
					    u_xlat20.x = sin(u_xlat20.x);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat3.xyz = u_xlat1.xyz;
					    u_xlat4.x = float(0.0);
					    u_xlat4.y = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat5.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat6.xyz = u_xlat20.xxx * vec3(0.5, 0.5, 0.5) + u_xlat3.xyz;
					        u_xlat7.xyz = u_xlat6.xyz;
					        u_xlat8.z = u_xlat5.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<10 ; u_xlati_loop_2++)
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
					        u_xlat15.xyz = u_xlat8.xyz * vec3(3.1730001, -0.0410000011, -0.00033333333);
					        u_xlat4.xyz = u_xlat4.xyz * vec3(0.970000029, 0.970000029, 0.970000029) + u_xlat15.xyz;
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
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.277258873, 0.277258873, 0.277258873) + vec3(-0.5, -0.5, -0.5);
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