Shader "CameraFilterPack/Pixelisation_Sweater" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 1
		_Brightness ("_Brightness", Range(0, 1)) = 1.5
		_Saturation ("_Saturation", Range(0, 1)) = 3
		_Contrast ("_Contrast", Range(0, 1)) = 3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 49061
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
					uniform 	float _Fade;
					uniform 	float _SweaterSize;
					uniform 	float _Intensity;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D Texture2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _SweaterSize + _SweaterSize;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat1.xy * vec2(vec2(_SweaterSize, _SweaterSize));
					    u_xlat10_2 = texture(Texture2, u_xlat4.xy);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5);
					    u_xlat10_3 = texture(Texture2, u_xlat4.xy);
					    u_xlat4.x = u_xlat10_2.y / _SweaterSize;
					    u_xlat4.x = (-u_xlat4.x) + u_xlat1.y;
					    u_xlat1.z = u_xlat0.x + u_xlat4.x;
					    u_xlat0.xy = u_xlat1.xz * vec2(vec2(_SweaterSize, _SweaterSize));
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_SweaterSize, _SweaterSize));
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat10_0 * u_xlat10_3.zzzz;
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_2.xxxx + u_xlat16_3;
					    u_xlat16_0 = u_xlat10_2.xxxx * u_xlat16_0;
					    u_xlat0 = u_xlat16_0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity)) + (-u_xlat10_1);
					    SV_Target0 = vec4(vec4(_Fade, _Fade, _Fade, _Fade)) * u_xlat0 + u_xlat10_1;
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
					; Bound: 209
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %35 %188 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpMemberDecorate %10 0 Offset 10 
					                                                OpMemberDecorate %10 1 Offset 10 
					                                                OpMemberDecorate %10 2 Offset 10 
					                                                OpMemberDecorate %10 3 RelaxedPrecision 
					                                                OpMemberDecorate %10 3 Offset 10 
					                                                OpDecorate %10 Block 
					                                                OpDecorate %12 DescriptorSet 12 
					                                                OpDecorate %12 Binding 12 
					                                                OpDecorate vs_TEXCOORD0 Location 35 
					                                                OpDecorate %40 RelaxedPrecision 
					                                                OpDecorate %41 RelaxedPrecision 
					                                                OpDecorate %44 RelaxedPrecision 
					                                                OpDecorate %45 RelaxedPrecision 
					                                                OpDecorate %62 RelaxedPrecision 
					                                                OpDecorate %65 RelaxedPrecision 
					                                                OpDecorate %65 DescriptorSet 65 
					                                                OpDecorate %65 Binding 65 
					                                                OpDecorate %66 RelaxedPrecision 
					                                                OpDecorate %69 RelaxedPrecision 
					                                                OpDecorate %69 DescriptorSet 69 
					                                                OpDecorate %69 Binding 69 
					                                                OpDecorate %70 RelaxedPrecision 
					                                                OpDecorate %75 RelaxedPrecision 
					                                                OpDecorate %80 RelaxedPrecision 
					                                                OpDecorate %81 RelaxedPrecision 
					                                                OpDecorate %82 RelaxedPrecision 
					                                                OpDecorate %87 RelaxedPrecision 
					                                                OpDecorate %91 RelaxedPrecision 
					                                                OpDecorate %118 RelaxedPrecision 
					                                                OpDecorate %119 RelaxedPrecision 
					                                                OpDecorate %119 DescriptorSet 119 
					                                                OpDecorate %119 Binding 119 
					                                                OpDecorate %120 RelaxedPrecision 
					                                                OpDecorate %121 RelaxedPrecision 
					                                                OpDecorate %121 DescriptorSet 121 
					                                                OpDecorate %121 Binding 121 
					                                                OpDecorate %122 RelaxedPrecision 
					                                                OpDecorate %145 RelaxedPrecision 
					                                                OpDecorate %146 RelaxedPrecision 
					                                                OpDecorate %147 RelaxedPrecision 
					                                                OpDecorate %152 RelaxedPrecision 
					                                                OpDecorate %153 RelaxedPrecision 
					                                                OpDecorate %154 RelaxedPrecision 
					                                                OpDecorate %155 RelaxedPrecision 
					                                                OpDecorate %156 RelaxedPrecision 
					                                                OpDecorate %157 RelaxedPrecision 
					                                                OpDecorate %158 RelaxedPrecision 
					                                                OpDecorate %159 RelaxedPrecision 
					                                                OpDecorate %160 RelaxedPrecision 
					                                                OpDecorate %161 RelaxedPrecision 
					                                                OpDecorate %162 RelaxedPrecision 
					                                                OpDecorate %163 RelaxedPrecision 
					                                                OpDecorate %164 RelaxedPrecision 
					                                                OpDecorate %165 RelaxedPrecision 
					                                                OpDecorate %166 RelaxedPrecision 
					                                                OpDecorate %167 RelaxedPrecision 
					                                                OpDecorate %177 RelaxedPrecision 
					                                                OpDecorate %178 RelaxedPrecision 
					                                                OpDecorate %179 RelaxedPrecision 
					                                                OpDecorate %180 RelaxedPrecision 
					                                                OpDecorate %181 RelaxedPrecision 
					                                                OpDecorate %182 RelaxedPrecision 
					                                                OpDecorate %183 RelaxedPrecision 
					                                                OpDecorate %184 RelaxedPrecision 
					                                                OpDecorate %185 RelaxedPrecision 
					                                                OpDecorate %186 RelaxedPrecision 
					                                                OpDecorate %188 Location 188 
					                                                OpDecorate %206 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 4 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_4* %9 = OpVariable Private 
					                                        %10 = OpTypeStruct %6 %6 %6 %7 
					                                        %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                        %13 = OpTypeInt 32 1 
					                                    i32 %14 = OpConstant 1 
					                                        %15 = OpTypePointer Uniform %6 
					                                        %21 = OpTypeInt 32 0 
					                                    u32 %22 = OpConstant 0 
					                                        %23 = OpTypePointer Private %6 
					                                    f32 %25 = OpConstant 3,674022E-40 
					                                        %30 = OpTypeVector %6 3 
					                                        %31 = OpTypePointer Private %30 
					                         Private f32_3* %32 = OpVariable Private 
					                                        %33 = OpTypeVector %6 2 
					                                        %34 = OpTypePointer Input %33 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                    i32 %37 = OpConstant 3 
					                                        %38 = OpTypePointer Uniform %7 
					                                        %49 = OpTypePointer Private %33 
					                         Private f32_2* %50 = OpVariable Private 
					                         Private f32_2* %62 = OpVariable Private 
					                                        %63 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %64 = OpTypePointer UniformConstant %63 
					   UniformConstant read_only Texture2D* %65 = OpVariable UniformConstant 
					                                        %67 = OpTypeSampler 
					                                        %68 = OpTypePointer UniformConstant %67 
					               UniformConstant sampler* %69 = OpVariable UniformConstant 
					                                        %71 = OpTypeSampledImage %63 
					                                    f32 %77 = OpConstant 3,674022E-40 
					                                  f32_2 %78 = OpConstantComposite %77 %77 
					                           Private f32* %80 = OpVariable Private 
					                                    u32 %86 = OpConstant 2 
					                           Private f32* %88 = OpVariable Private 
					                                    u32 %89 = OpConstant 1 
					                        Private f32_4* %118 = OpVariable Private 
					  UniformConstant read_only Texture2D* %119 = OpVariable UniformConstant 
					              UniformConstant sampler* %121 = OpVariable UniformConstant 
					                        Private f32_4* %145 = OpVariable Private 
					                        Private f32_4* %152 = OpVariable Private 
					                                   i32 %168 = OpConstant 2 
					                                       %187 = OpTypePointer Output %7 
					                         Output f32_4* %188 = OpVariable Output 
					                                   i32 %189 = OpConstant 0 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                           Uniform f32* %16 = OpAccessChain %12 %14 
					                                    f32 %17 = OpLoad %16 
					                           Uniform f32* %18 = OpAccessChain %12 %14 
					                                    f32 %19 = OpLoad %18 
					                                    f32 %20 = OpFAdd %17 %19 
					                           Private f32* %24 = OpAccessChain %9 %22 
					                                                OpStore %24 %20 
					                           Private f32* %26 = OpAccessChain %9 %22 
					                                    f32 %27 = OpLoad %26 
					                                    f32 %28 = OpFDiv %25 %27 
					                           Private f32* %29 = OpAccessChain %9 %22 
					                                                OpStore %29 %28 
					                                  f32_2 %36 = OpLoad vs_TEXCOORD0 
					                         Uniform f32_4* %39 = OpAccessChain %12 %37 
					                                  f32_4 %40 = OpLoad %39 
					                                  f32_2 %41 = OpVectorShuffle %40 %40 0 1 
					                                  f32_2 %42 = OpFMul %36 %41 
					                         Uniform f32_4* %43 = OpAccessChain %12 %37 
					                                  f32_4 %44 = OpLoad %43 
					                                  f32_2 %45 = OpVectorShuffle %44 %44 2 3 
					                                  f32_2 %46 = OpFAdd %42 %45 
					                                  f32_3 %47 = OpLoad %32 
					                                  f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
					                                                OpStore %32 %48 
					                                  f32_3 %51 = OpLoad %32 
					                                  f32_2 %52 = OpVectorShuffle %51 %51 0 1 
					                           Uniform f32* %53 = OpAccessChain %12 %14 
					                                    f32 %54 = OpLoad %53 
					                           Uniform f32* %55 = OpAccessChain %12 %14 
					                                    f32 %56 = OpLoad %55 
					                                  f32_2 %57 = OpCompositeConstruct %54 %56 
					                                    f32 %58 = OpCompositeExtract %57 0 
					                                    f32 %59 = OpCompositeExtract %57 1 
					                                  f32_2 %60 = OpCompositeConstruct %58 %59 
					                                  f32_2 %61 = OpFMul %52 %60 
					                                                OpStore %50 %61 
					                    read_only Texture2D %66 = OpLoad %65 
					                                sampler %70 = OpLoad %69 
					             read_only Texture2DSampled %72 = OpSampledImage %66 %70 
					                                  f32_2 %73 = OpLoad %50 
					                                  f32_4 %74 = OpImageSampleImplicitLod %72 %73 
					                                  f32_2 %75 = OpVectorShuffle %74 %74 0 1 
					                                                OpStore %62 %75 
					                                  f32_2 %76 = OpLoad %50 
					                                  f32_2 %79 = OpFMul %76 %78 
					                                                OpStore %50 %79 
					                    read_only Texture2D %81 = OpLoad %65 
					                                sampler %82 = OpLoad %69 
					             read_only Texture2DSampled %83 = OpSampledImage %81 %82 
					                                  f32_2 %84 = OpLoad %50 
					                                  f32_4 %85 = OpImageSampleImplicitLod %83 %84 
					                                    f32 %87 = OpCompositeExtract %85 2 
					                                                OpStore %80 %87 
					                           Private f32* %90 = OpAccessChain %62 %89 
					                                    f32 %91 = OpLoad %90 
					                           Uniform f32* %92 = OpAccessChain %12 %14 
					                                    f32 %93 = OpLoad %92 
					                                    f32 %94 = OpFDiv %91 %93 
					                                                OpStore %88 %94 
					                                    f32 %95 = OpLoad %88 
					                                    f32 %96 = OpFNegate %95 
					                           Private f32* %97 = OpAccessChain %32 %89 
					                                    f32 %98 = OpLoad %97 
					                                    f32 %99 = OpFAdd %96 %98 
					                                                OpStore %88 %99 
					                          Private f32* %100 = OpAccessChain %9 %22 
					                                   f32 %101 = OpLoad %100 
					                                   f32 %102 = OpLoad %88 
					                                   f32 %103 = OpFAdd %101 %102 
					                          Private f32* %104 = OpAccessChain %32 %86 
					                                                OpStore %104 %103 
					                                 f32_3 %105 = OpLoad %32 
					                                 f32_2 %106 = OpVectorShuffle %105 %105 0 2 
					                          Uniform f32* %107 = OpAccessChain %12 %14 
					                                   f32 %108 = OpLoad %107 
					                          Uniform f32* %109 = OpAccessChain %12 %14 
					                                   f32 %110 = OpLoad %109 
					                                 f32_2 %111 = OpCompositeConstruct %108 %110 
					                                   f32 %112 = OpCompositeExtract %111 0 
					                                   f32 %113 = OpCompositeExtract %111 1 
					                                 f32_2 %114 = OpCompositeConstruct %112 %113 
					                                 f32_2 %115 = OpFMul %106 %114 
					                                 f32_4 %116 = OpLoad %9 
					                                 f32_4 %117 = OpVectorShuffle %116 %115 4 1 5 3 
					                                                OpStore %9 %117 
					                   read_only Texture2D %120 = OpLoad %119 
					                               sampler %122 = OpLoad %121 
					            read_only Texture2DSampled %123 = OpSampledImage %120 %122 
					                                 f32_3 %124 = OpLoad %32 
					                                 f32_2 %125 = OpVectorShuffle %124 %124 0 1 
					                                 f32_4 %126 = OpImageSampleImplicitLod %123 %125 
					                                                OpStore %118 %126 
					                                 f32_4 %127 = OpLoad %9 
					                                 f32_2 %128 = OpVectorShuffle %127 %127 0 2 
					                                 f32_2 %129 = OpExtInst %1 8 %128 
					                                 f32_4 %130 = OpLoad %9 
					                                 f32_4 %131 = OpVectorShuffle %130 %129 4 1 5 3 
					                                                OpStore %9 %131 
					                                 f32_4 %132 = OpLoad %9 
					                                 f32_2 %133 = OpVectorShuffle %132 %132 0 2 
					                          Uniform f32* %134 = OpAccessChain %12 %14 
					                                   f32 %135 = OpLoad %134 
					                          Uniform f32* %136 = OpAccessChain %12 %14 
					                                   f32 %137 = OpLoad %136 
					                                 f32_2 %138 = OpCompositeConstruct %135 %137 
					                                   f32 %139 = OpCompositeExtract %138 0 
					                                   f32 %140 = OpCompositeExtract %138 1 
					                                 f32_2 %141 = OpCompositeConstruct %139 %140 
					                                 f32_2 %142 = OpFDiv %133 %141 
					                                 f32_4 %143 = OpLoad %9 
					                                 f32_4 %144 = OpVectorShuffle %143 %142 4 1 5 3 
					                                                OpStore %9 %144 
					                   read_only Texture2D %146 = OpLoad %119 
					                               sampler %147 = OpLoad %121 
					            read_only Texture2DSampled %148 = OpSampledImage %146 %147 
					                                 f32_4 %149 = OpLoad %9 
					                                 f32_2 %150 = OpVectorShuffle %149 %149 0 2 
					                                 f32_4 %151 = OpImageSampleImplicitLod %148 %150 
					                                                OpStore %145 %151 
					                                   f32 %153 = OpLoad %80 
					                                 f32_4 %154 = OpCompositeConstruct %153 %153 %153 %153 
					                                 f32_4 %155 = OpLoad %145 
					                                 f32_4 %156 = OpFMul %154 %155 
					                                                OpStore %152 %156 
					                                 f32_4 %157 = OpLoad %145 
					                                 f32_2 %158 = OpLoad %62 
					                                 f32_4 %159 = OpVectorShuffle %158 %158 0 0 0 0 
					                                 f32_4 %160 = OpFMul %157 %159 
					                                 f32_4 %161 = OpLoad %152 
					                                 f32_4 %162 = OpFAdd %160 %161 
					                                                OpStore %152 %162 
					                                 f32_2 %163 = OpLoad %62 
					                                 f32_4 %164 = OpVectorShuffle %163 %163 0 0 0 0 
					                                 f32_4 %165 = OpLoad %152 
					                                 f32_4 %166 = OpFMul %164 %165 
					                                                OpStore %152 %166 
					                                 f32_4 %167 = OpLoad %152 
					                          Uniform f32* %169 = OpAccessChain %12 %168 
					                                   f32 %170 = OpLoad %169 
					                          Uniform f32* %171 = OpAccessChain %12 %168 
					                                   f32 %172 = OpLoad %171 
					                          Uniform f32* %173 = OpAccessChain %12 %168 
					                                   f32 %174 = OpLoad %173 
					                          Uniform f32* %175 = OpAccessChain %12 %168 
					                                   f32 %176 = OpLoad %175 
					                                 f32_4 %177 = OpCompositeConstruct %170 %172 %174 %176 
					                                   f32 %178 = OpCompositeExtract %177 0 
					                                   f32 %179 = OpCompositeExtract %177 1 
					                                   f32 %180 = OpCompositeExtract %177 2 
					                                   f32 %181 = OpCompositeExtract %177 3 
					                                 f32_4 %182 = OpCompositeConstruct %178 %179 %180 %181 
					                                 f32_4 %183 = OpFMul %167 %182 
					                                 f32_4 %184 = OpLoad %118 
					                                 f32_4 %185 = OpFNegate %184 
					                                 f32_4 %186 = OpFAdd %183 %185 
					                                                OpStore %9 %186 
					                          Uniform f32* %190 = OpAccessChain %12 %189 
					                                   f32 %191 = OpLoad %190 
					                          Uniform f32* %192 = OpAccessChain %12 %189 
					                                   f32 %193 = OpLoad %192 
					                          Uniform f32* %194 = OpAccessChain %12 %189 
					                                   f32 %195 = OpLoad %194 
					                          Uniform f32* %196 = OpAccessChain %12 %189 
					                                   f32 %197 = OpLoad %196 
					                                 f32_4 %198 = OpCompositeConstruct %191 %193 %195 %197 
					                                   f32 %199 = OpCompositeExtract %198 0 
					                                   f32 %200 = OpCompositeExtract %198 1 
					                                   f32 %201 = OpCompositeExtract %198 2 
					                                   f32 %202 = OpCompositeExtract %198 3 
					                                 f32_4 %203 = OpCompositeConstruct %199 %200 %201 %202 
					                                 f32_4 %204 = OpLoad %9 
					                                 f32_4 %205 = OpFMul %203 %204 
					                                 f32_4 %206 = OpLoad %118 
					                                 f32_4 %207 = OpFAdd %205 %206 
					                                                OpStore %188 %207 
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
						float _Fade;
						float _SweaterSize;
						float _Intensity;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D Texture2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = _SweaterSize + _SweaterSize;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat1.xy * vec2(vec2(_SweaterSize, _SweaterSize));
					    u_xlat10_2 = texture(Texture2, u_xlat4.xy);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.5, 0.5);
					    u_xlat10_3 = texture(Texture2, u_xlat4.xy);
					    u_xlat4.x = u_xlat10_2.y / _SweaterSize;
					    u_xlat4.x = (-u_xlat4.x) + u_xlat1.y;
					    u_xlat1.z = u_xlat0.x + u_xlat4.x;
					    u_xlat0.xy = u_xlat1.xz * vec2(vec2(_SweaterSize, _SweaterSize));
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_SweaterSize, _SweaterSize));
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_3 = u_xlat10_0 * u_xlat10_3.zzzz;
					    u_xlat16_0 = u_xlat10_0 * u_xlat10_2.xxxx + u_xlat16_3;
					    u_xlat16_0 = u_xlat10_2.xxxx * u_xlat16_0;
					    u_xlat0 = u_xlat16_0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity)) + (-u_xlat10_1);
					    SV_Target0 = vec4(vec4(_Fade, _Fade, _Fade, _Fade)) * u_xlat0 + u_xlat10_1;
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