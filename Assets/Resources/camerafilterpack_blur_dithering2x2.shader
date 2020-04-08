Shader "CameraFilterPack/Blur_Dithering2x2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Level ("_Level", Range(1, 16)) = 4
		_Distance ("_Distance", Vector) = (30,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 55139
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
					uniform 	float _Level;
					uniform 	vec4 _Distance;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bvec2 u_xlatb0;
					vec2 u_xlat1;
					float u_xlat2;
					vec4 u_xlat10_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					int u_xlati4;
					vec4 u_xlat10_5;
					bool u_xlatb10;
					int u_xlati12;
					vec2 u_xlat13;
					float u_xlat18;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlati12 = int(_Level);
					    u_xlat18 = trunc(_Level);
					    u_xlat1.xy = _Distance.xy / _ScreenResolution.xy;
					    u_xlat13.xy = (-u_xlat1.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat1.xy = (-u_xlat13.xy) + u_xlat1.xy;
					    u_xlat2 = u_xlat18 + -1.0;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat2);
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlatb2.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
					    u_xlat0.xy = fract(abs(u_xlat0.xy));
					    {
					        vec2 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat0.y : (-u_xlat0.y);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat0.xy = u_xlat0.xy + u_xlat0.xy;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xx + vec2(-0.0, -1.0);
					    u_xlatb0.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
					    u_xlat0.xy = mix(vec2(0.0, 0.0), vec2(0.75, 0.25), vec2(u_xlatb0.xy));
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xx * u_xlat1.xy + u_xlat13.xy;
					    u_xlat10_2 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					    u_xlat3 = u_xlat10_2;
					    u_xlat13.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<u_xlati12 ; u_xlati_loop_1++)
					    {
					        u_xlat13.xy = u_xlat1.xy + u_xlat13.xy;
					        u_xlat10_5 = textureLod(_MainTex, u_xlat13.xy, 0.0);
					        u_xlat3 = u_xlat3 + u_xlat10_5;
					    }
					    SV_Target0 = u_xlat3 / vec4(u_xlat18);
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
					; Bound: 226
					; Schema: 0
					                                                    OpCapability Shader 
					                                             %1 = OpExtInstImport "GLSL.std.450" 
					                                                    OpMemoryModel Logical GLSL450 
					                                                    OpEntryPoint Fragment %4 "main" %11 %218 
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
					                                                    OpDecorate %177 RelaxedPrecision 
					                                                    OpDecorate %180 RelaxedPrecision 
					                                                    OpDecorate %180 DescriptorSet 180 
					                                                    OpDecorate %180 Binding 180 
					                                                    OpDecorate %181 RelaxedPrecision 
					                                                    OpDecorate %184 RelaxedPrecision 
					                                                    OpDecorate %184 DescriptorSet 184 
					                                                    OpDecorate %184 Binding 184 
					                                                    OpDecorate %185 RelaxedPrecision 
					                                                    OpDecorate %191 RelaxedPrecision 
					                                                    OpDecorate %206 RelaxedPrecision 
					                                                    OpDecorate %207 RelaxedPrecision 
					                                                    OpDecorate %208 RelaxedPrecision 
					                                                    OpDecorate %213 RelaxedPrecision 
					                                                    OpDecorate %218 Location 218 
					                                             %2 = OpTypeVoid 
					                                             %3 = OpTypeFunction %2 
					                                             %6 = OpTypeFloat 32 
					                                             %7 = OpTypeVector %6 2 
					                                             %8 = OpTypePointer Private %7 
					                              Private f32_2* %9 = OpVariable Private 
					                                            %10 = OpTypePointer Input %7 
					                      Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                            %13 = OpTypeVector %6 4 
					                                            %14 = OpTypeStruct %13 %6 %13 %13 
					                                            %15 = OpTypePointer Uniform %14 
					Uniform struct {f32_4; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
					                                            %17 = OpTypeInt 32 1 
					                                        i32 %18 = OpConstant 3 
					                                            %19 = OpTypePointer Uniform %13 
					                                            %28 = OpTypePointer Private %17 
					                               Private i32* %29 = OpVariable Private 
					                                        i32 %30 = OpConstant 1 
					                                            %31 = OpTypePointer Uniform %6 
					                                            %35 = OpTypePointer Private %6 
					                               Private f32* %36 = OpVariable Private 
					                             Private f32_2* %40 = OpVariable Private 
					                                        i32 %41 = OpConstant 2 
					                                        i32 %45 = OpConstant 0 
					                             Private f32_2* %50 = OpVariable Private 
					                                        f32 %53 = OpConstant 3,674022E-40 
					                                      f32_2 %54 = OpConstantComposite %53 %53 
					                               Private f32* %66 = OpVariable Private 
					                                        f32 %68 = OpConstant 3,674022E-40 
					                                            %81 = OpTypeBool 
					                                            %82 = OpTypeVector %81 2 
					                                            %83 = OpTypePointer Private %82 
					                            Private bool_2* %84 = OpVariable Private 
					                                            %90 = OpTypeVector %81 4 
					                                            %96 = OpTypePointer Function %7 
					                                            %99 = OpTypeInt 32 0 
					                                       u32 %100 = OpConstant 0 
					                                           %101 = OpTypePointer Private %81 
					                                           %104 = OpTypePointer Function %6 
					                                       u32 %116 = OpConstant 1 
					                                       f32 %144 = OpConstant 3,674022E-40 
					                                     f32_2 %145 = OpConstantComposite %144 %68 
					                           Private bool_2* %147 = OpVariable Private 
					                                       f32 %148 = OpConstant 3,674022E-40 
					                                     f32_4 %149 = OpConstantComposite %53 %53 %148 %148 
					                                     f32_2 %155 = OpConstantComposite %148 %148 
					                                       f32 %156 = OpConstant 3,674022E-40 
					                                       f32 %157 = OpConstant 3,674022E-40 
					                                     f32_2 %158 = OpConstantComposite %156 %157 
					                                       f32 %160 = OpConstant 3,674022E-40 
					                                     f32_2 %161 = OpConstantComposite %160 %160 
					                                           %176 = OpTypePointer Private %13 
					                            Private f32_4* %177 = OpVariable Private 
					                                           %178 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                           %179 = OpTypePointer UniformConstant %178 
					      UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
					                                           %182 = OpTypeSampler 
					                                           %183 = OpTypePointer UniformConstant %182 
					                  UniformConstant sampler* %184 = OpVariable UniformConstant 
					                                           %186 = OpTypeSampledImage %178 
					                            Private f32_4* %190 = OpVariable Private 
					                                           %193 = OpTypePointer Function %17 
					                            Private f32_4* %206 = OpVariable Private 
					                                           %217 = OpTypePointer Output %13 
					                             Output f32_4* %218 = OpVariable Output 
					                              Private i32* %224 = OpVariable Private 
					                             Private bool* %225 = OpVariable Private 
					                                        void %4 = OpFunction None %3 
					                                             %5 = OpLabel 
					                            Function f32_2* %97 = OpVariable Function 
					                             Function f32* %105 = OpVariable Function 
					                             Function f32* %119 = OpVariable Function 
					                             Function i32* %194 = OpVariable Function 
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
					                               Uniform f32* %32 = OpAccessChain %16 %30 
					                                        f32 %33 = OpLoad %32 
					                                        i32 %34 = OpConvertFToS %33 
					                                                    OpStore %29 %34 
					                               Uniform f32* %37 = OpAccessChain %16 %30 
					                                        f32 %38 = OpLoad %37 
					                                        f32 %39 = OpExtInst %1 3 %38 
					                                                    OpStore %36 %39 
					                             Uniform f32_4* %42 = OpAccessChain %16 %41 
					                                      f32_4 %43 = OpLoad %42 
					                                      f32_2 %44 = OpVectorShuffle %43 %43 0 1 
					                             Uniform f32_4* %46 = OpAccessChain %16 %45 
					                                      f32_4 %47 = OpLoad %46 
					                                      f32_2 %48 = OpVectorShuffle %47 %47 0 1 
					                                      f32_2 %49 = OpFDiv %44 %48 
					                                                    OpStore %40 %49 
					                                      f32_2 %51 = OpLoad %40 
					                                      f32_2 %52 = OpFNegate %51 
					                                      f32_2 %55 = OpFMul %52 %54 
					                                      f32_2 %56 = OpLoad %9 
					                                      f32_2 %57 = OpFAdd %55 %56 
					                                                    OpStore %50 %57 
					                                      f32_2 %58 = OpLoad %40 
					                                      f32_2 %59 = OpFMul %58 %54 
					                                      f32_2 %60 = OpLoad %9 
					                                      f32_2 %61 = OpFAdd %59 %60 
					                                                    OpStore %40 %61 
					                                      f32_2 %62 = OpLoad %50 
					                                      f32_2 %63 = OpFNegate %62 
					                                      f32_2 %64 = OpLoad %40 
					                                      f32_2 %65 = OpFAdd %63 %64 
					                                                    OpStore %40 %65 
					                                        f32 %67 = OpLoad %36 
					                                        f32 %69 = OpFAdd %67 %68 
					                                                    OpStore %66 %69 
					                                      f32_2 %70 = OpLoad %40 
					                                        f32 %71 = OpLoad %66 
					                                      f32_2 %72 = OpCompositeConstruct %71 %71 
					                                      f32_2 %73 = OpFDiv %70 %72 
					                                                    OpStore %40 %73 
					                                      f32_2 %74 = OpLoad %9 
					                             Uniform f32_4* %75 = OpAccessChain %16 %45 
					                                      f32_4 %76 = OpLoad %75 
					                                      f32_2 %77 = OpVectorShuffle %76 %76 0 1 
					                                      f32_2 %78 = OpFMul %74 %77 
					                                                    OpStore %9 %78 
					                                      f32_2 %79 = OpLoad %9 
					                                      f32_2 %80 = OpFMul %79 %54 
					                                                    OpStore %9 %80 
					                                      f32_2 %85 = OpLoad %9 
					                                      f32_4 %86 = OpVectorShuffle %85 %85 0 1 0 0 
					                                      f32_2 %87 = OpLoad %9 
					                                      f32_4 %88 = OpVectorShuffle %87 %87 0 1 0 0 
					                                      f32_4 %89 = OpFNegate %88 
					                                     bool_4 %91 = OpFOrdGreaterThanEqual %86 %89 
					                                     bool_2 %92 = OpVectorShuffle %91 %91 0 1 
					                                                    OpStore %84 %92 
					                                      f32_2 %93 = OpLoad %9 
					                                      f32_2 %94 = OpExtInst %1 4 %93 
					                                      f32_2 %95 = OpExtInst %1 10 %94 
					                                                    OpStore %9 %95 
					                                      f32_2 %98 = OpLoad %9 
					                                                    OpStore %97 %98 
					                             Private bool* %102 = OpAccessChain %84 %100 
					                                      bool %103 = OpLoad %102 
					                                                    OpSelectionMerge %107 None 
					                                                    OpBranchConditional %103 %106 %110 
					                                           %106 = OpLabel 
					                              Private f32* %108 = OpAccessChain %9 %100 
					                                       f32 %109 = OpLoad %108 
					                                                    OpStore %105 %109 
					                                                    OpBranch %107 
					                                           %110 = OpLabel 
					                              Private f32* %111 = OpAccessChain %9 %100 
					                                       f32 %112 = OpLoad %111 
					                                       f32 %113 = OpFNegate %112 
					                                                    OpStore %105 %113 
					                                                    OpBranch %107 
					                                           %107 = OpLabel 
					                                       f32 %114 = OpLoad %105 
					                             Function f32* %115 = OpAccessChain %97 %100 
					                                                    OpStore %115 %114 
					                             Private bool* %117 = OpAccessChain %84 %116 
					                                      bool %118 = OpLoad %117 
					                                                    OpSelectionMerge %121 None 
					                                                    OpBranchConditional %118 %120 %124 
					                                           %120 = OpLabel 
					                              Private f32* %122 = OpAccessChain %9 %116 
					                                       f32 %123 = OpLoad %122 
					                                                    OpStore %119 %123 
					                                                    OpBranch %121 
					                                           %124 = OpLabel 
					                              Private f32* %125 = OpAccessChain %9 %116 
					                                       f32 %126 = OpLoad %125 
					                                       f32 %127 = OpFNegate %126 
					                                                    OpStore %119 %127 
					                                                    OpBranch %121 
					                                           %121 = OpLabel 
					                                       f32 %128 = OpLoad %119 
					                             Function f32* %129 = OpAccessChain %97 %116 
					                                                    OpStore %129 %128 
					                                     f32_2 %130 = OpLoad %97 
					                                                    OpStore %9 %130 
					                                     f32_2 %131 = OpLoad %9 
					                                     f32_2 %132 = OpLoad %9 
					                                     f32_2 %133 = OpFAdd %131 %132 
					                                                    OpStore %9 %133 
					                                     f32_2 %134 = OpLoad %9 
					                                     f32_2 %135 = OpExtInst %1 8 %134 
					                                                    OpStore %9 %135 
					                              Private f32* %136 = OpAccessChain %9 %116 
					                                       f32 %137 = OpLoad %136 
					                              Private f32* %138 = OpAccessChain %9 %100 
					                                       f32 %139 = OpLoad %138 
					                                       f32 %140 = OpFAdd %137 %139 
					                              Private f32* %141 = OpAccessChain %9 %100 
					                                                    OpStore %141 %140 
					                                     f32_2 %142 = OpLoad %9 
					                                     f32_2 %143 = OpVectorShuffle %142 %142 0 0 
					                                     f32_2 %146 = OpFAdd %143 %145 
					                                                    OpStore %9 %146 
					                                     f32_2 %150 = OpLoad %9 
					                                     f32_4 %151 = OpVectorShuffle %150 %150 0 1 0 0 
					                                     f32_4 %152 = OpExtInst %1 4 %151 
					                                    bool_4 %153 = OpFOrdGreaterThanEqual %149 %152 
					                                    bool_2 %154 = OpVectorShuffle %153 %153 0 1 
					                                                    OpStore %147 %154 
					                                    bool_2 %159 = OpLoad %147 
					                                     f32_2 %162 = OpSelect %159 %161 %155 
					                                     f32_2 %163 = OpExtInst %1 46 %155 %158 %162 
					                                                    OpStore %9 %163 
					                              Private f32* %164 = OpAccessChain %9 %116 
					                                       f32 %165 = OpLoad %164 
					                              Private f32* %166 = OpAccessChain %9 %100 
					                                       f32 %167 = OpLoad %166 
					                                       f32 %168 = OpFAdd %165 %167 
					                              Private f32* %169 = OpAccessChain %9 %100 
					                                                    OpStore %169 %168 
					                                     f32_2 %170 = OpLoad %9 
					                                     f32_2 %171 = OpVectorShuffle %170 %170 0 0 
					                                     f32_2 %172 = OpLoad %40 
					                                     f32_2 %173 = OpFMul %171 %172 
					                                     f32_2 %174 = OpLoad %50 
					                                     f32_2 %175 = OpFAdd %173 %174 
					                                                    OpStore %9 %175 
					                       read_only Texture2D %181 = OpLoad %180 
					                                   sampler %185 = OpLoad %184 
					                read_only Texture2DSampled %187 = OpSampledImage %181 %185 
					                                     f32_2 %188 = OpLoad %9 
					                                     f32_4 %189 = OpImageSampleExplicitLod %187 %188 Lod %13 
					                                                    OpStore %177 %189 
					                                     f32_4 %191 = OpLoad %177 
					                                                    OpStore %190 %191 
					                                     f32_2 %192 = OpLoad %9 
					                                                    OpStore %50 %192 
					                                                    OpStore %194 %30 
					                                                    OpBranch %195 
					                                           %195 = OpLabel 
					                                                    OpLoopMerge %197 %198 None 
					                                                    OpBranch %199 
					                                           %199 = OpLabel 
					                                       i32 %200 = OpLoad %194 
					                                       i32 %201 = OpLoad %29 
					                                      bool %202 = OpSLessThan %200 %201 
					                                                    OpBranchConditional %202 %196 %197 
					                                           %196 = OpLabel 
					                                     f32_2 %203 = OpLoad %40 
					                                     f32_2 %204 = OpLoad %50 
					                                     f32_2 %205 = OpFAdd %203 %204 
					                                                    OpStore %50 %205 
					                       read_only Texture2D %207 = OpLoad %180 
					                                   sampler %208 = OpLoad %184 
					                read_only Texture2DSampled %209 = OpSampledImage %207 %208 
					                                     f32_2 %210 = OpLoad %50 
					                                     f32_4 %211 = OpImageSampleExplicitLod %209 %210 Lod %13 
					                                                    OpStore %206 %211 
					                                     f32_4 %212 = OpLoad %190 
					                                     f32_4 %213 = OpLoad %206 
					                                     f32_4 %214 = OpFAdd %212 %213 
					                                                    OpStore %190 %214 
					                                                    OpBranch %198 
					                                           %198 = OpLabel 
					                                       i32 %215 = OpLoad %194 
					                                       i32 %216 = OpIAdd %215 %30 
					                                                    OpStore %194 %216 
					                                                    OpBranch %195 
					                                           %197 = OpLabel 
					                                     f32_4 %219 = OpLoad %190 
					                                       f32 %220 = OpLoad %36 
					                                     f32_4 %221 = OpCompositeConstruct %220 %220 %220 %220 
					                                     f32_4 %222 = OpFDiv %219 %221 
					                                                    OpStore %218 %222 
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
						float _Level;
						vec4 _Distance;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bvec2 u_xlatb0;
					vec2 u_xlat1;
					float u_xlat2;
					vec4 u_xlat10_2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					int u_xlati4;
					vec4 u_xlat10_5;
					bool u_xlatb10;
					int u_xlati12;
					vec2 u_xlat13;
					float u_xlat18;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlati12 = int(_Level);
					    u_xlat18 = trunc(_Level);
					    u_xlat1.xy = _Distance.xy / _ScreenResolution.xy;
					    u_xlat13.xy = (-u_xlat1.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat1.xy = (-u_xlat13.xy) + u_xlat1.xy;
					    u_xlat2 = u_xlat18 + -1.0;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat2);
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlatb2.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
					    u_xlat0.xy = fract(abs(u_xlat0.xy));
					    {
					        vec2 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat0.y : (-u_xlat0.y);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat0.xy = u_xlat0.xy + u_xlat0.xy;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xx + vec2(-0.0, -1.0);
					    u_xlatb0.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), abs(u_xlat0.xyxx)).xy;
					    u_xlat0.xy = mix(vec2(0.0, 0.0), vec2(0.75, 0.25), vec2(u_xlatb0.xy));
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xx * u_xlat1.xy + u_xlat13.xy;
					    u_xlat10_2 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					    u_xlat3 = u_xlat10_2;
					    u_xlat13.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<u_xlati12 ; u_xlati_loop_1++)
					    {
					        u_xlat13.xy = u_xlat1.xy + u_xlat13.xy;
					        u_xlat10_5 = textureLod(_MainTex, u_xlat13.xy, 0.0);
					        u_xlat3 = u_xlat3 + u_xlat10_5;
					    }
					    SV_Target0 = u_xlat3 / vec4(u_xlat18);
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