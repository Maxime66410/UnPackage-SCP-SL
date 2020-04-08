Shader "CameraFilterPack/TV_CompressionFX" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Parasite ("_Parasite", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 12506
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
					uniform 	float _Parasite;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					float u_xlat3;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy * vec4(24.0, 19.0, 38.0, 14.0);
					    u_xlat1 = floor(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(4.0, 4.0, 4.0, 4.0);
					    u_xlat4.x = _TimeX * 12.0;
					    u_xlat4.x = floor(u_xlat4.x);
					    u_xlat1 = u_xlat4.xxxx * u_xlat1;
					    u_xlat4.xy = u_xlat4.xx * vec2(2.0, 1.0);
					    u_xlat4.x = dot(u_xlat4.xy, vec2(127.099998, 311.700012));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat6 = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = dot(u_xlat1.zw, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat6 = sin(u_xlat6);
					    u_xlat4.y = u_xlat6 * 43758.5469;
					    u_xlat4.xy = fract(u_xlat4.xy);
					    u_xlat3 = u_xlat4.y * u_xlat4.y;
					    u_xlat6 = u_xlat4.y * u_xlat3;
					    u_xlat6 = u_xlat6 * _Parasite;
					    u_xlat3 = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat3 * u_xlat1.x;
					    u_xlat6 = u_xlat6 * u_xlat1.x;
					    u_xlat6 = u_xlat6 * 0.0199999996;
					    u_xlat1.x = u_xlat4.x * u_xlat6;
					    u_xlat1.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
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
					; Bound: 180
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %172 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 11 
					                                              OpMemberDecorate %14 0 Offset 14 
					                                              OpMemberDecorate %14 1 Offset 14 
					                                              OpMemberDecorate %14 2 RelaxedPrecision 
					                                              OpMemberDecorate %14 2 Offset 14 
					                                              OpDecorate %14 Block 
					                                              OpDecorate %16 DescriptorSet 16 
					                                              OpDecorate %16 Binding 16 
					                                              OpDecorate %21 RelaxedPrecision 
					                                              OpDecorate %22 RelaxedPrecision 
					                                              OpDecorate %25 RelaxedPrecision 
					                                              OpDecorate %26 RelaxedPrecision 
					                                              OpDecorate %157 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %160 DescriptorSet 160 
					                                              OpDecorate %160 Binding 160 
					                                              OpDecorate %161 RelaxedPrecision 
					                                              OpDecorate %164 RelaxedPrecision 
					                                              OpDecorate %164 DescriptorSet 164 
					                                              OpDecorate %164 Binding 164 
					                                              OpDecorate %165 RelaxedPrecision 
					                                              OpDecorate %170 RelaxedPrecision 
					                                              OpDecorate %172 Location 172 
					                                              OpDecorate %173 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeVector %6 4 
					                                      %14 = OpTypeStruct %6 %6 %13 
					                                      %15 = OpTypePointer Uniform %14 
					   Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                      %17 = OpTypeInt 32 1 
					                                  i32 %18 = OpConstant 2 
					                                      %19 = OpTypePointer Uniform %13 
					                                      %28 = OpTypePointer Private %13 
					                       Private f32_4* %29 = OpVariable Private 
					                                  f32 %32 = OpConstant 3,674022E-40 
					                                  f32 %33 = OpConstant 3,674022E-40 
					                                  f32 %34 = OpConstant 3,674022E-40 
					                                  f32 %35 = OpConstant 3,674022E-40 
					                                f32_4 %36 = OpConstantComposite %32 %33 %34 %35 
					                                  f32 %41 = OpConstant 3,674022E-40 
					                                f32_4 %42 = OpConstantComposite %41 %41 %41 %41 
					                       Private f32_2* %44 = OpVariable Private 
					                                  i32 %45 = OpConstant 0 
					                                      %46 = OpTypePointer Uniform %6 
					                                  f32 %49 = OpConstant 3,674022E-40 
					                                      %51 = OpTypeInt 32 0 
					                                  u32 %52 = OpConstant 0 
					                                      %53 = OpTypePointer Private %6 
					                                  f32 %65 = OpConstant 3,674022E-40 
					                                  f32 %66 = OpConstant 3,674022E-40 
					                                f32_2 %67 = OpConstantComposite %65 %66 
					                                  f32 %70 = OpConstant 3,674022E-40 
					                                  f32 %71 = OpConstant 3,674022E-40 
					                                f32_2 %72 = OpConstantComposite %70 %71 
					                                  f32 %81 = OpConstant 3,674022E-40 
					                         Private f32* %84 = OpVariable Private 
					                                 u32 %108 = OpConstant 1 
					                        Private f32* %112 = OpVariable Private 
					                                 i32 %123 = OpConstant 1 
					                                 f32 %142 = OpConstant 3,674022E-40 
					                                 f32 %149 = OpConstant 3,674022E-40 
					                                     %155 = OpTypeVector %6 3 
					                                     %156 = OpTypePointer Private %155 
					                      Private f32_3* %157 = OpVariable Private 
					                                     %158 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %159 = OpTypePointer UniformConstant %158 
					UniformConstant read_only Texture2D* %160 = OpVariable UniformConstant 
					                                     %162 = OpTypeSampler 
					                                     %163 = OpTypePointer UniformConstant %162 
					            UniformConstant sampler* %164 = OpVariable UniformConstant 
					                                     %166 = OpTypeSampledImage %158 
					                                     %171 = OpTypePointer Output %13 
					                       Output f32_4* %172 = OpVariable Output 
					                                 u32 %176 = OpConstant 3 
					                                     %177 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
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
					                                f32_2 %30 = OpLoad %9 
					                                f32_4 %31 = OpVectorShuffle %30 %30 0 1 0 1 
					                                f32_4 %37 = OpFMul %31 %36 
					                                              OpStore %29 %37 
					                                f32_4 %38 = OpLoad %29 
					                                f32_4 %39 = OpExtInst %1 8 %38 
					                                              OpStore %29 %39 
					                                f32_4 %40 = OpLoad %29 
					                                f32_4 %43 = OpFMul %40 %42 
					                                              OpStore %29 %43 
					                         Uniform f32* %47 = OpAccessChain %16 %45 
					                                  f32 %48 = OpLoad %47 
					                                  f32 %50 = OpFMul %48 %49 
					                         Private f32* %54 = OpAccessChain %44 %52 
					                                              OpStore %54 %50 
					                         Private f32* %55 = OpAccessChain %44 %52 
					                                  f32 %56 = OpLoad %55 
					                                  f32 %57 = OpExtInst %1 8 %56 
					                         Private f32* %58 = OpAccessChain %44 %52 
					                                              OpStore %58 %57 
					                                f32_2 %59 = OpLoad %44 
					                                f32_4 %60 = OpVectorShuffle %59 %59 0 0 0 0 
					                                f32_4 %61 = OpLoad %29 
					                                f32_4 %62 = OpFMul %60 %61 
					                                              OpStore %29 %62 
					                                f32_2 %63 = OpLoad %44 
					                                f32_2 %64 = OpVectorShuffle %63 %63 0 0 
					                                f32_2 %68 = OpFMul %64 %67 
					                                              OpStore %44 %68 
					                                f32_2 %69 = OpLoad %44 
					                                  f32 %73 = OpDot %69 %72 
					                         Private f32* %74 = OpAccessChain %44 %52 
					                                              OpStore %74 %73 
					                         Private f32* %75 = OpAccessChain %44 %52 
					                                  f32 %76 = OpLoad %75 
					                                  f32 %77 = OpExtInst %1 13 %76 
					                         Private f32* %78 = OpAccessChain %44 %52 
					                                              OpStore %78 %77 
					                         Private f32* %79 = OpAccessChain %44 %52 
					                                  f32 %80 = OpLoad %79 
					                                  f32 %82 = OpFMul %80 %81 
					                         Private f32* %83 = OpAccessChain %44 %52 
					                                              OpStore %83 %82 
					                                f32_4 %85 = OpLoad %29 
					                                f32_2 %86 = OpVectorShuffle %85 %85 0 1 
					                                  f32 %87 = OpDot %86 %72 
					                                              OpStore %84 %87 
					                                f32_4 %88 = OpLoad %29 
					                                f32_2 %89 = OpVectorShuffle %88 %88 2 3 
					                                  f32 %90 = OpDot %89 %72 
					                         Private f32* %91 = OpAccessChain %29 %52 
					                                              OpStore %91 %90 
					                         Private f32* %92 = OpAccessChain %29 %52 
					                                  f32 %93 = OpLoad %92 
					                                  f32 %94 = OpExtInst %1 13 %93 
					                         Private f32* %95 = OpAccessChain %29 %52 
					                                              OpStore %95 %94 
					                         Private f32* %96 = OpAccessChain %29 %52 
					                                  f32 %97 = OpLoad %96 
					                                  f32 %98 = OpFMul %97 %81 
					                         Private f32* %99 = OpAccessChain %29 %52 
					                                              OpStore %99 %98 
					                        Private f32* %100 = OpAccessChain %29 %52 
					                                 f32 %101 = OpLoad %100 
					                                 f32 %102 = OpExtInst %1 10 %101 
					                        Private f32* %103 = OpAccessChain %29 %52 
					                                              OpStore %103 %102 
					                                 f32 %104 = OpLoad %84 
					                                 f32 %105 = OpExtInst %1 13 %104 
					                                              OpStore %84 %105 
					                                 f32 %106 = OpLoad %84 
					                                 f32 %107 = OpFMul %106 %81 
					                        Private f32* %109 = OpAccessChain %44 %108 
					                                              OpStore %109 %107 
					                               f32_2 %110 = OpLoad %44 
					                               f32_2 %111 = OpExtInst %1 10 %110 
					                                              OpStore %44 %111 
					                        Private f32* %113 = OpAccessChain %44 %108 
					                                 f32 %114 = OpLoad %113 
					                        Private f32* %115 = OpAccessChain %44 %108 
					                                 f32 %116 = OpLoad %115 
					                                 f32 %117 = OpFMul %114 %116 
					                                              OpStore %112 %117 
					                        Private f32* %118 = OpAccessChain %44 %108 
					                                 f32 %119 = OpLoad %118 
					                                 f32 %120 = OpLoad %112 
					                                 f32 %121 = OpFMul %119 %120 
					                                              OpStore %84 %121 
					                                 f32 %122 = OpLoad %84 
					                        Uniform f32* %124 = OpAccessChain %16 %123 
					                                 f32 %125 = OpLoad %124 
					                                 f32 %126 = OpFMul %122 %125 
					                                              OpStore %84 %126 
					                        Private f32* %127 = OpAccessChain %29 %52 
					                                 f32 %128 = OpLoad %127 
					                        Private f32* %129 = OpAccessChain %29 %52 
					                                 f32 %130 = OpLoad %129 
					                                 f32 %131 = OpFMul %128 %130 
					                                              OpStore %112 %131 
					                                 f32 %132 = OpLoad %112 
					                        Private f32* %133 = OpAccessChain %29 %52 
					                                 f32 %134 = OpLoad %133 
					                                 f32 %135 = OpFMul %132 %134 
					                        Private f32* %136 = OpAccessChain %29 %52 
					                                              OpStore %136 %135 
					                                 f32 %137 = OpLoad %84 
					                        Private f32* %138 = OpAccessChain %29 %52 
					                                 f32 %139 = OpLoad %138 
					                                 f32 %140 = OpFMul %137 %139 
					                                              OpStore %84 %140 
					                                 f32 %141 = OpLoad %84 
					                                 f32 %143 = OpFMul %141 %142 
					                                              OpStore %84 %143 
					                        Private f32* %144 = OpAccessChain %44 %52 
					                                 f32 %145 = OpLoad %144 
					                                 f32 %146 = OpLoad %84 
					                                 f32 %147 = OpFMul %145 %146 
					                        Private f32* %148 = OpAccessChain %29 %52 
					                                              OpStore %148 %147 
					                        Private f32* %150 = OpAccessChain %29 %108 
					                                              OpStore %150 %149 
					                               f32_2 %151 = OpLoad %9 
					                               f32_4 %152 = OpLoad %29 
					                               f32_2 %153 = OpVectorShuffle %152 %152 0 1 
					                               f32_2 %154 = OpFAdd %151 %153 
					                                              OpStore %9 %154 
					                 read_only Texture2D %161 = OpLoad %160 
					                             sampler %165 = OpLoad %164 
					          read_only Texture2DSampled %167 = OpSampledImage %161 %165 
					                               f32_2 %168 = OpLoad %9 
					                               f32_4 %169 = OpImageSampleImplicitLod %167 %168 
					                               f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
					                                              OpStore %157 %170 
					                               f32_3 %173 = OpLoad %157 
					                               f32_4 %174 = OpLoad %172 
					                               f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
					                                              OpStore %172 %175 
					                         Output f32* %178 = OpAccessChain %172 %176 
					                                              OpStore %178 %66 
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
						float _Parasite;
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					float u_xlat3;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy * vec4(24.0, 19.0, 38.0, 14.0);
					    u_xlat1 = floor(u_xlat1);
					    u_xlat1 = u_xlat1 * vec4(4.0, 4.0, 4.0, 4.0);
					    u_xlat4.x = _TimeX * 12.0;
					    u_xlat4.x = floor(u_xlat4.x);
					    u_xlat1 = u_xlat4.xxxx * u_xlat1;
					    u_xlat4.xy = u_xlat4.xx * vec2(2.0, 1.0);
					    u_xlat4.x = dot(u_xlat4.xy, vec2(127.099998, 311.700012));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat6 = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
					    u_xlat1.x = dot(u_xlat1.zw, vec2(127.099998, 311.700012));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat6 = sin(u_xlat6);
					    u_xlat4.y = u_xlat6 * 43758.5469;
					    u_xlat4.xy = fract(u_xlat4.xy);
					    u_xlat3 = u_xlat4.y * u_xlat4.y;
					    u_xlat6 = u_xlat4.y * u_xlat3;
					    u_xlat6 = u_xlat6 * _Parasite;
					    u_xlat3 = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat3 * u_xlat1.x;
					    u_xlat6 = u_xlat6 * u_xlat1.x;
					    u_xlat6 = u_xlat6 * 0.0199999996;
					    u_xlat1.x = u_xlat4.x * u_xlat6;
					    u_xlat1.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
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