Shader "CameraFilterPack/Light_Water" {
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
			GpuProgramID 30428
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
					uniform 	float _Alpha;
					uniform 	float _Distance;
					uniform 	float _Size;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy + vec2(-1.20000005, -1.20000005);
					    u_xlat6.xy = u_xlat6.xy * vec2(vec2(_Distance, _Distance)) + vec2(-10.0, -10.0);
					    u_xlat1.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + (-u_xlat6.xy);
					    u_xlat1.zw = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat6.yx;
					    u_xlat1.yz = sin(u_xlat1.yz);
					    u_xlat1.xw = cos(u_xlat1.xw);
					    u_xlat2.xy = u_xlat1.zw + u_xlat1.xy;
					    u_xlat1.xy = u_xlat6.xy + u_xlat2.xy;
					    u_xlat1.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat1.xy;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat4 = cos(u_xlat1.y);
					    u_xlat4 = u_xlat4 * 100.0;
					    u_xlat2.y = u_xlat6.y / u_xlat4;
					    u_xlat9 = u_xlat1.x * 100.0;
					    u_xlat2.x = u_xlat6.x / u_xlat9;
					    u_xlat6.x = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat6.x = 1.20000005 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x + 0.200000003;
					    u_xlat6.x = u_xlat6.x * _Size;
					    u_xlat6.x = u_xlat6.x * 0.666666687;
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat6.x = (-u_xlat6.x) + 1.5;
					    u_xlat1.xyz = u_xlat6.xxx * u_xlat6.xxx + vec3(0.0, 0.300000012, 0.5);
					    u_xlat6.x = u_xlat1.x * _Alpha;
					    u_xlat2.x = u_xlat6.x * 0.285714298;
					    u_xlat2.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat1.xyz * vec3(_Alpha) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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
					; Bound: 231
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %11 %213 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate vs_TEXCOORD0 Location 11 
					                                                     OpMemberDecorate %14 0 Offset 14 
					                                                     OpMemberDecorate %14 1 Offset 14 
					                                                     OpMemberDecorate %14 2 Offset 14 
					                                                     OpMemberDecorate %14 3 Offset 14 
					                                                     OpMemberDecorate %14 4 RelaxedPrecision 
					                                                     OpMemberDecorate %14 4 Offset 14 
					                                                     OpDecorate %14 Block 
					                                                     OpDecorate %16 DescriptorSet 16 
					                                                     OpDecorate %16 Binding 16 
					                                                     OpDecorate %21 RelaxedPrecision 
					                                                     OpDecorate %22 RelaxedPrecision 
					                                                     OpDecorate %25 RelaxedPrecision 
					                                                     OpDecorate %26 RelaxedPrecision 
					                                                     OpDecorate %199 RelaxedPrecision 
					                                                     OpDecorate %202 RelaxedPrecision 
					                                                     OpDecorate %202 DescriptorSet 202 
					                                                     OpDecorate %202 Binding 202 
					                                                     OpDecorate %203 RelaxedPrecision 
					                                                     OpDecorate %206 RelaxedPrecision 
					                                                     OpDecorate %206 DescriptorSet 206 
					                                                     OpDecorate %206 Binding 206 
					                                                     OpDecorate %207 RelaxedPrecision 
					                                                     OpDecorate %213 Location 213 
					                                                     OpDecorate %220 RelaxedPrecision 
					                                                     OpDecorate %221 RelaxedPrecision 
					                                                     OpDecorate %227 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 2 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_2* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                             %13 = OpTypeVector %6 4 
					                                             %14 = OpTypeStruct %6 %6 %6 %6 %13 
					                                             %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                             %17 = OpTypeInt 32 1 
					                                         i32 %18 = OpConstant 4 
					                                             %19 = OpTypePointer Uniform %13 
					                              Private f32_2* %28 = OpVariable Private 
					                                         f32 %30 = OpConstant 3,674022E-40 
					                                       f32_2 %31 = OpConstantComposite %30 %30 
					                                         i32 %34 = OpConstant 2 
					                                             %35 = OpTypePointer Uniform %6 
					                                         f32 %45 = OpConstant 3,674022E-40 
					                                       f32_2 %46 = OpConstantComposite %45 %45 
					                                             %48 = OpTypePointer Private %13 
					                              Private f32_4* %49 = OpVariable Private 
					                                         i32 %50 = OpConstant 0 
					                                         f32 %54 = OpConstant 3,674022E-40 
					                                       f32_2 %55 = OpConstantComposite %54 %54 
					                              Private f32_2* %81 = OpVariable Private 
					                                            %101 = OpTypeInt 32 0 
					                                        u32 %102 = OpConstant 0 
					                                            %103 = OpTypePointer Private %6 
					                               Private f32* %108 = OpVariable Private 
					                                        u32 %109 = OpConstant 1 
					                                        f32 %114 = OpConstant 3,674022E-40 
					                               Private f32* %121 = OpVariable Private 
					                                        f32 %138 = OpConstant 3,674022E-40 
					                                        f32 %145 = OpConstant 3,674022E-40 
					                                        i32 %150 = OpConstant 3 
					                                        f32 %157 = OpConstant 3,674022E-40 
					                                        f32 %167 = OpConstant 3,674022E-40 
					                                            %170 = OpTypeVector %6 3 
					                                        f32 %176 = OpConstant 3,674022E-40 
					                                        f32 %177 = OpConstant 3,674022E-40 
					                                        f32 %178 = OpConstant 3,674022E-40 
					                                      f32_3 %179 = OpConstantComposite %176 %177 %178 
					                                        i32 %185 = OpConstant 1 
					                                        f32 %192 = OpConstant 3,674022E-40 
					                             Private f32_4* %199 = OpVariable Private 
					                                            %200 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %201 = OpTypePointer UniformConstant %200 
					       UniformConstant read_only Texture2D* %202 = OpVariable UniformConstant 
					                                            %204 = OpTypeSampler 
					                                            %205 = OpTypePointer UniformConstant %204 
					                   UniformConstant sampler* %206 = OpVariable UniformConstant 
					                                            %208 = OpTypeSampledImage %200 
					                                            %212 = OpTypePointer Output %13 
					                              Output f32_4* %213 = OpVariable Output 
					                                        u32 %225 = OpConstant 3 
					                                            %228 = OpTypePointer Output %6 
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
					                                       f32_2 %29 = OpLoad %9 
					                                       f32_2 %32 = OpFAdd %29 %31 
					                                                     OpStore %28 %32 
					                                       f32_2 %33 = OpLoad %28 
					                                Uniform f32* %36 = OpAccessChain %16 %34 
					                                         f32 %37 = OpLoad %36 
					                                Uniform f32* %38 = OpAccessChain %16 %34 
					                                         f32 %39 = OpLoad %38 
					                                       f32_2 %40 = OpCompositeConstruct %37 %39 
					                                         f32 %41 = OpCompositeExtract %40 0 
					                                         f32 %42 = OpCompositeExtract %40 1 
					                                       f32_2 %43 = OpCompositeConstruct %41 %42 
					                                       f32_2 %44 = OpFMul %33 %43 
					                                       f32_2 %47 = OpFAdd %44 %46 
					                                                     OpStore %28 %47 
					                                Uniform f32* %51 = OpAccessChain %16 %50 
					                                         f32 %52 = OpLoad %51 
					                                       f32_2 %53 = OpCompositeConstruct %52 %52 
					                                       f32_2 %56 = OpFMul %53 %55 
					                                       f32_2 %57 = OpLoad %28 
					                                       f32_2 %58 = OpFNegate %57 
					                                       f32_2 %59 = OpFAdd %56 %58 
					                                       f32_4 %60 = OpLoad %49 
					                                       f32_4 %61 = OpVectorShuffle %60 %59 4 5 2 3 
					                                                     OpStore %49 %61 
					                                Uniform f32* %62 = OpAccessChain %16 %50 
					                                         f32 %63 = OpLoad %62 
					                                       f32_2 %64 = OpCompositeConstruct %63 %63 
					                                       f32_2 %65 = OpFMul %64 %55 
					                                       f32_2 %66 = OpLoad %28 
					                                       f32_2 %67 = OpVectorShuffle %66 %66 1 0 
					                                       f32_2 %68 = OpFAdd %65 %67 
					                                       f32_4 %69 = OpLoad %49 
					                                       f32_4 %70 = OpVectorShuffle %69 %68 0 1 4 5 
					                                                     OpStore %49 %70 
					                                       f32_4 %71 = OpLoad %49 
					                                       f32_2 %72 = OpVectorShuffle %71 %71 1 2 
					                                       f32_2 %73 = OpExtInst %1 13 %72 
					                                       f32_4 %74 = OpLoad %49 
					                                       f32_4 %75 = OpVectorShuffle %74 %73 0 4 5 3 
					                                                     OpStore %49 %75 
					                                       f32_4 %76 = OpLoad %49 
					                                       f32_2 %77 = OpVectorShuffle %76 %76 0 3 
					                                       f32_2 %78 = OpExtInst %1 14 %77 
					                                       f32_4 %79 = OpLoad %49 
					                                       f32_4 %80 = OpVectorShuffle %79 %78 4 1 2 5 
					                                                     OpStore %49 %80 
					                                       f32_4 %82 = OpLoad %49 
					                                       f32_2 %83 = OpVectorShuffle %82 %82 2 3 
					                                       f32_4 %84 = OpLoad %49 
					                                       f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                                       f32_2 %86 = OpFAdd %83 %85 
					                                                     OpStore %81 %86 
					                                       f32_2 %87 = OpLoad %28 
					                                       f32_2 %88 = OpLoad %81 
					                                       f32_2 %89 = OpFAdd %87 %88 
					                                       f32_4 %90 = OpLoad %49 
					                                       f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
					                                                     OpStore %49 %91 
					                                Uniform f32* %92 = OpAccessChain %16 %50 
					                                         f32 %93 = OpLoad %92 
					                                       f32_2 %94 = OpCompositeConstruct %93 %93 
					                                       f32_2 %95 = OpFMul %94 %55 
					                                       f32_4 %96 = OpLoad %49 
					                                       f32_2 %97 = OpVectorShuffle %96 %96 0 1 
					                                       f32_2 %98 = OpFAdd %95 %97 
					                                       f32_4 %99 = OpLoad %49 
					                                      f32_4 %100 = OpVectorShuffle %99 %98 4 5 2 3 
					                                                     OpStore %49 %100 
					                               Private f32* %104 = OpAccessChain %49 %102 
					                                        f32 %105 = OpLoad %104 
					                                        f32 %106 = OpExtInst %1 13 %105 
					                               Private f32* %107 = OpAccessChain %49 %102 
					                                                     OpStore %107 %106 
					                               Private f32* %110 = OpAccessChain %49 %109 
					                                        f32 %111 = OpLoad %110 
					                                        f32 %112 = OpExtInst %1 14 %111 
					                                                     OpStore %108 %112 
					                                        f32 %113 = OpLoad %108 
					                                        f32 %115 = OpFMul %113 %114 
					                                                     OpStore %108 %115 
					                               Private f32* %116 = OpAccessChain %28 %109 
					                                        f32 %117 = OpLoad %116 
					                                        f32 %118 = OpLoad %108 
					                                        f32 %119 = OpFDiv %117 %118 
					                               Private f32* %120 = OpAccessChain %81 %109 
					                                                     OpStore %120 %119 
					                               Private f32* %122 = OpAccessChain %49 %102 
					                                        f32 %123 = OpLoad %122 
					                                        f32 %124 = OpFMul %123 %114 
					                                                     OpStore %121 %124 
					                               Private f32* %125 = OpAccessChain %28 %102 
					                                        f32 %126 = OpLoad %125 
					                                        f32 %127 = OpLoad %121 
					                                        f32 %128 = OpFDiv %126 %127 
					                               Private f32* %129 = OpAccessChain %81 %102 
					                                                     OpStore %129 %128 
					                                      f32_2 %130 = OpLoad %81 
					                                      f32_2 %131 = OpLoad %81 
					                                        f32 %132 = OpDot %130 %131 
					                               Private f32* %133 = OpAccessChain %28 %102 
					                                                     OpStore %133 %132 
					                               Private f32* %134 = OpAccessChain %28 %102 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpExtInst %1 31 %135 
					                               Private f32* %137 = OpAccessChain %28 %102 
					                                                     OpStore %137 %136 
					                               Private f32* %139 = OpAccessChain %28 %102 
					                                        f32 %140 = OpLoad %139 
					                                        f32 %141 = OpFDiv %138 %140 
					                               Private f32* %142 = OpAccessChain %28 %102 
					                                                     OpStore %142 %141 
					                               Private f32* %143 = OpAccessChain %28 %102 
					                                        f32 %144 = OpLoad %143 
					                                        f32 %146 = OpFAdd %144 %145 
					                               Private f32* %147 = OpAccessChain %28 %102 
					                                                     OpStore %147 %146 
					                               Private f32* %148 = OpAccessChain %28 %102 
					                                        f32 %149 = OpLoad %148 
					                               Uniform f32* %151 = OpAccessChain %16 %150 
					                                        f32 %152 = OpLoad %151 
					                                        f32 %153 = OpFMul %149 %152 
					                               Private f32* %154 = OpAccessChain %28 %102 
					                                                     OpStore %154 %153 
					                               Private f32* %155 = OpAccessChain %28 %102 
					                                        f32 %156 = OpLoad %155 
					                                        f32 %158 = OpFMul %156 %157 
					                               Private f32* %159 = OpAccessChain %28 %102 
					                                                     OpStore %159 %158 
					                               Private f32* %160 = OpAccessChain %28 %102 
					                                        f32 %161 = OpLoad %160 
					                                        f32 %162 = OpExtInst %1 31 %161 
					                               Private f32* %163 = OpAccessChain %28 %102 
					                                                     OpStore %163 %162 
					                               Private f32* %164 = OpAccessChain %28 %102 
					                                        f32 %165 = OpLoad %164 
					                                        f32 %166 = OpFNegate %165 
					                                        f32 %168 = OpFAdd %166 %167 
					                               Private f32* %169 = OpAccessChain %28 %102 
					                                                     OpStore %169 %168 
					                                      f32_2 %171 = OpLoad %28 
					                                      f32_3 %172 = OpVectorShuffle %171 %171 0 0 0 
					                                      f32_2 %173 = OpLoad %28 
					                                      f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
					                                      f32_3 %175 = OpFMul %172 %174 
					                                      f32_3 %180 = OpFAdd %175 %179 
					                                      f32_4 %181 = OpLoad %49 
					                                      f32_4 %182 = OpVectorShuffle %181 %180 4 5 6 3 
					                                                     OpStore %49 %182 
					                               Private f32* %183 = OpAccessChain %49 %102 
					                                        f32 %184 = OpLoad %183 
					                               Uniform f32* %186 = OpAccessChain %16 %185 
					                                        f32 %187 = OpLoad %186 
					                                        f32 %188 = OpFMul %184 %187 
					                               Private f32* %189 = OpAccessChain %28 %102 
					                                                     OpStore %189 %188 
					                               Private f32* %190 = OpAccessChain %28 %102 
					                                        f32 %191 = OpLoad %190 
					                                        f32 %193 = OpFMul %191 %192 
					                               Private f32* %194 = OpAccessChain %81 %102 
					                                                     OpStore %194 %193 
					                               Private f32* %195 = OpAccessChain %81 %109 
					                                                     OpStore %195 %176 
					                                      f32_2 %196 = OpLoad %9 
					                                      f32_2 %197 = OpLoad %81 
					                                      f32_2 %198 = OpFAdd %196 %197 
					                                                     OpStore %9 %198 
					                        read_only Texture2D %203 = OpLoad %202 
					                                    sampler %207 = OpLoad %206 
					                 read_only Texture2DSampled %209 = OpSampledImage %203 %207 
					                                      f32_2 %210 = OpLoad %9 
					                                      f32_4 %211 = OpImageSampleImplicitLod %209 %210 
					                                                     OpStore %199 %211 
					                                      f32_4 %214 = OpLoad %49 
					                                      f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
					                               Uniform f32* %216 = OpAccessChain %16 %185 
					                                        f32 %217 = OpLoad %216 
					                                      f32_3 %218 = OpCompositeConstruct %217 %217 %217 
					                                      f32_3 %219 = OpFMul %215 %218 
					                                      f32_4 %220 = OpLoad %199 
					                                      f32_3 %221 = OpVectorShuffle %220 %220 0 1 2 
					                                      f32_3 %222 = OpFAdd %219 %221 
					                                      f32_4 %223 = OpLoad %213 
					                                      f32_4 %224 = OpVectorShuffle %223 %222 4 5 6 3 
					                                                     OpStore %213 %224 
					                               Private f32* %226 = OpAccessChain %199 %225 
					                                        f32 %227 = OpLoad %226 
					                                Output f32* %229 = OpAccessChain %213 %225 
					                                                     OpStore %229 %227 
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
						float _Alpha;
						float _Distance;
						float _Size;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					float u_xlat4;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy + vec2(-1.20000005, -1.20000005);
					    u_xlat6.xy = u_xlat6.xy * vec2(vec2(_Distance, _Distance)) + vec2(-10.0, -10.0);
					    u_xlat1.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + (-u_xlat6.xy);
					    u_xlat1.zw = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat6.yx;
					    u_xlat1.yz = sin(u_xlat1.yz);
					    u_xlat1.xw = cos(u_xlat1.xw);
					    u_xlat2.xy = u_xlat1.zw + u_xlat1.xy;
					    u_xlat1.xy = u_xlat6.xy + u_xlat2.xy;
					    u_xlat1.xy = vec2(_TimeX) * vec2(-2.0, -2.0) + u_xlat1.xy;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat4 = cos(u_xlat1.y);
					    u_xlat4 = u_xlat4 * 100.0;
					    u_xlat2.y = u_xlat6.y / u_xlat4;
					    u_xlat9 = u_xlat1.x * 100.0;
					    u_xlat2.x = u_xlat6.x / u_xlat9;
					    u_xlat6.x = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat6.x = 1.20000005 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x + 0.200000003;
					    u_xlat6.x = u_xlat6.x * _Size;
					    u_xlat6.x = u_xlat6.x * 0.666666687;
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlat6.x = (-u_xlat6.x) + 1.5;
					    u_xlat1.xyz = u_xlat6.xxx * u_xlat6.xxx + vec3(0.0, 0.300000012, 0.5);
					    u_xlat6.x = u_xlat1.x * _Alpha;
					    u_xlat2.x = u_xlat6.x * 0.285714298;
					    u_xlat2.y = 0.0;
					    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat1.xyz * vec3(_Alpha) + u_xlat10_0.xyz;
					    SV_Target0.w = u_xlat10_0.w;
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