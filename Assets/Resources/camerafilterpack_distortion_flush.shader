Shader "CameraFilterPack/Distortion_Flush" {
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
			GpuProgramID 29490
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
					uniform 	float Value;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.100000001;
					    u_xlatb2 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb2) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 10.0 + Value;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat2.xy + vec2(-0.5, -0.5);
					    u_xlat6 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat6 = (-u_xlat6) + 0.5;
					    u_xlat6 = u_xlat6 * 1.41421354;
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat6 = float(1.0) / u_xlat6;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = u_xlat0.x * 3.0;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat6 = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat1.x * u_xlat0.x + (-u_xlat6);
					    u_xlat0.xy = u_xlat0.xx * vec2(0.0625, 0.0625) + u_xlat2.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
					; Bound: 149
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %63 %135 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %11 0 Offset 11 
					                                              OpMemberDecorate %11 1 Offset 11 
					                                              OpMemberDecorate %11 2 RelaxedPrecision 
					                                              OpMemberDecorate %11 2 Offset 11 
					                                              OpDecorate %11 Block 
					                                              OpDecorate %13 DescriptorSet 13 
					                                              OpDecorate %13 Binding 13 
					                                              OpDecorate vs_TEXCOORD0 Location 63 
					                                              OpDecorate %68 RelaxedPrecision 
					                                              OpDecorate %69 RelaxedPrecision 
					                                              OpDecorate %72 RelaxedPrecision 
					                                              OpDecorate %73 RelaxedPrecision 
					                                              OpDecorate %135 Location 135 
					                                              OpDecorate %138 RelaxedPrecision 
					                                              OpDecorate %138 DescriptorSet 138 
					                                              OpDecorate %138 Binding 138 
					                                              OpDecorate %139 RelaxedPrecision 
					                                              OpDecorate %142 RelaxedPrecision 
					                                              OpDecorate %142 DescriptorSet 142 
					                                              OpDecorate %142 Binding 142 
					                                              OpDecorate %143 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 4 
					                                      %11 = OpTypeStruct %6 %6 %10 
					                                      %12 = OpTypePointer Uniform %11 
					   Uniform struct {f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                      %14 = OpTypeInt 32 1 
					                                  i32 %15 = OpConstant 0 
					                                      %16 = OpTypePointer Uniform %6 
					                                  f32 %19 = OpConstant 3,674022E-40 
					                                      %21 = OpTypeInt 32 0 
					                                  u32 %22 = OpConstant 0 
					                                      %23 = OpTypePointer Private %6 
					                                      %25 = OpTypeBool 
					                                      %26 = OpTypePointer Private %25 
					                        Private bool* %27 = OpVariable Private 
					                                      %40 = OpTypePointer Function %6 
					                                  f32 %54 = OpConstant 3,674022E-40 
					                                  i32 %56 = OpConstant 1 
					                       Private f32_2* %61 = OpVariable Private 
					                                      %62 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                  i32 %65 = OpConstant 2 
					                                      %66 = OpTypePointer Uniform %10 
					                       Private f32_2* %75 = OpVariable Private 
					                                  f32 %77 = OpConstant 3,674022E-40 
					                                f32_2 %78 = OpConstantComposite %77 %77 
					                         Private f32* %80 = OpVariable Private 
					                                  f32 %88 = OpConstant 3,674022E-40 
					                                  f32 %91 = OpConstant 3,674022E-40 
					                                  f32 %95 = OpConstant 3,674022E-40 
					                                 f32 %105 = OpConstant 3,674022E-40 
					                                 u32 %114 = OpConstant 1 
					                                 f32 %129 = OpConstant 3,674022E-40 
					                               f32_2 %130 = OpConstantComposite %129 %129 
					                                     %134 = OpTypePointer Output %10 
					                       Output f32_4* %135 = OpVariable Output 
					                                     %136 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %137 = OpTypePointer UniformConstant %136 
					UniformConstant read_only Texture2D* %138 = OpVariable UniformConstant 
					                                     %140 = OpTypeSampler 
					                                     %141 = OpTypePointer UniformConstant %140 
					            UniformConstant sampler* %142 = OpVariable UniformConstant 
					                                     %144 = OpTypeSampledImage %136 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function f32* %41 = OpVariable Function 
					                         Uniform f32* %17 = OpAccessChain %13 %15 
					                                  f32 %18 = OpLoad %17 
					                                  f32 %20 = OpFMul %18 %19 
					                         Private f32* %24 = OpAccessChain %9 %22 
					                                              OpStore %24 %20 
					                         Private f32* %28 = OpAccessChain %9 %22 
					                                  f32 %29 = OpLoad %28 
					                         Private f32* %30 = OpAccessChain %9 %22 
					                                  f32 %31 = OpLoad %30 
					                                  f32 %32 = OpFNegate %31 
					                                 bool %33 = OpFOrdGreaterThanEqual %29 %32 
					                                              OpStore %27 %33 
					                         Private f32* %34 = OpAccessChain %9 %22 
					                                  f32 %35 = OpLoad %34 
					                                  f32 %36 = OpExtInst %1 4 %35 
					                                  f32 %37 = OpExtInst %1 10 %36 
					                         Private f32* %38 = OpAccessChain %9 %22 
					                                              OpStore %38 %37 
					                                 bool %39 = OpLoad %27 
					                                              OpSelectionMerge %43 None 
					                                              OpBranchConditional %39 %42 %46 
					                                      %42 = OpLabel 
					                         Private f32* %44 = OpAccessChain %9 %22 
					                                  f32 %45 = OpLoad %44 
					                                              OpStore %41 %45 
					                                              OpBranch %43 
					                                      %46 = OpLabel 
					                         Private f32* %47 = OpAccessChain %9 %22 
					                                  f32 %48 = OpLoad %47 
					                                  f32 %49 = OpFNegate %48 
					                                              OpStore %41 %49 
					                                              OpBranch %43 
					                                      %43 = OpLabel 
					                                  f32 %50 = OpLoad %41 
					                         Private f32* %51 = OpAccessChain %9 %22 
					                                              OpStore %51 %50 
					                         Private f32* %52 = OpAccessChain %9 %22 
					                                  f32 %53 = OpLoad %52 
					                                  f32 %55 = OpFMul %53 %54 
					                         Uniform f32* %57 = OpAccessChain %13 %56 
					                                  f32 %58 = OpLoad %57 
					                                  f32 %59 = OpFAdd %55 %58 
					                         Private f32* %60 = OpAccessChain %9 %22 
					                                              OpStore %60 %59 
					                                f32_2 %64 = OpLoad vs_TEXCOORD0 
					                       Uniform f32_4* %67 = OpAccessChain %13 %65 
					                                f32_4 %68 = OpLoad %67 
					                                f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                f32_2 %70 = OpFMul %64 %69 
					                       Uniform f32_4* %71 = OpAccessChain %13 %65 
					                                f32_4 %72 = OpLoad %71 
					                                f32_2 %73 = OpVectorShuffle %72 %72 2 3 
					                                f32_2 %74 = OpFAdd %70 %73 
					                                              OpStore %61 %74 
					                                f32_2 %76 = OpLoad %61 
					                                f32_2 %79 = OpFAdd %76 %78 
					                                              OpStore %75 %79 
					                                f32_2 %81 = OpLoad %75 
					                                f32_2 %82 = OpLoad %75 
					                                  f32 %83 = OpDot %81 %82 
					                                              OpStore %80 %83 
					                                  f32 %84 = OpLoad %80 
					                                  f32 %85 = OpExtInst %1 31 %84 
					                                              OpStore %80 %85 
					                                  f32 %86 = OpLoad %80 
					                                  f32 %87 = OpFNegate %86 
					                                  f32 %89 = OpFAdd %87 %88 
					                                              OpStore %80 %89 
					                                  f32 %90 = OpLoad %80 
					                                  f32 %92 = OpFMul %90 %91 
					                                              OpStore %80 %92 
					                                  f32 %93 = OpLoad %80 
					                                  f32 %94 = OpExtInst %1 32 %93 
					                                              OpStore %80 %94 
					                                  f32 %96 = OpLoad %80 
					                                  f32 %97 = OpFDiv %95 %96 
					                                              OpStore %80 %97 
					                         Private f32* %98 = OpAccessChain %9 %22 
					                                  f32 %99 = OpLoad %98 
					                                 f32 %100 = OpLoad %80 
					                                 f32 %101 = OpFMul %99 %100 
					                        Private f32* %102 = OpAccessChain %9 %22 
					                                              OpStore %102 %101 
					                        Private f32* %103 = OpAccessChain %9 %22 
					                                 f32 %104 = OpLoad %103 
					                                 f32 %106 = OpFMul %104 %105 
					                        Private f32* %107 = OpAccessChain %9 %22 
					                                              OpStore %107 %106 
					                        Private f32* %108 = OpAccessChain %9 %22 
					                                 f32 %109 = OpLoad %108 
					                                 f32 %110 = OpExtInst %1 14 %109 
					                        Private f32* %111 = OpAccessChain %9 %22 
					                                              OpStore %111 %110 
					                        Private f32* %112 = OpAccessChain %9 %22 
					                                 f32 %113 = OpLoad %112 
					                        Private f32* %115 = OpAccessChain %75 %114 
					                                 f32 %116 = OpLoad %115 
					                                 f32 %117 = OpFMul %113 %116 
					                                              OpStore %80 %117 
					                        Private f32* %118 = OpAccessChain %75 %22 
					                                 f32 %119 = OpLoad %118 
					                        Private f32* %120 = OpAccessChain %9 %22 
					                                 f32 %121 = OpLoad %120 
					                                 f32 %122 = OpFMul %119 %121 
					                                 f32 %123 = OpLoad %80 
					                                 f32 %124 = OpFNegate %123 
					                                 f32 %125 = OpFAdd %122 %124 
					                        Private f32* %126 = OpAccessChain %9 %22 
					                                              OpStore %126 %125 
					                               f32_2 %127 = OpLoad %9 
					                               f32_2 %128 = OpVectorShuffle %127 %127 0 0 
					                               f32_2 %131 = OpFMul %128 %130 
					                               f32_2 %132 = OpLoad %61 
					                               f32_2 %133 = OpFAdd %131 %132 
					                                              OpStore %9 %133 
					                 read_only Texture2D %139 = OpLoad %138 
					                             sampler %143 = OpLoad %142 
					          read_only Texture2DSampled %145 = OpSampledImage %139 %143 
					                               f32_2 %146 = OpLoad %9 
					                               f32_4 %147 = OpImageSampleImplicitLod %145 %146 
					                                              OpStore %135 %147 
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
						float Value;
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.100000001;
					    u_xlatb2 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb2) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 10.0 + Value;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat2.xy + vec2(-0.5, -0.5);
					    u_xlat6 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat6 = sqrt(u_xlat6);
					    u_xlat6 = (-u_xlat6) + 0.5;
					    u_xlat6 = u_xlat6 * 1.41421354;
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat6 = float(1.0) / u_xlat6;
					    u_xlat0.x = u_xlat0.x * u_xlat6;
					    u_xlat0.x = u_xlat0.x * 3.0;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat6 = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat1.x * u_xlat0.x + (-u_xlat6);
					    u_xlat0.xy = u_xlat0.xx * vec2(0.0625, 0.0625) + u_xlat2.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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