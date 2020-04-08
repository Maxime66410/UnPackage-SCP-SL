Shader "CameraFilterPack/Drawing_EnhancedComics" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_DotSize ("_DotSize", Range(0, 1)) = 0
		_ColorRGB ("_ColorRGB", Vector) = (1,0,0,1)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 17201
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
					uniform 	vec4 _ColorRGB;
					uniform 	float _DotSize;
					uniform 	float _ColorR;
					uniform 	float _ColorG;
					uniform 	float _ColorB;
					uniform 	float _Blood;
					uniform 	float _SmoothStart;
					uniform 	float _SmoothEnd;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat6;
					float u_xlat16_6;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = vec2(_DotSize) + vec2(_SmoothStart, _SmoothEnd);
					    u_xlat3.x = u_xlat0.y + 0.100000001;
					    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_6 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_6 = u_xlat10_1.z + u_xlat16_6;
					    u_xlat0.x = u_xlat16_6 * 0.333333343 + (-u_xlat0.x);
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat2.x = 1.0;
					    u_xlat2.yz = vec2(_Blood);
					    u_xlat3.xyz = u_xlat10_1.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + (-u_xlat2.xzz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + u_xlat2.xyz;
					    u_xlatb3 = _ColorR<u_xlat3.x;
					    u_xlatb6.xy = lessThan(u_xlat3.yzyz, vec4(_ColorG, _ColorB, _ColorG, _ColorB)).xy;
					    u_xlatb3 = u_xlatb6.x && u_xlatb3;
					    u_xlatb3 = u_xlatb6.y && u_xlatb3;
					    SV_Target0.xyz = (bool(u_xlatb3)) ? _ColorRGB.xyz : u_xlat0.xxx;
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
					; Bound: 208
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %54 %188 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpMemberDecorate %11 5 Offset 11 
					                                                      OpMemberDecorate %11 6 Offset 11 
					                                                      OpMemberDecorate %11 7 Offset 11 
					                                                      OpMemberDecorate %11 8 RelaxedPrecision 
					                                                      OpMemberDecorate %11 8 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 54 
					                                                      OpDecorate %59 RelaxedPrecision 
					                                                      OpDecorate %60 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %69 RelaxedPrecision 
					                                                      OpDecorate %69 DescriptorSet 69 
					                                                      OpDecorate %69 Binding 69 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %73 RelaxedPrecision 
					                                                      OpDecorate %73 DescriptorSet 73 
					                                                      OpDecorate %73 Binding 73 
					                                                      OpDecorate %74 RelaxedPrecision 
					                                                      OpDecorate %79 RelaxedPrecision 
					                                                      OpDecorate %80 RelaxedPrecision 
					                                                      OpDecorate %82 RelaxedPrecision 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %85 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %89 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %93 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %188 Location 188 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %10 %6 %6 %6 %6 %6 %6 %6 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 1 
					                                              %16 = OpTypePointer Uniform %6 
					                                          i32 %20 = OpConstant 6 
					                                          i32 %23 = OpConstant 7 
					                                              %28 = OpTypeVector %6 3 
					                                              %29 = OpTypePointer Private %28 
					                               Private f32_3* %30 = OpVariable Private 
					                                              %31 = OpTypeInt 32 0 
					                                          u32 %32 = OpConstant 1 
					                                              %33 = OpTypePointer Private %6 
					                                          f32 %36 = OpConstant 3,674022E-40 
					                                          u32 %38 = OpConstant 0 
					                                          f32 %47 = OpConstant 3,674022E-40 
					                               Private f32_2* %52 = OpVariable Private 
					                                              %53 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %56 = OpConstant 8 
					                                              %57 = OpTypePointer Uniform %10 
					                               Private f32_3* %66 = OpVariable Private 
					                                              %67 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %68 = OpTypePointer UniformConstant %67 
					         UniformConstant read_only Texture2D* %69 = OpVariable UniformConstant 
					                                              %71 = OpTypeSampler 
					                                              %72 = OpTypePointer UniformConstant %71 
					                     UniformConstant sampler* %73 = OpVariable UniformConstant 
					                                              %75 = OpTypeSampledImage %67 
					                                 Private f32* %80 = OpVariable Private 
					                                          u32 %86 = OpConstant 2 
					                                          f32 %92 = OpConstant 3,674022E-40 
					                                         f32 %107 = OpConstant 3,674022E-40 
					                                         f32 %112 = OpConstant 3,674022E-40 
					                                         f32 %114 = OpConstant 3,674022E-40 
					                              Private f32_3* %129 = OpVariable Private 
					                                         i32 %131 = OpConstant 5 
					                                         f32 %138 = OpConstant 3,674022E-40 
					                                       f32_3 %139 = OpConstantComposite %138 %138 %138 
					                                         f32 %146 = OpConstant 3,674022E-40 
					                                       f32_3 %147 = OpConstantComposite %146 %146 %146 
					                                             %151 = OpTypeBool 
					                                             %152 = OpTypePointer Private %151 
					                               Private bool* %153 = OpVariable Private 
					                                         i32 %154 = OpConstant 2 
					                                             %160 = OpTypeVector %151 2 
					                                             %161 = OpTypePointer Private %160 
					                             Private bool_2* %162 = OpVariable Private 
					                                         i32 %165 = OpConstant 3 
					                                         i32 %168 = OpConstant 4 
					                                             %176 = OpTypeVector %151 4 
					                                             %187 = OpTypePointer Output %10 
					                               Output f32_4* %188 = OpVariable Output 
					                                             %190 = OpTypePointer Function %28 
					                                         i32 %194 = OpConstant 0 
					                                         u32 %204 = OpConstant 3 
					                                             %205 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                             Function f32_3* %191 = OpVariable Function 
					                                 Uniform f32* %17 = OpAccessChain %13 %15 
					                                          f32 %18 = OpLoad %17 
					                                        f32_2 %19 = OpCompositeConstruct %18 %18 
					                                 Uniform f32* %21 = OpAccessChain %13 %20 
					                                          f32 %22 = OpLoad %21 
					                                 Uniform f32* %24 = OpAccessChain %13 %23 
					                                          f32 %25 = OpLoad %24 
					                                        f32_2 %26 = OpCompositeConstruct %22 %25 
					                                        f32_2 %27 = OpFAdd %19 %26 
					                                                      OpStore %9 %27 
					                                 Private f32* %34 = OpAccessChain %9 %32 
					                                          f32 %35 = OpLoad %34 
					                                          f32 %37 = OpFAdd %35 %36 
					                                 Private f32* %39 = OpAccessChain %30 %38 
					                                                      OpStore %39 %37 
					                                 Private f32* %40 = OpAccessChain %9 %38 
					                                          f32 %41 = OpLoad %40 
					                                          f32 %42 = OpFNegate %41 
					                                 Private f32* %43 = OpAccessChain %30 %38 
					                                          f32 %44 = OpLoad %43 
					                                          f32 %45 = OpFAdd %42 %44 
					                                 Private f32* %46 = OpAccessChain %30 %38 
					                                                      OpStore %46 %45 
					                                 Private f32* %48 = OpAccessChain %30 %38 
					                                          f32 %49 = OpLoad %48 
					                                          f32 %50 = OpFDiv %47 %49 
					                                 Private f32* %51 = OpAccessChain %30 %38 
					                                                      OpStore %51 %50 
					                                        f32_2 %55 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %58 = OpAccessChain %13 %56 
					                                        f32_4 %59 = OpLoad %58 
					                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
					                                        f32_2 %61 = OpFMul %55 %60 
					                               Uniform f32_4* %62 = OpAccessChain %13 %56 
					                                        f32_4 %63 = OpLoad %62 
					                                        f32_2 %64 = OpVectorShuffle %63 %63 2 3 
					                                        f32_2 %65 = OpFAdd %61 %64 
					                                                      OpStore %52 %65 
					                          read_only Texture2D %70 = OpLoad %69 
					                                      sampler %74 = OpLoad %73 
					                   read_only Texture2DSampled %76 = OpSampledImage %70 %74 
					                                        f32_2 %77 = OpLoad %52 
					                                        f32_4 %78 = OpImageSampleImplicitLod %76 %77 
					                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
					                                                      OpStore %66 %79 
					                                 Private f32* %81 = OpAccessChain %66 %32 
					                                          f32 %82 = OpLoad %81 
					                                 Private f32* %83 = OpAccessChain %66 %38 
					                                          f32 %84 = OpLoad %83 
					                                          f32 %85 = OpFAdd %82 %84 
					                                                      OpStore %80 %85 
					                                 Private f32* %87 = OpAccessChain %66 %86 
					                                          f32 %88 = OpLoad %87 
					                                          f32 %89 = OpLoad %80 
					                                          f32 %90 = OpFAdd %88 %89 
					                                                      OpStore %80 %90 
					                                          f32 %91 = OpLoad %80 
					                                          f32 %93 = OpFMul %91 %92 
					                                 Private f32* %94 = OpAccessChain %9 %38 
					                                          f32 %95 = OpLoad %94 
					                                          f32 %96 = OpFNegate %95 
					                                          f32 %97 = OpFAdd %93 %96 
					                                 Private f32* %98 = OpAccessChain %9 %38 
					                                                      OpStore %98 %97 
					                                 Private f32* %99 = OpAccessChain %30 %38 
					                                         f32 %100 = OpLoad %99 
					                                Private f32* %101 = OpAccessChain %9 %38 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpFMul %100 %102 
					                                Private f32* %104 = OpAccessChain %9 %38 
					                                                      OpStore %104 %103 
					                                Private f32* %105 = OpAccessChain %9 %38 
					                                         f32 %106 = OpLoad %105 
					                                         f32 %108 = OpExtInst %1 43 %106 %107 %47 
					                                Private f32* %109 = OpAccessChain %9 %38 
					                                                      OpStore %109 %108 
					                                Private f32* %110 = OpAccessChain %9 %38 
					                                         f32 %111 = OpLoad %110 
					                                         f32 %113 = OpFMul %111 %112 
					                                         f32 %115 = OpFAdd %113 %114 
					                                Private f32* %116 = OpAccessChain %30 %38 
					                                                      OpStore %116 %115 
					                                Private f32* %117 = OpAccessChain %9 %38 
					                                         f32 %118 = OpLoad %117 
					                                Private f32* %119 = OpAccessChain %9 %38 
					                                         f32 %120 = OpLoad %119 
					                                         f32 %121 = OpFMul %118 %120 
					                                Private f32* %122 = OpAccessChain %9 %38 
					                                                      OpStore %122 %121 
					                                Private f32* %123 = OpAccessChain %9 %38 
					                                         f32 %124 = OpLoad %123 
					                                Private f32* %125 = OpAccessChain %30 %38 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpFMul %124 %126 
					                                Private f32* %128 = OpAccessChain %9 %38 
					                                                      OpStore %128 %127 
					                                Private f32* %130 = OpAccessChain %129 %38 
					                                                      OpStore %130 %47 
					                                Uniform f32* %132 = OpAccessChain %13 %131 
					                                         f32 %133 = OpLoad %132 
					                                       f32_2 %134 = OpCompositeConstruct %133 %133 
					                                       f32_3 %135 = OpLoad %129 
					                                       f32_3 %136 = OpVectorShuffle %135 %134 0 3 4 
					                                                      OpStore %129 %136 
					                                       f32_3 %137 = OpLoad %66 
					                                       f32_3 %140 = OpFMul %137 %139 
					                                       f32_3 %141 = OpLoad %129 
					                                       f32_3 %142 = OpVectorShuffle %141 %141 0 2 2 
					                                       f32_3 %143 = OpFNegate %142 
					                                       f32_3 %144 = OpFAdd %140 %143 
					                                                      OpStore %30 %144 
					                                       f32_3 %145 = OpLoad %30 
					                                       f32_3 %148 = OpFMul %145 %147 
					                                       f32_3 %149 = OpLoad %129 
					                                       f32_3 %150 = OpFAdd %148 %149 
					                                                      OpStore %30 %150 
					                                Uniform f32* %155 = OpAccessChain %13 %154 
					                                         f32 %156 = OpLoad %155 
					                                Private f32* %157 = OpAccessChain %30 %38 
					                                         f32 %158 = OpLoad %157 
					                                        bool %159 = OpFOrdLessThan %156 %158 
					                                                      OpStore %153 %159 
					                                       f32_3 %163 = OpLoad %30 
					                                       f32_4 %164 = OpVectorShuffle %163 %163 1 2 1 2 
					                                Uniform f32* %166 = OpAccessChain %13 %165 
					                                         f32 %167 = OpLoad %166 
					                                Uniform f32* %169 = OpAccessChain %13 %168 
					                                         f32 %170 = OpLoad %169 
					                                Uniform f32* %171 = OpAccessChain %13 %165 
					                                         f32 %172 = OpLoad %171 
					                                Uniform f32* %173 = OpAccessChain %13 %168 
					                                         f32 %174 = OpLoad %173 
					                                       f32_4 %175 = OpCompositeConstruct %167 %170 %172 %174 
					                                      bool_4 %177 = OpFOrdLessThan %164 %175 
					                                      bool_2 %178 = OpVectorShuffle %177 %177 0 1 
					                                                      OpStore %162 %178 
					                               Private bool* %179 = OpAccessChain %162 %38 
					                                        bool %180 = OpLoad %179 
					                                        bool %181 = OpLoad %153 
					                                        bool %182 = OpLogicalAnd %180 %181 
					                                                      OpStore %153 %182 
					                               Private bool* %183 = OpAccessChain %162 %32 
					                                        bool %184 = OpLoad %183 
					                                        bool %185 = OpLoad %153 
					                                        bool %186 = OpLogicalAnd %184 %185 
					                                                      OpStore %153 %186 
					                                        bool %189 = OpLoad %153 
					                                                      OpSelectionMerge %193 None 
					                                                      OpBranchConditional %189 %192 %198 
					                                             %192 = OpLabel 
					                              Uniform f32_4* %195 = OpAccessChain %13 %194 
					                                       f32_4 %196 = OpLoad %195 
					                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
					                                                      OpStore %191 %197 
					                                                      OpBranch %193 
					                                             %198 = OpLabel 
					                                       f32_2 %199 = OpLoad %9 
					                                       f32_3 %200 = OpVectorShuffle %199 %199 0 0 0 
					                                                      OpStore %191 %200 
					                                                      OpBranch %193 
					                                             %193 = OpLabel 
					                                       f32_3 %201 = OpLoad %191 
					                                       f32_4 %202 = OpLoad %188 
					                                       f32_4 %203 = OpVectorShuffle %202 %201 4 5 6 3 
					                                                      OpStore %188 %203 
					                                 Output f32* %206 = OpAccessChain %188 %204 
					                                                      OpStore %206 %47 
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
						vec4 unused_0_0[4];
						vec4 _ColorRGB;
						float _DotSize;
						float _ColorR;
						float _ColorG;
						float _ColorB;
						float _Blood;
						float _SmoothStart;
						float _SmoothEnd;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat6;
					float u_xlat16_6;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = vec2(_DotSize) + vec2(_SmoothStart, _SmoothEnd);
					    u_xlat3.x = u_xlat0.y + 0.100000001;
					    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_6 = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_6 = u_xlat10_1.z + u_xlat16_6;
					    u_xlat0.x = u_xlat16_6 * 0.333333343 + (-u_xlat0.x);
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat2.x = 1.0;
					    u_xlat2.yz = vec2(_Blood);
					    u_xlat3.xyz = u_xlat10_1.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + (-u_xlat2.xzz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + u_xlat2.xyz;
					    u_xlatb3 = _ColorR<u_xlat3.x;
					    u_xlatb6.xy = lessThan(u_xlat3.yzyz, vec4(_ColorG, _ColorB, _ColorG, _ColorB)).xy;
					    u_xlatb3 = u_xlatb6.x && u_xlatb3;
					    u_xlatb3 = u_xlatb6.y && u_xlatb3;
					    SV_Target0.xyz = (bool(u_xlatb3)) ? _ColorRGB.xyz : u_xlat0.xxx;
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