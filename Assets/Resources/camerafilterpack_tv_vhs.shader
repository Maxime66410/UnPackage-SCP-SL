Shader "CameraFilterPack/TV_VHS" {
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
			GpuProgramID 31339
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					float u_xlat5;
					bool u_xlatb6;
					vec2 u_xlat10;
					void main()
					{
					    u_xlat0.w = 0.0;
					    u_xlat1.y = _TimeX + 2.0;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat2.y;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(11.9898005, 75.1330032));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43528.1484;
					    u_xlat0.z = fract(u_xlat1.x);
					    u_xlat2.w = _TimeX + 1.0;
					    u_xlat1.x = dot(u_xlat2.yw, vec2(11.9898005, 75.1330032));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43528.1484;
					    u_xlat0.y = fract(u_xlat1.x);
					    u_xlat2.z = _TimeX;
					    u_xlat1.x = dot(u_xlat2.yz, vec2(11.9898005, 75.1330032));
					    u_xlat1.y = dot(u_xlat2.zy, vec2(11.9898005, 75.1330032));
					    u_xlat1.xy = sin(u_xlat1.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(43528.1484, 43528.1484);
					    u_xlat5 = fract(u_xlat1.y);
					    u_xlat5 = u_xlat5 + -0.5;
					    u_xlat5 = u_xlat5 / _Value;
					    u_xlat3.x = u_xlat5 + u_xlat2.x;
					    u_xlat5 = _TimeX * _Value3 + u_xlat2.y;
					    u_xlat0.x = fract(u_xlat1.x);
					    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat1.x = floor(u_xlat5);
					    u_xlat1.x = (-u_xlat1.x) + u_xlat5;
					    u_xlat5 = dot(vec2(_TimeX), vec2(11.9898005, 75.1330032));
					    u_xlat5 = sin(u_xlat5);
					    u_xlat5 = u_xlat5 * 43528.1484;
					    u_xlat5 = fract(u_xlat5);
					    u_xlat5 = u_xlat5 + -0.5;
					    u_xlat5 = u_xlat5 / _Value2;
					    u_xlat3.y = u_xlat5 + u_xlat1.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    u_xlat2.xy = u_xlat3.yx * vec2(80.0, 50.0);
					    u_xlat10.xy = (-u_xlat3.yy) * vec2(30.0, 5.0) + vec2(11.5, 1.5);
					    u_xlat2.xy = floor(u_xlat2.xy);
					    u_xlat0 = u_xlat0 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat10_1;
					    u_xlat1 = u_xlat0 + vec4(_Value4);
					    u_xlat3.x = _TimeX;
					    u_xlat3.y = 0.0;
					    u_xlat2.xy = u_xlat2.xy + u_xlat3.xy;
					    u_xlat2.x = dot(u_xlat2.xy, vec2(11.9898005, 75.1330032));
					    u_xlat2.x = sin(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * 43528.1484;
					    u_xlat2.x = fract(u_xlat2.x);
					    u_xlatb6 = u_xlat10.x<u_xlat2.x;
					    u_xlatb2 = u_xlat2.x<u_xlat10.y;
					    u_xlatb2 = u_xlatb2 || u_xlatb6;
					    SV_Target0 = (bool(u_xlatb2)) ? u_xlat0 : u_xlat1;
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
					                                                      OpEntryPoint Fragment %4 "main" %32 %275 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpMemberDecorate %18 4 Offset 18 
					                                                      OpMemberDecorate %18 5 RelaxedPrecision 
					                                                      OpMemberDecorate %18 5 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpDecorate vs_TEXCOORD0 Location 32 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %192 DescriptorSet 192 
					                                                      OpDecorate %192 Binding 192 
					                                                      OpDecorate %193 RelaxedPrecision 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate %196 DescriptorSet 196 
					                                                      OpDecorate %196 Binding 196 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %275 Location 275 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                          f32 %10 = OpConstant 3,674022E-40 
					                                              %11 = OpTypeInt 32 0 
					                                          u32 %12 = OpConstant 3 
					                                              %13 = OpTypePointer Private %6 
					                                              %15 = OpTypeVector %6 2 
					                                              %16 = OpTypePointer Private %15 
					                               Private f32_2* %17 = OpVariable Private 
					                                              %18 = OpTypeStruct %6 %6 %6 %6 %6 %7 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32; f32; f32; f32; f32; f32_4;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                              %23 = OpTypePointer Uniform %6 
					                                          f32 %26 = OpConstant 3,674022E-40 
					                                          u32 %28 = OpConstant 1 
					                               Private f32_4* %30 = OpVariable Private 
					                                              %31 = OpTypePointer Input %15 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %34 = OpConstant 5 
					                                              %35 = OpTypePointer Uniform %7 
					                                          u32 %48 = OpConstant 0 
					                                          f32 %51 = OpConstant 3,674022E-40 
					                                          f32 %52 = OpConstant 3,674022E-40 
					                                        f32_2 %53 = OpConstantComposite %51 %52 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                          u32 %68 = OpConstant 2 
					                                          f32 %72 = OpConstant 3,674022E-40 
					                                       f32_2 %105 = OpConstantComposite %62 %62 
					                                Private f32* %107 = OpVariable Private 
					                                         f32 %112 = OpConstant 3,674022E-40 
					                                         i32 %115 = OpConstant 1 
					                              Private f32_2* %119 = OpVariable Private 
					                                         i32 %131 = OpConstant 3 
					                                       f32_4 %142 = OpConstantComposite %112 %112 %112 %112 
					                                         i32 %166 = OpConstant 2 
					                                         f32 %182 = OpConstant 3,674022E-40 
					                              Private f32_4* %189 = OpVariable Private 
					                                             %190 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %191 = OpTypePointer UniformConstant %190 
					        UniformConstant read_only Texture2D* %192 = OpVariable UniformConstant 
					                                             %194 = OpTypeSampler 
					                                             %195 = OpTypePointer UniformConstant %194 
					                    UniformConstant sampler* %196 = OpVariable UniformConstant 
					                                             %198 = OpTypeSampledImage %190 
					                              Private f32_2* %202 = OpVariable Private 
					                                         f32 %206 = OpConstant 3,674022E-40 
					                                         f32 %207 = OpConstant 3,674022E-40 
					                                       f32_2 %208 = OpConstantComposite %206 %207 
					                                         f32 %210 = OpConstant 3,674022E-40 
					                                         f32 %211 = OpConstant 3,674022E-40 
					                                       f32_2 %212 = OpConstantComposite %210 %211 
					                                         f32 %216 = OpConstant 3,674022E-40 
					                                         f32 %224 = OpConstant 3,674022E-40 
					                                       f32_4 %225 = OpConstantComposite %224 %224 %224 %224 
					                                         i32 %230 = OpConstant 4 
					                                             %257 = OpTypeBool 
					                                             %258 = OpTypePointer Private %257 
					                               Private bool* %259 = OpVariable Private 
					                               Private bool* %265 = OpVariable Private 
					                                             %274 = OpTypePointer Output %7 
					                               Output f32_4* %275 = OpVariable Output 
					                                             %279 = OpTypeVector %257 4 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Private f32* %14 = OpAccessChain %9 %12 
					                                                      OpStore %14 %10 
					                                 Uniform f32* %24 = OpAccessChain %20 %22 
					                                          f32 %25 = OpLoad %24 
					                                          f32 %27 = OpFAdd %25 %26 
					                                 Private f32* %29 = OpAccessChain %17 %28 
					                                                      OpStore %29 %27 
					                                        f32_2 %33 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %36 = OpAccessChain %20 %34 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_2 %38 = OpVectorShuffle %37 %37 0 1 
					                                        f32_2 %39 = OpFMul %33 %38 
					                               Uniform f32_4* %40 = OpAccessChain %20 %34 
					                                        f32_4 %41 = OpLoad %40 
					                                        f32_2 %42 = OpVectorShuffle %41 %41 2 3 
					                                        f32_2 %43 = OpFAdd %39 %42 
					                                        f32_4 %44 = OpLoad %30 
					                                        f32_4 %45 = OpVectorShuffle %44 %43 4 5 2 3 
					                                                      OpStore %30 %45 
					                                 Private f32* %46 = OpAccessChain %30 %28 
					                                          f32 %47 = OpLoad %46 
					                                 Private f32* %49 = OpAccessChain %17 %48 
					                                                      OpStore %49 %47 
					                                        f32_2 %50 = OpLoad %17 
					                                          f32 %54 = OpDot %50 %53 
					                                 Private f32* %55 = OpAccessChain %17 %48 
					                                                      OpStore %55 %54 
					                                 Private f32* %56 = OpAccessChain %17 %48 
					                                          f32 %57 = OpLoad %56 
					                                          f32 %58 = OpExtInst %1 13 %57 
					                                 Private f32* %59 = OpAccessChain %17 %48 
					                                                      OpStore %59 %58 
					                                 Private f32* %60 = OpAccessChain %17 %48 
					                                          f32 %61 = OpLoad %60 
					                                          f32 %63 = OpFMul %61 %62 
					                                 Private f32* %64 = OpAccessChain %17 %48 
					                                                      OpStore %64 %63 
					                                 Private f32* %65 = OpAccessChain %17 %48 
					                                          f32 %66 = OpLoad %65 
					                                          f32 %67 = OpExtInst %1 10 %66 
					                                 Private f32* %69 = OpAccessChain %9 %68 
					                                                      OpStore %69 %67 
					                                 Uniform f32* %70 = OpAccessChain %20 %22 
					                                          f32 %71 = OpLoad %70 
					                                          f32 %73 = OpFAdd %71 %72 
					                                 Private f32* %74 = OpAccessChain %30 %12 
					                                                      OpStore %74 %73 
					                                        f32_4 %75 = OpLoad %30 
					                                        f32_2 %76 = OpVectorShuffle %75 %75 1 3 
					                                          f32 %77 = OpDot %76 %53 
					                                 Private f32* %78 = OpAccessChain %17 %48 
					                                                      OpStore %78 %77 
					                                 Private f32* %79 = OpAccessChain %17 %48 
					                                          f32 %80 = OpLoad %79 
					                                          f32 %81 = OpExtInst %1 13 %80 
					                                 Private f32* %82 = OpAccessChain %17 %48 
					                                                      OpStore %82 %81 
					                                 Private f32* %83 = OpAccessChain %17 %48 
					                                          f32 %84 = OpLoad %83 
					                                          f32 %85 = OpFMul %84 %62 
					                                 Private f32* %86 = OpAccessChain %17 %48 
					                                                      OpStore %86 %85 
					                                 Private f32* %87 = OpAccessChain %17 %48 
					                                          f32 %88 = OpLoad %87 
					                                          f32 %89 = OpExtInst %1 10 %88 
					                                 Private f32* %90 = OpAccessChain %9 %28 
					                                                      OpStore %90 %89 
					                                 Uniform f32* %91 = OpAccessChain %20 %22 
					                                          f32 %92 = OpLoad %91 
					                                 Private f32* %93 = OpAccessChain %30 %68 
					                                                      OpStore %93 %92 
					                                        f32_4 %94 = OpLoad %30 
					                                        f32_2 %95 = OpVectorShuffle %94 %94 1 2 
					                                          f32 %96 = OpDot %95 %53 
					                                 Private f32* %97 = OpAccessChain %17 %48 
					                                                      OpStore %97 %96 
					                                        f32_4 %98 = OpLoad %30 
					                                        f32_2 %99 = OpVectorShuffle %98 %98 2 1 
					                                         f32 %100 = OpDot %99 %53 
					                                Private f32* %101 = OpAccessChain %17 %28 
					                                                      OpStore %101 %100 
					                                       f32_2 %102 = OpLoad %17 
					                                       f32_2 %103 = OpExtInst %1 13 %102 
					                                                      OpStore %17 %103 
					                                       f32_2 %104 = OpLoad %17 
					                                       f32_2 %106 = OpFMul %104 %105 
					                                                      OpStore %17 %106 
					                                Private f32* %108 = OpAccessChain %17 %28 
					                                         f32 %109 = OpLoad %108 
					                                         f32 %110 = OpExtInst %1 10 %109 
					                                                      OpStore %107 %110 
					                                         f32 %111 = OpLoad %107 
					                                         f32 %113 = OpFAdd %111 %112 
					                                                      OpStore %107 %113 
					                                         f32 %114 = OpLoad %107 
					                                Uniform f32* %116 = OpAccessChain %20 %115 
					                                         f32 %117 = OpLoad %116 
					                                         f32 %118 = OpFDiv %114 %117 
					                                                      OpStore %107 %118 
					                                         f32 %120 = OpLoad %107 
					                                Private f32* %121 = OpAccessChain %30 %48 
					                                         f32 %122 = OpLoad %121 
					                                         f32 %123 = OpFAdd %120 %122 
					                                Private f32* %124 = OpAccessChain %119 %48 
					                                                      OpStore %124 %123 
					                                Private f32* %125 = OpAccessChain %30 %28 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpFNegate %126 
					                                         f32 %128 = OpFAdd %127 %72 
					                                                      OpStore %107 %128 
					                                Uniform f32* %129 = OpAccessChain %20 %22 
					                                         f32 %130 = OpLoad %129 
					                                Uniform f32* %132 = OpAccessChain %20 %131 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFMul %130 %133 
					                                         f32 %135 = OpLoad %107 
					                                         f32 %136 = OpFAdd %134 %135 
					                                                      OpStore %107 %136 
					                                Private f32* %137 = OpAccessChain %17 %48 
					                                         f32 %138 = OpLoad %137 
					                                         f32 %139 = OpExtInst %1 10 %138 
					                                Private f32* %140 = OpAccessChain %9 %48 
					                                                      OpStore %140 %139 
					                                       f32_4 %141 = OpLoad %9 
					                                       f32_4 %143 = OpFAdd %141 %142 
					                                                      OpStore %9 %143 
					                                         f32 %144 = OpLoad %107 
					                                         f32 %145 = OpExtInst %1 8 %144 
					                                Private f32* %146 = OpAccessChain %17 %48 
					                                                      OpStore %146 %145 
					                                Private f32* %147 = OpAccessChain %17 %48 
					                                         f32 %148 = OpLoad %147 
					                                         f32 %149 = OpFNegate %148 
					                                         f32 %150 = OpLoad %107 
					                                         f32 %151 = OpFAdd %149 %150 
					                                Private f32* %152 = OpAccessChain %17 %48 
					                                                      OpStore %152 %151 
					                                Uniform f32* %153 = OpAccessChain %20 %22 
					                                         f32 %154 = OpLoad %153 
					                                       f32_2 %155 = OpCompositeConstruct %154 %154 
					                                         f32 %156 = OpDot %155 %53 
					                                                      OpStore %107 %156 
					                                         f32 %157 = OpLoad %107 
					                                         f32 %158 = OpExtInst %1 13 %157 
					                                                      OpStore %107 %158 
					                                         f32 %159 = OpLoad %107 
					                                         f32 %160 = OpFMul %159 %62 
					                                                      OpStore %107 %160 
					                                         f32 %161 = OpLoad %107 
					                                         f32 %162 = OpExtInst %1 10 %161 
					                                                      OpStore %107 %162 
					                                         f32 %163 = OpLoad %107 
					                                         f32 %164 = OpFAdd %163 %112 
					                                                      OpStore %107 %164 
					                                         f32 %165 = OpLoad %107 
					                                Uniform f32* %167 = OpAccessChain %20 %166 
					                                         f32 %168 = OpLoad %167 
					                                         f32 %169 = OpFDiv %165 %168 
					                                                      OpStore %107 %169 
					                                         f32 %170 = OpLoad %107 
					                                Private f32* %171 = OpAccessChain %17 %48 
					                                         f32 %172 = OpLoad %171 
					                                         f32 %173 = OpFAdd %170 %172 
					                                Private f32* %174 = OpAccessChain %17 %48 
					                                                      OpStore %174 %173 
					                                Private f32* %175 = OpAccessChain %17 %48 
					                                         f32 %176 = OpLoad %175 
					                                         f32 %177 = OpFNegate %176 
					                                         f32 %178 = OpFAdd %177 %72 
					                                Private f32* %179 = OpAccessChain %119 %28 
					                                                      OpStore %179 %178 
					                                Private f32* %180 = OpAccessChain %17 %48 
					                                         f32 %181 = OpLoad %180 
					                                         f32 %183 = OpFMul %181 %182 
					                                Private f32* %184 = OpAccessChain %17 %48 
					                                                      OpStore %184 %183 
					                                Private f32* %185 = OpAccessChain %17 %48 
					                                         f32 %186 = OpLoad %185 
					                                         f32 %187 = OpExtInst %1 8 %186 
					                                Private f32* %188 = OpAccessChain %17 %48 
					                                                      OpStore %188 %187 
					                         read_only Texture2D %193 = OpLoad %192 
					                                     sampler %197 = OpLoad %196 
					                  read_only Texture2DSampled %199 = OpSampledImage %193 %197 
					                                       f32_2 %200 = OpLoad %119 
					                                       f32_4 %201 = OpImageSampleImplicitLod %199 %200 
					                                                      OpStore %189 %201 
					                                       f32_2 %203 = OpLoad %119 
					                                       f32_2 %204 = OpVectorShuffle %203 %203 1 1 
					                                       f32_2 %205 = OpFNegate %204 
					                                       f32_2 %209 = OpFMul %205 %208 
					                                       f32_2 %213 = OpFAdd %209 %212 
					                                                      OpStore %202 %213 
					                                Private f32* %214 = OpAccessChain %119 %48 
					                                         f32 %215 = OpLoad %214 
					                                         f32 %217 = OpFMul %215 %216 
					                                Private f32* %218 = OpAccessChain %119 %48 
					                                                      OpStore %218 %217 
					                                Private f32* %219 = OpAccessChain %119 %48 
					                                         f32 %220 = OpLoad %219 
					                                         f32 %221 = OpExtInst %1 8 %220 
					                                Private f32* %222 = OpAccessChain %17 %28 
					                                                      OpStore %222 %221 
					                                       f32_4 %223 = OpLoad %9 
					                                       f32_4 %226 = OpFMul %223 %225 
					                                       f32_4 %227 = OpLoad %189 
					                                       f32_4 %228 = OpFAdd %226 %227 
					                                                      OpStore %9 %228 
					                                       f32_4 %229 = OpLoad %9 
					                                Uniform f32* %231 = OpAccessChain %20 %230 
					                                         f32 %232 = OpLoad %231 
					                                       f32_4 %233 = OpCompositeConstruct %232 %232 %232 %232 
					                                       f32_4 %234 = OpFAdd %229 %233 
					                                                      OpStore %30 %234 
					                                Uniform f32* %235 = OpAccessChain %20 %22 
					                                         f32 %236 = OpLoad %235 
					                                Private f32* %237 = OpAccessChain %119 %48 
					                                                      OpStore %237 %236 
					                                Private f32* %238 = OpAccessChain %119 %28 
					                                                      OpStore %238 %10 
					                                       f32_2 %239 = OpLoad %17 
					                                       f32_2 %240 = OpLoad %119 
					                                       f32_2 %241 = OpFAdd %239 %240 
					                                                      OpStore %17 %241 
					                                       f32_2 %242 = OpLoad %17 
					                                         f32 %243 = OpDot %242 %53 
					                                Private f32* %244 = OpAccessChain %17 %48 
					                                                      OpStore %244 %243 
					                                Private f32* %245 = OpAccessChain %17 %48 
					                                         f32 %246 = OpLoad %245 
					                                         f32 %247 = OpExtInst %1 13 %246 
					                                Private f32* %248 = OpAccessChain %17 %48 
					                                                      OpStore %248 %247 
					                                Private f32* %249 = OpAccessChain %17 %48 
					                                         f32 %250 = OpLoad %249 
					                                         f32 %251 = OpFMul %250 %62 
					                                Private f32* %252 = OpAccessChain %17 %48 
					                                                      OpStore %252 %251 
					                                Private f32* %253 = OpAccessChain %17 %48 
					                                         f32 %254 = OpLoad %253 
					                                         f32 %255 = OpExtInst %1 10 %254 
					                                Private f32* %256 = OpAccessChain %17 %48 
					                                                      OpStore %256 %255 
					                                Private f32* %260 = OpAccessChain %202 %48 
					                                         f32 %261 = OpLoad %260 
					                                Private f32* %262 = OpAccessChain %17 %48 
					                                         f32 %263 = OpLoad %262 
					                                        bool %264 = OpFOrdLessThan %261 %263 
					                                                      OpStore %259 %264 
					                                Private f32* %266 = OpAccessChain %17 %48 
					                                         f32 %267 = OpLoad %266 
					                                Private f32* %268 = OpAccessChain %202 %28 
					                                         f32 %269 = OpLoad %268 
					                                        bool %270 = OpFOrdLessThan %267 %269 
					                                                      OpStore %265 %270 
					                                        bool %271 = OpLoad %265 
					                                        bool %272 = OpLoad %259 
					                                        bool %273 = OpLogicalOr %271 %272 
					                                                      OpStore %265 %273 
					                                        bool %276 = OpLoad %265 
					                                       f32_4 %277 = OpLoad %9 
					                                       f32_4 %278 = OpLoad %30 
					                                      bool_4 %280 = OpCompositeConstruct %276 %276 %276 %276 
					                                       f32_4 %281 = OpSelect %280 %277 %278 
					                                                      OpStore %275 %281 
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
						vec4 unused_0_6;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					float u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat9;
					void main()
					{
					    u_xlat0.w = 0.0;
					    u_xlat1.y = _TimeX + 2.0;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = u_xlat2.y;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(11.9898005, 75.1330032));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43528.1484;
					    u_xlat0.z = fract(u_xlat1.x);
					    u_xlat2.w = _TimeX + 1.0;
					    u_xlat1.x = dot(u_xlat2.yw, vec2(11.9898005, 75.1330032));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43528.1484;
					    u_xlat0.y = fract(u_xlat1.x);
					    u_xlat2.z = _TimeX;
					    u_xlat1.x = dot(u_xlat2.yz, vec2(11.9898005, 75.1330032));
					    u_xlat1.y = dot(u_xlat2.zy, vec2(11.9898005, 75.1330032));
					    u_xlat1.xy = sin(u_xlat1.xy);
					    u_xlat1.xy = u_xlat1.xy * vec2(43528.1484, 43528.1484);
					    u_xlat5 = fract(u_xlat1.y);
					    u_xlat5 = u_xlat5 + -0.5;
					    u_xlat5 = u_xlat5 / _Value;
					    u_xlat3.x = u_xlat5 + u_xlat2.x;
					    u_xlat5 = (-u_xlat2.y) + 1.0;
					    u_xlat5 = _TimeX * _Value3 + u_xlat5;
					    u_xlat0.x = fract(u_xlat1.x);
					    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat1.x = floor(u_xlat5);
					    u_xlat1.x = (-u_xlat1.x) + u_xlat5;
					    u_xlat5 = dot(vec2(_TimeX), vec2(11.9898005, 75.1330032));
					    u_xlat5 = sin(u_xlat5);
					    u_xlat5 = u_xlat5 * 43528.1484;
					    u_xlat5 = fract(u_xlat5);
					    u_xlat5 = u_xlat5 + -0.5;
					    u_xlat5 = u_xlat5 / _Value2;
					    u_xlat1.x = u_xlat5 + u_xlat1.x;
					    u_xlat3.y = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = u_xlat1.x * 80.0;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat9.xy = (-u_xlat3.yy) * vec2(30.0, 5.0) + vec2(11.5, 1.5);
					    u_xlat3.x = u_xlat3.x * 50.0;
					    u_xlat1.y = floor(u_xlat3.x);
					    u_xlat0 = u_xlat0 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat10_2;
					    u_xlat2 = u_xlat0 + vec4(_Value4);
					    u_xlat3.x = _TimeX;
					    u_xlat3.y = 0.0;
					    u_xlat1.xy = u_xlat1.xy + u_xlat3.xy;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(11.9898005, 75.1330032));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43528.1484;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlatb5 = u_xlat9.x<u_xlat1.x;
					    u_xlatb1 = u_xlat1.x<u_xlat9.y;
					    u_xlatb1 = u_xlatb1 || u_xlatb5;
					    SV_Target0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
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