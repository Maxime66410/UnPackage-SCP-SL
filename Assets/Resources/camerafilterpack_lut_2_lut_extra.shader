Shader "CameraFilterPack/Lut_2_lut_Extra" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 32700
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	float _Fade;
					uniform 	float _Fade2;
					uniform 	float _Pos;
					uniform 	float _Smooth;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler3D _LutTex;
					UNITY_LOCATION(2) uniform  sampler3D _LutTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.y + (-_Pos);
					    u_xlat3.x = float(1.0) / _Smooth;
					    u_xlat0 = u_xlat3.x * u_xlat0;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat3.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_2 = texture(_LutTex2, u_xlat10_1.xyz);
					    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
					    u_xlat3.xyz = vec3(vec3(_Fade2, _Fade2, _Fade2)) * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat10_2 = texture(_LutTex, u_xlat10_1.xyz);
					    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
					    u_xlat1.xyz = vec3(_Fade) * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat0) * u_xlat3.xyz + u_xlat1.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 94
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %70 0 BuiltIn 70 
					                                              OpMemberDecorate %70 1 BuiltIn 70 
					                                              OpMemberDecorate %70 2 BuiltIn 70 
					                                              OpDecorate %70 Block 
					                                              OpDecorate vs_TEXCOORD0 Location 84 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %86 Location 86 
					                                              OpDecorate %87 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                         Input f32_4* %11 = OpVariable Input 
					                                      %14 = OpTypeInt 32 0 
					                                  u32 %15 = OpConstant 4 
					                                      %16 = OpTypeArray %7 %15 
					                                      %17 = OpTypeArray %7 %15 
					                                      %18 = OpTypeStruct %16 %17 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
					                                      %21 = OpTypeInt 32 1 
					                                  i32 %22 = OpConstant 0 
					                                  i32 %23 = OpConstant 1 
					                                      %24 = OpTypePointer Uniform %7 
					                                  i32 %35 = OpConstant 2 
					                                  i32 %44 = OpConstant 3 
					                       Private f32_4* %48 = OpVariable Private 
					                                  u32 %68 = OpConstant 1 
					                                      %69 = OpTypeArray %6 %68 
					                                      %70 = OpTypeStruct %7 %6 %69 
					                                      %71 = OpTypePointer Output %70 
					 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                      %80 = OpTypePointer Output %7 
					                                      %82 = OpTypeVector %6 2 
					                                      %83 = OpTypePointer Output %82 
					               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                      %85 = OpTypePointer Input %82 
					                         Input f32_2* %86 = OpVariable Input 
					                                      %88 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                                f32_4 %12 = OpLoad %11 
					                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                f32_4 %26 = OpLoad %25 
					                                f32_4 %27 = OpFMul %13 %26 
					                                              OpStore %9 %27 
					                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                f32_4 %29 = OpLoad %28 
					                                f32_4 %30 = OpLoad %11 
					                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                f32_4 %32 = OpFMul %29 %31 
					                                f32_4 %33 = OpLoad %9 
					                                f32_4 %34 = OpFAdd %32 %33 
					                                              OpStore %9 %34 
					                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                f32_4 %37 = OpLoad %36 
					                                f32_4 %38 = OpLoad %11 
					                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                f32_4 %40 = OpFMul %37 %39 
					                                f32_4 %41 = OpLoad %9 
					                                f32_4 %42 = OpFAdd %40 %41 
					                                              OpStore %9 %42 
					                                f32_4 %43 = OpLoad %9 
					                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                f32_4 %46 = OpLoad %45 
					                                f32_4 %47 = OpFAdd %43 %46 
					                                              OpStore %9 %47 
					                                f32_4 %49 = OpLoad %9 
					                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                f32_4 %52 = OpLoad %51 
					                                f32_4 %53 = OpFMul %50 %52 
					                                              OpStore %48 %53 
					                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                f32_4 %55 = OpLoad %54 
					                                f32_4 %56 = OpLoad %9 
					                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                f32_4 %58 = OpFMul %55 %57 
					                                f32_4 %59 = OpLoad %48 
					                                f32_4 %60 = OpFAdd %58 %59 
					                                              OpStore %48 %60 
					                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                f32_4 %62 = OpLoad %61 
					                                f32_4 %63 = OpLoad %9 
					                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                f32_4 %65 = OpFMul %62 %64 
					                                f32_4 %66 = OpLoad %48 
					                                f32_4 %67 = OpFAdd %65 %66 
					                                              OpStore %48 %67 
					                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                f32_4 %74 = OpLoad %73 
					                                f32_4 %75 = OpLoad %9 
					                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                f32_4 %77 = OpFMul %74 %76 
					                                f32_4 %78 = OpLoad %48 
					                                f32_4 %79 = OpFAdd %77 %78 
					                        Output f32_4* %81 = OpAccessChain %72 %22 
					                                              OpStore %81 %79 
					                                f32_2 %87 = OpLoad %86 
					                                              OpStore vs_TEXCOORD0 %87 
					                          Output f32* %89 = OpAccessChain %72 %22 %68 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                          Output f32* %92 = OpAccessChain %72 %22 %68 
					                                              OpStore %92 %91 
					                                              OpReturn
					                                              OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 154
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %135 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 11 
					                                              OpMemberDecorate %17 0 Offset 17 
					                                              OpMemberDecorate %17 1 Offset 17 
					                                              OpMemberDecorate %17 2 Offset 17 
					                                              OpMemberDecorate %17 3 Offset 17 
					                                              OpDecorate %17 Block 
					                                              OpDecorate %19 DescriptorSet 19 
					                                              OpDecorate %19 Binding 19 
					                                              OpDecorate %59 RelaxedPrecision 
					                                              OpDecorate %62 RelaxedPrecision 
					                                              OpDecorate %62 DescriptorSet 62 
					                                              OpDecorate %62 Binding 62 
					                                              OpDecorate %63 RelaxedPrecision 
					                                              OpDecorate %66 RelaxedPrecision 
					                                              OpDecorate %66 DescriptorSet 66 
					                                              OpDecorate %66 Binding 66 
					                                              OpDecorate %67 RelaxedPrecision 
					                                              OpDecorate %72 RelaxedPrecision 
					                                              OpDecorate %75 RelaxedPrecision 
					                                              OpDecorate %75 DescriptorSet 75 
					                                              OpDecorate %75 Binding 75 
					                                              OpDecorate %76 RelaxedPrecision 
					                                              OpDecorate %77 RelaxedPrecision 
					                                              OpDecorate %77 DescriptorSet 77 
					                                              OpDecorate %77 Binding 77 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %81 RelaxedPrecision 
					                                              OpDecorate %82 RelaxedPrecision 
					                                              OpDecorate %83 RelaxedPrecision 
					                                              OpDecorate %84 RelaxedPrecision 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %87 RelaxedPrecision 
					                                              OpDecorate %88 RelaxedPrecision 
					                                              OpDecorate %89 RelaxedPrecision 
					                                              OpDecorate %90 RelaxedPrecision 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %99 RelaxedPrecision 
					                                              OpDecorate %100 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %102 RelaxedPrecision 
					                                              OpDecorate %103 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %107 RelaxedPrecision 
					                                              OpDecorate %108 RelaxedPrecision 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %109 DescriptorSet 109 
					                                              OpDecorate %109 Binding 109 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %111 DescriptorSet 111 
					                                              OpDecorate %111 Binding 111 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %114 RelaxedPrecision 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %117 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %120 RelaxedPrecision 
					                                              OpDecorate %121 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %128 RelaxedPrecision 
					                                              OpDecorate %129 RelaxedPrecision 
					                                              OpDecorate %130 RelaxedPrecision 
					                                              OpDecorate %131 RelaxedPrecision 
					                                              OpDecorate %132 RelaxedPrecision 
					                                              OpDecorate %133 RelaxedPrecision 
					                                              OpDecorate %135 Location 135 
					                                              OpDecorate %138 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypePointer Private %6 
					                          Private f32* %8 = OpVariable Private 
					                                       %9 = OpTypeVector %6 2 
					                                      %10 = OpTypePointer Input %9 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %12 = OpTypeInt 32 0 
					                                  u32 %13 = OpConstant 1 
					                                      %14 = OpTypePointer Input %6 
					                                      %17 = OpTypeStruct %6 %6 %6 %6 
					                                      %18 = OpTypePointer Uniform %17 
					Uniform struct {f32; f32; f32; f32;}* %19 = OpVariable Uniform 
					                                      %20 = OpTypeInt 32 1 
					                                  i32 %21 = OpConstant 2 
					                                      %22 = OpTypePointer Uniform %6 
					                                      %27 = OpTypeVector %6 3 
					                                      %28 = OpTypePointer Private %27 
					                       Private f32_3* %29 = OpVariable Private 
					                                  f32 %30 = OpConstant 3,674022E-40 
					                                  i32 %31 = OpConstant 3 
					                                  u32 %35 = OpConstant 0 
					                                  f32 %42 = OpConstant 3,674022E-40 
					                                  f32 %45 = OpConstant 3,674022E-40 
					                                  f32 %47 = OpConstant 3,674022E-40 
					                                      %57 = OpTypeVector %6 4 
					                                      %58 = OpTypePointer Private %57 
					                       Private f32_4* %59 = OpVariable Private 
					                                      %60 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %61 = OpTypePointer UniformConstant %60 
					 UniformConstant read_only Texture2D* %62 = OpVariable UniformConstant 
					                                      %64 = OpTypeSampler 
					                                      %65 = OpTypePointer UniformConstant %64 
					             UniformConstant sampler* %66 = OpVariable UniformConstant 
					                                      %68 = OpTypeSampledImage %60 
					                       Private f32_3* %72 = OpVariable Private 
					                                      %73 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
					                                      %74 = OpTypePointer UniformConstant %73 
					 UniformConstant read_only Texture3D* %75 = OpVariable UniformConstant 
					             UniformConstant sampler* %77 = OpVariable UniformConstant 
					                                      %79 = OpTypeSampledImage %73 
					                       Private f32_3* %85 = OpVariable Private 
					                                  i32 %91 = OpConstant 1 
					                      Private f32_3* %108 = OpVariable Private 
					UniformConstant read_only Texture3D* %109 = OpVariable UniformConstant 
					            UniformConstant sampler* %111 = OpVariable UniformConstant 
					                      Private f32_3* %118 = OpVariable Private 
					                      Private f32_3* %124 = OpVariable Private 
					                                 i32 %125 = OpConstant 0 
					                                     %134 = OpTypePointer Output %57 
					                       Output f32_4* %135 = OpVariable Output 
					                                 u32 %136 = OpConstant 3 
					                                     %139 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                           Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
					                                  f32 %16 = OpLoad %15 
					                         Uniform f32* %23 = OpAccessChain %19 %21 
					                                  f32 %24 = OpLoad %23 
					                                  f32 %25 = OpFNegate %24 
					                                  f32 %26 = OpFAdd %16 %25 
					                                              OpStore %8 %26 
					                         Uniform f32* %32 = OpAccessChain %19 %31 
					                                  f32 %33 = OpLoad %32 
					                                  f32 %34 = OpFDiv %30 %33 
					                         Private f32* %36 = OpAccessChain %29 %35 
					                                              OpStore %36 %34 
					                         Private f32* %37 = OpAccessChain %29 %35 
					                                  f32 %38 = OpLoad %37 
					                                  f32 %39 = OpLoad %8 
					                                  f32 %40 = OpFMul %38 %39 
					                                              OpStore %8 %40 
					                                  f32 %41 = OpLoad %8 
					                                  f32 %43 = OpExtInst %1 43 %41 %42 %30 
					                                              OpStore %8 %43 
					                                  f32 %44 = OpLoad %8 
					                                  f32 %46 = OpFMul %44 %45 
					                                  f32 %48 = OpFAdd %46 %47 
					                         Private f32* %49 = OpAccessChain %29 %35 
					                                              OpStore %49 %48 
					                                  f32 %50 = OpLoad %8 
					                                  f32 %51 = OpLoad %8 
					                                  f32 %52 = OpFMul %50 %51 
					                                              OpStore %8 %52 
					                                  f32 %53 = OpLoad %8 
					                         Private f32* %54 = OpAccessChain %29 %35 
					                                  f32 %55 = OpLoad %54 
					                                  f32 %56 = OpFMul %53 %55 
					                                              OpStore %8 %56 
					                  read_only Texture2D %63 = OpLoad %62 
					                              sampler %67 = OpLoad %66 
					           read_only Texture2DSampled %69 = OpSampledImage %63 %67 
					                                f32_2 %70 = OpLoad vs_TEXCOORD0 
					                                f32_4 %71 = OpImageSampleImplicitLod %69 %70 
					                                              OpStore %59 %71 
					                  read_only Texture3D %76 = OpLoad %75 
					                              sampler %78 = OpLoad %77 
					           read_only Texture3DSampled %80 = OpSampledImage %76 %78 
					                                f32_4 %81 = OpLoad %59 
					                                f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
					                                f32_4 %83 = OpImageSampleImplicitLod %80 %82 
					                                f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
					                                              OpStore %72 %84 
					                                f32_4 %86 = OpLoad %59 
					                                f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
					                                f32_3 %88 = OpFNegate %87 
					                                f32_3 %89 = OpLoad %72 
					                                f32_3 %90 = OpFAdd %88 %89 
					                                              OpStore %85 %90 
					                         Uniform f32* %92 = OpAccessChain %19 %91 
					                                  f32 %93 = OpLoad %92 
					                         Uniform f32* %94 = OpAccessChain %19 %91 
					                                  f32 %95 = OpLoad %94 
					                         Uniform f32* %96 = OpAccessChain %19 %91 
					                                  f32 %97 = OpLoad %96 
					                                f32_3 %98 = OpCompositeConstruct %93 %95 %97 
					                                  f32 %99 = OpCompositeExtract %98 0 
					                                 f32 %100 = OpCompositeExtract %98 1 
					                                 f32 %101 = OpCompositeExtract %98 2 
					                               f32_3 %102 = OpCompositeConstruct %99 %100 %101 
					                               f32_3 %103 = OpLoad %85 
					                               f32_3 %104 = OpFMul %102 %103 
					                               f32_4 %105 = OpLoad %59 
					                               f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
					                               f32_3 %107 = OpFAdd %104 %106 
					                                              OpStore %29 %107 
					                 read_only Texture3D %110 = OpLoad %109 
					                             sampler %112 = OpLoad %111 
					          read_only Texture3DSampled %113 = OpSampledImage %110 %112 
					                               f32_4 %114 = OpLoad %59 
					                               f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
					                               f32_4 %116 = OpImageSampleImplicitLod %113 %115 
					                               f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
					                                              OpStore %108 %117 
					                               f32_4 %119 = OpLoad %59 
					                               f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
					                               f32_3 %121 = OpFNegate %120 
					                               f32_3 %122 = OpLoad %108 
					                               f32_3 %123 = OpFAdd %121 %122 
					                                              OpStore %118 %123 
					                        Uniform f32* %126 = OpAccessChain %19 %125 
					                                 f32 %127 = OpLoad %126 
					                               f32_3 %128 = OpCompositeConstruct %127 %127 %127 
					                               f32_3 %129 = OpLoad %118 
					                               f32_3 %130 = OpFMul %128 %129 
					                               f32_4 %131 = OpLoad %59 
					                               f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                               f32_3 %133 = OpFAdd %130 %132 
					                                              OpStore %124 %133 
					                        Private f32* %137 = OpAccessChain %59 %136 
					                                 f32 %138 = OpLoad %137 
					                         Output f32* %140 = OpAccessChain %135 %136 
					                                              OpStore %140 %138 
					                               f32_3 %141 = OpLoad %29 
					                               f32_3 %142 = OpLoad %124 
					                               f32_3 %143 = OpFNegate %142 
					                               f32_3 %144 = OpFAdd %141 %143 
					                                              OpStore %29 %144 
					                                 f32 %145 = OpLoad %8 
					                               f32_3 %146 = OpCompositeConstruct %145 %145 %145 
					                               f32_3 %147 = OpLoad %29 
					                               f32_3 %148 = OpFMul %146 %147 
					                               f32_3 %149 = OpLoad %124 
					                               f32_3 %150 = OpFAdd %148 %149 
					                               f32_4 %151 = OpLoad %135 
					                               f32_4 %152 = OpVectorShuffle %151 %150 4 5 6 3 
					                                              OpStore %135 %152 
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
						float _Fade;
						float _Fade2;
						float _Pos;
						float _Smooth;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler3D _LutTex;
					uniform  sampler3D _LutTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat16_3;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.y + (-_Pos);
					    u_xlat3.x = float(1.0) / _Smooth;
					    u_xlat0 = u_xlat3.x * u_xlat0;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = u_xlat0 * u_xlat3.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_2 = texture(_LutTex2, u_xlat10_1.xyz);
					    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
					    u_xlat3.xyz = vec3(vec3(_Fade2, _Fade2, _Fade2)) * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat10_2 = texture(_LutTex, u_xlat10_1.xyz);
					    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
					    u_xlat1.xyz = vec3(_Fade) * u_xlat16_2.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat0) * u_xlat3.xyz + u_xlat1.xyz;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 108315
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
					uniform 	float _Fade;
					uniform 	float _Fade2;
					uniform 	float _Pos;
					uniform 	float _Smooth;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler3D _LutTex;
					UNITY_LOCATION(2) uniform  sampler3D _LutTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y + (-_Pos);
					    u_xlat3.x = float(1.0) / _Smooth;
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = sqrt(u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat10_1 = texture(_LutTex2, u_xlat3.xyz);
					    u_xlat1.xyz = (-u_xlat3.xyz) + u_xlat10_1.xyz;
					    u_xlat1.xyz = vec3(vec3(_Fade2, _Fade2, _Fade2)) * u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat10_2 = texture(_LutTex, u_xlat3.xyz);
					    u_xlat2.xyz = (-u_xlat3.xyz) + u_xlat10_2.xyz;
					    u_xlat3.xyz = vec3(_Fade) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = (-u_xlat3.xyz) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat0.xyz;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 94
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %70 0 BuiltIn 70 
					                                              OpMemberDecorate %70 1 BuiltIn 70 
					                                              OpMemberDecorate %70 2 BuiltIn 70 
					                                              OpDecorate %70 Block 
					                                              OpDecorate vs_TEXCOORD0 Location 84 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %86 Location 86 
					                                              OpDecorate %87 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                         Input f32_4* %11 = OpVariable Input 
					                                      %14 = OpTypeInt 32 0 
					                                  u32 %15 = OpConstant 4 
					                                      %16 = OpTypeArray %7 %15 
					                                      %17 = OpTypeArray %7 %15 
					                                      %18 = OpTypeStruct %16 %17 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
					                                      %21 = OpTypeInt 32 1 
					                                  i32 %22 = OpConstant 0 
					                                  i32 %23 = OpConstant 1 
					                                      %24 = OpTypePointer Uniform %7 
					                                  i32 %35 = OpConstant 2 
					                                  i32 %44 = OpConstant 3 
					                       Private f32_4* %48 = OpVariable Private 
					                                  u32 %68 = OpConstant 1 
					                                      %69 = OpTypeArray %6 %68 
					                                      %70 = OpTypeStruct %7 %6 %69 
					                                      %71 = OpTypePointer Output %70 
					 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                      %80 = OpTypePointer Output %7 
					                                      %82 = OpTypeVector %6 2 
					                                      %83 = OpTypePointer Output %82 
					               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                      %85 = OpTypePointer Input %82 
					                         Input f32_2* %86 = OpVariable Input 
					                                      %88 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                                f32_4 %12 = OpLoad %11 
					                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                f32_4 %26 = OpLoad %25 
					                                f32_4 %27 = OpFMul %13 %26 
					                                              OpStore %9 %27 
					                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                f32_4 %29 = OpLoad %28 
					                                f32_4 %30 = OpLoad %11 
					                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                f32_4 %32 = OpFMul %29 %31 
					                                f32_4 %33 = OpLoad %9 
					                                f32_4 %34 = OpFAdd %32 %33 
					                                              OpStore %9 %34 
					                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                f32_4 %37 = OpLoad %36 
					                                f32_4 %38 = OpLoad %11 
					                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                f32_4 %40 = OpFMul %37 %39 
					                                f32_4 %41 = OpLoad %9 
					                                f32_4 %42 = OpFAdd %40 %41 
					                                              OpStore %9 %42 
					                                f32_4 %43 = OpLoad %9 
					                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                f32_4 %46 = OpLoad %45 
					                                f32_4 %47 = OpFAdd %43 %46 
					                                              OpStore %9 %47 
					                                f32_4 %49 = OpLoad %9 
					                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                f32_4 %52 = OpLoad %51 
					                                f32_4 %53 = OpFMul %50 %52 
					                                              OpStore %48 %53 
					                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                f32_4 %55 = OpLoad %54 
					                                f32_4 %56 = OpLoad %9 
					                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                f32_4 %58 = OpFMul %55 %57 
					                                f32_4 %59 = OpLoad %48 
					                                f32_4 %60 = OpFAdd %58 %59 
					                                              OpStore %48 %60 
					                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                f32_4 %62 = OpLoad %61 
					                                f32_4 %63 = OpLoad %9 
					                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                f32_4 %65 = OpFMul %62 %64 
					                                f32_4 %66 = OpLoad %48 
					                                f32_4 %67 = OpFAdd %65 %66 
					                                              OpStore %48 %67 
					                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                f32_4 %74 = OpLoad %73 
					                                f32_4 %75 = OpLoad %9 
					                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                f32_4 %77 = OpFMul %74 %76 
					                                f32_4 %78 = OpLoad %48 
					                                f32_4 %79 = OpFAdd %77 %78 
					                        Output f32_4* %81 = OpAccessChain %72 %22 
					                                              OpStore %81 %79 
					                                f32_2 %87 = OpLoad %86 
					                                              OpStore vs_TEXCOORD0 %87 
					                          Output f32* %89 = OpAccessChain %72 %22 %68 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                          Output f32* %92 = OpAccessChain %72 %22 %68 
					                                              OpStore %92 %91 
					                                              OpReturn
					                                              OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 166
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %12 %87 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 12 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpMemberDecorate %18 2 Offset 18 
					                                              OpMemberDecorate %18 3 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpDecorate %70 RelaxedPrecision 
					                                              OpDecorate %73 RelaxedPrecision 
					                                              OpDecorate %73 DescriptorSet 73 
					                                              OpDecorate %73 Binding 73 
					                                              OpDecorate %74 RelaxedPrecision 
					                                              OpDecorate %77 RelaxedPrecision 
					                                              OpDecorate %77 DescriptorSet 77 
					                                              OpDecorate %77 Binding 77 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %83 RelaxedPrecision 
					                                              OpDecorate %84 RelaxedPrecision 
					                                              OpDecorate %85 RelaxedPrecision 
					                                              OpDecorate %87 Location 87 
					                                              OpDecorate %90 RelaxedPrecision 
					                                              OpDecorate %95 RelaxedPrecision 
					                                              OpDecorate %95 DescriptorSet 95 
					                                              OpDecorate %95 Binding 95 
					                                              OpDecorate %96 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %97 DescriptorSet 97 
					                                              OpDecorate %97 Binding 97 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %103 RelaxedPrecision 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %128 RelaxedPrecision 
					                                              OpDecorate %129 RelaxedPrecision 
					                                              OpDecorate %129 DescriptorSet 129 
					                                              OpDecorate %129 Binding 129 
					                                              OpDecorate %130 RelaxedPrecision 
					                                              OpDecorate %131 RelaxedPrecision 
					                                              OpDecorate %131 DescriptorSet 131 
					                                              OpDecorate %131 Binding 131 
					                                              OpDecorate %132 RelaxedPrecision 
					                                              OpDecorate %136 RelaxedPrecision 
					                                              OpDecorate %140 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 3 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_3* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 2 
					                                      %11 = OpTypePointer Input %10 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeInt 32 0 
					                                  u32 %14 = OpConstant 1 
					                                      %15 = OpTypePointer Input %6 
					                                      %18 = OpTypeStruct %6 %6 %6 %6 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32; f32; f32; f32;}* %20 = OpVariable Uniform 
					                                      %21 = OpTypeInt 32 1 
					                                  i32 %22 = OpConstant 2 
					                                      %23 = OpTypePointer Uniform %6 
					                                  u32 %28 = OpConstant 0 
					                                      %29 = OpTypePointer Private %6 
					                       Private f32_3* %31 = OpVariable Private 
					                                  f32 %32 = OpConstant 3,674022E-40 
					                                  i32 %33 = OpConstant 3 
					                                  f32 %46 = OpConstant 3,674022E-40 
					                                  f32 %51 = OpConstant 3,674022E-40 
					                                  f32 %53 = OpConstant 3,674022E-40 
					                                      %68 = OpTypeVector %6 4 
					                                      %69 = OpTypePointer Private %68 
					                       Private f32_4* %70 = OpVariable Private 
					                                      %71 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %72 = OpTypePointer UniformConstant %71 
					 UniformConstant read_only Texture2D* %73 = OpVariable UniformConstant 
					                                      %75 = OpTypeSampler 
					                                      %76 = OpTypePointer UniformConstant %75 
					             UniformConstant sampler* %77 = OpVariable UniformConstant 
					                                      %79 = OpTypeSampledImage %71 
					                                      %86 = OpTypePointer Output %68 
					                        Output f32_4* %87 = OpVariable Output 
					                                  u32 %88 = OpConstant 3 
					                                      %91 = OpTypePointer Output %6 
					                                      %93 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
					                                      %94 = OpTypePointer UniformConstant %93 
					 UniformConstant read_only Texture3D* %95 = OpVariable UniformConstant 
					             UniformConstant sampler* %97 = OpVariable UniformConstant 
					                                      %99 = OpTypeSampledImage %93 
					                      Private f32_3* %106 = OpVariable Private 
					                                 i32 %112 = OpConstant 1 
					                      Private f32_3* %128 = OpVariable Private 
					UniformConstant read_only Texture3D* %129 = OpVariable UniformConstant 
					            UniformConstant sampler* %131 = OpVariable UniformConstant 
					                      Private f32_3* %137 = OpVariable Private 
					                                 i32 %142 = OpConstant 0 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                           Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
					                                  f32 %17 = OpLoad %16 
					                         Uniform f32* %24 = OpAccessChain %20 %22 
					                                  f32 %25 = OpLoad %24 
					                                  f32 %26 = OpFNegate %25 
					                                  f32 %27 = OpFAdd %17 %26 
					                         Private f32* %30 = OpAccessChain %9 %28 
					                                              OpStore %30 %27 
					                         Uniform f32* %34 = OpAccessChain %20 %33 
					                                  f32 %35 = OpLoad %34 
					                                  f32 %36 = OpFDiv %32 %35 
					                         Private f32* %37 = OpAccessChain %31 %28 
					                                              OpStore %37 %36 
					                         Private f32* %38 = OpAccessChain %31 %28 
					                                  f32 %39 = OpLoad %38 
					                         Private f32* %40 = OpAccessChain %9 %28 
					                                  f32 %41 = OpLoad %40 
					                                  f32 %42 = OpFMul %39 %41 
					                         Private f32* %43 = OpAccessChain %9 %28 
					                                              OpStore %43 %42 
					                         Private f32* %44 = OpAccessChain %9 %28 
					                                  f32 %45 = OpLoad %44 
					                                  f32 %47 = OpExtInst %1 43 %45 %46 %32 
					                         Private f32* %48 = OpAccessChain %9 %28 
					                                              OpStore %48 %47 
					                         Private f32* %49 = OpAccessChain %9 %28 
					                                  f32 %50 = OpLoad %49 
					                                  f32 %52 = OpFMul %50 %51 
					                                  f32 %54 = OpFAdd %52 %53 
					                         Private f32* %55 = OpAccessChain %31 %28 
					                                              OpStore %55 %54 
					                         Private f32* %56 = OpAccessChain %9 %28 
					                                  f32 %57 = OpLoad %56 
					                         Private f32* %58 = OpAccessChain %9 %28 
					                                  f32 %59 = OpLoad %58 
					                                  f32 %60 = OpFMul %57 %59 
					                         Private f32* %61 = OpAccessChain %9 %28 
					                                              OpStore %61 %60 
					                         Private f32* %62 = OpAccessChain %9 %28 
					                                  f32 %63 = OpLoad %62 
					                         Private f32* %64 = OpAccessChain %31 %28 
					                                  f32 %65 = OpLoad %64 
					                                  f32 %66 = OpFMul %63 %65 
					                         Private f32* %67 = OpAccessChain %9 %28 
					                                              OpStore %67 %66 
					                  read_only Texture2D %74 = OpLoad %73 
					                              sampler %78 = OpLoad %77 
					           read_only Texture2DSampled %80 = OpSampledImage %74 %78 
					                                f32_2 %81 = OpLoad vs_TEXCOORD0 
					                                f32_4 %82 = OpImageSampleImplicitLod %80 %81 
					                                              OpStore %70 %82 
					                                f32_4 %83 = OpLoad %70 
					                                f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
					                                f32_3 %85 = OpExtInst %1 31 %84 
					                                              OpStore %31 %85 
					                         Private f32* %89 = OpAccessChain %70 %88 
					                                  f32 %90 = OpLoad %89 
					                          Output f32* %92 = OpAccessChain %87 %88 
					                                              OpStore %92 %90 
					                  read_only Texture3D %96 = OpLoad %95 
					                              sampler %98 = OpLoad %97 
					          read_only Texture3DSampled %100 = OpSampledImage %96 %98 
					                               f32_3 %101 = OpLoad %31 
					                               f32_4 %102 = OpImageSampleImplicitLod %100 %101 
					                               f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
					                               f32_4 %104 = OpLoad %70 
					                               f32_4 %105 = OpVectorShuffle %104 %103 4 5 6 3 
					                                              OpStore %70 %105 
					                               f32_3 %107 = OpLoad %31 
					                               f32_3 %108 = OpFNegate %107 
					                               f32_4 %109 = OpLoad %70 
					                               f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
					                               f32_3 %111 = OpFAdd %108 %110 
					                                              OpStore %106 %111 
					                        Uniform f32* %113 = OpAccessChain %20 %112 
					                                 f32 %114 = OpLoad %113 
					                        Uniform f32* %115 = OpAccessChain %20 %112 
					                                 f32 %116 = OpLoad %115 
					                        Uniform f32* %117 = OpAccessChain %20 %112 
					                                 f32 %118 = OpLoad %117 
					                               f32_3 %119 = OpCompositeConstruct %114 %116 %118 
					                                 f32 %120 = OpCompositeExtract %119 0 
					                                 f32 %121 = OpCompositeExtract %119 1 
					                                 f32 %122 = OpCompositeExtract %119 2 
					                               f32_3 %123 = OpCompositeConstruct %120 %121 %122 
					                               f32_3 %124 = OpLoad %106 
					                               f32_3 %125 = OpFMul %123 %124 
					                               f32_3 %126 = OpLoad %31 
					                               f32_3 %127 = OpFAdd %125 %126 
					                                              OpStore %106 %127 
					                 read_only Texture3D %130 = OpLoad %129 
					                             sampler %132 = OpLoad %131 
					          read_only Texture3DSampled %133 = OpSampledImage %130 %132 
					                               f32_3 %134 = OpLoad %31 
					                               f32_4 %135 = OpImageSampleImplicitLod %133 %134 
					                               f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
					                                              OpStore %128 %136 
					                               f32_3 %138 = OpLoad %31 
					                               f32_3 %139 = OpFNegate %138 
					                               f32_3 %140 = OpLoad %128 
					                               f32_3 %141 = OpFAdd %139 %140 
					                                              OpStore %137 %141 
					                        Uniform f32* %143 = OpAccessChain %20 %142 
					                                 f32 %144 = OpLoad %143 
					                               f32_3 %145 = OpCompositeConstruct %144 %144 %144 
					                               f32_3 %146 = OpLoad %137 
					                               f32_3 %147 = OpFMul %145 %146 
					                               f32_3 %148 = OpLoad %31 
					                               f32_3 %149 = OpFAdd %147 %148 
					                                              OpStore %31 %149 
					                               f32_3 %150 = OpLoad %31 
					                               f32_3 %151 = OpFNegate %150 
					                               f32_3 %152 = OpLoad %106 
					                               f32_3 %153 = OpFAdd %151 %152 
					                                              OpStore %106 %153 
					                               f32_3 %154 = OpLoad %9 
					                               f32_3 %155 = OpVectorShuffle %154 %154 0 0 0 
					                               f32_3 %156 = OpLoad %106 
					                               f32_3 %157 = OpFMul %155 %156 
					                               f32_3 %158 = OpLoad %31 
					                               f32_3 %159 = OpFAdd %157 %158 
					                                              OpStore %9 %159 
					                               f32_3 %160 = OpLoad %9 
					                               f32_3 %161 = OpLoad %9 
					                               f32_3 %162 = OpFMul %160 %161 
					                               f32_4 %163 = OpLoad %87 
					                               f32_4 %164 = OpVectorShuffle %163 %162 4 5 6 3 
					                                              OpStore %87 %164 
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
						float _Fade;
						float _Fade2;
						float _Pos;
						float _Smooth;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler3D _LutTex;
					uniform  sampler3D _LutTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.y + (-_Pos);
					    u_xlat3.x = float(1.0) / _Smooth;
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = sqrt(u_xlat10_1.xyz);
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat10_1 = texture(_LutTex2, u_xlat3.xyz);
					    u_xlat1.xyz = (-u_xlat3.xyz) + u_xlat10_1.xyz;
					    u_xlat1.xyz = vec3(vec3(_Fade2, _Fade2, _Fade2)) * u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat10_2 = texture(_LutTex, u_xlat3.xyz);
					    u_xlat2.xyz = (-u_xlat3.xyz) + u_xlat10_2.xyz;
					    u_xlat3.xyz = vec3(_Fade) * u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = (-u_xlat3.xyz) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat0.xyz;
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