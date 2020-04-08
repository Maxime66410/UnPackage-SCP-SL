Shader "CameraFilterPack/Edge_Sobel" {
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
			GpuProgramID 64316
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
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec2 u_xlat12;
					float u_xlat16_13;
					float u_xlat16_18;
					void main()
					{
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.z = (-u_xlat0.x);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = u_xlat0.zyxy + u_xlat1.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat0.z = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_13 = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlat16_13 = sqrt(u_xlat16_13);
					    u_xlat0.w = 0.0;
					    u_xlat2 = u_xlat0.wyxw + u_xlat1.xyxy;
					    u_xlat3 = u_xlat0.wyxy * vec4(1.0, -1.0, 1.0, -1.0) + u_xlat1.xyxy;
					    u_xlat4.xyz = (-u_xlat0.xyx);
					    u_xlat10_5 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat0.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat0.y = dot(u_xlat10_5.xyz, u_xlat10_5.xyz);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat6.x = (-u_xlat0.y) * 2.0 + (-u_xlat16_13);
					    u_xlat6.x = (-u_xlat0.z) + u_xlat6.x;
					    u_xlat4.w = 0.0;
					    u_xlat2 = u_xlat1.xyxy + u_xlat4.zwxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat2.zw);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_18 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_18 = sqrt(u_xlat16_18);
					    u_xlat6.z = u_xlat16_18 * 2.0 + u_xlat16_13;
					    u_xlat16_1 = dot(u_xlat10_4.xyz, u_xlat10_4.xyz);
					    u_xlat16_1 = sqrt(u_xlat16_1);
					    u_xlat6.xz = u_xlat6.xz + vec2(u_xlat16_1);
					    u_xlat12.x = (-u_xlat0.z) + u_xlat6.z;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + u_xlat12.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.zw);
					    u_xlat12.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat12.y = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat12.xy = sqrt(u_xlat12.xy);
					    u_xlat6.x = u_xlat12.y * 2.0 + u_xlat6.x;
					    u_xlat6.x = u_xlat12.x + u_xlat6.x;
					    u_xlat0.x = (-u_xlat12.x) + u_xlat0.x;
					    u_xlat6.x = u_xlat6.x * u_xlat6.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat6.x;
					    SV_Target0.xyz = sqrt(u_xlat0.xxx);
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
					; Bound: 284
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %36 %275 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %13 0 Offset 13 
					                                             OpMemberDecorate %13 1 RelaxedPrecision 
					                                             OpMemberDecorate %13 1 Offset 13 
					                                             OpDecorate %13 Block 
					                                             OpDecorate %15 DescriptorSet 15 
					                                             OpDecorate %15 Binding 15 
					                                             OpDecorate vs_TEXCOORD0 Location 36 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %58 DescriptorSet 58 
					                                             OpDecorate %58 Binding 58 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %62 DescriptorSet 62 
					                                             OpDecorate %62 Binding 62 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %123 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %130 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %136 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %153 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                             OpDecorate %165 RelaxedPrecision 
					                                             OpDecorate %166 RelaxedPrecision 
					                                             OpDecorate %167 RelaxedPrecision 
					                                             OpDecorate %172 RelaxedPrecision 
					                                             OpDecorate %173 RelaxedPrecision 
					                                             OpDecorate %174 RelaxedPrecision 
					                                             OpDecorate %179 RelaxedPrecision 
					                                             OpDecorate %180 RelaxedPrecision 
					                                             OpDecorate %181 RelaxedPrecision 
					                                             OpDecorate %182 RelaxedPrecision 
					                                             OpDecorate %183 RelaxedPrecision 
					                                             OpDecorate %184 RelaxedPrecision 
					                                             OpDecorate %185 RelaxedPrecision 
					                                             OpDecorate %186 RelaxedPrecision 
					                                             OpDecorate %187 RelaxedPrecision 
					                                             OpDecorate %192 RelaxedPrecision 
					                                             OpDecorate %193 RelaxedPrecision 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %195 RelaxedPrecision 
					                                             OpDecorate %196 RelaxedPrecision 
					                                             OpDecorate %197 RelaxedPrecision 
					                                             OpDecorate %198 RelaxedPrecision 
					                                             OpDecorate %206 RelaxedPrecision 
					                                             OpDecorate %207 RelaxedPrecision 
					                                             OpDecorate %217 RelaxedPrecision 
					                                             OpDecorate %218 RelaxedPrecision 
					                                             OpDecorate %219 RelaxedPrecision 
					                                             OpDecorate %224 RelaxedPrecision 
					                                             OpDecorate %225 RelaxedPrecision 
					                                             OpDecorate %226 RelaxedPrecision 
					                                             OpDecorate %231 RelaxedPrecision 
					                                             OpDecorate %233 RelaxedPrecision 
					                                             OpDecorate %234 RelaxedPrecision 
					                                             OpDecorate %235 RelaxedPrecision 
					                                             OpDecorate %237 RelaxedPrecision 
					                                             OpDecorate %238 RelaxedPrecision 
					                                             OpDecorate %239 RelaxedPrecision 
					                                             OpDecorate %275 Location 275 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                 f32 %11 = OpConstant 3,674022E-40 
					                               f32_2 %12 = OpConstantComposite %11 %11 
					                                     %13 = OpTypeStruct %7 %7 
					                                     %14 = OpTypePointer Uniform %13 
					     Uniform struct {f32_4; f32_4;}* %15 = OpVariable Uniform 
					                                     %16 = OpTypeInt 32 1 
					                                 i32 %17 = OpConstant 0 
					                                     %18 = OpTypePointer Uniform %7 
					                                     %25 = OpTypeInt 32 0 
					                                 u32 %26 = OpConstant 0 
					                                     %27 = OpTypePointer Private %6 
					                                 u32 %31 = OpConstant 2 
					                                     %33 = OpTypePointer Private %10 
					                      Private f32_2* %34 = OpVariable Private 
					                                     %35 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %38 = OpConstant 1 
					                      Private f32_4* %47 = OpVariable Private 
					                                     %53 = OpTypeVector %6 3 
					                                     %54 = OpTypePointer Private %53 
					                      Private f32_3* %55 = OpVariable Private 
					                                     %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %57 = OpTypePointer UniformConstant %56 
					UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
					                                     %60 = OpTypeSampler 
					                                     %61 = OpTypePointer UniformConstant %60 
					            UniformConstant sampler* %62 = OpVariable UniformConstant 
					                                     %64 = OpTypeSampledImage %56 
					                      Private f32_3* %70 = OpVariable Private 
					                        Private f32* %78 = OpVariable Private 
					                      Private f32_2* %84 = OpVariable Private 
					                                 f32 %89 = OpConstant 3,674022E-40 
					                                 u32 %90 = OpConstant 3 
					                      Private f32_4* %97 = OpVariable Private 
					                                f32 %100 = OpConstant 3,674022E-40 
					                              f32_4 %101 = OpConstantComposite %11 %100 %11 %100 
					                     Private f32_4* %106 = OpVariable Private 
					                     Private f32_4* %112 = OpVariable Private 
					                                u32 %132 = OpConstant 1 
					                       Private f32* %136 = OpVariable Private 
					                                f32 %146 = OpConstant 3,674022E-40 
					                     Private f32_3* %165 = OpVariable Private 
					                       Private f32* %180 = OpVariable Private 
					                       Private f32* %192 = OpVariable Private 
					                       Private f32* %205 = OpVariable Private 
					                     Private f32_3* %217 = OpVariable Private 
					                     Private f32_2* %232 = OpVariable Private 
					                                    %274 = OpTypePointer Output %7 
					                      Output f32_4* %275 = OpVariable Output 
					                                    %281 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Uniform f32_4* %19 = OpAccessChain %15 %17 
					                               f32_4 %20 = OpLoad %19 
					                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
					                               f32_2 %22 = OpFDiv %12 %21 
					                               f32_4 %23 = OpLoad %9 
					                               f32_4 %24 = OpVectorShuffle %23 %22 4 5 2 3 
					                                             OpStore %9 %24 
					                        Private f32* %28 = OpAccessChain %9 %26 
					                                 f32 %29 = OpLoad %28 
					                                 f32 %30 = OpFNegate %29 
					                        Private f32* %32 = OpAccessChain %9 %31 
					                                             OpStore %32 %30 
					                               f32_2 %37 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %39 = OpAccessChain %15 %38 
					                               f32_4 %40 = OpLoad %39 
					                               f32_2 %41 = OpVectorShuffle %40 %40 0 1 
					                               f32_2 %42 = OpFMul %37 %41 
					                      Uniform f32_4* %43 = OpAccessChain %15 %38 
					                               f32_4 %44 = OpLoad %43 
					                               f32_2 %45 = OpVectorShuffle %44 %44 2 3 
					                               f32_2 %46 = OpFAdd %42 %45 
					                                             OpStore %34 %46 
					                               f32_4 %48 = OpLoad %9 
					                               f32_4 %49 = OpVectorShuffle %48 %48 2 1 0 1 
					                               f32_2 %50 = OpLoad %34 
					                               f32_4 %51 = OpVectorShuffle %50 %50 0 1 0 1 
					                               f32_4 %52 = OpFAdd %49 %51 
					                                             OpStore %47 %52 
					                 read_only Texture2D %59 = OpLoad %58 
					                             sampler %63 = OpLoad %62 
					          read_only Texture2DSampled %65 = OpSampledImage %59 %63 
					                               f32_4 %66 = OpLoad %47 
					                               f32_2 %67 = OpVectorShuffle %66 %66 0 1 
					                               f32_4 %68 = OpImageSampleImplicitLod %65 %67 
					                               f32_3 %69 = OpVectorShuffle %68 %68 0 1 2 
					                                             OpStore %55 %69 
					                 read_only Texture2D %71 = OpLoad %58 
					                             sampler %72 = OpLoad %62 
					          read_only Texture2DSampled %73 = OpSampledImage %71 %72 
					                               f32_4 %74 = OpLoad %47 
					                               f32_2 %75 = OpVectorShuffle %74 %74 2 3 
					                               f32_4 %76 = OpImageSampleImplicitLod %73 %75 
					                               f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
					                                             OpStore %70 %77 
					                               f32_3 %79 = OpLoad %70 
					                               f32_3 %80 = OpLoad %70 
					                                 f32 %81 = OpDot %79 %80 
					                                             OpStore %78 %81 
					                                 f32 %82 = OpLoad %78 
					                                 f32 %83 = OpExtInst %1 31 %82 
					                                             OpStore %78 %83 
					                               f32_3 %85 = OpLoad %55 
					                               f32_3 %86 = OpLoad %55 
					                                 f32 %87 = OpDot %85 %86 
					                        Private f32* %88 = OpAccessChain %84 %26 
					                                             OpStore %88 %87 
					                        Private f32* %91 = OpAccessChain %9 %90 
					                                             OpStore %91 %89 
					                               f32_4 %92 = OpLoad %9 
					                               f32_4 %93 = OpVectorShuffle %92 %92 3 1 0 3 
					                               f32_2 %94 = OpLoad %34 
					                               f32_4 %95 = OpVectorShuffle %94 %94 0 1 0 1 
					                               f32_4 %96 = OpFAdd %93 %95 
					                                             OpStore %47 %96 
					                               f32_4 %98 = OpLoad %9 
					                               f32_4 %99 = OpVectorShuffle %98 %98 3 1 0 1 
					                              f32_4 %102 = OpFMul %99 %101 
					                              f32_2 %103 = OpLoad %34 
					                              f32_4 %104 = OpVectorShuffle %103 %103 0 1 0 1 
					                              f32_4 %105 = OpFAdd %102 %104 
					                                             OpStore %97 %105 
					                              f32_4 %107 = OpLoad %9 
					                              f32_3 %108 = OpVectorShuffle %107 %107 0 1 0 
					                              f32_3 %109 = OpFNegate %108 
					                              f32_4 %110 = OpLoad %106 
					                              f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
					                                             OpStore %106 %111 
					                read_only Texture2D %113 = OpLoad %58 
					                            sampler %114 = OpLoad %62 
					         read_only Texture2DSampled %115 = OpSampledImage %113 %114 
					                              f32_4 %116 = OpLoad %47 
					                              f32_2 %117 = OpVectorShuffle %116 %116 0 1 
					                              f32_4 %118 = OpImageSampleImplicitLod %115 %117 
					                              f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
					                              f32_4 %120 = OpLoad %112 
					                              f32_4 %121 = OpVectorShuffle %120 %119 4 5 2 6 
					                                             OpStore %112 %121 
					                read_only Texture2D %122 = OpLoad %58 
					                            sampler %123 = OpLoad %62 
					         read_only Texture2DSampled %124 = OpSampledImage %122 %123 
					                              f32_4 %125 = OpLoad %47 
					                              f32_2 %126 = OpVectorShuffle %125 %125 2 3 
					                              f32_4 %127 = OpImageSampleImplicitLod %124 %126 
					                              f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
					                                             OpStore %70 %128 
					                              f32_3 %129 = OpLoad %70 
					                              f32_3 %130 = OpLoad %70 
					                                f32 %131 = OpDot %129 %130 
					                       Private f32* %133 = OpAccessChain %84 %132 
					                                             OpStore %133 %131 
					                              f32_2 %134 = OpLoad %84 
					                              f32_2 %135 = OpExtInst %1 31 %134 
					                                             OpStore %84 %135 
					                              f32_4 %137 = OpLoad %112 
					                              f32_3 %138 = OpVectorShuffle %137 %137 0 1 3 
					                              f32_4 %139 = OpLoad %112 
					                              f32_3 %140 = OpVectorShuffle %139 %139 0 1 3 
					                                f32 %141 = OpDot %138 %140 
					                                             OpStore %136 %141 
					                                f32 %142 = OpLoad %136 
					                                f32 %143 = OpExtInst %1 31 %142 
					                                             OpStore %136 %143 
					                                f32 %144 = OpLoad %136 
					                                f32 %145 = OpFNegate %144 
					                                f32 %147 = OpFMul %145 %146 
					                       Private f32* %148 = OpAccessChain %84 %26 
					                                f32 %149 = OpLoad %148 
					                                f32 %150 = OpFNegate %149 
					                                f32 %151 = OpFAdd %147 %150 
					                       Private f32* %152 = OpAccessChain %9 %26 
					                                             OpStore %152 %151 
					                                f32 %153 = OpLoad %78 
					                                f32 %154 = OpFNegate %153 
					                       Private f32* %155 = OpAccessChain %9 %26 
					                                f32 %156 = OpLoad %155 
					                                f32 %157 = OpFAdd %154 %156 
					                       Private f32* %158 = OpAccessChain %9 %26 
					                                             OpStore %158 %157 
					                       Private f32* %159 = OpAccessChain %106 %90 
					                                             OpStore %159 %89 
					                              f32_2 %160 = OpLoad %34 
					                              f32_4 %161 = OpVectorShuffle %160 %160 0 1 0 1 
					                              f32_4 %162 = OpLoad %106 
					                              f32_4 %163 = OpVectorShuffle %162 %162 2 3 0 1 
					                              f32_4 %164 = OpFAdd %161 %163 
					                                             OpStore %47 %164 
					                read_only Texture2D %166 = OpLoad %58 
					                            sampler %167 = OpLoad %62 
					         read_only Texture2DSampled %168 = OpSampledImage %166 %167 
					                              f32_4 %169 = OpLoad %47 
					                              f32_2 %170 = OpVectorShuffle %169 %169 2 3 
					                              f32_4 %171 = OpImageSampleImplicitLod %168 %170 
					                              f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
					                                             OpStore %165 %172 
					                read_only Texture2D %173 = OpLoad %58 
					                            sampler %174 = OpLoad %62 
					         read_only Texture2DSampled %175 = OpSampledImage %173 %174 
					                              f32_4 %176 = OpLoad %47 
					                              f32_2 %177 = OpVectorShuffle %176 %176 0 1 
					                              f32_4 %178 = OpImageSampleImplicitLod %175 %177 
					                              f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                             OpStore %70 %179 
					                              f32_3 %181 = OpLoad %70 
					                              f32_3 %182 = OpLoad %70 
					                                f32 %183 = OpDot %181 %182 
					                                             OpStore %180 %183 
					                                f32 %184 = OpLoad %180 
					                                f32 %185 = OpExtInst %1 31 %184 
					                                             OpStore %180 %185 
					                                f32 %186 = OpLoad %180 
					                                f32 %187 = OpFMul %186 %146 
					                       Private f32* %188 = OpAccessChain %84 %26 
					                                f32 %189 = OpLoad %188 
					                                f32 %190 = OpFAdd %187 %189 
					                       Private f32* %191 = OpAccessChain %9 %132 
					                                             OpStore %191 %190 
					                              f32_3 %193 = OpLoad %165 
					                              f32_3 %194 = OpLoad %165 
					                                f32 %195 = OpDot %193 %194 
					                                             OpStore %192 %195 
					                                f32 %196 = OpLoad %192 
					                                f32 %197 = OpExtInst %1 31 %196 
					                                             OpStore %192 %197 
					                                f32 %198 = OpLoad %192 
					                              f32_2 %199 = OpCompositeConstruct %198 %198 
					                              f32_4 %200 = OpLoad %9 
					                              f32_2 %201 = OpVectorShuffle %200 %200 0 1 
					                              f32_2 %202 = OpFAdd %199 %201 
					                              f32_4 %203 = OpLoad %9 
					                              f32_4 %204 = OpVectorShuffle %203 %202 4 5 2 3 
					                                             OpStore %9 %204 
					                                f32 %206 = OpLoad %78 
					                                f32 %207 = OpFNegate %206 
					                       Private f32* %208 = OpAccessChain %9 %132 
					                                f32 %209 = OpLoad %208 
					                                f32 %210 = OpFAdd %207 %209 
					                                             OpStore %205 %210 
					                       Private f32* %211 = OpAccessChain %84 %132 
					                                f32 %212 = OpLoad %211 
					                                f32 %213 = OpFNegate %212 
					                                f32 %214 = OpFMul %213 %146 
					                                f32 %215 = OpLoad %205 
					                                f32 %216 = OpFAdd %214 %215 
					                                             OpStore %205 %216 
					                read_only Texture2D %218 = OpLoad %58 
					                            sampler %219 = OpLoad %62 
					         read_only Texture2DSampled %220 = OpSampledImage %218 %219 
					                              f32_4 %221 = OpLoad %97 
					                              f32_2 %222 = OpVectorShuffle %221 %221 0 1 
					                              f32_4 %223 = OpImageSampleImplicitLod %220 %222 
					                              f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
					                                             OpStore %217 %224 
					                read_only Texture2D %225 = OpLoad %58 
					                            sampler %226 = OpLoad %62 
					         read_only Texture2DSampled %227 = OpSampledImage %225 %226 
					                              f32_4 %228 = OpLoad %97 
					                              f32_2 %229 = OpVectorShuffle %228 %228 2 3 
					                              f32_4 %230 = OpImageSampleImplicitLod %227 %229 
					                              f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
					                                             OpStore %70 %231 
					                              f32_3 %233 = OpLoad %70 
					                              f32_3 %234 = OpLoad %70 
					                                f32 %235 = OpDot %233 %234 
					                       Private f32* %236 = OpAccessChain %232 %26 
					                                             OpStore %236 %235 
					                              f32_3 %237 = OpLoad %217 
					                              f32_3 %238 = OpLoad %217 
					                                f32 %239 = OpDot %237 %238 
					                       Private f32* %240 = OpAccessChain %232 %132 
					                                             OpStore %240 %239 
					                              f32_2 %241 = OpLoad %232 
					                              f32_2 %242 = OpExtInst %1 31 %241 
					                                             OpStore %232 %242 
					                       Private f32* %243 = OpAccessChain %232 %132 
					                                f32 %244 = OpLoad %243 
					                                f32 %245 = OpFMul %244 %146 
					                       Private f32* %246 = OpAccessChain %9 %26 
					                                f32 %247 = OpLoad %246 
					                                f32 %248 = OpFAdd %245 %247 
					                       Private f32* %249 = OpAccessChain %9 %26 
					                                             OpStore %249 %248 
					                       Private f32* %250 = OpAccessChain %232 %26 
					                                f32 %251 = OpLoad %250 
					                       Private f32* %252 = OpAccessChain %9 %26 
					                                f32 %253 = OpLoad %252 
					                                f32 %254 = OpFAdd %251 %253 
					                       Private f32* %255 = OpAccessChain %9 %26 
					                                             OpStore %255 %254 
					                       Private f32* %256 = OpAccessChain %232 %26 
					                                f32 %257 = OpLoad %256 
					                                f32 %258 = OpFNegate %257 
					                                f32 %259 = OpLoad %205 
					                                f32 %260 = OpFAdd %258 %259 
					                                             OpStore %205 %260 
					                       Private f32* %261 = OpAccessChain %9 %26 
					                                f32 %262 = OpLoad %261 
					                       Private f32* %263 = OpAccessChain %9 %26 
					                                f32 %264 = OpLoad %263 
					                                f32 %265 = OpFMul %262 %264 
					                       Private f32* %266 = OpAccessChain %9 %26 
					                                             OpStore %266 %265 
					                                f32 %267 = OpLoad %205 
					                                f32 %268 = OpLoad %205 
					                                f32 %269 = OpFMul %267 %268 
					                       Private f32* %270 = OpAccessChain %9 %26 
					                                f32 %271 = OpLoad %270 
					                                f32 %272 = OpFAdd %269 %271 
					                       Private f32* %273 = OpAccessChain %9 %26 
					                                             OpStore %273 %272 
					                              f32_4 %276 = OpLoad %9 
					                              f32_3 %277 = OpVectorShuffle %276 %276 0 0 0 
					                              f32_3 %278 = OpExtInst %1 31 %277 
					                              f32_4 %279 = OpLoad %275 
					                              f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
					                                             OpStore %275 %280 
					                        Output f32* %282 = OpAccessChain %275 %90 
					                                             OpStore %282 %11 
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
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					vec2 u_xlat12;
					float u_xlat16_13;
					float u_xlat16_18;
					void main()
					{
					    u_xlat0.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.z = (-u_xlat0.x);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = u_xlat0.zyxy + u_xlat1.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat0.z = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_13 = dot(u_xlat10_3.xyz, u_xlat10_3.xyz);
					    u_xlat16_13 = sqrt(u_xlat16_13);
					    u_xlat0.w = 0.0;
					    u_xlat2 = u_xlat0.wyxw + u_xlat1.xyxy;
					    u_xlat3 = u_xlat0.wyxy * vec4(1.0, -1.0, 1.0, -1.0) + u_xlat1.xyxy;
					    u_xlat4.xyz = (-u_xlat0.xyx);
					    u_xlat10_5 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat0.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat0.y = dot(u_xlat10_5.xyz, u_xlat10_5.xyz);
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    u_xlat6.x = (-u_xlat0.y) * 2.0 + (-u_xlat16_13);
					    u_xlat6.x = (-u_xlat0.z) + u_xlat6.x;
					    u_xlat4.w = 0.0;
					    u_xlat2 = u_xlat1.xyxy + u_xlat4.zwxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat2.zw);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_18 = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat16_18 = sqrt(u_xlat16_18);
					    u_xlat6.z = u_xlat16_18 * 2.0 + u_xlat16_13;
					    u_xlat16_1 = dot(u_xlat10_4.xyz, u_xlat10_4.xyz);
					    u_xlat16_1 = sqrt(u_xlat16_1);
					    u_xlat6.xz = u_xlat6.xz + vec2(u_xlat16_1);
					    u_xlat12.x = (-u_xlat0.z) + u_xlat6.z;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + u_xlat12.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.zw);
					    u_xlat12.x = dot(u_xlat10_2.xyz, u_xlat10_2.xyz);
					    u_xlat12.y = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat12.xy = sqrt(u_xlat12.xy);
					    u_xlat6.x = u_xlat12.y * 2.0 + u_xlat6.x;
					    u_xlat6.x = u_xlat12.x + u_xlat6.x;
					    u_xlat0.x = (-u_xlat12.x) + u_xlat0.x;
					    u_xlat6.x = u_xlat6.x * u_xlat6.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat6.x;
					    SV_Target0.xyz = sqrt(u_xlat0.xxx);
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