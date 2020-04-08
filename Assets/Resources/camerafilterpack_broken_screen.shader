Shader "CameraFilterPack/Broken_Screen" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 39186
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_0.xyz = in_TEXCOORD0.xyx;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD1 = phase0_Output0_0.zw;
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
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    phase0_Output0_0 = in_TEXCOORD0.xyxy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD1 = phase0_Output0_0.zw;
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
					uniform 	float _Shadow;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat4;
					vec2 u_xlat16_4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat16_4.xy = u_xlat10_1.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
					    u_xlat1 = u_xlat10_1.z * _Fade;
					    u_xlat4.xy = (-u_xlat0.xy) + u_xlat16_4.xy;
					    u_xlat0.xy = vec2(vec2(_Fade, _Fade)) * u_xlat4.xy + u_xlat0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = (-vec4(u_xlat1)) * vec4(vec4(_Shadow, _Shadow, _Shadow, _Shadow)) + u_xlat10_0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 135
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %30 %58 %109 %119 %120 %123 %126 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %13 ArrayStride 13 
					                                                     OpDecorate %14 ArrayStride 14 
					                                                     OpMemberDecorate %16 0 Offset 16 
					                                                     OpMemberDecorate %16 1 Offset 16 
					                                                     OpMemberDecorate %16 2 Offset 16 
					                                                     OpDecorate %16 Block 
					                                                     OpDecorate %18 DescriptorSet 18 
					                                                     OpDecorate %18 Binding 18 
					                                                     OpDecorate %30 Location 30 
					                                                     OpDecorate %58 Location 58 
					                                                     OpMemberDecorate %107 0 BuiltIn 107 
					                                                     OpMemberDecorate %107 1 BuiltIn 107 
					                                                     OpMemberDecorate %107 2 BuiltIn 107 
					                                                     OpDecorate %107 Block 
					                                                     OpDecorate %119 Location 119 
					                                                     OpDecorate %120 Location 120 
					                                                     OpDecorate vs_TEXCOORD0 Location 123 
					                                                     OpDecorate vs_TEXCOORD1 Location 126 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeBool 
					                                              %7 = OpTypePointer Private %6 
					                                Private bool* %8 = OpVariable Private 
					                                              %9 = OpTypeFloat 32 
					                                             %10 = OpTypeVector %9 4 
					                                             %11 = OpTypeInt 32 0 
					                                         u32 %12 = OpConstant 4 
					                                             %13 = OpTypeArray %10 %12 
					                                             %14 = OpTypeArray %10 %12 
					                                             %15 = OpTypeVector %9 2 
					                                             %16 = OpTypeStruct %13 %14 %15 
					                                             %17 = OpTypePointer Uniform %16 
					Uniform struct {f32_4[4]; f32_4[4]; f32_2;}* %18 = OpVariable Uniform 
					                                             %19 = OpTypeInt 32 1 
					                                         i32 %20 = OpConstant 2 
					                                         u32 %21 = OpConstant 1 
					                                             %22 = OpTypePointer Uniform %9 
					                                         f32 %25 = OpConstant 3,674022E-40 
					                                             %27 = OpTypePointer Private %9 
					                                Private f32* %28 = OpVariable Private 
					                                             %29 = OpTypePointer Input %15 
					                                Input f32_2* %30 = OpVariable Input 
					                                             %31 = OpTypePointer Input %9 
					                                         f32 %35 = OpConstant 3,674022E-40 
					                                             %37 = OpTypePointer Private %10 
					                              Private f32_4* %38 = OpVariable Private 
					                                             %40 = OpTypePointer Function %9 
					                                         u32 %49 = OpConstant 3 
					                                             %51 = OpTypeVector %9 3 
					                              Private f32_4* %56 = OpVariable Private 
					                                             %57 = OpTypePointer Input %10 
					                                Input f32_4* %58 = OpVariable Input 
					                                         i32 %61 = OpConstant 0 
					                                         i32 %62 = OpConstant 1 
					                                             %63 = OpTypePointer Uniform %10 
					                                         i32 %82 = OpConstant 3 
					                              Private f32_4* %86 = OpVariable Private 
					                                            %106 = OpTypeArray %9 %21 
					                                            %107 = OpTypeStruct %10 %9 %106 
					                                            %108 = OpTypePointer Output %107 
					       Output struct {f32_4; f32; f32[1];}* %109 = OpVariable Output 
					                                            %117 = OpTypePointer Output %10 
					                              Output f32_4* %119 = OpVariable Output 
					                               Input f32_4* %120 = OpVariable Input 
					                                            %122 = OpTypePointer Output %15 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %129 = OpTypePointer Output %9 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                               Function f32* %41 = OpVariable Function 
					                                Uniform f32* %23 = OpAccessChain %18 %20 %21 
					                                         f32 %24 = OpLoad %23 
					                                        bool %26 = OpFOrdLessThan %24 %25 
					                                                     OpStore %8 %26 
					                                  Input f32* %32 = OpAccessChain %30 %21 
					                                         f32 %33 = OpLoad %32 
					                                         f32 %34 = OpFNegate %33 
					                                         f32 %36 = OpFAdd %34 %35 
					                                                     OpStore %28 %36 
					                                        bool %39 = OpLoad %8 
					                                                     OpSelectionMerge %43 None 
					                                                     OpBranchConditional %39 %42 %45 
					                                             %42 = OpLabel 
					                                         f32 %44 = OpLoad %28 
					                                                     OpStore %41 %44 
					                                                     OpBranch %43 
					                                             %45 = OpLabel 
					                                  Input f32* %46 = OpAccessChain %30 %21 
					                                         f32 %47 = OpLoad %46 
					                                                     OpStore %41 %47 
					                                                     OpBranch %43 
					                                             %43 = OpLabel 
					                                         f32 %48 = OpLoad %41 
					                                Private f32* %50 = OpAccessChain %38 %49 
					                                                     OpStore %50 %48 
					                                       f32_2 %52 = OpLoad %30 
					                                       f32_3 %53 = OpVectorShuffle %52 %52 0 1 0 
					                                       f32_4 %54 = OpLoad %38 
					                                       f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
					                                                     OpStore %38 %55 
					                                       f32_4 %59 = OpLoad %58 
					                                       f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
					                              Uniform f32_4* %64 = OpAccessChain %18 %61 %62 
					                                       f32_4 %65 = OpLoad %64 
					                                       f32_4 %66 = OpFMul %60 %65 
					                                                     OpStore %56 %66 
					                              Uniform f32_4* %67 = OpAccessChain %18 %61 %61 
					                                       f32_4 %68 = OpLoad %67 
					                                       f32_4 %69 = OpLoad %58 
					                                       f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
					                                       f32_4 %71 = OpFMul %68 %70 
					                                       f32_4 %72 = OpLoad %56 
					                                       f32_4 %73 = OpFAdd %71 %72 
					                                                     OpStore %56 %73 
					                              Uniform f32_4* %74 = OpAccessChain %18 %61 %20 
					                                       f32_4 %75 = OpLoad %74 
					                                       f32_4 %76 = OpLoad %58 
					                                       f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
					                                       f32_4 %78 = OpFMul %75 %77 
					                                       f32_4 %79 = OpLoad %56 
					                                       f32_4 %80 = OpFAdd %78 %79 
					                                                     OpStore %56 %80 
					                                       f32_4 %81 = OpLoad %56 
					                              Uniform f32_4* %83 = OpAccessChain %18 %61 %82 
					                                       f32_4 %84 = OpLoad %83 
					                                       f32_4 %85 = OpFAdd %81 %84 
					                                                     OpStore %56 %85 
					                                       f32_4 %87 = OpLoad %56 
					                                       f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
					                              Uniform f32_4* %89 = OpAccessChain %18 %62 %62 
					                                       f32_4 %90 = OpLoad %89 
					                                       f32_4 %91 = OpFMul %88 %90 
					                                                     OpStore %86 %91 
					                              Uniform f32_4* %92 = OpAccessChain %18 %62 %61 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_4 %94 = OpLoad %56 
					                                       f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
					                                       f32_4 %96 = OpFMul %93 %95 
					                                       f32_4 %97 = OpLoad %86 
					                                       f32_4 %98 = OpFAdd %96 %97 
					                                                     OpStore %86 %98 
					                              Uniform f32_4* %99 = OpAccessChain %18 %62 %20 
					                                      f32_4 %100 = OpLoad %99 
					                                      f32_4 %101 = OpLoad %56 
					                                      f32_4 %102 = OpVectorShuffle %101 %101 2 2 2 2 
					                                      f32_4 %103 = OpFMul %100 %102 
					                                      f32_4 %104 = OpLoad %86 
					                                      f32_4 %105 = OpFAdd %103 %104 
					                                                     OpStore %86 %105 
					                             Uniform f32_4* %110 = OpAccessChain %18 %62 %82 
					                                      f32_4 %111 = OpLoad %110 
					                                      f32_4 %112 = OpLoad %56 
					                                      f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
					                                      f32_4 %114 = OpFMul %111 %113 
					                                      f32_4 %115 = OpLoad %86 
					                                      f32_4 %116 = OpFAdd %114 %115 
					                              Output f32_4* %118 = OpAccessChain %109 %61 
					                                                     OpStore %118 %116 
					                                      f32_4 %121 = OpLoad %120 
					                                                     OpStore %119 %121 
					                                      f32_4 %124 = OpLoad %38 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 0 1 
					                                                     OpStore vs_TEXCOORD0 %125 
					                                      f32_4 %127 = OpLoad %38 
					                                      f32_2 %128 = OpVectorShuffle %127 %127 2 3 
					                                                     OpStore vs_TEXCOORD1 %128 
					                                Output f32* %130 = OpAccessChain %109 %61 %21 
					                                        f32 %131 = OpLoad %130 
					                                        f32 %132 = OpFNegate %131 
					                                Output f32* %133 = OpAccessChain %109 %61 %21 
					                                                     OpStore %133 %132 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 115
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %92 
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
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %84 DescriptorSet 84 
					                                             OpDecorate %84 Binding 84 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %86 DescriptorSet 86 
					                                             OpDecorate %86 Binding 86 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %92 Location 92 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
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
					                      Private f32_2* %44 = OpVariable Private 
					                                 f32 %47 = OpConstant 3,674022E-40 
					                                 f32 %48 = OpConstant 3,674022E-40 
					                               f32_2 %49 = OpConstantComposite %47 %48 
					                                 f32 %51 = OpConstant 3,674022E-40 
					                               f32_2 %52 = OpConstantComposite %51 %47 
					                                     %54 = OpTypePointer Private %6 
					                        Private f32* %55 = OpVariable Private 
					                                     %56 = OpTypeInt 32 0 
					                                 u32 %57 = OpConstant 2 
					                                 i32 %60 = OpConstant 0 
					                                     %61 = OpTypePointer Uniform %6 
					                      Private f32_2* %65 = OpVariable Private 
					                                     %82 = OpTypePointer Private %13 
					                      Private f32_4* %83 = OpVariable Private 
					UniformConstant read_only Texture2D* %84 = OpVariable UniformConstant 
					            UniformConstant sampler* %86 = OpVariable UniformConstant 
					                                     %91 = OpTypePointer Output %13 
					                       Output f32_4* %92 = OpVariable Output 
					                                 i32 %96 = OpConstant 1 
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
					                               f32_3 %45 = OpLoad %30 
					                               f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                               f32_2 %50 = OpFMul %46 %49 
					                               f32_2 %53 = OpFAdd %50 %52 
					                                             OpStore %44 %53 
					                        Private f32* %58 = OpAccessChain %30 %57 
					                                 f32 %59 = OpLoad %58 
					                        Uniform f32* %62 = OpAccessChain %16 %60 
					                                 f32 %63 = OpLoad %62 
					                                 f32 %64 = OpFMul %59 %63 
					                                             OpStore %55 %64 
					                               f32_2 %66 = OpLoad %9 
					                               f32_2 %67 = OpFNegate %66 
					                               f32_2 %68 = OpLoad %44 
					                               f32_2 %69 = OpFAdd %67 %68 
					                                             OpStore %65 %69 
					                        Uniform f32* %70 = OpAccessChain %16 %60 
					                                 f32 %71 = OpLoad %70 
					                        Uniform f32* %72 = OpAccessChain %16 %60 
					                                 f32 %73 = OpLoad %72 
					                               f32_2 %74 = OpCompositeConstruct %71 %73 
					                                 f32 %75 = OpCompositeExtract %74 0 
					                                 f32 %76 = OpCompositeExtract %74 1 
					                               f32_2 %77 = OpCompositeConstruct %75 %76 
					                               f32_2 %78 = OpLoad %65 
					                               f32_2 %79 = OpFMul %77 %78 
					                               f32_2 %80 = OpLoad %9 
					                               f32_2 %81 = OpFAdd %79 %80 
					                                             OpStore %9 %81 
					                 read_only Texture2D %85 = OpLoad %84 
					                             sampler %87 = OpLoad %86 
					          read_only Texture2DSampled %88 = OpSampledImage %85 %87 
					                               f32_2 %89 = OpLoad %9 
					                               f32_4 %90 = OpImageSampleImplicitLod %88 %89 
					                                             OpStore %83 %90 
					                                 f32 %93 = OpLoad %55 
					                               f32_4 %94 = OpCompositeConstruct %93 %93 %93 %93 
					                               f32_4 %95 = OpFNegate %94 
					                        Uniform f32* %97 = OpAccessChain %16 %96 
					                                 f32 %98 = OpLoad %97 
					                        Uniform f32* %99 = OpAccessChain %16 %96 
					                                f32 %100 = OpLoad %99 
					                       Uniform f32* %101 = OpAccessChain %16 %96 
					                                f32 %102 = OpLoad %101 
					                       Uniform f32* %103 = OpAccessChain %16 %96 
					                                f32 %104 = OpLoad %103 
					                              f32_4 %105 = OpCompositeConstruct %98 %100 %102 %104 
					                                f32 %106 = OpCompositeExtract %105 0 
					                                f32 %107 = OpCompositeExtract %105 1 
					                                f32 %108 = OpCompositeExtract %105 2 
					                                f32 %109 = OpCompositeExtract %105 3 
					                              f32_4 %110 = OpCompositeConstruct %106 %107 %108 %109 
					                              f32_4 %111 = OpFMul %95 %110 
					                              f32_4 %112 = OpLoad %83 
					                              f32_4 %113 = OpFAdd %111 %112 
					                                             OpStore %92 %113 
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
						float _Shadow;
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					float u_xlat1;
					vec4 u_xlat10_1;
					vec2 u_xlat4;
					vec2 u_xlat16_4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat16_4.xy = u_xlat10_1.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
					    u_xlat1 = u_xlat10_1.z * _Fade;
					    u_xlat4.xy = (-u_xlat0.xy) + u_xlat16_4.xy;
					    u_xlat0.xy = vec2(vec2(_Fade, _Fade)) * u_xlat4.xy + u_xlat0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0 = (-vec4(u_xlat1)) * vec4(vec4(_Shadow, _Shadow, _Shadow, _Shadow)) + u_xlat10_0;
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