Shader "CameraFilterPack/Lut_TestMode" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 56486
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
					uniform 	float _Blend;
					uniform 	float _Intensity;
					uniform 	float _Extra;
					uniform 	float _Extra2;
					uniform 	float _Extra3;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlatb1 = _Extra3<vs_TEXCOORD0.x;
					    u_xlat2 = u_xlat0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
					    if(u_xlatb1){
					        u_xlat1.xyz = u_xlat0.xyz + vec3(vec3(_Extra, _Extra, _Extra));
					        u_xlat10_1 = texture(_LutTex, u_xlat1.xyz);
					        u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
					        u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					        u_xlat0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
					    }
					    SV_Target0 = u_xlat0;
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
					; Bound: 133
					; Schema: 0
					                                                   OpCapability Shader 
					                                            %1 = OpExtInstImport "GLSL.std.450" 
					                                                   OpMemoryModel Logical GLSL450 
					                                                   OpEntryPoint Fragment %4 "main" %22 %130 
					                                                   OpExecutionMode %4 OriginUpperLeft 
					                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                   OpDecorate %12 RelaxedPrecision 
					                                                   OpDecorate %12 DescriptorSet 12 
					                                                   OpDecorate %12 Binding 12 
					                                                   OpDecorate %13 RelaxedPrecision 
					                                                   OpDecorate %16 RelaxedPrecision 
					                                                   OpDecorate %16 DescriptorSet 16 
					                                                   OpDecorate %16 Binding 16 
					                                                   OpDecorate %17 RelaxedPrecision 
					                                                   OpDecorate vs_TEXCOORD0 Location 22 
					                                                   OpMemberDecorate %28 0 Offset 28 
					                                                   OpMemberDecorate %28 1 Offset 28 
					                                                   OpMemberDecorate %28 2 Offset 28 
					                                                   OpMemberDecorate %28 3 Offset 28 
					                                                   OpMemberDecorate %28 4 Offset 28 
					                                                   OpDecorate %28 Block 
					                                                   OpDecorate %30 DescriptorSet 30 
					                                                   OpDecorate %30 Binding 30 
					                                                   OpDecorate %87 RelaxedPrecision 
					                                                   OpDecorate %90 RelaxedPrecision 
					                                                   OpDecorate %90 DescriptorSet 90 
					                                                   OpDecorate %90 Binding 90 
					                                                   OpDecorate %91 RelaxedPrecision 
					                                                   OpDecorate %92 RelaxedPrecision 
					                                                   OpDecorate %92 DescriptorSet 92 
					                                                   OpDecorate %92 Binding 92 
					                                                   OpDecorate %93 RelaxedPrecision 
					                                                   OpDecorate %98 RelaxedPrecision 
					                                                   OpDecorate %99 RelaxedPrecision 
					                                                   OpDecorate %107 RelaxedPrecision 
					                                                   OpDecorate %108 RelaxedPrecision 
					                                                   OpDecorate %109 RelaxedPrecision 
					                                                   OpDecorate %110 RelaxedPrecision 
					                                                   OpDecorate %111 RelaxedPrecision 
					                                                   OpDecorate %112 RelaxedPrecision 
					                                                   OpDecorate %130 Location 130 
					                                            %2 = OpTypeVoid 
					                                            %3 = OpTypeFunction %2 
					                                            %6 = OpTypeFloat 32 
					                                            %7 = OpTypeVector %6 4 
					                                            %8 = OpTypePointer Private %7 
					                             Private f32_4* %9 = OpVariable Private 
					                                           %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                           %11 = OpTypePointer UniformConstant %10 
					      UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                           %14 = OpTypeSampler 
					                                           %15 = OpTypePointer UniformConstant %14 
					                  UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                           %18 = OpTypeSampledImage %10 
					                                           %20 = OpTypeVector %6 2 
					                                           %21 = OpTypePointer Input %20 
					                     Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                           %25 = OpTypeBool 
					                                           %26 = OpTypePointer Private %25 
					                             Private bool* %27 = OpVariable Private 
					                                           %28 = OpTypeStruct %6 %6 %6 %6 %6 
					                                           %29 = OpTypePointer Uniform %28 
					Uniform struct {f32; f32; f32; f32; f32;}* %30 = OpVariable Uniform 
					                                           %31 = OpTypeInt 32 1 
					                                       i32 %32 = OpConstant 4 
					                                           %33 = OpTypePointer Uniform %6 
					                                           %36 = OpTypeInt 32 0 
					                                       u32 %37 = OpConstant 0 
					                                           %38 = OpTypePointer Input %6 
					                            Private f32_4* %42 = OpVariable Private 
					                                       i32 %44 = OpConstant 1 
					                                           %63 = OpTypeVector %25 4 
					                                           %69 = OpTypeVector %6 3 
					                                           %70 = OpTypePointer Private %69 
					                            Private f32_3* %71 = OpVariable Private 
					                                       i32 %74 = OpConstant 2 
					                            Private f32_3* %87 = OpVariable Private 
					                                           %88 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
					                                           %89 = OpTypePointer UniformConstant %88 
					      UniformConstant read_only Texture3D* %90 = OpVariable UniformConstant 
					                  UniformConstant sampler* %92 = OpVariable UniformConstant 
					                                           %94 = OpTypeSampledImage %88 
					                                      i32 %100 = OpConstant 3 
					                                      i32 %118 = OpConstant 0 
					                                          %129 = OpTypePointer Output %7 
					                            Output f32_4* %130 = OpVariable Output 
					                                       void %4 = OpFunction None %3 
					                                            %5 = OpLabel 
					                       read_only Texture2D %13 = OpLoad %12 
					                                   sampler %17 = OpLoad %16 
					                read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                     f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                     f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                                   OpStore %9 %24 
					                              Uniform f32* %34 = OpAccessChain %30 %32 
					                                       f32 %35 = OpLoad %34 
					                                Input f32* %39 = OpAccessChain vs_TEXCOORD0 %37 
					                                       f32 %40 = OpLoad %39 
					                                      bool %41 = OpFOrdLessThan %35 %40 
					                                                   OpStore %27 %41 
					                                     f32_4 %43 = OpLoad %9 
					                              Uniform f32* %45 = OpAccessChain %30 %44 
					                                       f32 %46 = OpLoad %45 
					                              Uniform f32* %47 = OpAccessChain %30 %44 
					                                       f32 %48 = OpLoad %47 
					                              Uniform f32* %49 = OpAccessChain %30 %44 
					                                       f32 %50 = OpLoad %49 
					                              Uniform f32* %51 = OpAccessChain %30 %44 
					                                       f32 %52 = OpLoad %51 
					                                     f32_4 %53 = OpCompositeConstruct %46 %48 %50 %52 
					                                       f32 %54 = OpCompositeExtract %53 0 
					                                       f32 %55 = OpCompositeExtract %53 1 
					                                       f32 %56 = OpCompositeExtract %53 2 
					                                       f32 %57 = OpCompositeExtract %53 3 
					                                     f32_4 %58 = OpCompositeConstruct %54 %55 %56 %57 
					                                     f32_4 %59 = OpFMul %43 %58 
					                                                   OpStore %42 %59 
					                                      bool %60 = OpLoad %27 
					                                     f32_4 %61 = OpLoad %42 
					                                     f32_4 %62 = OpLoad %9 
					                                    bool_4 %64 = OpCompositeConstruct %60 %60 %60 %60 
					                                     f32_4 %65 = OpSelect %64 %61 %62 
					                                                   OpStore %9 %65 
					                                      bool %66 = OpLoad %27 
					                                                   OpSelectionMerge %68 None 
					                                                   OpBranchConditional %66 %67 %68 
					                                           %67 = OpLabel 
					                                     f32_4 %72 = OpLoad %9 
					                                     f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
					                              Uniform f32* %75 = OpAccessChain %30 %74 
					                                       f32 %76 = OpLoad %75 
					                              Uniform f32* %77 = OpAccessChain %30 %74 
					                                       f32 %78 = OpLoad %77 
					                              Uniform f32* %79 = OpAccessChain %30 %74 
					                                       f32 %80 = OpLoad %79 
					                                     f32_3 %81 = OpCompositeConstruct %76 %78 %80 
					                                       f32 %82 = OpCompositeExtract %81 0 
					                                       f32 %83 = OpCompositeExtract %81 1 
					                                       f32 %84 = OpCompositeExtract %81 2 
					                                     f32_3 %85 = OpCompositeConstruct %82 %83 %84 
					                                     f32_3 %86 = OpFAdd %73 %85 
					                                                   OpStore %71 %86 
					                       read_only Texture3D %91 = OpLoad %90 
					                                   sampler %93 = OpLoad %92 
					                read_only Texture3DSampled %95 = OpSampledImage %91 %93 
					                                     f32_3 %96 = OpLoad %71 
					                                     f32_4 %97 = OpImageSampleImplicitLod %95 %96 
					                                     f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
					                                                   OpStore %87 %98 
					                                     f32_3 %99 = OpLoad %87 
					                             Uniform f32* %101 = OpAccessChain %30 %100 
					                                      f32 %102 = OpLoad %101 
					                             Uniform f32* %103 = OpAccessChain %30 %100 
					                                      f32 %104 = OpLoad %103 
					                             Uniform f32* %105 = OpAccessChain %30 %100 
					                                      f32 %106 = OpLoad %105 
					                                    f32_3 %107 = OpCompositeConstruct %102 %104 %106 
					                                      f32 %108 = OpCompositeExtract %107 0 
					                                      f32 %109 = OpCompositeExtract %107 1 
					                                      f32 %110 = OpCompositeExtract %107 2 
					                                    f32_3 %111 = OpCompositeConstruct %108 %109 %110 
					                                    f32_3 %112 = OpFAdd %99 %111 
					                                                   OpStore %71 %112 
					                                    f32_4 %113 = OpLoad %9 
					                                    f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
					                                    f32_3 %115 = OpFNegate %114 
					                                    f32_3 %116 = OpLoad %71 
					                                    f32_3 %117 = OpFAdd %115 %116 
					                                                   OpStore %71 %117 
					                             Uniform f32* %119 = OpAccessChain %30 %118 
					                                      f32 %120 = OpLoad %119 
					                                    f32_3 %121 = OpCompositeConstruct %120 %120 %120 
					                                    f32_3 %122 = OpLoad %71 
					                                    f32_3 %123 = OpFMul %121 %122 
					                                    f32_4 %124 = OpLoad %9 
					                                    f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
					                                    f32_3 %126 = OpFAdd %123 %125 
					                                    f32_4 %127 = OpLoad %9 
					                                    f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
					                                                   OpStore %9 %128 
					                                                   OpBranch %68 
					                                           %68 = OpLabel 
					                                    f32_4 %131 = OpLoad %9 
					                                                   OpStore %130 %131 
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
						float _Blend;
						float _Intensity;
						float _Extra;
						float _Extra2;
						float _Extra3;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlatb1 = _Extra3<vs_TEXCOORD0.x;
					    u_xlat2 = u_xlat0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
					    if(u_xlatb1){
					        u_xlat1.xyz = u_xlat0.xyz + vec3(vec3(_Extra, _Extra, _Extra));
					        u_xlat10_1 = texture(_LutTex, u_xlat1.xyz);
					        u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
					        u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					        u_xlat0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
					    //ENDIF
					    }
					    SV_Target0 = u_xlat0;
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
			GpuProgramID 78038
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
					uniform 	float _Blend;
					uniform 	float _Intensity;
					uniform 	float _Extra;
					uniform 	float _Extra2;
					uniform 	float _Extra3;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlatb1 = _Extra3<vs_TEXCOORD0.x;
					    u_xlat2 = u_xlat0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    if(u_xlatb1){
					        u_xlat1.xyz = u_xlat0.xyz + vec3(vec3(_Extra, _Extra, _Extra));
					        u_xlat10_1 = texture(_LutTex, u_xlat1.xyz);
					        u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
					        u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					        u_xlat0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
					    }
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat0.xyz;
					    SV_Target0.w = u_xlat0.w;
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
					; Bound: 150
					; Schema: 0
					                                                   OpCapability Shader 
					                                            %1 = OpExtInstImport "GLSL.std.450" 
					                                                   OpMemoryModel Logical GLSL450 
					                                                   OpEntryPoint Fragment %4 "main" %22 %135 
					                                                   OpExecutionMode %4 OriginUpperLeft 
					                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                   OpDecorate %12 RelaxedPrecision 
					                                                   OpDecorate %12 DescriptorSet 12 
					                                                   OpDecorate %12 Binding 12 
					                                                   OpDecorate %13 RelaxedPrecision 
					                                                   OpDecorate %16 RelaxedPrecision 
					                                                   OpDecorate %16 DescriptorSet 16 
					                                                   OpDecorate %16 Binding 16 
					                                                   OpDecorate %17 RelaxedPrecision 
					                                                   OpDecorate vs_TEXCOORD0 Location 22 
					                                                   OpMemberDecorate %28 0 Offset 28 
					                                                   OpMemberDecorate %28 1 Offset 28 
					                                                   OpMemberDecorate %28 2 Offset 28 
					                                                   OpMemberDecorate %28 3 Offset 28 
					                                                   OpMemberDecorate %28 4 Offset 28 
					                                                   OpDecorate %28 Block 
					                                                   OpDecorate %30 DescriptorSet 30 
					                                                   OpDecorate %30 Binding 30 
					                                                   OpDecorate %92 RelaxedPrecision 
					                                                   OpDecorate %95 RelaxedPrecision 
					                                                   OpDecorate %95 DescriptorSet 95 
					                                                   OpDecorate %95 Binding 95 
					                                                   OpDecorate %96 RelaxedPrecision 
					                                                   OpDecorate %97 RelaxedPrecision 
					                                                   OpDecorate %97 DescriptorSet 97 
					                                                   OpDecorate %97 Binding 97 
					                                                   OpDecorate %98 RelaxedPrecision 
					                                                   OpDecorate %103 RelaxedPrecision 
					                                                   OpDecorate %104 RelaxedPrecision 
					                                                   OpDecorate %112 RelaxedPrecision 
					                                                   OpDecorate %113 RelaxedPrecision 
					                                                   OpDecorate %114 RelaxedPrecision 
					                                                   OpDecorate %115 RelaxedPrecision 
					                                                   OpDecorate %116 RelaxedPrecision 
					                                                   OpDecorate %117 RelaxedPrecision 
					                                                   OpDecorate %135 Location 135 
					                                            %2 = OpTypeVoid 
					                                            %3 = OpTypeFunction %2 
					                                            %6 = OpTypeFloat 32 
					                                            %7 = OpTypeVector %6 4 
					                                            %8 = OpTypePointer Private %7 
					                             Private f32_4* %9 = OpVariable Private 
					                                           %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                           %11 = OpTypePointer UniformConstant %10 
					      UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                           %14 = OpTypeSampler 
					                                           %15 = OpTypePointer UniformConstant %14 
					                  UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                           %18 = OpTypeSampledImage %10 
					                                           %20 = OpTypeVector %6 2 
					                                           %21 = OpTypePointer Input %20 
					                     Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                           %25 = OpTypeBool 
					                                           %26 = OpTypePointer Private %25 
					                             Private bool* %27 = OpVariable Private 
					                                           %28 = OpTypeStruct %6 %6 %6 %6 %6 
					                                           %29 = OpTypePointer Uniform %28 
					Uniform struct {f32; f32; f32; f32; f32;}* %30 = OpVariable Uniform 
					                                           %31 = OpTypeInt 32 1 
					                                       i32 %32 = OpConstant 4 
					                                           %33 = OpTypePointer Uniform %6 
					                                           %36 = OpTypeInt 32 0 
					                                       u32 %37 = OpConstant 0 
					                                           %38 = OpTypePointer Input %6 
					                            Private f32_4* %42 = OpVariable Private 
					                                       i32 %44 = OpConstant 1 
					                                           %63 = OpTypeVector %25 4 
					                                           %66 = OpTypeVector %6 3 
					                                           %75 = OpTypePointer Private %66 
					                            Private f32_3* %76 = OpVariable Private 
					                                       i32 %79 = OpConstant 2 
					                            Private f32_3* %92 = OpVariable Private 
					                                           %93 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
					                                           %94 = OpTypePointer UniformConstant %93 
					      UniformConstant read_only Texture3D* %95 = OpVariable UniformConstant 
					                  UniformConstant sampler* %97 = OpVariable UniformConstant 
					                                           %99 = OpTypeSampledImage %93 
					                                      i32 %105 = OpConstant 3 
					                                      i32 %123 = OpConstant 0 
					                                          %134 = OpTypePointer Output %7 
					                            Output f32_4* %135 = OpVariable Output 
					                                      u32 %143 = OpConstant 3 
					                                          %144 = OpTypePointer Private %6 
					                                          %147 = OpTypePointer Output %6 
					                                       void %4 = OpFunction None %3 
					                                            %5 = OpLabel 
					                       read_only Texture2D %13 = OpLoad %12 
					                                   sampler %17 = OpLoad %16 
					                read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                     f32_2 %23 = OpLoad vs_TEXCOORD0 
					                                     f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                                   OpStore %9 %24 
					                              Uniform f32* %34 = OpAccessChain %30 %32 
					                                       f32 %35 = OpLoad %34 
					                                Input f32* %39 = OpAccessChain vs_TEXCOORD0 %37 
					                                       f32 %40 = OpLoad %39 
					                                      bool %41 = OpFOrdLessThan %35 %40 
					                                                   OpStore %27 %41 
					                                     f32_4 %43 = OpLoad %9 
					                              Uniform f32* %45 = OpAccessChain %30 %44 
					                                       f32 %46 = OpLoad %45 
					                              Uniform f32* %47 = OpAccessChain %30 %44 
					                                       f32 %48 = OpLoad %47 
					                              Uniform f32* %49 = OpAccessChain %30 %44 
					                                       f32 %50 = OpLoad %49 
					                              Uniform f32* %51 = OpAccessChain %30 %44 
					                                       f32 %52 = OpLoad %51 
					                                     f32_4 %53 = OpCompositeConstruct %46 %48 %50 %52 
					                                       f32 %54 = OpCompositeExtract %53 0 
					                                       f32 %55 = OpCompositeExtract %53 1 
					                                       f32 %56 = OpCompositeExtract %53 2 
					                                       f32 %57 = OpCompositeExtract %53 3 
					                                     f32_4 %58 = OpCompositeConstruct %54 %55 %56 %57 
					                                     f32_4 %59 = OpFMul %43 %58 
					                                                   OpStore %42 %59 
					                                      bool %60 = OpLoad %27 
					                                     f32_4 %61 = OpLoad %42 
					                                     f32_4 %62 = OpLoad %9 
					                                    bool_4 %64 = OpCompositeConstruct %60 %60 %60 %60 
					                                     f32_4 %65 = OpSelect %64 %61 %62 
					                                                   OpStore %9 %65 
					                                     f32_4 %67 = OpLoad %9 
					                                     f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                     f32_3 %69 = OpExtInst %1 31 %68 
					                                     f32_4 %70 = OpLoad %9 
					                                     f32_4 %71 = OpVectorShuffle %70 %69 4 5 6 3 
					                                                   OpStore %9 %71 
					                                      bool %72 = OpLoad %27 
					                                                   OpSelectionMerge %74 None 
					                                                   OpBranchConditional %72 %73 %74 
					                                           %73 = OpLabel 
					                                     f32_4 %77 = OpLoad %9 
					                                     f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
					                              Uniform f32* %80 = OpAccessChain %30 %79 
					                                       f32 %81 = OpLoad %80 
					                              Uniform f32* %82 = OpAccessChain %30 %79 
					                                       f32 %83 = OpLoad %82 
					                              Uniform f32* %84 = OpAccessChain %30 %79 
					                                       f32 %85 = OpLoad %84 
					                                     f32_3 %86 = OpCompositeConstruct %81 %83 %85 
					                                       f32 %87 = OpCompositeExtract %86 0 
					                                       f32 %88 = OpCompositeExtract %86 1 
					                                       f32 %89 = OpCompositeExtract %86 2 
					                                     f32_3 %90 = OpCompositeConstruct %87 %88 %89 
					                                     f32_3 %91 = OpFAdd %78 %90 
					                                                   OpStore %76 %91 
					                       read_only Texture3D %96 = OpLoad %95 
					                                   sampler %98 = OpLoad %97 
					               read_only Texture3DSampled %100 = OpSampledImage %96 %98 
					                                    f32_3 %101 = OpLoad %76 
					                                    f32_4 %102 = OpImageSampleImplicitLod %100 %101 
					                                    f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
					                                                   OpStore %92 %103 
					                                    f32_3 %104 = OpLoad %92 
					                             Uniform f32* %106 = OpAccessChain %30 %105 
					                                      f32 %107 = OpLoad %106 
					                             Uniform f32* %108 = OpAccessChain %30 %105 
					                                      f32 %109 = OpLoad %108 
					                             Uniform f32* %110 = OpAccessChain %30 %105 
					                                      f32 %111 = OpLoad %110 
					                                    f32_3 %112 = OpCompositeConstruct %107 %109 %111 
					                                      f32 %113 = OpCompositeExtract %112 0 
					                                      f32 %114 = OpCompositeExtract %112 1 
					                                      f32 %115 = OpCompositeExtract %112 2 
					                                    f32_3 %116 = OpCompositeConstruct %113 %114 %115 
					                                    f32_3 %117 = OpFAdd %104 %116 
					                                                   OpStore %76 %117 
					                                    f32_4 %118 = OpLoad %9 
					                                    f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
					                                    f32_3 %120 = OpFNegate %119 
					                                    f32_3 %121 = OpLoad %76 
					                                    f32_3 %122 = OpFAdd %120 %121 
					                                                   OpStore %76 %122 
					                             Uniform f32* %124 = OpAccessChain %30 %123 
					                                      f32 %125 = OpLoad %124 
					                                    f32_3 %126 = OpCompositeConstruct %125 %125 %125 
					                                    f32_3 %127 = OpLoad %76 
					                                    f32_3 %128 = OpFMul %126 %127 
					                                    f32_4 %129 = OpLoad %9 
					                                    f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
					                                    f32_3 %131 = OpFAdd %128 %130 
					                                    f32_4 %132 = OpLoad %9 
					                                    f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
					                                                   OpStore %9 %133 
					                                                   OpBranch %74 
					                                           %74 = OpLabel 
					                                    f32_4 %136 = OpLoad %9 
					                                    f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
					                                    f32_4 %138 = OpLoad %9 
					                                    f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
					                                    f32_3 %140 = OpFMul %137 %139 
					                                    f32_4 %141 = OpLoad %135 
					                                    f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
					                                                   OpStore %135 %142 
					                             Private f32* %145 = OpAccessChain %9 %143 
					                                      f32 %146 = OpLoad %145 
					                              Output f32* %148 = OpAccessChain %135 %143 
					                                                   OpStore %148 %146 
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
						float _Blend;
						float _Intensity;
						float _Extra;
						float _Extra2;
						float _Extra3;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler3D _LutTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlatb1 = _Extra3<vs_TEXCOORD0.x;
					    u_xlat2 = u_xlat0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
					    u_xlat0.xyz = sqrt(u_xlat0.xyz);
					    if(u_xlatb1){
					        u_xlat1.xyz = u_xlat0.xyz + vec3(vec3(_Extra, _Extra, _Extra));
					        u_xlat10_1 = texture(_LutTex, u_xlat1.xyz);
					        u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Extra2, _Extra2, _Extra2));
					        u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					        u_xlat0.xyz = vec3(_Blend) * u_xlat1.xyz + u_xlat0.xyz;
					    //ENDIF
					    }
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat0.xyz;
					    SV_Target0.w = u_xlat0.w;
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