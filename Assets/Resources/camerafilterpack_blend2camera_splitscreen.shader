Shader "CameraFilterPack/Blend2Camera_SplitScreen" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 49757
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
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec3 u_xlat4;
					float u_xlat8;
					void main()
					{
					    u_xlat0.y = (-_Value6);
					    u_xlat0.xz = (-vec2(_Value3, _Value2));
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
					    u_xlat8 = u_xlat0.z + 1.0;
					    u_xlat2 = sin(_Value5);
					    u_xlat3 = cos(_Value5);
					    u_xlat4.x = u_xlat0.y * u_xlat3;
					    u_xlat0.x = u_xlat0.x * u_xlat2 + u_xlat4.x;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = dot((-u_xlat0.xx), (-u_xlat0.xx));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.x = float(1.0) / _Value4;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat4.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat10_2 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
					    u_xlat4.xyz = vec3(u_xlat8) * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyz;
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
					; Bound: 256
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %35 %243 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %12 0 Offset 12 
					                                                      OpMemberDecorate %12 1 Offset 12 
					                                                      OpMemberDecorate %12 2 Offset 12 
					                                                      OpMemberDecorate %12 3 Offset 12 
					                                                      OpMemberDecorate %12 4 Offset 12 
					                                                      OpMemberDecorate %12 5 Offset 12 
					                                                      OpMemberDecorate %12 6 Offset 12 
					                                                      OpMemberDecorate %12 7 RelaxedPrecision 
					                                                      OpMemberDecorate %12 7 Offset 12 
					                                                      OpDecorate %12 Block 
					                                                      OpDecorate %14 DescriptorSet 14 
					                                                      OpDecorate %14 Binding 14 
					                                                      OpDecorate vs_TEXCOORD0 Location 35 
					                                                      OpDecorate %40 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate %44 RelaxedPrecision 
					                                                      OpDecorate %45 RelaxedPrecision 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %190 RelaxedPrecision 
					                                                      OpDecorate %190 DescriptorSet 190 
					                                                      OpDecorate %190 Binding 190 
					                                                      OpDecorate %191 RelaxedPrecision 
					                                                      OpDecorate %194 RelaxedPrecision 
					                                                      OpDecorate %194 DescriptorSet 194 
					                                                      OpDecorate %194 Binding 194 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %203 DescriptorSet 203 
					                                                      OpDecorate %203 Binding 203 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %205 DescriptorSet 205 
					                                                      OpDecorate %205 Binding 205 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                                      OpDecorate %212 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %219 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %232 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %243 Location 243 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypeVector %6 4 
					                                              %12 = OpTypeStruct %6 %6 %6 %6 %6 %6 %10 %11 
					                                              %13 = OpTypePointer Uniform %12 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
					                                              %15 = OpTypeInt 32 1 
					                                          i32 %16 = OpConstant 5 
					                                              %17 = OpTypePointer Uniform %6 
					                                              %21 = OpTypeInt 32 0 
					                                          u32 %22 = OpConstant 1 
					                                              %23 = OpTypePointer Private %6 
					                                              %25 = OpTypeBool 
					                                              %26 = OpTypePointer Private %25 
					                                Private bool* %27 = OpVariable Private 
					                                          i32 %28 = OpConstant 6 
					                                          f32 %31 = OpConstant 3,674022E-40 
					                               Private f32_3* %33 = OpVariable Private 
					                                              %34 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %37 = OpConstant 7 
					                                              %38 = OpTypePointer Uniform %11 
					                                 Private f32* %49 = OpVariable Private 
					                                          f32 %53 = OpConstant 3,674022E-40 
					                                              %56 = OpTypePointer Function %6 
					                                          u32 %65 = OpConstant 2 
					                                          i32 %67 = OpConstant 2 
					                                          i32 %70 = OpConstant 1 
					                                 Private f32* %84 = OpVariable Private 
					                                 Private f32* %88 = OpVariable Private 
					                                          i32 %89 = OpConstant 4 
					                                 Private f32* %93 = OpVariable Private 
					                               Private f32_3* %97 = OpVariable Private 
					                                         u32 %102 = OpConstant 0 
					                                         i32 %144 = OpConstant 3 
					                                         f32 %161 = OpConstant 3,674022E-40 
					                                         f32 %163 = OpConstant 3,674022E-40 
					                                         i32 %182 = OpConstant 0 
					                              Private f32_3* %187 = OpVariable Private 
					                                             %188 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %189 = OpTypePointer UniformConstant %188 
					        UniformConstant read_only Texture2D* %190 = OpVariable UniformConstant 
					                                             %192 = OpTypeSampler 
					                                             %193 = OpTypePointer UniformConstant %192 
					                    UniformConstant sampler* %194 = OpVariable UniformConstant 
					                                             %196 = OpTypeSampledImage %188 
					                              Private f32_3* %202 = OpVariable Private 
					        UniformConstant read_only Texture2D* %203 = OpVariable UniformConstant 
					                    UniformConstant sampler* %205 = OpVariable UniformConstant 
					                              Private f32_3* %212 = OpVariable Private 
					                                             %242 = OpTypePointer Output %11 
					                               Output f32_4* %243 = OpVariable Output 
					                                         u32 %252 = OpConstant 3 
					                                             %253 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %57 = OpVariable Function 
					                               Function f32* %118 = OpVariable Function 
					                                 Uniform f32* %18 = OpAccessChain %14 %16 
					                                          f32 %19 = OpLoad %18 
					                                          f32 %20 = OpFNegate %19 
					                                 Private f32* %24 = OpAccessChain %9 %22 
					                                                      OpStore %24 %20 
					                                 Uniform f32* %29 = OpAccessChain %14 %28 %22 
					                                          f32 %30 = OpLoad %29 
					                                         bool %32 = OpFOrdLessThan %30 %31 
					                                                      OpStore %27 %32 
					                                        f32_2 %36 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %39 = OpAccessChain %14 %37 
					                                        f32_4 %40 = OpLoad %39 
					                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
					                                        f32_2 %42 = OpFMul %36 %41 
					                               Uniform f32_4* %43 = OpAccessChain %14 %37 
					                                        f32_4 %44 = OpLoad %43 
					                                        f32_2 %45 = OpVectorShuffle %44 %44 2 3 
					                                        f32_2 %46 = OpFAdd %42 %45 
					                                        f32_3 %47 = OpLoad %33 
					                                        f32_3 %48 = OpVectorShuffle %47 %46 3 4 2 
					                                                      OpStore %33 %48 
					                                 Private f32* %50 = OpAccessChain %33 %22 
					                                          f32 %51 = OpLoad %50 
					                                          f32 %52 = OpFNegate %51 
					                                          f32 %54 = OpFAdd %52 %53 
					                                                      OpStore %49 %54 
					                                         bool %55 = OpLoad %27 
					                                                      OpSelectionMerge %59 None 
					                                                      OpBranchConditional %55 %58 %61 
					                                              %58 = OpLabel 
					                                          f32 %60 = OpLoad %49 
					                                                      OpStore %57 %60 
					                                                      OpBranch %59 
					                                              %61 = OpLabel 
					                                 Private f32* %62 = OpAccessChain %33 %22 
					                                          f32 %63 = OpLoad %62 
					                                                      OpStore %57 %63 
					                                                      OpBranch %59 
					                                              %59 = OpLabel 
					                                          f32 %64 = OpLoad %57 
					                                 Private f32* %66 = OpAccessChain %33 %65 
					                                                      OpStore %66 %64 
					                                 Uniform f32* %68 = OpAccessChain %14 %67 
					                                          f32 %69 = OpLoad %68 
					                                 Uniform f32* %71 = OpAccessChain %14 %70 
					                                          f32 %72 = OpLoad %71 
					                                        f32_2 %73 = OpCompositeConstruct %69 %72 
					                                        f32_2 %74 = OpFNegate %73 
					                                        f32_3 %75 = OpLoad %9 
					                                        f32_3 %76 = OpVectorShuffle %75 %74 3 1 4 
					                                                      OpStore %9 %76 
					                                        f32_3 %77 = OpLoad %9 
					                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
					                                        f32_3 %79 = OpLoad %33 
					                                        f32_2 %80 = OpVectorShuffle %79 %79 0 2 
					                                        f32_2 %81 = OpFAdd %78 %80 
					                                        f32_3 %82 = OpLoad %9 
					                                        f32_3 %83 = OpVectorShuffle %82 %81 3 4 2 
					                                                      OpStore %9 %83 
					                                 Private f32* %85 = OpAccessChain %9 %65 
					                                          f32 %86 = OpLoad %85 
					                                          f32 %87 = OpFAdd %86 %53 
					                                                      OpStore %84 %87 
					                                 Uniform f32* %90 = OpAccessChain %14 %89 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %92 = OpExtInst %1 13 %91 
					                                                      OpStore %88 %92 
					                                 Uniform f32* %94 = OpAccessChain %14 %89 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpExtInst %1 14 %95 
					                                                      OpStore %93 %96 
					                                 Private f32* %98 = OpAccessChain %9 %22 
					                                          f32 %99 = OpLoad %98 
					                                         f32 %100 = OpLoad %93 
					                                         f32 %101 = OpFMul %99 %100 
					                                Private f32* %103 = OpAccessChain %97 %102 
					                                                      OpStore %103 %101 
					                                Private f32* %104 = OpAccessChain %9 %102 
					                                         f32 %105 = OpLoad %104 
					                                         f32 %106 = OpLoad %88 
					                                         f32 %107 = OpFMul %105 %106 
					                                Private f32* %108 = OpAccessChain %97 %102 
					                                         f32 %109 = OpLoad %108 
					                                         f32 %110 = OpFAdd %107 %109 
					                                Private f32* %111 = OpAccessChain %9 %102 
					                                                      OpStore %111 %110 
					                                Private f32* %112 = OpAccessChain %9 %102 
					                                         f32 %113 = OpLoad %112 
					                                         f32 %114 = OpFNegate %113 
					                                         f32 %115 = OpFAdd %114 %53 
					                                Private f32* %116 = OpAccessChain %97 %102 
					                                                      OpStore %116 %115 
					                                        bool %117 = OpLoad %27 
					                                                      OpSelectionMerge %120 None 
					                                                      OpBranchConditional %117 %119 %123 
					                                             %119 = OpLabel 
					                                Private f32* %121 = OpAccessChain %97 %102 
					                                         f32 %122 = OpLoad %121 
					                                                      OpStore %118 %122 
					                                                      OpBranch %120 
					                                             %123 = OpLabel 
					                                Private f32* %124 = OpAccessChain %9 %102 
					                                         f32 %125 = OpLoad %124 
					                                                      OpStore %118 %125 
					                                                      OpBranch %120 
					                                             %120 = OpLabel 
					                                         f32 %126 = OpLoad %118 
					                                Private f32* %127 = OpAccessChain %9 %102 
					                                                      OpStore %127 %126 
					                                Private f32* %128 = OpAccessChain %9 %102 
					                                         f32 %129 = OpLoad %128 
					                                         f32 %130 = OpExtInst %1 40 %129 %31 
					                                Private f32* %131 = OpAccessChain %9 %102 
					                                                      OpStore %131 %130 
					                                       f32_3 %132 = OpLoad %9 
					                                       f32_2 %133 = OpVectorShuffle %132 %132 0 0 
					                                       f32_2 %134 = OpFNegate %133 
					                                       f32_3 %135 = OpLoad %9 
					                                       f32_2 %136 = OpVectorShuffle %135 %135 0 0 
					                                       f32_2 %137 = OpFNegate %136 
					                                         f32 %138 = OpDot %134 %137 
					                                Private f32* %139 = OpAccessChain %9 %102 
					                                                      OpStore %139 %138 
					                                Private f32* %140 = OpAccessChain %9 %102 
					                                         f32 %141 = OpLoad %140 
					                                         f32 %142 = OpExtInst %1 31 %141 
					                                Private f32* %143 = OpAccessChain %9 %102 
					                                                      OpStore %143 %142 
					                                Uniform f32* %145 = OpAccessChain %14 %144 
					                                         f32 %146 = OpLoad %145 
					                                         f32 %147 = OpFDiv %53 %146 
					                                Private f32* %148 = OpAccessChain %97 %102 
					                                                      OpStore %148 %147 
					                                Private f32* %149 = OpAccessChain %97 %102 
					                                         f32 %150 = OpLoad %149 
					                                Private f32* %151 = OpAccessChain %9 %102 
					                                         f32 %152 = OpLoad %151 
					                                         f32 %153 = OpFMul %150 %152 
					                                Private f32* %154 = OpAccessChain %9 %102 
					                                                      OpStore %154 %153 
					                                Private f32* %155 = OpAccessChain %9 %102 
					                                         f32 %156 = OpLoad %155 
					                                         f32 %157 = OpExtInst %1 43 %156 %31 %53 
					                                Private f32* %158 = OpAccessChain %9 %102 
					                                                      OpStore %158 %157 
					                                Private f32* %159 = OpAccessChain %9 %102 
					                                         f32 %160 = OpLoad %159 
					                                         f32 %162 = OpFMul %160 %161 
					                                         f32 %164 = OpFAdd %162 %163 
					                                Private f32* %165 = OpAccessChain %97 %102 
					                                                      OpStore %165 %164 
					                                Private f32* %166 = OpAccessChain %9 %102 
					                                         f32 %167 = OpLoad %166 
					                                Private f32* %168 = OpAccessChain %9 %102 
					                                         f32 %169 = OpLoad %168 
					                                         f32 %170 = OpFMul %167 %169 
					                                Private f32* %171 = OpAccessChain %9 %102 
					                                                      OpStore %171 %170 
					                                Private f32* %172 = OpAccessChain %97 %102 
					                                         f32 %173 = OpLoad %172 
					                                         f32 %174 = OpFNegate %173 
					                                Private f32* %175 = OpAccessChain %9 %102 
					                                         f32 %176 = OpLoad %175 
					                                         f32 %177 = OpFMul %174 %176 
					                                         f32 %178 = OpFAdd %177 %53 
					                                Private f32* %179 = OpAccessChain %9 %102 
					                                                      OpStore %179 %178 
					                                Private f32* %180 = OpAccessChain %9 %102 
					                                         f32 %181 = OpLoad %180 
					                                Uniform f32* %183 = OpAccessChain %14 %182 
					                                         f32 %184 = OpLoad %183 
					                                         f32 %185 = OpFMul %181 %184 
					                                Private f32* %186 = OpAccessChain %9 %102 
					                                                      OpStore %186 %185 
					                         read_only Texture2D %191 = OpLoad %190 
					                                     sampler %195 = OpLoad %194 
					                  read_only Texture2DSampled %197 = OpSampledImage %191 %195 
					                                       f32_3 %198 = OpLoad %33 
					                                       f32_2 %199 = OpVectorShuffle %198 %198 0 1 
					                                       f32_4 %200 = OpImageSampleImplicitLod %197 %199 
					                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
					                                                      OpStore %187 %201 
					                         read_only Texture2D %204 = OpLoad %203 
					                                     sampler %206 = OpLoad %205 
					                  read_only Texture2DSampled %207 = OpSampledImage %204 %206 
					                                       f32_3 %208 = OpLoad %33 
					                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
					                                       f32_4 %210 = OpImageSampleImplicitLod %207 %209 
					                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
					                                                      OpStore %202 %211 
					                                       f32_3 %213 = OpLoad %202 
					                                       f32_3 %214 = OpFNegate %213 
					                                       f32_3 %215 = OpLoad %187 
					                                       f32_3 %216 = OpFAdd %214 %215 
					                                                      OpStore %212 %216 
					                                         f32 %217 = OpLoad %84 
					                                       f32_3 %218 = OpCompositeConstruct %217 %217 %217 
					                                       f32_3 %219 = OpLoad %212 
					                                       f32_3 %220 = OpFMul %218 %219 
					                                       f32_3 %221 = OpLoad %202 
					                                       f32_3 %222 = OpFAdd %220 %221 
					                                                      OpStore %97 %222 
					                                Uniform f32* %223 = OpAccessChain %14 %70 
					                                         f32 %224 = OpLoad %223 
					                                Uniform f32* %225 = OpAccessChain %14 %70 
					                                         f32 %226 = OpLoad %225 
					                                Uniform f32* %227 = OpAccessChain %14 %70 
					                                         f32 %228 = OpLoad %227 
					                                       f32_3 %229 = OpCompositeConstruct %224 %226 %228 
					                                         f32 %230 = OpCompositeExtract %229 0 
					                                         f32 %231 = OpCompositeExtract %229 1 
					                                         f32 %232 = OpCompositeExtract %229 2 
					                                       f32_3 %233 = OpCompositeConstruct %230 %231 %232 
					                                       f32_3 %234 = OpLoad %212 
					                                       f32_3 %235 = OpFMul %233 %234 
					                                       f32_3 %236 = OpLoad %202 
					                                       f32_3 %237 = OpFAdd %235 %236 
					                                                      OpStore %33 %237 
					                                       f32_3 %238 = OpLoad %97 
					                                       f32_3 %239 = OpLoad %33 
					                                       f32_3 %240 = OpFNegate %239 
					                                       f32_3 %241 = OpFAdd %238 %240 
					                                                      OpStore %97 %241 
					                                       f32_3 %244 = OpLoad %9 
					                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
					                                       f32_3 %246 = OpLoad %97 
					                                       f32_3 %247 = OpFMul %245 %246 
					                                       f32_3 %248 = OpLoad %33 
					                                       f32_3 %249 = OpFAdd %247 %248 
					                                       f32_4 %250 = OpLoad %243 
					                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
					                                                      OpStore %243 %251 
					                                 Output f32* %254 = OpAccessChain %243 %252 
					                                                      OpStore %254 %53 
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
						float _Value4;
						float _Value5;
						float _Value6;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					float u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec3 u_xlat4;
					float u_xlat8;
					bool u_xlatb12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.y = (-_Value6);
					    u_xlatb12 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat13 = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb12) ? u_xlat13 : u_xlat1.y;
					    u_xlat0.xz = (-vec2(_Value3, _Value2));
					    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
					    u_xlat8 = u_xlat0.z + 1.0;
					    u_xlat2 = sin(_Value5);
					    u_xlat3 = cos(_Value5);
					    u_xlat4.x = u_xlat0.y * u_xlat3;
					    u_xlat0.x = u_xlat0.x * u_xlat2 + u_xlat4.x;
					    u_xlat4.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (u_xlatb12) ? u_xlat4.x : u_xlat0.x;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = dot((-u_xlat0.xx), (-u_xlat0.xx));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat4.x = float(1.0) / _Value4;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat4.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat10_2 = texture(_MainTex2, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
					    u_xlat4.xyz = vec3(u_xlat8) * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyz;
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