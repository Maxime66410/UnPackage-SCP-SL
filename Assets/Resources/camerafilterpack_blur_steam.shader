Shader "CameraFilterPack/Blur_Steam" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Radius ("_Radius", Range(0, 1)) = 0.1
		_Quality ("_Quality", Range(0, 1)) = 0.75
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1825
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
					uniform 	float _Radius;
					uniform 	float _Quality;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					float u_xlat4;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					float u_xlat8;
					float u_xlat12;
					bool u_xlatb12;
					vec2 u_xlat14;
					bool u_xlatb14;
					float u_xlat18;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb12 = _Quality==1.0;
					    u_xlat18 = (-_Quality) + 1.0;
					    u_xlat12 = (u_xlatb12) ? 0.00999999046 : u_xlat18;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    u_xlat18 = 0.0;
					    while(true){
					        u_xlatb2 = u_xlat18>=1.0;
					        if(u_xlatb2){break;}
					        u_xlat2 = u_xlat18 * _Radius;
					        u_xlat3 = u_xlat1;
					        u_xlat8 = 0.0;
					        while(true){
					            u_xlatb14 = u_xlat8>=1.0;
					            if(u_xlatb14){break;}
					            u_xlat14.x = u_xlat8 * 6.28318405;
					            u_xlat4 = sin(u_xlat14.x);
					            u_xlat5.x = cos(u_xlat14.x);
					            u_xlat5.y = u_xlat4;
					            u_xlat14.xy = u_xlat5.xy * vec2(u_xlat2) + u_xlat0.xy;
					            u_xlat10_4 = textureLod(_MainTex, u_xlat14.xy, 0.0);
					            u_xlat3 = u_xlat3 + u_xlat10_4;
					            u_xlat8 = u_xlat12 + u_xlat8;
					        }
					        u_xlat1 = u_xlat3;
					        u_xlat18 = u_xlat12 + u_xlat18;
					    }
					    u_xlat0.x = u_xlat12 * u_xlat12;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
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
					; Bound: 150
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %144 
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
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %119 DescriptorSet 119 
					                                              OpDecorate %119 Binding 119 
					                                              OpDecorate %120 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %123 DescriptorSet 123 
					                                              OpDecorate %123 Binding 123 
					                                              OpDecorate %124 RelaxedPrecision 
					                                              OpDecorate %130 RelaxedPrecision 
					                                              OpDecorate %144 Location 144 
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
					                                      %28 = OpTypeBool 
					                                      %29 = OpTypePointer Private %28 
					                        Private bool* %30 = OpVariable Private 
					                                  i32 %31 = OpConstant 1 
					                                      %32 = OpTypePointer Uniform %6 
					                                  f32 %35 = OpConstant 3,674022E-40 
					                                      %37 = OpTypePointer Private %6 
					                         Private f32* %38 = OpVariable Private 
					                         Private f32* %43 = OpVariable Private 
					                                  f32 %45 = OpConstant 3,674022E-40 
					                                      %48 = OpTypePointer Private %13 
					                       Private f32_4* %49 = OpVariable Private 
					                                  f32 %50 = OpConstant 3,674022E-40 
					                                      %51 = OpTypeInt 32 0 
					                                  u32 %52 = OpConstant 0 
					                                  u32 %54 = OpConstant 1 
					                                  u32 %56 = OpConstant 2 
					                                  u32 %58 = OpConstant 3 
					                                 bool %65 = OpConstantTrue 
					                        Private bool* %66 = OpVariable Private 
					                         Private f32* %73 = OpVariable Private 
					                                  i32 %75 = OpConstant 0 
					                       Private f32_4* %79 = OpVariable Private 
					                         Private f32* %81 = OpVariable Private 
					                        Private bool* %87 = OpVariable Private 
					                       Private f32_2* %94 = OpVariable Private 
					                                  f32 %96 = OpConstant 3,674022E-40 
					                         Private f32* %99 = OpVariable Private 
					                      Private f32_2* %103 = OpVariable Private 
					                      Private f32_4* %116 = OpVariable Private 
					                                     %117 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %118 = OpTypePointer UniformConstant %117 
					UniformConstant read_only Texture2D* %119 = OpVariable UniformConstant 
					                                     %121 = OpTypeSampler 
					                                     %122 = OpTypePointer UniformConstant %121 
					            UniformConstant sampler* %123 = OpVariable UniformConstant 
					                                     %125 = OpTypeSampledImage %117 
					                                     %143 = OpTypePointer Output %13 
					                       Output f32_4* %144 = OpVariable Output 
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
					                         Uniform f32* %33 = OpAccessChain %16 %31 
					                                  f32 %34 = OpLoad %33 
					                                 bool %36 = OpFOrdEqual %34 %35 
					                                              OpStore %30 %36 
					                         Uniform f32* %39 = OpAccessChain %16 %31 
					                                  f32 %40 = OpLoad %39 
					                                  f32 %41 = OpFNegate %40 
					                                  f32 %42 = OpFAdd %41 %35 
					                                              OpStore %38 %42 
					                                 bool %44 = OpLoad %30 
					                                  f32 %46 = OpLoad %38 
					                                  f32 %47 = OpSelect %44 %45 %46 
					                                              OpStore %43 %47 
					                         Private f32* %53 = OpAccessChain %49 %52 
					                                              OpStore %53 %50 
					                         Private f32* %55 = OpAccessChain %49 %54 
					                                              OpStore %55 %50 
					                         Private f32* %57 = OpAccessChain %49 %56 
					                                              OpStore %57 %50 
					                         Private f32* %59 = OpAccessChain %49 %58 
					                                              OpStore %59 %50 
					                                              OpStore %38 %50 
					                                              OpBranch %60 
					                                      %60 = OpLabel 
					                                              OpLoopMerge %62 %63 None 
					                                              OpBranch %64 
					                                      %64 = OpLabel 
					                                              OpBranchConditional %65 %61 %62 
					                                      %61 = OpLabel 
					                                  f32 %67 = OpLoad %38 
					                                 bool %68 = OpFOrdGreaterThanEqual %67 %35 
					                                              OpStore %66 %68 
					                                 bool %69 = OpLoad %66 
					                                              OpSelectionMerge %71 None 
					                                              OpBranchConditional %69 %70 %71 
					                                      %70 = OpLabel 
					                                              OpBranch %62 
					                                      %71 = OpLabel 
					                                  f32 %74 = OpLoad %38 
					                         Uniform f32* %76 = OpAccessChain %16 %75 
					                                  f32 %77 = OpLoad %76 
					                                  f32 %78 = OpFMul %74 %77 
					                                              OpStore %73 %78 
					                                f32_4 %80 = OpLoad %49 
					                                              OpStore %79 %80 
					                                              OpStore %81 %50 
					                                              OpBranch %82 
					                                      %82 = OpLabel 
					                                              OpLoopMerge %84 %85 None 
					                                              OpBranch %86 
					                                      %86 = OpLabel 
					                                              OpBranchConditional %65 %83 %84 
					                                      %83 = OpLabel 
					                                  f32 %88 = OpLoad %81 
					                                 bool %89 = OpFOrdGreaterThanEqual %88 %35 
					                                              OpStore %87 %89 
					                                 bool %90 = OpLoad %87 
					                                              OpSelectionMerge %92 None 
					                                              OpBranchConditional %90 %91 %92 
					                                      %91 = OpLabel 
					                                              OpBranch %84 
					                                      %92 = OpLabel 
					                                  f32 %95 = OpLoad %81 
					                                  f32 %97 = OpFMul %95 %96 
					                         Private f32* %98 = OpAccessChain %94 %52 
					                                              OpStore %98 %97 
					                        Private f32* %100 = OpAccessChain %94 %52 
					                                 f32 %101 = OpLoad %100 
					                                 f32 %102 = OpExtInst %1 13 %101 
					                                              OpStore %99 %102 
					                        Private f32* %104 = OpAccessChain %94 %52 
					                                 f32 %105 = OpLoad %104 
					                                 f32 %106 = OpExtInst %1 14 %105 
					                        Private f32* %107 = OpAccessChain %103 %52 
					                                              OpStore %107 %106 
					                                 f32 %108 = OpLoad %99 
					                        Private f32* %109 = OpAccessChain %103 %54 
					                                              OpStore %109 %108 
					                               f32_2 %110 = OpLoad %103 
					                                 f32 %111 = OpLoad %73 
					                               f32_2 %112 = OpCompositeConstruct %111 %111 
					                               f32_2 %113 = OpFMul %110 %112 
					                               f32_2 %114 = OpLoad %9 
					                               f32_2 %115 = OpFAdd %113 %114 
					                                              OpStore %94 %115 
					                 read_only Texture2D %120 = OpLoad %119 
					                             sampler %124 = OpLoad %123 
					          read_only Texture2DSampled %126 = OpSampledImage %120 %124 
					                               f32_2 %127 = OpLoad %94 
					                               f32_4 %128 = OpImageSampleExplicitLod %126 %127 Lod %13 
					                                              OpStore %116 %128 
					                               f32_4 %129 = OpLoad %79 
					                               f32_4 %130 = OpLoad %116 
					                               f32_4 %131 = OpFAdd %129 %130 
					                                              OpStore %79 %131 
					                                 f32 %132 = OpLoad %43 
					                                 f32 %133 = OpLoad %81 
					                                 f32 %134 = OpFAdd %132 %133 
					                                              OpStore %81 %134 
					                                              OpBranch %85 
					                                      %85 = OpLabel 
					                                              OpBranch %82 
					                                      %84 = OpLabel 
					                               f32_4 %135 = OpLoad %79 
					                                              OpStore %49 %135 
					                                 f32 %136 = OpLoad %43 
					                                 f32 %137 = OpLoad %38 
					                                 f32 %138 = OpFAdd %136 %137 
					                                              OpStore %38 %138 
					                                              OpBranch %63 
					                                      %63 = OpLabel 
					                                              OpBranch %60 
					                                      %62 = OpLabel 
					                                 f32 %139 = OpLoad %43 
					                                 f32 %140 = OpLoad %43 
					                                 f32 %141 = OpFMul %139 %140 
					                        Private f32* %142 = OpAccessChain %9 %52 
					                                              OpStore %142 %141 
					                               f32_2 %145 = OpLoad %9 
					                               f32_4 %146 = OpVectorShuffle %145 %145 0 0 0 0 
					                               f32_4 %147 = OpLoad %49 
					                               f32_4 %148 = OpFMul %146 %147 
					                                              OpStore %144 %148 
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
						vec4 unused_0_0[4];
						float _Radius;
						float _Quality;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					float u_xlat4;
					vec4 u_xlat10_4;
					vec2 u_xlat5;
					float u_xlat8;
					float u_xlat12;
					bool u_xlatb12;
					vec2 u_xlat14;
					bool u_xlatb14;
					float u_xlat18;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlatb12 = _Quality==1.0;
					    u_xlat18 = (-_Quality) + 1.0;
					    u_xlat12 = (u_xlatb12) ? 0.00999999046 : u_xlat18;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    u_xlat18 = 0.0;
					    while(true){
					        u_xlatb2 = u_xlat18>=1.0;
					        if(u_xlatb2){break;}
					        u_xlat2 = u_xlat18 * _Radius;
					        u_xlat3 = u_xlat1;
					        u_xlat8 = 0.0;
					        while(true){
					            u_xlatb14 = u_xlat8>=1.0;
					            if(u_xlatb14){break;}
					            u_xlat14.x = u_xlat8 * 6.28318405;
					            u_xlat4 = sin(u_xlat14.x);
					            u_xlat5.x = cos(u_xlat14.x);
					            u_xlat5.y = u_xlat4;
					            u_xlat14.xy = u_xlat5.xy * vec2(u_xlat2) + u_xlat0.xy;
					            u_xlat10_4 = textureLod(_MainTex, u_xlat14.xy, 0.0);
					            u_xlat3 = u_xlat3 + u_xlat10_4;
					            u_xlat8 = u_xlat12 + u_xlat8;
					        }
					        u_xlat1 = u_xlat3;
					        u_xlat18 = u_xlat12 + u_xlat18;
					    }
					    u_xlat0.x = u_xlat12 * u_xlat12;
					    SV_Target0 = u_xlat0.xxxx * u_xlat1;
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