Shader "CameraFilterPack/Blur_Noise" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Level ("_Level", Range(1, 16)) = 4
		_Distance ("_Distance", Vector) = (30,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 7985
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Level;
					uniform 	vec4 _Distance;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					vec4 u_xlat10_5;
					vec2 u_xlat7;
					vec2 u_xlat12;
					int u_xlati12;
					int u_xlati18;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.x = fract(_TimeX);
					    u_xlat12.xy = u_xlat12.xx + u_xlat0.xy;
					    u_xlat12.x = dot(u_xlat12.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12.x = sin(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * 43758.5469;
					    u_xlat12.x = fract(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x + -0.5;
					    u_xlati18 = int(_Level);
					    u_xlat1 = trunc(_Level);
					    u_xlat7.xy = _Distance.xy / _ScreenResolution.xy;
					    u_xlat2.xy = (-u_xlat7.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat0.xy = u_xlat7.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
					    u_xlat7.x = u_xlat1 + -1.0;
					    u_xlat0.xy = u_xlat0.xy / u_xlat7.xx;
					    u_xlat7.xy = u_xlat12.xx * u_xlat0.xy + u_xlat2.xy;
					    u_xlat10_2 = textureLod(_MainTex, u_xlat7.xy, 0.0);
					    u_xlat3 = u_xlat10_2;
					    u_xlat4.xy = u_xlat7.xy;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<u_xlati18 ; u_xlati_loop_1++)
					    {
					        u_xlat4.xy = u_xlat0.xy + u_xlat4.xy;
					        u_xlat10_5 = textureLod(_MainTex, u_xlat4.xy, 0.0);
					        u_xlat3 = u_xlat3 + u_xlat10_5;
					    }
					    SV_Target0 = u_xlat3 / vec4(u_xlat1);
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
					; Bound: 170
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %161 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %14 0 Offset 14 
					                                                      OpMemberDecorate %14 1 Offset 14 
					                                                      OpMemberDecorate %14 2 Offset 14 
					                                                      OpMemberDecorate %14 3 Offset 14 
					                                                      OpMemberDecorate %14 4 RelaxedPrecision 
					                                                      OpMemberDecorate %14 4 Offset 14 
					                                                      OpDecorate %14 Block 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %120 DescriptorSet 120 
					                                                      OpDecorate %120 Binding 120 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 DescriptorSet 124 
					                                                      OpDecorate %124 Binding 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %161 Location 161 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeVector %6 4 
					                                              %14 = OpTypeStruct %6 %13 %6 %13 %13 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32_4; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 4 
					                                              %19 = OpTypePointer Uniform %13 
					                               Private f32_2* %28 = OpVariable Private 
					                                          i32 %29 = OpConstant 0 
					                                              %30 = OpTypePointer Uniform %6 
					                                              %34 = OpTypeInt 32 0 
					                                          u32 %35 = OpConstant 0 
					                                              %36 = OpTypePointer Private %6 
					                                          f32 %43 = OpConstant 3,674022E-40 
					                                          f32 %44 = OpConstant 3,674022E-40 
					                                        f32_2 %45 = OpConstantComposite %43 %44 
					                                          f32 %54 = OpConstant 3,674022E-40 
					                                          f32 %63 = OpConstant 3,674022E-40 
					                                              %66 = OpTypePointer Private %17 
					                                 Private i32* %67 = OpVariable Private 
					                                          i32 %68 = OpConstant 2 
					                                 Private f32* %72 = OpVariable Private 
					                               Private f32_2* %76 = OpVariable Private 
					                                          i32 %77 = OpConstant 3 
					                                          i32 %81 = OpConstant 1 
					                               Private f32_2* %86 = OpVariable Private 
					                                          f32 %89 = OpConstant 3,674022E-40 
					                                        f32_2 %90 = OpConstantComposite %89 %89 
					                                         f32 %103 = OpConstant 3,674022E-40 
					                                             %116 = OpTypePointer Private %13 
					                              Private f32_4* %117 = OpVariable Private 
					                                             %118 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %119 = OpTypePointer UniformConstant %118 
					        UniformConstant read_only Texture2D* %120 = OpVariable UniformConstant 
					                                             %122 = OpTypeSampler 
					                                             %123 = OpTypePointer UniformConstant %122 
					                    UniformConstant sampler* %124 = OpVariable UniformConstant 
					                                             %126 = OpTypeSampledImage %118 
					                                         f32 %129 = OpConstant 3,674022E-40 
					                              Private f32_4* %131 = OpVariable Private 
					                              Private f32_2* %133 = OpVariable Private 
					                                             %135 = OpTypePointer Function %17 
					                                             %144 = OpTypeBool 
					                              Private f32_4* %149 = OpVariable Private 
					                                             %160 = OpTypePointer Output %13 
					                               Output f32_4* %161 = OpVariable Output 
					                                Private i32* %167 = OpVariable Private 
					                                             %168 = OpTypePointer Private %144 
					                               Private bool* %169 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %136 = OpVariable Function 
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
					                                 Uniform f32* %31 = OpAccessChain %16 %29 
					                                          f32 %32 = OpLoad %31 
					                                          f32 %33 = OpExtInst %1 10 %32 
					                                 Private f32* %37 = OpAccessChain %28 %35 
					                                                      OpStore %37 %33 
					                                        f32_2 %38 = OpLoad %28 
					                                        f32_2 %39 = OpVectorShuffle %38 %38 0 0 
					                                        f32_2 %40 = OpLoad %9 
					                                        f32_2 %41 = OpFAdd %39 %40 
					                                                      OpStore %28 %41 
					                                        f32_2 %42 = OpLoad %28 
					                                          f32 %46 = OpDot %42 %45 
					                                 Private f32* %47 = OpAccessChain %28 %35 
					                                                      OpStore %47 %46 
					                                 Private f32* %48 = OpAccessChain %28 %35 
					                                          f32 %49 = OpLoad %48 
					                                          f32 %50 = OpExtInst %1 13 %49 
					                                 Private f32* %51 = OpAccessChain %28 %35 
					                                                      OpStore %51 %50 
					                                 Private f32* %52 = OpAccessChain %28 %35 
					                                          f32 %53 = OpLoad %52 
					                                          f32 %55 = OpFMul %53 %54 
					                                 Private f32* %56 = OpAccessChain %28 %35 
					                                                      OpStore %56 %55 
					                                 Private f32* %57 = OpAccessChain %28 %35 
					                                          f32 %58 = OpLoad %57 
					                                          f32 %59 = OpExtInst %1 10 %58 
					                                 Private f32* %60 = OpAccessChain %28 %35 
					                                                      OpStore %60 %59 
					                                 Private f32* %61 = OpAccessChain %28 %35 
					                                          f32 %62 = OpLoad %61 
					                                          f32 %64 = OpFAdd %62 %63 
					                                 Private f32* %65 = OpAccessChain %28 %35 
					                                                      OpStore %65 %64 
					                                 Uniform f32* %69 = OpAccessChain %16 %68 
					                                          f32 %70 = OpLoad %69 
					                                          i32 %71 = OpConvertFToS %70 
					                                                      OpStore %67 %71 
					                                 Uniform f32* %73 = OpAccessChain %16 %68 
					                                          f32 %74 = OpLoad %73 
					                                          f32 %75 = OpExtInst %1 3 %74 
					                                                      OpStore %72 %75 
					                               Uniform f32_4* %78 = OpAccessChain %16 %77 
					                                        f32_4 %79 = OpLoad %78 
					                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
					                               Uniform f32_4* %82 = OpAccessChain %16 %81 
					                                        f32_4 %83 = OpLoad %82 
					                                        f32_2 %84 = OpVectorShuffle %83 %83 0 1 
					                                        f32_2 %85 = OpFDiv %80 %84 
					                                                      OpStore %76 %85 
					                                        f32_2 %87 = OpLoad %76 
					                                        f32_2 %88 = OpFNegate %87 
					                                        f32_2 %91 = OpFMul %88 %90 
					                                        f32_2 %92 = OpLoad %9 
					                                        f32_2 %93 = OpFAdd %91 %92 
					                                                      OpStore %86 %93 
					                                        f32_2 %94 = OpLoad %76 
					                                        f32_2 %95 = OpFMul %94 %90 
					                                        f32_2 %96 = OpLoad %9 
					                                        f32_2 %97 = OpFAdd %95 %96 
					                                                      OpStore %9 %97 
					                                        f32_2 %98 = OpLoad %86 
					                                        f32_2 %99 = OpFNegate %98 
					                                       f32_2 %100 = OpLoad %9 
					                                       f32_2 %101 = OpFAdd %99 %100 
					                                                      OpStore %9 %101 
					                                         f32 %102 = OpLoad %72 
					                                         f32 %104 = OpFAdd %102 %103 
					                                Private f32* %105 = OpAccessChain %76 %35 
					                                                      OpStore %105 %104 
					                                       f32_2 %106 = OpLoad %9 
					                                       f32_2 %107 = OpLoad %76 
					                                       f32_2 %108 = OpVectorShuffle %107 %107 0 0 
					                                       f32_2 %109 = OpFDiv %106 %108 
					                                                      OpStore %9 %109 
					                                       f32_2 %110 = OpLoad %28 
					                                       f32_2 %111 = OpVectorShuffle %110 %110 0 0 
					                                       f32_2 %112 = OpLoad %9 
					                                       f32_2 %113 = OpFMul %111 %112 
					                                       f32_2 %114 = OpLoad %86 
					                                       f32_2 %115 = OpFAdd %113 %114 
					                                                      OpStore %76 %115 
					                         read_only Texture2D %121 = OpLoad %120 
					                                     sampler %125 = OpLoad %124 
					                  read_only Texture2DSampled %127 = OpSampledImage %121 %125 
					                                       f32_2 %128 = OpLoad %76 
					                                       f32_4 %130 = OpImageSampleExplicitLod %127 %128 Lod %13 
					                                                      OpStore %117 %130 
					                                       f32_4 %132 = OpLoad %117 
					                                                      OpStore %131 %132 
					                                       f32_2 %134 = OpLoad %76 
					                                                      OpStore %133 %134 
					                                                      OpStore %136 %81 
					                                                      OpBranch %137 
					                                             %137 = OpLabel 
					                                                      OpLoopMerge %139 %140 None 
					                                                      OpBranch %141 
					                                             %141 = OpLabel 
					                                         i32 %142 = OpLoad %136 
					                                         i32 %143 = OpLoad %67 
					                                        bool %145 = OpSLessThan %142 %143 
					                                                      OpBranchConditional %145 %138 %139 
					                                             %138 = OpLabel 
					                                       f32_2 %146 = OpLoad %9 
					                                       f32_2 %147 = OpLoad %133 
					                                       f32_2 %148 = OpFAdd %146 %147 
					                                                      OpStore %133 %148 
					                         read_only Texture2D %150 = OpLoad %120 
					                                     sampler %151 = OpLoad %124 
					                  read_only Texture2DSampled %152 = OpSampledImage %150 %151 
					                                       f32_2 %153 = OpLoad %133 
					                                       f32_4 %154 = OpImageSampleExplicitLod %152 %153 Lod %13 
					                                                      OpStore %149 %154 
					                                       f32_4 %155 = OpLoad %131 
					                                       f32_4 %156 = OpLoad %149 
					                                       f32_4 %157 = OpFAdd %155 %156 
					                                                      OpStore %131 %157 
					                                                      OpBranch %140 
					                                             %140 = OpLabel 
					                                         i32 %158 = OpLoad %136 
					                                         i32 %159 = OpIAdd %158 %81 
					                                                      OpStore %136 %159 
					                                                      OpBranch %137 
					                                             %139 = OpLabel 
					                                       f32_4 %162 = OpLoad %131 
					                                         f32 %163 = OpLoad %72 
					                                       f32_4 %164 = OpCompositeConstruct %163 %163 %163 %163 
					                                       f32_4 %165 = OpFDiv %162 %164 
					                                                      OpStore %161 %165 
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
						vec4 _ScreenResolution;
						float _Level;
						vec4 _Distance;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					vec4 u_xlat10_5;
					vec2 u_xlat7;
					vec2 u_xlat12;
					int u_xlati12;
					int u_xlati18;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.x = fract(_TimeX);
					    u_xlat12.xy = u_xlat12.xx + u_xlat0.xy;
					    u_xlat12.x = dot(u_xlat12.xy, vec2(12.9898005, 78.2330017));
					    u_xlat12.x = sin(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x * 43758.5469;
					    u_xlat12.x = fract(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x + -0.5;
					    u_xlati18 = int(_Level);
					    u_xlat1 = trunc(_Level);
					    u_xlat7.xy = _Distance.xy / _ScreenResolution.xy;
					    u_xlat2.xy = (-u_xlat7.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat0.xy = u_xlat7.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat0.xy = (-u_xlat2.xy) + u_xlat0.xy;
					    u_xlat7.x = u_xlat1 + -1.0;
					    u_xlat0.xy = u_xlat0.xy / u_xlat7.xx;
					    u_xlat7.xy = u_xlat12.xx * u_xlat0.xy + u_xlat2.xy;
					    u_xlat10_2 = textureLod(_MainTex, u_xlat7.xy, 0.0);
					    u_xlat3 = u_xlat10_2;
					    u_xlat4.xy = u_xlat7.xy;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<u_xlati18 ; u_xlati_loop_1++)
					    {
					        u_xlat4.xy = u_xlat0.xy + u_xlat4.xy;
					        u_xlat10_5 = textureLod(_MainTex, u_xlat4.xy, 0.0);
					        u_xlat3 = u_xlat3 + u_xlat10_5;
					    }
					    SV_Target0 = u_xlat3 / vec4(u_xlat1);
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