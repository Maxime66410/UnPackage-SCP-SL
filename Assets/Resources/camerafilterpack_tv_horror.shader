Shader "CameraFilterPack/TV_Horror" {
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
			GpuProgramID 55827
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
					uniform 	float Fade;
					uniform 	float Distortion;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D Texture2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_12 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_12 = u_xlat10_1.z + u_xlat16_12;
					    u_xlat16_12 = u_xlat10_1.y * u_xlat16_12;
					    u_xlat16_12 = u_xlat16_12 * 0.333333343;
					    u_xlat16_12 = u_xlat16_12 / u_xlat10_1.z;
					    u_xlat16_12 = u_xlat10_1.x + u_xlat16_12;
					    u_xlat2.x = sin(_TimeX);
					    u_xlat2.x = u_xlat2.x * 12.0;
					    u_xlat2.x = floor(u_xlat2.x);
					    u_xlat0.z = u_xlat2.x * 0.0625;
					    u_xlat2.xy = vec2(vec2(Distortion, Distortion)) * vec2(-0.5, -0.5) + u_xlat0.xz;
					    u_xlat10_3 = texture(Texture2, u_xlat0.xy);
					    u_xlat0.xy = u_xlat10_1.xy * vec2(vec2(Distortion, Distortion)) + u_xlat2.xy;
					    u_xlat10_2 = texture(Texture2, u_xlat0.xy);
					    u_xlat16_0 = vec4(u_xlat16_12) * u_xlat10_2;
					    u_xlat16_0 = u_xlat16_0 * u_xlat10_3 + (-u_xlat10_1);
					    SV_Target0 = vec4(vec4(Fade, Fade, Fade, Fade)) * u_xlat16_0 + u_xlat10_1;
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
					; Bound: 177
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %12 %156 
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
					                                                OpDecorate %32 RelaxedPrecision 
					                                                OpDecorate %35 RelaxedPrecision 
					                                                OpDecorate %35 DescriptorSet 35 
					                                                OpDecorate %35 Binding 35 
					                                                OpDecorate %36 RelaxedPrecision 
					                                                OpDecorate %39 RelaxedPrecision 
					                                                OpDecorate %39 DescriptorSet 39 
					                                                OpDecorate %39 Binding 39 
					                                                OpDecorate %40 RelaxedPrecision 
					                                                OpDecorate %47 RelaxedPrecision 
					                                                OpDecorate %51 RelaxedPrecision 
					                                                OpDecorate %54 RelaxedPrecision 
					                                                OpDecorate %55 RelaxedPrecision 
					                                                OpDecorate %58 RelaxedPrecision 
					                                                OpDecorate %59 RelaxedPrecision 
					                                                OpDecorate %60 RelaxedPrecision 
					                                                OpDecorate %62 RelaxedPrecision 
					                                                OpDecorate %63 RelaxedPrecision 
					                                                OpDecorate %64 RelaxedPrecision 
					                                                OpDecorate %65 RelaxedPrecision 
					                                                OpDecorate %67 RelaxedPrecision 
					                                                OpDecorate %68 RelaxedPrecision 
					                                                OpDecorate %70 RelaxedPrecision 
					                                                OpDecorate %71 RelaxedPrecision 
					                                                OpDecorate %73 RelaxedPrecision 
					                                                OpDecorate %74 RelaxedPrecision 
					                                                OpDecorate %75 RelaxedPrecision 
					                                                OpDecorate %113 RelaxedPrecision 
					                                                OpDecorate %114 RelaxedPrecision 
					                                                OpDecorate %114 DescriptorSet 114 
					                                                OpDecorate %114 Binding 114 
					                                                OpDecorate %115 RelaxedPrecision 
					                                                OpDecorate %116 RelaxedPrecision 
					                                                OpDecorate %116 DescriptorSet 116 
					                                                OpDecorate %116 Binding 116 
					                                                OpDecorate %117 RelaxedPrecision 
					                                                OpDecorate %122 RelaxedPrecision 
					                                                OpDecorate %123 RelaxedPrecision 
					                                                OpDecorate %128 RelaxedPrecision 
					                                                OpDecorate %129 RelaxedPrecision 
					                                                OpDecorate %130 RelaxedPrecision 
					                                                OpDecorate %131 RelaxedPrecision 
					                                                OpDecorate %132 RelaxedPrecision 
					                                                OpDecorate %137 RelaxedPrecision 
					                                                OpDecorate %138 RelaxedPrecision 
					                                                OpDecorate %139 RelaxedPrecision 
					                                                OpDecorate %144 RelaxedPrecision 
					                                                OpDecorate %145 RelaxedPrecision 
					                                                OpDecorate %146 RelaxedPrecision 
					                                                OpDecorate %147 RelaxedPrecision 
					                                                OpDecorate %148 RelaxedPrecision 
					                                                OpDecorate %149 RelaxedPrecision 
					                                                OpDecorate %150 RelaxedPrecision 
					                                                OpDecorate %151 RelaxedPrecision 
					                                                OpDecorate %152 RelaxedPrecision 
					                                                OpDecorate %153 RelaxedPrecision 
					                                                OpDecorate %154 RelaxedPrecision 
					                                                OpDecorate %156 Location 156 
					                                                OpDecorate %166 RelaxedPrecision 
					                                                OpDecorate %167 RelaxedPrecision 
					                                                OpDecorate %168 RelaxedPrecision 
					                                                OpDecorate %169 RelaxedPrecision 
					                                                OpDecorate %170 RelaxedPrecision 
					                                                OpDecorate %171 RelaxedPrecision 
					                                                OpDecorate %172 RelaxedPrecision 
					                                                OpDecorate %173 RelaxedPrecision 
					                                                OpDecorate %174 RelaxedPrecision 
					                                                OpDecorate %175 RelaxedPrecision 
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
					                                        %31 = OpTypePointer Private %14 
					                         Private f32_4* %32 = OpVariable Private 
					                                        %33 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %34 = OpTypePointer UniformConstant %33 
					   UniformConstant read_only Texture2D* %35 = OpVariable UniformConstant 
					                                        %37 = OpTypeSampler 
					                                        %38 = OpTypePointer UniformConstant %37 
					               UniformConstant sampler* %39 = OpVariable UniformConstant 
					                                        %41 = OpTypeSampledImage %33 
					                                        %46 = OpTypePointer Private %6 
					                           Private f32* %47 = OpVariable Private 
					                                        %48 = OpTypeInt 32 0 
					                                    u32 %49 = OpConstant 1 
					                                    u32 %52 = OpConstant 0 
					                                    u32 %56 = OpConstant 2 
					                                    f32 %66 = OpConstant 3,674022E-40 
					                                        %76 = OpTypePointer Private %10 
					                         Private f32_2* %77 = OpVariable Private 
					                                    i32 %78 = OpConstant 0 
					                                        %79 = OpTypePointer Uniform %6 
					                                    f32 %86 = OpConstant 3,674022E-40 
					                                    f32 %95 = OpConstant 3,674022E-40 
					                                    i32 %98 = OpConstant 2 
					                                   f32 %107 = OpConstant 3,674022E-40 
					                                 f32_2 %108 = OpConstantComposite %107 %107 
					                        Private f32_4* %113 = OpVariable Private 
					  UniformConstant read_only Texture2D* %114 = OpVariable UniformConstant 
					              UniformConstant sampler* %116 = OpVariable UniformConstant 
					                        Private f32_4* %137 = OpVariable Private 
					                        Private f32_4* %144 = OpVariable Private 
					                                       %155 = OpTypePointer Output %14 
					                         Output f32_4* %156 = OpVariable Output 
					                                   i32 %157 = OpConstant 1 
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
					                    read_only Texture2D %36 = OpLoad %35 
					                                sampler %40 = OpLoad %39 
					             read_only Texture2DSampled %42 = OpSampledImage %36 %40 
					                                  f32_3 %43 = OpLoad %9 
					                                  f32_2 %44 = OpVectorShuffle %43 %43 0 1 
					                                  f32_4 %45 = OpImageSampleImplicitLod %42 %44 
					                                                OpStore %32 %45 
					                           Private f32* %50 = OpAccessChain %32 %49 
					                                    f32 %51 = OpLoad %50 
					                           Private f32* %53 = OpAccessChain %32 %52 
					                                    f32 %54 = OpLoad %53 
					                                    f32 %55 = OpFAdd %51 %54 
					                                                OpStore %47 %55 
					                           Private f32* %57 = OpAccessChain %32 %56 
					                                    f32 %58 = OpLoad %57 
					                                    f32 %59 = OpLoad %47 
					                                    f32 %60 = OpFAdd %58 %59 
					                                                OpStore %47 %60 
					                           Private f32* %61 = OpAccessChain %32 %49 
					                                    f32 %62 = OpLoad %61 
					                                    f32 %63 = OpLoad %47 
					                                    f32 %64 = OpFMul %62 %63 
					                                                OpStore %47 %64 
					                                    f32 %65 = OpLoad %47 
					                                    f32 %67 = OpFMul %65 %66 
					                                                OpStore %47 %67 
					                                    f32 %68 = OpLoad %47 
					                           Private f32* %69 = OpAccessChain %32 %56 
					                                    f32 %70 = OpLoad %69 
					                                    f32 %71 = OpFDiv %68 %70 
					                                                OpStore %47 %71 
					                           Private f32* %72 = OpAccessChain %32 %52 
					                                    f32 %73 = OpLoad %72 
					                                    f32 %74 = OpLoad %47 
					                                    f32 %75 = OpFAdd %73 %74 
					                                                OpStore %47 %75 
					                           Uniform f32* %80 = OpAccessChain %17 %78 
					                                    f32 %81 = OpLoad %80 
					                                    f32 %82 = OpExtInst %1 13 %81 
					                           Private f32* %83 = OpAccessChain %77 %52 
					                                                OpStore %83 %82 
					                           Private f32* %84 = OpAccessChain %77 %52 
					                                    f32 %85 = OpLoad %84 
					                                    f32 %87 = OpFMul %85 %86 
					                           Private f32* %88 = OpAccessChain %77 %52 
					                                                OpStore %88 %87 
					                           Private f32* %89 = OpAccessChain %77 %52 
					                                    f32 %90 = OpLoad %89 
					                                    f32 %91 = OpExtInst %1 8 %90 
					                           Private f32* %92 = OpAccessChain %77 %52 
					                                                OpStore %92 %91 
					                           Private f32* %93 = OpAccessChain %77 %52 
					                                    f32 %94 = OpLoad %93 
					                                    f32 %96 = OpFMul %94 %95 
					                           Private f32* %97 = OpAccessChain %9 %56 
					                                                OpStore %97 %96 
					                           Uniform f32* %99 = OpAccessChain %17 %98 
					                                   f32 %100 = OpLoad %99 
					                          Uniform f32* %101 = OpAccessChain %17 %98 
					                                   f32 %102 = OpLoad %101 
					                                 f32_2 %103 = OpCompositeConstruct %100 %102 
					                                   f32 %104 = OpCompositeExtract %103 0 
					                                   f32 %105 = OpCompositeExtract %103 1 
					                                 f32_2 %106 = OpCompositeConstruct %104 %105 
					                                 f32_2 %109 = OpFMul %106 %108 
					                                 f32_3 %110 = OpLoad %9 
					                                 f32_2 %111 = OpVectorShuffle %110 %110 0 2 
					                                 f32_2 %112 = OpFAdd %109 %111 
					                                                OpStore %77 %112 
					                   read_only Texture2D %115 = OpLoad %114 
					                               sampler %117 = OpLoad %116 
					            read_only Texture2DSampled %118 = OpSampledImage %115 %117 
					                                 f32_3 %119 = OpLoad %9 
					                                 f32_2 %120 = OpVectorShuffle %119 %119 0 1 
					                                 f32_4 %121 = OpImageSampleImplicitLod %118 %120 
					                                                OpStore %113 %121 
					                                 f32_4 %122 = OpLoad %32 
					                                 f32_2 %123 = OpVectorShuffle %122 %122 0 1 
					                          Uniform f32* %124 = OpAccessChain %17 %98 
					                                   f32 %125 = OpLoad %124 
					                          Uniform f32* %126 = OpAccessChain %17 %98 
					                                   f32 %127 = OpLoad %126 
					                                 f32_2 %128 = OpCompositeConstruct %125 %127 
					                                   f32 %129 = OpCompositeExtract %128 0 
					                                   f32 %130 = OpCompositeExtract %128 1 
					                                 f32_2 %131 = OpCompositeConstruct %129 %130 
					                                 f32_2 %132 = OpFMul %123 %131 
					                                 f32_2 %133 = OpLoad %77 
					                                 f32_2 %134 = OpFAdd %132 %133 
					                                 f32_3 %135 = OpLoad %9 
					                                 f32_3 %136 = OpVectorShuffle %135 %134 3 4 2 
					                                                OpStore %9 %136 
					                   read_only Texture2D %138 = OpLoad %114 
					                               sampler %139 = OpLoad %116 
					            read_only Texture2DSampled %140 = OpSampledImage %138 %139 
					                                 f32_3 %141 = OpLoad %9 
					                                 f32_2 %142 = OpVectorShuffle %141 %141 0 1 
					                                 f32_4 %143 = OpImageSampleImplicitLod %140 %142 
					                                                OpStore %137 %143 
					                                   f32 %145 = OpLoad %47 
					                                 f32_4 %146 = OpCompositeConstruct %145 %145 %145 %145 
					                                 f32_4 %147 = OpLoad %137 
					                                 f32_4 %148 = OpFMul %146 %147 
					                                                OpStore %144 %148 
					                                 f32_4 %149 = OpLoad %144 
					                                 f32_4 %150 = OpLoad %113 
					                                 f32_4 %151 = OpFMul %149 %150 
					                                 f32_4 %152 = OpLoad %32 
					                                 f32_4 %153 = OpFNegate %152 
					                                 f32_4 %154 = OpFAdd %151 %153 
					                                                OpStore %144 %154 
					                          Uniform f32* %158 = OpAccessChain %17 %157 
					                                   f32 %159 = OpLoad %158 
					                          Uniform f32* %160 = OpAccessChain %17 %157 
					                                   f32 %161 = OpLoad %160 
					                          Uniform f32* %162 = OpAccessChain %17 %157 
					                                   f32 %163 = OpLoad %162 
					                          Uniform f32* %164 = OpAccessChain %17 %157 
					                                   f32 %165 = OpLoad %164 
					                                 f32_4 %166 = OpCompositeConstruct %159 %161 %163 %165 
					                                   f32 %167 = OpCompositeExtract %166 0 
					                                   f32 %168 = OpCompositeExtract %166 1 
					                                   f32 %169 = OpCompositeExtract %166 2 
					                                   f32 %170 = OpCompositeExtract %166 3 
					                                 f32_4 %171 = OpCompositeConstruct %167 %168 %169 %170 
					                                 f32_4 %172 = OpLoad %144 
					                                 f32_4 %173 = OpFMul %171 %172 
					                                 f32_4 %174 = OpLoad %32 
					                                 f32_4 %175 = OpFAdd %173 %174 
					                                                OpStore %156 %175 
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
						float Fade;
						float Distortion;
						vec4 unused_0_4;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D Texture2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					float u_xlat16_12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_12 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_12 = u_xlat10_1.z + u_xlat16_12;
					    u_xlat16_12 = u_xlat10_1.y * u_xlat16_12;
					    u_xlat16_12 = u_xlat16_12 * 0.333333343;
					    u_xlat16_12 = u_xlat16_12 / u_xlat10_1.z;
					    u_xlat16_12 = u_xlat10_1.x + u_xlat16_12;
					    u_xlat2.x = sin(_TimeX);
					    u_xlat2.x = u_xlat2.x * 12.0;
					    u_xlat2.x = floor(u_xlat2.x);
					    u_xlat0.z = u_xlat2.x * 0.0625;
					    u_xlat2.xy = vec2(vec2(Distortion, Distortion)) * vec2(-0.5, -0.5) + u_xlat0.xz;
					    u_xlat10_3 = texture(Texture2, u_xlat0.xy);
					    u_xlat0.xy = u_xlat10_1.xy * vec2(vec2(Distortion, Distortion)) + u_xlat2.xy;
					    u_xlat10_2 = texture(Texture2, u_xlat0.xy);
					    u_xlat16_0 = vec4(u_xlat16_12) * u_xlat10_2;
					    u_xlat16_0 = u_xlat16_0 * u_xlat10_3 + (-u_xlat10_1);
					    SV_Target0 = vec4(vec4(Fade, Fade, Fade, Fade)) * u_xlat16_0 + u_xlat10_1;
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