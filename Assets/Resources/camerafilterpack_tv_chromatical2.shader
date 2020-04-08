Shader "CameraFilterPack/TV_Chromatical2" {
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
			GpuProgramID 27513
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
					uniform 	float Fade;
					uniform 	float ZoomFade;
					uniform 	float ZoomSpeed;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					void main()
					{
					    u_xlat0.x = _TimeX * ZoomSpeed;
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + -0.100000024;
					    u_xlat0.x = ZoomFade * u_xlat0.x + 1.0;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat3.xy + vec2(-0.5, -0.5);
					    u_xlat0.xw = u_xlat1.xy * u_xlat0.xx + vec2(0.5, 0.5);
					    u_xlat0.xw = (-u_xlat3.xy) + u_xlat0.xw;
					    u_xlat0.zw = vec2(vec2(Fade, Fade)) * u_xlat0.xw + u_xlat3.xy;
					    u_xlat1.x = u_xlat0.z + -0.5;
					    u_xlat1.x = abs(u_xlat1.x) * _Value;
					    u_xlat0.xy = u_xlat1.xx * vec2(0.0189999994, -0.0189999994) + u_xlat0.zz;
					    u_xlat1 = texture(_MainTex, u_xlat0.xw);
					    u_xlat10_2 = texture(_MainTex, u_xlat0.yw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat1.z = u_xlat10_2.z;
					    u_xlat1.y = u_xlat10_0.y;
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					; Bound: 194
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %54 %172 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %10 0 Offset 10 
					                                                      OpMemberDecorate %10 1 Offset 10 
					                                                      OpMemberDecorate %10 2 Offset 10 
					                                                      OpMemberDecorate %10 3 Offset 10 
					                                                      OpMemberDecorate %10 4 Offset 10 
					                                                      OpMemberDecorate %10 5 RelaxedPrecision 
					                                                      OpMemberDecorate %10 5 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 54 
					                                                      OpDecorate %59 RelaxedPrecision 
					                                                      OpDecorate %60 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %134 DescriptorSet 134 
					                                                      OpDecorate %134 Binding 134 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %138 DescriptorSet 138 
					                                                      OpDecorate %138 Binding 138 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %155 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %165 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %172 Location 172 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 0 
					                                              %15 = OpTypePointer Uniform %6 
					                                          i32 %18 = OpConstant 4 
					                                              %22 = OpTypeInt 32 0 
					                                          u32 %23 = OpConstant 0 
					                                              %24 = OpTypePointer Private %6 
					                                          f32 %28 = OpConstant 3,674022E-40 
					                                          f32 %38 = OpConstant 3,674022E-40 
					                                          i32 %41 = OpConstant 3 
					                                          f32 %47 = OpConstant 3,674022E-40 
					                                              %50 = OpTypeVector %6 2 
					                                              %51 = OpTypePointer Private %50 
					                               Private f32_2* %52 = OpVariable Private 
					                                              %53 = OpTypePointer Input %50 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %56 = OpConstant 5 
					                                              %57 = OpTypePointer Uniform %7 
					                                              %66 = OpTypeVector %6 3 
					                                              %67 = OpTypePointer Private %66 
					                               Private f32_3* %68 = OpVariable Private 
					                                          f32 %70 = OpConstant 3,674022E-40 
					                                        f32_2 %71 = OpConstantComposite %70 %70 
					                                          f32 %80 = OpConstant 3,674022E-40 
					                                        f32_2 %81 = OpConstantComposite %80 %80 
					                                          i32 %92 = OpConstant 2 
					                                         u32 %108 = OpConstant 2 
					                                         i32 %116 = OpConstant 1 
					                                         f32 %123 = OpConstant 3,674022E-40 
					                                         f32 %124 = OpConstant 3,674022E-40 
					                                       f32_2 %125 = OpConstantComposite %123 %124 
					                                             %132 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %133 = OpTypePointer UniformConstant %132 
					        UniformConstant read_only Texture2D* %134 = OpVariable UniformConstant 
					                                             %136 = OpTypeSampler 
					                                             %137 = OpTypePointer UniformConstant %136 
					                    UniformConstant sampler* %138 = OpVariable UniformConstant 
					                                             %140 = OpTypeSampledImage %132 
					                              Private f32_3* %155 = OpVariable Private 
					                                         u32 %163 = OpConstant 1 
					                                             %171 = OpTypePointer Output %7 
					                               Output f32_4* %172 = OpVariable Output 
					                                         u32 %190 = OpConstant 3 
					                                             %191 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                 Uniform f32* %19 = OpAccessChain %12 %18 
					                                          f32 %20 = OpLoad %19 
					                                          f32 %21 = OpFMul %17 %20 
					                                 Private f32* %25 = OpAccessChain %9 %23 
					                                                      OpStore %25 %21 
					                                 Private f32* %26 = OpAccessChain %9 %23 
					                                          f32 %27 = OpLoad %26 
					                                          f32 %29 = OpFMul %27 %28 
					                                 Private f32* %30 = OpAccessChain %9 %23 
					                                                      OpStore %30 %29 
					                                 Private f32* %31 = OpAccessChain %9 %23 
					                                          f32 %32 = OpLoad %31 
					                                          f32 %33 = OpExtInst %1 13 %32 
					                                 Private f32* %34 = OpAccessChain %9 %23 
					                                                      OpStore %34 %33 
					                                 Private f32* %35 = OpAccessChain %9 %23 
					                                          f32 %36 = OpLoad %35 
					                                          f32 %37 = OpFMul %36 %28 
					                                          f32 %39 = OpFAdd %37 %38 
					                                 Private f32* %40 = OpAccessChain %9 %23 
					                                                      OpStore %40 %39 
					                                 Uniform f32* %42 = OpAccessChain %12 %41 
					                                          f32 %43 = OpLoad %42 
					                                 Private f32* %44 = OpAccessChain %9 %23 
					                                          f32 %45 = OpLoad %44 
					                                          f32 %46 = OpFMul %43 %45 
					                                          f32 %48 = OpFAdd %46 %47 
					                                 Private f32* %49 = OpAccessChain %9 %23 
					                                                      OpStore %49 %48 
					                                        f32_2 %55 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %58 = OpAccessChain %12 %56 
					                                        f32_4 %59 = OpLoad %58 
					                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
					                                        f32_2 %61 = OpFMul %55 %60 
					                               Uniform f32_4* %62 = OpAccessChain %12 %56 
					                                        f32_4 %63 = OpLoad %62 
					                                        f32_2 %64 = OpVectorShuffle %63 %63 2 3 
					                                        f32_2 %65 = OpFAdd %61 %64 
					                                                      OpStore %52 %65 
					                                        f32_2 %69 = OpLoad %52 
					                                        f32_2 %72 = OpFAdd %69 %71 
					                                        f32_3 %73 = OpLoad %68 
					                                        f32_3 %74 = OpVectorShuffle %73 %72 3 4 2 
					                                                      OpStore %68 %74 
					                                        f32_3 %75 = OpLoad %68 
					                                        f32_2 %76 = OpVectorShuffle %75 %75 0 1 
					                                        f32_4 %77 = OpLoad %9 
					                                        f32_2 %78 = OpVectorShuffle %77 %77 0 0 
					                                        f32_2 %79 = OpFMul %76 %78 
					                                        f32_2 %82 = OpFAdd %79 %81 
					                                        f32_4 %83 = OpLoad %9 
					                                        f32_4 %84 = OpVectorShuffle %83 %82 4 1 2 5 
					                                                      OpStore %9 %84 
					                                        f32_2 %85 = OpLoad %52 
					                                        f32_2 %86 = OpFNegate %85 
					                                        f32_4 %87 = OpLoad %9 
					                                        f32_2 %88 = OpVectorShuffle %87 %87 0 3 
					                                        f32_2 %89 = OpFAdd %86 %88 
					                                        f32_4 %90 = OpLoad %9 
					                                        f32_4 %91 = OpVectorShuffle %90 %89 4 1 2 5 
					                                                      OpStore %9 %91 
					                                 Uniform f32* %93 = OpAccessChain %12 %92 
					                                          f32 %94 = OpLoad %93 
					                                 Uniform f32* %95 = OpAccessChain %12 %92 
					                                          f32 %96 = OpLoad %95 
					                                        f32_2 %97 = OpCompositeConstruct %94 %96 
					                                          f32 %98 = OpCompositeExtract %97 0 
					                                          f32 %99 = OpCompositeExtract %97 1 
					                                       f32_2 %100 = OpCompositeConstruct %98 %99 
					                                       f32_4 %101 = OpLoad %9 
					                                       f32_2 %102 = OpVectorShuffle %101 %101 0 3 
					                                       f32_2 %103 = OpFMul %100 %102 
					                                       f32_2 %104 = OpLoad %52 
					                                       f32_2 %105 = OpFAdd %103 %104 
					                                       f32_4 %106 = OpLoad %9 
					                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
					                                                      OpStore %9 %107 
					                                Private f32* %109 = OpAccessChain %9 %108 
					                                         f32 %110 = OpLoad %109 
					                                         f32 %111 = OpFAdd %110 %70 
					                                Private f32* %112 = OpAccessChain %68 %23 
					                                                      OpStore %112 %111 
					                                Private f32* %113 = OpAccessChain %68 %23 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %115 = OpExtInst %1 4 %114 
					                                Uniform f32* %117 = OpAccessChain %12 %116 
					                                         f32 %118 = OpLoad %117 
					                                         f32 %119 = OpFMul %115 %118 
					                                Private f32* %120 = OpAccessChain %68 %23 
					                                                      OpStore %120 %119 
					                                       f32_3 %121 = OpLoad %68 
					                                       f32_2 %122 = OpVectorShuffle %121 %121 0 0 
					                                       f32_2 %126 = OpFMul %122 %125 
					                                       f32_4 %127 = OpLoad %9 
					                                       f32_2 %128 = OpVectorShuffle %127 %127 2 2 
					                                       f32_2 %129 = OpFAdd %126 %128 
					                                       f32_4 %130 = OpLoad %9 
					                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 2 3 
					                                                      OpStore %9 %131 
					                         read_only Texture2D %135 = OpLoad %134 
					                                     sampler %139 = OpLoad %138 
					                  read_only Texture2DSampled %141 = OpSampledImage %135 %139 
					                                       f32_4 %142 = OpLoad %9 
					                                       f32_2 %143 = OpVectorShuffle %142 %142 0 3 
					                                       f32_4 %144 = OpImageSampleImplicitLod %141 %143 
					                                         f32 %145 = OpCompositeExtract %144 0 
					                                Private f32* %146 = OpAccessChain %68 %23 
					                                                      OpStore %146 %145 
					                         read_only Texture2D %147 = OpLoad %134 
					                                     sampler %148 = OpLoad %138 
					                  read_only Texture2DSampled %149 = OpSampledImage %147 %148 
					                                       f32_4 %150 = OpLoad %9 
					                                       f32_2 %151 = OpVectorShuffle %150 %150 1 3 
					                                       f32_4 %152 = OpImageSampleImplicitLod %149 %151 
					                                         f32 %153 = OpCompositeExtract %152 2 
					                                Private f32* %154 = OpAccessChain %68 %108 
					                                                      OpStore %154 %153 
					                         read_only Texture2D %156 = OpLoad %134 
					                                     sampler %157 = OpLoad %138 
					                  read_only Texture2DSampled %158 = OpSampledImage %156 %157 
					                                       f32_4 %159 = OpLoad %9 
					                                       f32_2 %160 = OpVectorShuffle %159 %159 2 3 
					                                       f32_4 %161 = OpImageSampleImplicitLod %158 %160 
					                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
					                                                      OpStore %155 %162 
					                                Private f32* %164 = OpAccessChain %155 %163 
					                                         f32 %165 = OpLoad %164 
					                                Private f32* %166 = OpAccessChain %68 %163 
					                                                      OpStore %166 %165 
					                                       f32_3 %167 = OpLoad %155 
					                                       f32_3 %168 = OpFNegate %167 
					                                       f32_3 %169 = OpLoad %68 
					                                       f32_3 %170 = OpFAdd %168 %169 
					                                                      OpStore %68 %170 
					                                Uniform f32* %173 = OpAccessChain %12 %92 
					                                         f32 %174 = OpLoad %173 
					                                Uniform f32* %175 = OpAccessChain %12 %92 
					                                         f32 %176 = OpLoad %175 
					                                Uniform f32* %177 = OpAccessChain %12 %92 
					                                         f32 %178 = OpLoad %177 
					                                       f32_3 %179 = OpCompositeConstruct %174 %176 %178 
					                                         f32 %180 = OpCompositeExtract %179 0 
					                                         f32 %181 = OpCompositeExtract %179 1 
					                                         f32 %182 = OpCompositeExtract %179 2 
					                                       f32_3 %183 = OpCompositeConstruct %180 %181 %182 
					                                       f32_3 %184 = OpLoad %68 
					                                       f32_3 %185 = OpFMul %183 %184 
					                                       f32_3 %186 = OpLoad %155 
					                                       f32_3 %187 = OpFAdd %185 %186 
					                                       f32_4 %188 = OpLoad %172 
					                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
					                                                      OpStore %172 %189 
					                                 Output f32* %192 = OpAccessChain %172 %190 
					                                                      OpStore %192 %47 
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
						float Fade;
						float ZoomFade;
						float ZoomSpeed;
						vec4 unused_0_6;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					void main()
					{
					    u_xlat0.x = _TimeX * ZoomSpeed;
					    u_xlat0.x = u_xlat0.x * 0.100000001;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + -0.100000024;
					    u_xlat0.x = ZoomFade * u_xlat0.x + 1.0;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat3.xy + vec2(-0.5, -0.5);
					    u_xlat0.xw = u_xlat1.xy * u_xlat0.xx + vec2(0.5, 0.5);
					    u_xlat0.xw = (-u_xlat3.xy) + u_xlat0.xw;
					    u_xlat0.zw = vec2(vec2(Fade, Fade)) * u_xlat0.xw + u_xlat3.xy;
					    u_xlat1.x = u_xlat0.z + -0.5;
					    u_xlat1.x = abs(u_xlat1.x) * _Value;
					    u_xlat0.xy = u_xlat1.xx * vec2(0.0189999994, -0.0189999994) + u_xlat0.zz;
					    u_xlat1 = texture(_MainTex, u_xlat0.xw);
					    u_xlat10_2 = texture(_MainTex, u_xlat0.yw);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat1.z = u_xlat10_2.z;
					    u_xlat1.y = u_xlat10_0.y;
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat1.xyz + u_xlat10_0.xyz;
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