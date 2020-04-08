Shader "CameraFilterPack/FX_Funk" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 40754
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat3;
					bool u_xlatb3;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(2.70440626, 2.12428117, 1.9024688, 2.43993759) + vec4(1.09960902, 0.455078006, 8.44726563, 610.460938);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = (-u_xlat1.x) * 10.0 + u_xlat0.y;
					    u_xlat0.xzw = u_xlat1.xyy * vec3(7.5, 5.0, 12.5) + u_xlat0.xzw;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1 = dot(u_xlat10_1.xzy, vec3(0.200000003, 0.200000003, 0.400000006));
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 4.0;
					    u_xlat0.x = u_xlat0.x * 0.25;
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.x = u_xlat16_1 + u_xlat0.x;
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat3 = u_xlat0.x * 6.0;
					    u_xlat3 = u_xlat3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlatb6.xy = lessThan(u_xlat0.xxxx, vec4(0.333333343, 0.666666687, 0.333333343, 0.666666687)).xy;
					    u_xlat1.xyz = (-u_xlat0.xxx) * vec3(6.0, 6.0, 6.0) + vec3(2.0, 4.0, 6.0);
					    u_xlat2.xy = u_xlat0.xx * vec2(6.0, 6.0) + vec2(-4.0, -2.0);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1.xy = u_xlat1.xy;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0.x = min(u_xlat1.z, 1.0);
					    SV_Target0.z = (u_xlatb6.y) ? u_xlat2.y : u_xlat0.x;
					    SV_Target0.x = u_xlat1.x + u_xlat2.x;
					    SV_Target0.y = (u_xlatb6.x) ? u_xlat3 : u_xlat1.y;
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
					; Bound: 275
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %36 %242 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpMemberDecorate %10 1 RelaxedPrecision 
					                                             OpMemberDecorate %10 1 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD0 Location 36 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %78 DescriptorSet 78 
					                                             OpDecorate %78 Binding 78 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %82 DescriptorSet 82 
					                                             OpDecorate %82 Binding 82 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %242 Location 242 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeStruct %6 %7 
					                                     %11 = OpTypePointer Uniform %10 
					       Uniform struct {f32; f32_4;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 0 
					                                     %15 = OpTypePointer Uniform %6 
					                                 f32 %19 = OpConstant 3,674022E-40 
					                                 f32 %20 = OpConstant 3,674022E-40 
					                                 f32 %21 = OpConstant 3,674022E-40 
					                                 f32 %22 = OpConstant 3,674022E-40 
					                               f32_4 %23 = OpConstantComposite %19 %20 %21 %22 
					                                 f32 %25 = OpConstant 3,674022E-40 
					                                 f32 %26 = OpConstant 3,674022E-40 
					                                 f32 %27 = OpConstant 3,674022E-40 
					                                 f32 %28 = OpConstant 3,674022E-40 
					                               f32_4 %29 = OpConstantComposite %25 %26 %27 %28 
					                                     %31 = OpTypeVector %6 3 
					                                     %32 = OpTypePointer Private %31 
					                      Private f32_3* %33 = OpVariable Private 
					                                     %34 = OpTypeVector %6 2 
					                                     %35 = OpTypePointer Input %34 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %38 = OpConstant 1 
					                                     %39 = OpTypePointer Uniform %7 
					                                     %50 = OpTypeInt 32 0 
					                                 u32 %51 = OpConstant 0 
					                                     %52 = OpTypePointer Private %6 
					                                 f32 %56 = OpConstant 3,674022E-40 
					                                 u32 %58 = OpConstant 1 
					                                 f32 %65 = OpConstant 3,674022E-40 
					                                 f32 %66 = OpConstant 3,674022E-40 
					                                 f32 %67 = OpConstant 3,674022E-40 
					                               f32_3 %68 = OpConstantComposite %65 %66 %67 
					                      Private f32_3* %75 = OpVariable Private 
					                                     %76 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %77 = OpTypePointer UniformConstant %76 
					UniformConstant read_only Texture2D* %78 = OpVariable UniformConstant 
					                                     %80 = OpTypeSampler 
					                                     %81 = OpTypePointer UniformConstant %80 
					            UniformConstant sampler* %82 = OpVariable UniformConstant 
					                                     %84 = OpTypeSampledImage %76 
					                        Private f32* %90 = OpVariable Private 
					                                 f32 %93 = OpConstant 3,674022E-40 
					                                 f32 %94 = OpConstant 3,674022E-40 
					                               f32_3 %95 = OpConstantComposite %93 %93 %94 
					                                u32 %105 = OpConstant 2 
					                                u32 %112 = OpConstant 3 
					                                f32 %121 = OpConstant 3,674022E-40 
					                                f32 %126 = OpConstant 3,674022E-40 
					                                    %129 = OpTypeBool 
					                                    %130 = OpTypePointer Private %129 
					                      Private bool* %131 = OpVariable Private 
					                                    %143 = OpTypePointer Function %6 
					                       Private f32* %183 = OpVariable Private 
					                                f32 %186 = OpConstant 3,674022E-40 
					                                f32 %190 = OpConstant 3,674022E-40 
					                                f32 %191 = OpConstant 3,674022E-40 
					                                    %193 = OpTypeVector %129 2 
					                                    %194 = OpTypePointer Private %193 
					                    Private bool_2* %195 = OpVariable Private 
					                                f32 %198 = OpConstant 3,674022E-40 
					                                f32 %199 = OpConstant 3,674022E-40 
					                              f32_4 %200 = OpConstantComposite %198 %199 %198 %199 
					                                    %201 = OpTypeVector %129 4 
					                              f32_3 %207 = OpConstantComposite %186 %186 %186 
					                                f32 %209 = OpConstant 3,674022E-40 
					                              f32_3 %210 = OpConstantComposite %209 %121 %186 
					                                    %212 = OpTypePointer Private %34 
					                     Private f32_2* %213 = OpVariable Private 
					                              f32_2 %216 = OpConstantComposite %186 %186 
					                                f32 %218 = OpConstant 3,674022E-40 
					                                f32 %219 = OpConstant 3,674022E-40 
					                              f32_2 %220 = OpConstantComposite %218 %219 
					                                    %241 = OpTypePointer Output %7 
					                      Output f32_4* %242 = OpVariable Output 
					                                    %254 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Function f32* %144 = OpVariable Function 
					                      Function f32* %172 = OpVariable Function 
					                      Function f32* %245 = OpVariable Function 
					                      Function f32* %264 = OpVariable Function 
					                        Uniform f32* %16 = OpAccessChain %12 %14 
					                                 f32 %17 = OpLoad %16 
					                               f32_4 %18 = OpCompositeConstruct %17 %17 %17 %17 
					                               f32_4 %24 = OpFMul %18 %23 
					                               f32_4 %30 = OpFAdd %24 %29 
					                                             OpStore %9 %30 
					                               f32_2 %37 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %40 = OpAccessChain %12 %38 
					                               f32_4 %41 = OpLoad %40 
					                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                               f32_2 %43 = OpFMul %37 %42 
					                      Uniform f32_4* %44 = OpAccessChain %12 %38 
					                               f32_4 %45 = OpLoad %44 
					                               f32_2 %46 = OpVectorShuffle %45 %45 2 3 
					                               f32_2 %47 = OpFAdd %43 %46 
					                               f32_3 %48 = OpLoad %33 
					                               f32_3 %49 = OpVectorShuffle %48 %47 3 4 2 
					                                             OpStore %33 %49 
					                        Private f32* %53 = OpAccessChain %33 %51 
					                                 f32 %54 = OpLoad %53 
					                                 f32 %55 = OpFNegate %54 
					                                 f32 %57 = OpFMul %55 %56 
					                        Private f32* %59 = OpAccessChain %9 %58 
					                                 f32 %60 = OpLoad %59 
					                                 f32 %61 = OpFAdd %57 %60 
					                        Private f32* %62 = OpAccessChain %9 %58 
					                                             OpStore %62 %61 
					                               f32_3 %63 = OpLoad %33 
					                               f32_3 %64 = OpVectorShuffle %63 %63 0 1 1 
					                               f32_3 %69 = OpFMul %64 %68 
					                               f32_4 %70 = OpLoad %9 
					                               f32_3 %71 = OpVectorShuffle %70 %70 0 2 3 
					                               f32_3 %72 = OpFAdd %69 %71 
					                               f32_4 %73 = OpLoad %9 
					                               f32_4 %74 = OpVectorShuffle %73 %72 4 1 5 6 
					                                             OpStore %9 %74 
					                 read_only Texture2D %79 = OpLoad %78 
					                             sampler %83 = OpLoad %82 
					          read_only Texture2DSampled %85 = OpSampledImage %79 %83 
					                               f32_3 %86 = OpLoad %33 
					                               f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                               f32_4 %88 = OpImageSampleImplicitLod %85 %87 
					                               f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
					                                             OpStore %75 %89 
					                               f32_3 %91 = OpLoad %75 
					                               f32_3 %92 = OpVectorShuffle %91 %91 0 2 1 
					                                 f32 %96 = OpDot %92 %95 
					                                             OpStore %90 %96 
					                               f32_4 %97 = OpLoad %9 
					                               f32_4 %98 = OpExtInst %1 13 %97 
					                                             OpStore %9 %98 
					                        Private f32* %99 = OpAccessChain %9 %58 
					                                f32 %100 = OpLoad %99 
					                       Private f32* %101 = OpAccessChain %9 %51 
					                                f32 %102 = OpLoad %101 
					                                f32 %103 = OpFAdd %100 %102 
					                       Private f32* %104 = OpAccessChain %9 %51 
					                                             OpStore %104 %103 
					                       Private f32* %106 = OpAccessChain %9 %105 
					                                f32 %107 = OpLoad %106 
					                       Private f32* %108 = OpAccessChain %9 %51 
					                                f32 %109 = OpLoad %108 
					                                f32 %110 = OpFAdd %107 %109 
					                       Private f32* %111 = OpAccessChain %9 %51 
					                                             OpStore %111 %110 
					                       Private f32* %113 = OpAccessChain %9 %112 
					                                f32 %114 = OpLoad %113 
					                       Private f32* %115 = OpAccessChain %9 %51 
					                                f32 %116 = OpLoad %115 
					                                f32 %117 = OpFAdd %114 %116 
					                       Private f32* %118 = OpAccessChain %9 %51 
					                                             OpStore %118 %117 
					                       Private f32* %119 = OpAccessChain %9 %51 
					                                f32 %120 = OpLoad %119 
					                                f32 %122 = OpFAdd %120 %121 
					                       Private f32* %123 = OpAccessChain %9 %51 
					                                             OpStore %123 %122 
					                       Private f32* %124 = OpAccessChain %9 %51 
					                                f32 %125 = OpLoad %124 
					                                f32 %127 = OpFMul %125 %126 
					                       Private f32* %128 = OpAccessChain %9 %51 
					                                             OpStore %128 %127 
					                       Private f32* %132 = OpAccessChain %9 %51 
					                                f32 %133 = OpLoad %132 
					                       Private f32* %134 = OpAccessChain %9 %51 
					                                f32 %135 = OpLoad %134 
					                                f32 %136 = OpFNegate %135 
					                               bool %137 = OpFOrdGreaterThanEqual %133 %136 
					                                             OpStore %131 %137 
					                       Private f32* %138 = OpAccessChain %9 %51 
					                                f32 %139 = OpLoad %138 
					                                f32 %140 = OpExtInst %1 10 %139 
					                       Private f32* %141 = OpAccessChain %9 %51 
					                                             OpStore %141 %140 
					                               bool %142 = OpLoad %131 
					                                             OpSelectionMerge %146 None 
					                                             OpBranchConditional %142 %145 %149 
					                                    %145 = OpLabel 
					                       Private f32* %147 = OpAccessChain %9 %51 
					                                f32 %148 = OpLoad %147 
					                                             OpStore %144 %148 
					                                             OpBranch %146 
					                                    %149 = OpLabel 
					                       Private f32* %150 = OpAccessChain %9 %51 
					                                f32 %151 = OpLoad %150 
					                                f32 %152 = OpFNegate %151 
					                                             OpStore %144 %152 
					                                             OpBranch %146 
					                                    %146 = OpLabel 
					                                f32 %153 = OpLoad %144 
					                       Private f32* %154 = OpAccessChain %9 %51 
					                                             OpStore %154 %153 
					                                f32 %155 = OpLoad %90 
					                       Private f32* %156 = OpAccessChain %9 %51 
					                                f32 %157 = OpLoad %156 
					                                f32 %158 = OpFAdd %155 %157 
					                       Private f32* %159 = OpAccessChain %9 %51 
					                                             OpStore %159 %158 
					                       Private f32* %160 = OpAccessChain %9 %51 
					                                f32 %161 = OpLoad %160 
					                       Private f32* %162 = OpAccessChain %9 %51 
					                                f32 %163 = OpLoad %162 
					                                f32 %164 = OpFNegate %163 
					                               bool %165 = OpFOrdGreaterThanEqual %161 %164 
					                                             OpStore %131 %165 
					                       Private f32* %166 = OpAccessChain %9 %51 
					                                f32 %167 = OpLoad %166 
					                                f32 %168 = OpExtInst %1 4 %167 
					                                f32 %169 = OpExtInst %1 10 %168 
					                       Private f32* %170 = OpAccessChain %9 %51 
					                                             OpStore %170 %169 
					                               bool %171 = OpLoad %131 
					                                             OpSelectionMerge %174 None 
					                                             OpBranchConditional %171 %173 %177 
					                                    %173 = OpLabel 
					                       Private f32* %175 = OpAccessChain %9 %51 
					                                f32 %176 = OpLoad %175 
					                                             OpStore %172 %176 
					                                             OpBranch %174 
					                                    %177 = OpLabel 
					                       Private f32* %178 = OpAccessChain %9 %51 
					                                f32 %179 = OpLoad %178 
					                                f32 %180 = OpFNegate %179 
					                                             OpStore %172 %180 
					                                             OpBranch %174 
					                                    %174 = OpLabel 
					                                f32 %181 = OpLoad %172 
					                       Private f32* %182 = OpAccessChain %9 %51 
					                                             OpStore %182 %181 
					                       Private f32* %184 = OpAccessChain %9 %51 
					                                f32 %185 = OpLoad %184 
					                                f32 %187 = OpFMul %185 %186 
					                                             OpStore %183 %187 
					                                f32 %188 = OpLoad %183 
					                                             OpStore %183 %188 
					                                f32 %189 = OpLoad %183 
					                                f32 %192 = OpExtInst %1 43 %189 %190 %191 
					                                             OpStore %183 %192 
					                              f32_4 %196 = OpLoad %9 
					                              f32_4 %197 = OpVectorShuffle %196 %196 0 0 0 0 
					                             bool_4 %202 = OpFOrdLessThan %197 %200 
					                             bool_2 %203 = OpVectorShuffle %202 %202 0 1 
					                                             OpStore %195 %203 
					                              f32_4 %204 = OpLoad %9 
					                              f32_3 %205 = OpVectorShuffle %204 %204 0 0 0 
					                              f32_3 %206 = OpFNegate %205 
					                              f32_3 %208 = OpFMul %206 %207 
					                              f32_3 %211 = OpFAdd %208 %210 
					                                             OpStore %33 %211 
					                              f32_4 %214 = OpLoad %9 
					                              f32_2 %215 = OpVectorShuffle %214 %214 0 0 
					                              f32_2 %217 = OpFMul %215 %216 
					                              f32_2 %221 = OpFAdd %217 %220 
					                                             OpStore %213 %221 
					                              f32_2 %222 = OpLoad %213 
					                              f32_2 %223 = OpCompositeConstruct %190 %190 
					                              f32_2 %224 = OpCompositeConstruct %191 %191 
					                              f32_2 %225 = OpExtInst %1 43 %222 %223 %224 
					                                             OpStore %213 %225 
					                              f32_3 %226 = OpLoad %33 
					                              f32_2 %227 = OpVectorShuffle %226 %226 0 1 
					                              f32_3 %228 = OpLoad %33 
					                              f32_3 %229 = OpVectorShuffle %228 %227 3 4 2 
					                                             OpStore %33 %229 
					                              f32_3 %230 = OpLoad %33 
					                              f32_2 %231 = OpVectorShuffle %230 %230 0 1 
					                              f32_2 %232 = OpCompositeConstruct %190 %190 
					                              f32_2 %233 = OpCompositeConstruct %191 %191 
					                              f32_2 %234 = OpExtInst %1 43 %231 %232 %233 
					                              f32_3 %235 = OpLoad %33 
					                              f32_3 %236 = OpVectorShuffle %235 %234 3 4 2 
					                                             OpStore %33 %236 
					                       Private f32* %237 = OpAccessChain %33 %105 
					                                f32 %238 = OpLoad %237 
					                                f32 %239 = OpExtInst %1 37 %238 %191 
					                       Private f32* %240 = OpAccessChain %9 %51 
					                                             OpStore %240 %239 
					                      Private bool* %243 = OpAccessChain %195 %58 
					                               bool %244 = OpLoad %243 
					                                             OpSelectionMerge %247 None 
					                                             OpBranchConditional %244 %246 %250 
					                                    %246 = OpLabel 
					                       Private f32* %248 = OpAccessChain %213 %58 
					                                f32 %249 = OpLoad %248 
					                                             OpStore %245 %249 
					                                             OpBranch %247 
					                                    %250 = OpLabel 
					                       Private f32* %251 = OpAccessChain %9 %51 
					                                f32 %252 = OpLoad %251 
					                                             OpStore %245 %252 
					                                             OpBranch %247 
					                                    %247 = OpLabel 
					                                f32 %253 = OpLoad %245 
					                        Output f32* %255 = OpAccessChain %242 %105 
					                                             OpStore %255 %253 
					                       Private f32* %256 = OpAccessChain %33 %51 
					                                f32 %257 = OpLoad %256 
					                       Private f32* %258 = OpAccessChain %213 %51 
					                                f32 %259 = OpLoad %258 
					                                f32 %260 = OpFAdd %257 %259 
					                        Output f32* %261 = OpAccessChain %242 %51 
					                                             OpStore %261 %260 
					                      Private bool* %262 = OpAccessChain %195 %51 
					                               bool %263 = OpLoad %262 
					                                             OpSelectionMerge %266 None 
					                                             OpBranchConditional %263 %265 %268 
					                                    %265 = OpLabel 
					                                f32 %267 = OpLoad %183 
					                                             OpStore %264 %267 
					                                             OpBranch %266 
					                                    %268 = OpLabel 
					                       Private f32* %269 = OpAccessChain %33 %58 
					                                f32 %270 = OpLoad %269 
					                                             OpStore %264 %270 
					                                             OpBranch %266 
					                                    %266 = OpLabel 
					                                f32 %271 = OpLoad %264 
					                        Output f32* %272 = OpAccessChain %242 %58 
					                                             OpStore %272 %271 
					                        Output f32* %273 = OpAccessChain %242 %112 
					                                             OpStore %273 %191 
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
						vec4 unused_0_2;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					float u_xlat3;
					bool u_xlatb3;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0 = vec4(_TimeX) * vec4(2.70440626, 2.12428117, 1.9024688, 2.43993759) + vec4(1.09960902, 0.455078006, 8.44726563, 610.460938);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = (-u_xlat1.x) * 10.0 + u_xlat0.y;
					    u_xlat0.xzw = u_xlat1.xyy * vec3(7.5, 5.0, 12.5) + u_xlat0.xzw;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1 = dot(u_xlat10_1.xzy, vec3(0.200000003, 0.200000003, 0.400000006));
					    u_xlat0 = sin(u_xlat0);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 4.0;
					    u_xlat0.x = u_xlat0.x * 0.25;
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.x = u_xlat16_1 + u_xlat0.x;
					    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat3 = u_xlat0.x * 6.0;
					    u_xlat3 = u_xlat3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlatb6.xy = lessThan(u_xlat0.xxxx, vec4(0.333333343, 0.666666687, 0.333333343, 0.666666687)).xy;
					    u_xlat1.xyz = (-u_xlat0.xxx) * vec3(6.0, 6.0, 6.0) + vec3(2.0, 4.0, 6.0);
					    u_xlat2.xy = u_xlat0.xx * vec2(6.0, 6.0) + vec2(-4.0, -2.0);
					    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
					    u_xlat1.xy = u_xlat1.xy;
					    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
					    u_xlat0.x = min(u_xlat1.z, 1.0);
					    SV_Target0.z = (u_xlatb6.y) ? u_xlat2.y : u_xlat0.x;
					    SV_Target0.x = u_xlat1.x + u_xlat2.x;
					    SV_Target0.y = (u_xlatb6.x) ? u_xlat3 : u_xlat1.y;
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