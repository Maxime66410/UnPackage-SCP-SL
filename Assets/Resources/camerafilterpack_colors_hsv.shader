Shader "CameraFilterPack/Colors_HSV" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_HueShift ("HueShift", Range(0, 360)) = 0
		_Sat ("Saturation", Float) = 1
		_Val ("Value", Float) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 54416
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
					uniform 	float _HueShift;
					uniform 	float _Sat;
					uniform 	float _Val;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat0 = _HueShift * 0.0174532942;
					    u_xlat1.x = cos(u_xlat0);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat4.x = _Sat * _Val;
					    u_xlat8 = u_xlat1.x * u_xlat4.x;
					    u_xlat0 = u_xlat0 * u_xlat4.x;
					    u_xlat1 = vec4(u_xlat8) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
					    u_xlat2 = vec4(u_xlat8) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
					    u_xlat4.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
					    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
					    u_xlat4.x = u_xlat0 * 1.25 + u_xlat4.x;
					    u_xlat8 = (-u_xlat0) * 1.04999995 + u_xlat4.y;
					    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_3 = texture(_MainTex, u_xlat9.xy);
					    u_xlat8 = u_xlat8 * u_xlat10_3.y;
					    u_xlat4.x = u_xlat4.x * u_xlat10_3.x + u_xlat8;
					    u_xlat8 = (-u_xlat0) * 0.202999994 + u_xlat1.y;
					    u_xlat12 = u_xlat0 * 0.0350000001 + u_xlat1.x;
					    SV_Target0.z = u_xlat8 * u_xlat10_3.z + u_xlat4.x;
					    u_xlat4.x = _Val * 0.298999995 + u_xlat2.x;
					    u_xlat1.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
					    u_xlat4.x = u_xlat0 * 0.167999998 + u_xlat4.x;
					    u_xlat8 = u_xlat0 * 0.330000013 + u_xlat1.x;
					    u_xlat8 = u_xlat10_3.y * u_xlat8;
					    u_xlat4.x = u_xlat4.x * u_xlat10_3.x + u_xlat8;
					    u_xlat1.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat1.yz;
					    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat1.y;
					    SV_Target0.x = u_xlat1.x * u_xlat10_3.z + u_xlat4.x;
					    u_xlat4.x = u_xlat10_3.x * u_xlat1.z;
					    u_xlat4.x = u_xlat12 * u_xlat10_3.y + u_xlat4.x;
					    SV_Target0.y = u_xlat0 * u_xlat10_3.z + u_xlat4.x;
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
					; Bound: 283
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %9 %119 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpDecorate %9 Location 9 
					                                                OpMemberDecorate %17 0 Offset 17 
					                                                OpMemberDecorate %17 1 Offset 17 
					                                                OpMemberDecorate %17 2 Offset 17 
					                                                OpMemberDecorate %17 3 RelaxedPrecision 
					                                                OpMemberDecorate %17 3 Offset 17 
					                                                OpDecorate %17 Block 
					                                                OpDecorate %19 DescriptorSet 19 
					                                                OpDecorate %19 Binding 19 
					                                                OpDecorate vs_TEXCOORD0 Location 119 
					                                                OpDecorate %124 RelaxedPrecision 
					                                                OpDecorate %125 RelaxedPrecision 
					                                                OpDecorate %128 RelaxedPrecision 
					                                                OpDecorate %129 RelaxedPrecision 
					                                                OpDecorate %133 RelaxedPrecision 
					                                                OpDecorate %136 RelaxedPrecision 
					                                                OpDecorate %136 DescriptorSet 136 
					                                                OpDecorate %136 Binding 136 
					                                                OpDecorate %137 RelaxedPrecision 
					                                                OpDecorate %140 RelaxedPrecision 
					                                                OpDecorate %140 DescriptorSet 140 
					                                                OpDecorate %140 Binding 140 
					                                                OpDecorate %141 RelaxedPrecision 
					                                                OpDecorate %146 RelaxedPrecision 
					                                                OpDecorate %149 RelaxedPrecision 
					                                                OpDecorate %154 RelaxedPrecision 
					                                                OpDecorate %176 RelaxedPrecision 
					                                                OpDecorate %222 RelaxedPrecision 
					                                                OpDecorate %228 RelaxedPrecision 
					                                                OpDecorate %254 RelaxedPrecision 
					                                                OpDecorate %261 RelaxedPrecision 
					                                                OpDecorate %268 RelaxedPrecision 
					                                                OpDecorate %276 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 4 
					                                         %8 = OpTypePointer Output %7 
					                           Output f32_4* %9 = OpVariable Output 
					                                    f32 %10 = OpConstant 3,674022E-40 
					                                        %11 = OpTypeInt 32 0 
					                                    u32 %12 = OpConstant 3 
					                                        %13 = OpTypePointer Output %6 
					                                        %15 = OpTypePointer Private %6 
					                           Private f32* %16 = OpVariable Private 
					                                        %17 = OpTypeStruct %6 %6 %6 %7 
					                                        %18 = OpTypePointer Uniform %17 
					Uniform struct {f32; f32; f32; f32_4;}* %19 = OpVariable Uniform 
					                                        %20 = OpTypeInt 32 1 
					                                    i32 %21 = OpConstant 0 
					                                        %22 = OpTypePointer Uniform %6 
					                                    f32 %25 = OpConstant 3,674022E-40 
					                                        %27 = OpTypePointer Private %7 
					                         Private f32_4* %28 = OpVariable Private 
					                                    u32 %31 = OpConstant 0 
					                                        %35 = OpTypeVector %6 2 
					                                        %36 = OpTypePointer Private %35 
					                         Private f32_2* %37 = OpVariable Private 
					                                    i32 %38 = OpConstant 1 
					                                    i32 %41 = OpConstant 2 
					                           Private f32* %46 = OpVariable Private 
					                                    f32 %58 = OpConstant 3,674022E-40 
					                                    f32 %59 = OpConstant 3,674022E-40 
					                                    f32 %60 = OpConstant 3,674022E-40 
					                                    f32 %61 = OpConstant 3,674022E-40 
					                                  f32_4 %62 = OpConstantComposite %58 %59 %60 %61 
					                         Private f32_4* %64 = OpVariable Private 
					                                    f32 %67 = OpConstant 3,674022E-40 
					                                    f32 %68 = OpConstant 3,674022E-40 
					                                    f32 %69 = OpConstant 3,674022E-40 
					                                    f32 %70 = OpConstant 3,674022E-40 
					                                  f32_4 %71 = OpConstantComposite %67 %68 %69 %70 
					                                  f32_2 %81 = OpConstantComposite %70 %68 
					                                  f32_2 %95 = OpConstantComposite %68 %69 
					                                   f32 %103 = OpConstant 3,674022E-40 
					                                   f32 %111 = OpConstant 3,674022E-40 
					                                   u32 %113 = OpConstant 1 
					                        Private f32_2* %117 = OpVariable Private 
					                                       %118 = OpTypePointer Input %35 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                   i32 %121 = OpConstant 3 
					                                       %122 = OpTypePointer Uniform %7 
					                                       %131 = OpTypeVector %6 3 
					                                       %132 = OpTypePointer Private %131 
					                        Private f32_3* %133 = OpVariable Private 
					                                       %134 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                       %135 = OpTypePointer UniformConstant %134 
					  UniformConstant read_only Texture2D* %136 = OpVariable UniformConstant 
					                                       %138 = OpTypeSampler 
					                                       %139 = OpTypePointer UniformConstant %138 
					              UniformConstant sampler* %140 = OpVariable UniformConstant 
					                                       %142 = OpTypeSampledImage %134 
					                                   f32 %161 = OpConstant 3,674022E-40 
					                          Private f32* %166 = OpVariable Private 
					                                   f32 %168 = OpConstant 3,674022E-40 
					                                   u32 %174 = OpConstant 2 
					                                 f32_3 %200 = OpConstantComposite %68 %69 %70 
					                                   f32 %209 = OpConstant 3,674022E-40 
					                                   f32 %216 = OpConstant 3,674022E-40 
					                                   f32 %236 = OpConstant 3,674022E-40 
					                                   f32 %237 = OpConstant 3,674022E-40 
					                                 f32_2 %238 = OpConstantComposite %236 %237 
					                                   f32 %246 = OpConstant 3,674022E-40 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                            Output f32* %14 = OpAccessChain %9 %12 
					                                                OpStore %14 %10 
					                           Uniform f32* %23 = OpAccessChain %19 %21 
					                                    f32 %24 = OpLoad %23 
					                                    f32 %26 = OpFMul %24 %25 
					                                                OpStore %16 %26 
					                                    f32 %29 = OpLoad %16 
					                                    f32 %30 = OpExtInst %1 14 %29 
					                           Private f32* %32 = OpAccessChain %28 %31 
					                                                OpStore %32 %30 
					                                    f32 %33 = OpLoad %16 
					                                    f32 %34 = OpExtInst %1 13 %33 
					                                                OpStore %16 %34 
					                           Uniform f32* %39 = OpAccessChain %19 %38 
					                                    f32 %40 = OpLoad %39 
					                           Uniform f32* %42 = OpAccessChain %19 %41 
					                                    f32 %43 = OpLoad %42 
					                                    f32 %44 = OpFMul %40 %43 
					                           Private f32* %45 = OpAccessChain %37 %31 
					                                                OpStore %45 %44 
					                           Private f32* %47 = OpAccessChain %28 %31 
					                                    f32 %48 = OpLoad %47 
					                           Private f32* %49 = OpAccessChain %37 %31 
					                                    f32 %50 = OpLoad %49 
					                                    f32 %51 = OpFMul %48 %50 
					                                                OpStore %46 %51 
					                                    f32 %52 = OpLoad %16 
					                           Private f32* %53 = OpAccessChain %37 %31 
					                                    f32 %54 = OpLoad %53 
					                                    f32 %55 = OpFMul %52 %54 
					                                                OpStore %16 %55 
					                                    f32 %56 = OpLoad %46 
					                                  f32_4 %57 = OpCompositeConstruct %56 %56 %56 %56 
					                                  f32_4 %63 = OpFMul %57 %62 
					                                                OpStore %28 %63 
					                                    f32 %65 = OpLoad %46 
					                                  f32_4 %66 = OpCompositeConstruct %65 %65 %65 %65 
					                                  f32_4 %72 = OpFMul %66 %71 
					                                                OpStore %64 %72 
					                           Uniform f32* %73 = OpAccessChain %19 %41 
					                                    f32 %74 = OpLoad %73 
					                           Uniform f32* %75 = OpAccessChain %19 %41 
					                                    f32 %76 = OpLoad %75 
					                                  f32_2 %77 = OpCompositeConstruct %74 %76 
					                                    f32 %78 = OpCompositeExtract %77 0 
					                                    f32 %79 = OpCompositeExtract %77 1 
					                                  f32_2 %80 = OpCompositeConstruct %78 %79 
					                                  f32_2 %82 = OpFMul %80 %81 
					                                  f32_4 %83 = OpLoad %28 
					                                  f32_2 %84 = OpVectorShuffle %83 %83 1 2 
					                                  f32_2 %85 = OpFNegate %84 
					                                  f32_2 %86 = OpFAdd %82 %85 
					                                                OpStore %37 %86 
					                           Uniform f32* %87 = OpAccessChain %19 %41 
					                                    f32 %88 = OpLoad %87 
					                           Uniform f32* %89 = OpAccessChain %19 %41 
					                                    f32 %90 = OpLoad %89 
					                                  f32_2 %91 = OpCompositeConstruct %88 %90 
					                                    f32 %92 = OpCompositeExtract %91 0 
					                                    f32 %93 = OpCompositeExtract %91 1 
					                                  f32_2 %94 = OpCompositeConstruct %92 %93 
					                                  f32_2 %96 = OpFMul %94 %95 
					                                  f32_4 %97 = OpLoad %28 
					                                  f32_2 %98 = OpVectorShuffle %97 %97 0 3 
					                                  f32_2 %99 = OpFAdd %96 %98 
					                                 f32_4 %100 = OpLoad %28 
					                                 f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 3 
					                                                OpStore %28 %101 
					                                   f32 %102 = OpLoad %16 
					                                   f32 %104 = OpFMul %102 %103 
					                          Private f32* %105 = OpAccessChain %37 %31 
					                                   f32 %106 = OpLoad %105 
					                                   f32 %107 = OpFAdd %104 %106 
					                          Private f32* %108 = OpAccessChain %37 %31 
					                                                OpStore %108 %107 
					                                   f32 %109 = OpLoad %16 
					                                   f32 %110 = OpFNegate %109 
					                                   f32 %112 = OpFMul %110 %111 
					                          Private f32* %114 = OpAccessChain %37 %113 
					                                   f32 %115 = OpLoad %114 
					                                   f32 %116 = OpFAdd %112 %115 
					                                                OpStore %46 %116 
					                                 f32_2 %120 = OpLoad vs_TEXCOORD0 
					                        Uniform f32_4* %123 = OpAccessChain %19 %121 
					                                 f32_4 %124 = OpLoad %123 
					                                 f32_2 %125 = OpVectorShuffle %124 %124 0 1 
					                                 f32_2 %126 = OpFMul %120 %125 
					                        Uniform f32_4* %127 = OpAccessChain %19 %121 
					                                 f32_4 %128 = OpLoad %127 
					                                 f32_2 %129 = OpVectorShuffle %128 %128 2 3 
					                                 f32_2 %130 = OpFAdd %126 %129 
					                                                OpStore %117 %130 
					                   read_only Texture2D %137 = OpLoad %136 
					                               sampler %141 = OpLoad %140 
					            read_only Texture2DSampled %143 = OpSampledImage %137 %141 
					                                 f32_2 %144 = OpLoad %117 
					                                 f32_4 %145 = OpImageSampleImplicitLod %143 %144 
					                                 f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
					                                                OpStore %133 %146 
					                                   f32 %147 = OpLoad %46 
					                          Private f32* %148 = OpAccessChain %133 %113 
					                                   f32 %149 = OpLoad %148 
					                                   f32 %150 = OpFMul %147 %149 
					                                                OpStore %46 %150 
					                          Private f32* %151 = OpAccessChain %37 %31 
					                                   f32 %152 = OpLoad %151 
					                          Private f32* %153 = OpAccessChain %133 %31 
					                                   f32 %154 = OpLoad %153 
					                                   f32 %155 = OpFMul %152 %154 
					                                   f32 %156 = OpLoad %46 
					                                   f32 %157 = OpFAdd %155 %156 
					                          Private f32* %158 = OpAccessChain %37 %31 
					                                                OpStore %158 %157 
					                                   f32 %159 = OpLoad %16 
					                                   f32 %160 = OpFNegate %159 
					                                   f32 %162 = OpFMul %160 %161 
					                          Private f32* %163 = OpAccessChain %28 %113 
					                                   f32 %164 = OpLoad %163 
					                                   f32 %165 = OpFAdd %162 %164 
					                                                OpStore %46 %165 
					                                   f32 %167 = OpLoad %16 
					                                   f32 %169 = OpFMul %167 %168 
					                          Private f32* %170 = OpAccessChain %28 %31 
					                                   f32 %171 = OpLoad %170 
					                                   f32 %172 = OpFAdd %169 %171 
					                                                OpStore %166 %172 
					                                   f32 %173 = OpLoad %46 
					                          Private f32* %175 = OpAccessChain %133 %174 
					                                   f32 %176 = OpLoad %175 
					                                   f32 %177 = OpFMul %173 %176 
					                          Private f32* %178 = OpAccessChain %37 %31 
					                                   f32 %179 = OpLoad %178 
					                                   f32 %180 = OpFAdd %177 %179 
					                           Output f32* %181 = OpAccessChain %9 %174 
					                                                OpStore %181 %180 
					                          Uniform f32* %182 = OpAccessChain %19 %41 
					                                   f32 %183 = OpLoad %182 
					                                   f32 %184 = OpFMul %183 %70 
					                          Private f32* %185 = OpAccessChain %64 %31 
					                                   f32 %186 = OpLoad %185 
					                                   f32 %187 = OpFAdd %184 %186 
					                          Private f32* %188 = OpAccessChain %37 %31 
					                                                OpStore %188 %187 
					                          Uniform f32* %189 = OpAccessChain %19 %41 
					                                   f32 %190 = OpLoad %189 
					                          Uniform f32* %191 = OpAccessChain %19 %41 
					                                   f32 %192 = OpLoad %191 
					                          Uniform f32* %193 = OpAccessChain %19 %41 
					                                   f32 %194 = OpLoad %193 
					                                 f32_3 %195 = OpCompositeConstruct %190 %192 %194 
					                                   f32 %196 = OpCompositeExtract %195 0 
					                                   f32 %197 = OpCompositeExtract %195 1 
					                                   f32 %198 = OpCompositeExtract %195 2 
					                                 f32_3 %199 = OpCompositeConstruct %196 %197 %198 
					                                 f32_3 %201 = OpFMul %199 %200 
					                                 f32_4 %202 = OpLoad %64 
					                                 f32_3 %203 = OpVectorShuffle %202 %202 1 2 3 
					                                 f32_3 %204 = OpFNegate %203 
					                                 f32_3 %205 = OpFAdd %201 %204 
					                                 f32_4 %206 = OpLoad %28 
					                                 f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
					                                                OpStore %28 %207 
					                                   f32 %208 = OpLoad %16 
					                                   f32 %210 = OpFMul %208 %209 
					                          Private f32* %211 = OpAccessChain %37 %31 
					                                   f32 %212 = OpLoad %211 
					                                   f32 %213 = OpFAdd %210 %212 
					                          Private f32* %214 = OpAccessChain %37 %31 
					                                                OpStore %214 %213 
					                                   f32 %215 = OpLoad %16 
					                                   f32 %217 = OpFMul %215 %216 
					                          Private f32* %218 = OpAccessChain %28 %31 
					                                   f32 %219 = OpLoad %218 
					                                   f32 %220 = OpFAdd %217 %219 
					                                                OpStore %46 %220 
					                          Private f32* %221 = OpAccessChain %133 %113 
					                                   f32 %222 = OpLoad %221 
					                                   f32 %223 = OpLoad %46 
					                                   f32 %224 = OpFMul %222 %223 
					                                                OpStore %46 %224 
					                          Private f32* %225 = OpAccessChain %37 %31 
					                                   f32 %226 = OpLoad %225 
					                          Private f32* %227 = OpAccessChain %133 %31 
					                                   f32 %228 = OpLoad %227 
					                                   f32 %229 = OpFMul %226 %228 
					                                   f32 %230 = OpLoad %46 
					                                   f32 %231 = OpFAdd %229 %230 
					                          Private f32* %232 = OpAccessChain %37 %31 
					                                                OpStore %232 %231 
					                                   f32 %233 = OpLoad %16 
					                                 f32_2 %234 = OpCompositeConstruct %233 %233 
					                                 f32_2 %235 = OpFNegate %234 
					                                 f32_2 %239 = OpFMul %235 %238 
					                                 f32_4 %240 = OpLoad %28 
					                                 f32_2 %241 = OpVectorShuffle %240 %240 1 2 
					                                 f32_2 %242 = OpFAdd %239 %241 
					                                 f32_4 %243 = OpLoad %28 
					                                 f32_4 %244 = OpVectorShuffle %243 %242 4 1 5 3 
					                                                OpStore %28 %244 
					                                   f32 %245 = OpLoad %16 
					                                   f32 %247 = OpFMul %245 %246 
					                          Private f32* %248 = OpAccessChain %28 %113 
					                                   f32 %249 = OpLoad %248 
					                                   f32 %250 = OpFAdd %247 %249 
					                                                OpStore %16 %250 
					                          Private f32* %251 = OpAccessChain %28 %31 
					                                   f32 %252 = OpLoad %251 
					                          Private f32* %253 = OpAccessChain %133 %174 
					                                   f32 %254 = OpLoad %253 
					                                   f32 %255 = OpFMul %252 %254 
					                          Private f32* %256 = OpAccessChain %37 %31 
					                                   f32 %257 = OpLoad %256 
					                                   f32 %258 = OpFAdd %255 %257 
					                           Output f32* %259 = OpAccessChain %9 %31 
					                                                OpStore %259 %258 
					                          Private f32* %260 = OpAccessChain %133 %31 
					                                   f32 %261 = OpLoad %260 
					                          Private f32* %262 = OpAccessChain %28 %174 
					                                   f32 %263 = OpLoad %262 
					                                   f32 %264 = OpFMul %261 %263 
					                          Private f32* %265 = OpAccessChain %37 %31 
					                                                OpStore %265 %264 
					                                   f32 %266 = OpLoad %166 
					                          Private f32* %267 = OpAccessChain %133 %113 
					                                   f32 %268 = OpLoad %267 
					                                   f32 %269 = OpFMul %266 %268 
					                          Private f32* %270 = OpAccessChain %37 %31 
					                                   f32 %271 = OpLoad %270 
					                                   f32 %272 = OpFAdd %269 %271 
					                          Private f32* %273 = OpAccessChain %37 %31 
					                                                OpStore %273 %272 
					                                   f32 %274 = OpLoad %16 
					                          Private f32* %275 = OpAccessChain %133 %174 
					                                   f32 %276 = OpLoad %275 
					                                   f32 %277 = OpFMul %274 %276 
					                          Private f32* %278 = OpAccessChain %37 %31 
					                                   f32 %279 = OpLoad %278 
					                                   f32 %280 = OpFAdd %277 %279 
					                           Output f32* %281 = OpAccessChain %9 %113 
					                                                OpStore %281 %280 
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
						float _HueShift;
						float _Sat;
						float _Val;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    SV_Target0.w = 1.0;
					    u_xlat0 = _HueShift * 0.0174532942;
					    u_xlat1.x = cos(u_xlat0);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat4.x = _Sat * _Val;
					    u_xlat8 = u_xlat1.x * u_xlat4.x;
					    u_xlat0 = u_xlat0 * u_xlat4.x;
					    u_xlat1 = vec4(u_xlat8) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
					    u_xlat2 = vec4(u_xlat8) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
					    u_xlat4.xy = vec2(vec2(_Val, _Val)) * vec2(0.298999995, 0.587000012) + (-u_xlat1.yz);
					    u_xlat1.xy = vec2(vec2(_Val, _Val)) * vec2(0.587000012, 0.114) + u_xlat1.xw;
					    u_xlat4.x = u_xlat0 * 1.25 + u_xlat4.x;
					    u_xlat8 = (-u_xlat0) * 1.04999995 + u_xlat4.y;
					    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_3 = texture(_MainTex, u_xlat9.xy);
					    u_xlat8 = u_xlat8 * u_xlat10_3.y;
					    u_xlat4.x = u_xlat4.x * u_xlat10_3.x + u_xlat8;
					    u_xlat8 = (-u_xlat0) * 0.202999994 + u_xlat1.y;
					    u_xlat12 = u_xlat0 * 0.0350000001 + u_xlat1.x;
					    SV_Target0.z = u_xlat8 * u_xlat10_3.z + u_xlat4.x;
					    u_xlat4.x = _Val * 0.298999995 + u_xlat2.x;
					    u_xlat1.xyz = vec3(vec3(_Val, _Val, _Val)) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat2.yzw);
					    u_xlat4.x = u_xlat0 * 0.167999998 + u_xlat4.x;
					    u_xlat8 = u_xlat0 * 0.330000013 + u_xlat1.x;
					    u_xlat8 = u_xlat10_3.y * u_xlat8;
					    u_xlat4.x = u_xlat4.x * u_xlat10_3.x + u_xlat8;
					    u_xlat1.xz = (-vec2(u_xlat0)) * vec2(0.497000009, 0.328000009) + u_xlat1.yz;
					    u_xlat0 = u_xlat0 * 0.291999996 + u_xlat1.y;
					    SV_Target0.x = u_xlat1.x * u_xlat10_3.z + u_xlat4.x;
					    u_xlat4.x = u_xlat10_3.x * u_xlat1.z;
					    u_xlat4.x = u_xlat12 * u_xlat10_3.y + u_xlat4.x;
					    SV_Target0.y = u_xlat0 * u_xlat10_3.z + u_xlat4.x;
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