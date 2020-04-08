Shader "CameraFilterPack/Distortion_Dissipation" {
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
			GpuProgramID 62707
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
					uniform 	float _Value;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat16_4;
					vec4 u_xlat10_4;
					float u_xlat10;
					vec2 u_xlat13;
					int u_xlati15;
					float u_xlat16;
					int u_xlati16;
					bool u_xlatb16;
					float u_xlat17;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = _Value * 0.333333343;
					    u_xlat10 = fract(u_xlat10);
					    u_xlat10 = u_xlat10 * 6.0 + (-u_xlat0.x);
					    u_xlat10 = u_xlat0.y + u_xlat10;
					    u_xlat10 = u_xlat10 + -1.0;
					    u_xlat10 = max(u_xlat10, 0.0);
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat2.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = u_xlat2.xy + vec2(0.5, 0.5);
					        u_xlat13.x = float(0.0);
					        u_xlat13.y = float(0.0);
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<6 ; u_xlati_loop_2++)
					        {
					            u_xlat17 = float(u_xlati_loop_2);
					            u_xlat17 = exp2(u_xlat17);
					            u_xlat4.xy = vec2(u_xlat17) * u_xlat3.xy;
					            u_xlat4.xy = u_xlat4.xy * vec2(0.00100000005, 0.00100000005);
					            u_xlat10_4 = texture(_MainTex, u_xlat4.xy);
					            u_xlat16_4.xy = u_xlat10_4.xy + vec2(-0.5, -0.5);
					            u_xlat4.xy = u_xlat16_4.xy / vec2(u_xlat17);
					            u_xlat13.xy = u_xlat13.xy + u_xlat4.xy;
					        }
					        u_xlat3.xy = vec2(u_xlat10) * u_xlat13.xy;
					        u_xlat3.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978);
					        u_xlat16 = float(u_xlati_loop_1);
					        u_xlat3.xy = u_xlat3.xy / vec2(u_xlat16);
					        u_xlat2.xz = u_xlat2.xy + u_xlat3.xy;
					        u_xlat2.y = (-u_xlat10) * 0.00300000003 + u_xlat2.z;
					        u_xlat10_4 = texture(_MainTex, u_xlat2.xy);
					        u_xlat1.xyz = u_xlat1.xyz + u_xlat10_4.xyz;
					    }
					    SV_Target0.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
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
					; Bound: 206
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %188 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 11 
					                                              OpMemberDecorate %14 0 Offset 14 
					                                              OpMemberDecorate %14 1 RelaxedPrecision 
					                                              OpMemberDecorate %14 1 Offset 14 
					                                              OpDecorate %14 Block 
					                                              OpDecorate %16 DescriptorSet 16 
					                                              OpDecorate %16 Binding 16 
					                                              OpDecorate %21 RelaxedPrecision 
					                                              OpDecorate %22 RelaxedPrecision 
					                                              OpDecorate %25 RelaxedPrecision 
					                                              OpDecorate %26 RelaxedPrecision 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %118 DescriptorSet 118 
					                                              OpDecorate %118 Binding 118 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %122 DescriptorSet 122 
					                                              OpDecorate %122 Binding 122 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %128 RelaxedPrecision 
					                                              OpDecorate %131 RelaxedPrecision 
					                                              OpDecorate %132 RelaxedPrecision 
					                                              OpDecorate %133 RelaxedPrecision 
					                                              OpDecorate %136 RelaxedPrecision 
					                                              OpDecorate %137 RelaxedPrecision 
					                                              OpDecorate %139 RelaxedPrecision 
					                                              OpDecorate %140 RelaxedPrecision 
					                                              OpDecorate %175 RelaxedPrecision 
					                                              OpDecorate %176 RelaxedPrecision 
					                                              OpDecorate %181 RelaxedPrecision 
					                                              OpDecorate %183 RelaxedPrecision 
					                                              OpDecorate %188 Location 188 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeVector %6 4 
					                                      %14 = OpTypeStruct %6 %13 
					                                      %15 = OpTypePointer Uniform %14 
					        Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
					                                      %17 = OpTypeInt 32 1 
					                                  i32 %18 = OpConstant 1 
					                                      %19 = OpTypePointer Uniform %13 
					                                      %28 = OpTypePointer Private %6 
					                         Private f32* %29 = OpVariable Private 
					                                  i32 %30 = OpConstant 0 
					                                      %31 = OpTypePointer Uniform %6 
					                                  f32 %34 = OpConstant 3,674022E-40 
					                                  f32 %39 = OpConstant 3,674022E-40 
					                                      %41 = OpTypeInt 32 0 
					                                  u32 %42 = OpConstant 0 
					                                  u32 %47 = OpConstant 1 
					                                  f32 %53 = OpConstant 3,674022E-40 
					                                  f32 %56 = OpConstant 3,674022E-40 
					                                      %61 = OpTypeVector %6 3 
					                                      %62 = OpTypePointer Private %61 
					                       Private f32_3* %63 = OpVariable Private 
					                                  u32 %66 = OpConstant 2 
					                       Private f32_3* %68 = OpVariable Private 
					                                      %72 = OpTypePointer Function %17 
					                                  i32 %80 = OpConstant 10 
					                                      %81 = OpTypeBool 
					                       Private f32_2* %83 = OpVariable Private 
					                                  f32 %86 = OpConstant 3,674022E-40 
					                                f32_2 %87 = OpConstantComposite %86 %86 
					                       Private f32_2* %89 = OpVariable Private 
					                                  i32 %99 = OpConstant 6 
					                        Private f32* %101 = OpVariable Private 
					                      Private f32_2* %106 = OpVariable Private 
					                                 f32 %112 = OpConstant 3,674022E-40 
					                               f32_2 %113 = OpConstantComposite %112 %112 
					                      Private f32_3* %115 = OpVariable Private 
					                                     %116 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %117 = OpTypePointer UniformConstant %116 
					UniformConstant read_only Texture2D* %118 = OpVariable UniformConstant 
					                                     %120 = OpTypeSampler 
					                                     %121 = OpTypePointer UniformConstant %120 
					            UniformConstant sampler* %122 = OpVariable UniformConstant 
					                                     %124 = OpTypeSampledImage %116 
					                      Private f32_2* %131 = OpVariable Private 
					                                 f32 %134 = OpConstant 3,674022E-40 
					                               f32_2 %135 = OpConstantComposite %134 %134 
					                                 f32 %151 = OpConstant 3,674022E-40 
					                               f32_2 %152 = OpConstantComposite %151 %151 
					                        Private f32* %154 = OpVariable Private 
					                                 f32 %169 = OpConstant 3,674022E-40 
					                                     %187 = OpTypePointer Output %13 
					                       Output f32_4* %188 = OpVariable Output 
					                                 f32 %190 = OpConstant 3,674022E-40 
					                               f32_3 %191 = OpConstantComposite %190 %190 %190 
					                                 f32 %195 = OpConstant 3,674022E-40 
					                                 u32 %196 = OpConstant 3 
					                                     %197 = OpTypePointer Output %6 
					                                     %200 = OpTypePointer Private %17 
					                        Private i32* %201 = OpVariable Private 
					                        Private i32* %202 = OpVariable Private 
					                                     %203 = OpTypePointer Private %81 
					                       Private bool* %204 = OpVariable Private 
					                       Private bool* %205 = OpVariable Private 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function i32* %73 = OpVariable Function 
					                        Function i32* %92 = OpVariable Function 
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
					                                  f32 %35 = OpFMul %33 %34 
					                                              OpStore %29 %35 
					                                  f32 %36 = OpLoad %29 
					                                  f32 %37 = OpExtInst %1 10 %36 
					                                              OpStore %29 %37 
					                                  f32 %38 = OpLoad %29 
					                                  f32 %40 = OpFMul %38 %39 
					                         Private f32* %43 = OpAccessChain %9 %42 
					                                  f32 %44 = OpLoad %43 
					                                  f32 %45 = OpFNegate %44 
					                                  f32 %46 = OpFAdd %40 %45 
					                                              OpStore %29 %46 
					                         Private f32* %48 = OpAccessChain %9 %47 
					                                  f32 %49 = OpLoad %48 
					                                  f32 %50 = OpLoad %29 
					                                  f32 %51 = OpFAdd %49 %50 
					                                              OpStore %29 %51 
					                                  f32 %52 = OpLoad %29 
					                                  f32 %54 = OpFAdd %52 %53 
					                                              OpStore %29 %54 
					                                  f32 %55 = OpLoad %29 
					                                  f32 %57 = OpExtInst %1 40 %55 %56 
					                                              OpStore %29 %57 
					                                  f32 %58 = OpLoad %29 
					                                  f32 %59 = OpLoad %29 
					                                  f32 %60 = OpFMul %58 %59 
					                                              OpStore %29 %60 
					                         Private f32* %64 = OpAccessChain %63 %42 
					                                              OpStore %64 %56 
					                         Private f32* %65 = OpAccessChain %63 %47 
					                                              OpStore %65 %56 
					                         Private f32* %67 = OpAccessChain %63 %66 
					                                              OpStore %67 %56 
					                                f32_2 %69 = OpLoad %9 
					                                f32_3 %70 = OpLoad %68 
					                                f32_3 %71 = OpVectorShuffle %70 %69 3 4 2 
					                                              OpStore %68 %71 
					                                              OpStore %73 %18 
					                                              OpBranch %74 
					                                      %74 = OpLabel 
					                                              OpLoopMerge %76 %77 None 
					                                              OpBranch %78 
					                                      %78 = OpLabel 
					                                  i32 %79 = OpLoad %73 
					                                 bool %82 = OpSLessThan %79 %80 
					                                              OpBranchConditional %82 %75 %76 
					                                      %75 = OpLabel 
					                                f32_3 %84 = OpLoad %68 
					                                f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                                f32_2 %88 = OpFAdd %85 %87 
					                                              OpStore %83 %88 
					                         Private f32* %90 = OpAccessChain %89 %42 
					                                              OpStore %90 %56 
					                         Private f32* %91 = OpAccessChain %89 %47 
					                                              OpStore %91 %56 
					                                              OpStore %92 %30 
					                                              OpBranch %93 
					                                      %93 = OpLabel 
					                                              OpLoopMerge %95 %96 None 
					                                              OpBranch %97 
					                                      %97 = OpLabel 
					                                  i32 %98 = OpLoad %92 
					                                bool %100 = OpSLessThan %98 %99 
					                                              OpBranchConditional %100 %94 %95 
					                                      %94 = OpLabel 
					                                 i32 %102 = OpLoad %92 
					                                 f32 %103 = OpConvertSToF %102 
					                                              OpStore %101 %103 
					                                 f32 %104 = OpLoad %101 
					                                 f32 %105 = OpExtInst %1 29 %104 
					                                              OpStore %101 %105 
					                                 f32 %107 = OpLoad %101 
					                               f32_2 %108 = OpCompositeConstruct %107 %107 
					                               f32_2 %109 = OpLoad %83 
					                               f32_2 %110 = OpFMul %108 %109 
					                                              OpStore %106 %110 
					                               f32_2 %111 = OpLoad %106 
					                               f32_2 %114 = OpFMul %111 %113 
					                                              OpStore %106 %114 
					                 read_only Texture2D %119 = OpLoad %118 
					                             sampler %123 = OpLoad %122 
					          read_only Texture2DSampled %125 = OpSampledImage %119 %123 
					                               f32_2 %126 = OpLoad %106 
					                               f32_4 %127 = OpImageSampleImplicitLod %125 %126 
					                               f32_2 %128 = OpVectorShuffle %127 %127 0 1 
					                               f32_3 %129 = OpLoad %115 
					                               f32_3 %130 = OpVectorShuffle %129 %128 3 4 2 
					                                              OpStore %115 %130 
					                               f32_3 %132 = OpLoad %115 
					                               f32_2 %133 = OpVectorShuffle %132 %132 0 1 
					                               f32_2 %136 = OpFAdd %133 %135 
					                                              OpStore %131 %136 
					                               f32_2 %137 = OpLoad %131 
					                                 f32 %138 = OpLoad %101 
					                               f32_2 %139 = OpCompositeConstruct %138 %138 
					                               f32_2 %140 = OpFDiv %137 %139 
					                                              OpStore %106 %140 
					                               f32_2 %141 = OpLoad %89 
					                               f32_2 %142 = OpLoad %106 
					                               f32_2 %143 = OpFAdd %141 %142 
					                                              OpStore %89 %143 
					                                              OpBranch %96 
					                                      %96 = OpLabel 
					                                 i32 %144 = OpLoad %92 
					                                 i32 %145 = OpIAdd %144 %18 
					                                              OpStore %92 %145 
					                                              OpBranch %93 
					                                      %95 = OpLabel 
					                                 f32 %146 = OpLoad %29 
					                               f32_2 %147 = OpCompositeConstruct %146 %146 
					                               f32_2 %148 = OpLoad %89 
					                               f32_2 %149 = OpFMul %147 %148 
					                                              OpStore %83 %149 
					                               f32_2 %150 = OpLoad %83 
					                               f32_2 %153 = OpFMul %150 %152 
					                                              OpStore %83 %153 
					                                 i32 %155 = OpLoad %73 
					                                 f32 %156 = OpConvertSToF %155 
					                                              OpStore %154 %156 
					                               f32_2 %157 = OpLoad %83 
					                                 f32 %158 = OpLoad %154 
					                               f32_2 %159 = OpCompositeConstruct %158 %158 
					                               f32_2 %160 = OpFDiv %157 %159 
					                                              OpStore %83 %160 
					                               f32_3 %161 = OpLoad %68 
					                               f32_2 %162 = OpVectorShuffle %161 %161 0 1 
					                               f32_2 %163 = OpLoad %83 
					                               f32_2 %164 = OpFAdd %162 %163 
					                               f32_3 %165 = OpLoad %68 
					                               f32_3 %166 = OpVectorShuffle %165 %164 3 1 4 
					                                              OpStore %68 %166 
					                                 f32 %167 = OpLoad %29 
					                                 f32 %168 = OpFNegate %167 
					                                 f32 %170 = OpFMul %168 %169 
					                        Private f32* %171 = OpAccessChain %68 %66 
					                                 f32 %172 = OpLoad %171 
					                                 f32 %173 = OpFAdd %170 %172 
					                        Private f32* %174 = OpAccessChain %68 %47 
					                                              OpStore %174 %173 
					                 read_only Texture2D %175 = OpLoad %118 
					                             sampler %176 = OpLoad %122 
					          read_only Texture2DSampled %177 = OpSampledImage %175 %176 
					                               f32_3 %178 = OpLoad %68 
					                               f32_2 %179 = OpVectorShuffle %178 %178 0 1 
					                               f32_4 %180 = OpImageSampleImplicitLod %177 %179 
					                               f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
					                                              OpStore %115 %181 
					                               f32_3 %182 = OpLoad %63 
					                               f32_3 %183 = OpLoad %115 
					                               f32_3 %184 = OpFAdd %182 %183 
					                                              OpStore %63 %184 
					                                              OpBranch %77 
					                                      %77 = OpLabel 
					                                 i32 %185 = OpLoad %73 
					                                 i32 %186 = OpIAdd %185 %18 
					                                              OpStore %73 %186 
					                                              OpBranch %74 
					                                      %76 = OpLabel 
					                               f32_3 %189 = OpLoad %63 
					                               f32_3 %192 = OpFMul %189 %191 
					                               f32_4 %193 = OpLoad %188 
					                               f32_4 %194 = OpVectorShuffle %193 %192 4 5 6 3 
					                                              OpStore %188 %194 
					                         Output f32* %198 = OpAccessChain %188 %196 
					                                              OpStore %198 %195 
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
						vec4 unused_0_2;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat16_4;
					vec4 u_xlat10_4;
					float u_xlat10;
					vec2 u_xlat13;
					int u_xlati15;
					float u_xlat16;
					int u_xlati16;
					bool u_xlatb16;
					float u_xlat17;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10 = _Value * 0.333333343;
					    u_xlat10 = fract(u_xlat10);
					    u_xlat10 = u_xlat10 * 6.0 + (-u_xlat0.x);
					    u_xlat10 = u_xlat0.y + u_xlat10;
					    u_xlat10 = u_xlat10 + -1.0;
					    u_xlat10 = max(u_xlat10, 0.0);
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat2.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<10 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = u_xlat2.xy + vec2(0.5, 0.5);
					        u_xlat13.x = float(0.0);
					        u_xlat13.y = float(0.0);
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<6 ; u_xlati_loop_2++)
					        {
					            u_xlat17 = float(u_xlati_loop_2);
					            u_xlat17 = exp2(u_xlat17);
					            u_xlat4.xy = vec2(u_xlat17) * u_xlat3.xy;
					            u_xlat4.xy = u_xlat4.xy * vec2(0.00100000005, 0.00100000005);
					            u_xlat10_4 = texture(_MainTex, u_xlat4.xy);
					            u_xlat16_4.xy = u_xlat10_4.xy + vec2(-0.5, -0.5);
					            u_xlat4.xy = u_xlat16_4.xy / vec2(u_xlat17);
					            u_xlat13.xy = u_xlat13.xy + u_xlat4.xy;
					        }
					        u_xlat3.xy = vec2(u_xlat10) * u_xlat13.xy;
					        u_xlat3.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978);
					        u_xlat16 = float(u_xlati_loop_1);
					        u_xlat3.xy = u_xlat3.xy / vec2(u_xlat16);
					        u_xlat2.xz = u_xlat2.xy + u_xlat3.xy;
					        u_xlat2.y = (-u_xlat10) * 0.00300000003 + u_xlat2.z;
					        u_xlat10_4 = texture(_MainTex, u_xlat2.xy);
					        u_xlat1.xyz = u_xlat1.xyz + u_xlat10_4.xyz;
					    }
					    SV_Target0.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
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