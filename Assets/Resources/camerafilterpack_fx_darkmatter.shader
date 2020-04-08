Shader "CameraFilterPack/FX_DarkMatter" {
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
			GpuProgramID 19699
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
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					float u_xlat5;
					vec2 u_xlat6;
					vec2 u_xlat8;
					float u_xlat9;
					bool u_xlatb9;
					vec2 u_xlat10;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = (-_Value3);
					    u_xlat1.y = (-_Value4);
					    u_xlat8.xy = u_xlat0.xy + u_xlat1.xy;
					    u_xlat8.xy = u_xlat8.xy / vec2(vec2(_Value5, _Value5));
					    u_xlat1.x = float(1.0);
					    u_xlat5 = float(0.0);
					    while(true){
					        u_xlatb9 = u_xlat5>=10.0;
					        if(u_xlatb9){break;}
					        u_xlat9 = _TimeX * _Value + u_xlat5;
					        u_xlat13 = u_xlat5 * 0.25;
					        u_xlat2.x = sin(u_xlat9);
					        u_xlat6.xy = vec2(u_xlat9) * vec2(1.51999998, 1.10000002);
					        u_xlat10.xy = cos(u_xlat6.xy);
					        u_xlat3.x = u_xlat10.x * u_xlat2.x;
					        u_xlat9 = sin(u_xlat6.x);
					        u_xlat3.y = u_xlat9 * u_xlat10.y;
					        u_xlat2.xy = u_xlat8.xy + (-u_xlat3.xy);
					        u_xlat9 = dot(u_xlat2.xy, u_xlat2.xy);
					        u_xlat9 = sqrt(u_xlat9);
					        u_xlat9 = u_xlat9 * -3.77069688;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat13 = sin(u_xlat13);
					        u_xlat9 = u_xlat9 * u_xlat13 + 1.0;
					        u_xlat9 = u_xlat1.x * u_xlat9;
					        u_xlat1.x = u_xlat9 * 0.850000024;
					        u_xlat5 = u_xlat5 + 1.0;
					    }
					    u_xlat8.x = u_xlat1.x * _Value2;
					    u_xlat8.x = u_xlat8.x * 0.300000012;
					    u_xlat12 = _Value2 * -0.0599999987 + u_xlat8.x;
					    u_xlat0.xy = vec2(u_xlat12) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = (-u_xlat8.xxxx) * vec4(vec4(_Value6, _Value6, _Value6, _Value6)) + u_xlat10_1;
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
					; Bound: 214
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %191 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %14 0 Offset 14 
					                                                      OpMemberDecorate %14 1 Offset 14 
					                                                      OpMemberDecorate %14 2 Offset 14 
					                                                      OpMemberDecorate %14 3 Offset 14 
					                                                      OpMemberDecorate %14 4 Offset 14 
					                                                      OpMemberDecorate %14 5 Offset 14 
					                                                      OpMemberDecorate %14 6 Offset 14 
					                                                      OpMemberDecorate %14 7 RelaxedPrecision 
					                                                      OpMemberDecorate %14 7 Offset 14 
					                                                      OpDecorate %14 Block 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %180 DescriptorSet 180 
					                                                      OpDecorate %180 Binding 180 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %184 DescriptorSet 184 
					                                                      OpDecorate %184 Binding 184 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %191 Location 191 
					                                                      OpDecorate %211 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeVector %6 4 
					                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %13 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 7 
					                                              %19 = OpTypePointer Uniform %13 
					                               Private f32_2* %28 = OpVariable Private 
					                                          i32 %29 = OpConstant 3 
					                                              %30 = OpTypePointer Uniform %6 
					                                              %34 = OpTypeInt 32 0 
					                                          u32 %35 = OpConstant 0 
					                                              %36 = OpTypePointer Private %6 
					                                          i32 %38 = OpConstant 4 
					                                          u32 %42 = OpConstant 1 
					                               Private f32_2* %44 = OpVariable Private 
					                                          i32 %49 = OpConstant 5 
					                                          f32 %59 = OpConstant 3,674022E-40 
					                                 Private f32* %61 = OpVariable Private 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                              %68 = OpTypeBool 
					                                         bool %69 = OpConstantTrue 
					                                              %70 = OpTypePointer Private %68 
					                                Private bool* %71 = OpVariable Private 
					                                          f32 %73 = OpConstant 3,674022E-40 
					                                 Private f32* %79 = OpVariable Private 
					                                          i32 %80 = OpConstant 0 
					                                          i32 %83 = OpConstant 1 
					                                 Private f32* %89 = OpVariable Private 
					                                          f32 %91 = OpConstant 3,674022E-40 
					                               Private f32_2* %93 = OpVariable Private 
					                               Private f32_2* %97 = OpVariable Private 
					                                         f32 %100 = OpConstant 3,674022E-40 
					                                         f32 %101 = OpConstant 3,674022E-40 
					                                       f32_2 %102 = OpConstantComposite %100 %101 
					                              Private f32_2* %104 = OpVariable Private 
					                              Private f32_2* %107 = OpVariable Private 
					                                         f32 %132 = OpConstant 3,674022E-40 
					                                         f32 %147 = OpConstant 3,674022E-40 
					                                         i32 %154 = OpConstant 2 
					                                         f32 %161 = OpConstant 3,674022E-40 
					                                Private f32* %164 = OpVariable Private 
					                                         f32 %167 = OpConstant 3,674022E-40 
					                                             %176 = OpTypePointer Private %13 
					                              Private f32_4* %177 = OpVariable Private 
					                                             %178 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %179 = OpTypePointer UniformConstant %178 
					        UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
					                                             %182 = OpTypeSampler 
					                                             %183 = OpTypePointer UniformConstant %182 
					                    UniformConstant sampler* %184 = OpVariable UniformConstant 
					                                             %186 = OpTypeSampledImage %178 
					                                             %190 = OpTypePointer Output %13 
					                               Output f32_4* %191 = OpVariable Output 
					                                         i32 %195 = OpConstant 6 
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
					                                 Uniform f32* %31 = OpAccessChain %16 %29 
					                                          f32 %32 = OpLoad %31 
					                                          f32 %33 = OpFNegate %32 
					                                 Private f32* %37 = OpAccessChain %28 %35 
					                                                      OpStore %37 %33 
					                                 Uniform f32* %39 = OpAccessChain %16 %38 
					                                          f32 %40 = OpLoad %39 
					                                          f32 %41 = OpFNegate %40 
					                                 Private f32* %43 = OpAccessChain %28 %42 
					                                                      OpStore %43 %41 
					                                        f32_2 %45 = OpLoad %9 
					                                        f32_2 %46 = OpLoad %28 
					                                        f32_2 %47 = OpFAdd %45 %46 
					                                                      OpStore %44 %47 
					                                        f32_2 %48 = OpLoad %44 
					                                 Uniform f32* %50 = OpAccessChain %16 %49 
					                                          f32 %51 = OpLoad %50 
					                                 Uniform f32* %52 = OpAccessChain %16 %49 
					                                          f32 %53 = OpLoad %52 
					                                        f32_2 %54 = OpCompositeConstruct %51 %53 
					                                          f32 %55 = OpCompositeExtract %54 0 
					                                          f32 %56 = OpCompositeExtract %54 1 
					                                        f32_2 %57 = OpCompositeConstruct %55 %56 
					                                        f32_2 %58 = OpFDiv %48 %57 
					                                                      OpStore %44 %58 
					                                 Private f32* %60 = OpAccessChain %28 %35 
					                                                      OpStore %60 %59 
					                                                      OpStore %61 %62 
					                                                      OpBranch %63 
					                                              %63 = OpLabel 
					                                                      OpLoopMerge %65 %66 None 
					                                                      OpBranch %67 
					                                              %67 = OpLabel 
					                                                      OpBranchConditional %69 %64 %65 
					                                              %64 = OpLabel 
					                                          f32 %72 = OpLoad %61 
					                                         bool %74 = OpFOrdGreaterThanEqual %72 %73 
					                                                      OpStore %71 %74 
					                                         bool %75 = OpLoad %71 
					                                                      OpSelectionMerge %77 None 
					                                                      OpBranchConditional %75 %76 %77 
					                                              %76 = OpLabel 
					                                                      OpBranch %65 
					                                              %77 = OpLabel 
					                                 Uniform f32* %81 = OpAccessChain %16 %80 
					                                          f32 %82 = OpLoad %81 
					                                 Uniform f32* %84 = OpAccessChain %16 %83 
					                                          f32 %85 = OpLoad %84 
					                                          f32 %86 = OpFMul %82 %85 
					                                          f32 %87 = OpLoad %61 
					                                          f32 %88 = OpFAdd %86 %87 
					                                                      OpStore %79 %88 
					                                          f32 %90 = OpLoad %61 
					                                          f32 %92 = OpFMul %90 %91 
					                                                      OpStore %89 %92 
					                                          f32 %94 = OpLoad %79 
					                                          f32 %95 = OpExtInst %1 13 %94 
					                                 Private f32* %96 = OpAccessChain %93 %35 
					                                                      OpStore %96 %95 
					                                          f32 %98 = OpLoad %79 
					                                        f32_2 %99 = OpCompositeConstruct %98 %98 
					                                       f32_2 %103 = OpFMul %99 %102 
					                                                      OpStore %97 %103 
					                                       f32_2 %105 = OpLoad %97 
					                                       f32_2 %106 = OpExtInst %1 14 %105 
					                                                      OpStore %104 %106 
					                                Private f32* %108 = OpAccessChain %104 %35 
					                                         f32 %109 = OpLoad %108 
					                                Private f32* %110 = OpAccessChain %93 %35 
					                                         f32 %111 = OpLoad %110 
					                                         f32 %112 = OpFMul %109 %111 
					                                Private f32* %113 = OpAccessChain %107 %35 
					                                                      OpStore %113 %112 
					                                Private f32* %114 = OpAccessChain %97 %35 
					                                         f32 %115 = OpLoad %114 
					                                         f32 %116 = OpExtInst %1 13 %115 
					                                                      OpStore %79 %116 
					                                         f32 %117 = OpLoad %79 
					                                Private f32* %118 = OpAccessChain %104 %42 
					                                         f32 %119 = OpLoad %118 
					                                         f32 %120 = OpFMul %117 %119 
					                                Private f32* %121 = OpAccessChain %107 %42 
					                                                      OpStore %121 %120 
					                                       f32_2 %122 = OpLoad %44 
					                                       f32_2 %123 = OpLoad %107 
					                                       f32_2 %124 = OpFNegate %123 
					                                       f32_2 %125 = OpFAdd %122 %124 
					                                                      OpStore %93 %125 
					                                       f32_2 %126 = OpLoad %93 
					                                       f32_2 %127 = OpLoad %93 
					                                         f32 %128 = OpDot %126 %127 
					                                                      OpStore %79 %128 
					                                         f32 %129 = OpLoad %79 
					                                         f32 %130 = OpExtInst %1 31 %129 
					                                                      OpStore %79 %130 
					                                         f32 %131 = OpLoad %79 
					                                         f32 %133 = OpFMul %131 %132 
					                                                      OpStore %79 %133 
					                                         f32 %134 = OpLoad %79 
					                                         f32 %135 = OpExtInst %1 29 %134 
					                                                      OpStore %79 %135 
					                                         f32 %136 = OpLoad %89 
					                                         f32 %137 = OpExtInst %1 13 %136 
					                                                      OpStore %89 %137 
					                                         f32 %138 = OpLoad %79 
					                                         f32 %139 = OpLoad %89 
					                                         f32 %140 = OpFMul %138 %139 
					                                         f32 %141 = OpFAdd %140 %59 
					                                                      OpStore %79 %141 
					                                Private f32* %142 = OpAccessChain %28 %35 
					                                         f32 %143 = OpLoad %142 
					                                         f32 %144 = OpLoad %79 
					                                         f32 %145 = OpFMul %143 %144 
					                                                      OpStore %79 %145 
					                                         f32 %146 = OpLoad %79 
					                                         f32 %148 = OpFMul %146 %147 
					                                Private f32* %149 = OpAccessChain %28 %35 
					                                                      OpStore %149 %148 
					                                         f32 %150 = OpLoad %61 
					                                         f32 %151 = OpFAdd %150 %59 
					                                                      OpStore %61 %151 
					                                                      OpBranch %66 
					                                              %66 = OpLabel 
					                                                      OpBranch %63 
					                                              %65 = OpLabel 
					                                Private f32* %152 = OpAccessChain %28 %35 
					                                         f32 %153 = OpLoad %152 
					                                Uniform f32* %155 = OpAccessChain %16 %154 
					                                         f32 %156 = OpLoad %155 
					                                         f32 %157 = OpFMul %153 %156 
					                                Private f32* %158 = OpAccessChain %44 %35 
					                                                      OpStore %158 %157 
					                                Private f32* %159 = OpAccessChain %44 %35 
					                                         f32 %160 = OpLoad %159 
					                                         f32 %162 = OpFMul %160 %161 
					                                Private f32* %163 = OpAccessChain %44 %35 
					                                                      OpStore %163 %162 
					                                Uniform f32* %165 = OpAccessChain %16 %154 
					                                         f32 %166 = OpLoad %165 
					                                         f32 %168 = OpFMul %166 %167 
					                                Private f32* %169 = OpAccessChain %44 %35 
					                                         f32 %170 = OpLoad %169 
					                                         f32 %171 = OpFAdd %168 %170 
					                                                      OpStore %164 %171 
					                                         f32 %172 = OpLoad %164 
					                                       f32_2 %173 = OpCompositeConstruct %172 %172 
					                                       f32_2 %174 = OpLoad %9 
					                                       f32_2 %175 = OpFAdd %173 %174 
					                                                      OpStore %9 %175 
					                         read_only Texture2D %181 = OpLoad %180 
					                                     sampler %185 = OpLoad %184 
					                  read_only Texture2DSampled %187 = OpSampledImage %181 %185 
					                                       f32_2 %188 = OpLoad %9 
					                                       f32_4 %189 = OpImageSampleImplicitLod %187 %188 
					                                                      OpStore %177 %189 
					                                       f32_2 %192 = OpLoad %44 
					                                       f32_4 %193 = OpVectorShuffle %192 %192 0 0 0 0 
					                                       f32_4 %194 = OpFNegate %193 
					                                Uniform f32* %196 = OpAccessChain %16 %195 
					                                         f32 %197 = OpLoad %196 
					                                Uniform f32* %198 = OpAccessChain %16 %195 
					                                         f32 %199 = OpLoad %198 
					                                Uniform f32* %200 = OpAccessChain %16 %195 
					                                         f32 %201 = OpLoad %200 
					                                Uniform f32* %202 = OpAccessChain %16 %195 
					                                         f32 %203 = OpLoad %202 
					                                       f32_4 %204 = OpCompositeConstruct %197 %199 %201 %203 
					                                         f32 %205 = OpCompositeExtract %204 0 
					                                         f32 %206 = OpCompositeExtract %204 1 
					                                         f32 %207 = OpCompositeExtract %204 2 
					                                         f32 %208 = OpCompositeExtract %204 3 
					                                       f32_4 %209 = OpCompositeConstruct %205 %206 %207 %208 
					                                       f32_4 %210 = OpFMul %194 %209 
					                                       f32_4 %211 = OpLoad %177 
					                                       f32_4 %212 = OpFAdd %210 %211 
					                                                      OpStore %191 %212 
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
						float _Value3;
						float _Value4;
						float _Value5;
						float _Value6;
						vec4 unused_0_8;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					float u_xlat5;
					vec2 u_xlat6;
					vec2 u_xlat8;
					float u_xlat9;
					bool u_xlatb9;
					vec2 u_xlat10;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = (-_Value3);
					    u_xlat1.y = (-_Value4);
					    u_xlat8.xy = u_xlat0.xy + u_xlat1.xy;
					    u_xlat8.xy = u_xlat8.xy / vec2(vec2(_Value5, _Value5));
					    u_xlat1.x = float(1.0);
					    u_xlat5 = float(0.0);
					    while(true){
					        u_xlatb9 = u_xlat5>=10.0;
					        if(u_xlatb9){break;}
					        u_xlat9 = _TimeX * _Value + u_xlat5;
					        u_xlat13 = u_xlat5 * 0.25;
					        u_xlat2.x = sin(u_xlat9);
					        u_xlat6.xy = vec2(u_xlat9) * vec2(1.51999998, 1.10000002);
					        u_xlat10.xy = cos(u_xlat6.xy);
					        u_xlat3.x = u_xlat10.x * u_xlat2.x;
					        u_xlat9 = sin(u_xlat6.x);
					        u_xlat3.y = u_xlat9 * u_xlat10.y;
					        u_xlat2.xy = u_xlat8.xy + (-u_xlat3.xy);
					        u_xlat9 = dot(u_xlat2.xy, u_xlat2.xy);
					        u_xlat9 = sqrt(u_xlat9);
					        u_xlat9 = u_xlat9 * -3.77069688;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat13 = sin(u_xlat13);
					        u_xlat9 = u_xlat9 * u_xlat13 + 1.0;
					        u_xlat9 = u_xlat1.x * u_xlat9;
					        u_xlat1.x = u_xlat9 * 0.850000024;
					        u_xlat5 = u_xlat5 + 1.0;
					    }
					    u_xlat8.x = u_xlat1.x * _Value2;
					    u_xlat8.x = u_xlat8.x * 0.300000012;
					    u_xlat12 = _Value2 * -0.0599999987 + u_xlat8.x;
					    u_xlat0.xy = vec2(u_xlat12) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = (-u_xlat8.xxxx) * vec4(vec4(_Value6, _Value6, _Value6, _Value6)) + u_xlat10_1;
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