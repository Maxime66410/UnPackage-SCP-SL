Shader "CameraFilterPack/Gradients_Desert" {
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
			GpuProgramID 35805
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
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat5;
					float u_xlat8;
					float u_xlat9;
					float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					float u_xlat16_10;
					void main()
					{
					    u_xlat0.x = float(-0.699999988);
					    u_xlat0.z = float(-0.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_9 = dot(u_xlat10_1.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_10 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_10 + u_xlat16_9;
					    u_xlat10 = (-u_xlat9) * 20.0 + 0.800000012;
					    u_xlat0.y = max(u_xlat10, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(0.850000024, 0.449999988, 0.5);
					    u_xlat10 = u_xlat9 * 2.5;
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyz + vec3(0.699999988, 0.300000012, 0.0);
					    u_xlat10 = u_xlat9 + -0.400000006;
					    u_xlatb9 = 0.400000006<u_xlat9;
					    u_xlat2.x = u_xlat10 * 2.00000024;
					    u_xlat2.x = u_xlat2.x;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat5 = u_xlat2.x * -2.0 + 3.0;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * u_xlat5;
					    u_xlat2.xy = u_xlat2.xx * vec2(-1.0, -0.199999988) + vec2(1.0, 1.0);
					    u_xlat8 = (-u_xlat10) * 1.66666663 + 1.0;
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat10 = -abs(u_xlat10) + 1.0;
					    u_xlat10 = u_xlat10 * 1.5;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat8 = sqrt(u_xlat8);
					    u_xlat2.xy = vec2(u_xlat8) * u_xlat2.xy;
					    u_xlat2.z = 1.0;
					    u_xlat2.xyz = sqrt(u_xlat2.xyz);
					    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat10) + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat0.xyz + u_xlat10_1.xyz;
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
					; Bound: 227
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %204 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 22 
					                                             OpMemberDecorate %25 0 Offset 25 
					                                             OpMemberDecorate %25 1 Offset 25 
					                                             OpMemberDecorate %25 2 RelaxedPrecision 
					                                             OpMemberDecorate %25 2 Offset 25 
					                                             OpDecorate %25 Block 
					                                             OpDecorate %27 DescriptorSet 27 
					                                             OpDecorate %27 Binding 27 
					                                             OpDecorate %32 RelaxedPrecision 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %36 RelaxedPrecision 
					                                             OpDecorate %37 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %42 DescriptorSet 42 
					                                             OpDecorate %42 Binding 42 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %46 DescriptorSet 46 
					                                             OpDecorate %46 Binding 46 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %200 RelaxedPrecision 
					                                             OpDecorate %201 RelaxedPrecision 
					                                             OpDecorate %204 Location 204 
					                                             OpDecorate %219 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                 f32 %10 = OpConstant 3,674022E-40 
					                                     %11 = OpTypeInt 32 0 
					                                 u32 %12 = OpConstant 0 
					                                     %13 = OpTypePointer Private %6 
					                                 f32 %15 = OpConstant 3,674022E-40 
					                                 u32 %16 = OpConstant 2 
					                                     %18 = OpTypeVector %6 2 
					                                     %19 = OpTypePointer Private %18 
					                      Private f32_2* %20 = OpVariable Private 
					                                     %21 = OpTypePointer Input %18 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %24 = OpTypeVector %6 4 
					                                     %25 = OpTypeStruct %6 %6 %24 
					                                     %26 = OpTypePointer Uniform %25 
					  Uniform struct {f32; f32; f32_4;}* %27 = OpVariable Uniform 
					                                     %28 = OpTypeInt 32 1 
					                                 i32 %29 = OpConstant 2 
					                                     %30 = OpTypePointer Uniform %24 
					                      Private f32_3* %39 = OpVariable Private 
					                                     %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %41 = OpTypePointer UniformConstant %40 
					UniformConstant read_only Texture2D* %42 = OpVariable UniformConstant 
					                                     %44 = OpTypeSampler 
					                                     %45 = OpTypePointer UniformConstant %44 
					            UniformConstant sampler* %46 = OpVariable UniformConstant 
					                                     %48 = OpTypeSampledImage %40 
					                        Private f32* %53 = OpVariable Private 
					                                 f32 %55 = OpConstant 3,674022E-40 
					                                 f32 %56 = OpConstant 3,674022E-40 
					                                 f32 %57 = OpConstant 3,674022E-40 
					                               f32_3 %58 = OpConstantComposite %55 %56 %57 
					                        Private f32* %60 = OpVariable Private 
					                                 f32 %62 = OpConstant 3,674022E-40 
					                                 f32 %64 = OpConstant 3,674022E-40 
					                        Private f32* %66 = OpVariable Private 
					                                 i32 %67 = OpConstant 0 
					                                     %68 = OpTypePointer Uniform %6 
					                        Private f32* %75 = OpVariable Private 
					                                 f32 %78 = OpConstant 3,674022E-40 
					                                 f32 %80 = OpConstant 3,674022E-40 
					                                 f32 %83 = OpConstant 3,674022E-40 
					                                 u32 %85 = OpConstant 1 
					                                 f32 %88 = OpConstant 3,674022E-40 
					                                 f32 %89 = OpConstant 3,674022E-40 
					                                 f32 %90 = OpConstant 3,674022E-40 
					                               f32_3 %91 = OpConstantComposite %88 %89 %90 
					                                 f32 %94 = OpConstant 3,674022E-40 
					                                f32 %103 = OpConstant 3,674022E-40 
					                                f32 %104 = OpConstant 3,674022E-40 
					                              f32_3 %105 = OpConstantComposite %103 %104 %83 
					                                f32 %108 = OpConstant 3,674022E-40 
					                                    %110 = OpTypeBool 
					                                    %111 = OpTypePointer Private %110 
					                      Private bool* %112 = OpVariable Private 
					                                f32 %113 = OpConstant 3,674022E-40 
					                     Private f32_3* %116 = OpVariable Private 
					                                f32 %118 = OpConstant 3,674022E-40 
					                       Private f32* %128 = OpVariable Private 
					                                f32 %132 = OpConstant 3,674022E-40 
					                                f32 %147 = OpConstant 3,674022E-40 
					                                f32 %148 = OpConstant 3,674022E-40 
					                              f32_2 %149 = OpConstantComposite %147 %148 
					                              f32_2 %151 = OpConstantComposite %64 %64 
					                       Private f32* %155 = OpVariable Private 
					                                f32 %158 = OpConstant 3,674022E-40 
					                                f32 %168 = OpConstant 3,674022E-40 
					                                    %185 = OpTypePointer Function %7 
					                              f32_3 %194 = OpConstantComposite %64 %64 %64 
					                                    %203 = OpTypePointer Output %24 
					                      Output f32_4* %204 = OpVariable Output 
					                                i32 %205 = OpConstant 1 
					                                u32 %223 = OpConstant 3 
					                                    %224 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                    Function f32_3* %186 = OpVariable Function 
					                        Private f32* %14 = OpAccessChain %9 %12 
					                                             OpStore %14 %10 
					                        Private f32* %17 = OpAccessChain %9 %16 
					                                             OpStore %17 %15 
					                               f32_2 %23 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %31 = OpAccessChain %27 %29 
					                               f32_4 %32 = OpLoad %31 
					                               f32_2 %33 = OpVectorShuffle %32 %32 0 1 
					                               f32_2 %34 = OpFMul %23 %33 
					                      Uniform f32_4* %35 = OpAccessChain %27 %29 
					                               f32_4 %36 = OpLoad %35 
					                               f32_2 %37 = OpVectorShuffle %36 %36 2 3 
					                               f32_2 %38 = OpFAdd %34 %37 
					                                             OpStore %20 %38 
					                 read_only Texture2D %43 = OpLoad %42 
					                             sampler %47 = OpLoad %46 
					          read_only Texture2DSampled %49 = OpSampledImage %43 %47 
					                               f32_2 %50 = OpLoad %20 
					                               f32_4 %51 = OpImageSampleImplicitLod %49 %50 
					                               f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
					                                             OpStore %39 %52 
					                               f32_3 %54 = OpLoad %39 
					                                 f32 %59 = OpDot %54 %58 
					                                             OpStore %53 %59 
					                                 f32 %61 = OpLoad %53 
					                                 f32 %63 = OpFMul %61 %62 
					                                 f32 %65 = OpFAdd %63 %64 
					                                             OpStore %60 %65 
					                        Uniform f32* %69 = OpAccessChain %27 %67 
					                                 f32 %70 = OpLoad %69 
					                                 f32 %71 = OpLoad %60 
					                                 f32 %72 = OpFMul %70 %71 
					                                 f32 %73 = OpLoad %53 
					                                 f32 %74 = OpFAdd %72 %73 
					                                             OpStore %66 %74 
					                                 f32 %76 = OpLoad %66 
					                                 f32 %77 = OpFNegate %76 
					                                 f32 %79 = OpFMul %77 %78 
					                                 f32 %81 = OpFAdd %79 %80 
					                                             OpStore %75 %81 
					                                 f32 %82 = OpLoad %75 
					                                 f32 %84 = OpExtInst %1 40 %82 %83 
					                        Private f32* %86 = OpAccessChain %9 %85 
					                                             OpStore %86 %84 
					                               f32_3 %87 = OpLoad %9 
					                               f32_3 %92 = OpFAdd %87 %91 
					                                             OpStore %9 %92 
					                                 f32 %93 = OpLoad %66 
					                                 f32 %95 = OpFMul %93 %94 
					                                             OpStore %75 %95 
					                                 f32 %96 = OpLoad %75 
					                                 f32 %97 = OpLoad %75 
					                                 f32 %98 = OpFMul %96 %97 
					                                             OpStore %75 %98 
					                                 f32 %99 = OpLoad %75 
					                              f32_3 %100 = OpCompositeConstruct %99 %99 %99 
					                              f32_3 %101 = OpLoad %9 
					                              f32_3 %102 = OpFMul %100 %101 
					                              f32_3 %106 = OpFAdd %102 %105 
					                                             OpStore %9 %106 
					                                f32 %107 = OpLoad %66 
					                                f32 %109 = OpFAdd %107 %108 
					                                             OpStore %75 %109 
					                                f32 %114 = OpLoad %66 
					                               bool %115 = OpFOrdLessThan %113 %114 
					                                             OpStore %112 %115 
					                                f32 %117 = OpLoad %75 
					                                f32 %119 = OpFMul %117 %118 
					                       Private f32* %120 = OpAccessChain %116 %12 
					                                             OpStore %120 %119 
					                       Private f32* %121 = OpAccessChain %116 %12 
					                                f32 %122 = OpLoad %121 
					                       Private f32* %123 = OpAccessChain %116 %12 
					                                             OpStore %123 %122 
					                       Private f32* %124 = OpAccessChain %116 %12 
					                                f32 %125 = OpLoad %124 
					                                f32 %126 = OpExtInst %1 43 %125 %83 %64 
					                       Private f32* %127 = OpAccessChain %116 %12 
					                                             OpStore %127 %126 
					                       Private f32* %129 = OpAccessChain %116 %12 
					                                f32 %130 = OpLoad %129 
					                                f32 %131 = OpFMul %130 %62 
					                                f32 %133 = OpFAdd %131 %132 
					                                             OpStore %128 %133 
					                       Private f32* %134 = OpAccessChain %116 %12 
					                                f32 %135 = OpLoad %134 
					                       Private f32* %136 = OpAccessChain %116 %12 
					                                f32 %137 = OpLoad %136 
					                                f32 %138 = OpFMul %135 %137 
					                       Private f32* %139 = OpAccessChain %116 %12 
					                                             OpStore %139 %138 
					                       Private f32* %140 = OpAccessChain %116 %12 
					                                f32 %141 = OpLoad %140 
					                                f32 %142 = OpLoad %128 
					                                f32 %143 = OpFMul %141 %142 
					                       Private f32* %144 = OpAccessChain %116 %12 
					                                             OpStore %144 %143 
					                              f32_3 %145 = OpLoad %116 
					                              f32_2 %146 = OpVectorShuffle %145 %145 0 0 
					                              f32_2 %150 = OpFMul %146 %149 
					                              f32_2 %152 = OpFAdd %150 %151 
					                              f32_3 %153 = OpLoad %116 
					                              f32_3 %154 = OpVectorShuffle %153 %152 3 4 2 
					                                             OpStore %116 %154 
					                                f32 %156 = OpLoad %75 
					                                f32 %157 = OpFNegate %156 
					                                f32 %159 = OpFMul %157 %158 
					                                f32 %160 = OpFAdd %159 %64 
					                                             OpStore %155 %160 
					                                f32 %161 = OpLoad %155 
					                                f32 %162 = OpExtInst %1 43 %161 %83 %64 
					                                             OpStore %155 %162 
					                                f32 %163 = OpLoad %75 
					                                f32 %164 = OpExtInst %1 4 %163 
					                                f32 %165 = OpFNegate %164 
					                                f32 %166 = OpFAdd %165 %64 
					                                             OpStore %75 %166 
					                                f32 %167 = OpLoad %75 
					                                f32 %169 = OpFMul %167 %168 
					                                             OpStore %75 %169 
					                                f32 %170 = OpLoad %75 
					                                f32 %171 = OpExtInst %1 43 %170 %83 %64 
					                                             OpStore %75 %171 
					                                f32 %172 = OpLoad %155 
					                                f32 %173 = OpExtInst %1 31 %172 
					                                             OpStore %155 %173 
					                                f32 %174 = OpLoad %155 
					                              f32_2 %175 = OpCompositeConstruct %174 %174 
					                              f32_3 %176 = OpLoad %116 
					                              f32_2 %177 = OpVectorShuffle %176 %176 0 1 
					                              f32_2 %178 = OpFMul %175 %177 
					                              f32_3 %179 = OpLoad %116 
					                              f32_3 %180 = OpVectorShuffle %179 %178 3 4 2 
					                                             OpStore %116 %180 
					                       Private f32* %181 = OpAccessChain %116 %16 
					                                             OpStore %181 %64 
					                              f32_3 %182 = OpLoad %116 
					                              f32_3 %183 = OpExtInst %1 31 %182 
					                                             OpStore %116 %183 
					                               bool %184 = OpLoad %112 
					                                             OpSelectionMerge %188 None 
					                                             OpBranchConditional %184 %187 %190 
					                                    %187 = OpLabel 
					                              f32_3 %189 = OpLoad %116 
					                                             OpStore %186 %189 
					                                             OpBranch %188 
					                                    %190 = OpLabel 
					                              f32_3 %191 = OpLoad %9 
					                                             OpStore %186 %191 
					                                             OpBranch %188 
					                                    %188 = OpLabel 
					                              f32_3 %192 = OpLoad %186 
					                                             OpStore %9 %192 
					                              f32_3 %193 = OpLoad %9 
					                              f32_3 %195 = OpExtInst %1 37 %193 %194 
					                                             OpStore %9 %195 
					                              f32_3 %196 = OpLoad %9 
					                                f32 %197 = OpLoad %75 
					                              f32_3 %198 = OpCompositeConstruct %197 %197 %197 
					                              f32_3 %199 = OpFMul %196 %198 
					                              f32_3 %200 = OpLoad %39 
					                              f32_3 %201 = OpFNegate %200 
					                              f32_3 %202 = OpFAdd %199 %201 
					                                             OpStore %9 %202 
					                       Uniform f32* %206 = OpAccessChain %27 %205 
					                                f32 %207 = OpLoad %206 
					                       Uniform f32* %208 = OpAccessChain %27 %205 
					                                f32 %209 = OpLoad %208 
					                       Uniform f32* %210 = OpAccessChain %27 %205 
					                                f32 %211 = OpLoad %210 
					                              f32_3 %212 = OpCompositeConstruct %207 %209 %211 
					                                f32 %213 = OpCompositeExtract %212 0 
					                                f32 %214 = OpCompositeExtract %212 1 
					                                f32 %215 = OpCompositeExtract %212 2 
					                              f32_3 %216 = OpCompositeConstruct %213 %214 %215 
					                              f32_3 %217 = OpLoad %9 
					                              f32_3 %218 = OpFMul %216 %217 
					                              f32_3 %219 = OpLoad %39 
					                              f32_3 %220 = OpFAdd %218 %219 
					                              f32_4 %221 = OpLoad %204 
					                              f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
					                                             OpStore %204 %222 
					                        Output f32* %225 = OpAccessChain %204 %223 
					                                             OpStore %225 %64 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat5;
					float u_xlat8;
					float u_xlat9;
					float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					float u_xlat16_10;
					void main()
					{
					    u_xlat0.x = float(-0.699999988);
					    u_xlat0.z = float(-0.0);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_9 = dot(u_xlat10_1.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_10 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_10 + u_xlat16_9;
					    u_xlat10 = (-u_xlat9) * 20.0 + 0.800000012;
					    u_xlat0.y = max(u_xlat10, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(0.850000024, 0.449999988, 0.5);
					    u_xlat10 = u_xlat9 * 2.5;
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyz + vec3(0.699999988, 0.300000012, 0.0);
					    u_xlat10 = u_xlat9 + -0.400000006;
					    u_xlatb9 = 0.400000006<u_xlat9;
					    u_xlat2.x = u_xlat10 * 2.00000024;
					    u_xlat2.x = u_xlat2.x;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat5 = u_xlat2.x * -2.0 + 3.0;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * u_xlat5;
					    u_xlat2.xy = u_xlat2.xx * vec2(-1.0, -0.199999988) + vec2(1.0, 1.0);
					    u_xlat8 = (-u_xlat10) * 1.66666663 + 1.0;
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat10 = -abs(u_xlat10) + 1.0;
					    u_xlat10 = u_xlat10 * 1.5;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat8 = sqrt(u_xlat8);
					    u_xlat2.xy = vec2(u_xlat8) * u_xlat2.xy;
					    u_xlat2.z = 1.0;
					    u_xlat2.xyz = sqrt(u_xlat2.xyz);
					    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : u_xlat0.xyz;
					    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat10) + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat0.xyz + u_xlat10_1.xyz;
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