Shader "CameraFilterPack/Vision_Crystal" {
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
			GpuProgramID 28106
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
					uniform 	vec4 _Time;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec2 u_xlatb0;
					vec4 u_xlat1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec2 u_xlat11;
					vec2 u_xlat12;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xyz = _Time.xxx * vec3(20.0, 20.0, 20.0) + vec3(0.0700000003, 0.140000001, 0.210000008);
					    u_xlat1.xyz = sin(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + vec3(vec3(_Value, _Value, _Value));
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = u_xlat2.xy + vec2(_Value2, _Value3);
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2.xy = u_xlat12.xy + vec2(-0.5, -0.5);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat2.xy = u_xlat2.xy / vec2(u_xlat15);
					    u_xlat11.xy = u_xlat1.zz * u_xlat2.xy;
					    u_xlat4 = u_xlat1.xxyy * u_xlat2.xyxy;
					    u_xlat0.xyz = vec3(u_xlat15) * vec3(9.0, 9.0, 9.0) + (-u_xlat0.xyz);
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat11.xy * abs(u_xlat0.zz) + u_xlat12.xy;
					    u_xlat2 = u_xlat4 * abs(u_xlat0.xxyy) + u_xlat12.xyxy;
					    u_xlatb0.xy = greaterThanEqual(u_xlat1.xyxx, (-u_xlat1.xyxx)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.y : (-u_xlat1.y);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = dot(abs(u_xlat0.xy), abs(u_xlat0.xy));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.z = 0.00999999978 / u_xlat0.x;
					    u_xlatb1 = greaterThanEqual(u_xlat2, (-u_xlat2));
					    u_xlat2 = fract(abs(u_xlat2));
					    u_xlat1.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat1.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat1.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
					    u_xlat1.w = (u_xlatb1.w) ? u_xlat2.w : (-u_xlat2.w);
					    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat1.x = dot(abs(u_xlat1.xy), abs(u_xlat1.xy));
					    u_xlat1.y = dot(abs(u_xlat1.zw), abs(u_xlat1.zw));
					    u_xlat1.xy = sqrt(u_xlat1.xy);
					    u_xlat0.xy = vec2(0.00999999978, 0.00999999978) / u_xlat1.xy;
					    u_xlat0.xyz = u_xlat10_3.xyz + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat15);
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
					; Bound: 338
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %58 %327 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 RelaxedPrecision 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 58 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %67 RelaxedPrecision 
					                                                      OpDecorate %83 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %86 DescriptorSet 86 
					                                                      OpDecorate %86 Binding 86 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %90 DescriptorSet 90 
					                                                      OpDecorate %90 Binding 90 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %97 RelaxedPrecision 
					                                                      OpDecorate %323 RelaxedPrecision 
					                                                      OpDecorate %327 Location 327 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %10 %6 %6 %6 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 0 
					                                              %16 = OpTypePointer Uniform %10 
					                                          f32 %20 = OpConstant 3,674022E-40 
					                                        f32_3 %21 = OpConstantComposite %20 %20 %20 
					                                          f32 %23 = OpConstant 3,674022E-40 
					                                          f32 %24 = OpConstant 3,674022E-40 
					                                          f32 %25 = OpConstant 3,674022E-40 
					                                        f32_3 %26 = OpConstantComposite %23 %24 %25 
					                                              %28 = OpTypePointer Private %10 
					                               Private f32_4* %29 = OpVariable Private 
					                                          i32 %39 = OpConstant 1 
					                                              %40 = OpTypePointer Uniform %6 
					                               Private f32_4* %55 = OpVariable Private 
					                                              %56 = OpTypeVector %6 2 
					                                              %57 = OpTypePointer Input %56 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %60 = OpConstant 4 
					                                              %71 = OpTypePointer Private %56 
					                               Private f32_2* %72 = OpVariable Private 
					                                          i32 %75 = OpConstant 2 
					                                          i32 %78 = OpConstant 3 
					                               Private f32_3* %83 = OpVariable Private 
					                                              %84 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %85 = OpTypePointer UniformConstant %84 
					         UniformConstant read_only Texture2D* %86 = OpVariable UniformConstant 
					                                              %88 = OpTypeSampler 
					                                              %89 = OpTypePointer UniformConstant %88 
					                     UniformConstant sampler* %90 = OpVariable UniformConstant 
					                                              %92 = OpTypeSampledImage %84 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                       f32_2 %100 = OpConstantComposite %99 %99 
					                                             %104 = OpTypePointer Private %6 
					                                Private f32* %105 = OpVariable Private 
					                              Private f32_2* %120 = OpVariable Private 
					                              Private f32_4* %126 = OpVariable Private 
					                                         f32 %134 = OpConstant 3,674022E-40 
					                                       f32_3 %135 = OpConstantComposite %134 %134 %134 
					                                             %159 = OpTypeBool 
					                                             %160 = OpTypeVector %159 2 
					                                             %161 = OpTypePointer Private %160 
					                             Private bool_2* %162 = OpVariable Private 
					                                             %168 = OpTypeVector %159 4 
					                                             %177 = OpTypeInt 32 0 
					                                         u32 %178 = OpConstant 0 
					                                             %179 = OpTypePointer Private %159 
					                                             %182 = OpTypePointer Function %6 
					                                         u32 %194 = OpConstant 1 
					                                         f32 %225 = OpConstant 3,674022E-40 
					                                         u32 %229 = OpConstant 2 
					                                             %231 = OpTypePointer Private %168 
					                             Private bool_4* %232 = OpVariable Private 
					                                         u32 %279 = OpConstant 3 
					                                       f32_4 %294 = OpConstantComposite %99 %99 %99 %99 
					                                       f32_2 %317 = OpConstantComposite %225 %225 
					                                             %326 = OpTypePointer Output %10 
					                               Output f32_4* %327 = OpVariable Output 
					                                         f32 %334 = OpConstant 3,674022E-40 
					                                             %335 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %183 = OpVariable Function 
					                               Function f32* %197 = OpVariable Function 
					                               Function f32* %242 = OpVariable Function 
					                               Function f32* %255 = OpVariable Function 
					                               Function f32* %268 = OpVariable Function 
					                               Function f32* %282 = OpVariable Function 
					                               Uniform f32_4* %17 = OpAccessChain %13 %15 
					                                        f32_4 %18 = OpLoad %17 
					                                        f32_3 %19 = OpVectorShuffle %18 %18 0 0 0 
					                                        f32_3 %22 = OpFMul %19 %21 
					                                        f32_3 %27 = OpFAdd %22 %26 
					                                                      OpStore %9 %27 
					                                        f32_3 %30 = OpLoad %9 
					                                        f32_3 %31 = OpExtInst %1 13 %30 
					                                        f32_4 %32 = OpLoad %29 
					                                        f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
					                                                      OpStore %29 %33 
					                                        f32_3 %34 = OpLoad %9 
					                                        f32_3 %35 = OpLoad %9 
					                                        f32_3 %36 = OpFAdd %34 %35 
					                                                      OpStore %9 %36 
					                                        f32_4 %37 = OpLoad %29 
					                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
					                                 Uniform f32* %41 = OpAccessChain %13 %39 
					                                          f32 %42 = OpLoad %41 
					                                 Uniform f32* %43 = OpAccessChain %13 %39 
					                                          f32 %44 = OpLoad %43 
					                                 Uniform f32* %45 = OpAccessChain %13 %39 
					                                          f32 %46 = OpLoad %45 
					                                        f32_3 %47 = OpCompositeConstruct %42 %44 %46 
					                                          f32 %48 = OpCompositeExtract %47 0 
					                                          f32 %49 = OpCompositeExtract %47 1 
					                                          f32 %50 = OpCompositeExtract %47 2 
					                                        f32_3 %51 = OpCompositeConstruct %48 %49 %50 
					                                        f32_3 %52 = OpFAdd %38 %51 
					                                        f32_4 %53 = OpLoad %29 
					                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
					                                                      OpStore %29 %54 
					                                        f32_2 %59 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %61 = OpAccessChain %13 %60 
					                                        f32_4 %62 = OpLoad %61 
					                                        f32_2 %63 = OpVectorShuffle %62 %62 0 1 
					                                        f32_2 %64 = OpFMul %59 %63 
					                               Uniform f32_4* %65 = OpAccessChain %13 %60 
					                                        f32_4 %66 = OpLoad %65 
					                                        f32_2 %67 = OpVectorShuffle %66 %66 2 3 
					                                        f32_2 %68 = OpFAdd %64 %67 
					                                        f32_4 %69 = OpLoad %55 
					                                        f32_4 %70 = OpVectorShuffle %69 %68 4 5 2 3 
					                                                      OpStore %55 %70 
					                                        f32_4 %73 = OpLoad %55 
					                                        f32_2 %74 = OpVectorShuffle %73 %73 0 1 
					                                 Uniform f32* %76 = OpAccessChain %13 %75 
					                                          f32 %77 = OpLoad %76 
					                                 Uniform f32* %79 = OpAccessChain %13 %78 
					                                          f32 %80 = OpLoad %79 
					                                        f32_2 %81 = OpCompositeConstruct %77 %80 
					                                        f32_2 %82 = OpFAdd %74 %81 
					                                                      OpStore %72 %82 
					                          read_only Texture2D %87 = OpLoad %86 
					                                      sampler %91 = OpLoad %90 
					                   read_only Texture2DSampled %93 = OpSampledImage %87 %91 
					                                        f32_4 %94 = OpLoad %55 
					                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
					                                        f32_4 %96 = OpImageSampleImplicitLod %93 %95 
					                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
					                                                      OpStore %83 %97 
					                                        f32_2 %98 = OpLoad %72 
					                                       f32_2 %101 = OpFAdd %98 %100 
					                                       f32_4 %102 = OpLoad %55 
					                                       f32_4 %103 = OpVectorShuffle %102 %101 4 5 2 3 
					                                                      OpStore %55 %103 
					                                       f32_4 %106 = OpLoad %55 
					                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
					                                       f32_4 %108 = OpLoad %55 
					                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
					                                         f32 %110 = OpDot %107 %109 
					                                                      OpStore %105 %110 
					                                         f32 %111 = OpLoad %105 
					                                         f32 %112 = OpExtInst %1 31 %111 
					                                                      OpStore %105 %112 
					                                       f32_4 %113 = OpLoad %55 
					                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
					                                         f32 %115 = OpLoad %105 
					                                       f32_2 %116 = OpCompositeConstruct %115 %115 
					                                       f32_2 %117 = OpFDiv %114 %116 
					                                       f32_4 %118 = OpLoad %55 
					                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 2 3 
					                                                      OpStore %55 %119 
					                                       f32_4 %121 = OpLoad %29 
					                                       f32_2 %122 = OpVectorShuffle %121 %121 2 2 
					                                       f32_4 %123 = OpLoad %55 
					                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
					                                       f32_2 %125 = OpFMul %122 %124 
					                                                      OpStore %120 %125 
					                                       f32_4 %127 = OpLoad %29 
					                                       f32_4 %128 = OpVectorShuffle %127 %127 0 0 1 1 
					                                       f32_4 %129 = OpLoad %55 
					                                       f32_4 %130 = OpVectorShuffle %129 %129 0 1 0 1 
					                                       f32_4 %131 = OpFMul %128 %130 
					                                                      OpStore %126 %131 
					                                         f32 %132 = OpLoad %105 
					                                       f32_3 %133 = OpCompositeConstruct %132 %132 %132 
					                                       f32_3 %136 = OpFMul %133 %135 
					                                       f32_3 %137 = OpLoad %9 
					                                       f32_3 %138 = OpFNegate %137 
					                                       f32_3 %139 = OpFAdd %136 %138 
					                                                      OpStore %9 %139 
					                                       f32_3 %140 = OpLoad %9 
					                                       f32_3 %141 = OpExtInst %1 13 %140 
					                                                      OpStore %9 %141 
					                                       f32_2 %142 = OpLoad %120 
					                                       f32_3 %143 = OpLoad %9 
					                                       f32_2 %144 = OpVectorShuffle %143 %143 2 2 
					                                       f32_2 %145 = OpExtInst %1 4 %144 
					                                       f32_2 %146 = OpFMul %142 %145 
					                                       f32_2 %147 = OpLoad %72 
					                                       f32_2 %148 = OpFAdd %146 %147 
					                                       f32_4 %149 = OpLoad %29 
					                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 2 3 
					                                                      OpStore %29 %150 
					                                       f32_4 %151 = OpLoad %126 
					                                       f32_3 %152 = OpLoad %9 
					                                       f32_4 %153 = OpVectorShuffle %152 %152 0 0 1 1 
					                                       f32_4 %154 = OpExtInst %1 4 %153 
					                                       f32_4 %155 = OpFMul %151 %154 
					                                       f32_2 %156 = OpLoad %72 
					                                       f32_4 %157 = OpVectorShuffle %156 %156 0 1 0 1 
					                                       f32_4 %158 = OpFAdd %155 %157 
					                                                      OpStore %55 %158 
					                                       f32_4 %163 = OpLoad %29 
					                                       f32_4 %164 = OpVectorShuffle %163 %163 0 1 0 0 
					                                       f32_4 %165 = OpLoad %29 
					                                       f32_4 %166 = OpVectorShuffle %165 %165 0 1 0 0 
					                                       f32_4 %167 = OpFNegate %166 
					                                      bool_4 %169 = OpFOrdGreaterThanEqual %164 %167 
					                                      bool_2 %170 = OpVectorShuffle %169 %169 0 1 
					                                                      OpStore %162 %170 
					                                       f32_4 %171 = OpLoad %29 
					                                       f32_2 %172 = OpVectorShuffle %171 %171 0 1 
					                                       f32_2 %173 = OpExtInst %1 4 %172 
					                                       f32_2 %174 = OpExtInst %1 10 %173 
					                                       f32_4 %175 = OpLoad %29 
					                                       f32_4 %176 = OpVectorShuffle %175 %174 4 5 2 3 
					                                                      OpStore %29 %176 
					                               Private bool* %180 = OpAccessChain %162 %178 
					                                        bool %181 = OpLoad %180 
					                                                      OpSelectionMerge %185 None 
					                                                      OpBranchConditional %181 %184 %188 
					                                             %184 = OpLabel 
					                                Private f32* %186 = OpAccessChain %29 %178 
					                                         f32 %187 = OpLoad %186 
					                                                      OpStore %183 %187 
					                                                      OpBranch %185 
					                                             %188 = OpLabel 
					                                Private f32* %189 = OpAccessChain %29 %178 
					                                         f32 %190 = OpLoad %189 
					                                         f32 %191 = OpFNegate %190 
					                                                      OpStore %183 %191 
					                                                      OpBranch %185 
					                                             %185 = OpLabel 
					                                         f32 %192 = OpLoad %183 
					                                Private f32* %193 = OpAccessChain %9 %178 
					                                                      OpStore %193 %192 
					                               Private bool* %195 = OpAccessChain %162 %194 
					                                        bool %196 = OpLoad %195 
					                                                      OpSelectionMerge %199 None 
					                                                      OpBranchConditional %196 %198 %202 
					                                             %198 = OpLabel 
					                                Private f32* %200 = OpAccessChain %29 %194 
					                                         f32 %201 = OpLoad %200 
					                                                      OpStore %197 %201 
					                                                      OpBranch %199 
					                                             %202 = OpLabel 
					                                Private f32* %203 = OpAccessChain %29 %194 
					                                         f32 %204 = OpLoad %203 
					                                         f32 %205 = OpFNegate %204 
					                                                      OpStore %197 %205 
					                                                      OpBranch %199 
					                                             %199 = OpLabel 
					                                         f32 %206 = OpLoad %197 
					                                Private f32* %207 = OpAccessChain %9 %194 
					                                                      OpStore %207 %206 
					                                       f32_3 %208 = OpLoad %9 
					                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
					                                       f32_2 %210 = OpFAdd %209 %100 
					                                       f32_3 %211 = OpLoad %9 
					                                       f32_3 %212 = OpVectorShuffle %211 %210 3 4 2 
					                                                      OpStore %9 %212 
					                                       f32_3 %213 = OpLoad %9 
					                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
					                                       f32_2 %215 = OpExtInst %1 4 %214 
					                                       f32_3 %216 = OpLoad %9 
					                                       f32_2 %217 = OpVectorShuffle %216 %216 0 1 
					                                       f32_2 %218 = OpExtInst %1 4 %217 
					                                         f32 %219 = OpDot %215 %218 
					                                Private f32* %220 = OpAccessChain %9 %178 
					                                                      OpStore %220 %219 
					                                Private f32* %221 = OpAccessChain %9 %178 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpExtInst %1 31 %222 
					                                Private f32* %224 = OpAccessChain %9 %178 
					                                                      OpStore %224 %223 
					                                Private f32* %226 = OpAccessChain %9 %178 
					                                         f32 %227 = OpLoad %226 
					                                         f32 %228 = OpFDiv %225 %227 
					                                Private f32* %230 = OpAccessChain %9 %229 
					                                                      OpStore %230 %228 
					                                       f32_4 %233 = OpLoad %55 
					                                       f32_4 %234 = OpLoad %55 
					                                       f32_4 %235 = OpFNegate %234 
					                                      bool_4 %236 = OpFOrdGreaterThanEqual %233 %235 
					                                                      OpStore %232 %236 
					                                       f32_4 %237 = OpLoad %55 
					                                       f32_4 %238 = OpExtInst %1 4 %237 
					                                       f32_4 %239 = OpExtInst %1 10 %238 
					                                                      OpStore %55 %239 
					                               Private bool* %240 = OpAccessChain %232 %178 
					                                        bool %241 = OpLoad %240 
					                                                      OpSelectionMerge %244 None 
					                                                      OpBranchConditional %241 %243 %247 
					                                             %243 = OpLabel 
					                                Private f32* %245 = OpAccessChain %55 %178 
					                                         f32 %246 = OpLoad %245 
					                                                      OpStore %242 %246 
					                                                      OpBranch %244 
					                                             %247 = OpLabel 
					                                Private f32* %248 = OpAccessChain %55 %178 
					                                         f32 %249 = OpLoad %248 
					                                         f32 %250 = OpFNegate %249 
					                                                      OpStore %242 %250 
					                                                      OpBranch %244 
					                                             %244 = OpLabel 
					                                         f32 %251 = OpLoad %242 
					                                Private f32* %252 = OpAccessChain %29 %178 
					                                                      OpStore %252 %251 
					                               Private bool* %253 = OpAccessChain %232 %194 
					                                        bool %254 = OpLoad %253 
					                                                      OpSelectionMerge %257 None 
					                                                      OpBranchConditional %254 %256 %260 
					                                             %256 = OpLabel 
					                                Private f32* %258 = OpAccessChain %55 %194 
					                                         f32 %259 = OpLoad %258 
					                                                      OpStore %255 %259 
					                                                      OpBranch %257 
					                                             %260 = OpLabel 
					                                Private f32* %261 = OpAccessChain %55 %194 
					                                         f32 %262 = OpLoad %261 
					                                         f32 %263 = OpFNegate %262 
					                                                      OpStore %255 %263 
					                                                      OpBranch %257 
					                                             %257 = OpLabel 
					                                         f32 %264 = OpLoad %255 
					                                Private f32* %265 = OpAccessChain %29 %194 
					                                                      OpStore %265 %264 
					                               Private bool* %266 = OpAccessChain %232 %229 
					                                        bool %267 = OpLoad %266 
					                                                      OpSelectionMerge %270 None 
					                                                      OpBranchConditional %267 %269 %273 
					                                             %269 = OpLabel 
					                                Private f32* %271 = OpAccessChain %55 %229 
					                                         f32 %272 = OpLoad %271 
					                                                      OpStore %268 %272 
					                                                      OpBranch %270 
					                                             %273 = OpLabel 
					                                Private f32* %274 = OpAccessChain %55 %229 
					                                         f32 %275 = OpLoad %274 
					                                         f32 %276 = OpFNegate %275 
					                                                      OpStore %268 %276 
					                                                      OpBranch %270 
					                                             %270 = OpLabel 
					                                         f32 %277 = OpLoad %268 
					                                Private f32* %278 = OpAccessChain %29 %229 
					                                                      OpStore %278 %277 
					                               Private bool* %280 = OpAccessChain %232 %279 
					                                        bool %281 = OpLoad %280 
					                                                      OpSelectionMerge %284 None 
					                                                      OpBranchConditional %281 %283 %287 
					                                             %283 = OpLabel 
					                                Private f32* %285 = OpAccessChain %55 %279 
					                                         f32 %286 = OpLoad %285 
					                                                      OpStore %282 %286 
					                                                      OpBranch %284 
					                                             %287 = OpLabel 
					                                Private f32* %288 = OpAccessChain %55 %279 
					                                         f32 %289 = OpLoad %288 
					                                         f32 %290 = OpFNegate %289 
					                                                      OpStore %282 %290 
					                                                      OpBranch %284 
					                                             %284 = OpLabel 
					                                         f32 %291 = OpLoad %282 
					                                Private f32* %292 = OpAccessChain %29 %279 
					                                                      OpStore %292 %291 
					                                       f32_4 %293 = OpLoad %29 
					                                       f32_4 %295 = OpFAdd %293 %294 
					                                                      OpStore %29 %295 
					                                       f32_4 %296 = OpLoad %29 
					                                       f32_2 %297 = OpVectorShuffle %296 %296 0 1 
					                                       f32_2 %298 = OpExtInst %1 4 %297 
					                                       f32_4 %299 = OpLoad %29 
					                                       f32_2 %300 = OpVectorShuffle %299 %299 0 1 
					                                       f32_2 %301 = OpExtInst %1 4 %300 
					                                         f32 %302 = OpDot %298 %301 
					                                Private f32* %303 = OpAccessChain %29 %178 
					                                                      OpStore %303 %302 
					                                       f32_4 %304 = OpLoad %29 
					                                       f32_2 %305 = OpVectorShuffle %304 %304 2 3 
					                                       f32_2 %306 = OpExtInst %1 4 %305 
					                                       f32_4 %307 = OpLoad %29 
					                                       f32_2 %308 = OpVectorShuffle %307 %307 2 3 
					                                       f32_2 %309 = OpExtInst %1 4 %308 
					                                         f32 %310 = OpDot %306 %309 
					                                Private f32* %311 = OpAccessChain %29 %194 
					                                                      OpStore %311 %310 
					                                       f32_4 %312 = OpLoad %29 
					                                       f32_2 %313 = OpVectorShuffle %312 %312 0 1 
					                                       f32_2 %314 = OpExtInst %1 31 %313 
					                                       f32_4 %315 = OpLoad %29 
					                                       f32_4 %316 = OpVectorShuffle %315 %314 4 5 2 3 
					                                                      OpStore %29 %316 
					                                       f32_4 %318 = OpLoad %29 
					                                       f32_2 %319 = OpVectorShuffle %318 %318 0 1 
					                                       f32_2 %320 = OpFDiv %317 %319 
					                                       f32_3 %321 = OpLoad %9 
					                                       f32_3 %322 = OpVectorShuffle %321 %320 3 4 2 
					                                                      OpStore %9 %322 
					                                       f32_3 %323 = OpLoad %83 
					                                       f32_3 %324 = OpLoad %9 
					                                       f32_3 %325 = OpFAdd %323 %324 
					                                                      OpStore %9 %325 
					                                       f32_3 %328 = OpLoad %9 
					                                         f32 %329 = OpLoad %105 
					                                       f32_3 %330 = OpCompositeConstruct %329 %329 %329 
					                                       f32_3 %331 = OpFDiv %328 %330 
					                                       f32_4 %332 = OpLoad %327 
					                                       f32_4 %333 = OpVectorShuffle %332 %331 4 5 6 3 
					                                                      OpStore %327 %333 
					                                 Output f32* %336 = OpAccessChain %327 %279 
					                                                      OpStore %336 %334 
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
						float _Value;
						float _Value2;
						float _Value3;
						vec4 unused_0_4;
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec2 u_xlatb0;
					vec4 u_xlat1;
					bvec4 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec2 u_xlat11;
					vec2 u_xlat12;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xyz = _Time.xxx * vec3(20.0, 20.0, 20.0) + vec3(0.0700000003, 0.140000001, 0.210000008);
					    u_xlat1.xyz = sin(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + vec3(vec3(_Value, _Value, _Value));
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = u_xlat2.xy + vec2(_Value2, _Value3);
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2.xy = u_xlat12.xy + vec2(-0.5, -0.5);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat2.xy = u_xlat2.xy / vec2(u_xlat15);
					    u_xlat11.xy = u_xlat1.zz * u_xlat2.xy;
					    u_xlat4 = u_xlat1.xxyy * u_xlat2.xyxy;
					    u_xlat0.xyz = vec3(u_xlat15) * vec3(9.0, 9.0, 9.0) + (-u_xlat0.xyz);
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat11.xy * abs(u_xlat0.zz) + u_xlat12.xy;
					    u_xlat2 = u_xlat4 * abs(u_xlat0.xxyy) + u_xlat12.xyxy;
					    u_xlatb0.xy = greaterThanEqual(u_xlat1.xyxx, (-u_xlat1.xyxx)).xy;
					    u_xlat1.xy = fract(abs(u_xlat1.xy));
					    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.y : (-u_xlat1.y);
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.x = dot(abs(u_xlat0.xy), abs(u_xlat0.xy));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.z = 0.00999999978 / u_xlat0.x;
					    u_xlatb1 = greaterThanEqual(u_xlat2, (-u_xlat2));
					    u_xlat2 = fract(abs(u_xlat2));
					    u_xlat1.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat1.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
					    u_xlat1.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
					    u_xlat1.w = (u_xlatb1.w) ? u_xlat2.w : (-u_xlat2.w);
					    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat1.x = dot(abs(u_xlat1.xy), abs(u_xlat1.xy));
					    u_xlat1.y = dot(abs(u_xlat1.zw), abs(u_xlat1.zw));
					    u_xlat1.xy = sqrt(u_xlat1.xy);
					    u_xlat0.xy = vec2(0.00999999978, 0.00999999978) / u_xlat1.xy;
					    u_xlat0.xyz = u_xlat10_3.xyz + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz / vec3(u_xlat15);
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