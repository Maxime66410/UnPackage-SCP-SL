Shader "CameraFilterPack/FX_Ascii" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 6810
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
					uniform 	float Value;
					uniform 	float Fade;
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec2 u_xlatb0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					bvec4 u_xlatb2;
					bvec3 u_xlatb3;
					vec2 u_xlat8;
					float u_xlat16_8;
					int u_xlati8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat8.x = Fade * 8.0;
					    u_xlat1.xy = u_xlat0.xy / u_xlat8.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.125, 0.125);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat8.xy = u_xlat8.xx * u_xlat1.xy;
					    u_xlat8.xy = u_xlat8.xy / _ScreenResolution.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_8 = u_xlat10_1.z + u_xlat10_1.x;
					    u_xlat8.x = u_xlat16_8 / Value;
					    u_xlatb2 = lessThan(vec4(0.200000003, 0.300000012, 0.400000006, 0.5), u_xlat8.xxxx);
					    u_xlatb3.xyz = lessThan(vec4(0.600000024, 0.699999988, 0.800000012, 0.0), u_xlat8.xxxx).xyz;
					    u_xlat8.x = (u_xlatb2.x) ? 65600.0 : 65536.0;
					    u_xlat8.x = (u_xlatb2.y) ? 332772.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.z) ? 15255086.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.w) ? 23385164.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.x) ? 15252014.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.y) ? 13199452.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.z) ? 11512810.0 : u_xlat8.x;
					    u_xlatb2.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
					    u_xlat0.xy = fract(abs(u_xlat0.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat0.y : (-u_xlat0.y);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(4.0, -4.0) + vec2(2.5, 2.5);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat12 = u_xlat0.y * 5.0 + u_xlat0.x;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat8.x = u_xlat8.x / u_xlat12;
					    u_xlat8.x = u_xlat8.x * 0.5;
					    u_xlatb12 = u_xlat8.x>=(-u_xlat8.x);
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = (u_xlatb12) ? u_xlat8.x : (-u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + u_xlat8.x;
					    u_xlati8 = int(u_xlat8.x);
					    u_xlatb8 = u_xlati8==1;
					    u_xlat2.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
					    u_xlat2.xy = min(u_xlat2.xy, vec2(4.0, 4.0));
					    u_xlatb0.xy = equal(u_xlat0.xyxx, u_xlat2.xyxx).xy;
					    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
					    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xxx + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_1.xyz;
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
					; Bound: 392
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %12 %371 
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
					                                                  OpDecorate %76 RelaxedPrecision 
					                                                  OpDecorate %79 RelaxedPrecision 
					                                                  OpDecorate %79 DescriptorSet 79 
					                                                  OpDecorate %79 Binding 79 
					                                                  OpDecorate %80 RelaxedPrecision 
					                                                  OpDecorate %83 RelaxedPrecision 
					                                                  OpDecorate %83 DescriptorSet 83 
					                                                  OpDecorate %83 Binding 83 
					                                                  OpDecorate %84 RelaxedPrecision 
					                                                  OpDecorate %89 RelaxedPrecision 
					                                                  OpDecorate %90 RelaxedPrecision 
					                                                  OpDecorate %93 RelaxedPrecision 
					                                                  OpDecorate %95 RelaxedPrecision 
					                                                  OpDecorate %96 RelaxedPrecision 
					                                                  OpDecorate %97 RelaxedPrecision 
					                                                  OpDecorate %363 RelaxedPrecision 
					                                                  OpDecorate %367 RelaxedPrecision 
					                                                  OpDecorate %368 RelaxedPrecision 
					                                                  OpDecorate %371 Location 371 
					                                                  OpDecorate %385 RelaxedPrecision 
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
					                                          %15 = OpTypeStruct %6 %6 %14 %14 
					                                          %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32_4; f32_4;}* %17 = OpVariable Uniform 
					                                          %18 = OpTypeInt 32 1 
					                                      i32 %19 = OpConstant 3 
					                                          %20 = OpTypePointer Uniform %14 
					                                      i32 %33 = OpConstant 2 
					                                          %40 = OpTypePointer Private %10 
					                           Private f32_2* %41 = OpVariable Private 
					                                      i32 %42 = OpConstant 1 
					                                          %43 = OpTypePointer Uniform %6 
					                                      f32 %46 = OpConstant 3,674022E-40 
					                                          %48 = OpTypeInt 32 0 
					                                      u32 %49 = OpConstant 0 
					                                          %50 = OpTypePointer Private %6 
					                           Private f32_2* %52 = OpVariable Private 
					                                      f32 %60 = OpConstant 3,674022E-40 
					                                    f32_2 %61 = OpConstantComposite %60 %60 
					                           Private f32_3* %76 = OpVariable Private 
					                                          %77 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %78 = OpTypePointer UniformConstant %77 
					     UniformConstant read_only Texture2D* %79 = OpVariable UniformConstant 
					                                          %81 = OpTypeSampler 
					                                          %82 = OpTypePointer UniformConstant %81 
					                 UniformConstant sampler* %83 = OpVariable UniformConstant 
					                                          %85 = OpTypeSampledImage %77 
					                             Private f32* %90 = OpVariable Private 
					                                      u32 %91 = OpConstant 2 
					                                      i32 %98 = OpConstant 0 
					                                         %103 = OpTypeBool 
					                                         %104 = OpTypeVector %103 4 
					                                         %105 = OpTypePointer Private %104 
					                         Private bool_4* %106 = OpVariable Private 
					                                     f32 %107 = OpConstant 3,674022E-40 
					                                     f32 %108 = OpConstant 3,674022E-40 
					                                     f32 %109 = OpConstant 3,674022E-40 
					                                     f32 %110 = OpConstant 3,674022E-40 
					                                   f32_4 %111 = OpConstantComposite %107 %108 %109 %110 
					                                         %115 = OpTypeVector %103 3 
					                                         %116 = OpTypePointer Private %115 
					                         Private bool_3* %117 = OpVariable Private 
					                                     f32 %118 = OpConstant 3,674022E-40 
					                                     f32 %119 = OpConstant 3,674022E-40 
					                                     f32 %120 = OpConstant 3,674022E-40 
					                                     f32 %121 = OpConstant 3,674022E-40 
					                                   f32_4 %122 = OpConstantComposite %118 %119 %120 %121 
					                                         %127 = OpTypePointer Private %103 
					                                     f32 %130 = OpConstant 3,674022E-40 
					                                     f32 %131 = OpConstant 3,674022E-40 
					                                     u32 %134 = OpConstant 1 
					                                         %137 = OpTypePointer Function %6 
					                                     f32 %141 = OpConstant 3,674022E-40 
					                                     f32 %152 = OpConstant 3,674022E-40 
					                                     u32 %158 = OpConstant 3 
					                                     f32 %164 = OpConstant 3,674022E-40 
					                                     f32 %175 = OpConstant 3,674022E-40 
					                                     f32 %186 = OpConstant 3,674022E-40 
					                                     f32 %197 = OpConstant 3,674022E-40 
					                                         %209 = OpTypeVector %103 2 
					                                         %219 = OpTypePointer Function %7 
					                                     f32 %251 = OpConstant 3,674022E-40 
					                                   f32_2 %252 = OpConstantComposite %251 %251 
					                                     f32 %254 = OpConstant 3,674022E-40 
					                                   f32_2 %255 = OpConstantComposite %254 %254 
					                                     f32 %261 = OpConstant 3,674022E-40 
					                                     f32 %262 = OpConstant 3,674022E-40 
					                                   f32_2 %263 = OpConstantComposite %261 %262 
					                                     f32 %265 = OpConstant 3,674022E-40 
					                                   f32_2 %266 = OpConstantComposite %265 %265 
					                            Private f32* %275 = OpVariable Private 
					                                     f32 %278 = OpConstant 3,674022E-40 
					                           Private bool* %294 = OpVariable Private 
					                                         %323 = OpTypePointer Private %18 
					                            Private i32* %324 = OpVariable Private 
					                           Private bool* %328 = OpVariable Private 
					                          Private f32_2* %331 = OpVariable Private 
					                                   f32_2 %334 = OpConstantComposite %121 %121 
					                                   f32_2 %337 = OpConstantComposite %261 %261 
					                                         %339 = OpTypePointer Private %209 
					                         Private bool_2* %340 = OpVariable Private 
					                                     f32 %360 = OpConstant 3,674022E-40 
					                                         %370 = OpTypePointer Output %14 
					                           Output f32_4* %371 = OpVariable Output 
					                                         %389 = OpTypePointer Output %6 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                           Function f32* %138 = OpVariable Function 
					                           Function f32* %149 = OpVariable Function 
					                           Function f32* %161 = OpVariable Function 
					                           Function f32* %172 = OpVariable Function 
					                           Function f32* %183 = OpVariable Function 
					                           Function f32* %194 = OpVariable Function 
					                         Function f32_3* %220 = OpVariable Function 
					                           Function f32* %224 = OpVariable Function 
					                           Function f32* %237 = OpVariable Function 
					                           Function f32* %306 = OpVariable Function 
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
					                                    f32_3 %31 = OpLoad %9 
					                                    f32_2 %32 = OpVectorShuffle %31 %31 0 1 
					                           Uniform f32_4* %34 = OpAccessChain %17 %33 
					                                    f32_4 %35 = OpLoad %34 
					                                    f32_2 %36 = OpVectorShuffle %35 %35 0 1 
					                                    f32_2 %37 = OpFMul %32 %36 
					                                    f32_3 %38 = OpLoad %9 
					                                    f32_3 %39 = OpVectorShuffle %38 %37 3 4 2 
					                                                  OpStore %9 %39 
					                             Uniform f32* %44 = OpAccessChain %17 %42 
					                                      f32 %45 = OpLoad %44 
					                                      f32 %47 = OpFMul %45 %46 
					                             Private f32* %51 = OpAccessChain %41 %49 
					                                                  OpStore %51 %47 
					                                    f32_3 %53 = OpLoad %9 
					                                    f32_2 %54 = OpVectorShuffle %53 %53 0 1 
					                                    f32_2 %55 = OpLoad %41 
					                                    f32_2 %56 = OpVectorShuffle %55 %55 0 0 
					                                    f32_2 %57 = OpFDiv %54 %56 
					                                                  OpStore %52 %57 
					                                    f32_3 %58 = OpLoad %9 
					                                    f32_2 %59 = OpVectorShuffle %58 %58 0 1 
					                                    f32_2 %62 = OpFMul %59 %61 
					                                    f32_3 %63 = OpLoad %9 
					                                    f32_3 %64 = OpVectorShuffle %63 %62 3 4 2 
					                                                  OpStore %9 %64 
					                                    f32_2 %65 = OpLoad %52 
					                                    f32_2 %66 = OpExtInst %1 8 %65 
					                                                  OpStore %52 %66 
					                                    f32_2 %67 = OpLoad %41 
					                                    f32_2 %68 = OpVectorShuffle %67 %67 0 0 
					                                    f32_2 %69 = OpLoad %52 
					                                    f32_2 %70 = OpFMul %68 %69 
					                                                  OpStore %41 %70 
					                                    f32_2 %71 = OpLoad %41 
					                           Uniform f32_4* %72 = OpAccessChain %17 %33 
					                                    f32_4 %73 = OpLoad %72 
					                                    f32_2 %74 = OpVectorShuffle %73 %73 0 1 
					                                    f32_2 %75 = OpFDiv %71 %74 
					                                                  OpStore %41 %75 
					                      read_only Texture2D %80 = OpLoad %79 
					                                  sampler %84 = OpLoad %83 
					               read_only Texture2DSampled %86 = OpSampledImage %80 %84 
					                                    f32_2 %87 = OpLoad %41 
					                                    f32_4 %88 = OpImageSampleImplicitLod %86 %87 
					                                    f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
					                                                  OpStore %76 %89 
					                             Private f32* %92 = OpAccessChain %76 %91 
					                                      f32 %93 = OpLoad %92 
					                             Private f32* %94 = OpAccessChain %76 %49 
					                                      f32 %95 = OpLoad %94 
					                                      f32 %96 = OpFAdd %93 %95 
					                                                  OpStore %90 %96 
					                                      f32 %97 = OpLoad %90 
					                             Uniform f32* %99 = OpAccessChain %17 %98 
					                                     f32 %100 = OpLoad %99 
					                                     f32 %101 = OpFDiv %97 %100 
					                            Private f32* %102 = OpAccessChain %41 %49 
					                                                  OpStore %102 %101 
					                                   f32_2 %112 = OpLoad %41 
					                                   f32_4 %113 = OpVectorShuffle %112 %112 0 0 0 0 
					                                  bool_4 %114 = OpFOrdLessThan %111 %113 
					                                                  OpStore %106 %114 
					                                   f32_2 %123 = OpLoad %41 
					                                   f32_4 %124 = OpVectorShuffle %123 %123 0 0 0 0 
					                                  bool_4 %125 = OpFOrdLessThan %122 %124 
					                                  bool_3 %126 = OpVectorShuffle %125 %125 0 1 2 
					                                                  OpStore %117 %126 
					                           Private bool* %128 = OpAccessChain %106 %49 
					                                    bool %129 = OpLoad %128 
					                                     f32 %132 = OpSelect %129 %130 %131 
					                            Private f32* %133 = OpAccessChain %41 %49 
					                                                  OpStore %133 %132 
					                           Private bool* %135 = OpAccessChain %106 %134 
					                                    bool %136 = OpLoad %135 
					                                                  OpSelectionMerge %140 None 
					                                                  OpBranchConditional %136 %139 %142 
					                                         %139 = OpLabel 
					                                                  OpStore %138 %141 
					                                                  OpBranch %140 
					                                         %142 = OpLabel 
					                            Private f32* %143 = OpAccessChain %41 %49 
					                                     f32 %144 = OpLoad %143 
					                                                  OpStore %138 %144 
					                                                  OpBranch %140 
					                                         %140 = OpLabel 
					                                     f32 %145 = OpLoad %138 
					                            Private f32* %146 = OpAccessChain %41 %49 
					                                                  OpStore %146 %145 
					                           Private bool* %147 = OpAccessChain %106 %91 
					                                    bool %148 = OpLoad %147 
					                                                  OpSelectionMerge %151 None 
					                                                  OpBranchConditional %148 %150 %153 
					                                         %150 = OpLabel 
					                                                  OpStore %149 %152 
					                                                  OpBranch %151 
					                                         %153 = OpLabel 
					                            Private f32* %154 = OpAccessChain %41 %49 
					                                     f32 %155 = OpLoad %154 
					                                                  OpStore %149 %155 
					                                                  OpBranch %151 
					                                         %151 = OpLabel 
					                                     f32 %156 = OpLoad %149 
					                            Private f32* %157 = OpAccessChain %41 %49 
					                                                  OpStore %157 %156 
					                           Private bool* %159 = OpAccessChain %106 %158 
					                                    bool %160 = OpLoad %159 
					                                                  OpSelectionMerge %163 None 
					                                                  OpBranchConditional %160 %162 %165 
					                                         %162 = OpLabel 
					                                                  OpStore %161 %164 
					                                                  OpBranch %163 
					                                         %165 = OpLabel 
					                            Private f32* %166 = OpAccessChain %41 %49 
					                                     f32 %167 = OpLoad %166 
					                                                  OpStore %161 %167 
					                                                  OpBranch %163 
					                                         %163 = OpLabel 
					                                     f32 %168 = OpLoad %161 
					                            Private f32* %169 = OpAccessChain %41 %49 
					                                                  OpStore %169 %168 
					                           Private bool* %170 = OpAccessChain %117 %49 
					                                    bool %171 = OpLoad %170 
					                                                  OpSelectionMerge %174 None 
					                                                  OpBranchConditional %171 %173 %176 
					                                         %173 = OpLabel 
					                                                  OpStore %172 %175 
					                                                  OpBranch %174 
					                                         %176 = OpLabel 
					                            Private f32* %177 = OpAccessChain %41 %49 
					                                     f32 %178 = OpLoad %177 
					                                                  OpStore %172 %178 
					                                                  OpBranch %174 
					                                         %174 = OpLabel 
					                                     f32 %179 = OpLoad %172 
					                            Private f32* %180 = OpAccessChain %41 %49 
					                                                  OpStore %180 %179 
					                           Private bool* %181 = OpAccessChain %117 %134 
					                                    bool %182 = OpLoad %181 
					                                                  OpSelectionMerge %185 None 
					                                                  OpBranchConditional %182 %184 %187 
					                                         %184 = OpLabel 
					                                                  OpStore %183 %186 
					                                                  OpBranch %185 
					                                         %187 = OpLabel 
					                            Private f32* %188 = OpAccessChain %41 %49 
					                                     f32 %189 = OpLoad %188 
					                                                  OpStore %183 %189 
					                                                  OpBranch %185 
					                                         %185 = OpLabel 
					                                     f32 %190 = OpLoad %183 
					                            Private f32* %191 = OpAccessChain %41 %49 
					                                                  OpStore %191 %190 
					                           Private bool* %192 = OpAccessChain %117 %91 
					                                    bool %193 = OpLoad %192 
					                                                  OpSelectionMerge %196 None 
					                                                  OpBranchConditional %193 %195 %198 
					                                         %195 = OpLabel 
					                                                  OpStore %194 %197 
					                                                  OpBranch %196 
					                                         %198 = OpLabel 
					                            Private f32* %199 = OpAccessChain %41 %49 
					                                     f32 %200 = OpLoad %199 
					                                                  OpStore %194 %200 
					                                                  OpBranch %196 
					                                         %196 = OpLabel 
					                                     f32 %201 = OpLoad %194 
					                            Private f32* %202 = OpAccessChain %41 %49 
					                                                  OpStore %202 %201 
					                                   f32_3 %203 = OpLoad %9 
					                                   f32_4 %204 = OpVectorShuffle %203 %203 0 1 0 0 
					                                   f32_3 %205 = OpLoad %9 
					                                   f32_4 %206 = OpVectorShuffle %205 %205 0 1 0 0 
					                                   f32_4 %207 = OpFNegate %206 
					                                  bool_4 %208 = OpFOrdGreaterThanEqual %204 %207 
					                                  bool_2 %210 = OpVectorShuffle %208 %208 0 1 
					                                  bool_4 %211 = OpLoad %106 
					                                  bool_4 %212 = OpVectorShuffle %211 %210 4 5 2 3 
					                                                  OpStore %106 %212 
					                                   f32_3 %213 = OpLoad %9 
					                                   f32_2 %214 = OpVectorShuffle %213 %213 0 1 
					                                   f32_2 %215 = OpExtInst %1 4 %214 
					                                   f32_2 %216 = OpExtInst %1 10 %215 
					                                   f32_3 %217 = OpLoad %9 
					                                   f32_3 %218 = OpVectorShuffle %217 %216 3 4 2 
					                                                  OpStore %9 %218 
					                                   f32_3 %221 = OpLoad %9 
					                                                  OpStore %220 %221 
					                           Private bool* %222 = OpAccessChain %106 %49 
					                                    bool %223 = OpLoad %222 
					                                                  OpSelectionMerge %226 None 
					                                                  OpBranchConditional %223 %225 %229 
					                                         %225 = OpLabel 
					                            Private f32* %227 = OpAccessChain %9 %49 
					                                     f32 %228 = OpLoad %227 
					                                                  OpStore %224 %228 
					                                                  OpBranch %226 
					                                         %229 = OpLabel 
					                            Private f32* %230 = OpAccessChain %9 %49 
					                                     f32 %231 = OpLoad %230 
					                                     f32 %232 = OpFNegate %231 
					                                                  OpStore %224 %232 
					                                                  OpBranch %226 
					                                         %226 = OpLabel 
					                                     f32 %233 = OpLoad %224 
					                           Function f32* %234 = OpAccessChain %220 %49 
					                                                  OpStore %234 %233 
					                           Private bool* %235 = OpAccessChain %106 %134 
					                                    bool %236 = OpLoad %235 
					                                                  OpSelectionMerge %239 None 
					                                                  OpBranchConditional %236 %238 %242 
					                                         %238 = OpLabel 
					                            Private f32* %240 = OpAccessChain %9 %134 
					                                     f32 %241 = OpLoad %240 
					                                                  OpStore %237 %241 
					                                                  OpBranch %239 
					                                         %242 = OpLabel 
					                            Private f32* %243 = OpAccessChain %9 %134 
					                                     f32 %244 = OpLoad %243 
					                                     f32 %245 = OpFNegate %244 
					                                                  OpStore %237 %245 
					                                                  OpBranch %239 
					                                         %239 = OpLabel 
					                                     f32 %246 = OpLoad %237 
					                           Function f32* %247 = OpAccessChain %220 %134 
					                                                  OpStore %247 %246 
					                                   f32_3 %248 = OpLoad %220 
					                                                  OpStore %9 %248 
					                                   f32_3 %249 = OpLoad %9 
					                                   f32_2 %250 = OpVectorShuffle %249 %249 0 1 
					                                   f32_2 %253 = OpFMul %250 %252 
					                                   f32_2 %256 = OpFAdd %253 %255 
					                                   f32_3 %257 = OpLoad %9 
					                                   f32_3 %258 = OpVectorShuffle %257 %256 3 4 2 
					                                                  OpStore %9 %258 
					                                   f32_3 %259 = OpLoad %9 
					                                   f32_2 %260 = OpVectorShuffle %259 %259 0 1 
					                                   f32_2 %264 = OpFMul %260 %263 
					                                   f32_2 %267 = OpFAdd %264 %266 
					                                   f32_3 %268 = OpLoad %9 
					                                   f32_3 %269 = OpVectorShuffle %268 %267 3 4 2 
					                                                  OpStore %9 %269 
					                                   f32_3 %270 = OpLoad %9 
					                                   f32_2 %271 = OpVectorShuffle %270 %270 0 1 
					                                   f32_2 %272 = OpExtInst %1 8 %271 
					                                   f32_3 %273 = OpLoad %9 
					                                   f32_3 %274 = OpVectorShuffle %273 %272 3 4 2 
					                                                  OpStore %9 %274 
					                            Private f32* %276 = OpAccessChain %9 %134 
					                                     f32 %277 = OpLoad %276 
					                                     f32 %279 = OpFMul %277 %278 
					                            Private f32* %280 = OpAccessChain %9 %49 
					                                     f32 %281 = OpLoad %280 
					                                     f32 %282 = OpFAdd %279 %281 
					                                                  OpStore %275 %282 
					                                     f32 %283 = OpLoad %275 
					                                     f32 %284 = OpExtInst %1 29 %283 
					                                                  OpStore %275 %284 
					                            Private f32* %285 = OpAccessChain %41 %49 
					                                     f32 %286 = OpLoad %285 
					                                     f32 %287 = OpLoad %275 
					                                     f32 %288 = OpFDiv %286 %287 
					                            Private f32* %289 = OpAccessChain %41 %49 
					                                                  OpStore %289 %288 
					                            Private f32* %290 = OpAccessChain %41 %49 
					                                     f32 %291 = OpLoad %290 
					                                     f32 %292 = OpFMul %291 %110 
					                            Private f32* %293 = OpAccessChain %41 %49 
					                                                  OpStore %293 %292 
					                            Private f32* %295 = OpAccessChain %41 %49 
					                                     f32 %296 = OpLoad %295 
					                            Private f32* %297 = OpAccessChain %41 %49 
					                                     f32 %298 = OpLoad %297 
					                                     f32 %299 = OpFNegate %298 
					                                    bool %300 = OpFOrdGreaterThanEqual %296 %299 
					                                                  OpStore %294 %300 
					                            Private f32* %301 = OpAccessChain %41 %49 
					                                     f32 %302 = OpLoad %301 
					                                     f32 %303 = OpExtInst %1 10 %302 
					                            Private f32* %304 = OpAccessChain %41 %49 
					                                                  OpStore %304 %303 
					                                    bool %305 = OpLoad %294 
					                                                  OpSelectionMerge %308 None 
					                                                  OpBranchConditional %305 %307 %311 
					                                         %307 = OpLabel 
					                            Private f32* %309 = OpAccessChain %41 %49 
					                                     f32 %310 = OpLoad %309 
					                                                  OpStore %306 %310 
					                                                  OpBranch %308 
					                                         %311 = OpLabel 
					                            Private f32* %312 = OpAccessChain %41 %49 
					                                     f32 %313 = OpLoad %312 
					                                     f32 %314 = OpFNegate %313 
					                                                  OpStore %306 %314 
					                                                  OpBranch %308 
					                                         %308 = OpLabel 
					                                     f32 %315 = OpLoad %306 
					                            Private f32* %316 = OpAccessChain %41 %49 
					                                                  OpStore %316 %315 
					                            Private f32* %317 = OpAccessChain %41 %49 
					                                     f32 %318 = OpLoad %317 
					                            Private f32* %319 = OpAccessChain %41 %49 
					                                     f32 %320 = OpLoad %319 
					                                     f32 %321 = OpFAdd %318 %320 
					                            Private f32* %322 = OpAccessChain %41 %49 
					                                                  OpStore %322 %321 
					                            Private f32* %325 = OpAccessChain %41 %49 
					                                     f32 %326 = OpLoad %325 
					                                     i32 %327 = OpConvertFToS %326 
					                                                  OpStore %324 %327 
					                                     i32 %329 = OpLoad %324 
					                                    bool %330 = OpIEqual %329 %42 
					                                                  OpStore %328 %330 
					                                   f32_3 %332 = OpLoad %9 
					                                   f32_2 %333 = OpVectorShuffle %332 %332 0 1 
					                                   f32_2 %335 = OpExtInst %1 40 %333 %334 
					                                                  OpStore %331 %335 
					                                   f32_2 %336 = OpLoad %331 
					                                   f32_2 %338 = OpExtInst %1 37 %336 %337 
					                                                  OpStore %331 %338 
					                                   f32_3 %341 = OpLoad %9 
					                                   f32_4 %342 = OpVectorShuffle %341 %341 0 1 0 0 
					                                   f32_2 %343 = OpLoad %331 
					                                   f32_4 %344 = OpVectorShuffle %343 %343 0 1 0 0 
					                                  bool_4 %345 = OpFOrdEqual %342 %344 
					                                  bool_2 %346 = OpVectorShuffle %345 %345 0 1 
					                                                  OpStore %340 %346 
					                           Private bool* %347 = OpAccessChain %340 %134 
					                                    bool %348 = OpLoad %347 
					                           Private bool* %349 = OpAccessChain %340 %49 
					                                    bool %350 = OpLoad %349 
					                                    bool %351 = OpLogicalAnd %348 %350 
					                           Private bool* %352 = OpAccessChain %340 %49 
					                                                  OpStore %352 %351 
					                                    bool %353 = OpLoad %328 
					                           Private bool* %354 = OpAccessChain %340 %49 
					                                    bool %355 = OpLoad %354 
					                                    bool %356 = OpLogicalAnd %353 %355 
					                           Private bool* %357 = OpAccessChain %340 %49 
					                                                  OpStore %357 %356 
					                           Private bool* %358 = OpAccessChain %340 %49 
					                                    bool %359 = OpLoad %358 
					                                     f32 %361 = OpSelect %359 %360 %121 
					                            Private f32* %362 = OpAccessChain %9 %49 
					                                                  OpStore %362 %361 
					                                   f32_3 %363 = OpLoad %76 
					                                   f32_3 %364 = OpLoad %9 
					                                   f32_3 %365 = OpVectorShuffle %364 %364 0 0 0 
					                                   f32_3 %366 = OpFMul %363 %365 
					                                   f32_3 %367 = OpLoad %76 
					                                   f32_3 %368 = OpFNegate %367 
					                                   f32_3 %369 = OpFAdd %366 %368 
					                                                  OpStore %9 %369 
					                            Uniform f32* %372 = OpAccessChain %17 %42 
					                                     f32 %373 = OpLoad %372 
					                            Uniform f32* %374 = OpAccessChain %17 %42 
					                                     f32 %375 = OpLoad %374 
					                            Uniform f32* %376 = OpAccessChain %17 %42 
					                                     f32 %377 = OpLoad %376 
					                                   f32_3 %378 = OpCompositeConstruct %373 %375 %377 
					                                     f32 %379 = OpCompositeExtract %378 0 
					                                     f32 %380 = OpCompositeExtract %378 1 
					                                     f32 %381 = OpCompositeExtract %378 2 
					                                   f32_3 %382 = OpCompositeConstruct %379 %380 %381 
					                                   f32_3 %383 = OpLoad %9 
					                                   f32_3 %384 = OpFMul %382 %383 
					                                   f32_3 %385 = OpLoad %76 
					                                   f32_3 %386 = OpFAdd %384 %385 
					                                   f32_4 %387 = OpLoad %371 
					                                   f32_4 %388 = OpVectorShuffle %387 %386 4 5 6 3 
					                                                  OpStore %371 %388 
					                             Output f32* %390 = OpAccessChain %371 %158 
					                                                  OpStore %390 %360 
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
						float Value;
						float Fade;
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec2 u_xlatb0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					bvec4 u_xlatb2;
					bvec3 u_xlatb3;
					vec2 u_xlat8;
					float u_xlat16_8;
					int u_xlati8;
					bool u_xlatb8;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat8.x = Fade * 8.0;
					    u_xlat1.xy = u_xlat0.xy / u_xlat8.xx;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.125, 0.125);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat8.xy = u_xlat8.xx * u_xlat1.xy;
					    u_xlat8.xy = u_xlat8.xy / _ScreenResolution.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat8.xy);
					    u_xlat16_8 = u_xlat10_1.z + u_xlat10_1.x;
					    u_xlat8.x = u_xlat16_8 / Value;
					    u_xlatb2 = lessThan(vec4(0.200000003, 0.300000012, 0.400000006, 0.5), u_xlat8.xxxx);
					    u_xlatb3.xyz = lessThan(vec4(0.600000024, 0.699999988, 0.800000012, 0.0), u_xlat8.xxxx).xyz;
					    u_xlat8.x = (u_xlatb2.x) ? 65600.0 : 65536.0;
					    u_xlat8.x = (u_xlatb2.y) ? 332772.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.z) ? 15255086.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb2.w) ? 23385164.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.x) ? 15252014.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.y) ? 13199452.0 : u_xlat8.x;
					    u_xlat8.x = (u_xlatb3.z) ? 11512810.0 : u_xlat8.x;
					    u_xlatb2.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
					    u_xlat0.xy = fract(abs(u_xlat0.xy));
					    {
					        vec3 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat0.y : (-u_xlat0.y);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(4.0, -4.0) + vec2(2.5, 2.5);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat12 = u_xlat0.y * 5.0 + u_xlat0.x;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat8.x = u_xlat8.x / u_xlat12;
					    u_xlat8.x = u_xlat8.x * 0.5;
					    u_xlatb12 = u_xlat8.x>=(-u_xlat8.x);
					    u_xlat8.x = fract(u_xlat8.x);
					    u_xlat8.x = (u_xlatb12) ? u_xlat8.x : (-u_xlat8.x);
					    u_xlat8.x = u_xlat8.x + u_xlat8.x;
					    u_xlati8 = int(u_xlat8.x);
					    u_xlatb8 = u_xlati8==1;
					    u_xlat2.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
					    u_xlat2.xy = min(u_xlat2.xy, vec2(4.0, 4.0));
					    u_xlatb0.xy = equal(u_xlat0.xyxx, u_xlat2.xyxx).xy;
					    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
					    u_xlatb0.x = u_xlatb8 && u_xlatb0.x;
					    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xxx + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_1.xyz;
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