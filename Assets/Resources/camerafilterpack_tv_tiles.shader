Shader "CameraFilterPack/TV_Tiles" {
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
			GpuProgramID 21086
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
					uniform 	float Fade;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					int u_xlati6;
					vec3 u_xlat7;
					vec2 u_xlat12;
					vec2 u_xlat15;
					float u_xlat18;
					float u_xlat20;
					bool u_xlatb20;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = u_xlat0.xy * vec2(256.0, 256.0) + vec2(_TimeX);
					    u_xlat1.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + (-_Value3);
					    u_xlat7.x = float(1.0) / (-_Value4);
					    u_xlat1.x = u_xlat7.x * u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat7.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat7.x) * u_xlat1.x + 1.0;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = _Value + _Value;
					    u_xlat7.x = float(0.0);
					    u_xlat7.y = float(0.0);
					    u_xlat7.z = float(0.0);
					    u_xlat3.xy = u_xlat12.xy;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
					    {
					        u_xlat15.xy = floor(u_xlat3.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat20 = dot(u_xlat15.xy, vec2(7.0, 31.0));
					        u_xlat20 = _TimeX * 0.00999999978 + u_xlat20;
					        u_xlat20 = sin(u_xlat20);
					        u_xlat5 = vec4(u_xlat20) + vec4(0.0350000001, 0.00999999978, 0.0, 0.699999988);
					        u_xlat5 = u_xlat5 * vec4(13.5451698, 13.5451698, 13.5451698, 13.5451698);
					        u_xlat5 = fract(u_xlat5);
					        u_xlat20 = u_xlat5.w + -0.449999988;
					        u_xlat20 = u_xlat20 * 9.99999809;
					        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					        u_xlat15.x = u_xlat20 * -2.0 + 3.0;
					        u_xlat20 = u_xlat20 * u_xlat20;
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat5.xyz = vec3(u_xlat20) * u_xlat5.xyz;
					        u_xlat20 = u_xlat4.x * u_xlat4.y;
					        u_xlat20 = u_xlat20 * 16.0;
					        u_xlat15.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat20 = u_xlat15.y * u_xlat20;
					        u_xlat20 = sqrt(u_xlat20);
					        u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat20) + u_xlat7.xyz;
					        u_xlat3.xy = u_xlat3.xy / u_xlat0.xx;
					        u_xlat7.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5);
					    }
					    u_xlat0.xyz = u_xlat7.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, 0.699999988);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat18 = u_xlat1.x * Fade;
					    u_xlat0.xyz = u_xlat10_2.xyz * u_xlat0.xyz + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat10_2.xyz;
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
					; Bound: 304
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %288 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %15 0 Offset 15 
					                                                      OpMemberDecorate %15 1 Offset 15 
					                                                      OpMemberDecorate %15 2 Offset 15 
					                                                      OpMemberDecorate %15 3 Offset 15 
					                                                      OpMemberDecorate %15 4 Offset 15 
					                                                      OpMemberDecorate %15 5 Offset 15 
					                                                      OpMemberDecorate %15 6 RelaxedPrecision 
					                                                      OpMemberDecorate %15 6 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %23 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %106 RelaxedPrecision 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %109 DescriptorSet 109 
					                                                      OpDecorate %109 Binding 109 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %113 RelaxedPrecision 
					                                                      OpDecorate %113 DescriptorSet 113 
					                                                      OpDecorate %113 Binding 113 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %284 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %288 Location 288 
					                                                      OpDecorate %293 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeVector %6 4 
					                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %6 %14 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 6 
					                                              %20 = OpTypePointer Uniform %14 
					                                              %31 = OpTypePointer Private %10 
					                               Private f32_2* %32 = OpVariable Private 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                        f32_2 %36 = OpConstantComposite %35 %35 
					                                          i32 %38 = OpConstant 0 
					                                              %39 = OpTypePointer Uniform %6 
					                               Private f32_2* %44 = OpVariable Private 
					                                          f32 %48 = OpConstant 3,674022E-40 
					                                        f32_2 %49 = OpConstantComposite %48 %48 
					                                              %54 = OpTypeInt 32 0 
					                                          u32 %55 = OpConstant 0 
					                                              %56 = OpTypePointer Private %6 
					                                          i32 %64 = OpConstant 3 
					                                 Private f32* %70 = OpVariable Private 
					                                          f32 %71 = OpConstant 3,674022E-40 
					                                          i32 %72 = OpConstant 4 
					                                          f32 %84 = OpConstant 3,674022E-40 
					                                          f32 %89 = OpConstant 3,674022E-40 
					                                          f32 %91 = OpConstant 3,674022E-40 
					                              Private f32_3* %106 = OpVariable Private 
					                                             %107 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %108 = OpTypePointer UniformConstant %107 
					        UniformConstant read_only Texture2D* %109 = OpVariable UniformConstant 
					                                             %111 = OpTypeSampler 
					                                             %112 = OpTypePointer UniformConstant %111 
					                    UniformConstant sampler* %113 = OpVariable UniformConstant 
					                                             %115 = OpTypeSampledImage %107 
					                                         i32 %121 = OpConstant 1 
					                              Private f32_3* %128 = OpVariable Private 
					                                         u32 %130 = OpConstant 1 
					                                         u32 %132 = OpConstant 2 
					                              Private f32_2* %134 = OpVariable Private 
					                                             %136 = OpTypePointer Function %18 
					                                             %144 = OpTypeBool 
					                              Private f32_2* %146 = OpVariable Private 
					                              Private f32_3* %149 = OpVariable Private 
					                                Private f32* %154 = OpVariable Private 
					                                         f32 %156 = OpConstant 3,674022E-40 
					                                         f32 %157 = OpConstant 3,674022E-40 
					                                       f32_2 %158 = OpConstantComposite %156 %157 
					                                         f32 %162 = OpConstant 3,674022E-40 
					                                             %168 = OpTypePointer Private %14 
					                              Private f32_4* %169 = OpVariable Private 
					                                         f32 %172 = OpConstant 3,674022E-40 
					                                         f32 %173 = OpConstant 3,674022E-40 
					                                       f32_4 %174 = OpConstantComposite %172 %162 %84 %173 
					                                         f32 %177 = OpConstant 3,674022E-40 
					                                       f32_4 %178 = OpConstantComposite %177 %177 %177 %177 
					                                         u32 %182 = OpConstant 3 
					                                         f32 %185 = OpConstant 3,674022E-40 
					                                         f32 %188 = OpConstant 3,674022E-40 
					                                         f32 %216 = OpConstant 3,674022E-40 
					                                       f32_2 %221 = OpConstantComposite %71 %71 
					                                       f32_3 %245 = OpConstantComposite %48 %48 %48 
					                                         f32 %250 = OpConstant 3,674022E-40 
					                                       f32_3 %251 = OpConstantComposite %250 %250 %250 
					                                       f32_3 %256 = OpConstantComposite %71 %71 %173 
					                                         i32 %261 = OpConstant 2 
					                                Private f32* %274 = OpVariable Private 
					                                         i32 %277 = OpConstant 5 
					                                             %287 = OpTypePointer Output %14 
					                               Output f32_4* %288 = OpVariable Output 
					                                             %297 = OpTypePointer Output %6 
					                                             %300 = OpTypePointer Private %18 
					                                Private i32* %301 = OpVariable Private 
					                                             %302 = OpTypePointer Private %144 
					                               Private bool* %303 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %137 = OpVariable Function 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %21 = OpAccessChain %17 %19 
					                                        f32_4 %22 = OpLoad %21 
					                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
					                                        f32_2 %24 = OpFMul %13 %23 
					                               Uniform f32_4* %25 = OpAccessChain %17 %19 
					                                        f32_4 %26 = OpLoad %25 
					                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
					                                        f32_2 %28 = OpFAdd %24 %27 
					                                        f32_3 %29 = OpLoad %9 
					                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
					                                                      OpStore %9 %30 
					                                        f32_3 %33 = OpLoad %9 
					                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                        f32_2 %37 = OpFMul %34 %36 
					                                 Uniform f32* %40 = OpAccessChain %17 %38 
					                                          f32 %41 = OpLoad %40 
					                                        f32_2 %42 = OpCompositeConstruct %41 %41 
					                                        f32_2 %43 = OpFAdd %37 %42 
					                                                      OpStore %32 %43 
					                                        f32_3 %45 = OpLoad %9 
					                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                        f32_2 %47 = OpFNegate %46 
					                                        f32_2 %50 = OpFAdd %47 %49 
					                                                      OpStore %44 %50 
					                                        f32_2 %51 = OpLoad %44 
					                                        f32_2 %52 = OpLoad %44 
					                                          f32 %53 = OpDot %51 %52 
					                                 Private f32* %57 = OpAccessChain %44 %55 
					                                                      OpStore %57 %53 
					                                 Private f32* %58 = OpAccessChain %44 %55 
					                                          f32 %59 = OpLoad %58 
					                                          f32 %60 = OpExtInst %1 31 %59 
					                                 Private f32* %61 = OpAccessChain %44 %55 
					                                                      OpStore %61 %60 
					                                 Private f32* %62 = OpAccessChain %44 %55 
					                                          f32 %63 = OpLoad %62 
					                                 Uniform f32* %65 = OpAccessChain %17 %64 
					                                          f32 %66 = OpLoad %65 
					                                          f32 %67 = OpFNegate %66 
					                                          f32 %68 = OpFAdd %63 %67 
					                                 Private f32* %69 = OpAccessChain %44 %55 
					                                                      OpStore %69 %68 
					                                 Uniform f32* %73 = OpAccessChain %17 %72 
					                                          f32 %74 = OpLoad %73 
					                                          f32 %75 = OpFNegate %74 
					                                          f32 %76 = OpFDiv %71 %75 
					                                                      OpStore %70 %76 
					                                          f32 %77 = OpLoad %70 
					                                 Private f32* %78 = OpAccessChain %44 %55 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFMul %77 %79 
					                                 Private f32* %81 = OpAccessChain %44 %55 
					                                                      OpStore %81 %80 
					                                 Private f32* %82 = OpAccessChain %44 %55 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %85 = OpExtInst %1 43 %83 %84 %71 
					                                 Private f32* %86 = OpAccessChain %44 %55 
					                                                      OpStore %86 %85 
					                                 Private f32* %87 = OpAccessChain %44 %55 
					                                          f32 %88 = OpLoad %87 
					                                          f32 %90 = OpFMul %88 %89 
					                                          f32 %92 = OpFAdd %90 %91 
					                                                      OpStore %70 %92 
					                                 Private f32* %93 = OpAccessChain %44 %55 
					                                          f32 %94 = OpLoad %93 
					                                 Private f32* %95 = OpAccessChain %44 %55 
					                                          f32 %96 = OpLoad %95 
					                                          f32 %97 = OpFMul %94 %96 
					                                 Private f32* %98 = OpAccessChain %44 %55 
					                                                      OpStore %98 %97 
					                                          f32 %99 = OpLoad %70 
					                                         f32 %100 = OpFNegate %99 
					                                Private f32* %101 = OpAccessChain %44 %55 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpFMul %100 %102 
					                                         f32 %104 = OpFAdd %103 %71 
					                                Private f32* %105 = OpAccessChain %44 %55 
					                                                      OpStore %105 %104 
					                         read_only Texture2D %110 = OpLoad %109 
					                                     sampler %114 = OpLoad %113 
					                  read_only Texture2DSampled %116 = OpSampledImage %110 %114 
					                                       f32_3 %117 = OpLoad %9 
					                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
					                                       f32_4 %119 = OpImageSampleImplicitLod %116 %118 
					                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
					                                                      OpStore %106 %120 
					                                Uniform f32* %122 = OpAccessChain %17 %121 
					                                         f32 %123 = OpLoad %122 
					                                Uniform f32* %124 = OpAccessChain %17 %121 
					                                         f32 %125 = OpLoad %124 
					                                         f32 %126 = OpFAdd %123 %125 
					                                Private f32* %127 = OpAccessChain %9 %55 
					                                                      OpStore %127 %126 
					                                Private f32* %129 = OpAccessChain %128 %55 
					                                                      OpStore %129 %84 
					                                Private f32* %131 = OpAccessChain %128 %130 
					                                                      OpStore %131 %84 
					                                Private f32* %133 = OpAccessChain %128 %132 
					                                                      OpStore %133 %84 
					                                       f32_2 %135 = OpLoad %32 
					                                                      OpStore %134 %135 
					                                                      OpStore %137 %38 
					                                                      OpBranch %138 
					                                             %138 = OpLabel 
					                                                      OpLoopMerge %140 %141 None 
					                                                      OpBranch %142 
					                                             %142 = OpLabel 
					                                         i32 %143 = OpLoad %137 
					                                        bool %145 = OpSLessThan %143 %19 
					                                                      OpBranchConditional %145 %139 %140 
					                                             %139 = OpLabel 
					                                       f32_2 %147 = OpLoad %134 
					                                       f32_2 %148 = OpExtInst %1 8 %147 
					                                                      OpStore %146 %148 
					                                       f32_2 %150 = OpLoad %134 
					                                       f32_2 %151 = OpExtInst %1 10 %150 
					                                       f32_3 %152 = OpLoad %149 
					                                       f32_3 %153 = OpVectorShuffle %152 %151 3 4 2 
					                                                      OpStore %149 %153 
					                                       f32_2 %155 = OpLoad %146 
					                                         f32 %159 = OpDot %155 %158 
					                                                      OpStore %154 %159 
					                                Uniform f32* %160 = OpAccessChain %17 %38 
					                                         f32 %161 = OpLoad %160 
					                                         f32 %163 = OpFMul %161 %162 
					                                         f32 %164 = OpLoad %154 
					                                         f32 %165 = OpFAdd %163 %164 
					                                                      OpStore %154 %165 
					                                         f32 %166 = OpLoad %154 
					                                         f32 %167 = OpExtInst %1 13 %166 
					                                                      OpStore %154 %167 
					                                         f32 %170 = OpLoad %154 
					                                       f32_4 %171 = OpCompositeConstruct %170 %170 %170 %170 
					                                       f32_4 %175 = OpFAdd %171 %174 
					                                                      OpStore %169 %175 
					                                       f32_4 %176 = OpLoad %169 
					                                       f32_4 %179 = OpFMul %176 %178 
					                                                      OpStore %169 %179 
					                                       f32_4 %180 = OpLoad %169 
					                                       f32_4 %181 = OpExtInst %1 10 %180 
					                                                      OpStore %169 %181 
					                                Private f32* %183 = OpAccessChain %169 %182 
					                                         f32 %184 = OpLoad %183 
					                                         f32 %186 = OpFAdd %184 %185 
					                                                      OpStore %154 %186 
					                                         f32 %187 = OpLoad %154 
					                                         f32 %189 = OpFMul %187 %188 
					                                                      OpStore %154 %189 
					                                         f32 %190 = OpLoad %154 
					                                         f32 %191 = OpExtInst %1 43 %190 %84 %71 
					                                                      OpStore %154 %191 
					                                         f32 %192 = OpLoad %154 
					                                         f32 %193 = OpFMul %192 %89 
					                                         f32 %194 = OpFAdd %193 %91 
					                                Private f32* %195 = OpAccessChain %146 %55 
					                                                      OpStore %195 %194 
					                                         f32 %196 = OpLoad %154 
					                                         f32 %197 = OpLoad %154 
					                                         f32 %198 = OpFMul %196 %197 
					                                                      OpStore %154 %198 
					                                         f32 %199 = OpLoad %154 
					                                Private f32* %200 = OpAccessChain %146 %55 
					                                         f32 %201 = OpLoad %200 
					                                         f32 %202 = OpFMul %199 %201 
					                                                      OpStore %154 %202 
					                                         f32 %203 = OpLoad %154 
					                                       f32_3 %204 = OpCompositeConstruct %203 %203 %203 
					                                       f32_4 %205 = OpLoad %169 
					                                       f32_3 %206 = OpVectorShuffle %205 %205 0 1 2 
					                                       f32_3 %207 = OpFMul %204 %206 
					                                       f32_4 %208 = OpLoad %169 
					                                       f32_4 %209 = OpVectorShuffle %208 %207 4 5 6 3 
					                                                      OpStore %169 %209 
					                                Private f32* %210 = OpAccessChain %149 %55 
					                                         f32 %211 = OpLoad %210 
					                                Private f32* %212 = OpAccessChain %149 %130 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpFMul %211 %213 
					                                                      OpStore %154 %214 
					                                         f32 %215 = OpLoad %154 
					                                         f32 %217 = OpFMul %215 %216 
					                                                      OpStore %154 %217 
					                                       f32_3 %218 = OpLoad %149 
					                                       f32_2 %219 = OpVectorShuffle %218 %218 0 1 
					                                       f32_2 %220 = OpFNegate %219 
					                                       f32_2 %222 = OpFAdd %220 %221 
					                                                      OpStore %146 %222 
					                                         f32 %223 = OpLoad %154 
					                                Private f32* %224 = OpAccessChain %146 %55 
					                                         f32 %225 = OpLoad %224 
					                                         f32 %226 = OpFMul %223 %225 
					                                                      OpStore %154 %226 
					                                Private f32* %227 = OpAccessChain %146 %130 
					                                         f32 %228 = OpLoad %227 
					                                         f32 %229 = OpLoad %154 
					                                         f32 %230 = OpFMul %228 %229 
					                                                      OpStore %154 %230 
					                                         f32 %231 = OpLoad %154 
					                                         f32 %232 = OpExtInst %1 31 %231 
					                                                      OpStore %154 %232 
					                                       f32_4 %233 = OpLoad %169 
					                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
					                                         f32 %235 = OpLoad %154 
					                                       f32_3 %236 = OpCompositeConstruct %235 %235 %235 
					                                       f32_3 %237 = OpFMul %234 %236 
					                                       f32_3 %238 = OpLoad %128 
					                                       f32_3 %239 = OpFAdd %237 %238 
					                                                      OpStore %149 %239 
					                                       f32_2 %240 = OpLoad %134 
					                                       f32_3 %241 = OpLoad %9 
					                                       f32_2 %242 = OpVectorShuffle %241 %241 0 0 
					                                       f32_2 %243 = OpFDiv %240 %242 
					                                                      OpStore %134 %243 
					                                       f32_3 %244 = OpLoad %149 
					                                       f32_3 %246 = OpFMul %244 %245 
					                                                      OpStore %128 %246 
					                                                      OpBranch %141 
					                                             %141 = OpLabel 
					                                         i32 %247 = OpLoad %137 
					                                         i32 %248 = OpIAdd %247 %121 
					                                                      OpStore %137 %248 
					                                                      OpBranch %138 
					                                             %140 = OpLabel 
					                                       f32_3 %249 = OpLoad %128 
					                                       f32_3 %252 = OpFMul %249 %251 
					                                                      OpStore %9 %252 
					                                       f32_3 %253 = OpLoad %9 
					                                       f32_3 %254 = OpExtInst %1 30 %253 
					                                                      OpStore %9 %254 
					                                       f32_3 %255 = OpLoad %9 
					                                       f32_3 %257 = OpFMul %255 %256 
					                                                      OpStore %9 %257 
					                                       f32_3 %258 = OpLoad %9 
					                                       f32_3 %259 = OpExtInst %1 29 %258 
					                                                      OpStore %9 %259 
					                                       f32_3 %260 = OpLoad %9 
					                                Uniform f32* %262 = OpAccessChain %17 %261 
					                                         f32 %263 = OpLoad %262 
					                                Uniform f32* %264 = OpAccessChain %17 %261 
					                                         f32 %265 = OpLoad %264 
					                                Uniform f32* %266 = OpAccessChain %17 %261 
					                                         f32 %267 = OpLoad %266 
					                                       f32_3 %268 = OpCompositeConstruct %263 %265 %267 
					                                         f32 %269 = OpCompositeExtract %268 0 
					                                         f32 %270 = OpCompositeExtract %268 1 
					                                         f32 %271 = OpCompositeExtract %268 2 
					                                       f32_3 %272 = OpCompositeConstruct %269 %270 %271 
					                                       f32_3 %273 = OpFMul %260 %272 
					                                                      OpStore %9 %273 
					                                Private f32* %275 = OpAccessChain %44 %55 
					                                         f32 %276 = OpLoad %275 
					                                Uniform f32* %278 = OpAccessChain %17 %277 
					                                         f32 %279 = OpLoad %278 
					                                         f32 %280 = OpFMul %276 %279 
					                                                      OpStore %274 %280 
					                                       f32_3 %281 = OpLoad %106 
					                                       f32_3 %282 = OpLoad %9 
					                                       f32_3 %283 = OpFMul %281 %282 
					                                       f32_3 %284 = OpLoad %106 
					                                       f32_3 %285 = OpFNegate %284 
					                                       f32_3 %286 = OpFAdd %283 %285 
					                                                      OpStore %9 %286 
					                                         f32 %289 = OpLoad %274 
					                                       f32_3 %290 = OpCompositeConstruct %289 %289 %289 
					                                       f32_3 %291 = OpLoad %9 
					                                       f32_3 %292 = OpFMul %290 %291 
					                                       f32_3 %293 = OpLoad %106 
					                                       f32_3 %294 = OpFAdd %292 %293 
					                                       f32_4 %295 = OpLoad %288 
					                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 6 3 
					                                                      OpStore %288 %296 
					                                 Output f32* %298 = OpAccessChain %288 %182 
					                                                      OpStore %298 %71 
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
						float Fade;
						vec4 unused_0_7;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					int u_xlati6;
					vec3 u_xlat7;
					vec2 u_xlat12;
					vec2 u_xlat15;
					float u_xlat18;
					float u_xlat20;
					bool u_xlatb20;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = u_xlat0.xy * vec2(256.0, 256.0) + vec2(_TimeX);
					    u_xlat1.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + (-_Value3);
					    u_xlat7.x = float(1.0) / (-_Value4);
					    u_xlat1.x = u_xlat7.x * u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat7.x = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = (-u_xlat7.x) * u_xlat1.x + 1.0;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = _Value + _Value;
					    u_xlat7.x = float(0.0);
					    u_xlat7.y = float(0.0);
					    u_xlat7.z = float(0.0);
					    u_xlat3.xy = u_xlat12.xy;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
					    {
					        u_xlat15.xy = floor(u_xlat3.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat20 = dot(u_xlat15.xy, vec2(7.0, 31.0));
					        u_xlat20 = _TimeX * 0.00999999978 + u_xlat20;
					        u_xlat20 = sin(u_xlat20);
					        u_xlat5 = vec4(u_xlat20) + vec4(0.0350000001, 0.00999999978, 0.0, 0.699999988);
					        u_xlat5 = u_xlat5 * vec4(13.5451698, 13.5451698, 13.5451698, 13.5451698);
					        u_xlat5 = fract(u_xlat5);
					        u_xlat20 = u_xlat5.w + -0.449999988;
					        u_xlat20 = u_xlat20 * 9.99999809;
					        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					        u_xlat15.x = u_xlat20 * -2.0 + 3.0;
					        u_xlat20 = u_xlat20 * u_xlat20;
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat5.xyz = vec3(u_xlat20) * u_xlat5.xyz;
					        u_xlat20 = u_xlat4.x * u_xlat4.y;
					        u_xlat20 = u_xlat20 * 16.0;
					        u_xlat15.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat20 = u_xlat15.y * u_xlat20;
					        u_xlat20 = sqrt(u_xlat20);
					        u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat20) + u_xlat7.xyz;
					        u_xlat3.xy = u_xlat3.xy / u_xlat0.xx;
					        u_xlat7.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5);
					    }
					    u_xlat0.xyz = u_xlat7.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, 0.699999988);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat18 = u_xlat1.x * Fade;
					    u_xlat0.xyz = u_xlat10_2.xyz * u_xlat0.xyz + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat10_2.xyz;
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