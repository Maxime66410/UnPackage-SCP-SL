Shader "CameraFilterPack/AAA_Blood_Hit" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 40248
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[7];
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float _Value6;
					uniform 	float _Value7;
					uniform 	float _Value8;
					uniform 	float _Value9;
					uniform 	float _Value10;
					uniform 	float _Value11;
					uniform 	float _Value12;
					uniform 	float _Value13;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec2 u_xlat11;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 0.5) + vec2(0.0, 0.5);
					    u_xlat10_0 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = u_xlat1.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.5, 0.5, 0.0);
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.zw);
					    u_xlat15 = u_xlat10_3.x * _Value3;
					    u_xlat0.x = u_xlat10_0.x * _Value2 + u_xlat15;
					    u_xlat11.xy = u_xlat1.xy * vec2(0.5, 0.5);
					    u_xlat10_4 = texture(_MainTex2, u_xlat11.xy);
					    u_xlat0.x = u_xlat10_4.x * _Value4 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.x * _Value5 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_0.y * _Value6 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.y * _Value7 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_4.y * _Value8 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.y * _Value9 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_0.z * _Value10 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.z * _Value11 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_4.z * _Value12 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.z * _Value13 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.0625, 0.0625) + u_xlat1.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.yz = u_xlat10_1.yz;
					    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00390625, 0.00390625, 0.00390625) + u_xlat0.xyz;
					    SV_Target0.x = u_xlat10_1.x + u_xlat0.x;
					    SV_Target0.yz = u_xlat0.yz;
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
					; Bound: 262
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %246 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %25 DescriptorSet 25 
					                                                      OpDecorate %25 Binding 25 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %29 RelaxedPrecision 
					                                                      OpDecorate %29 DescriptorSet 29 
					                                                      OpDecorate %29 Binding 29 
					                                                      OpDecorate %30 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpMemberDecorate %41 0 Offset 41 
					                                                      OpMemberDecorate %41 1 Offset 41 
					                                                      OpMemberDecorate %41 2 Offset 41 
					                                                      OpMemberDecorate %41 3 Offset 41 
					                                                      OpMemberDecorate %41 4 Offset 41 
					                                                      OpMemberDecorate %41 5 Offset 41 
					                                                      OpMemberDecorate %41 6 Offset 41 
					                                                      OpMemberDecorate %41 7 Offset 41 
					                                                      OpMemberDecorate %41 8 Offset 41 
					                                                      OpMemberDecorate %41 9 Offset 41 
					                                                      OpMemberDecorate %41 10 Offset 41 
					                                                      OpMemberDecorate %41 11 Offset 41 
					                                                      OpMemberDecorate %41 12 Offset 41 
					                                                      OpMemberDecorate %41 13 RelaxedPrecision 
					                                                      OpMemberDecorate %41 13 Offset 41 
					                                                      OpDecorate %41 Block 
					                                                      OpDecorate %43 DescriptorSet 43 
					                                                      OpDecorate %43 Binding 43 
					                                                      OpDecorate %48 RelaxedPrecision 
					                                                      OpDecorate %49 RelaxedPrecision 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %53 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %65 RelaxedPrecision 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %71 RelaxedPrecision 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %73 RelaxedPrecision 
					                                                      OpDecorate %78 RelaxedPrecision 
					                                                      OpDecorate %84 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %102 RelaxedPrecision 
					                                                      OpDecorate %103 RelaxedPrecision 
					                                                      OpDecorate %104 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %161 RelaxedPrecision 
					                                                      OpDecorate %172 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %192 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %226 DescriptorSet 226 
					                                                      OpDecorate %226 Binding 226 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %228 DescriptorSet 228 
					                                                      OpDecorate %228 Binding 228 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %246 Location 246 
					                                                      OpDecorate %248 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          f32 %14 = OpConstant 3,674022E-40 
					                                        f32_2 %15 = OpConstantComposite %14 %14 
					                                          f32 %17 = OpConstant 3,674022E-40 
					                                        f32_2 %18 = OpConstantComposite %17 %14 
					                               Private f32_3* %22 = OpVariable Private 
					                                              %23 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %24 = OpTypePointer UniformConstant %23 
					         UniformConstant read_only Texture2D* %25 = OpVariable UniformConstant 
					                                              %27 = OpTypeSampler 
					                                              %28 = OpTypePointer UniformConstant %27 
					                     UniformConstant sampler* %29 = OpVariable UniformConstant 
					                                              %31 = OpTypeSampledImage %23 
					                                              %35 = OpTypeVector %6 4 
					                                              %38 = OpTypePointer Private %10 
					                               Private f32_2* %39 = OpVariable Private 
					                                              %41 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %35 
					                                              %42 = OpTypePointer Uniform %41 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %43 = OpVariable Uniform 
					                                              %44 = OpTypeInt 32 1 
					                                          i32 %45 = OpConstant 13 
					                                              %46 = OpTypePointer Uniform %35 
					                                              %55 = OpTypePointer Private %35 
					                               Private f32_4* %56 = OpVariable Private 
					                                        f32_4 %59 = OpConstantComposite %14 %14 %14 %14 
					                                        f32_4 %61 = OpConstantComposite %14 %14 %14 %17 
					                               Private f32_3* %63 = OpVariable Private 
					                               Private f32_3* %71 = OpVariable Private 
					                                              %79 = OpTypePointer Private %6 
					                                 Private f32* %80 = OpVariable Private 
					                                              %81 = OpTypeInt 32 0 
					                                          u32 %82 = OpConstant 0 
					                                          i32 %85 = OpConstant 2 
					                                              %86 = OpTypePointer Uniform %6 
					                                          i32 %92 = OpConstant 1 
					                               Private f32_2* %99 = OpVariable Private 
					                              Private f32_3* %102 = OpVariable Private 
					                                         i32 %111 = OpConstant 3 
					                                         i32 %121 = OpConstant 4 
					                                         u32 %129 = OpConstant 1 
					                                         i32 %132 = OpConstant 5 
					                                         i32 %142 = OpConstant 6 
					                                         i32 %152 = OpConstant 7 
					                                         i32 %162 = OpConstant 8 
					                                         u32 %170 = OpConstant 2 
					                                         i32 %173 = OpConstant 9 
					                                         i32 %183 = OpConstant 10 
					                                         i32 %193 = OpConstant 11 
					                                         i32 %203 = OpConstant 12 
					                                         i32 %213 = OpConstant 0 
					                                         f32 %220 = OpConstant 3,674022E-40 
					                                       f32_2 %221 = OpConstantComposite %220 %220 
					                              Private f32_3* %225 = OpVariable Private 
					        UniformConstant read_only Texture2D* %226 = OpVariable UniformConstant 
					                    UniformConstant sampler* %228 = OpVariable UniformConstant 
					                                         f32 %240 = OpConstant 3,674022E-40 
					                                       f32_3 %241 = OpConstantComposite %240 %240 %240 
					                                             %245 = OpTypePointer Output %35 
					                               Output f32_4* %246 = OpVariable Output 
					                                             %252 = OpTypePointer Output %6 
					                                         f32 %258 = OpConstant 3,674022E-40 
					                                         u32 %259 = OpConstant 3 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %16 = OpFMul %13 %15 
					                                        f32_2 %19 = OpFAdd %16 %18 
					                                        f32_3 %20 = OpLoad %9 
					                                        f32_3 %21 = OpVectorShuffle %20 %19 3 4 2 
					                                                      OpStore %9 %21 
					                          read_only Texture2D %26 = OpLoad %25 
					                                      sampler %30 = OpLoad %29 
					                   read_only Texture2DSampled %32 = OpSampledImage %26 %30 
					                                        f32_3 %33 = OpLoad %9 
					                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                        f32_4 %36 = OpImageSampleImplicitLod %32 %34 
					                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
					                                                      OpStore %22 %37 
					                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %47 = OpAccessChain %43 %45 
					                                        f32_4 %48 = OpLoad %47 
					                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                        f32_2 %50 = OpFMul %40 %49 
					                               Uniform f32_4* %51 = OpAccessChain %43 %45 
					                                        f32_4 %52 = OpLoad %51 
					                                        f32_2 %53 = OpVectorShuffle %52 %52 2 3 
					                                        f32_2 %54 = OpFAdd %50 %53 
					                                                      OpStore %39 %54 
					                                        f32_2 %57 = OpLoad %39 
					                                        f32_4 %58 = OpVectorShuffle %57 %57 0 1 0 1 
					                                        f32_4 %60 = OpFMul %58 %59 
					                                        f32_4 %62 = OpFAdd %60 %61 
					                                                      OpStore %56 %62 
					                          read_only Texture2D %64 = OpLoad %25 
					                                      sampler %65 = OpLoad %29 
					                   read_only Texture2DSampled %66 = OpSampledImage %64 %65 
					                                        f32_4 %67 = OpLoad %56 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                                        f32_4 %69 = OpImageSampleImplicitLod %66 %68 
					                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
					                                                      OpStore %63 %70 
					                          read_only Texture2D %72 = OpLoad %25 
					                                      sampler %73 = OpLoad %29 
					                   read_only Texture2DSampled %74 = OpSampledImage %72 %73 
					                                        f32_4 %75 = OpLoad %56 
					                                        f32_2 %76 = OpVectorShuffle %75 %75 2 3 
					                                        f32_4 %77 = OpImageSampleImplicitLod %74 %76 
					                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
					                                                      OpStore %71 %78 
					                                 Private f32* %83 = OpAccessChain %63 %82 
					                                          f32 %84 = OpLoad %83 
					                                 Uniform f32* %87 = OpAccessChain %43 %85 
					                                          f32 %88 = OpLoad %87 
					                                          f32 %89 = OpFMul %84 %88 
					                                                      OpStore %80 %89 
					                                 Private f32* %90 = OpAccessChain %22 %82 
					                                          f32 %91 = OpLoad %90 
					                                 Uniform f32* %93 = OpAccessChain %43 %92 
					                                          f32 %94 = OpLoad %93 
					                                          f32 %95 = OpFMul %91 %94 
					                                          f32 %96 = OpLoad %80 
					                                          f32 %97 = OpFAdd %95 %96 
					                                 Private f32* %98 = OpAccessChain %9 %82 
					                                                      OpStore %98 %97 
					                                       f32_2 %100 = OpLoad %39 
					                                       f32_2 %101 = OpFMul %100 %15 
					                                                      OpStore %99 %101 
					                         read_only Texture2D %103 = OpLoad %25 
					                                     sampler %104 = OpLoad %29 
					                  read_only Texture2DSampled %105 = OpSampledImage %103 %104 
					                                       f32_2 %106 = OpLoad %99 
					                                       f32_4 %107 = OpImageSampleImplicitLod %105 %106 
					                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
					                                                      OpStore %102 %108 
					                                Private f32* %109 = OpAccessChain %102 %82 
					                                         f32 %110 = OpLoad %109 
					                                Uniform f32* %112 = OpAccessChain %43 %111 
					                                         f32 %113 = OpLoad %112 
					                                         f32 %114 = OpFMul %110 %113 
					                                Private f32* %115 = OpAccessChain %9 %82 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFAdd %114 %116 
					                                Private f32* %118 = OpAccessChain %9 %82 
					                                                      OpStore %118 %117 
					                                Private f32* %119 = OpAccessChain %71 %82 
					                                         f32 %120 = OpLoad %119 
					                                Uniform f32* %122 = OpAccessChain %43 %121 
					                                         f32 %123 = OpLoad %122 
					                                         f32 %124 = OpFMul %120 %123 
					                                Private f32* %125 = OpAccessChain %9 %82 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpFAdd %124 %126 
					                                Private f32* %128 = OpAccessChain %9 %82 
					                                                      OpStore %128 %127 
					                                Private f32* %130 = OpAccessChain %22 %129 
					                                         f32 %131 = OpLoad %130 
					                                Uniform f32* %133 = OpAccessChain %43 %132 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpFMul %131 %134 
					                                Private f32* %136 = OpAccessChain %9 %82 
					                                         f32 %137 = OpLoad %136 
					                                         f32 %138 = OpFAdd %135 %137 
					                                Private f32* %139 = OpAccessChain %9 %82 
					                                                      OpStore %139 %138 
					                                Private f32* %140 = OpAccessChain %63 %129 
					                                         f32 %141 = OpLoad %140 
					                                Uniform f32* %143 = OpAccessChain %43 %142 
					                                         f32 %144 = OpLoad %143 
					                                         f32 %145 = OpFMul %141 %144 
					                                Private f32* %146 = OpAccessChain %9 %82 
					                                         f32 %147 = OpLoad %146 
					                                         f32 %148 = OpFAdd %145 %147 
					                                Private f32* %149 = OpAccessChain %9 %82 
					                                                      OpStore %149 %148 
					                                Private f32* %150 = OpAccessChain %102 %129 
					                                         f32 %151 = OpLoad %150 
					                                Uniform f32* %153 = OpAccessChain %43 %152 
					                                         f32 %154 = OpLoad %153 
					                                         f32 %155 = OpFMul %151 %154 
					                                Private f32* %156 = OpAccessChain %9 %82 
					                                         f32 %157 = OpLoad %156 
					                                         f32 %158 = OpFAdd %155 %157 
					                                Private f32* %159 = OpAccessChain %9 %82 
					                                                      OpStore %159 %158 
					                                Private f32* %160 = OpAccessChain %71 %129 
					                                         f32 %161 = OpLoad %160 
					                                Uniform f32* %163 = OpAccessChain %43 %162 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpFMul %161 %164 
					                                Private f32* %166 = OpAccessChain %9 %82 
					                                         f32 %167 = OpLoad %166 
					                                         f32 %168 = OpFAdd %165 %167 
					                                Private f32* %169 = OpAccessChain %9 %82 
					                                                      OpStore %169 %168 
					                                Private f32* %171 = OpAccessChain %22 %170 
					                                         f32 %172 = OpLoad %171 
					                                Uniform f32* %174 = OpAccessChain %43 %173 
					                                         f32 %175 = OpLoad %174 
					                                         f32 %176 = OpFMul %172 %175 
					                                Private f32* %177 = OpAccessChain %9 %82 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpFAdd %176 %178 
					                                Private f32* %180 = OpAccessChain %9 %82 
					                                                      OpStore %180 %179 
					                                Private f32* %181 = OpAccessChain %63 %170 
					                                         f32 %182 = OpLoad %181 
					                                Uniform f32* %184 = OpAccessChain %43 %183 
					                                         f32 %185 = OpLoad %184 
					                                         f32 %186 = OpFMul %182 %185 
					                                Private f32* %187 = OpAccessChain %9 %82 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpFAdd %186 %188 
					                                Private f32* %190 = OpAccessChain %9 %82 
					                                                      OpStore %190 %189 
					                                Private f32* %191 = OpAccessChain %102 %170 
					                                         f32 %192 = OpLoad %191 
					                                Uniform f32* %194 = OpAccessChain %43 %193 
					                                         f32 %195 = OpLoad %194 
					                                         f32 %196 = OpFMul %192 %195 
					                                Private f32* %197 = OpAccessChain %9 %82 
					                                         f32 %198 = OpLoad %197 
					                                         f32 %199 = OpFAdd %196 %198 
					                                Private f32* %200 = OpAccessChain %9 %82 
					                                                      OpStore %200 %199 
					                                Private f32* %201 = OpAccessChain %71 %170 
					                                         f32 %202 = OpLoad %201 
					                                Uniform f32* %204 = OpAccessChain %43 %203 
					                                         f32 %205 = OpLoad %204 
					                                         f32 %206 = OpFMul %202 %205 
					                                Private f32* %207 = OpAccessChain %9 %82 
					                                         f32 %208 = OpLoad %207 
					                                         f32 %209 = OpFAdd %206 %208 
					                                Private f32* %210 = OpAccessChain %9 %82 
					                                                      OpStore %210 %209 
					                                Private f32* %211 = OpAccessChain %9 %82 
					                                         f32 %212 = OpLoad %211 
					                                Uniform f32* %214 = OpAccessChain %43 %213 
					                                         f32 %215 = OpLoad %214 
					                                         f32 %216 = OpFMul %212 %215 
					                                Private f32* %217 = OpAccessChain %9 %82 
					                                                      OpStore %217 %216 
					                                       f32_3 %218 = OpLoad %9 
					                                       f32_2 %219 = OpVectorShuffle %218 %218 0 0 
					                                       f32_2 %222 = OpFMul %219 %221 
					                                       f32_2 %223 = OpLoad %39 
					                                       f32_2 %224 = OpFAdd %222 %223 
					                                                      OpStore %39 %224 
					                         read_only Texture2D %227 = OpLoad %226 
					                                     sampler %229 = OpLoad %228 
					                  read_only Texture2DSampled %230 = OpSampledImage %227 %229 
					                                       f32_2 %231 = OpLoad %39 
					                                       f32_4 %232 = OpImageSampleImplicitLod %230 %231 
					                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
					                                                      OpStore %225 %233 
					                                       f32_3 %234 = OpLoad %225 
					                                       f32_2 %235 = OpVectorShuffle %234 %234 1 2 
					                                       f32_3 %236 = OpLoad %9 
					                                       f32_3 %237 = OpVectorShuffle %236 %235 0 3 4 
					                                                      OpStore %9 %237 
					                                       f32_3 %238 = OpLoad %9 
					                                       f32_3 %239 = OpVectorShuffle %238 %238 0 0 0 
					                                       f32_3 %242 = OpFMul %239 %241 
					                                       f32_3 %243 = OpLoad %9 
					                                       f32_3 %244 = OpFAdd %242 %243 
					                                                      OpStore %9 %244 
					                                Private f32* %247 = OpAccessChain %225 %82 
					                                         f32 %248 = OpLoad %247 
					                                Private f32* %249 = OpAccessChain %9 %82 
					                                         f32 %250 = OpLoad %249 
					                                         f32 %251 = OpFAdd %248 %250 
					                                 Output f32* %253 = OpAccessChain %246 %82 
					                                                      OpStore %253 %251 
					                                       f32_3 %254 = OpLoad %9 
					                                       f32_2 %255 = OpVectorShuffle %254 %254 1 2 
					                                       f32_4 %256 = OpLoad %246 
					                                       f32_4 %257 = OpVectorShuffle %256 %255 0 4 5 3 
					                                                      OpStore %246 %257 
					                                 Output f32* %260 = OpAccessChain %246 %259 
					                                                      OpStore %260 %258 
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
						float _Value3;
						float _Value4;
						float _Value5;
						float _Value6;
						float _Value7;
						float _Value8;
						float _Value9;
						float _Value10;
						float _Value11;
						float _Value12;
						float _Value13;
						vec4 unused_0_14[2];
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec2 u_xlat11;
					float u_xlat15;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.5, 0.5) + vec2(0.0, 0.5);
					    u_xlat10_0 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat2 = u_xlat1.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.5, 0.5, 0.0);
					    u_xlat10_3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.zw);
					    u_xlat15 = u_xlat10_3.x * _Value3;
					    u_xlat0.x = u_xlat10_0.x * _Value2 + u_xlat15;
					    u_xlat11.xy = u_xlat1.xy * vec2(0.5, 0.5);
					    u_xlat10_4 = texture(_MainTex2, u_xlat11.xy);
					    u_xlat0.x = u_xlat10_4.x * _Value4 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.x * _Value5 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_0.y * _Value6 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.y * _Value7 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_4.y * _Value8 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.y * _Value9 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_0.z * _Value10 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_3.z * _Value11 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_4.z * _Value12 + u_xlat0.x;
					    u_xlat0.x = u_xlat10_2.z * _Value13 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.0625, 0.0625) + u_xlat1.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.yz = u_xlat10_1.yz;
					    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00390625, 0.00390625, 0.00390625) + u_xlat0.xyz;
					    SV_Target0.x = u_xlat10_1.x + u_xlat0.x;
					    SV_Target0.yz = u_xlat0.yz;
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