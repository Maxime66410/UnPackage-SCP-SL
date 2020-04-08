Shader "CameraFilterPack/TV_Distorted" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
		_RGB ("_RGB", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 47695
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
					uniform 	float _Distortion;
					uniform 	float _RGB;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _TimeX;
					    u_xlat1.zw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.xyz = u_xlat1.www * vec3(80.0, 25.0, 800.0);
					    u_xlat0.y = u_xlat2.y;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat4.xy = u_xlat2.xy * vec2(_TimeX);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.0285714287, 0.0285714287);
					    u_xlat4.xy = sin(u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat4.y;
					    u_xlat0.x = u_xlat0.x * _Distortion;
					    u_xlat2.w = _TimeX * 15.0;
					    u_xlat8 = dot(u_xlat2.wx, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat2.z);
					    u_xlat0.z = sin(u_xlat8);
					    u_xlat0.xz = u_xlat0.xz * vec2(0.00400000019, 43758.5469);
					    u_xlat8 = fract(u_xlat0.z);
					    u_xlat4.x = u_xlat8 * u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * _Distortion;
					    u_xlat0.x = u_xlat4.x * 0.00300000003 + u_xlat0.x;
					    u_xlat1.x = u_xlat0.x + u_xlat1.z;
					    u_xlat0.x = u_xlat1.x + _RGB;
					    u_xlat0.y = u_xlat1.w;
					    u_xlat2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.y = u_xlat1.x + (-_RGB);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.yw);
					    u_xlat2.x = u_xlat10_1.x;
					    u_xlat2.y = u_xlat10_3.y;
					    SV_Target0.xyz = (-vec3(u_xlat12)) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
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
					; Bound: 219
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %27 %204 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpMemberDecorate %11 0 Offset 11 
					                                                OpMemberDecorate %11 1 Offset 11 
					                                                OpMemberDecorate %11 2 Offset 11 
					                                                OpMemberDecorate %11 3 RelaxedPrecision 
					                                                OpMemberDecorate %11 3 Offset 11 
					                                                OpDecorate %11 Block 
					                                                OpDecorate %13 DescriptorSet 13 
					                                                OpDecorate %13 Binding 13 
					                                                OpDecorate vs_TEXCOORD0 Location 27 
					                                                OpDecorate %32 RelaxedPrecision 
					                                                OpDecorate %33 RelaxedPrecision 
					                                                OpDecorate %36 RelaxedPrecision 
					                                                OpDecorate %37 RelaxedPrecision 
					                                                OpDecorate %167 RelaxedPrecision 
					                                                OpDecorate %167 DescriptorSet 167 
					                                                OpDecorate %167 Binding 167 
					                                                OpDecorate %168 RelaxedPrecision 
					                                                OpDecorate %171 RelaxedPrecision 
					                                                OpDecorate %171 DescriptorSet 171 
					                                                OpDecorate %171 Binding 171 
					                                                OpDecorate %172 RelaxedPrecision 
					                                                OpDecorate %187 RelaxedPrecision 
					                                                OpDecorate %188 RelaxedPrecision 
					                                                OpDecorate %195 RelaxedPrecision 
					                                                OpDecorate %196 RelaxedPrecision 
					                                                OpDecorate %204 Location 204 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 3 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_3* %9 = OpVariable Private 
					                                        %10 = OpTypeVector %6 4 
					                                        %11 = OpTypeStruct %6 %6 %6 %10 
					                                        %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                        %14 = OpTypeInt 32 1 
					                                    i32 %15 = OpConstant 0 
					                                        %16 = OpTypePointer Uniform %6 
					                                        %19 = OpTypeInt 32 0 
					                                    u32 %20 = OpConstant 0 
					                                        %21 = OpTypePointer Private %6 
					                                        %23 = OpTypePointer Private %10 
					                         Private f32_4* %24 = OpVariable Private 
					                                        %25 = OpTypeVector %6 2 
					                                        %26 = OpTypePointer Input %25 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                    i32 %29 = OpConstant 3 
					                                        %30 = OpTypePointer Uniform %10 
					                         Private f32_4* %41 = OpVariable Private 
					                                    f32 %44 = OpConstant 3,674022E-40 
					                                    f32 %45 = OpConstant 3,674022E-40 
					                                    f32 %46 = OpConstant 3,674022E-40 
					                                  f32_3 %47 = OpConstantComposite %44 %45 %46 
					                                    u32 %51 = OpConstant 1 
					                                    f32 %57 = OpConstant 3,674022E-40 
					                                    f32 %58 = OpConstant 3,674022E-40 
					                                  f32_2 %59 = OpConstantComposite %57 %58 
					                                    f32 %68 = OpConstant 3,674022E-40 
					                                        %75 = OpTypePointer Private %25 
					                         Private f32_2* %76 = OpVariable Private 
					                                    f32 %84 = OpConstant 3,674022E-40 
					                                  f32_2 %85 = OpConstantComposite %84 %84 
					                                    i32 %97 = OpConstant 1 
					                                   f32 %104 = OpConstant 3,674022E-40 
					                                   u32 %106 = OpConstant 3 
					                          Private f32* %108 = OpVariable Private 
					                          Private f32* %112 = OpVariable Private 
					                                   u32 %113 = OpConstant 2 
					                                   f32 %122 = OpConstant 3,674022E-40 
					                                 f32_2 %123 = OpConstantComposite %122 %68 
					                                   f32 %143 = OpConstant 3,674022E-40 
					                                   i32 %157 = OpConstant 2 
					                                       %165 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                       %166 = OpTypePointer UniformConstant %165 
					  UniformConstant read_only Texture2D* %167 = OpVariable UniformConstant 
					                                       %169 = OpTypeSampler 
					                                       %170 = OpTypePointer UniformConstant %169 
					              UniformConstant sampler* %171 = OpVariable UniformConstant 
					                                       %173 = OpTypeSampledImage %165 
					                                       %203 = OpTypePointer Output %10 
					                         Output f32_4* %204 = OpVariable Output 
					                                   f32 %208 = OpConstant 3,674022E-40 
					                                 f32_3 %209 = OpConstantComposite %208 %208 %208 
					                                   f32 %215 = OpConstant 3,674022E-40 
					                                       %216 = OpTypePointer Output %6 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                           Uniform f32* %17 = OpAccessChain %13 %15 
					                                    f32 %18 = OpLoad %17 
					                           Private f32* %22 = OpAccessChain %9 %20 
					                                                OpStore %22 %18 
					                                  f32_2 %28 = OpLoad vs_TEXCOORD0 
					                         Uniform f32_4* %31 = OpAccessChain %13 %29 
					                                  f32_4 %32 = OpLoad %31 
					                                  f32_2 %33 = OpVectorShuffle %32 %32 0 1 
					                                  f32_2 %34 = OpFMul %28 %33 
					                         Uniform f32_4* %35 = OpAccessChain %13 %29 
					                                  f32_4 %36 = OpLoad %35 
					                                  f32_2 %37 = OpVectorShuffle %36 %36 2 3 
					                                  f32_2 %38 = OpFAdd %34 %37 
					                                  f32_4 %39 = OpLoad %24 
					                                  f32_4 %40 = OpVectorShuffle %39 %38 0 1 4 5 
					                                                OpStore %24 %40 
					                                  f32_4 %42 = OpLoad %24 
					                                  f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
					                                  f32_3 %48 = OpFMul %43 %47 
					                                  f32_4 %49 = OpLoad %41 
					                                  f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
					                                                OpStore %41 %50 
					                           Private f32* %52 = OpAccessChain %41 %51 
					                                    f32 %53 = OpLoad %52 
					                           Private f32* %54 = OpAccessChain %9 %51 
					                                                OpStore %54 %53 
					                                  f32_3 %55 = OpLoad %9 
					                                  f32_2 %56 = OpVectorShuffle %55 %55 0 1 
					                                    f32 %60 = OpDot %56 %59 
					                           Private f32* %61 = OpAccessChain %9 %20 
					                                                OpStore %61 %60 
					                           Private f32* %62 = OpAccessChain %9 %20 
					                                    f32 %63 = OpLoad %62 
					                                    f32 %64 = OpExtInst %1 13 %63 
					                           Private f32* %65 = OpAccessChain %9 %20 
					                                                OpStore %65 %64 
					                           Private f32* %66 = OpAccessChain %9 %20 
					                                    f32 %67 = OpLoad %66 
					                                    f32 %69 = OpFMul %67 %68 
					                           Private f32* %70 = OpAccessChain %9 %20 
					                                                OpStore %70 %69 
					                           Private f32* %71 = OpAccessChain %9 %20 
					                                    f32 %72 = OpLoad %71 
					                                    f32 %73 = OpExtInst %1 10 %72 
					                           Private f32* %74 = OpAccessChain %9 %20 
					                                                OpStore %74 %73 
					                                  f32_4 %77 = OpLoad %41 
					                                  f32_2 %78 = OpVectorShuffle %77 %77 0 1 
					                           Uniform f32* %79 = OpAccessChain %13 %15 
					                                    f32 %80 = OpLoad %79 
					                                  f32_2 %81 = OpCompositeConstruct %80 %80 
					                                  f32_2 %82 = OpFMul %78 %81 
					                                                OpStore %76 %82 
					                                  f32_2 %83 = OpLoad %76 
					                                  f32_2 %86 = OpFMul %83 %85 
					                                                OpStore %76 %86 
					                                  f32_2 %87 = OpLoad %76 
					                                  f32_2 %88 = OpExtInst %1 13 %87 
					                                                OpStore %76 %88 
					                           Private f32* %89 = OpAccessChain %9 %20 
					                                    f32 %90 = OpLoad %89 
					                           Private f32* %91 = OpAccessChain %76 %51 
					                                    f32 %92 = OpLoad %91 
					                                    f32 %93 = OpFMul %90 %92 
					                           Private f32* %94 = OpAccessChain %9 %20 
					                                                OpStore %94 %93 
					                           Private f32* %95 = OpAccessChain %9 %20 
					                                    f32 %96 = OpLoad %95 
					                           Uniform f32* %98 = OpAccessChain %13 %97 
					                                    f32 %99 = OpLoad %98 
					                                   f32 %100 = OpFMul %96 %99 
					                          Private f32* %101 = OpAccessChain %9 %20 
					                                                OpStore %101 %100 
					                          Uniform f32* %102 = OpAccessChain %13 %15 
					                                   f32 %103 = OpLoad %102 
					                                   f32 %105 = OpFMul %103 %104 
					                          Private f32* %107 = OpAccessChain %41 %106 
					                                                OpStore %107 %105 
					                                 f32_4 %109 = OpLoad %41 
					                                 f32_2 %110 = OpVectorShuffle %109 %109 3 0 
					                                   f32 %111 = OpDot %110 %59 
					                                                OpStore %108 %111 
					                          Private f32* %114 = OpAccessChain %41 %113 
					                                   f32 %115 = OpLoad %114 
					                                   f32 %116 = OpExtInst %1 13 %115 
					                                                OpStore %112 %116 
					                                   f32 %117 = OpLoad %108 
					                                   f32 %118 = OpExtInst %1 13 %117 
					                          Private f32* %119 = OpAccessChain %9 %113 
					                                                OpStore %119 %118 
					                                 f32_3 %120 = OpLoad %9 
					                                 f32_2 %121 = OpVectorShuffle %120 %120 0 2 
					                                 f32_2 %124 = OpFMul %121 %123 
					                                 f32_3 %125 = OpLoad %9 
					                                 f32_3 %126 = OpVectorShuffle %125 %124 3 1 4 
					                                                OpStore %9 %126 
					                          Private f32* %127 = OpAccessChain %9 %113 
					                                   f32 %128 = OpLoad %127 
					                                   f32 %129 = OpExtInst %1 10 %128 
					                                                OpStore %108 %129 
					                                   f32 %130 = OpLoad %108 
					                          Private f32* %131 = OpAccessChain %76 %20 
					                                   f32 %132 = OpLoad %131 
					                                   f32 %133 = OpFMul %130 %132 
					                          Private f32* %134 = OpAccessChain %76 %20 
					                                                OpStore %134 %133 
					                          Private f32* %135 = OpAccessChain %76 %20 
					                                   f32 %136 = OpLoad %135 
					                          Uniform f32* %137 = OpAccessChain %13 %97 
					                                   f32 %138 = OpLoad %137 
					                                   f32 %139 = OpFMul %136 %138 
					                          Private f32* %140 = OpAccessChain %76 %20 
					                                                OpStore %140 %139 
					                          Private f32* %141 = OpAccessChain %76 %20 
					                                   f32 %142 = OpLoad %141 
					                                   f32 %144 = OpFMul %142 %143 
					                          Private f32* %145 = OpAccessChain %9 %20 
					                                   f32 %146 = OpLoad %145 
					                                   f32 %147 = OpFAdd %144 %146 
					                          Private f32* %148 = OpAccessChain %9 %20 
					                                                OpStore %148 %147 
					                          Private f32* %149 = OpAccessChain %9 %20 
					                                   f32 %150 = OpLoad %149 
					                          Private f32* %151 = OpAccessChain %24 %113 
					                                   f32 %152 = OpLoad %151 
					                                   f32 %153 = OpFAdd %150 %152 
					                          Private f32* %154 = OpAccessChain %24 %20 
					                                                OpStore %154 %153 
					                          Private f32* %155 = OpAccessChain %24 %20 
					                                   f32 %156 = OpLoad %155 
					                          Uniform f32* %158 = OpAccessChain %13 %157 
					                                   f32 %159 = OpLoad %158 
					                                   f32 %160 = OpFAdd %156 %159 
					                          Private f32* %161 = OpAccessChain %9 %20 
					                                                OpStore %161 %160 
					                          Private f32* %162 = OpAccessChain %24 %106 
					                                   f32 %163 = OpLoad %162 
					                          Private f32* %164 = OpAccessChain %9 %51 
					                                                OpStore %164 %163 
					                   read_only Texture2D %168 = OpLoad %167 
					                               sampler %172 = OpLoad %171 
					            read_only Texture2DSampled %174 = OpSampledImage %168 %172 
					                                 f32_3 %175 = OpLoad %9 
					                                 f32_2 %176 = OpVectorShuffle %175 %175 0 1 
					                                 f32_4 %177 = OpImageSampleImplicitLod %174 %176 
					                                   f32 %178 = OpCompositeExtract %177 2 
					                          Private f32* %179 = OpAccessChain %9 %113 
					                                                OpStore %179 %178 
					                          Private f32* %180 = OpAccessChain %24 %20 
					                                   f32 %181 = OpLoad %180 
					                          Uniform f32* %182 = OpAccessChain %13 %157 
					                                   f32 %183 = OpLoad %182 
					                                   f32 %184 = OpFNegate %183 
					                                   f32 %185 = OpFAdd %181 %184 
					                          Private f32* %186 = OpAccessChain %24 %51 
					                                                OpStore %186 %185 
					                   read_only Texture2D %187 = OpLoad %167 
					                               sampler %188 = OpLoad %171 
					            read_only Texture2DSampled %189 = OpSampledImage %187 %188 
					                                 f32_4 %190 = OpLoad %24 
					                                 f32_2 %191 = OpVectorShuffle %190 %190 0 3 
					                                 f32_4 %192 = OpImageSampleImplicitLod %189 %191 
					                                   f32 %193 = OpCompositeExtract %192 1 
					                          Private f32* %194 = OpAccessChain %9 %51 
					                                                OpStore %194 %193 
					                   read_only Texture2D %195 = OpLoad %167 
					                               sampler %196 = OpLoad %171 
					            read_only Texture2DSampled %197 = OpSampledImage %195 %196 
					                                 f32_4 %198 = OpLoad %24 
					                                 f32_2 %199 = OpVectorShuffle %198 %198 1 3 
					                                 f32_4 %200 = OpImageSampleImplicitLod %197 %199 
					                                   f32 %201 = OpCompositeExtract %200 0 
					                          Private f32* %202 = OpAccessChain %9 %20 
					                                                OpStore %202 %201 
					                                   f32 %205 = OpLoad %112 
					                                 f32_3 %206 = OpCompositeConstruct %205 %205 %205 
					                                 f32_3 %207 = OpFNegate %206 
					                                 f32_3 %210 = OpFMul %207 %209 
					                                 f32_3 %211 = OpLoad %9 
					                                 f32_3 %212 = OpFAdd %210 %211 
					                                 f32_4 %213 = OpLoad %204 
					                                 f32_4 %214 = OpVectorShuffle %213 %212 4 5 6 3 
					                                                OpStore %204 %214 
					                           Output f32* %217 = OpAccessChain %204 %106 
					                                                OpStore %217 %215 
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
						float _Distortion;
						float _RGB;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _TimeX;
					    u_xlat1.zw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.xyz = u_xlat1.www * vec3(80.0, 25.0, 800.0);
					    u_xlat0.y = u_xlat2.y;
					    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat4.xy = u_xlat2.xy * vec2(_TimeX);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.0285714287, 0.0285714287);
					    u_xlat4.xy = sin(u_xlat4.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat4.y;
					    u_xlat0.x = u_xlat0.x * _Distortion;
					    u_xlat2.w = _TimeX * 15.0;
					    u_xlat8 = dot(u_xlat2.wx, vec2(12.9898005, 78.2330017));
					    u_xlat12 = sin(u_xlat2.z);
					    u_xlat0.z = sin(u_xlat8);
					    u_xlat0.xz = u_xlat0.xz * vec2(0.00400000019, 43758.5469);
					    u_xlat8 = fract(u_xlat0.z);
					    u_xlat4.x = u_xlat8 * u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * _Distortion;
					    u_xlat0.x = u_xlat4.x * 0.00300000003 + u_xlat0.x;
					    u_xlat1.x = u_xlat0.x + u_xlat1.z;
					    u_xlat0.x = u_xlat1.x + _RGB;
					    u_xlat0.y = u_xlat1.w;
					    u_xlat2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.y = u_xlat1.x + (-_RGB);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.yw);
					    u_xlat2.x = u_xlat10_1.x;
					    u_xlat2.y = u_xlat10_3.y;
					    SV_Target0.xyz = (-vec3(u_xlat12)) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
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