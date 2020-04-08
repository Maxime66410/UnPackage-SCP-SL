Shader "CameraFilterPack/TV_PlanetMars" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 33294
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
					uniform 	float _Distortion;
					uniform 	float Fade;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat16_1;
					vec3 u_xlat2;
					vec3 u_xlat16_2;
					float u_xlat16_4;
					vec2 u_xlat7;
					float u_xlat9;
					float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = (-u_xlat16_9) * 0.115896732 + 1.0;
					    u_xlat16_4 = u_xlat16_9 * u_xlat16_9;
					    u_xlat16_1 = u_xlat16_4 * 2.58329701 + u_xlat16_1;
					    u_xlat16_2.xyz = vec3(u_xlat16_9) * vec3(0.616473019, 3.36968088, 0.169122502) + vec3(0.860117733, 1.0, 0.317398727);
					    u_xlat9 = u_xlat16_9 * _Distortion;
					    u_xlat7.xy = vec2(u_xlat9) * vec2(2.4000001, 1.5999999);
					    u_xlat7.xy = u_xlat7.xy * u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * u_xlat7.xy;
					    u_xlat16_2.xyz = vec3(u_xlat16_4) * vec3(2.05825949, 11.3303223, 0.672770679) + u_xlat16_2.xyz;
					    u_xlat16_9 = u_xlat16_2.z / u_xlat16_1;
					    u_xlat16_1 = u_xlat16_2.x / u_xlat16_2.y;
					    u_xlat16_4 = u_xlat16_1 + u_xlat16_1;
					    u_xlat16_1 = u_xlat16_1 * 3.0;
					    u_xlat16_4 = (-u_xlat16_9) * 8.0 + u_xlat16_4;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_9;
					    u_xlat16_4 = u_xlat16_4 + 4.0;
					    u_xlat16_1 = u_xlat16_1 / u_xlat16_4;
					    u_xlat16_9 = u_xlat16_9 / u_xlat16_4;
					    u_xlat16_4 = (-u_xlat16_1) + 1.0;
					    u_xlat16_4 = (-u_xlat16_9) + u_xlat16_4;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_4 = u_xlat16_4 * u_xlat16_9;
					    u_xlat16_9 = u_xlat16_1 * u_xlat16_9;
					    u_xlat9 = u_xlat7.x * u_xlat16_9;
					    u_xlat2.x = u_xlat9 / _Distortion;
					    u_xlat9 = u_xlat7.y * u_xlat16_4;
					    u_xlat2.y = u_xlat7.y / _Distortion;
					    u_xlat2.z = u_xlat9 * _Distortion;
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat2.xyz;
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat1.xyz + u_xlat10_0.xyz;
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
					; Bound: 215
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %192 
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
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %121 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %123 RelaxedPrecision 
					                                             OpDecorate %124 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %135 RelaxedPrecision 
					                                             OpDecorate %136 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %151 RelaxedPrecision 
					                                             OpDecorate %152 RelaxedPrecision 
					                                             OpDecorate %153 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %158 RelaxedPrecision 
					                                             OpDecorate %159 RelaxedPrecision 
					                                             OpDecorate %160 RelaxedPrecision 
					                                             OpDecorate %163 RelaxedPrecision 
					                                             OpDecorate %173 RelaxedPrecision 
					                                             OpDecorate %187 RelaxedPrecision 
					                                             OpDecorate %188 RelaxedPrecision 
					                                             OpDecorate %192 Location 192 
					                                             OpDecorate %207 RelaxedPrecision 
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
					                                 f32 %55 = OpConstant 3,674022E-40 
					                                 f32 %57 = OpConstant 3,674022E-40 
					                        Private f32* %59 = OpVariable Private 
					                                 f32 %64 = OpConstant 3,674022E-40 
					                      Private f32_3* %68 = OpVariable Private 
					                                 f32 %71 = OpConstant 3,674022E-40 
					                                 f32 %72 = OpConstant 3,674022E-40 
					                                 f32 %73 = OpConstant 3,674022E-40 
					                               f32_3 %74 = OpConstantComposite %71 %72 %73 
					                                 f32 %76 = OpConstant 3,674022E-40 
					                                 f32 %77 = OpConstant 3,674022E-40 
					                               f32_3 %78 = OpConstantComposite %76 %57 %77 
					                        Private f32* %80 = OpVariable Private 
					                                 i32 %82 = OpConstant 0 
					                                     %83 = OpTypePointer Uniform %6 
					                      Private f32_2* %87 = OpVariable Private 
					                                 f32 %90 = OpConstant 3,674022E-40 
					                                 f32 %91 = OpConstant 3,674022E-40 
					                               f32_2 %92 = OpConstantComposite %90 %91 
					                                f32 %102 = OpConstant 3,674022E-40 
					                                f32 %103 = OpConstant 3,674022E-40 
					                                f32 %104 = OpConstant 3,674022E-40 
					                              f32_3 %105 = OpConstantComposite %102 %103 %104 
					                                    %109 = OpTypeInt 32 0 
					                                u32 %110 = OpConstant 2 
					                                u32 %115 = OpConstant 0 
					                                u32 %118 = OpConstant 1 
					                                f32 %126 = OpConstant 3,674022E-40 
					                                f32 %130 = OpConstant 3,674022E-40 
					                                f32 %138 = OpConstant 3,674022E-40 
					                     Private f32_3* %165 = OpVariable Private 
					                     Private f32_3* %186 = OpVariable Private 
					                                    %191 = OpTypePointer Output %13 
					                      Output f32_4* %192 = OpVariable Output 
					                                i32 %193 = OpConstant 1 
					                                u32 %211 = OpConstant 3 
					                                    %212 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
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
					                                 f32 %54 = OpFNegate %53 
					                                 f32 %56 = OpFMul %54 %55 
					                                 f32 %58 = OpFAdd %56 %57 
					                                             OpStore %52 %58 
					                                 f32 %60 = OpLoad %45 
					                                 f32 %61 = OpLoad %45 
					                                 f32 %62 = OpFMul %60 %61 
					                                             OpStore %59 %62 
					                                 f32 %63 = OpLoad %59 
					                                 f32 %65 = OpFMul %63 %64 
					                                 f32 %66 = OpLoad %52 
					                                 f32 %67 = OpFAdd %65 %66 
					                                             OpStore %52 %67 
					                                 f32 %69 = OpLoad %45 
					                               f32_3 %70 = OpCompositeConstruct %69 %69 %69 
					                               f32_3 %75 = OpFMul %70 %74 
					                               f32_3 %79 = OpFAdd %75 %78 
					                                             OpStore %68 %79 
					                                 f32 %81 = OpLoad %45 
					                        Uniform f32* %84 = OpAccessChain %16 %82 
					                                 f32 %85 = OpLoad %84 
					                                 f32 %86 = OpFMul %81 %85 
					                                             OpStore %80 %86 
					                                 f32 %88 = OpLoad %80 
					                               f32_2 %89 = OpCompositeConstruct %88 %88 
					                               f32_2 %93 = OpFMul %89 %92 
					                                             OpStore %87 %93 
					                               f32_2 %94 = OpLoad %87 
					                               f32_2 %95 = OpLoad %87 
					                               f32_2 %96 = OpFMul %94 %95 
					                                             OpStore %87 %96 
					                               f32_2 %97 = OpLoad %87 
					                               f32_2 %98 = OpLoad %87 
					                               f32_2 %99 = OpFMul %97 %98 
					                                             OpStore %87 %99 
					                                f32 %100 = OpLoad %59 
					                              f32_3 %101 = OpCompositeConstruct %100 %100 %100 
					                              f32_3 %106 = OpFMul %101 %105 
					                              f32_3 %107 = OpLoad %68 
					                              f32_3 %108 = OpFAdd %106 %107 
					                                             OpStore %68 %108 
					                       Private f32* %111 = OpAccessChain %68 %110 
					                                f32 %112 = OpLoad %111 
					                                f32 %113 = OpLoad %52 
					                                f32 %114 = OpFDiv %112 %113 
					                                             OpStore %45 %114 
					                       Private f32* %116 = OpAccessChain %68 %115 
					                                f32 %117 = OpLoad %116 
					                       Private f32* %119 = OpAccessChain %68 %118 
					                                f32 %120 = OpLoad %119 
					                                f32 %121 = OpFDiv %117 %120 
					                                             OpStore %52 %121 
					                                f32 %122 = OpLoad %52 
					                                f32 %123 = OpLoad %52 
					                                f32 %124 = OpFAdd %122 %123 
					                                             OpStore %59 %124 
					                                f32 %125 = OpLoad %52 
					                                f32 %127 = OpFMul %125 %126 
					                                             OpStore %52 %127 
					                                f32 %128 = OpLoad %45 
					                                f32 %129 = OpFNegate %128 
					                                f32 %131 = OpFMul %129 %130 
					                                f32 %132 = OpLoad %59 
					                                f32 %133 = OpFAdd %131 %132 
					                                             OpStore %59 %133 
					                                f32 %134 = OpLoad %45 
					                                f32 %135 = OpLoad %45 
					                                f32 %136 = OpFAdd %134 %135 
					                                             OpStore %45 %136 
					                                f32 %137 = OpLoad %59 
					                                f32 %139 = OpFAdd %137 %138 
					                                             OpStore %59 %139 
					                                f32 %140 = OpLoad %52 
					                                f32 %141 = OpLoad %59 
					                                f32 %142 = OpFDiv %140 %141 
					                                             OpStore %52 %142 
					                                f32 %143 = OpLoad %45 
					                                f32 %144 = OpLoad %59 
					                                f32 %145 = OpFDiv %143 %144 
					                                             OpStore %45 %145 
					                                f32 %146 = OpLoad %52 
					                                f32 %147 = OpFNegate %146 
					                                f32 %148 = OpFAdd %147 %57 
					                                             OpStore %59 %148 
					                                f32 %149 = OpLoad %45 
					                                f32 %150 = OpFNegate %149 
					                                f32 %151 = OpLoad %59 
					                                f32 %152 = OpFAdd %150 %151 
					                                             OpStore %59 %152 
					                                f32 %153 = OpLoad %45 
					                                f32 %154 = OpFDiv %57 %153 
					                                             OpStore %45 %154 
					                                f32 %155 = OpLoad %59 
					                                f32 %156 = OpLoad %45 
					                                f32 %157 = OpFMul %155 %156 
					                                             OpStore %59 %157 
					                                f32 %158 = OpLoad %52 
					                                f32 %159 = OpLoad %45 
					                                f32 %160 = OpFMul %158 %159 
					                                             OpStore %45 %160 
					                       Private f32* %161 = OpAccessChain %87 %115 
					                                f32 %162 = OpLoad %161 
					                                f32 %163 = OpLoad %45 
					                                f32 %164 = OpFMul %162 %163 
					                                             OpStore %80 %164 
					                                f32 %166 = OpLoad %80 
					                       Uniform f32* %167 = OpAccessChain %16 %82 
					                                f32 %168 = OpLoad %167 
					                                f32 %169 = OpFDiv %166 %168 
					                       Private f32* %170 = OpAccessChain %165 %115 
					                                             OpStore %170 %169 
					                       Private f32* %171 = OpAccessChain %87 %118 
					                                f32 %172 = OpLoad %171 
					                                f32 %173 = OpLoad %59 
					                                f32 %174 = OpFMul %172 %173 
					                                             OpStore %80 %174 
					                       Private f32* %175 = OpAccessChain %87 %118 
					                                f32 %176 = OpLoad %175 
					                       Uniform f32* %177 = OpAccessChain %16 %82 
					                                f32 %178 = OpLoad %177 
					                                f32 %179 = OpFDiv %176 %178 
					                       Private f32* %180 = OpAccessChain %165 %118 
					                                             OpStore %180 %179 
					                                f32 %181 = OpLoad %80 
					                       Uniform f32* %182 = OpAccessChain %16 %82 
					                                f32 %183 = OpLoad %182 
					                                f32 %184 = OpFMul %181 %183 
					                       Private f32* %185 = OpAccessChain %165 %110 
					                                             OpStore %185 %184 
					                              f32_3 %187 = OpLoad %30 
					                              f32_3 %188 = OpFNegate %187 
					                              f32_3 %189 = OpLoad %165 
					                              f32_3 %190 = OpFAdd %188 %189 
					                                             OpStore %186 %190 
					                       Uniform f32* %194 = OpAccessChain %16 %193 
					                                f32 %195 = OpLoad %194 
					                       Uniform f32* %196 = OpAccessChain %16 %193 
					                                f32 %197 = OpLoad %196 
					                       Uniform f32* %198 = OpAccessChain %16 %193 
					                                f32 %199 = OpLoad %198 
					                              f32_3 %200 = OpCompositeConstruct %195 %197 %199 
					                                f32 %201 = OpCompositeExtract %200 0 
					                                f32 %202 = OpCompositeExtract %200 1 
					                                f32 %203 = OpCompositeExtract %200 2 
					                              f32_3 %204 = OpCompositeConstruct %201 %202 %203 
					                              f32_3 %205 = OpLoad %186 
					                              f32_3 %206 = OpFMul %204 %205 
					                              f32_3 %207 = OpLoad %30 
					                              f32_3 %208 = OpFAdd %206 %207 
					                              f32_4 %209 = OpLoad %192 
					                              f32_4 %210 = OpVectorShuffle %209 %208 4 5 6 3 
					                                             OpStore %192 %210 
					                        Output f32* %213 = OpAccessChain %192 %211 
					                                             OpStore %213 %57 
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
						float _Distortion;
						float Fade;
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
					vec3 u_xlat16_2;
					float u_xlat16_4;
					vec2 u_xlat7;
					float u_xlat9;
					float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_1 = (-u_xlat16_9) * 0.115896732 + 1.0;
					    u_xlat16_4 = u_xlat16_9 * u_xlat16_9;
					    u_xlat16_1 = u_xlat16_4 * 2.58329701 + u_xlat16_1;
					    u_xlat16_2.xyz = vec3(u_xlat16_9) * vec3(0.616473019, 3.36968088, 0.169122502) + vec3(0.860117733, 1.0, 0.317398727);
					    u_xlat9 = u_xlat16_9 * _Distortion;
					    u_xlat7.xy = vec2(u_xlat9) * vec2(2.4000001, 1.5999999);
					    u_xlat7.xy = u_xlat7.xy * u_xlat7.xy;
					    u_xlat7.xy = u_xlat7.xy * u_xlat7.xy;
					    u_xlat16_2.xyz = vec3(u_xlat16_4) * vec3(2.05825949, 11.3303223, 0.672770679) + u_xlat16_2.xyz;
					    u_xlat16_9 = u_xlat16_2.z / u_xlat16_1;
					    u_xlat16_1 = u_xlat16_2.x / u_xlat16_2.y;
					    u_xlat16_4 = u_xlat16_1 + u_xlat16_1;
					    u_xlat16_1 = u_xlat16_1 * 3.0;
					    u_xlat16_4 = (-u_xlat16_9) * 8.0 + u_xlat16_4;
					    u_xlat16_9 = u_xlat16_9 + u_xlat16_9;
					    u_xlat16_4 = u_xlat16_4 + 4.0;
					    u_xlat16_1 = u_xlat16_1 / u_xlat16_4;
					    u_xlat16_9 = u_xlat16_9 / u_xlat16_4;
					    u_xlat16_4 = (-u_xlat16_1) + 1.0;
					    u_xlat16_4 = (-u_xlat16_9) + u_xlat16_4;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat16_4 = u_xlat16_4 * u_xlat16_9;
					    u_xlat16_9 = u_xlat16_1 * u_xlat16_9;
					    u_xlat9 = u_xlat7.x * u_xlat16_9;
					    u_xlat2.x = u_xlat9 / _Distortion;
					    u_xlat9 = u_xlat7.y * u_xlat16_4;
					    u_xlat2.y = u_xlat7.y / _Distortion;
					    u_xlat2.z = u_xlat9 * _Distortion;
					    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat2.xyz;
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat1.xyz + u_xlat10_0.xyz;
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