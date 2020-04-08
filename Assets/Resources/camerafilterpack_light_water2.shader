Shader "CameraFilterPack/Light_Water2" {
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
			GpuProgramID 55150
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
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat7;
					int u_xlati7;
					float u_xlat10;
					vec2 u_xlat11;
					int u_xlati11;
					bool u_xlatb11;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = _TimeX * 1.29999995;
					    u_xlat1.xy = vec2(u_xlat10) * vec2(_Value2, _Value3);
					    u_xlat15 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat16 = float(u_xlati_loop_1);
					        u_xlat16 = u_xlat16 * 0.897597909;
					        u_xlat2 = sin(u_xlat16);
					        u_xlat3 = cos(u_xlat16);
					        u_xlat16 = u_xlat10 * u_xlat3;
					        u_xlat16 = u_xlat16 * _Value + u_xlat1.x;
					        u_xlat16 = u_xlat0.x + u_xlat16;
					        u_xlat7 = u_xlat10 * u_xlat2;
					        u_xlat7 = u_xlat7 * _Value + (-u_xlat1.y);
					        u_xlat7 = u_xlat0.y + (-u_xlat7);
					        u_xlat2 = u_xlat2 * u_xlat7;
					        u_xlat16 = u_xlat16 * u_xlat3 + (-u_xlat2);
					        u_xlat16 = u_xlat16 * 6.0;
					        u_xlat16 = cos(u_xlat16);
					        u_xlat15 = u_xlat16 * _Value4 + u_xlat15;
					    }
					    u_xlat15 = cos(u_xlat15);
					    u_xlat11.xy = u_xlat0.xy + vec2(8.52999973, 8.52999973);
					    u_xlat2 = float(0.0);
					    for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<8 ; u_xlati_loop_2++)
					    {
					        u_xlat12 = float(u_xlati_loop_2);
					        u_xlat12 = u_xlat12 * 0.897597909;
					        u_xlat3 = sin(u_xlat12);
					        u_xlat4 = cos(u_xlat12);
					        u_xlat12 = u_xlat10 * u_xlat4;
					        u_xlat12 = u_xlat12 * _Value + u_xlat1.x;
					        u_xlat12 = u_xlat11.x + u_xlat12;
					        u_xlat17 = u_xlat10 * u_xlat3;
					        u_xlat17 = u_xlat17 * _Value + (-u_xlat1.y);
					        u_xlat17 = u_xlat0.y + (-u_xlat17);
					        u_xlat17 = u_xlat3 * u_xlat17;
					        u_xlat12 = u_xlat12 * u_xlat4 + (-u_xlat17);
					        u_xlat12 = u_xlat12 * 6.0;
					        u_xlat12 = cos(u_xlat12);
					        u_xlat2 = u_xlat12 * _Value4 + u_xlat2;
					    }
					    u_xlat11.x = cos(u_xlat2);
					    u_xlat11.x = u_xlat15 + (-u_xlat11.x);
					    u_xlat2 = float(0.0);
					    for(int u_xlati_loop_3 = int(0) ; u_xlati_loop_3<8 ; u_xlati_loop_3++)
					    {
					        u_xlat12 = float(u_xlati_loop_3);
					        u_xlat12 = u_xlat12 * 0.897597909;
					        u_xlat3 = sin(u_xlat12);
					        u_xlat4 = cos(u_xlat12);
					        u_xlat12 = u_xlat10 * u_xlat4;
					        u_xlat12 = u_xlat12 * _Value + u_xlat1.x;
					        u_xlat12 = u_xlat0.x + u_xlat12;
					        u_xlat17 = u_xlat10 * u_xlat3;
					        u_xlat17 = u_xlat17 * _Value + (-u_xlat1.y);
					        u_xlat17 = u_xlat11.y + (-u_xlat17);
					        u_xlat17 = u_xlat3 * u_xlat17;
					        u_xlat12 = u_xlat12 * u_xlat4 + (-u_xlat17);
					        u_xlat12 = u_xlat12 * 6.0;
					        u_xlat12 = cos(u_xlat12);
					        u_xlat2 = u_xlat12 * _Value4 + u_xlat2;
					    }
					    u_xlat10 = cos(u_xlat2);
					    u_xlat10 = (-u_xlat10) + u_xlat15;
					    u_xlat15 = u_xlat11.x * 0.00833333377;
					    u_xlat1.x = u_xlat11.x * 0.0166666675 + u_xlat0.x;
					    u_xlat0.x = u_xlat10 * 0.00833333377;
					    u_xlat1.y = u_xlat10 * 0.0166666675 + u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat15;
					    u_xlat0.x = u_xlat0.x * 700.0 + 1.0;
					    u_xlat5 = u_xlat11.x * 0.00833333377 + -0.0120000001;
					    u_xlat10 = u_xlat10 * 0.00833333377 + -0.0120000001;
					    u_xlatb15 = 0.0<u_xlat5;
					    u_xlatb11 = 0.0<u_xlat10;
					    u_xlatb15 = u_xlatb15 && u_xlatb11;
					    u_xlat5 = u_xlat10 * u_xlat5;
					    u_xlat5 = u_xlat5 * 200000.0;
					    u_xlat10 = log2(u_xlat0.x);
					    u_xlat5 = u_xlat10 * u_xlat5;
					    u_xlat5 = exp2(u_xlat5);
					    u_xlat0.x = (u_xlatb15) ? u_xlat5 : u_xlat0.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0 = u_xlat0.xxxx * u_xlat10_1;
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
					; Bound: 392
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %381 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %14 0 Offset 14 
					                                                      OpMemberDecorate %14 1 Offset 14 
					                                                      OpMemberDecorate %14 2 Offset 14 
					                                                      OpMemberDecorate %14 3 Offset 14 
					                                                      OpMemberDecorate %14 4 Offset 14 
					                                                      OpMemberDecorate %14 5 RelaxedPrecision 
					                                                      OpMemberDecorate %14 5 Offset 14 
					                                                      OpDecorate %14 Block 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %367 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %370 DescriptorSet 370 
					                                                      OpDecorate %370 Binding 370 
					                                                      OpDecorate %371 RelaxedPrecision 
					                                                      OpDecorate %374 RelaxedPrecision 
					                                                      OpDecorate %374 DescriptorSet 374 
					                                                      OpDecorate %374 Binding 374 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %381 Location 381 
					                                                      OpDecorate %384 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeVector %6 4 
					                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %13 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 5 
					                                              %19 = OpTypePointer Uniform %13 
					                                              %28 = OpTypePointer Private %6 
					                                 Private f32* %29 = OpVariable Private 
					                                          i32 %30 = OpConstant 0 
					                                              %31 = OpTypePointer Uniform %6 
					                                          f32 %34 = OpConstant 3,674022E-40 
					                               Private f32_2* %36 = OpVariable Private 
					                                          i32 %39 = OpConstant 2 
					                                          i32 %42 = OpConstant 3 
					                                 Private f32* %47 = OpVariable Private 
					                                          f32 %48 = OpConstant 3,674022E-40 
					                                              %49 = OpTypePointer Function %17 
					                                          i32 %57 = OpConstant 8 
					                                              %58 = OpTypeBool 
					                                 Private f32* %60 = OpVariable Private 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                                 Private f32* %66 = OpVariable Private 
					                                 Private f32* %69 = OpVariable Private 
					                                          i32 %76 = OpConstant 1 
					                                              %80 = OpTypeInt 32 0 
					                                          u32 %81 = OpConstant 0 
					                                 Private f32* %89 = OpVariable Private 
					                                          u32 %97 = OpConstant 1 
					                                         f32 %117 = OpConstant 3,674022E-40 
					                                         i32 %122 = OpConstant 4 
					                              Private f32_2* %132 = OpVariable Private 
					                                         f32 %134 = OpConstant 3,674022E-40 
					                                       f32_2 %135 = OpConstantComposite %134 %134 
					                                Private f32* %145 = OpVariable Private 
					                                Private f32* %152 = OpVariable Private 
					                                Private f32* %169 = OpVariable Private 
					                                         f32 %291 = OpConstant 3,674022E-40 
					                                         f32 %295 = OpConstant 3,674022E-40 
					                                         f32 %317 = OpConstant 3,674022E-40 
					                                         f32 %319 = OpConstant 3,674022E-40 
					                                Private f32* %322 = OpVariable Private 
					                                         f32 %326 = OpConstant 3,674022E-40 
					                                             %331 = OpTypePointer Private %58 
					                               Private bool* %332 = OpVariable Private 
					                               Private bool* %335 = OpVariable Private 
					                                         f32 %345 = OpConstant 3,674022E-40 
					                                             %356 = OpTypePointer Function %6 
					                                             %366 = OpTypePointer Private %13 
					                              Private f32_4* %367 = OpVariable Private 
					                                             %368 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %369 = OpTypePointer UniformConstant %368 
					        UniformConstant read_only Texture2D* %370 = OpVariable UniformConstant 
					                                             %372 = OpTypeSampler 
					                                             %373 = OpTypePointer UniformConstant %372 
					                    UniformConstant sampler* %374 = OpVariable UniformConstant 
					                                             %376 = OpTypeSampledImage %368 
					                                             %380 = OpTypePointer Output %13 
					                               Output f32_4* %381 = OpVariable Output 
					                                             %387 = OpTypePointer Private %17 
					                                Private i32* %388 = OpVariable Private 
					                                Private i32* %389 = OpVariable Private 
					                               Private bool* %390 = OpVariable Private 
					                               Private bool* %391 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function i32* %50 = OpVariable Function 
					                               Function i32* %137 = OpVariable Function 
					                               Function i32* %216 = OpVariable Function 
					                               Function f32* %357 = OpVariable Function 
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
					                                 Uniform f32* %32 = OpAccessChain %16 %30 
					                                          f32 %33 = OpLoad %32 
					                                          f32 %35 = OpFMul %33 %34 
					                                                      OpStore %29 %35 
					                                          f32 %37 = OpLoad %29 
					                                        f32_2 %38 = OpCompositeConstruct %37 %37 
					                                 Uniform f32* %40 = OpAccessChain %16 %39 
					                                          f32 %41 = OpLoad %40 
					                                 Uniform f32* %43 = OpAccessChain %16 %42 
					                                          f32 %44 = OpLoad %43 
					                                        f32_2 %45 = OpCompositeConstruct %41 %44 
					                                        f32_2 %46 = OpFMul %38 %45 
					                                                      OpStore %36 %46 
					                                                      OpStore %47 %48 
					                                                      OpStore %50 %30 
					                                                      OpBranch %51 
					                                              %51 = OpLabel 
					                                                      OpLoopMerge %53 %54 None 
					                                                      OpBranch %55 
					                                              %55 = OpLabel 
					                                          i32 %56 = OpLoad %50 
					                                         bool %59 = OpSLessThan %56 %57 
					                                                      OpBranchConditional %59 %52 %53 
					                                              %52 = OpLabel 
					                                          i32 %61 = OpLoad %50 
					                                          f32 %62 = OpConvertSToF %61 
					                                                      OpStore %60 %62 
					                                          f32 %63 = OpLoad %60 
					                                          f32 %65 = OpFMul %63 %64 
					                                                      OpStore %60 %65 
					                                          f32 %67 = OpLoad %60 
					                                          f32 %68 = OpExtInst %1 13 %67 
					                                                      OpStore %66 %68 
					                                          f32 %70 = OpLoad %60 
					                                          f32 %71 = OpExtInst %1 14 %70 
					                                                      OpStore %69 %71 
					                                          f32 %72 = OpLoad %29 
					                                          f32 %73 = OpLoad %69 
					                                          f32 %74 = OpFMul %72 %73 
					                                                      OpStore %60 %74 
					                                          f32 %75 = OpLoad %60 
					                                 Uniform f32* %77 = OpAccessChain %16 %76 
					                                          f32 %78 = OpLoad %77 
					                                          f32 %79 = OpFMul %75 %78 
					                                 Private f32* %82 = OpAccessChain %36 %81 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %84 = OpFAdd %79 %83 
					                                                      OpStore %60 %84 
					                                 Private f32* %85 = OpAccessChain %9 %81 
					                                          f32 %86 = OpLoad %85 
					                                          f32 %87 = OpLoad %60 
					                                          f32 %88 = OpFAdd %86 %87 
					                                                      OpStore %60 %88 
					                                          f32 %90 = OpLoad %29 
					                                          f32 %91 = OpLoad %66 
					                                          f32 %92 = OpFMul %90 %91 
					                                                      OpStore %89 %92 
					                                          f32 %93 = OpLoad %89 
					                                 Uniform f32* %94 = OpAccessChain %16 %76 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFMul %93 %95 
					                                 Private f32* %98 = OpAccessChain %36 %97 
					                                          f32 %99 = OpLoad %98 
					                                         f32 %100 = OpFNegate %99 
					                                         f32 %101 = OpFAdd %96 %100 
					                                                      OpStore %89 %101 
					                                Private f32* %102 = OpAccessChain %9 %97 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpLoad %89 
					                                         f32 %105 = OpFNegate %104 
					                                         f32 %106 = OpFAdd %103 %105 
					                                                      OpStore %89 %106 
					                                         f32 %107 = OpLoad %66 
					                                         f32 %108 = OpLoad %89 
					                                         f32 %109 = OpFMul %107 %108 
					                                                      OpStore %66 %109 
					                                         f32 %110 = OpLoad %60 
					                                         f32 %111 = OpLoad %69 
					                                         f32 %112 = OpFMul %110 %111 
					                                         f32 %113 = OpLoad %66 
					                                         f32 %114 = OpFNegate %113 
					                                         f32 %115 = OpFAdd %112 %114 
					                                                      OpStore %60 %115 
					                                         f32 %116 = OpLoad %60 
					                                         f32 %118 = OpFMul %116 %117 
					                                                      OpStore %60 %118 
					                                         f32 %119 = OpLoad %60 
					                                         f32 %120 = OpExtInst %1 14 %119 
					                                                      OpStore %60 %120 
					                                         f32 %121 = OpLoad %60 
					                                Uniform f32* %123 = OpAccessChain %16 %122 
					                                         f32 %124 = OpLoad %123 
					                                         f32 %125 = OpFMul %121 %124 
					                                         f32 %126 = OpLoad %47 
					                                         f32 %127 = OpFAdd %125 %126 
					                                                      OpStore %47 %127 
					                                                      OpBranch %54 
					                                              %54 = OpLabel 
					                                         i32 %128 = OpLoad %50 
					                                         i32 %129 = OpIAdd %128 %76 
					                                                      OpStore %50 %129 
					                                                      OpBranch %51 
					                                              %53 = OpLabel 
					                                         f32 %130 = OpLoad %47 
					                                         f32 %131 = OpExtInst %1 14 %130 
					                                                      OpStore %47 %131 
					                                       f32_2 %133 = OpLoad %9 
					                                       f32_2 %136 = OpFAdd %133 %135 
					                                                      OpStore %132 %136 
					                                                      OpStore %66 %48 
					                                                      OpStore %137 %30 
					                                                      OpBranch %138 
					                                             %138 = OpLabel 
					                                                      OpLoopMerge %140 %141 None 
					                                                      OpBranch %142 
					                                             %142 = OpLabel 
					                                         i32 %143 = OpLoad %137 
					                                        bool %144 = OpSLessThan %143 %57 
					                                                      OpBranchConditional %144 %139 %140 
					                                             %139 = OpLabel 
					                                         i32 %146 = OpLoad %137 
					                                         f32 %147 = OpConvertSToF %146 
					                                                      OpStore %145 %147 
					                                         f32 %148 = OpLoad %145 
					                                         f32 %149 = OpFMul %148 %64 
					                                                      OpStore %145 %149 
					                                         f32 %150 = OpLoad %145 
					                                         f32 %151 = OpExtInst %1 13 %150 
					                                                      OpStore %69 %151 
					                                         f32 %153 = OpLoad %145 
					                                         f32 %154 = OpExtInst %1 14 %153 
					                                                      OpStore %152 %154 
					                                         f32 %155 = OpLoad %29 
					                                         f32 %156 = OpLoad %152 
					                                         f32 %157 = OpFMul %155 %156 
					                                                      OpStore %145 %157 
					                                         f32 %158 = OpLoad %145 
					                                Uniform f32* %159 = OpAccessChain %16 %76 
					                                         f32 %160 = OpLoad %159 
					                                         f32 %161 = OpFMul %158 %160 
					                                Private f32* %162 = OpAccessChain %36 %81 
					                                         f32 %163 = OpLoad %162 
					                                         f32 %164 = OpFAdd %161 %163 
					                                                      OpStore %145 %164 
					                                Private f32* %165 = OpAccessChain %132 %81 
					                                         f32 %166 = OpLoad %165 
					                                         f32 %167 = OpLoad %145 
					                                         f32 %168 = OpFAdd %166 %167 
					                                                      OpStore %145 %168 
					                                         f32 %170 = OpLoad %29 
					                                         f32 %171 = OpLoad %69 
					                                         f32 %172 = OpFMul %170 %171 
					                                                      OpStore %169 %172 
					                                         f32 %173 = OpLoad %169 
					                                Uniform f32* %174 = OpAccessChain %16 %76 
					                                         f32 %175 = OpLoad %174 
					                                         f32 %176 = OpFMul %173 %175 
					                                Private f32* %177 = OpAccessChain %36 %97 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpFNegate %178 
					                                         f32 %180 = OpFAdd %176 %179 
					                                                      OpStore %169 %180 
					                                Private f32* %181 = OpAccessChain %9 %97 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpLoad %169 
					                                         f32 %184 = OpFNegate %183 
					                                         f32 %185 = OpFAdd %182 %184 
					                                                      OpStore %169 %185 
					                                         f32 %186 = OpLoad %69 
					                                         f32 %187 = OpLoad %169 
					                                         f32 %188 = OpFMul %186 %187 
					                                                      OpStore %169 %188 
					                                         f32 %189 = OpLoad %145 
					                                         f32 %190 = OpLoad %152 
					                                         f32 %191 = OpFMul %189 %190 
					                                         f32 %192 = OpLoad %169 
					                                         f32 %193 = OpFNegate %192 
					                                         f32 %194 = OpFAdd %191 %193 
					                                                      OpStore %145 %194 
					                                         f32 %195 = OpLoad %145 
					                                         f32 %196 = OpFMul %195 %117 
					                                                      OpStore %145 %196 
					                                         f32 %197 = OpLoad %145 
					                                         f32 %198 = OpExtInst %1 14 %197 
					                                                      OpStore %145 %198 
					                                         f32 %199 = OpLoad %145 
					                                Uniform f32* %200 = OpAccessChain %16 %122 
					                                         f32 %201 = OpLoad %200 
					                                         f32 %202 = OpFMul %199 %201 
					                                         f32 %203 = OpLoad %66 
					                                         f32 %204 = OpFAdd %202 %203 
					                                                      OpStore %66 %204 
					                                                      OpBranch %141 
					                                             %141 = OpLabel 
					                                         i32 %205 = OpLoad %137 
					                                         i32 %206 = OpIAdd %205 %76 
					                                                      OpStore %137 %206 
					                                                      OpBranch %138 
					                                             %140 = OpLabel 
					                                         f32 %207 = OpLoad %66 
					                                         f32 %208 = OpExtInst %1 14 %207 
					                                Private f32* %209 = OpAccessChain %132 %81 
					                                                      OpStore %209 %208 
					                                         f32 %210 = OpLoad %47 
					                                Private f32* %211 = OpAccessChain %132 %81 
					                                         f32 %212 = OpLoad %211 
					                                         f32 %213 = OpFNegate %212 
					                                         f32 %214 = OpFAdd %210 %213 
					                                Private f32* %215 = OpAccessChain %132 %81 
					                                                      OpStore %215 %214 
					                                                      OpStore %66 %48 
					                                                      OpStore %216 %30 
					                                                      OpBranch %217 
					                                             %217 = OpLabel 
					                                                      OpLoopMerge %219 %220 None 
					                                                      OpBranch %221 
					                                             %221 = OpLabel 
					                                         i32 %222 = OpLoad %216 
					                                        bool %223 = OpSLessThan %222 %57 
					                                                      OpBranchConditional %223 %218 %219 
					                                             %218 = OpLabel 
					                                         i32 %224 = OpLoad %216 
					                                         f32 %225 = OpConvertSToF %224 
					                                                      OpStore %145 %225 
					                                         f32 %226 = OpLoad %145 
					                                         f32 %227 = OpFMul %226 %64 
					                                                      OpStore %145 %227 
					                                         f32 %228 = OpLoad %145 
					                                         f32 %229 = OpExtInst %1 13 %228 
					                                                      OpStore %69 %229 
					                                         f32 %230 = OpLoad %145 
					                                         f32 %231 = OpExtInst %1 14 %230 
					                                                      OpStore %152 %231 
					                                         f32 %232 = OpLoad %29 
					                                         f32 %233 = OpLoad %152 
					                                         f32 %234 = OpFMul %232 %233 
					                                                      OpStore %145 %234 
					                                         f32 %235 = OpLoad %145 
					                                Uniform f32* %236 = OpAccessChain %16 %76 
					                                         f32 %237 = OpLoad %236 
					                                         f32 %238 = OpFMul %235 %237 
					                                Private f32* %239 = OpAccessChain %36 %81 
					                                         f32 %240 = OpLoad %239 
					                                         f32 %241 = OpFAdd %238 %240 
					                                                      OpStore %145 %241 
					                                Private f32* %242 = OpAccessChain %9 %81 
					                                         f32 %243 = OpLoad %242 
					                                         f32 %244 = OpLoad %145 
					                                         f32 %245 = OpFAdd %243 %244 
					                                                      OpStore %145 %245 
					                                         f32 %246 = OpLoad %29 
					                                         f32 %247 = OpLoad %69 
					                                         f32 %248 = OpFMul %246 %247 
					                                                      OpStore %169 %248 
					                                         f32 %249 = OpLoad %169 
					                                Uniform f32* %250 = OpAccessChain %16 %76 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpFMul %249 %251 
					                                Private f32* %253 = OpAccessChain %36 %97 
					                                         f32 %254 = OpLoad %253 
					                                         f32 %255 = OpFNegate %254 
					                                         f32 %256 = OpFAdd %252 %255 
					                                                      OpStore %169 %256 
					                                Private f32* %257 = OpAccessChain %132 %97 
					                                         f32 %258 = OpLoad %257 
					                                         f32 %259 = OpLoad %169 
					                                         f32 %260 = OpFNegate %259 
					                                         f32 %261 = OpFAdd %258 %260 
					                                                      OpStore %169 %261 
					                                         f32 %262 = OpLoad %69 
					                                         f32 %263 = OpLoad %169 
					                                         f32 %264 = OpFMul %262 %263 
					                                                      OpStore %169 %264 
					                                         f32 %265 = OpLoad %145 
					                                         f32 %266 = OpLoad %152 
					                                         f32 %267 = OpFMul %265 %266 
					                                         f32 %268 = OpLoad %169 
					                                         f32 %269 = OpFNegate %268 
					                                         f32 %270 = OpFAdd %267 %269 
					                                                      OpStore %145 %270 
					                                         f32 %271 = OpLoad %145 
					                                         f32 %272 = OpFMul %271 %117 
					                                                      OpStore %145 %272 
					                                         f32 %273 = OpLoad %145 
					                                         f32 %274 = OpExtInst %1 14 %273 
					                                                      OpStore %145 %274 
					                                         f32 %275 = OpLoad %145 
					                                Uniform f32* %276 = OpAccessChain %16 %122 
					                                         f32 %277 = OpLoad %276 
					                                         f32 %278 = OpFMul %275 %277 
					                                         f32 %279 = OpLoad %66 
					                                         f32 %280 = OpFAdd %278 %279 
					                                                      OpStore %66 %280 
					                                                      OpBranch %220 
					                                             %220 = OpLabel 
					                                         i32 %281 = OpLoad %216 
					                                         i32 %282 = OpIAdd %281 %76 
					                                                      OpStore %216 %282 
					                                                      OpBranch %217 
					                                             %219 = OpLabel 
					                                         f32 %283 = OpLoad %66 
					                                         f32 %284 = OpExtInst %1 14 %283 
					                                                      OpStore %29 %284 
					                                         f32 %285 = OpLoad %29 
					                                         f32 %286 = OpFNegate %285 
					                                         f32 %287 = OpLoad %47 
					                                         f32 %288 = OpFAdd %286 %287 
					                                                      OpStore %29 %288 
					                                Private f32* %289 = OpAccessChain %132 %81 
					                                         f32 %290 = OpLoad %289 
					                                         f32 %292 = OpFMul %290 %291 
					                                                      OpStore %47 %292 
					                                Private f32* %293 = OpAccessChain %132 %81 
					                                         f32 %294 = OpLoad %293 
					                                         f32 %296 = OpFMul %294 %295 
					                                Private f32* %297 = OpAccessChain %9 %81 
					                                         f32 %298 = OpLoad %297 
					                                         f32 %299 = OpFAdd %296 %298 
					                                Private f32* %300 = OpAccessChain %36 %81 
					                                                      OpStore %300 %299 
					                                         f32 %301 = OpLoad %29 
					                                         f32 %302 = OpFMul %301 %291 
					                                Private f32* %303 = OpAccessChain %9 %81 
					                                                      OpStore %303 %302 
					                                         f32 %304 = OpLoad %29 
					                                         f32 %305 = OpFMul %304 %295 
					                                Private f32* %306 = OpAccessChain %9 %97 
					                                         f32 %307 = OpLoad %306 
					                                         f32 %308 = OpFAdd %305 %307 
					                                Private f32* %309 = OpAccessChain %36 %97 
					                                                      OpStore %309 %308 
					                                Private f32* %310 = OpAccessChain %9 %81 
					                                         f32 %311 = OpLoad %310 
					                                         f32 %312 = OpLoad %47 
					                                         f32 %313 = OpFMul %311 %312 
					                                Private f32* %314 = OpAccessChain %9 %81 
					                                                      OpStore %314 %313 
					                                Private f32* %315 = OpAccessChain %9 %81 
					                                         f32 %316 = OpLoad %315 
					                                         f32 %318 = OpFMul %316 %317 
					                                         f32 %320 = OpFAdd %318 %319 
					                                Private f32* %321 = OpAccessChain %9 %81 
					                                                      OpStore %321 %320 
					                                Private f32* %323 = OpAccessChain %132 %81 
					                                         f32 %324 = OpLoad %323 
					                                         f32 %325 = OpFMul %324 %291 
					                                         f32 %327 = OpFAdd %325 %326 
					                                                      OpStore %322 %327 
					                                         f32 %328 = OpLoad %29 
					                                         f32 %329 = OpFMul %328 %291 
					                                         f32 %330 = OpFAdd %329 %326 
					                                                      OpStore %29 %330 
					                                         f32 %333 = OpLoad %322 
					                                        bool %334 = OpFOrdLessThan %48 %333 
					                                                      OpStore %332 %334 
					                                         f32 %336 = OpLoad %29 
					                                        bool %337 = OpFOrdLessThan %48 %336 
					                                                      OpStore %335 %337 
					                                        bool %338 = OpLoad %332 
					                                        bool %339 = OpLoad %335 
					                                        bool %340 = OpLogicalAnd %338 %339 
					                                                      OpStore %332 %340 
					                                         f32 %341 = OpLoad %29 
					                                         f32 %342 = OpLoad %322 
					                                         f32 %343 = OpFMul %341 %342 
					                                                      OpStore %322 %343 
					                                         f32 %344 = OpLoad %322 
					                                         f32 %346 = OpFMul %344 %345 
					                                                      OpStore %322 %346 
					                                Private f32* %347 = OpAccessChain %9 %81 
					                                         f32 %348 = OpLoad %347 
					                                         f32 %349 = OpExtInst %1 30 %348 
					                                                      OpStore %29 %349 
					                                         f32 %350 = OpLoad %29 
					                                         f32 %351 = OpLoad %322 
					                                         f32 %352 = OpFMul %350 %351 
					                                                      OpStore %322 %352 
					                                         f32 %353 = OpLoad %322 
					                                         f32 %354 = OpExtInst %1 29 %353 
					                                                      OpStore %322 %354 
					                                        bool %355 = OpLoad %332 
					                                                      OpSelectionMerge %359 None 
					                                                      OpBranchConditional %355 %358 %361 
					                                             %358 = OpLabel 
					                                         f32 %360 = OpLoad %322 
					                                                      OpStore %357 %360 
					                                                      OpBranch %359 
					                                             %361 = OpLabel 
					                                Private f32* %362 = OpAccessChain %9 %81 
					                                         f32 %363 = OpLoad %362 
					                                                      OpStore %357 %363 
					                                                      OpBranch %359 
					                                             %359 = OpLabel 
					                                         f32 %364 = OpLoad %357 
					                                Private f32* %365 = OpAccessChain %9 %81 
					                                                      OpStore %365 %364 
					                         read_only Texture2D %371 = OpLoad %370 
					                                     sampler %375 = OpLoad %374 
					                  read_only Texture2DSampled %377 = OpSampledImage %371 %375 
					                                       f32_2 %378 = OpLoad %36 
					                                       f32_4 %379 = OpImageSampleImplicitLod %377 %378 
					                                                      OpStore %367 %379 
					                                       f32_2 %382 = OpLoad %9 
					                                       f32_4 %383 = OpVectorShuffle %382 %382 0 0 0 0 
					                                       f32_4 %384 = OpLoad %367 
					                                       f32_4 %385 = OpFMul %383 %384 
					                                                      OpStore %381 %385 
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
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat7;
					int u_xlati7;
					float u_xlat10;
					vec2 u_xlat11;
					int u_xlati11;
					bool u_xlatb11;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = _TimeX * 1.29999995;
					    u_xlat1.xy = vec2(u_xlat10) * vec2(_Value2, _Value3);
					    u_xlat15 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat16 = float(u_xlati_loop_1);
					        u_xlat16 = u_xlat16 * 0.897597909;
					        u_xlat2 = sin(u_xlat16);
					        u_xlat3 = cos(u_xlat16);
					        u_xlat16 = u_xlat10 * u_xlat3;
					        u_xlat16 = u_xlat16 * _Value + u_xlat1.x;
					        u_xlat16 = u_xlat0.x + u_xlat16;
					        u_xlat7 = u_xlat10 * u_xlat2;
					        u_xlat7 = u_xlat7 * _Value + (-u_xlat1.y);
					        u_xlat7 = u_xlat0.y + (-u_xlat7);
					        u_xlat2 = u_xlat2 * u_xlat7;
					        u_xlat16 = u_xlat16 * u_xlat3 + (-u_xlat2);
					        u_xlat16 = u_xlat16 * 6.0;
					        u_xlat16 = cos(u_xlat16);
					        u_xlat15 = u_xlat16 * _Value4 + u_xlat15;
					    }
					    u_xlat15 = cos(u_xlat15);
					    u_xlat11.xy = u_xlat0.xy + vec2(8.52999973, 8.52999973);
					    u_xlat2 = float(0.0);
					    for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<8 ; u_xlati_loop_2++)
					    {
					        u_xlat12 = float(u_xlati_loop_2);
					        u_xlat12 = u_xlat12 * 0.897597909;
					        u_xlat3 = sin(u_xlat12);
					        u_xlat4 = cos(u_xlat12);
					        u_xlat12 = u_xlat10 * u_xlat4;
					        u_xlat12 = u_xlat12 * _Value + u_xlat1.x;
					        u_xlat12 = u_xlat11.x + u_xlat12;
					        u_xlat17 = u_xlat10 * u_xlat3;
					        u_xlat17 = u_xlat17 * _Value + (-u_xlat1.y);
					        u_xlat17 = u_xlat0.y + (-u_xlat17);
					        u_xlat17 = u_xlat3 * u_xlat17;
					        u_xlat12 = u_xlat12 * u_xlat4 + (-u_xlat17);
					        u_xlat12 = u_xlat12 * 6.0;
					        u_xlat12 = cos(u_xlat12);
					        u_xlat2 = u_xlat12 * _Value4 + u_xlat2;
					    }
					    u_xlat11.x = cos(u_xlat2);
					    u_xlat11.x = u_xlat15 + (-u_xlat11.x);
					    u_xlat2 = float(0.0);
					    for(int u_xlati_loop_3 = int(0) ; u_xlati_loop_3<8 ; u_xlati_loop_3++)
					    {
					        u_xlat12 = float(u_xlati_loop_3);
					        u_xlat12 = u_xlat12 * 0.897597909;
					        u_xlat3 = sin(u_xlat12);
					        u_xlat4 = cos(u_xlat12);
					        u_xlat12 = u_xlat10 * u_xlat4;
					        u_xlat12 = u_xlat12 * _Value + u_xlat1.x;
					        u_xlat12 = u_xlat0.x + u_xlat12;
					        u_xlat17 = u_xlat10 * u_xlat3;
					        u_xlat17 = u_xlat17 * _Value + (-u_xlat1.y);
					        u_xlat17 = u_xlat11.y + (-u_xlat17);
					        u_xlat17 = u_xlat3 * u_xlat17;
					        u_xlat12 = u_xlat12 * u_xlat4 + (-u_xlat17);
					        u_xlat12 = u_xlat12 * 6.0;
					        u_xlat12 = cos(u_xlat12);
					        u_xlat2 = u_xlat12 * _Value4 + u_xlat2;
					    }
					    u_xlat10 = cos(u_xlat2);
					    u_xlat10 = (-u_xlat10) + u_xlat15;
					    u_xlat15 = u_xlat11.x * 0.00833333377;
					    u_xlat1.x = u_xlat11.x * 0.0166666675 + u_xlat0.x;
					    u_xlat0.x = u_xlat10 * 0.00833333377;
					    u_xlat1.y = u_xlat10 * 0.0166666675 + u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat15;
					    u_xlat0.x = u_xlat0.x * 700.0 + 1.0;
					    u_xlat5 = u_xlat11.x * 0.00833333377 + -0.0120000001;
					    u_xlat10 = u_xlat10 * 0.00833333377 + -0.0120000001;
					    u_xlatb15 = 0.0<u_xlat5;
					    u_xlatb11 = 0.0<u_xlat10;
					    u_xlatb15 = u_xlatb15 && u_xlatb11;
					    u_xlat5 = u_xlat10 * u_xlat5;
					    u_xlat5 = u_xlat5 * 200000.0;
					    u_xlat10 = log2(u_xlat0.x);
					    u_xlat5 = u_xlat10 * u_xlat5;
					    u_xlat5 = exp2(u_xlat5);
					    u_xlat0.x = (u_xlatb15) ? u_xlat5 : u_xlat0.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0 = u_xlat0.xxxx * u_xlat10_1;
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