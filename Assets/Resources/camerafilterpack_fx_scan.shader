Shader "CameraFilterPack/FX_Scan" {
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
			GpuProgramID 28876
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
					uniform 	float _Value2;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					bool u_xlatb2;
					bool u_xlatb5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat6 = u_xlat0.x + -0.400000006;
					    u_xlat9 = _Value2 * _TimeX;
					    u_xlat2.x = sin(u_xlat9);
					    u_xlat2.x = u_xlat2.x * 0.666666687;
					    u_xlatb5 = u_xlat2.x>=(-u_xlat2.x);
					    u_xlat2.x = fract(abs(u_xlat2.x));
					    u_xlat2.x = (u_xlatb5) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat6 = u_xlat6 + (-u_xlat2.x);
					    u_xlat2.x = u_xlat6 * 4.0 + (-_Value);
					    u_xlatb2 = u_xlat10_1.x<u_xlat2.x;
					    if(u_xlatb2){
					        SV_Target0 = u_xlat10_1;
					    } else {
					        u_xlat6 = u_xlat6 * 4.0 + _Value;
					        u_xlatb6 = u_xlat10_1.x<u_xlat6;
					        if(u_xlatb6){
					            u_xlat6 = u_xlat9 * 9.0;
					            u_xlat6 = sin(u_xlat6);
					            u_xlat2.x = u_xlat6 + u_xlat0.x;
					            u_xlat2.y = _TimeX * 5.0 + u_xlat0.y;
					            u_xlat10_0 = texture(_MainTex, u_xlat2.xy);
					            SV_Target0 = u_xlat10_0 + vec4(1.0, -1.0, -1.0, 0.0);
					        } else {
					            SV_Target0 = u_xlat10_1;
					        }
					    }
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
					; Bound: 169
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %11 %119 
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
					                                                OpDecorate %111 RelaxedPrecision 
					                                                OpDecorate %119 Location 119 
					                                                OpDecorate %120 RelaxedPrecision 
					                                                OpDecorate %129 RelaxedPrecision 
					                                                OpDecorate %154 RelaxedPrecision 
					                                                OpDecorate %155 RelaxedPrecision 
					                                                OpDecorate %156 RelaxedPrecision 
					                                                OpDecorate %160 RelaxedPrecision 
					                                                OpDecorate %165 RelaxedPrecision 
					                                                OpDecorate %167 RelaxedPrecision 
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
					                                        %42 = OpTypePointer Private %6 
					                           Private f32* %43 = OpVariable Private 
					                                        %44 = OpTypeInt 32 0 
					                                    u32 %45 = OpConstant 0 
					                                    f32 %48 = OpConstant 3,674022E-40 
					                           Private f32* %50 = OpVariable Private 
					                                    i32 %51 = OpConstant 2 
					                                        %52 = OpTypePointer Uniform %6 
					                                    i32 %55 = OpConstant 0 
					                         Private f32_2* %59 = OpVariable Private 
					                                    f32 %65 = OpConstant 3,674022E-40 
					                                        %68 = OpTypeBool 
					                                        %69 = OpTypePointer Private %68 
					                          Private bool* %70 = OpVariable Private 
					                                        %83 = OpTypePointer Function %6 
					                                   f32 %101 = OpConstant 3,674022E-40 
					                                   i32 %103 = OpConstant 1 
					                         Private bool* %109 = OpVariable Private 
					                                       %118 = OpTypePointer Output %13 
					                         Output f32_4* %119 = OpVariable Output 
					                         Private bool* %127 = OpVariable Private 
					                                   f32 %136 = OpConstant 3,674022E-40 
					                                   f32 %147 = OpConstant 3,674022E-40 
					                                   u32 %149 = OpConstant 1 
					                        Private f32_4* %154 = OpVariable Private 
					                                   f32 %161 = OpConstant 3,674022E-40 
					                                   f32 %162 = OpConstant 3,674022E-40 
					                                   f32 %163 = OpConstant 3,674022E-40 
					                                 f32_4 %164 = OpConstantComposite %161 %162 %162 %163 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                          Function f32* %84 = OpVariable Function 
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
					                           Private f32* %46 = OpAccessChain %9 %45 
					                                    f32 %47 = OpLoad %46 
					                                    f32 %49 = OpFAdd %47 %48 
					                                                OpStore %43 %49 
					                           Uniform f32* %53 = OpAccessChain %16 %51 
					                                    f32 %54 = OpLoad %53 
					                           Uniform f32* %56 = OpAccessChain %16 %55 
					                                    f32 %57 = OpLoad %56 
					                                    f32 %58 = OpFMul %54 %57 
					                                                OpStore %50 %58 
					                                    f32 %60 = OpLoad %50 
					                                    f32 %61 = OpExtInst %1 13 %60 
					                           Private f32* %62 = OpAccessChain %59 %45 
					                                                OpStore %62 %61 
					                           Private f32* %63 = OpAccessChain %59 %45 
					                                    f32 %64 = OpLoad %63 
					                                    f32 %66 = OpFMul %64 %65 
					                           Private f32* %67 = OpAccessChain %59 %45 
					                                                OpStore %67 %66 
					                           Private f32* %71 = OpAccessChain %59 %45 
					                                    f32 %72 = OpLoad %71 
					                           Private f32* %73 = OpAccessChain %59 %45 
					                                    f32 %74 = OpLoad %73 
					                                    f32 %75 = OpFNegate %74 
					                                   bool %76 = OpFOrdGreaterThanEqual %72 %75 
					                                                OpStore %70 %76 
					                           Private f32* %77 = OpAccessChain %59 %45 
					                                    f32 %78 = OpLoad %77 
					                                    f32 %79 = OpExtInst %1 4 %78 
					                                    f32 %80 = OpExtInst %1 10 %79 
					                           Private f32* %81 = OpAccessChain %59 %45 
					                                                OpStore %81 %80 
					                                   bool %82 = OpLoad %70 
					                                                OpSelectionMerge %86 None 
					                                                OpBranchConditional %82 %85 %89 
					                                        %85 = OpLabel 
					                           Private f32* %87 = OpAccessChain %59 %45 
					                                    f32 %88 = OpLoad %87 
					                                                OpStore %84 %88 
					                                                OpBranch %86 
					                                        %89 = OpLabel 
					                           Private f32* %90 = OpAccessChain %59 %45 
					                                    f32 %91 = OpLoad %90 
					                                    f32 %92 = OpFNegate %91 
					                                                OpStore %84 %92 
					                                                OpBranch %86 
					                                        %86 = OpLabel 
					                                    f32 %93 = OpLoad %84 
					                           Private f32* %94 = OpAccessChain %59 %45 
					                                                OpStore %94 %93 
					                                    f32 %95 = OpLoad %43 
					                           Private f32* %96 = OpAccessChain %59 %45 
					                                    f32 %97 = OpLoad %96 
					                                    f32 %98 = OpFNegate %97 
					                                    f32 %99 = OpFAdd %95 %98 
					                                                OpStore %43 %99 
					                                   f32 %100 = OpLoad %43 
					                                   f32 %102 = OpFMul %100 %101 
					                          Uniform f32* %104 = OpAccessChain %16 %103 
					                                   f32 %105 = OpLoad %104 
					                                   f32 %106 = OpFNegate %105 
					                                   f32 %107 = OpFAdd %102 %106 
					                          Private f32* %108 = OpAccessChain %59 %45 
					                                                OpStore %108 %107 
					                          Private f32* %110 = OpAccessChain %29 %45 
					                                   f32 %111 = OpLoad %110 
					                          Private f32* %112 = OpAccessChain %59 %45 
					                                   f32 %113 = OpLoad %112 
					                                  bool %114 = OpFOrdLessThan %111 %113 
					                                                OpStore %109 %114 
					                                  bool %115 = OpLoad %109 
					                                                OpSelectionMerge %117 None 
					                                                OpBranchConditional %115 %116 %121 
					                                       %116 = OpLabel 
					                                 f32_4 %120 = OpLoad %29 
					                                                OpStore %119 %120 
					                                                OpBranch %117 
					                                       %121 = OpLabel 
					                                   f32 %122 = OpLoad %43 
					                                   f32 %123 = OpFMul %122 %101 
					                          Uniform f32* %124 = OpAccessChain %16 %103 
					                                   f32 %125 = OpLoad %124 
					                                   f32 %126 = OpFAdd %123 %125 
					                                                OpStore %43 %126 
					                          Private f32* %128 = OpAccessChain %29 %45 
					                                   f32 %129 = OpLoad %128 
					                                   f32 %130 = OpLoad %43 
					                                  bool %131 = OpFOrdLessThan %129 %130 
					                                                OpStore %127 %131 
					                                  bool %132 = OpLoad %127 
					                                                OpSelectionMerge %134 None 
					                                                OpBranchConditional %132 %133 %166 
					                                       %133 = OpLabel 
					                                   f32 %135 = OpLoad %50 
					                                   f32 %137 = OpFMul %135 %136 
					                                                OpStore %43 %137 
					                                   f32 %138 = OpLoad %43 
					                                   f32 %139 = OpExtInst %1 13 %138 
					                                                OpStore %43 %139 
					                                   f32 %140 = OpLoad %43 
					                          Private f32* %141 = OpAccessChain %9 %45 
					                                   f32 %142 = OpLoad %141 
					                                   f32 %143 = OpFAdd %140 %142 
					                          Private f32* %144 = OpAccessChain %59 %45 
					                                                OpStore %144 %143 
					                          Uniform f32* %145 = OpAccessChain %16 %55 
					                                   f32 %146 = OpLoad %145 
					                                   f32 %148 = OpFMul %146 %147 
					                          Private f32* %150 = OpAccessChain %9 %149 
					                                   f32 %151 = OpLoad %150 
					                                   f32 %152 = OpFAdd %148 %151 
					                          Private f32* %153 = OpAccessChain %59 %149 
					                                                OpStore %153 %152 
					                   read_only Texture2D %155 = OpLoad %32 
					                               sampler %156 = OpLoad %36 
					            read_only Texture2DSampled %157 = OpSampledImage %155 %156 
					                                 f32_2 %158 = OpLoad %59 
					                                 f32_4 %159 = OpImageSampleImplicitLod %157 %158 
					                                                OpStore %154 %159 
					                                 f32_4 %160 = OpLoad %154 
					                                 f32_4 %165 = OpFAdd %160 %164 
					                                                OpStore %119 %165 
					                                                OpBranch %134 
					                                       %166 = OpLabel 
					                                 f32_4 %167 = OpLoad %29 
					                                                OpStore %119 %167 
					                                                OpBranch %134 
					                                       %134 = OpLabel 
					                                                OpBranch %117 
					                                       %117 = OpLabel 
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
						float _Value2;
						vec4 unused_0_4;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					bool u_xlatb2;
					bool u_xlatb5;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat6 = u_xlat0.x + -0.400000006;
					    u_xlat9 = _Value2 * _TimeX;
					    u_xlat2.x = sin(u_xlat9);
					    u_xlat2.x = u_xlat2.x * 0.666666687;
					    u_xlatb5 = u_xlat2.x>=(-u_xlat2.x);
					    u_xlat2.x = fract(abs(u_xlat2.x));
					    u_xlat2.x = (u_xlatb5) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat6 = u_xlat6 + (-u_xlat2.x);
					    u_xlat2.x = u_xlat6 * 4.0 + (-_Value);
					    u_xlatb2 = u_xlat10_1.x<u_xlat2.x;
					    if(u_xlatb2){
					        SV_Target0 = u_xlat10_1;
					    } else {
					        u_xlat6 = u_xlat6 * 4.0 + _Value;
					        u_xlatb6 = u_xlat10_1.x<u_xlat6;
					        if(u_xlatb6){
					            u_xlat6 = u_xlat9 * 9.0;
					            u_xlat6 = sin(u_xlat6);
					            u_xlat2.x = u_xlat6 + u_xlat0.x;
					            u_xlat2.y = _TimeX * 5.0 + u_xlat0.y;
					            u_xlat10_0 = texture(_MainTex, u_xlat2.xy);
					            SV_Target0 = u_xlat10_0 + vec4(1.0, -1.0, -1.0, 0.0);
					        } else {
					            SV_Target0 = u_xlat10_1;
					        //ENDIF
					        }
					    //ENDIF
					    }
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