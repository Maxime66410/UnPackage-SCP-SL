Shader "CameraFilterPack/Vision_Psycho" {
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
			GpuProgramID 22495
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
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec2 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec2 u_xlat20;
					float u_xlat30;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.z = 1.0;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat10_2 = texture(_MainTex, vec2(0.100000001, 0.5));
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1.xyz;
					    u_xlat20.x = cos(_TimeX);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat3.z = _Value4;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat6.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat7.xyz = u_xlat20.xxx + u_xlat4.xyz;
					        u_xlat8.xyz = u_xlat7.xyz;
					        u_xlat31 = u_xlat6.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<10 ; u_xlati_loop_2++)
					        {
					            u_xlat9.xyz = u_xlat8.zyx + vec3(-0.200000003, -0.200000003, -0.200000003);
					            u_xlat8.xyz = abs(u_xlat9.xyz) + vec3(-0.699999988, -0.699999988, -0.699999988);
					            u_xlat33 = dot(u_xlat8.xyz, u_xlat4.xyz);
					            u_xlat33 = abs(u_xlat33) * -2.88539004;
					            u_xlat33 = exp2(u_xlat33);
					            u_xlat31 = u_xlat31 + u_xlat33;
					        }
					        u_xlat6.xy = vec2(u_xlat31) * vec2(0.333333343, 0.0333333351);
					        u_xlat4.xyz = u_xlat2.xyz * u_xlat6.xxx + u_xlat4.xyz;
					        u_xlat32 = u_xlat6.x * u_xlat6.x;
					        u_xlat33 = u_xlat6.x * u_xlat32;
					        u_xlat3.x = u_xlat33 * _Value3;
					        u_xlat3.y = u_xlat32 * _Value4;
					        u_xlat3.xyw = u_xlat3.xyz * u_xlat6.yyy;
					        u_xlat5.xyz = u_xlat5.xyz * vec3(0.970000029, 0.970000029, 0.970000029) + u_xlat3.xyw;
					    }
					    u_xlat1 = u_xlat5.xyzx;
					    u_xlat20.x = _Value + -0.0500000007;
					    u_xlat20.x = u_xlat20.x + (-_Value2);
					    u_xlat2.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat30 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat20.y = sqrt(u_xlat30);
					    u_xlat20.xy = u_xlat20.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat20.x = float(1.0) / u_xlat20.x;
					    u_xlat20.x = u_xlat20.x * u_xlat20.y;
					    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
					    u_xlat30 = u_xlat20.x * -2.0 + 3.0;
					    u_xlat20.x = u_xlat20.x * u_xlat20.x;
					    u_xlat20.x = (-u_xlat30) * u_xlat20.x + 1.0;
					    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = log2(u_xlat1);
					    u_xlat30 = u_xlat1.w * 0.138629436;
					    u_xlat2.xy = u_xlat0.xy * vec2(u_xlat30);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.277258873, 0.277258873, 0.277258873) + u_xlat10_2.xyz;
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
					; Bound: 349
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %329 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %15 0 Offset 15 
					                                                      OpMemberDecorate %15 1 Offset 15 
					                                                      OpMemberDecorate %15 2 Offset 15 
					                                                      OpMemberDecorate %15 3 Offset 15 
					                                                      OpMemberDecorate %15 4 Offset 15 
					                                                      OpMemberDecorate %15 5 RelaxedPrecision 
					                                                      OpMemberDecorate %15 5 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %23 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %44 RelaxedPrecision 
					                                                      OpDecorate %47 RelaxedPrecision 
					                                                      OpDecorate %47 DescriptorSet 47 
					                                                      OpDecorate %47 Binding 47 
					                                                      OpDecorate %48 RelaxedPrecision 
					                                                      OpDecorate %51 RelaxedPrecision 
					                                                      OpDecorate %51 DescriptorSet 51 
					                                                      OpDecorate %51 Binding 51 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %59 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %295 RelaxedPrecision 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %310 RelaxedPrecision 
					                                                      OpDecorate %311 RelaxedPrecision 
					                                                      OpDecorate %312 RelaxedPrecision 
					                                                      OpDecorate %317 RelaxedPrecision 
					                                                      OpDecorate %320 RelaxedPrecision 
					                                                      OpDecorate %321 RelaxedPrecision 
					                                                      OpDecorate %322 RelaxedPrecision 
					                                                      OpDecorate %329 Location 329 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                                      OpDecorate %336 RelaxedPrecision 
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
					                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %14 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 5 
					                                              %20 = OpTypePointer Uniform %14 
					                                          f32 %31 = OpConstant 3,674022E-40 
					                                              %32 = OpTypeInt 32 0 
					                                          u32 %33 = OpConstant 2 
					                                              %34 = OpTypePointer Private %6 
					                                              %36 = OpTypePointer Private %14 
					                               Private f32_4* %37 = OpVariable Private 
					                                          f32 %39 = OpConstant 3,674022E-40 
					                                        f32_3 %40 = OpConstantComposite %39 %39 %39 
					                               Private f32_3* %44 = OpVariable Private 
					                                              %45 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %46 = OpTypePointer UniformConstant %45 
					         UniformConstant read_only Texture2D* %47 = OpVariable UniformConstant 
					                                              %49 = OpTypeSampler 
					                                              %50 = OpTypePointer UniformConstant %49 
					                     UniformConstant sampler* %51 = OpVariable UniformConstant 
					                                              %53 = OpTypeSampledImage %45 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                          f32 %56 = OpConstant 3,674022E-40 
					                                        f32_2 %57 = OpConstantComposite %55 %56 
					                               Private f32_3* %60 = OpVariable Private 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                        f32_3 %63 = OpConstantComposite %62 %62 %62 
					                                              %68 = OpTypePointer Private %10 
					                               Private f32_2* %69 = OpVariable Private 
					                                          i32 %70 = OpConstant 0 
					                                              %71 = OpTypePointer Uniform %6 
					                                          u32 %75 = OpConstant 0 
					                                        f32_3 %78 = OpConstantComposite %56 %56 %56 
					                               Private f32_4* %80 = OpVariable Private 
					                                          i32 %81 = OpConstant 4 
					                               Private f32_3* %85 = OpVariable Private 
					                               Private f32_3* %88 = OpVariable Private 
					                                          f32 %89 = OpConstant 3,674022E-40 
					                                          u32 %91 = OpConstant 1 
					                               Private f32_2* %94 = OpVariable Private 
					                                              %96 = OpTypePointer Function %18 
					                                         i32 %104 = OpConstant 12 
					                                             %105 = OpTypeBool 
					                              Private f32_3* %107 = OpVariable Private 
					                              Private f32_3* %112 = OpVariable Private 
					                                Private f32* %114 = OpVariable Private 
					                                         i32 %124 = OpConstant 10 
					                              Private f32_3* %126 = OpVariable Private 
					                                         f32 %129 = OpConstant 3,674022E-40 
					                                       f32_3 %130 = OpConstantComposite %129 %129 %129 
					                                         f32 %134 = OpConstant 3,674022E-40 
					                                       f32_3 %135 = OpConstantComposite %134 %134 %134 
					                                Private f32* %137 = OpVariable Private 
					                                         f32 %143 = OpConstant 3,674022E-40 
					                                         i32 %151 = OpConstant 1 
					                                         f32 %155 = OpConstant 3,674022E-40 
					                                         f32 %156 = OpConstant 3,674022E-40 
					                                       f32_2 %157 = OpConstantComposite %155 %156 
					                                Private f32* %165 = OpVariable Private 
					                                         i32 %176 = OpConstant 3 
					                                         f32 %194 = OpConstant 3,674022E-40 
					                                       f32_3 %195 = OpConstantComposite %194 %194 %194 
					                                         f32 %206 = OpConstant 3,674022E-40 
					                                         i32 %211 = OpConstant 2 
					                                       f32_2 %220 = OpConstantComposite %56 %56 
					                                Private f32* %224 = OpVariable Private 
					                                         f32 %260 = OpConstant 3,674022E-40 
					                                         f32 %262 = OpConstant 3,674022E-40 
					                                       f32_4 %278 = OpConstantComposite %31 %31 %31 %31 
					                                         u32 %282 = OpConstant 3 
					                                         f32 %285 = OpConstant 3,674022E-40 
					                                         f32 %303 = OpConstant 3,674022E-40 
					                                       f32_3 %304 = OpConstantComposite %303 %303 %303 
					                              Private f32_4* %310 = OpVariable Private 
					                                             %328 = OpTypePointer Output %14 
					                               Output f32_4* %329 = OpVariable Output 
					                                             %340 = OpTypePointer Output %6 
					                                             %343 = OpTypePointer Private %18 
					                                Private i32* %344 = OpVariable Private 
					                                             %345 = OpTypePointer Private %105 
					                               Private bool* %346 = OpVariable Private 
					                                Private i32* %347 = OpVariable Private 
					                               Private bool* %348 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function i32* %97 = OpVariable Function 
					                               Function i32* %117 = OpVariable Function 
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
					                                        f32_3 %38 = OpLoad %9 
					                                        f32_3 %41 = OpFAdd %38 %40 
					                                        f32_4 %42 = OpLoad %37 
					                                        f32_4 %43 = OpVectorShuffle %42 %41 4 5 6 3 
					                                                      OpStore %37 %43 
					                          read_only Texture2D %48 = OpLoad %47 
					                                      sampler %52 = OpLoad %51 
					                   read_only Texture2DSampled %54 = OpSampledImage %48 %52 
					                                        f32_4 %58 = OpImageSampleImplicitLod %54 %57 
					                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
					                                                      OpStore %44 %59 
					                                        f32_3 %61 = OpLoad %44 
					                                        f32_3 %64 = OpFMul %61 %63 
					                                        f32_4 %65 = OpLoad %37 
					                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
					                                        f32_3 %67 = OpFAdd %64 %66 
					                                                      OpStore %60 %67 
					                                 Uniform f32* %72 = OpAccessChain %17 %70 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpExtInst %1 14 %73 
					                                 Private f32* %76 = OpAccessChain %69 %75 
					                                                      OpStore %76 %74 
					                                        f32_3 %77 = OpLoad %60 
					                                        f32_3 %79 = OpFMul %77 %78 
					                                                      OpStore %60 %79 
					                                 Uniform f32* %82 = OpAccessChain %17 %81 
					                                          f32 %83 = OpLoad %82 
					                                 Private f32* %84 = OpAccessChain %80 %33 
					                                                      OpStore %84 %83 
					                                        f32_4 %86 = OpLoad %37 
					                                        f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
					                                                      OpStore %85 %87 
					                                 Private f32* %90 = OpAccessChain %88 %75 
					                                                      OpStore %90 %89 
					                                 Private f32* %92 = OpAccessChain %88 %91 
					                                                      OpStore %92 %89 
					                                 Private f32* %93 = OpAccessChain %88 %33 
					                                                      OpStore %93 %89 
					                                 Private f32* %95 = OpAccessChain %94 %75 
					                                                      OpStore %95 %89 
					                                                      OpStore %97 %70 
					                                                      OpBranch %98 
					                                              %98 = OpLabel 
					                                                      OpLoopMerge %100 %101 None 
					                                                      OpBranch %102 
					                                             %102 = OpLabel 
					                                         i32 %103 = OpLoad %97 
					                                        bool %106 = OpSLessThan %103 %104 
					                                                      OpBranchConditional %106 %99 %100 
					                                              %99 = OpLabel 
					                                       f32_2 %108 = OpLoad %69 
					                                       f32_3 %109 = OpVectorShuffle %108 %108 0 0 0 
					                                       f32_3 %110 = OpLoad %85 
					                                       f32_3 %111 = OpFAdd %109 %110 
					                                                      OpStore %107 %111 
					                                       f32_3 %113 = OpLoad %107 
					                                                      OpStore %112 %113 
					                                Private f32* %115 = OpAccessChain %94 %75 
					                                         f32 %116 = OpLoad %115 
					                                                      OpStore %114 %116 
					                                                      OpStore %117 %70 
					                                                      OpBranch %118 
					                                             %118 = OpLabel 
					                                                      OpLoopMerge %120 %121 None 
					                                                      OpBranch %122 
					                                             %122 = OpLabel 
					                                         i32 %123 = OpLoad %117 
					                                        bool %125 = OpSLessThan %123 %124 
					                                                      OpBranchConditional %125 %119 %120 
					                                             %119 = OpLabel 
					                                       f32_3 %127 = OpLoad %112 
					                                       f32_3 %128 = OpVectorShuffle %127 %127 2 1 0 
					                                       f32_3 %131 = OpFAdd %128 %130 
					                                                      OpStore %126 %131 
					                                       f32_3 %132 = OpLoad %126 
					                                       f32_3 %133 = OpExtInst %1 4 %132 
					                                       f32_3 %136 = OpFAdd %133 %135 
					                                                      OpStore %112 %136 
					                                       f32_3 %138 = OpLoad %112 
					                                       f32_3 %139 = OpLoad %85 
					                                         f32 %140 = OpDot %138 %139 
					                                                      OpStore %137 %140 
					                                         f32 %141 = OpLoad %137 
					                                         f32 %142 = OpExtInst %1 4 %141 
					                                         f32 %144 = OpFMul %142 %143 
					                                                      OpStore %137 %144 
					                                         f32 %145 = OpLoad %137 
					                                         f32 %146 = OpExtInst %1 29 %145 
					                                                      OpStore %137 %146 
					                                         f32 %147 = OpLoad %114 
					                                         f32 %148 = OpLoad %137 
					                                         f32 %149 = OpFAdd %147 %148 
					                                                      OpStore %114 %149 
					                                                      OpBranch %121 
					                                             %121 = OpLabel 
					                                         i32 %150 = OpLoad %117 
					                                         i32 %152 = OpIAdd %150 %151 
					                                                      OpStore %117 %152 
					                                                      OpBranch %118 
					                                             %120 = OpLabel 
					                                         f32 %153 = OpLoad %114 
					                                       f32_2 %154 = OpCompositeConstruct %153 %153 
					                                       f32_2 %158 = OpFMul %154 %157 
					                                                      OpStore %94 %158 
					                                       f32_3 %159 = OpLoad %60 
					                                       f32_2 %160 = OpLoad %94 
					                                       f32_3 %161 = OpVectorShuffle %160 %160 0 0 0 
					                                       f32_3 %162 = OpFMul %159 %161 
					                                       f32_3 %163 = OpLoad %85 
					                                       f32_3 %164 = OpFAdd %162 %163 
					                                                      OpStore %85 %164 
					                                Private f32* %166 = OpAccessChain %94 %75 
					                                         f32 %167 = OpLoad %166 
					                                Private f32* %168 = OpAccessChain %94 %75 
					                                         f32 %169 = OpLoad %168 
					                                         f32 %170 = OpFMul %167 %169 
					                                                      OpStore %165 %170 
					                                Private f32* %171 = OpAccessChain %94 %75 
					                                         f32 %172 = OpLoad %171 
					                                         f32 %173 = OpLoad %165 
					                                         f32 %174 = OpFMul %172 %173 
					                                                      OpStore %137 %174 
					                                         f32 %175 = OpLoad %137 
					                                Uniform f32* %177 = OpAccessChain %17 %176 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpFMul %175 %178 
					                                Private f32* %180 = OpAccessChain %80 %75 
					                                                      OpStore %180 %179 
					                                         f32 %181 = OpLoad %165 
					                                Uniform f32* %182 = OpAccessChain %17 %81 
					                                         f32 %183 = OpLoad %182 
					                                         f32 %184 = OpFMul %181 %183 
					                                Private f32* %185 = OpAccessChain %80 %91 
					                                                      OpStore %185 %184 
					                                       f32_4 %186 = OpLoad %80 
					                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
					                                       f32_2 %188 = OpLoad %94 
					                                       f32_3 %189 = OpVectorShuffle %188 %188 1 1 1 
					                                       f32_3 %190 = OpFMul %187 %189 
					                                       f32_4 %191 = OpLoad %80 
					                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 2 6 
					                                                      OpStore %80 %192 
					                                       f32_3 %193 = OpLoad %88 
					                                       f32_3 %196 = OpFMul %193 %195 
					                                       f32_4 %197 = OpLoad %80 
					                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 3 
					                                       f32_3 %199 = OpFAdd %196 %198 
					                                                      OpStore %88 %199 
					                                                      OpBranch %101 
					                                             %101 = OpLabel 
					                                         i32 %200 = OpLoad %97 
					                                         i32 %201 = OpIAdd %200 %151 
					                                                      OpStore %97 %201 
					                                                      OpBranch %98 
					                                             %100 = OpLabel 
					                                       f32_3 %202 = OpLoad %88 
					                                       f32_4 %203 = OpVectorShuffle %202 %202 0 1 2 0 
					                                                      OpStore %37 %203 
					                                Uniform f32* %204 = OpAccessChain %17 %151 
					                                         f32 %205 = OpLoad %204 
					                                         f32 %207 = OpFAdd %205 %206 
					                                Private f32* %208 = OpAccessChain %69 %75 
					                                                      OpStore %208 %207 
					                                Private f32* %209 = OpAccessChain %69 %75 
					                                         f32 %210 = OpLoad %209 
					                                Uniform f32* %212 = OpAccessChain %17 %211 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpFNegate %213 
					                                         f32 %215 = OpFAdd %210 %214 
					                                Private f32* %216 = OpAccessChain %69 %75 
					                                                      OpStore %216 %215 
					                                       f32_3 %217 = OpLoad %9 
					                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
					                                       f32_2 %219 = OpFNegate %218 
					                                       f32_2 %221 = OpFAdd %219 %220 
					                                       f32_3 %222 = OpLoad %60 
					                                       f32_3 %223 = OpVectorShuffle %222 %221 3 4 2 
					                                                      OpStore %60 %223 
					                                       f32_3 %225 = OpLoad %60 
					                                       f32_2 %226 = OpVectorShuffle %225 %225 0 1 
					                                       f32_3 %227 = OpLoad %60 
					                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
					                                         f32 %229 = OpDot %226 %228 
					                                                      OpStore %224 %229 
					                                         f32 %230 = OpLoad %224 
					                                         f32 %231 = OpExtInst %1 31 %230 
					                                Private f32* %232 = OpAccessChain %69 %91 
					                                                      OpStore %232 %231 
					                                       f32_2 %233 = OpLoad %69 
					                                Uniform f32* %234 = OpAccessChain %17 %151 
					                                         f32 %235 = OpLoad %234 
					                                Uniform f32* %236 = OpAccessChain %17 %151 
					                                         f32 %237 = OpLoad %236 
					                                       f32_2 %238 = OpCompositeConstruct %235 %237 
					                                         f32 %239 = OpCompositeExtract %238 0 
					                                         f32 %240 = OpCompositeExtract %238 1 
					                                       f32_2 %241 = OpCompositeConstruct %239 %240 
					                                       f32_2 %242 = OpFNegate %241 
					                                       f32_2 %243 = OpFAdd %233 %242 
					                                                      OpStore %69 %243 
					                                Private f32* %244 = OpAccessChain %69 %75 
					                                         f32 %245 = OpLoad %244 
					                                         f32 %246 = OpFDiv %31 %245 
					                                Private f32* %247 = OpAccessChain %69 %75 
					                                                      OpStore %247 %246 
					                                Private f32* %248 = OpAccessChain %69 %75 
					                                         f32 %249 = OpLoad %248 
					                                Private f32* %250 = OpAccessChain %69 %91 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpFMul %249 %251 
					                                Private f32* %253 = OpAccessChain %69 %75 
					                                                      OpStore %253 %252 
					                                Private f32* %254 = OpAccessChain %69 %75 
					                                         f32 %255 = OpLoad %254 
					                                         f32 %256 = OpExtInst %1 43 %255 %89 %31 
					                                Private f32* %257 = OpAccessChain %69 %75 
					                                                      OpStore %257 %256 
					                                Private f32* %258 = OpAccessChain %69 %75 
					                                         f32 %259 = OpLoad %258 
					                                         f32 %261 = OpFMul %259 %260 
					                                         f32 %263 = OpFAdd %261 %262 
					                                                      OpStore %224 %263 
					                                Private f32* %264 = OpAccessChain %69 %75 
					                                         f32 %265 = OpLoad %264 
					                                Private f32* %266 = OpAccessChain %69 %75 
					                                         f32 %267 = OpLoad %266 
					                                         f32 %268 = OpFMul %265 %267 
					                                Private f32* %269 = OpAccessChain %69 %75 
					                                                      OpStore %269 %268 
					                                         f32 %270 = OpLoad %224 
					                                         f32 %271 = OpFNegate %270 
					                                Private f32* %272 = OpAccessChain %69 %75 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %274 = OpFMul %271 %273 
					                                         f32 %275 = OpFAdd %274 %31 
					                                Private f32* %276 = OpAccessChain %69 %75 
					                                                      OpStore %276 %275 
					                                       f32_4 %277 = OpLoad %37 
					                                       f32_4 %279 = OpFAdd %277 %278 
					                                                      OpStore %37 %279 
					                                       f32_4 %280 = OpLoad %37 
					                                       f32_4 %281 = OpExtInst %1 30 %280 
					                                                      OpStore %37 %281 
					                                Private f32* %283 = OpAccessChain %37 %282 
					                                         f32 %284 = OpLoad %283 
					                                         f32 %286 = OpFMul %284 %285 
					                                                      OpStore %224 %286 
					                                       f32_3 %287 = OpLoad %9 
					                                       f32_2 %288 = OpVectorShuffle %287 %287 0 1 
					                                         f32 %289 = OpLoad %224 
					                                       f32_2 %290 = OpCompositeConstruct %289 %289 
					                                       f32_2 %291 = OpFMul %288 %290 
					                                       f32_3 %292 = OpLoad %60 
					                                       f32_3 %293 = OpVectorShuffle %292 %291 3 4 2 
					                                                      OpStore %60 %293 
					                         read_only Texture2D %294 = OpLoad %47 
					                                     sampler %295 = OpLoad %51 
					                  read_only Texture2DSampled %296 = OpSampledImage %294 %295 
					                                       f32_3 %297 = OpLoad %60 
					                                       f32_2 %298 = OpVectorShuffle %297 %297 0 1 
					                                       f32_4 %299 = OpImageSampleImplicitLod %296 %298 
					                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
					                                                      OpStore %44 %300 
					                                       f32_4 %301 = OpLoad %37 
					                                       f32_3 %302 = OpVectorShuffle %301 %301 0 1 2 
					                                       f32_3 %305 = OpFMul %302 %304 
					                                       f32_3 %306 = OpLoad %44 
					                                       f32_3 %307 = OpFAdd %305 %306 
					                                       f32_4 %308 = OpLoad %37 
					                                       f32_4 %309 = OpVectorShuffle %308 %307 4 5 6 3 
					                                                      OpStore %37 %309 
					                         read_only Texture2D %311 = OpLoad %47 
					                                     sampler %312 = OpLoad %51 
					                  read_only Texture2DSampled %313 = OpSampledImage %311 %312 
					                                       f32_3 %314 = OpLoad %9 
					                                       f32_2 %315 = OpVectorShuffle %314 %314 0 1 
					                                       f32_4 %316 = OpImageSampleImplicitLod %313 %315 
					                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
					                                       f32_4 %318 = OpLoad %310 
					                                       f32_4 %319 = OpVectorShuffle %318 %317 4 5 2 6 
					                                                      OpStore %310 %319 
					                                       f32_4 %320 = OpLoad %310 
					                                       f32_3 %321 = OpVectorShuffle %320 %320 0 1 3 
					                                       f32_3 %322 = OpFNegate %321 
					                                       f32_4 %323 = OpLoad %37 
					                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
					                                       f32_3 %325 = OpFAdd %322 %324 
					                                       f32_4 %326 = OpLoad %37 
					                                       f32_4 %327 = OpVectorShuffle %326 %325 4 5 6 3 
					                                                      OpStore %37 %327 
					                                       f32_2 %330 = OpLoad %69 
					                                       f32_3 %331 = OpVectorShuffle %330 %330 0 0 0 
					                                       f32_4 %332 = OpLoad %37 
					                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
					                                       f32_3 %334 = OpFMul %331 %333 
					                                       f32_4 %335 = OpLoad %310 
					                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 3 
					                                       f32_3 %337 = OpFAdd %334 %336 
					                                       f32_4 %338 = OpLoad %329 
					                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
					                                                      OpStore %329 %339 
					                                 Output f32* %341 = OpAccessChain %329 %282 
					                                                      OpStore %341 %31 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec2 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec2 u_xlat20;
					float u_xlat30;
					int u_xlati30;
					float u_xlat31;
					bool u_xlatb31;
					float u_xlat32;
					int u_xlati32;
					float u_xlat33;
					bool u_xlatb33;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.z = 1.0;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat10_2 = texture(_MainTex, vec2(0.100000001, 0.5));
					    u_xlat2.xyz = u_xlat10_2.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat1.xyz;
					    u_xlat20.x = cos(_TimeX);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat3.z = _Value4;
					    u_xlat4.xyz = u_xlat1.xyz;
					    u_xlat5.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat6.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat7.xyz = u_xlat20.xxx + u_xlat4.xyz;
					        u_xlat8.xyz = u_xlat7.xyz;
					        u_xlat31 = u_xlat6.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<10 ; u_xlati_loop_2++)
					        {
					            u_xlat9.xyz = u_xlat8.zyx + vec3(-0.200000003, -0.200000003, -0.200000003);
					            u_xlat8.xyz = abs(u_xlat9.xyz) + vec3(-0.699999988, -0.699999988, -0.699999988);
					            u_xlat33 = dot(u_xlat8.xyz, u_xlat4.xyz);
					            u_xlat33 = abs(u_xlat33) * -2.88539004;
					            u_xlat33 = exp2(u_xlat33);
					            u_xlat31 = u_xlat31 + u_xlat33;
					        }
					        u_xlat6.xy = vec2(u_xlat31) * vec2(0.333333343, 0.0333333351);
					        u_xlat4.xyz = u_xlat2.xyz * u_xlat6.xxx + u_xlat4.xyz;
					        u_xlat32 = u_xlat6.x * u_xlat6.x;
					        u_xlat33 = u_xlat6.x * u_xlat32;
					        u_xlat3.x = u_xlat33 * _Value3;
					        u_xlat3.y = u_xlat32 * _Value4;
					        u_xlat3.xyw = u_xlat3.xyz * u_xlat6.yyy;
					        u_xlat5.xyz = u_xlat5.xyz * vec3(0.970000029, 0.970000029, 0.970000029) + u_xlat3.xyw;
					    }
					    u_xlat1 = u_xlat5.xyzx;
					    u_xlat20.x = _Value + -0.0500000007;
					    u_xlat20.x = u_xlat20.x + (-_Value2);
					    u_xlat2.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat30 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat20.y = sqrt(u_xlat30);
					    u_xlat20.xy = u_xlat20.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat20.x = float(1.0) / u_xlat20.x;
					    u_xlat20.x = u_xlat20.x * u_xlat20.y;
					    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
					    u_xlat30 = u_xlat20.x * -2.0 + 3.0;
					    u_xlat20.x = u_xlat20.x * u_xlat20.x;
					    u_xlat20.x = (-u_xlat30) * u_xlat20.x + 1.0;
					    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = log2(u_xlat1);
					    u_xlat30 = u_xlat1.w * 0.138629436;
					    u_xlat2.xy = u_xlat0.xy * vec2(u_xlat30);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.277258873, 0.277258873, 0.277258873) + u_xlat10_2.xyz;
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