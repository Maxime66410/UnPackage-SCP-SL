Shader "CameraFilterPack/NightVision_4" {
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
			GpuProgramID 31953
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
					uniform 	float _Red_R;
					uniform 	float _Red_G;
					uniform 	float _Red_B;
					uniform 	float _Green_R;
					uniform 	float _Green_G;
					uniform 	float _Green_B;
					uniform 	float _Blue_R;
					uniform 	float _Blue_G;
					uniform 	float _Blue_B;
					uniform 	float _Red_C;
					uniform 	float _Green_C;
					uniform 	float _Blue_C;
					uniform 	float _FadeFX;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy * vec2(0.100000001, 1.0);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat6.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469 + _TimeX;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					    u_xlat2.x = _Blue_R;
					    u_xlat2.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat3 = dot(u_xlat10_1.xyz, u_xlat2.xyz);
					    u_xlat2.z = u_xlat3 + _Blue_C;
					    u_xlat3 = dot(u_xlat10_1.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat2.x = u_xlat3 + _Red_C;
					    u_xlat3 = dot(u_xlat10_1.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat2.y = u_xlat3 + _Green_C;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_1.xyz;
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
					; Bound: 186
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %163 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %15 0 Offset 15 
					                                                      OpMemberDecorate %15 1 Offset 15 
					                                                      OpMemberDecorate %15 2 Offset 15 
					                                                      OpMemberDecorate %15 3 Offset 15 
					                                                      OpMemberDecorate %15 4 Offset 15 
					                                                      OpMemberDecorate %15 5 Offset 15 
					                                                      OpMemberDecorate %15 6 Offset 15 
					                                                      OpMemberDecorate %15 7 Offset 15 
					                                                      OpMemberDecorate %15 8 Offset 15 
					                                                      OpMemberDecorate %15 9 Offset 15 
					                                                      OpMemberDecorate %15 10 Offset 15 
					                                                      OpMemberDecorate %15 11 Offset 15 
					                                                      OpMemberDecorate %15 12 Offset 15 
					                                                      OpMemberDecorate %15 13 Offset 15 
					                                                      OpMemberDecorate %15 14 RelaxedPrecision 
					                                                      OpMemberDecorate %15 14 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %23 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %39 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %42 DescriptorSet 42 
					                                                      OpDecorate %42 Binding 42 
					                                                      OpDecorate %43 RelaxedPrecision 
					                                                      OpDecorate %46 RelaxedPrecision 
					                                                      OpDecorate %46 DescriptorSet 46 
					                                                      OpDecorate %46 Binding 46 
					                                                      OpDecorate %47 RelaxedPrecision 
					                                                      OpDecorate %53 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %118 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %163 Location 163 
					                                                      OpDecorate %178 RelaxedPrecision 
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
					                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %14 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 14 
					                                              %20 = OpTypePointer Uniform %14 
					                                              %31 = OpTypePointer Private %10 
					                               Private f32_2* %32 = OpVariable Private 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                          f32 %36 = OpConstant 3,674022E-40 
					                                        f32_2 %37 = OpConstantComposite %35 %36 
					                               Private f32_3* %39 = OpVariable Private 
					                                              %40 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %41 = OpTypePointer UniformConstant %40 
					         UniformConstant read_only Texture2D* %42 = OpVariable UniformConstant 
					                                              %44 = OpTypeSampler 
					                                              %45 = OpTypePointer UniformConstant %44 
					                     UniformConstant sampler* %46 = OpVariable UniformConstant 
					                                              %48 = OpTypeSampledImage %40 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                          f32 %56 = OpConstant 3,674022E-40 
					                                        f32_2 %57 = OpConstantComposite %55 %56 
					                                              %59 = OpTypeInt 32 0 
					                                          u32 %60 = OpConstant 0 
					                                              %61 = OpTypePointer Private %6 
					                                          f32 %69 = OpConstant 3,674022E-40 
					                                          i32 %71 = OpConstant 0 
					                                              %72 = OpTypePointer Uniform %6 
					                                          f32 %83 = OpConstant 3,674022E-40 
					                               Private f32_3* %93 = OpVariable Private 
					                                          i32 %94 = OpConstant 7 
					                                          i32 %98 = OpConstant 8 
					                                         i32 %101 = OpConstant 9 
					                                Private f32* %107 = OpVariable Private 
					                                         i32 %112 = OpConstant 12 
					                                         u32 %116 = OpConstant 2 
					                                         i32 %119 = OpConstant 1 
					                                         i32 %122 = OpConstant 2 
					                                         i32 %125 = OpConstant 3 
					                                         i32 %131 = OpConstant 10 
					                                         i32 %137 = OpConstant 4 
					                                         i32 %140 = OpConstant 5 
					                                         i32 %143 = OpConstant 6 
					                                         i32 %149 = OpConstant 11 
					                                         u32 %153 = OpConstant 1 
					                                             %162 = OpTypePointer Output %14 
					                               Output f32_4* %163 = OpVariable Output 
					                                         i32 %164 = OpConstant 13 
					                                         u32 %182 = OpConstant 3 
					                                             %183 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
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
					                                        f32_2 %38 = OpFMul %34 %37 
					                                                      OpStore %32 %38 
					                          read_only Texture2D %43 = OpLoad %42 
					                                      sampler %47 = OpLoad %46 
					                   read_only Texture2DSampled %49 = OpSampledImage %43 %47 
					                                        f32_3 %50 = OpLoad %9 
					                                        f32_2 %51 = OpVectorShuffle %50 %50 0 1 
					                                        f32_4 %52 = OpImageSampleImplicitLod %49 %51 
					                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
					                                                      OpStore %39 %53 
					                                        f32_2 %54 = OpLoad %32 
					                                          f32 %58 = OpDot %54 %57 
					                                 Private f32* %62 = OpAccessChain %9 %60 
					                                                      OpStore %62 %58 
					                                 Private f32* %63 = OpAccessChain %9 %60 
					                                          f32 %64 = OpLoad %63 
					                                          f32 %65 = OpExtInst %1 13 %64 
					                                 Private f32* %66 = OpAccessChain %9 %60 
					                                                      OpStore %66 %65 
					                                 Private f32* %67 = OpAccessChain %9 %60 
					                                          f32 %68 = OpLoad %67 
					                                          f32 %70 = OpFMul %68 %69 
					                                 Uniform f32* %73 = OpAccessChain %17 %71 
					                                          f32 %74 = OpLoad %73 
					                                          f32 %75 = OpFAdd %70 %74 
					                                 Private f32* %76 = OpAccessChain %9 %60 
					                                                      OpStore %76 %75 
					                                 Private f32* %77 = OpAccessChain %9 %60 
					                                          f32 %78 = OpLoad %77 
					                                          f32 %79 = OpExtInst %1 10 %78 
					                                 Private f32* %80 = OpAccessChain %9 %60 
					                                                      OpStore %80 %79 
					                                 Private f32* %81 = OpAccessChain %9 %60 
					                                          f32 %82 = OpLoad %81 
					                                          f32 %84 = OpFMul %82 %83 
					                                          f32 %85 = OpFAdd %84 %83 
					                                 Private f32* %86 = OpAccessChain %9 %60 
					                                                      OpStore %86 %85 
					                                 Private f32* %87 = OpAccessChain %9 %60 
					                                          f32 %88 = OpLoad %87 
					                                          f32 %89 = OpFNegate %88 
					                                          f32 %90 = OpFMul %89 %83 
					                                          f32 %91 = OpFAdd %90 %36 
					                                 Private f32* %92 = OpAccessChain %9 %60 
					                                                      OpStore %92 %91 
					                                 Uniform f32* %95 = OpAccessChain %17 %94 
					                                          f32 %96 = OpLoad %95 
					                                 Private f32* %97 = OpAccessChain %93 %60 
					                                                      OpStore %97 %96 
					                                 Uniform f32* %99 = OpAccessChain %17 %98 
					                                         f32 %100 = OpLoad %99 
					                                Uniform f32* %102 = OpAccessChain %17 %101 
					                                         f32 %103 = OpLoad %102 
					                                       f32_2 %104 = OpCompositeConstruct %100 %103 
					                                       f32_3 %105 = OpLoad %93 
					                                       f32_3 %106 = OpVectorShuffle %105 %104 0 3 4 
					                                                      OpStore %93 %106 
					                                       f32_3 %108 = OpLoad %39 
					                                       f32_3 %109 = OpLoad %93 
					                                         f32 %110 = OpDot %108 %109 
					                                                      OpStore %107 %110 
					                                         f32 %111 = OpLoad %107 
					                                Uniform f32* %113 = OpAccessChain %17 %112 
					                                         f32 %114 = OpLoad %113 
					                                         f32 %115 = OpFAdd %111 %114 
					                                Private f32* %117 = OpAccessChain %93 %116 
					                                                      OpStore %117 %115 
					                                       f32_3 %118 = OpLoad %39 
					                                Uniform f32* %120 = OpAccessChain %17 %119 
					                                         f32 %121 = OpLoad %120 
					                                Uniform f32* %123 = OpAccessChain %17 %122 
					                                         f32 %124 = OpLoad %123 
					                                Uniform f32* %126 = OpAccessChain %17 %125 
					                                         f32 %127 = OpLoad %126 
					                                       f32_3 %128 = OpCompositeConstruct %121 %124 %127 
					                                         f32 %129 = OpDot %118 %128 
					                                                      OpStore %107 %129 
					                                         f32 %130 = OpLoad %107 
					                                Uniform f32* %132 = OpAccessChain %17 %131 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFAdd %130 %133 
					                                Private f32* %135 = OpAccessChain %93 %60 
					                                                      OpStore %135 %134 
					                                       f32_3 %136 = OpLoad %39 
					                                Uniform f32* %138 = OpAccessChain %17 %137 
					                                         f32 %139 = OpLoad %138 
					                                Uniform f32* %141 = OpAccessChain %17 %140 
					                                         f32 %142 = OpLoad %141 
					                                Uniform f32* %144 = OpAccessChain %17 %143 
					                                         f32 %145 = OpLoad %144 
					                                       f32_3 %146 = OpCompositeConstruct %139 %142 %145 
					                                         f32 %147 = OpDot %136 %146 
					                                                      OpStore %107 %147 
					                                         f32 %148 = OpLoad %107 
					                                Uniform f32* %150 = OpAccessChain %17 %149 
					                                         f32 %151 = OpLoad %150 
					                                         f32 %152 = OpFAdd %148 %151 
					                                Private f32* %154 = OpAccessChain %93 %153 
					                                                      OpStore %154 %152 
					                                       f32_3 %155 = OpLoad %93 
					                                       f32_3 %156 = OpLoad %9 
					                                       f32_3 %157 = OpVectorShuffle %156 %156 0 0 0 
					                                       f32_3 %158 = OpFMul %155 %157 
					                                       f32_3 %159 = OpLoad %39 
					                                       f32_3 %160 = OpFNegate %159 
					                                       f32_3 %161 = OpFAdd %158 %160 
					                                                      OpStore %9 %161 
					                                Uniform f32* %165 = OpAccessChain %17 %164 
					                                         f32 %166 = OpLoad %165 
					                                Uniform f32* %167 = OpAccessChain %17 %164 
					                                         f32 %168 = OpLoad %167 
					                                Uniform f32* %169 = OpAccessChain %17 %164 
					                                         f32 %170 = OpLoad %169 
					                                       f32_3 %171 = OpCompositeConstruct %166 %168 %170 
					                                         f32 %172 = OpCompositeExtract %171 0 
					                                         f32 %173 = OpCompositeExtract %171 1 
					                                         f32 %174 = OpCompositeExtract %171 2 
					                                       f32_3 %175 = OpCompositeConstruct %172 %173 %174 
					                                       f32_3 %176 = OpLoad %9 
					                                       f32_3 %177 = OpFMul %175 %176 
					                                       f32_3 %178 = OpLoad %39 
					                                       f32_3 %179 = OpFAdd %177 %178 
					                                       f32_4 %180 = OpLoad %163 
					                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
					                                                      OpStore %163 %181 
					                                 Output f32* %184 = OpAccessChain %163 %182 
					                                                      OpStore %184 %36 
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
						float _Red_R;
						float _Red_G;
						float _Red_B;
						float _Green_R;
						float _Green_G;
						float _Green_B;
						float _Blue_R;
						float _Blue_G;
						float _Blue_B;
						float _Red_C;
						float _Green_C;
						float _Blue_C;
						float _FadeFX;
						vec4 unused_0_15;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy * vec2(0.100000001, 1.0);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat6.xy, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469 + _TimeX;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					    u_xlat2.x = _Blue_R;
					    u_xlat2.yz = vec2(_Blue_G, _Blue_B);
					    u_xlat3 = dot(u_xlat10_1.xyz, u_xlat2.xyz);
					    u_xlat2.z = u_xlat3 + _Blue_C;
					    u_xlat3 = dot(u_xlat10_1.xyz, vec3(_Red_R, _Red_G, _Red_B));
					    u_xlat2.x = u_xlat3 + _Red_C;
					    u_xlat3 = dot(u_xlat10_1.xyz, vec3(_Green_R, _Green_G, _Green_B));
					    u_xlat2.y = u_xlat3 + _Green_C;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_FadeFX, _FadeFX, _FadeFX)) * u_xlat0.xyz + u_xlat10_1.xyz;
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