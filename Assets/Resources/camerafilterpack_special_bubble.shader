Shader "CameraFilterPack/Special_Bubble" {
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
			GpuProgramID 35731
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(9.0, 3.0, 5.69999981, 1.89999998);
					    u_xlat1.xy = cos(u_xlat0.yw);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.xy = u_xlat9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + (-vec2(_Value, _Value2));
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + u_xlat2.yy;
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat0.xz = u_xlat0.xz * vec2(0.150000006, 0.200000003) + u_xlat2.xx;
					    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz + u_xlat1.xy;
					    u_xlat0.xz = sqrt(u_xlat0.xz);
					    u_xlat0.xz = vec2(1.0, 1.0) / u_xlat0.xz;
					    u_xlat0.xy = u_xlat0.yw * u_xlat0.xz;
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat3 = vec4(_TimeX) * vec4(1.80000007, 0.600000024, 3.89999986, 1.29999995);
					    u_xlat4.xy = cos(u_xlat3.yw);
					    u_xlat3 = sin(u_xlat3);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.400000006, 0.600000024) + u_xlat2.yy;
					    u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
					    u_xlat1.xy = u_xlat3.xz * vec2(0.170000002, 0.140000001) + u_xlat2.xx;
					    u_xlat4.xy = u_xlat1.xy * u_xlat1.xy + u_xlat4.xy;
					    u_xlat4.xy = sqrt(u_xlat4.xy);
					    u_xlat4.xy = vec2(1.0, 1.0) / u_xlat4.xy;
					    u_xlat0.x = u_xlat4.x * u_xlat3.y + u_xlat0.x;
					    u_xlat0.x = u_xlat4.y * u_xlat3.w + u_xlat0.x;
					    u_xlat4.xy = vec2(_TimeX) * vec2(5.39999962, 1.79999995);
					    u_xlat12 = cos(u_xlat4.y);
					    u_xlat4.xy = sin(u_xlat4.xy);
					    u_xlat12 = u_xlat12 * 0.5 + u_xlat2.y;
					    u_xlat4.x = u_xlat4.x * 0.140000001 + u_xlat2.x;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat4.x = u_xlat4.x * u_xlat4.x + u_xlat12;
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = float(1.0) / u_xlat4.x;
					    u_xlat0.x = u_xlat4.x * u_xlat4.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.03125;
					    u_xlat0.xy = u_xlat9.xy * vec2(0.800000012, 0.800000012) + (-u_xlat0.xx);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					; Bound: 287
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %35 %280 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpMemberDecorate %10 0 Offset 10 
					                                                     OpMemberDecorate %10 1 Offset 10 
					                                                     OpMemberDecorate %10 2 Offset 10 
					                                                     OpMemberDecorate %10 3 Offset 10 
					                                                     OpMemberDecorate %10 4 RelaxedPrecision 
					                                                     OpMemberDecorate %10 4 Offset 10 
					                                                     OpDecorate %10 Block 
					                                                     OpDecorate %12 DescriptorSet 12 
					                                                     OpDecorate %12 Binding 12 
					                                                     OpDecorate vs_TEXCOORD0 Location 35 
					                                                     OpDecorate %40 RelaxedPrecision 
					                                                     OpDecorate %41 RelaxedPrecision 
					                                                     OpDecorate %44 RelaxedPrecision 
					                                                     OpDecorate %45 RelaxedPrecision 
					                                                     OpDecorate %264 RelaxedPrecision 
					                                                     OpDecorate %267 RelaxedPrecision 
					                                                     OpDecorate %267 DescriptorSet 267 
					                                                     OpDecorate %267 Binding 267 
					                                                     OpDecorate %268 RelaxedPrecision 
					                                                     OpDecorate %271 RelaxedPrecision 
					                                                     OpDecorate %271 DescriptorSet 271 
					                                                     OpDecorate %271 Binding 271 
					                                                     OpDecorate %272 RelaxedPrecision 
					                                                     OpDecorate %278 RelaxedPrecision 
					                                                     OpDecorate %280 Location 280 
					                                                     OpDecorate %281 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypeStruct %6 %6 %6 %6 %7 
					                                             %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                             %13 = OpTypeInt 32 1 
					                                         i32 %14 = OpConstant 0 
					                                             %15 = OpTypePointer Uniform %6 
					                                         f32 %19 = OpConstant 3,674022E-40 
					                                         f32 %20 = OpConstant 3,674022E-40 
					                                         f32 %21 = OpConstant 3,674022E-40 
					                                         f32 %22 = OpConstant 3,674022E-40 
					                                       f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
					                                             %25 = OpTypeVector %6 2 
					                                             %26 = OpTypePointer Private %25 
					                              Private f32_2* %27 = OpVariable Private 
					                              Private f32_2* %33 = OpVariable Private 
					                                             %34 = OpTypePointer Input %25 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %37 = OpConstant 4 
					                                             %38 = OpTypePointer Uniform %7 
					                              Private f32_2* %47 = OpVariable Private 
					                                         f32 %49 = OpConstant 3,674022E-40 
					                                       f32_2 %50 = OpConstantComposite %49 %49 
					                                         f32 %52 = OpConstant 3,674022E-40 
					                                       f32_2 %53 = OpConstantComposite %52 %52 
					                                         i32 %57 = OpConstant 1 
					                                         i32 %60 = OpConstant 2 
					                                         f32 %67 = OpConstant 3,674022E-40 
					                                       f32_2 %68 = OpConstantComposite %67 %67 
					                                         f32 %78 = OpConstant 3,674022E-40 
					                                         f32 %79 = OpConstant 3,674022E-40 
					                                       f32_2 %80 = OpConstantComposite %78 %79 
					                                        f32 %101 = OpConstant 3,674022E-40 
					                                      f32_2 %102 = OpConstantComposite %101 %101 
					                                            %115 = OpTypeInt 32 0 
					                                        u32 %116 = OpConstant 1 
					                                            %117 = OpTypePointer Private %6 
					                                        u32 %120 = OpConstant 0 
					                             Private f32_4* %125 = OpVariable Private 
					                                        f32 %129 = OpConstant 3,674022E-40 
					                                        f32 %130 = OpConstant 3,674022E-40 
					                                        f32 %131 = OpConstant 3,674022E-40 
					                                        f32 %132 = OpConstant 3,674022E-40 
					                                      f32_4 %133 = OpConstantComposite %129 %130 %131 %132 
					                             Private f32_2* %135 = OpVariable Private 
					                                        f32 %142 = OpConstant 3,674022E-40 
					                                      f32_2 %143 = OpConstantComposite %142 %130 
					                                        f32 %153 = OpConstant 3,674022E-40 
					                                        f32 %154 = OpConstant 3,674022E-40 
					                                      f32_2 %155 = OpConstantComposite %153 %154 
					                                        u32 %180 = OpConstant 3 
					                                        f32 %191 = OpConstant 3,674022E-40 
					                                        f32 %192 = OpConstant 3,674022E-40 
					                                      f32_2 %193 = OpConstantComposite %191 %192 
					                               Private f32* %195 = OpVariable Private 
					                                        f32 %202 = OpConstant 3,674022E-40 
					                                        i32 %244 = OpConstant 3 
					                                        f32 %251 = OpConstant 3,674022E-40 
					                                            %262 = OpTypeVector %6 3 
					                                            %263 = OpTypePointer Private %262 
					                             Private f32_3* %264 = OpVariable Private 
					                                            %265 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %266 = OpTypePointer UniformConstant %265 
					       UniformConstant read_only Texture2D* %267 = OpVariable UniformConstant 
					                                            %269 = OpTypeSampler 
					                                            %270 = OpTypePointer UniformConstant %269 
					                   UniformConstant sampler* %271 = OpVariable UniformConstant 
					                                            %273 = OpTypeSampledImage %265 
					                                            %279 = OpTypePointer Output %7 
					                              Output f32_4* %280 = OpVariable Output 
					                                            %284 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                Uniform f32* %16 = OpAccessChain %12 %14 
					                                         f32 %17 = OpLoad %16 
					                                       f32_4 %18 = OpCompositeConstruct %17 %17 %17 %17 
					                                       f32_4 %24 = OpFMul %18 %23 
					                                                     OpStore %9 %24 
					                                       f32_4 %28 = OpLoad %9 
					                                       f32_2 %29 = OpVectorShuffle %28 %28 1 3 
					                                       f32_2 %30 = OpExtInst %1 14 %29 
					                                                     OpStore %27 %30 
					                                       f32_4 %31 = OpLoad %9 
					                                       f32_4 %32 = OpExtInst %1 13 %31 
					                                                     OpStore %9 %32 
					                                       f32_2 %36 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %39 = OpAccessChain %12 %37 
					                                       f32_4 %40 = OpLoad %39 
					                                       f32_2 %41 = OpVectorShuffle %40 %40 0 1 
					                                       f32_2 %42 = OpFMul %36 %41 
					                              Uniform f32_4* %43 = OpAccessChain %12 %37 
					                                       f32_4 %44 = OpLoad %43 
					                                       f32_2 %45 = OpVectorShuffle %44 %44 2 3 
					                                       f32_2 %46 = OpFAdd %42 %45 
					                                                     OpStore %33 %46 
					                                       f32_2 %48 = OpLoad %33 
					                                       f32_2 %51 = OpFMul %48 %50 
					                                       f32_2 %54 = OpFAdd %51 %53 
					                                                     OpStore %47 %54 
					                                       f32_2 %55 = OpLoad %47 
					                                       f32_2 %56 = OpFMul %55 %50 
					                                Uniform f32* %58 = OpAccessChain %12 %57 
					                                         f32 %59 = OpLoad %58 
					                                Uniform f32* %61 = OpAccessChain %12 %60 
					                                         f32 %62 = OpLoad %61 
					                                       f32_2 %63 = OpCompositeConstruct %59 %62 
					                                       f32_2 %64 = OpFNegate %63 
					                                       f32_2 %65 = OpFAdd %56 %64 
					                                                     OpStore %47 %65 
					                                       f32_2 %66 = OpLoad %27 
					                                       f32_2 %69 = OpFMul %66 %68 
					                                       f32_2 %70 = OpLoad %47 
					                                       f32_2 %71 = OpVectorShuffle %70 %70 1 1 
					                                       f32_2 %72 = OpFAdd %69 %71 
					                                                     OpStore %27 %72 
					                                       f32_2 %73 = OpLoad %27 
					                                       f32_2 %74 = OpLoad %27 
					                                       f32_2 %75 = OpFMul %73 %74 
					                                                     OpStore %27 %75 
					                                       f32_4 %76 = OpLoad %9 
					                                       f32_2 %77 = OpVectorShuffle %76 %76 0 2 
					                                       f32_2 %81 = OpFMul %77 %80 
					                                       f32_2 %82 = OpLoad %47 
					                                       f32_2 %83 = OpVectorShuffle %82 %82 0 0 
					                                       f32_2 %84 = OpFAdd %81 %83 
					                                       f32_4 %85 = OpLoad %9 
					                                       f32_4 %86 = OpVectorShuffle %85 %84 4 1 5 3 
					                                                     OpStore %9 %86 
					                                       f32_4 %87 = OpLoad %9 
					                                       f32_2 %88 = OpVectorShuffle %87 %87 0 2 
					                                       f32_4 %89 = OpLoad %9 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 2 
					                                       f32_2 %91 = OpFMul %88 %90 
					                                       f32_2 %92 = OpLoad %27 
					                                       f32_2 %93 = OpFAdd %91 %92 
					                                       f32_4 %94 = OpLoad %9 
					                                       f32_4 %95 = OpVectorShuffle %94 %93 4 1 5 3 
					                                                     OpStore %9 %95 
					                                       f32_4 %96 = OpLoad %9 
					                                       f32_2 %97 = OpVectorShuffle %96 %96 0 2 
					                                       f32_2 %98 = OpExtInst %1 31 %97 
					                                       f32_4 %99 = OpLoad %9 
					                                      f32_4 %100 = OpVectorShuffle %99 %98 4 1 5 3 
					                                                     OpStore %9 %100 
					                                      f32_4 %103 = OpLoad %9 
					                                      f32_2 %104 = OpVectorShuffle %103 %103 0 2 
					                                      f32_2 %105 = OpFDiv %102 %104 
					                                      f32_4 %106 = OpLoad %9 
					                                      f32_4 %107 = OpVectorShuffle %106 %105 4 1 5 3 
					                                                     OpStore %9 %107 
					                                      f32_4 %108 = OpLoad %9 
					                                      f32_2 %109 = OpVectorShuffle %108 %108 1 3 
					                                      f32_4 %110 = OpLoad %9 
					                                      f32_2 %111 = OpVectorShuffle %110 %110 0 2 
					                                      f32_2 %112 = OpFMul %109 %111 
					                                      f32_4 %113 = OpLoad %9 
					                                      f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
					                                                     OpStore %9 %114 
					                               Private f32* %118 = OpAccessChain %9 %116 
					                                        f32 %119 = OpLoad %118 
					                               Private f32* %121 = OpAccessChain %9 %120 
					                                        f32 %122 = OpLoad %121 
					                                        f32 %123 = OpFAdd %119 %122 
					                               Private f32* %124 = OpAccessChain %9 %120 
					                                                     OpStore %124 %123 
					                               Uniform f32* %126 = OpAccessChain %12 %14 
					                                        f32 %127 = OpLoad %126 
					                                      f32_4 %128 = OpCompositeConstruct %127 %127 %127 %127 
					                                      f32_4 %134 = OpFMul %128 %133 
					                                                     OpStore %125 %134 
					                                      f32_4 %136 = OpLoad %125 
					                                      f32_2 %137 = OpVectorShuffle %136 %136 1 3 
					                                      f32_2 %138 = OpExtInst %1 14 %137 
					                                                     OpStore %135 %138 
					                                      f32_4 %139 = OpLoad %125 
					                                      f32_4 %140 = OpExtInst %1 13 %139 
					                                                     OpStore %125 %140 
					                                      f32_2 %141 = OpLoad %135 
					                                      f32_2 %144 = OpFMul %141 %143 
					                                      f32_2 %145 = OpLoad %47 
					                                      f32_2 %146 = OpVectorShuffle %145 %145 1 1 
					                                      f32_2 %147 = OpFAdd %144 %146 
					                                                     OpStore %135 %147 
					                                      f32_2 %148 = OpLoad %135 
					                                      f32_2 %149 = OpLoad %135 
					                                      f32_2 %150 = OpFMul %148 %149 
					                                                     OpStore %135 %150 
					                                      f32_4 %151 = OpLoad %125 
					                                      f32_2 %152 = OpVectorShuffle %151 %151 0 2 
					                                      f32_2 %156 = OpFMul %152 %155 
					                                      f32_2 %157 = OpLoad %47 
					                                      f32_2 %158 = OpVectorShuffle %157 %157 0 0 
					                                      f32_2 %159 = OpFAdd %156 %158 
					                                                     OpStore %27 %159 
					                                      f32_2 %160 = OpLoad %27 
					                                      f32_2 %161 = OpLoad %27 
					                                      f32_2 %162 = OpFMul %160 %161 
					                                      f32_2 %163 = OpLoad %135 
					                                      f32_2 %164 = OpFAdd %162 %163 
					                                                     OpStore %135 %164 
					                                      f32_2 %165 = OpLoad %135 
					                                      f32_2 %166 = OpExtInst %1 31 %165 
					                                                     OpStore %135 %166 
					                                      f32_2 %167 = OpLoad %135 
					                                      f32_2 %168 = OpFDiv %102 %167 
					                                                     OpStore %135 %168 
					                               Private f32* %169 = OpAccessChain %135 %120 
					                                        f32 %170 = OpLoad %169 
					                               Private f32* %171 = OpAccessChain %125 %116 
					                                        f32 %172 = OpLoad %171 
					                                        f32 %173 = OpFMul %170 %172 
					                               Private f32* %174 = OpAccessChain %9 %120 
					                                        f32 %175 = OpLoad %174 
					                                        f32 %176 = OpFAdd %173 %175 
					                               Private f32* %177 = OpAccessChain %9 %120 
					                                                     OpStore %177 %176 
					                               Private f32* %178 = OpAccessChain %135 %116 
					                                        f32 %179 = OpLoad %178 
					                               Private f32* %181 = OpAccessChain %125 %180 
					                                        f32 %182 = OpLoad %181 
					                                        f32 %183 = OpFMul %179 %182 
					                               Private f32* %184 = OpAccessChain %9 %120 
					                                        f32 %185 = OpLoad %184 
					                                        f32 %186 = OpFAdd %183 %185 
					                               Private f32* %187 = OpAccessChain %9 %120 
					                                                     OpStore %187 %186 
					                               Uniform f32* %188 = OpAccessChain %12 %14 
					                                        f32 %189 = OpLoad %188 
					                                      f32_2 %190 = OpCompositeConstruct %189 %189 
					                                      f32_2 %194 = OpFMul %190 %193 
					                                                     OpStore %135 %194 
					                               Private f32* %196 = OpAccessChain %135 %116 
					                                        f32 %197 = OpLoad %196 
					                                        f32 %198 = OpExtInst %1 14 %197 
					                                                     OpStore %195 %198 
					                                      f32_2 %199 = OpLoad %135 
					                                      f32_2 %200 = OpExtInst %1 13 %199 
					                                                     OpStore %135 %200 
					                                        f32 %201 = OpLoad %195 
					                                        f32 %203 = OpFMul %201 %202 
					                               Private f32* %204 = OpAccessChain %47 %116 
					                                        f32 %205 = OpLoad %204 
					                                        f32 %206 = OpFAdd %203 %205 
					                                                     OpStore %195 %206 
					                               Private f32* %207 = OpAccessChain %135 %120 
					                                        f32 %208 = OpLoad %207 
					                                        f32 %209 = OpFMul %208 %154 
					                               Private f32* %210 = OpAccessChain %47 %120 
					                                        f32 %211 = OpLoad %210 
					                                        f32 %212 = OpFAdd %209 %211 
					                               Private f32* %213 = OpAccessChain %135 %120 
					                                                     OpStore %213 %212 
					                                        f32 %214 = OpLoad %195 
					                                        f32 %215 = OpLoad %195 
					                                        f32 %216 = OpFMul %214 %215 
					                                                     OpStore %195 %216 
					                               Private f32* %217 = OpAccessChain %135 %120 
					                                        f32 %218 = OpLoad %217 
					                               Private f32* %219 = OpAccessChain %135 %120 
					                                        f32 %220 = OpLoad %219 
					                                        f32 %221 = OpFMul %218 %220 
					                                        f32 %222 = OpLoad %195 
					                                        f32 %223 = OpFAdd %221 %222 
					                               Private f32* %224 = OpAccessChain %135 %120 
					                                                     OpStore %224 %223 
					                               Private f32* %225 = OpAccessChain %135 %120 
					                                        f32 %226 = OpLoad %225 
					                                        f32 %227 = OpExtInst %1 31 %226 
					                               Private f32* %228 = OpAccessChain %135 %120 
					                                                     OpStore %228 %227 
					                               Private f32* %229 = OpAccessChain %135 %120 
					                                        f32 %230 = OpLoad %229 
					                                        f32 %231 = OpFDiv %101 %230 
					                               Private f32* %232 = OpAccessChain %135 %120 
					                                                     OpStore %232 %231 
					                               Private f32* %233 = OpAccessChain %135 %120 
					                                        f32 %234 = OpLoad %233 
					                               Private f32* %235 = OpAccessChain %135 %116 
					                                        f32 %236 = OpLoad %235 
					                                        f32 %237 = OpFMul %234 %236 
					                               Private f32* %238 = OpAccessChain %9 %120 
					                                        f32 %239 = OpLoad %238 
					                                        f32 %240 = OpFAdd %237 %239 
					                               Private f32* %241 = OpAccessChain %9 %120 
					                                                     OpStore %241 %240 
					                               Private f32* %242 = OpAccessChain %9 %120 
					                                        f32 %243 = OpLoad %242 
					                               Uniform f32* %245 = OpAccessChain %12 %244 
					                                        f32 %246 = OpLoad %245 
					                                        f32 %247 = OpFMul %243 %246 
					                               Private f32* %248 = OpAccessChain %9 %120 
					                                                     OpStore %248 %247 
					                               Private f32* %249 = OpAccessChain %9 %120 
					                                        f32 %250 = OpLoad %249 
					                                        f32 %252 = OpFMul %250 %251 
					                               Private f32* %253 = OpAccessChain %9 %120 
					                                                     OpStore %253 %252 
					                                      f32_2 %254 = OpLoad %33 
					                                      f32_2 %255 = OpFMul %254 %68 
					                                      f32_4 %256 = OpLoad %9 
					                                      f32_2 %257 = OpVectorShuffle %256 %256 0 0 
					                                      f32_2 %258 = OpFNegate %257 
					                                      f32_2 %259 = OpFAdd %255 %258 
					                                      f32_4 %260 = OpLoad %9 
					                                      f32_4 %261 = OpVectorShuffle %260 %259 4 5 2 3 
					                                                     OpStore %9 %261 
					                        read_only Texture2D %268 = OpLoad %267 
					                                    sampler %272 = OpLoad %271 
					                 read_only Texture2DSampled %274 = OpSampledImage %268 %272 
					                                      f32_4 %275 = OpLoad %9 
					                                      f32_2 %276 = OpVectorShuffle %275 %275 0 1 
					                                      f32_4 %277 = OpImageSampleImplicitLod %274 %276 
					                                      f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
					                                                     OpStore %264 %278 
					                                      f32_3 %281 = OpLoad %264 
					                                      f32_4 %282 = OpLoad %280 
					                                      f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
					                                                     OpStore %280 %283 
					                                Output f32* %285 = OpAccessChain %280 %180 
					                                                     OpStore %285 %101 
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
						vec4 unused_0_5;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(9.0, 3.0, 5.69999981, 1.89999998);
					    u_xlat1.xy = cos(u_xlat0.yw);
					    u_xlat0 = sin(u_xlat0);
					    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2.xy = u_xlat9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + (-vec2(_Value, _Value2));
					    u_xlat1.xy = u_xlat1.xy * vec2(0.800000012, 0.800000012) + u_xlat2.yy;
					    u_xlat1.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat0.xz = u_xlat0.xz * vec2(0.150000006, 0.200000003) + u_xlat2.xx;
					    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz + u_xlat1.xy;
					    u_xlat0.xz = sqrt(u_xlat0.xz);
					    u_xlat0.xz = vec2(1.0, 1.0) / u_xlat0.xz;
					    u_xlat0.xy = u_xlat0.yw * u_xlat0.xz;
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat3 = vec4(_TimeX) * vec4(1.80000007, 0.600000024, 3.89999986, 1.29999995);
					    u_xlat4.xy = cos(u_xlat3.yw);
					    u_xlat3 = sin(u_xlat3);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.400000006, 0.600000024) + u_xlat2.yy;
					    u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
					    u_xlat1.xy = u_xlat3.xz * vec2(0.170000002, 0.140000001) + u_xlat2.xx;
					    u_xlat4.xy = u_xlat1.xy * u_xlat1.xy + u_xlat4.xy;
					    u_xlat4.xy = sqrt(u_xlat4.xy);
					    u_xlat4.xy = vec2(1.0, 1.0) / u_xlat4.xy;
					    u_xlat0.x = u_xlat4.x * u_xlat3.y + u_xlat0.x;
					    u_xlat0.x = u_xlat4.y * u_xlat3.w + u_xlat0.x;
					    u_xlat4.xy = vec2(_TimeX) * vec2(5.39999962, 1.79999995);
					    u_xlat12 = cos(u_xlat4.y);
					    u_xlat4.xy = sin(u_xlat4.xy);
					    u_xlat12 = u_xlat12 * 0.5 + u_xlat2.y;
					    u_xlat4.x = u_xlat4.x * 0.140000001 + u_xlat2.x;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat4.x = u_xlat4.x * u_xlat4.x + u_xlat12;
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat4.x = float(1.0) / u_xlat4.x;
					    u_xlat0.x = u_xlat4.x * u_xlat4.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value3;
					    u_xlat0.x = u_xlat0.x * 0.03125;
					    u_xlat0.xy = u_xlat9.xy * vec2(0.800000012, 0.800000012) + (-u_xlat0.xx);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
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