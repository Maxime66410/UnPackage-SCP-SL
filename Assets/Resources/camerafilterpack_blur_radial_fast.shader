Shader "CameraFilterPack/Blur_Radial_Fast" {
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
			GpuProgramID 53989
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + (-vec2(_Value2, _Value3));
					    u_xlat2 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.150000006, 0.300000012, 0.450000018, 0.600000024) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat0.xyxy * u_xlat2.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat2 = u_xlat0.xyxy * u_xlat2.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_4;
					    u_xlat16_1 = u_xlat10_3 + u_xlat16_1;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_3;
					    u_xlat16_1 = u_xlat10_2 + u_xlat16_1;
					    u_xlat2.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.75, 0.900000036, 1.05000007) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat0.xyxy * u_xlat2.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat0.xy = u_xlat0.xy * u_xlat2.zz + vec2(_Value2, _Value3);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_1 = u_xlat10_3 + u_xlat16_1;
					    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
					    SV_Target0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
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
					; Bound: 230
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %11 %224 
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
					                                                OpDecorate %29 RelaxedPrecision 
					                                                OpDecorate %32 RelaxedPrecision 
					                                                OpDecorate %32 DescriptorSet 32 
					                                                OpDecorate %32 Binding 32 
					                                                OpDecorate %33 RelaxedPrecision 
					                                                OpDecorate %36 RelaxedPrecision 
					                                                OpDecorate %36 DescriptorSet 36 
					                                                OpDecorate %36 Binding 36 
					                                                OpDecorate %37 RelaxedPrecision 
					                                                OpDecorate %109 RelaxedPrecision 
					                                                OpDecorate %110 RelaxedPrecision 
					                                                OpDecorate %111 RelaxedPrecision 
					                                                OpDecorate %116 RelaxedPrecision 
					                                                OpDecorate %117 RelaxedPrecision 
					                                                OpDecorate %118 RelaxedPrecision 
					                                                OpDecorate %123 RelaxedPrecision 
					                                                OpDecorate %124 RelaxedPrecision 
					                                                OpDecorate %125 RelaxedPrecision 
					                                                OpDecorate %126 RelaxedPrecision 
					                                                OpDecorate %127 RelaxedPrecision 
					                                                OpDecorate %128 RelaxedPrecision 
					                                                OpDecorate %129 RelaxedPrecision 
					                                                OpDecorate %130 RelaxedPrecision 
					                                                OpDecorate %131 RelaxedPrecision 
					                                                OpDecorate %136 RelaxedPrecision 
					                                                OpDecorate %137 RelaxedPrecision 
					                                                OpDecorate %138 RelaxedPrecision 
					                                                OpDecorate %143 RelaxedPrecision 
					                                                OpDecorate %144 RelaxedPrecision 
					                                                OpDecorate %145 RelaxedPrecision 
					                                                OpDecorate %146 RelaxedPrecision 
					                                                OpDecorate %147 RelaxedPrecision 
					                                                OpDecorate %148 RelaxedPrecision 
					                                                OpDecorate %195 RelaxedPrecision 
					                                                OpDecorate %196 RelaxedPrecision 
					                                                OpDecorate %197 RelaxedPrecision 
					                                                OpDecorate %201 RelaxedPrecision 
					                                                OpDecorate %202 RelaxedPrecision 
					                                                OpDecorate %207 RelaxedPrecision 
					                                                OpDecorate %208 RelaxedPrecision 
					                                                OpDecorate %213 RelaxedPrecision 
					                                                OpDecorate %214 RelaxedPrecision 
					                                                OpDecorate %215 RelaxedPrecision 
					                                                OpDecorate %216 RelaxedPrecision 
					                                                OpDecorate %217 RelaxedPrecision 
					                                                OpDecorate %218 RelaxedPrecision 
					                                                OpDecorate %219 RelaxedPrecision 
					                                                OpDecorate %220 RelaxedPrecision 
					                                                OpDecorate %221 RelaxedPrecision 
					                                                OpDecorate %222 RelaxedPrecision 
					                                                OpDecorate %224 Location 224 
					                                                OpDecorate %225 RelaxedPrecision 
					                                                OpDecorate %228 RelaxedPrecision 
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
					                                        %28 = OpTypePointer Private %13 
					                         Private f32_4* %29 = OpVariable Private 
					                                        %30 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                        %31 = OpTypePointer UniformConstant %30 
					   UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
					                                        %34 = OpTypeSampler 
					                                        %35 = OpTypePointer UniformConstant %34 
					               UniformConstant sampler* %36 = OpVariable UniformConstant 
					                                        %38 = OpTypeSampledImage %30 
					                                    i32 %43 = OpConstant 1 
					                                        %44 = OpTypePointer Uniform %6 
					                                    i32 %47 = OpConstant 2 
					                         Private f32_4* %53 = OpVariable Private 
					                                    i32 %54 = OpConstant 0 
					                                    f32 %69 = OpConstant 3,674022E-40 
					                                    f32 %70 = OpConstant 3,674022E-40 
					                                    f32 %71 = OpConstant 3,674022E-40 
					                                    f32 %72 = OpConstant 3,674022E-40 
					                                  f32_4 %73 = OpConstantComposite %69 %70 %71 %72 
					                                    f32 %75 = OpConstant 3,674022E-40 
					                                  f32_4 %76 = OpConstantComposite %75 %75 %75 %75 
					                         Private f32_4* %78 = OpVariable Private 
					                        Private f32_4* %109 = OpVariable Private 
					                        Private f32_4* %116 = OpVariable Private 
					                        Private f32_4* %123 = OpVariable Private 
					                        Private f32_4* %136 = OpVariable Private 
					                                       %155 = OpTypeVector %6 3 
					                                   f32 %161 = OpConstant 3,674022E-40 
					                                   f32 %162 = OpConstant 3,674022E-40 
					                                   f32 %163 = OpConstant 3,674022E-40 
					                                 f32_3 %164 = OpConstantComposite %161 %162 %163 
					                                 f32_3 %166 = OpConstantComposite %75 %75 %75 
					                        Private f32_4* %195 = OpVariable Private 
					                        Private f32_4* %219 = OpVariable Private 
					                                       %223 = OpTypePointer Output %13 
					                         Output f32_4* %224 = OpVariable Output 
					                                   f32 %226 = OpConstant 3,674022E-40 
					                                 f32_4 %227 = OpConstantComposite %226 %226 %226 %226 
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
					                    read_only Texture2D %33 = OpLoad %32 
					                                sampler %37 = OpLoad %36 
					             read_only Texture2DSampled %39 = OpSampledImage %33 %37 
					                                  f32_2 %40 = OpLoad %9 
					                                  f32_4 %41 = OpImageSampleImplicitLod %39 %40 
					                                                OpStore %29 %41 
					                                  f32_2 %42 = OpLoad %9 
					                           Uniform f32* %45 = OpAccessChain %16 %43 
					                                    f32 %46 = OpLoad %45 
					                           Uniform f32* %48 = OpAccessChain %16 %47 
					                                    f32 %49 = OpLoad %48 
					                                  f32_2 %50 = OpCompositeConstruct %46 %49 
					                                  f32_2 %51 = OpFNegate %50 
					                                  f32_2 %52 = OpFAdd %42 %51 
					                                                OpStore %9 %52 
					                           Uniform f32* %55 = OpAccessChain %16 %54 
					                                    f32 %56 = OpLoad %55 
					                           Uniform f32* %57 = OpAccessChain %16 %54 
					                                    f32 %58 = OpLoad %57 
					                           Uniform f32* %59 = OpAccessChain %16 %54 
					                                    f32 %60 = OpLoad %59 
					                           Uniform f32* %61 = OpAccessChain %16 %54 
					                                    f32 %62 = OpLoad %61 
					                                  f32_4 %63 = OpCompositeConstruct %56 %58 %60 %62 
					                                    f32 %64 = OpCompositeExtract %63 0 
					                                    f32 %65 = OpCompositeExtract %63 1 
					                                    f32 %66 = OpCompositeExtract %63 2 
					                                    f32 %67 = OpCompositeExtract %63 3 
					                                  f32_4 %68 = OpCompositeConstruct %64 %65 %66 %67 
					                                  f32_4 %74 = OpFMul %68 %73 
					                                  f32_4 %77 = OpFAdd %74 %76 
					                                                OpStore %53 %77 
					                                  f32_2 %79 = OpLoad %9 
					                                  f32_4 %80 = OpVectorShuffle %79 %79 0 1 0 1 
					                                  f32_4 %81 = OpLoad %53 
					                                  f32_4 %82 = OpVectorShuffle %81 %81 0 0 1 1 
					                                  f32_4 %83 = OpFMul %80 %82 
					                           Uniform f32* %84 = OpAccessChain %16 %43 
					                                    f32 %85 = OpLoad %84 
					                           Uniform f32* %86 = OpAccessChain %16 %47 
					                                    f32 %87 = OpLoad %86 
					                           Uniform f32* %88 = OpAccessChain %16 %43 
					                                    f32 %89 = OpLoad %88 
					                           Uniform f32* %90 = OpAccessChain %16 %47 
					                                    f32 %91 = OpLoad %90 
					                                  f32_4 %92 = OpCompositeConstruct %85 %87 %89 %91 
					                                  f32_4 %93 = OpFAdd %83 %92 
					                                                OpStore %78 %93 
					                                  f32_2 %94 = OpLoad %9 
					                                  f32_4 %95 = OpVectorShuffle %94 %94 0 1 0 1 
					                                  f32_4 %96 = OpLoad %53 
					                                  f32_4 %97 = OpVectorShuffle %96 %96 2 2 3 3 
					                                  f32_4 %98 = OpFMul %95 %97 
					                           Uniform f32* %99 = OpAccessChain %16 %43 
					                                   f32 %100 = OpLoad %99 
					                          Uniform f32* %101 = OpAccessChain %16 %47 
					                                   f32 %102 = OpLoad %101 
					                          Uniform f32* %103 = OpAccessChain %16 %43 
					                                   f32 %104 = OpLoad %103 
					                          Uniform f32* %105 = OpAccessChain %16 %47 
					                                   f32 %106 = OpLoad %105 
					                                 f32_4 %107 = OpCompositeConstruct %100 %102 %104 %106 
					                                 f32_4 %108 = OpFAdd %98 %107 
					                                                OpStore %53 %108 
					                   read_only Texture2D %110 = OpLoad %32 
					                               sampler %111 = OpLoad %36 
					            read_only Texture2DSampled %112 = OpSampledImage %110 %111 
					                                 f32_4 %113 = OpLoad %78 
					                                 f32_2 %114 = OpVectorShuffle %113 %113 0 1 
					                                 f32_4 %115 = OpImageSampleImplicitLod %112 %114 
					                                                OpStore %109 %115 
					                   read_only Texture2D %117 = OpLoad %32 
					                               sampler %118 = OpLoad %36 
					            read_only Texture2DSampled %119 = OpSampledImage %117 %118 
					                                 f32_4 %120 = OpLoad %78 
					                                 f32_2 %121 = OpVectorShuffle %120 %120 2 3 
					                                 f32_4 %122 = OpImageSampleImplicitLod %119 %121 
					                                                OpStore %116 %122 
					                                 f32_4 %124 = OpLoad %29 
					                                 f32_4 %125 = OpLoad %109 
					                                 f32_4 %126 = OpFAdd %124 %125 
					                                                OpStore %123 %126 
					                                 f32_4 %127 = OpLoad %116 
					                                 f32_4 %128 = OpLoad %123 
					                                 f32_4 %129 = OpFAdd %127 %128 
					                                                OpStore %123 %129 
					                   read_only Texture2D %130 = OpLoad %32 
					                               sampler %131 = OpLoad %36 
					            read_only Texture2DSampled %132 = OpSampledImage %130 %131 
					                                 f32_4 %133 = OpLoad %53 
					                                 f32_2 %134 = OpVectorShuffle %133 %133 0 1 
					                                 f32_4 %135 = OpImageSampleImplicitLod %132 %134 
					                                                OpStore %116 %135 
					                   read_only Texture2D %137 = OpLoad %32 
					                               sampler %138 = OpLoad %36 
					            read_only Texture2DSampled %139 = OpSampledImage %137 %138 
					                                 f32_4 %140 = OpLoad %53 
					                                 f32_2 %141 = OpVectorShuffle %140 %140 2 3 
					                                 f32_4 %142 = OpImageSampleImplicitLod %139 %141 
					                                                OpStore %136 %142 
					                                 f32_4 %143 = OpLoad %123 
					                                 f32_4 %144 = OpLoad %116 
					                                 f32_4 %145 = OpFAdd %143 %144 
					                                                OpStore %123 %145 
					                                 f32_4 %146 = OpLoad %136 
					                                 f32_4 %147 = OpLoad %123 
					                                 f32_4 %148 = OpFAdd %146 %147 
					                                                OpStore %123 %148 
					                          Uniform f32* %149 = OpAccessChain %16 %54 
					                                   f32 %150 = OpLoad %149 
					                          Uniform f32* %151 = OpAccessChain %16 %54 
					                                   f32 %152 = OpLoad %151 
					                          Uniform f32* %153 = OpAccessChain %16 %54 
					                                   f32 %154 = OpLoad %153 
					                                 f32_3 %156 = OpCompositeConstruct %150 %152 %154 
					                                   f32 %157 = OpCompositeExtract %156 0 
					                                   f32 %158 = OpCompositeExtract %156 1 
					                                   f32 %159 = OpCompositeExtract %156 2 
					                                 f32_3 %160 = OpCompositeConstruct %157 %158 %159 
					                                 f32_3 %165 = OpFMul %160 %164 
					                                 f32_3 %167 = OpFAdd %165 %166 
					                                 f32_4 %168 = OpLoad %53 
					                                 f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
					                                                OpStore %53 %169 
					                                 f32_2 %170 = OpLoad %9 
					                                 f32_4 %171 = OpVectorShuffle %170 %170 0 1 0 1 
					                                 f32_4 %172 = OpLoad %53 
					                                 f32_4 %173 = OpVectorShuffle %172 %172 0 0 1 1 
					                                 f32_4 %174 = OpFMul %171 %173 
					                          Uniform f32* %175 = OpAccessChain %16 %43 
					                                   f32 %176 = OpLoad %175 
					                          Uniform f32* %177 = OpAccessChain %16 %47 
					                                   f32 %178 = OpLoad %177 
					                          Uniform f32* %179 = OpAccessChain %16 %43 
					                                   f32 %180 = OpLoad %179 
					                          Uniform f32* %181 = OpAccessChain %16 %47 
					                                   f32 %182 = OpLoad %181 
					                                 f32_4 %183 = OpCompositeConstruct %176 %178 %180 %182 
					                                 f32_4 %184 = OpFAdd %174 %183 
					                                                OpStore %78 %184 
					                                 f32_2 %185 = OpLoad %9 
					                                 f32_4 %186 = OpLoad %53 
					                                 f32_2 %187 = OpVectorShuffle %186 %186 2 2 
					                                 f32_2 %188 = OpFMul %185 %187 
					                          Uniform f32* %189 = OpAccessChain %16 %43 
					                                   f32 %190 = OpLoad %189 
					                          Uniform f32* %191 = OpAccessChain %16 %47 
					                                   f32 %192 = OpLoad %191 
					                                 f32_2 %193 = OpCompositeConstruct %190 %192 
					                                 f32_2 %194 = OpFAdd %188 %193 
					                                                OpStore %9 %194 
					                   read_only Texture2D %196 = OpLoad %32 
					                               sampler %197 = OpLoad %36 
					            read_only Texture2DSampled %198 = OpSampledImage %196 %197 
					                                 f32_2 %199 = OpLoad %9 
					                                 f32_4 %200 = OpImageSampleImplicitLod %198 %199 
					                                                OpStore %195 %200 
					                   read_only Texture2D %201 = OpLoad %32 
					                               sampler %202 = OpLoad %36 
					            read_only Texture2DSampled %203 = OpSampledImage %201 %202 
					                                 f32_4 %204 = OpLoad %78 
					                                 f32_2 %205 = OpVectorShuffle %204 %204 0 1 
					                                 f32_4 %206 = OpImageSampleImplicitLod %203 %205 
					                                                OpStore %136 %206 
					                   read_only Texture2D %207 = OpLoad %32 
					                               sampler %208 = OpLoad %36 
					            read_only Texture2DSampled %209 = OpSampledImage %207 %208 
					                                 f32_4 %210 = OpLoad %78 
					                                 f32_2 %211 = OpVectorShuffle %210 %210 2 3 
					                                 f32_4 %212 = OpImageSampleImplicitLod %209 %211 
					                                                OpStore %116 %212 
					                                 f32_4 %213 = OpLoad %123 
					                                 f32_4 %214 = OpLoad %136 
					                                 f32_4 %215 = OpFAdd %213 %214 
					                                                OpStore %123 %215 
					                                 f32_4 %216 = OpLoad %116 
					                                 f32_4 %217 = OpLoad %123 
					                                 f32_4 %218 = OpFAdd %216 %217 
					                                                OpStore %123 %218 
					                                 f32_4 %220 = OpLoad %195 
					                                 f32_4 %221 = OpLoad %123 
					                                 f32_4 %222 = OpFAdd %220 %221 
					                                                OpStore %219 %222 
					                                 f32_4 %225 = OpLoad %219 
					                                 f32_4 %228 = OpFMul %225 %227 
					                                                OpStore %224 %228 
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
						float _Value;
						float _Value2;
						float _Value3;
						vec4 unused_0_4;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy + (-vec2(_Value2, _Value3));
					    u_xlat2 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.150000006, 0.300000012, 0.450000018, 0.600000024) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat0.xyxy * u_xlat2.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat2 = u_xlat0.xyxy * u_xlat2.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat10_1 + u_xlat10_4;
					    u_xlat16_1 = u_xlat10_3 + u_xlat16_1;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_3;
					    u_xlat16_1 = u_xlat10_2 + u_xlat16_1;
					    u_xlat2.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.75, 0.900000036, 1.05000007) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat0.xyxy * u_xlat2.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat0.xy = u_xlat0.xy * u_xlat2.zz + vec2(_Value2, _Value3);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_1 = u_xlat16_1 + u_xlat10_2;
					    u_xlat16_1 = u_xlat10_3 + u_xlat16_1;
					    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
					    SV_Target0 = u_xlat16_0 * vec4(0.125, 0.125, 0.125, 0.125);
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