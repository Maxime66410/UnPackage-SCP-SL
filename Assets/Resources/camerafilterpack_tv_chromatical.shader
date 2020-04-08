Shader "CameraFilterPack/TV_Chromatical" {
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
			GpuProgramID 26377
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
					uniform 	float Fade;
					uniform 	float Intensity;
					uniform 	float Speed;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat8;
					void main()
					{
					    u_xlat0.x = Speed * _TimeX;
					    u_xlat0.xy = u_xlat0.xx * vec2(6.0, 12.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat4.x = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat4.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.0500000007;
					    u_xlat1.zw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat1.zw + vec2(-0.5, -0.5);
					    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat8 = u_xlat4.x * Fade;
					    u_xlat4.x = (-u_xlat4.x) * 0.5 + 1.0;
					    u_xlat8 = u_xlat8 * Intensity;
					    u_xlat1.y = u_xlat0.x * u_xlat8 + u_xlat1.z;
					    u_xlat1.x = (-u_xlat0.x) * u_xlat8 + u_xlat1.z;
					    u_xlat2 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.yw);
					    u_xlat2.x = u_xlat10_3.x;
					    u_xlat0.x = u_xlat1.w * 800.0;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.y = u_xlat10_1.y;
					    u_xlat0.xzw = (-u_xlat0.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xzw * u_xlat4.xxx + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_1.xyz;
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
					; Bound: 236
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %83 %214 
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
					                                                     OpDecorate vs_TEXCOORD0 Location 83 
					                                                     OpDecorate %88 RelaxedPrecision 
					                                                     OpDecorate %89 RelaxedPrecision 
					                                                     OpDecorate %92 RelaxedPrecision 
					                                                     OpDecorate %93 RelaxedPrecision 
					                                                     OpDecorate %148 RelaxedPrecision 
					                                                     OpDecorate %148 DescriptorSet 148 
					                                                     OpDecorate %148 Binding 148 
					                                                     OpDecorate %149 RelaxedPrecision 
					                                                     OpDecorate %152 RelaxedPrecision 
					                                                     OpDecorate %152 DescriptorSet 152 
					                                                     OpDecorate %152 Binding 152 
					                                                     OpDecorate %153 RelaxedPrecision 
					                                                     OpDecorate %162 RelaxedPrecision 
					                                                     OpDecorate %163 RelaxedPrecision 
					                                                     OpDecorate %177 RelaxedPrecision 
					                                                     OpDecorate %178 RelaxedPrecision 
					                                                     OpDecorate %179 RelaxedPrecision 
					                                                     OpDecorate %184 RelaxedPrecision 
					                                                     OpDecorate %190 RelaxedPrecision 
					                                                     OpDecorate %208 RelaxedPrecision 
					                                                     OpDecorate %209 RelaxedPrecision 
					                                                     OpDecorate %214 Location 214 
					                                                     OpDecorate %229 RelaxedPrecision 
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
					                                         i32 %14 = OpConstant 3 
					                                             %15 = OpTypePointer Uniform %6 
					                                         i32 %18 = OpConstant 0 
					                                             %22 = OpTypeInt 32 0 
					                                         u32 %23 = OpConstant 0 
					                                             %24 = OpTypePointer Private %6 
					                                             %26 = OpTypeVector %6 2 
					                                         f32 %29 = OpConstant 3,674022E-40 
					                                         f32 %30 = OpConstant 3,674022E-40 
					                                       f32_2 %31 = OpConstantComposite %29 %30 
					                                         f32 %42 = OpConstant 3,674022E-40 
					                                             %45 = OpTypePointer Private %26 
					                              Private f32_2* %46 = OpVariable Private 
					                                         u32 %47 = OpConstant 1 
					                                         f32 %50 = OpConstant 3,674022E-40 
					                                         f32 %78 = OpConstant 3,674022E-40 
					                              Private f32_4* %81 = OpVariable Private 
					                                             %82 = OpTypePointer Input %26 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %85 = OpConstant 4 
					                                             %86 = OpTypePointer Uniform %7 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                                      f32_2 %100 = OpConstantComposite %99 %99 
					                               Private f32* %110 = OpVariable Private 
					                                        i32 %113 = OpConstant 1 
					                                        i32 %124 = OpConstant 2 
					                                        u32 %132 = OpConstant 2 
					                                            %146 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %147 = OpTypePointer UniformConstant %146 
					       UniformConstant read_only Texture2D* %148 = OpVariable UniformConstant 
					                                            %150 = OpTypeSampler 
					                                            %151 = OpTypePointer UniformConstant %150 
					                   UniformConstant sampler* %152 = OpVariable UniformConstant 
					                                            %154 = OpTypeSampledImage %146 
					                                        u32 %160 = OpConstant 3 
					                                        f32 %172 = OpConstant 3,674022E-40 
					                                            %175 = OpTypeVector %6 3 
					                                            %176 = OpTypePointer Private %175 
					                             Private f32_3* %177 = OpVariable Private 
					                                        f32 %195 = OpConstant 3,674022E-40 
					                                      f32_3 %196 = OpConstantComposite %195 %195 %195 
					                                            %213 = OpTypePointer Output %7 
					                              Output f32_4* %214 = OpVariable Output 
					                                            %233 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                Uniform f32* %16 = OpAccessChain %12 %14 
					                                         f32 %17 = OpLoad %16 
					                                Uniform f32* %19 = OpAccessChain %12 %18 
					                                         f32 %20 = OpLoad %19 
					                                         f32 %21 = OpFMul %17 %20 
					                                Private f32* %25 = OpAccessChain %9 %23 
					                                                     OpStore %25 %21 
					                                       f32_4 %27 = OpLoad %9 
					                                       f32_2 %28 = OpVectorShuffle %27 %27 0 0 
					                                       f32_2 %32 = OpFMul %28 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpVectorShuffle %33 %32 4 5 2 3 
					                                                     OpStore %9 %34 
					                                       f32_4 %35 = OpLoad %9 
					                                       f32_2 %36 = OpVectorShuffle %35 %35 0 1 
					                                       f32_2 %37 = OpExtInst %1 13 %36 
					                                       f32_4 %38 = OpLoad %9 
					                                       f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
					                                                     OpStore %9 %39 
					                                Private f32* %40 = OpAccessChain %9 %23 
					                                         f32 %41 = OpLoad %40 
					                                         f32 %43 = OpFAdd %41 %42 
					                                Private f32* %44 = OpAccessChain %9 %23 
					                                                     OpStore %44 %43 
					                                Private f32* %48 = OpAccessChain %9 %47 
					                                         f32 %49 = OpLoad %48 
					                                         f32 %51 = OpFMul %49 %50 
					                                         f32 %52 = OpFAdd %51 %42 
					                                Private f32* %53 = OpAccessChain %46 %23 
					                                                     OpStore %53 %52 
					                                Private f32* %54 = OpAccessChain %9 %23 
					                                         f32 %55 = OpLoad %54 
					                                         f32 %56 = OpFMul %55 %50 
					                                Private f32* %57 = OpAccessChain %9 %23 
					                                                     OpStore %57 %56 
					                                Private f32* %58 = OpAccessChain %46 %23 
					                                         f32 %59 = OpLoad %58 
					                                Private f32* %60 = OpAccessChain %9 %23 
					                                         f32 %61 = OpLoad %60 
					                                         f32 %62 = OpFMul %59 %61 
					                                Private f32* %63 = OpAccessChain %9 %23 
					                                                     OpStore %63 %62 
					                                Private f32* %64 = OpAccessChain %9 %23 
					                                         f32 %65 = OpLoad %64 
					                                Private f32* %66 = OpAccessChain %9 %23 
					                                         f32 %67 = OpLoad %66 
					                                         f32 %68 = OpFMul %65 %67 
					                                Private f32* %69 = OpAccessChain %46 %23 
					                                                     OpStore %69 %68 
					                                Private f32* %70 = OpAccessChain %46 %23 
					                                         f32 %71 = OpLoad %70 
					                                Private f32* %72 = OpAccessChain %9 %23 
					                                         f32 %73 = OpLoad %72 
					                                         f32 %74 = OpFMul %71 %73 
					                                Private f32* %75 = OpAccessChain %9 %23 
					                                                     OpStore %75 %74 
					                                Private f32* %76 = OpAccessChain %9 %23 
					                                         f32 %77 = OpLoad %76 
					                                         f32 %79 = OpFMul %77 %78 
					                                Private f32* %80 = OpAccessChain %9 %23 
					                                                     OpStore %80 %79 
					                                       f32_2 %84 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %87 = OpAccessChain %12 %85 
					                                       f32_4 %88 = OpLoad %87 
					                                       f32_2 %89 = OpVectorShuffle %88 %88 0 1 
					                                       f32_2 %90 = OpFMul %84 %89 
					                              Uniform f32_4* %91 = OpAccessChain %12 %85 
					                                       f32_4 %92 = OpLoad %91 
					                                       f32_2 %93 = OpVectorShuffle %92 %92 2 3 
					                                       f32_2 %94 = OpFAdd %90 %93 
					                                       f32_4 %95 = OpLoad %81 
					                                       f32_4 %96 = OpVectorShuffle %95 %94 0 1 4 5 
					                                                     OpStore %81 %96 
					                                       f32_4 %97 = OpLoad %81 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 2 3 
					                                      f32_2 %101 = OpFAdd %98 %100 
					                                                     OpStore %46 %101 
					                                      f32_2 %102 = OpLoad %46 
					                                      f32_2 %103 = OpLoad %46 
					                                        f32 %104 = OpDot %102 %103 
					                               Private f32* %105 = OpAccessChain %46 %23 
					                                                     OpStore %105 %104 
					                               Private f32* %106 = OpAccessChain %46 %23 
					                                        f32 %107 = OpLoad %106 
					                                        f32 %108 = OpExtInst %1 31 %107 
					                               Private f32* %109 = OpAccessChain %46 %23 
					                                                     OpStore %109 %108 
					                               Private f32* %111 = OpAccessChain %46 %23 
					                                        f32 %112 = OpLoad %111 
					                               Uniform f32* %114 = OpAccessChain %12 %113 
					                                        f32 %115 = OpLoad %114 
					                                        f32 %116 = OpFMul %112 %115 
					                                                     OpStore %110 %116 
					                               Private f32* %117 = OpAccessChain %46 %23 
					                                        f32 %118 = OpLoad %117 
					                                        f32 %119 = OpFNegate %118 
					                                        f32 %120 = OpFMul %119 %50 
					                                        f32 %121 = OpFAdd %120 %42 
					                               Private f32* %122 = OpAccessChain %46 %23 
					                                                     OpStore %122 %121 
					                                        f32 %123 = OpLoad %110 
					                               Uniform f32* %125 = OpAccessChain %12 %124 
					                                        f32 %126 = OpLoad %125 
					                                        f32 %127 = OpFMul %123 %126 
					                                                     OpStore %110 %127 
					                               Private f32* %128 = OpAccessChain %9 %23 
					                                        f32 %129 = OpLoad %128 
					                                        f32 %130 = OpLoad %110 
					                                        f32 %131 = OpFMul %129 %130 
					                               Private f32* %133 = OpAccessChain %81 %132 
					                                        f32 %134 = OpLoad %133 
					                                        f32 %135 = OpFAdd %131 %134 
					                               Private f32* %136 = OpAccessChain %81 %47 
					                                                     OpStore %136 %135 
					                               Private f32* %137 = OpAccessChain %9 %23 
					                                        f32 %138 = OpLoad %137 
					                                        f32 %139 = OpFNegate %138 
					                                        f32 %140 = OpLoad %110 
					                                        f32 %141 = OpFMul %139 %140 
					                               Private f32* %142 = OpAccessChain %81 %132 
					                                        f32 %143 = OpLoad %142 
					                                        f32 %144 = OpFAdd %141 %143 
					                               Private f32* %145 = OpAccessChain %81 %23 
					                                                     OpStore %145 %144 
					                        read_only Texture2D %149 = OpLoad %148 
					                                    sampler %153 = OpLoad %152 
					                 read_only Texture2DSampled %155 = OpSampledImage %149 %153 
					                                      f32_4 %156 = OpLoad %81 
					                                      f32_2 %157 = OpVectorShuffle %156 %156 0 3 
					                                      f32_4 %158 = OpImageSampleImplicitLod %155 %157 
					                                        f32 %159 = OpCompositeExtract %158 2 
					                               Private f32* %161 = OpAccessChain %9 %160 
					                                                     OpStore %161 %159 
					                        read_only Texture2D %162 = OpLoad %148 
					                                    sampler %163 = OpLoad %152 
					                 read_only Texture2DSampled %164 = OpSampledImage %162 %163 
					                                      f32_4 %165 = OpLoad %81 
					                                      f32_2 %166 = OpVectorShuffle %165 %165 1 3 
					                                      f32_4 %167 = OpImageSampleImplicitLod %164 %166 
					                                        f32 %168 = OpCompositeExtract %167 0 
					                               Private f32* %169 = OpAccessChain %9 %23 
					                                                     OpStore %169 %168 
					                               Private f32* %170 = OpAccessChain %81 %160 
					                                        f32 %171 = OpLoad %170 
					                                        f32 %173 = OpFMul %171 %172 
					                               Private f32* %174 = OpAccessChain %81 %23 
					                                                     OpStore %174 %173 
					                        read_only Texture2D %178 = OpLoad %148 
					                                    sampler %179 = OpLoad %152 
					                 read_only Texture2DSampled %180 = OpSampledImage %178 %179 
					                                      f32_4 %181 = OpLoad %81 
					                                      f32_2 %182 = OpVectorShuffle %181 %181 2 3 
					                                      f32_4 %183 = OpImageSampleImplicitLod %180 %182 
					                                      f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
					                                                     OpStore %177 %184 
					                               Private f32* %185 = OpAccessChain %81 %23 
					                                        f32 %186 = OpLoad %185 
					                                        f32 %187 = OpExtInst %1 13 %186 
					                               Private f32* %188 = OpAccessChain %81 %23 
					                                                     OpStore %188 %187 
					                               Private f32* %189 = OpAccessChain %177 %47 
					                                        f32 %190 = OpLoad %189 
					                               Private f32* %191 = OpAccessChain %9 %132 
					                                                     OpStore %191 %190 
					                                      f32_4 %192 = OpLoad %81 
					                                      f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
					                                      f32_3 %194 = OpFNegate %193 
					                                      f32_3 %197 = OpFMul %194 %196 
					                                      f32_4 %198 = OpLoad %9 
					                                      f32_3 %199 = OpVectorShuffle %198 %198 0 2 3 
					                                      f32_3 %200 = OpFAdd %197 %199 
					                                      f32_4 %201 = OpLoad %9 
					                                      f32_4 %202 = OpVectorShuffle %201 %200 4 1 5 6 
					                                                     OpStore %9 %202 
					                                      f32_4 %203 = OpLoad %9 
					                                      f32_3 %204 = OpVectorShuffle %203 %203 0 2 3 
					                                      f32_2 %205 = OpLoad %46 
					                                      f32_3 %206 = OpVectorShuffle %205 %205 0 0 0 
					                                      f32_3 %207 = OpFMul %204 %206 
					                                      f32_3 %208 = OpLoad %177 
					                                      f32_3 %209 = OpFNegate %208 
					                                      f32_3 %210 = OpFAdd %207 %209 
					                                      f32_4 %211 = OpLoad %9 
					                                      f32_4 %212 = OpVectorShuffle %211 %210 4 5 6 3 
					                                                     OpStore %9 %212 
					                               Uniform f32* %215 = OpAccessChain %12 %113 
					                                        f32 %216 = OpLoad %215 
					                               Uniform f32* %217 = OpAccessChain %12 %113 
					                                        f32 %218 = OpLoad %217 
					                               Uniform f32* %219 = OpAccessChain %12 %113 
					                                        f32 %220 = OpLoad %219 
					                                      f32_3 %221 = OpCompositeConstruct %216 %218 %220 
					                                        f32 %222 = OpCompositeExtract %221 0 
					                                        f32 %223 = OpCompositeExtract %221 1 
					                                        f32 %224 = OpCompositeExtract %221 2 
					                                      f32_3 %225 = OpCompositeConstruct %222 %223 %224 
					                                      f32_4 %226 = OpLoad %9 
					                                      f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
					                                      f32_3 %228 = OpFMul %225 %227 
					                                      f32_3 %229 = OpLoad %177 
					                                      f32_3 %230 = OpFAdd %228 %229 
					                                      f32_4 %231 = OpLoad %214 
					                                      f32_4 %232 = OpVectorShuffle %231 %230 4 5 6 3 
					                                                     OpStore %214 %232 
					                                Output f32* %234 = OpAccessChain %214 %160 
					                                                     OpStore %234 %42 
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
						float Fade;
						float Intensity;
						float Speed;
						vec4 unused_0_5[2];
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					float u_xlat8;
					void main()
					{
					    u_xlat0.x = Speed * _TimeX;
					    u_xlat0.xy = u_xlat0.xx * vec2(6.0, 12.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat4.x = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat4.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 0.0500000007;
					    u_xlat1.zw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat1.zw + vec2(-0.5, -0.5);
					    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat8 = u_xlat4.x * Fade;
					    u_xlat4.x = (-u_xlat4.x) * 0.5 + 1.0;
					    u_xlat8 = u_xlat8 * Intensity;
					    u_xlat1.y = u_xlat0.x * u_xlat8 + u_xlat1.z;
					    u_xlat1.x = (-u_xlat0.x) * u_xlat8 + u_xlat1.z;
					    u_xlat2 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.yw);
					    u_xlat2.x = u_xlat10_3.x;
					    u_xlat0.x = u_xlat1.w * 800.0;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.y = u_xlat10_1.y;
					    u_xlat0.xzw = (-u_xlat0.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xzw * u_xlat4.xxx + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_1.xyz;
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