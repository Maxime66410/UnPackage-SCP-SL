Shader "CameraFilterPack/Gradients_Rainbow" {
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
			GpuProgramID 59434
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
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat16_1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_1 + u_xlat16_9;
					    u_xlat1.xy = vec2(u_xlat9) + vec2(-0.649999976, -0.0399999991);
					    u_xlatb9 = u_xlat9<0.5;
					    u_xlat7 = u_xlat1.y * 2.43902445;
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(3.0, 5.0);
					    u_xlat10 = u_xlat7 * -2.0 + 3.0;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat7 = u_xlat7 * u_xlat10;
					    u_xlat1.x = log2(u_xlat1.x);
					    u_xlat4 = (-u_xlat1.y) * u_xlat1.y + 0.150000006;
					    u_xlat1.x = u_xlat1.x * 1.5;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat2.z = (-u_xlat1.x) + 1.0;
					    u_xlat2.y = (u_xlatb9) ? u_xlat7 : u_xlat2.z;
					    u_xlat2.x = max(u_xlat4, u_xlat2.z);
					    u_xlat2.xyz = u_xlat2.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat2.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					; Bound: 190
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %167 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpMemberDecorate %14 2 RelaxedPrecision 
					                                             OpMemberDecorate %14 2 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %33 DescriptorSet 33 
					                                             OpDecorate %33 Binding 33 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %37 RelaxedPrecision 
					                                             OpDecorate %37 DescriptorSet 37 
					                                             OpDecorate %37 Binding 37 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %162 RelaxedPrecision 
					                                             OpDecorate %163 RelaxedPrecision 
					                                             OpDecorate %167 Location 167 
					                                             OpDecorate %182 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %6 %6 %13 
					                                     %15 = OpTypePointer Uniform %14 
					  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 2 
					                                     %19 = OpTypePointer Uniform %13 
					                                     %28 = OpTypeVector %6 3 
					                                     %29 = OpTypePointer Private %28 
					                      Private f32_3* %30 = OpVariable Private 
					                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %32 = OpTypePointer UniformConstant %31 
					UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
					                                     %35 = OpTypeSampler 
					                                     %36 = OpTypePointer UniformConstant %35 
					            UniformConstant sampler* %37 = OpVariable UniformConstant 
					                                     %39 = OpTypeSampledImage %31 
					                                     %44 = OpTypePointer Private %6 
					                        Private f32* %45 = OpVariable Private 
					                                 f32 %47 = OpConstant 3,674022E-40 
					                                 f32 %48 = OpConstant 3,674022E-40 
					                                 f32 %49 = OpConstant 3,674022E-40 
					                               f32_3 %50 = OpConstantComposite %47 %48 %49 
					                        Private f32* %52 = OpVariable Private 
					                                 f32 %54 = OpConstant 3,674022E-40 
					                                 f32 %56 = OpConstant 3,674022E-40 
					                        Private f32* %58 = OpVariable Private 
					                                 i32 %59 = OpConstant 0 
					                                     %60 = OpTypePointer Uniform %6 
					                      Private f32_3* %67 = OpVariable Private 
					                                 f32 %70 = OpConstant 3,674022E-40 
					                                 f32 %71 = OpConstant 3,674022E-40 
					                               f32_2 %72 = OpConstantComposite %70 %71 
					                                     %76 = OpTypeBool 
					                                     %77 = OpTypePointer Private %76 
					                       Private bool* %78 = OpVariable Private 
					                                 f32 %80 = OpConstant 3,674022E-40 
					                        Private f32* %82 = OpVariable Private 
					                                     %83 = OpTypeInt 32 0 
					                                 u32 %84 = OpConstant 1 
					                                 f32 %87 = OpConstant 3,674022E-40 
					                                 f32 %90 = OpConstant 3,674022E-40 
					                                 f32 %95 = OpConstant 3,674022E-40 
					                                 f32 %96 = OpConstant 3,674022E-40 
					                               f32_2 %97 = OpConstantComposite %95 %96 
					                       Private f32* %101 = OpVariable Private 
					                                u32 %111 = OpConstant 0 
					                       Private f32* %116 = OpVariable Private 
					                                f32 %123 = OpConstant 3,674022E-40 
					                                f32 %127 = OpConstant 3,674022E-40 
					                     Private f32_3* %134 = OpVariable Private 
					                                u32 %139 = OpConstant 2 
					                                    %142 = OpTypePointer Function %6 
					                                    %166 = OpTypePointer Output %13 
					                      Output f32_4* %167 = OpVariable Output 
					                                i32 %168 = OpConstant 1 
					                                u32 %186 = OpConstant 3 
					                                    %187 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Function f32* %143 = OpVariable Function 
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
					                 read_only Texture2D %34 = OpLoad %33 
					                             sampler %38 = OpLoad %37 
					          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
					                               f32_2 %41 = OpLoad %9 
					                               f32_4 %42 = OpImageSampleImplicitLod %40 %41 
					                               f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
					                                             OpStore %30 %43 
					                               f32_3 %46 = OpLoad %30 
					                                 f32 %51 = OpDot %46 %50 
					                                             OpStore %45 %51 
					                                 f32 %53 = OpLoad %45 
					                                 f32 %55 = OpFMul %53 %54 
					                                 f32 %57 = OpFAdd %55 %56 
					                                             OpStore %52 %57 
					                        Uniform f32* %61 = OpAccessChain %16 %59 
					                                 f32 %62 = OpLoad %61 
					                                 f32 %63 = OpLoad %52 
					                                 f32 %64 = OpFMul %62 %63 
					                                 f32 %65 = OpLoad %45 
					                                 f32 %66 = OpFAdd %64 %65 
					                                             OpStore %58 %66 
					                                 f32 %68 = OpLoad %58 
					                               f32_2 %69 = OpCompositeConstruct %68 %68 
					                               f32_2 %73 = OpFAdd %69 %72 
					                               f32_3 %74 = OpLoad %67 
					                               f32_3 %75 = OpVectorShuffle %74 %73 3 4 2 
					                                             OpStore %67 %75 
					                                 f32 %79 = OpLoad %58 
					                                bool %81 = OpFOrdLessThan %79 %80 
					                                             OpStore %78 %81 
					                        Private f32* %85 = OpAccessChain %67 %84 
					                                 f32 %86 = OpLoad %85 
					                                 f32 %88 = OpFMul %86 %87 
					                                             OpStore %82 %88 
					                                 f32 %89 = OpLoad %82 
					                                 f32 %91 = OpExtInst %1 43 %89 %90 %56 
					                                             OpStore %82 %91 
					                               f32_3 %92 = OpLoad %67 
					                               f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                               f32_2 %94 = OpExtInst %1 4 %93 
					                               f32_2 %98 = OpFMul %94 %97 
					                               f32_3 %99 = OpLoad %67 
					                              f32_3 %100 = OpVectorShuffle %99 %98 3 4 2 
					                                             OpStore %67 %100 
					                                f32 %102 = OpLoad %82 
					                                f32 %103 = OpFMul %102 %54 
					                                f32 %104 = OpFAdd %103 %95 
					                                             OpStore %101 %104 
					                                f32 %105 = OpLoad %82 
					                                f32 %106 = OpLoad %82 
					                                f32 %107 = OpFMul %105 %106 
					                                             OpStore %82 %107 
					                                f32 %108 = OpLoad %82 
					                                f32 %109 = OpLoad %101 
					                                f32 %110 = OpFMul %108 %109 
					                                             OpStore %82 %110 
					                       Private f32* %112 = OpAccessChain %67 %111 
					                                f32 %113 = OpLoad %112 
					                                f32 %114 = OpExtInst %1 30 %113 
					                       Private f32* %115 = OpAccessChain %67 %111 
					                                             OpStore %115 %114 
					                       Private f32* %117 = OpAccessChain %67 %84 
					                                f32 %118 = OpLoad %117 
					                                f32 %119 = OpFNegate %118 
					                       Private f32* %120 = OpAccessChain %67 %84 
					                                f32 %121 = OpLoad %120 
					                                f32 %122 = OpFMul %119 %121 
					                                f32 %124 = OpFAdd %122 %123 
					                                             OpStore %116 %124 
					                       Private f32* %125 = OpAccessChain %67 %111 
					                                f32 %126 = OpLoad %125 
					                                f32 %128 = OpFMul %126 %127 
					                       Private f32* %129 = OpAccessChain %67 %111 
					                                             OpStore %129 %128 
					                       Private f32* %130 = OpAccessChain %67 %111 
					                                f32 %131 = OpLoad %130 
					                                f32 %132 = OpExtInst %1 29 %131 
					                       Private f32* %133 = OpAccessChain %67 %111 
					                                             OpStore %133 %132 
					                       Private f32* %135 = OpAccessChain %67 %111 
					                                f32 %136 = OpLoad %135 
					                                f32 %137 = OpFNegate %136 
					                                f32 %138 = OpFAdd %137 %56 
					                       Private f32* %140 = OpAccessChain %134 %139 
					                                             OpStore %140 %138 
					                               bool %141 = OpLoad %78 
					                                             OpSelectionMerge %145 None 
					                                             OpBranchConditional %141 %144 %147 
					                                    %144 = OpLabel 
					                                f32 %146 = OpLoad %82 
					                                             OpStore %143 %146 
					                                             OpBranch %145 
					                                    %147 = OpLabel 
					                       Private f32* %148 = OpAccessChain %134 %139 
					                                f32 %149 = OpLoad %148 
					                                             OpStore %143 %149 
					                                             OpBranch %145 
					                                    %145 = OpLabel 
					                                f32 %150 = OpLoad %143 
					                       Private f32* %151 = OpAccessChain %134 %84 
					                                             OpStore %151 %150 
					                                f32 %152 = OpLoad %116 
					                       Private f32* %153 = OpAccessChain %134 %139 
					                                f32 %154 = OpLoad %153 
					                                f32 %155 = OpExtInst %1 40 %152 %154 
					                       Private f32* %156 = OpAccessChain %134 %111 
					                                             OpStore %156 %155 
					                              f32_3 %157 = OpLoad %134 
					                                             OpStore %134 %157 
					                              f32_3 %158 = OpLoad %134 
					                              f32_3 %159 = OpCompositeConstruct %90 %90 %90 
					                              f32_3 %160 = OpCompositeConstruct %56 %56 %56 
					                              f32_3 %161 = OpExtInst %1 43 %158 %159 %160 
					                                             OpStore %134 %161 
					                              f32_3 %162 = OpLoad %30 
					                              f32_3 %163 = OpFNegate %162 
					                              f32_3 %164 = OpLoad %134 
					                              f32_3 %165 = OpFAdd %163 %164 
					                                             OpStore %67 %165 
					                       Uniform f32* %169 = OpAccessChain %16 %168 
					                                f32 %170 = OpLoad %169 
					                       Uniform f32* %171 = OpAccessChain %16 %168 
					                                f32 %172 = OpLoad %171 
					                       Uniform f32* %173 = OpAccessChain %16 %168 
					                                f32 %174 = OpLoad %173 
					                              f32_3 %175 = OpCompositeConstruct %170 %172 %174 
					                                f32 %176 = OpCompositeExtract %175 0 
					                                f32 %177 = OpCompositeExtract %175 1 
					                                f32 %178 = OpCompositeExtract %175 2 
					                              f32_3 %179 = OpCompositeConstruct %176 %177 %178 
					                              f32_3 %180 = OpLoad %67 
					                              f32_3 %181 = OpFMul %179 %180 
					                              f32_3 %182 = OpLoad %30 
					                              f32_3 %183 = OpFAdd %181 %182 
					                              f32_4 %184 = OpLoad %167 
					                              f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
					                                             OpStore %167 %185 
					                        Output f32* %188 = OpAccessChain %167 %186 
					                                             OpStore %188 %56 
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
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat16_1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat7;
					float u_xlat9;
					float u_xlat16_9;
					bool u_xlatb9;
					float u_xlat10;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = u_xlat16_9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat16_1 + u_xlat16_9;
					    u_xlat1.xy = vec2(u_xlat9) + vec2(-0.649999976, -0.0399999991);
					    u_xlatb9 = u_xlat9<0.5;
					    u_xlat7 = u_xlat1.y * 2.43902445;
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat1.xy = abs(u_xlat1.xy) * vec2(3.0, 5.0);
					    u_xlat10 = u_xlat7 * -2.0 + 3.0;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat7 = u_xlat7 * u_xlat10;
					    u_xlat1.x = log2(u_xlat1.x);
					    u_xlat4 = (-u_xlat1.y) * u_xlat1.y + 0.150000006;
					    u_xlat1.x = u_xlat1.x * 1.5;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat2.z = (-u_xlat1.x) + 1.0;
					    u_xlat2.y = (u_xlatb9) ? u_xlat7 : u_xlat2.z;
					    u_xlat2.x = max(u_xlat4, u_xlat2.z);
					    u_xlat2.xyz = u_xlat2.xyz;
					    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat2.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat10_0.xyz;
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