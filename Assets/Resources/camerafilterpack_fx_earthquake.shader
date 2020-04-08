Shader "CameraFilterPack/FX_EarthQuake" {
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
			GpuProgramID 4365
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat2 = u_xlat0.x + 23.0;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat2 = dot(vec2(u_xlat2), vec2(12.9898005, 78.2330017));
					    u_xlat2 = sin(u_xlat2);
					    u_xlat0.y = u_xlat2 * 43758.5469;
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = _Value3 * u_xlat0.y + u_xlat4.y;
					    u_xlat0.x = _Value2 * u_xlat0.x + u_xlat4.x;
					    u_xlat1.x = (-_Value2) * 0.5 + u_xlat0.x;
					    u_xlat1.y = (-_Value3) * 0.5 + u_xlat2;
					    u_xlat10_0 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %65 %130 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpMemberDecorate %11 0 Offset 11 
					                                                     OpMemberDecorate %11 1 Offset 11 
					                                                     OpMemberDecorate %11 2 Offset 11 
					                                                     OpMemberDecorate %11 3 Offset 11 
					                                                     OpMemberDecorate %11 4 RelaxedPrecision 
					                                                     OpMemberDecorate %11 4 Offset 11 
					                                                     OpDecorate %11 Block 
					                                                     OpDecorate %13 DescriptorSet 13 
					                                                     OpDecorate %13 Binding 13 
					                                                     OpDecorate vs_TEXCOORD0 Location 65 
					                                                     OpDecorate %70 RelaxedPrecision 
					                                                     OpDecorate %71 RelaxedPrecision 
					                                                     OpDecorate %74 RelaxedPrecision 
					                                                     OpDecorate %75 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %118 RelaxedPrecision 
					                                                     OpDecorate %118 DescriptorSet 118 
					                                                     OpDecorate %118 Binding 118 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                                     OpDecorate %122 RelaxedPrecision 
					                                                     OpDecorate %122 DescriptorSet 122 
					                                                     OpDecorate %122 Binding 122 
					                                                     OpDecorate %123 RelaxedPrecision 
					                                                     OpDecorate %128 RelaxedPrecision 
					                                                     OpDecorate %130 Location 130 
					                                                     OpDecorate %131 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 2 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_2* %9 = OpVariable Private 
					                                             %10 = OpTypeVector %6 4 
					                                             %11 = OpTypeStruct %6 %6 %6 %6 %10 
					                                             %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                             %14 = OpTypeInt 32 1 
					                                         i32 %15 = OpConstant 1 
					                                             %16 = OpTypePointer Uniform %6 
					                                         i32 %19 = OpConstant 0 
					                                             %23 = OpTypeInt 32 0 
					                                         u32 %24 = OpConstant 0 
					                                             %25 = OpTypePointer Private %6 
					                                Private f32* %31 = OpVariable Private 
					                                         f32 %34 = OpConstant 3,674022E-40 
					                                         f32 %38 = OpConstant 3,674022E-40 
					                                         f32 %39 = OpConstant 3,674022E-40 
					                                       f32_2 %40 = OpConstantComposite %38 %39 
					                                         f32 %49 = OpConstant 3,674022E-40 
					                                         u32 %59 = OpConstant 1 
					                              Private f32_2* %63 = OpVariable Private 
					                                             %64 = OpTypePointer Input %7 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %67 = OpConstant 4 
					                                             %68 = OpTypePointer Uniform %10 
					                                         i32 %77 = OpConstant 3 
					                                         i32 %86 = OpConstant 2 
					                              Private f32_2* %96 = OpVariable Private 
					                                        f32 %100 = OpConstant 3,674022E-40 
					                                            %113 = OpTypeVector %6 3 
					                                            %114 = OpTypePointer Private %113 
					                             Private f32_3* %115 = OpVariable Private 
					                                            %116 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %117 = OpTypePointer UniformConstant %116 
					       UniformConstant read_only Texture2D* %118 = OpVariable UniformConstant 
					                                            %120 = OpTypeSampler 
					                                            %121 = OpTypePointer UniformConstant %120 
					                   UniformConstant sampler* %122 = OpVariable UniformConstant 
					                                            %124 = OpTypeSampledImage %116 
					                                            %129 = OpTypePointer Output %10 
					                              Output f32_4* %130 = OpVariable Output 
					                                        f32 %134 = OpConstant 3,674022E-40 
					                                        u32 %135 = OpConstant 3 
					                                            %136 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                Uniform f32* %17 = OpAccessChain %13 %15 
					                                         f32 %18 = OpLoad %17 
					                                Uniform f32* %20 = OpAccessChain %13 %19 
					                                         f32 %21 = OpLoad %20 
					                                         f32 %22 = OpFMul %18 %21 
					                                Private f32* %26 = OpAccessChain %9 %24 
					                                                     OpStore %26 %22 
					                                Private f32* %27 = OpAccessChain %9 %24 
					                                         f32 %28 = OpLoad %27 
					                                         f32 %29 = OpExtInst %1 3 %28 
					                                Private f32* %30 = OpAccessChain %9 %24 
					                                                     OpStore %30 %29 
					                                Private f32* %32 = OpAccessChain %9 %24 
					                                         f32 %33 = OpLoad %32 
					                                         f32 %35 = OpFAdd %33 %34 
					                                                     OpStore %31 %35 
					                                       f32_2 %36 = OpLoad %9 
					                                       f32_2 %37 = OpVectorShuffle %36 %36 0 0 
					                                         f32 %41 = OpDot %37 %40 
					                                Private f32* %42 = OpAccessChain %9 %24 
					                                                     OpStore %42 %41 
					                                Private f32* %43 = OpAccessChain %9 %24 
					                                         f32 %44 = OpLoad %43 
					                                         f32 %45 = OpExtInst %1 13 %44 
					                                Private f32* %46 = OpAccessChain %9 %24 
					                                                     OpStore %46 %45 
					                                Private f32* %47 = OpAccessChain %9 %24 
					                                         f32 %48 = OpLoad %47 
					                                         f32 %50 = OpFMul %48 %49 
					                                Private f32* %51 = OpAccessChain %9 %24 
					                                                     OpStore %51 %50 
					                                         f32 %52 = OpLoad %31 
					                                       f32_2 %53 = OpCompositeConstruct %52 %52 
					                                         f32 %54 = OpDot %53 %40 
					                                                     OpStore %31 %54 
					                                         f32 %55 = OpLoad %31 
					                                         f32 %56 = OpExtInst %1 13 %55 
					                                                     OpStore %31 %56 
					                                         f32 %57 = OpLoad %31 
					                                         f32 %58 = OpFMul %57 %49 
					                                Private f32* %60 = OpAccessChain %9 %59 
					                                                     OpStore %60 %58 
					                                       f32_2 %61 = OpLoad %9 
					                                       f32_2 %62 = OpExtInst %1 10 %61 
					                                                     OpStore %9 %62 
					                                       f32_2 %66 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %69 = OpAccessChain %13 %67 
					                                       f32_4 %70 = OpLoad %69 
					                                       f32_2 %71 = OpVectorShuffle %70 %70 0 1 
					                                       f32_2 %72 = OpFMul %66 %71 
					                              Uniform f32_4* %73 = OpAccessChain %13 %67 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_2 %75 = OpVectorShuffle %74 %74 2 3 
					                                       f32_2 %76 = OpFAdd %72 %75 
					                                                     OpStore %63 %76 
					                                Uniform f32* %78 = OpAccessChain %13 %77 
					                                         f32 %79 = OpLoad %78 
					                                Private f32* %80 = OpAccessChain %9 %59 
					                                         f32 %81 = OpLoad %80 
					                                         f32 %82 = OpFMul %79 %81 
					                                Private f32* %83 = OpAccessChain %63 %59 
					                                         f32 %84 = OpLoad %83 
					                                         f32 %85 = OpFAdd %82 %84 
					                                                     OpStore %31 %85 
					                                Uniform f32* %87 = OpAccessChain %13 %86 
					                                         f32 %88 = OpLoad %87 
					                                Private f32* %89 = OpAccessChain %9 %24 
					                                         f32 %90 = OpLoad %89 
					                                         f32 %91 = OpFMul %88 %90 
					                                Private f32* %92 = OpAccessChain %63 %24 
					                                         f32 %93 = OpLoad %92 
					                                         f32 %94 = OpFAdd %91 %93 
					                                Private f32* %95 = OpAccessChain %9 %24 
					                                                     OpStore %95 %94 
					                                Uniform f32* %97 = OpAccessChain %13 %86 
					                                         f32 %98 = OpLoad %97 
					                                         f32 %99 = OpFNegate %98 
					                                        f32 %101 = OpFMul %99 %100 
					                               Private f32* %102 = OpAccessChain %9 %24 
					                                        f32 %103 = OpLoad %102 
					                                        f32 %104 = OpFAdd %101 %103 
					                               Private f32* %105 = OpAccessChain %96 %24 
					                                                     OpStore %105 %104 
					                               Uniform f32* %106 = OpAccessChain %13 %77 
					                                        f32 %107 = OpLoad %106 
					                                        f32 %108 = OpFNegate %107 
					                                        f32 %109 = OpFMul %108 %100 
					                                        f32 %110 = OpLoad %31 
					                                        f32 %111 = OpFAdd %109 %110 
					                               Private f32* %112 = OpAccessChain %96 %59 
					                                                     OpStore %112 %111 
					                        read_only Texture2D %119 = OpLoad %118 
					                                    sampler %123 = OpLoad %122 
					                 read_only Texture2DSampled %125 = OpSampledImage %119 %123 
					                                      f32_2 %126 = OpLoad %96 
					                                      f32_4 %127 = OpImageSampleImplicitLod %125 %126 
					                                      f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
					                                                     OpStore %115 %128 
					                                      f32_3 %131 = OpLoad %115 
					                                      f32_4 %132 = OpLoad %130 
					                                      f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
					                                                     OpStore %130 %133 
					                                Output f32* %137 = OpAccessChain %130 %135 
					                                                     OpStore %137 %134 
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
						vec4 unused_0_5;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat2 = u_xlat0.x + 23.0;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat2 = dot(vec2(u_xlat2), vec2(12.9898005, 78.2330017));
					    u_xlat2 = sin(u_xlat2);
					    u_xlat0.y = u_xlat2 * 43758.5469;
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = _Value3 * u_xlat0.y + u_xlat4.y;
					    u_xlat0.x = _Value2 * u_xlat0.x + u_xlat4.x;
					    u_xlat1.x = (-_Value2) * 0.5 + u_xlat0.x;
					    u_xlat1.y = (-_Value3) * 0.5 + u_xlat2;
					    u_xlat10_0 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
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