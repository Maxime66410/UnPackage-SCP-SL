Shader "CameraFilterPack/Blend2Camera_VividLight" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 14338
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
					uniform 	float _Value2;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					bvec3 u_xlatb3;
					vec2 u_xlat4;
					vec3 u_xlat16_4;
					void main()
					{
					    u_xlat0.x = (-_Value2) + 1.0;
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex2, u_xlat4.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat4.xy);
					    u_xlat16_4.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_4.xyz + u_xlat10_2.xyz;
					    u_xlat0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_4.xyz + u_xlat10_2.xyz;
					    u_xlat2.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz / u_xlat3.xyz;
					    u_xlat2.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz / u_xlat3.xyz;
					    u_xlatb3.xyz = lessThan(u_xlat0.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
					    {
					        vec3 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat2.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat2.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat2.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat1.xyz + u_xlat0.xyz;
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
					; Bound: 222
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %28 %199 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpMemberDecorate %12 0 Offset 12 
					                                                  OpMemberDecorate %12 1 Offset 12 
					                                                  OpMemberDecorate %12 2 Offset 12 
					                                                  OpMemberDecorate %12 3 RelaxedPrecision 
					                                                  OpMemberDecorate %12 3 Offset 12 
					                                                  OpDecorate %12 Block 
					                                                  OpDecorate %14 DescriptorSet 14 
					                                                  OpDecorate %14 Binding 14 
					                                                  OpDecorate vs_TEXCOORD0 Location 28 
					                                                  OpDecorate %33 RelaxedPrecision 
					                                                  OpDecorate %34 RelaxedPrecision 
					                                                  OpDecorate %37 RelaxedPrecision 
					                                                  OpDecorate %38 RelaxedPrecision 
					                                                  OpDecorate %61 RelaxedPrecision 
					                                                  OpDecorate %64 RelaxedPrecision 
					                                                  OpDecorate %64 DescriptorSet 64 
					                                                  OpDecorate %64 Binding 64 
					                                                  OpDecorate %65 RelaxedPrecision 
					                                                  OpDecorate %68 RelaxedPrecision 
					                                                  OpDecorate %68 DescriptorSet 68 
					                                                  OpDecorate %68 Binding 68 
					                                                  OpDecorate %69 RelaxedPrecision 
					                                                  OpDecorate %75 RelaxedPrecision 
					                                                  OpDecorate %76 RelaxedPrecision 
					                                                  OpDecorate %77 RelaxedPrecision 
					                                                  OpDecorate %77 DescriptorSet 77 
					                                                  OpDecorate %77 Binding 77 
					                                                  OpDecorate %78 RelaxedPrecision 
					                                                  OpDecorate %79 RelaxedPrecision 
					                                                  OpDecorate %79 DescriptorSet 79 
					                                                  OpDecorate %79 Binding 79 
					                                                  OpDecorate %80 RelaxedPrecision 
					                                                  OpDecorate %85 RelaxedPrecision 
					                                                  OpDecorate %86 RelaxedPrecision 
					                                                  OpDecorate %87 RelaxedPrecision 
					                                                  OpDecorate %88 RelaxedPrecision 
					                                                  OpDecorate %89 RelaxedPrecision 
					                                                  OpDecorate %90 RelaxedPrecision 
					                                                  OpDecorate %99 RelaxedPrecision 
					                                                  OpDecorate %100 RelaxedPrecision 
					                                                  OpDecorate %101 RelaxedPrecision 
					                                                  OpDecorate %102 RelaxedPrecision 
					                                                  OpDecorate %103 RelaxedPrecision 
					                                                  OpDecorate %111 RelaxedPrecision 
					                                                  OpDecorate %112 RelaxedPrecision 
					                                                  OpDecorate %113 RelaxedPrecision 
					                                                  OpDecorate %114 RelaxedPrecision 
					                                                  OpDecorate %115 RelaxedPrecision 
					                                                  OpDecorate %116 RelaxedPrecision 
					                                                  OpDecorate %117 RelaxedPrecision 
					                                                  OpDecorate %118 RelaxedPrecision 
					                                                  OpDecorate %119 RelaxedPrecision 
					                                                  OpDecorate %199 Location 199 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeBool 
					                                           %7 = OpTypePointer Private %6 
					                             Private bool* %8 = OpVariable Private 
					                                           %9 = OpTypeFloat 32 
					                                          %10 = OpTypeVector %9 2 
					                                          %11 = OpTypeVector %9 4 
					                                          %12 = OpTypeStruct %9 %9 %10 %11 
					                                          %13 = OpTypePointer Uniform %12 
					Uniform struct {f32; f32; f32_2; f32_4;}* %14 = OpVariable Uniform 
					                                          %15 = OpTypeInt 32 1 
					                                      i32 %16 = OpConstant 2 
					                                          %17 = OpTypeInt 32 0 
					                                      u32 %18 = OpConstant 1 
					                                          %19 = OpTypePointer Uniform %9 
					                                      f32 %22 = OpConstant 3,674022E-40 
					                                          %24 = OpTypeVector %9 3 
					                                          %25 = OpTypePointer Private %24 
					                           Private f32_3* %26 = OpVariable Private 
					                                          %27 = OpTypePointer Input %10 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      i32 %30 = OpConstant 3 
					                                          %31 = OpTypePointer Uniform %11 
					                                          %42 = OpTypePointer Private %9 
					                             Private f32* %43 = OpVariable Private 
					                                      f32 %47 = OpConstant 3,674022E-40 
					                                          %50 = OpTypePointer Function %9 
					                                      u32 %59 = OpConstant 2 
					                           Private f32_3* %61 = OpVariable Private 
					                                          %62 = OpTypeImage %9 Dim2D 0 0 0 1 Unknown 
					                                          %63 = OpTypePointer UniformConstant %62 
					     UniformConstant read_only Texture2D* %64 = OpVariable UniformConstant 
					                                          %66 = OpTypeSampler 
					                                          %67 = OpTypePointer UniformConstant %66 
					                 UniformConstant sampler* %68 = OpVariable UniformConstant 
					                                          %70 = OpTypeSampledImage %62 
					                           Private f32_3* %76 = OpVariable Private 
					     UniformConstant read_only Texture2D* %77 = OpVariable UniformConstant 
					                 UniformConstant sampler* %79 = OpVariable UniformConstant 
					                           Private f32_3* %86 = OpVariable Private 
					                             Private f32* %91 = OpVariable Private 
					                                      i32 %92 = OpConstant 1 
					                           Private f32_3* %97 = OpVariable Private 
					                          Private f32_3* %104 = OpVariable Private 
					                                   f32_3 %122 = OpConstantComposite %47 %47 %47 
					                          Private f32_3* %124 = OpVariable Private 
					                                         %143 = OpTypeVector %6 3 
					                                         %144 = OpTypePointer Private %143 
					                         Private bool_3* %145 = OpVariable Private 
					                                     f32 %148 = OpConstant 3,674022E-40 
					                                   f32_4 %149 = OpConstantComposite %148 %148 %148 %22 
					                                         %150 = OpTypeVector %6 4 
					                                         %153 = OpTypePointer Function %24 
					                                     u32 %156 = OpConstant 0 
					                                         %198 = OpTypePointer Output %11 
					                           Output f32_4* %199 = OpVariable Output 
					                                     i32 %200 = OpConstant 0 
					                                     u32 %218 = OpConstant 3 
					                                         %219 = OpTypePointer Output %9 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                            Function f32* %51 = OpVariable Function 
					                         Function f32_3* %154 = OpVariable Function 
					                           Function f32* %159 = OpVariable Function 
					                           Function f32* %171 = OpVariable Function 
					                           Function f32* %183 = OpVariable Function 
					                             Uniform f32* %20 = OpAccessChain %14 %16 %18 
					                                      f32 %21 = OpLoad %20 
					                                     bool %23 = OpFOrdLessThan %21 %22 
					                                                  OpStore %8 %23 
					                                    f32_2 %29 = OpLoad vs_TEXCOORD0 
					                           Uniform f32_4* %32 = OpAccessChain %14 %30 
					                                    f32_4 %33 = OpLoad %32 
					                                    f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                    f32_2 %35 = OpFMul %29 %34 
					                           Uniform f32_4* %36 = OpAccessChain %14 %30 
					                                    f32_4 %37 = OpLoad %36 
					                                    f32_2 %38 = OpVectorShuffle %37 %37 2 3 
					                                    f32_2 %39 = OpFAdd %35 %38 
					                                    f32_3 %40 = OpLoad %26 
					                                    f32_3 %41 = OpVectorShuffle %40 %39 3 4 2 
					                                                  OpStore %26 %41 
					                             Private f32* %44 = OpAccessChain %26 %18 
					                                      f32 %45 = OpLoad %44 
					                                      f32 %46 = OpFNegate %45 
					                                      f32 %48 = OpFAdd %46 %47 
					                                                  OpStore %43 %48 
					                                     bool %49 = OpLoad %8 
					                                                  OpSelectionMerge %53 None 
					                                                  OpBranchConditional %49 %52 %55 
					                                          %52 = OpLabel 
					                                      f32 %54 = OpLoad %43 
					                                                  OpStore %51 %54 
					                                                  OpBranch %53 
					                                          %55 = OpLabel 
					                             Private f32* %56 = OpAccessChain %26 %18 
					                                      f32 %57 = OpLoad %56 
					                                                  OpStore %51 %57 
					                                                  OpBranch %53 
					                                          %53 = OpLabel 
					                                      f32 %58 = OpLoad %51 
					                             Private f32* %60 = OpAccessChain %26 %59 
					                                                  OpStore %60 %58 
					                      read_only Texture2D %65 = OpLoad %64 
					                                  sampler %69 = OpLoad %68 
					               read_only Texture2DSampled %71 = OpSampledImage %65 %69 
					                                    f32_3 %72 = OpLoad %26 
					                                    f32_2 %73 = OpVectorShuffle %72 %72 0 2 
					                                    f32_4 %74 = OpImageSampleImplicitLod %71 %73 
					                                    f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
					                                                  OpStore %61 %75 
					                      read_only Texture2D %78 = OpLoad %77 
					                                  sampler %80 = OpLoad %79 
					               read_only Texture2DSampled %81 = OpSampledImage %78 %80 
					                                    f32_3 %82 = OpLoad %26 
					                                    f32_2 %83 = OpVectorShuffle %82 %82 0 1 
					                                    f32_4 %84 = OpImageSampleImplicitLod %81 %83 
					                                    f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                                  OpStore %76 %85 
					                                    f32_3 %87 = OpLoad %61 
					                                    f32_3 %88 = OpLoad %76 
					                                    f32_3 %89 = OpFNegate %88 
					                                    f32_3 %90 = OpFAdd %87 %89 
					                                                  OpStore %86 %90 
					                             Uniform f32* %93 = OpAccessChain %14 %92 
					                                      f32 %94 = OpLoad %93 
					                                      f32 %95 = OpFNegate %94 
					                                      f32 %96 = OpFAdd %95 %47 
					                                                  OpStore %91 %96 
					                                      f32 %98 = OpLoad %91 
					                                    f32_3 %99 = OpCompositeConstruct %98 %98 %98 
					                                   f32_3 %100 = OpLoad %86 
					                                   f32_3 %101 = OpFMul %99 %100 
					                                   f32_3 %102 = OpLoad %76 
					                                   f32_3 %103 = OpFAdd %101 %102 
					                                                  OpStore %97 %103 
					                            Uniform f32* %105 = OpAccessChain %14 %92 
					                                     f32 %106 = OpLoad %105 
					                            Uniform f32* %107 = OpAccessChain %14 %92 
					                                     f32 %108 = OpLoad %107 
					                            Uniform f32* %109 = OpAccessChain %14 %92 
					                                     f32 %110 = OpLoad %109 
					                                   f32_3 %111 = OpCompositeConstruct %106 %108 %110 
					                                     f32 %112 = OpCompositeExtract %111 0 
					                                     f32 %113 = OpCompositeExtract %111 1 
					                                     f32 %114 = OpCompositeExtract %111 2 
					                                   f32_3 %115 = OpCompositeConstruct %112 %113 %114 
					                                   f32_3 %116 = OpLoad %86 
					                                   f32_3 %117 = OpFMul %115 %116 
					                                   f32_3 %118 = OpLoad %76 
					                                   f32_3 %119 = OpFAdd %117 %118 
					                                                  OpStore %104 %119 
					                                   f32_3 %120 = OpLoad %97 
					                                   f32_3 %121 = OpFNegate %120 
					                                   f32_3 %123 = OpFAdd %121 %122 
					                                                  OpStore %26 %123 
					                                   f32_3 %125 = OpLoad %104 
					                                   f32_3 %126 = OpLoad %104 
					                                   f32_3 %127 = OpFAdd %125 %126 
					                                                  OpStore %124 %127 
					                                   f32_3 %128 = OpLoad %26 
					                                   f32_3 %129 = OpLoad %124 
					                                   f32_3 %130 = OpFDiv %128 %129 
					                                                  OpStore %26 %130 
					                                   f32_3 %131 = OpLoad %26 
					                                   f32_3 %132 = OpFNegate %131 
					                                   f32_3 %133 = OpFAdd %132 %122 
					                                                  OpStore %26 %133 
					                                   f32_3 %134 = OpLoad %104 
					                                   f32_3 %135 = OpFNegate %134 
					                                   f32_3 %136 = OpFAdd %135 %122 
					                                                  OpStore %124 %136 
					                                   f32_3 %137 = OpLoad %124 
					                                   f32_3 %138 = OpLoad %124 
					                                   f32_3 %139 = OpFAdd %137 %138 
					                                                  OpStore %124 %139 
					                                   f32_3 %140 = OpLoad %97 
					                                   f32_3 %141 = OpLoad %124 
					                                   f32_3 %142 = OpFDiv %140 %141 
					                                                  OpStore %97 %142 
					                                   f32_3 %146 = OpLoad %104 
					                                   f32_4 %147 = OpVectorShuffle %146 %146 0 1 2 0 
					                                  bool_4 %151 = OpFOrdLessThan %147 %149 
					                                  bool_3 %152 = OpVectorShuffle %151 %151 0 1 2 
					                                                  OpStore %145 %152 
					                                   f32_3 %155 = OpLoad %26 
					                                                  OpStore %154 %155 
					                           Private bool* %157 = OpAccessChain %145 %156 
					                                    bool %158 = OpLoad %157 
					                                                  OpSelectionMerge %161 None 
					                                                  OpBranchConditional %158 %160 %164 
					                                         %160 = OpLabel 
					                            Private f32* %162 = OpAccessChain %26 %156 
					                                     f32 %163 = OpLoad %162 
					                                                  OpStore %159 %163 
					                                                  OpBranch %161 
					                                         %164 = OpLabel 
					                            Private f32* %165 = OpAccessChain %97 %156 
					                                     f32 %166 = OpLoad %165 
					                                                  OpStore %159 %166 
					                                                  OpBranch %161 
					                                         %161 = OpLabel 
					                                     f32 %167 = OpLoad %159 
					                           Function f32* %168 = OpAccessChain %154 %156 
					                                                  OpStore %168 %167 
					                           Private bool* %169 = OpAccessChain %145 %18 
					                                    bool %170 = OpLoad %169 
					                                                  OpSelectionMerge %173 None 
					                                                  OpBranchConditional %170 %172 %176 
					                                         %172 = OpLabel 
					                            Private f32* %174 = OpAccessChain %26 %18 
					                                     f32 %175 = OpLoad %174 
					                                                  OpStore %171 %175 
					                                                  OpBranch %173 
					                                         %176 = OpLabel 
					                            Private f32* %177 = OpAccessChain %97 %18 
					                                     f32 %178 = OpLoad %177 
					                                                  OpStore %171 %178 
					                                                  OpBranch %173 
					                                         %173 = OpLabel 
					                                     f32 %179 = OpLoad %171 
					                           Function f32* %180 = OpAccessChain %154 %18 
					                                                  OpStore %180 %179 
					                           Private bool* %181 = OpAccessChain %145 %59 
					                                    bool %182 = OpLoad %181 
					                                                  OpSelectionMerge %185 None 
					                                                  OpBranchConditional %182 %184 %188 
					                                         %184 = OpLabel 
					                            Private f32* %186 = OpAccessChain %26 %59 
					                                     f32 %187 = OpLoad %186 
					                                                  OpStore %183 %187 
					                                                  OpBranch %185 
					                                         %188 = OpLabel 
					                            Private f32* %189 = OpAccessChain %97 %59 
					                                     f32 %190 = OpLoad %189 
					                                                  OpStore %183 %190 
					                                                  OpBranch %185 
					                                         %185 = OpLabel 
					                                     f32 %191 = OpLoad %183 
					                           Function f32* %192 = OpAccessChain %154 %59 
					                                                  OpStore %192 %191 
					                                   f32_3 %193 = OpLoad %154 
					                                                  OpStore %26 %193 
					                                   f32_3 %194 = OpLoad %104 
					                                   f32_3 %195 = OpFNegate %194 
					                                   f32_3 %196 = OpLoad %26 
					                                   f32_3 %197 = OpFAdd %195 %196 
					                                                  OpStore %26 %197 
					                            Uniform f32* %201 = OpAccessChain %14 %200 
					                                     f32 %202 = OpLoad %201 
					                            Uniform f32* %203 = OpAccessChain %14 %200 
					                                     f32 %204 = OpLoad %203 
					                            Uniform f32* %205 = OpAccessChain %14 %200 
					                                     f32 %206 = OpLoad %205 
					                                   f32_3 %207 = OpCompositeConstruct %202 %204 %206 
					                                     f32 %208 = OpCompositeExtract %207 0 
					                                     f32 %209 = OpCompositeExtract %207 1 
					                                     f32 %210 = OpCompositeExtract %207 2 
					                                   f32_3 %211 = OpCompositeConstruct %208 %209 %210 
					                                   f32_3 %212 = OpLoad %26 
					                                   f32_3 %213 = OpFMul %211 %212 
					                                   f32_3 %214 = OpLoad %104 
					                                   f32_3 %215 = OpFAdd %213 %214 
					                                   f32_4 %216 = OpLoad %199 
					                                   f32_4 %217 = OpVectorShuffle %216 %215 4 5 6 3 
					                                                  OpStore %199 %217 
					                             Output f32* %220 = OpAccessChain %199 %218 
					                                                  OpStore %220 %47 
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
						vec4 unused_0_3;
						vec2 _MainTex_TexelSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bvec3 u_xlatb3;
					float u_xlat4;
					float u_xlat12;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4 = (-u_xlat1.y) + 1.0;
					    u_xlat1.z = (u_xlatb0) ? u_xlat4 : u_xlat1.y;
					    u_xlat10_0 = texture(_MainTex2, u_xlat1.xz);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + (-u_xlat10_1.xyz);
					    u_xlat12 = (-_Value2) + 1.0;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat16_0.xyz + u_xlat10_1.xyz;
					    u_xlat0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat16_0.xyz + u_xlat10_1.xyz;
					    u_xlat1.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat1.xyz / u_xlat3.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = u_xlat2.xyz / u_xlat3.xyz;
					    u_xlatb3.xyz = lessThan(u_xlat0.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
					    {
					        vec3 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat1.x : u_xlat2.x;
					        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat1.y : u_xlat2.y;
					        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat1.z : u_xlat2.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat1.xyz + u_xlat0.xyz;
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