Shader "CameraFilterPack/BlurTiltShift_Hole" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Blurred (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Amount ("_Amount", Range(0, 20)) = 5
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 8336
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
					uniform 	vec4 _ScreenParams;
					uniform 	float _Amount;
					uniform 	float _Value1;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(_Value3, _Value4);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat3 = float(1.0) / (-_Value1);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    u_xlat3 = _Amount / _ScreenParams.x;
					    u_xlat0.y = u_xlat0.x * u_xlat3;
					    u_xlat0.x = 0.0;
					    u_xlat6.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
					; Bound: 154
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %143 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %15 0 Offset 15 
					                                                      OpMemberDecorate %15 1 Offset 15 
					                                                      OpMemberDecorate %15 2 Offset 15 
					                                                      OpMemberDecorate %15 3 Offset 15 
					                                                      OpMemberDecorate %15 4 Offset 15 
					                                                      OpMemberDecorate %15 5 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %110 DescriptorSet 110 
					                                                      OpDecorate %110 Binding 110 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %114 DescriptorSet 114 
					                                                      OpDecorate %114 Binding 114 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %143 Location 143 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeVector %6 4 
					                                              %15 = OpTypeStruct %14 %6 %6 %6 %6 %6 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32_4; f32; f32; f32; f32; f32;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 4 
					                                              %20 = OpTypePointer Uniform %6 
					                                          i32 %23 = OpConstant 5 
					                                              %31 = OpTypeInt 32 0 
					                                          u32 %32 = OpConstant 0 
					                                              %33 = OpTypePointer Private %6 
					                                          i32 %41 = OpConstant 3 
					                                 Private f32* %47 = OpVariable Private 
					                                          f32 %48 = OpConstant 3,674022E-40 
					                                          i32 %49 = OpConstant 2 
					                                          f32 %61 = OpConstant 3,674022E-40 
					                                          f32 %66 = OpConstant 3,674022E-40 
					                                          f32 %68 = OpConstant 3,674022E-40 
					                                          i32 %83 = OpConstant 1 
					                                          i32 %86 = OpConstant 0 
					                                          u32 %94 = OpConstant 1 
					                               Private f32_2* %97 = OpVariable Private 
					                                             %105 = OpTypeVector %6 3 
					                                             %106 = OpTypePointer Private %105 
					                              Private f32_3* %107 = OpVariable Private 
					                                             %108 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %109 = OpTypePointer UniformConstant %108 
					        UniformConstant read_only Texture2D* %110 = OpVariable UniformConstant 
					                                             %112 = OpTypeSampler 
					                                             %113 = OpTypePointer UniformConstant %112 
					                    UniformConstant sampler* %114 = OpVariable UniformConstant 
					                                             %116 = OpTypeSampledImage %108 
					                              Private f32_3* %121 = OpVariable Private 
					                              Private f32_3* %128 = OpVariable Private 
					                              Private f32_3* %135 = OpVariable Private 
					                                             %142 = OpTypePointer Output %14 
					                               Output f32_4* %143 = OpVariable Output 
					                                         f32 %145 = OpConstant 3,674022E-40 
					                                       f32_3 %146 = OpConstantComposite %145 %145 %145 
					                                         u32 %150 = OpConstant 3 
					                                             %151 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_2 %12 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %13 = OpFNegate %12 
					                                 Uniform f32* %21 = OpAccessChain %17 %19 
					                                          f32 %22 = OpLoad %21 
					                                 Uniform f32* %24 = OpAccessChain %17 %23 
					                                          f32 %25 = OpLoad %24 
					                                        f32_2 %26 = OpCompositeConstruct %22 %25 
					                                        f32_2 %27 = OpFAdd %13 %26 
					                                                      OpStore %9 %27 
					                                        f32_2 %28 = OpLoad %9 
					                                        f32_2 %29 = OpLoad %9 
					                                          f32 %30 = OpDot %28 %29 
					                                 Private f32* %34 = OpAccessChain %9 %32 
					                                                      OpStore %34 %30 
					                                 Private f32* %35 = OpAccessChain %9 %32 
					                                          f32 %36 = OpLoad %35 
					                                          f32 %37 = OpExtInst %1 31 %36 
					                                 Private f32* %38 = OpAccessChain %9 %32 
					                                                      OpStore %38 %37 
					                                 Private f32* %39 = OpAccessChain %9 %32 
					                                          f32 %40 = OpLoad %39 
					                                 Uniform f32* %42 = OpAccessChain %17 %41 
					                                          f32 %43 = OpLoad %42 
					                                          f32 %44 = OpFNegate %43 
					                                          f32 %45 = OpFAdd %40 %44 
					                                 Private f32* %46 = OpAccessChain %9 %32 
					                                                      OpStore %46 %45 
					                                 Uniform f32* %50 = OpAccessChain %17 %49 
					                                          f32 %51 = OpLoad %50 
					                                          f32 %52 = OpFNegate %51 
					                                          f32 %53 = OpFDiv %48 %52 
					                                                      OpStore %47 %53 
					                                          f32 %54 = OpLoad %47 
					                                 Private f32* %55 = OpAccessChain %9 %32 
					                                          f32 %56 = OpLoad %55 
					                                          f32 %57 = OpFMul %54 %56 
					                                 Private f32* %58 = OpAccessChain %9 %32 
					                                                      OpStore %58 %57 
					                                 Private f32* %59 = OpAccessChain %9 %32 
					                                          f32 %60 = OpLoad %59 
					                                          f32 %62 = OpExtInst %1 43 %60 %61 %48 
					                                 Private f32* %63 = OpAccessChain %9 %32 
					                                                      OpStore %63 %62 
					                                 Private f32* %64 = OpAccessChain %9 %32 
					                                          f32 %65 = OpLoad %64 
					                                          f32 %67 = OpFMul %65 %66 
					                                          f32 %69 = OpFAdd %67 %68 
					                                                      OpStore %47 %69 
					                                 Private f32* %70 = OpAccessChain %9 %32 
					                                          f32 %71 = OpLoad %70 
					                                 Private f32* %72 = OpAccessChain %9 %32 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpFMul %71 %73 
					                                 Private f32* %75 = OpAccessChain %9 %32 
					                                                      OpStore %75 %74 
					                                          f32 %76 = OpLoad %47 
					                                          f32 %77 = OpFNegate %76 
					                                 Private f32* %78 = OpAccessChain %9 %32 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFMul %77 %79 
					                                          f32 %81 = OpFAdd %80 %48 
					                                 Private f32* %82 = OpAccessChain %9 %32 
					                                                      OpStore %82 %81 
					                                 Uniform f32* %84 = OpAccessChain %17 %83 
					                                          f32 %85 = OpLoad %84 
					                                 Uniform f32* %87 = OpAccessChain %17 %86 %32 
					                                          f32 %88 = OpLoad %87 
					                                          f32 %89 = OpFDiv %85 %88 
					                                                      OpStore %47 %89 
					                                 Private f32* %90 = OpAccessChain %9 %32 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %92 = OpLoad %47 
					                                          f32 %93 = OpFMul %91 %92 
					                                 Private f32* %95 = OpAccessChain %9 %94 
					                                                      OpStore %95 %93 
					                                 Private f32* %96 = OpAccessChain %9 %32 
					                                                      OpStore %96 %61 
					                                        f32_2 %98 = OpLoad %9 
					                                        f32_2 %99 = OpFNegate %98 
					                                       f32_2 %100 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %101 = OpFAdd %99 %100 
					                                                      OpStore %97 %101 
					                                       f32_2 %102 = OpLoad %9 
					                                       f32_2 %103 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %104 = OpFAdd %102 %103 
					                                                      OpStore %9 %104 
					                         read_only Texture2D %111 = OpLoad %110 
					                                     sampler %115 = OpLoad %114 
					                  read_only Texture2DSampled %117 = OpSampledImage %111 %115 
					                                       f32_2 %118 = OpLoad %9 
					                                       f32_4 %119 = OpImageSampleImplicitLod %117 %118 
					                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
					                                                      OpStore %107 %120 
					                         read_only Texture2D %122 = OpLoad %110 
					                                     sampler %123 = OpLoad %114 
					                  read_only Texture2DSampled %124 = OpSampledImage %122 %123 
					                                       f32_2 %125 = OpLoad %97 
					                                       f32_4 %126 = OpImageSampleImplicitLod %124 %125 
					                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
					                                                      OpStore %121 %127 
					                         read_only Texture2D %129 = OpLoad %110 
					                                     sampler %130 = OpLoad %114 
					                  read_only Texture2DSampled %131 = OpSampledImage %129 %130 
					                                       f32_2 %132 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %133 = OpImageSampleImplicitLod %131 %132 
					                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
					                                                      OpStore %128 %134 
					                                       f32_3 %136 = OpLoad %121 
					                                       f32_3 %137 = OpLoad %128 
					                                       f32_3 %138 = OpFAdd %136 %137 
					                                                      OpStore %135 %138 
					                                       f32_3 %139 = OpLoad %107 
					                                       f32_3 %140 = OpLoad %135 
					                                       f32_3 %141 = OpFAdd %139 %140 
					                                                      OpStore %135 %141 
					                                       f32_3 %144 = OpLoad %135 
					                                       f32_3 %147 = OpFMul %144 %146 
					                                       f32_4 %148 = OpLoad %143 
					                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
					                                                      OpStore %143 %149 
					                                 Output f32* %152 = OpAccessChain %143 %150 
					                                                      OpStore %152 %48 
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
						float _Amount;
						float _Value1;
						float _Value2;
						float _Value3;
						float _Value4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(_Value3, _Value4);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat3 = float(1.0) / (-_Value1);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    u_xlat3 = _Amount / _ScreenParams.x;
					    u_xlat0.y = u_xlat0.x * u_xlat3;
					    u_xlat0.x = 0.0;
					    u_xlat6.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 130240
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
					uniform 	float _Value1;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec3 u_xlat16_3;
					void main()
					{
					    u_xlat0.x = (-vs_TEXCOORD0.x) + _Value3;
					    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value4;
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat3 = float(1.0) / (-_Value1);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_2 = texture(_MainTex2, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat10_2.xyz;
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
					; Bound: 133
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %120 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 11 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpMemberDecorate %18 2 Offset 18 
					                                              OpMemberDecorate %18 3 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpDecorate %90 RelaxedPrecision 
					                                              OpDecorate %93 RelaxedPrecision 
					                                              OpDecorate %93 DescriptorSet 93 
					                                              OpDecorate %93 Binding 93 
					                                              OpDecorate %94 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %97 DescriptorSet 97 
					                                              OpDecorate %97 Binding 97 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %106 DescriptorSet 106 
					                                              OpDecorate %106 Binding 106 
					                                              OpDecorate %107 RelaxedPrecision 
					                                              OpDecorate %108 RelaxedPrecision 
					                                              OpDecorate %108 DescriptorSet 108 
					                                              OpDecorate %108 Binding 108 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 RelaxedPrecision 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %117 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %120 Location 120 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %125 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %12 = OpTypeInt 32 0 
					                                  u32 %13 = OpConstant 0 
					                                      %14 = OpTypePointer Input %6 
					                                      %18 = OpTypeStruct %6 %6 %6 %6 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32; f32; f32; f32;}* %20 = OpVariable Uniform 
					                                      %21 = OpTypeInt 32 1 
					                                  i32 %22 = OpConstant 2 
					                                      %23 = OpTypePointer Uniform %6 
					                                      %27 = OpTypePointer Private %6 
					                                  u32 %29 = OpConstant 1 
					                                  i32 %33 = OpConstant 3 
					                                  i32 %48 = OpConstant 1 
					                         Private f32* %54 = OpVariable Private 
					                                  f32 %55 = OpConstant 3,674022E-40 
					                                  i32 %56 = OpConstant 0 
					                                  f32 %68 = OpConstant 3,674022E-40 
					                                  f32 %73 = OpConstant 3,674022E-40 
					                                  f32 %75 = OpConstant 3,674022E-40 
					                                      %88 = OpTypeVector %6 3 
					                                      %89 = OpTypePointer Private %88 
					                       Private f32_3* %90 = OpVariable Private 
					                                      %91 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %92 = OpTypePointer UniformConstant %91 
					 UniformConstant read_only Texture2D* %93 = OpVariable UniformConstant 
					                                      %95 = OpTypeSampler 
					                                      %96 = OpTypePointer UniformConstant %95 
					             UniformConstant sampler* %97 = OpVariable UniformConstant 
					                                      %99 = OpTypeSampledImage %91 
					                                     %102 = OpTypeVector %6 4 
					                      Private f32_3* %105 = OpVariable Private 
					UniformConstant read_only Texture2D* %106 = OpVariable UniformConstant 
					            UniformConstant sampler* %108 = OpVariable UniformConstant 
					                      Private f32_3* %114 = OpVariable Private 
					                                     %119 = OpTypePointer Output %102 
					                       Output f32_4* %120 = OpVariable Output 
					                                 u32 %129 = OpConstant 3 
					                                     %130 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                           Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
					                                  f32 %16 = OpLoad %15 
					                                  f32 %17 = OpFNegate %16 
					                         Uniform f32* %24 = OpAccessChain %20 %22 
					                                  f32 %25 = OpLoad %24 
					                                  f32 %26 = OpFAdd %17 %25 
					                         Private f32* %28 = OpAccessChain %9 %13 
					                                              OpStore %28 %26 
					                           Input f32* %30 = OpAccessChain vs_TEXCOORD0 %29 
					                                  f32 %31 = OpLoad %30 
					                                  f32 %32 = OpFNegate %31 
					                         Uniform f32* %34 = OpAccessChain %20 %33 
					                                  f32 %35 = OpLoad %34 
					                                  f32 %36 = OpFAdd %32 %35 
					                         Private f32* %37 = OpAccessChain %9 %29 
					                                              OpStore %37 %36 
					                                f32_2 %38 = OpLoad %9 
					                                f32_2 %39 = OpLoad %9 
					                                  f32 %40 = OpDot %38 %39 
					                         Private f32* %41 = OpAccessChain %9 %13 
					                                              OpStore %41 %40 
					                         Private f32* %42 = OpAccessChain %9 %13 
					                                  f32 %43 = OpLoad %42 
					                                  f32 %44 = OpExtInst %1 31 %43 
					                         Private f32* %45 = OpAccessChain %9 %13 
					                                              OpStore %45 %44 
					                         Private f32* %46 = OpAccessChain %9 %13 
					                                  f32 %47 = OpLoad %46 
					                         Uniform f32* %49 = OpAccessChain %20 %48 
					                                  f32 %50 = OpLoad %49 
					                                  f32 %51 = OpFNegate %50 
					                                  f32 %52 = OpFAdd %47 %51 
					                         Private f32* %53 = OpAccessChain %9 %13 
					                                              OpStore %53 %52 
					                         Uniform f32* %57 = OpAccessChain %20 %56 
					                                  f32 %58 = OpLoad %57 
					                                  f32 %59 = OpFNegate %58 
					                                  f32 %60 = OpFDiv %55 %59 
					                                              OpStore %54 %60 
					                                  f32 %61 = OpLoad %54 
					                         Private f32* %62 = OpAccessChain %9 %13 
					                                  f32 %63 = OpLoad %62 
					                                  f32 %64 = OpFMul %61 %63 
					                         Private f32* %65 = OpAccessChain %9 %13 
					                                              OpStore %65 %64 
					                         Private f32* %66 = OpAccessChain %9 %13 
					                                  f32 %67 = OpLoad %66 
					                                  f32 %69 = OpExtInst %1 43 %67 %68 %55 
					                         Private f32* %70 = OpAccessChain %9 %13 
					                                              OpStore %70 %69 
					                         Private f32* %71 = OpAccessChain %9 %13 
					                                  f32 %72 = OpLoad %71 
					                                  f32 %74 = OpFMul %72 %73 
					                                  f32 %76 = OpFAdd %74 %75 
					                                              OpStore %54 %76 
					                         Private f32* %77 = OpAccessChain %9 %13 
					                                  f32 %78 = OpLoad %77 
					                         Private f32* %79 = OpAccessChain %9 %13 
					                                  f32 %80 = OpLoad %79 
					                                  f32 %81 = OpFMul %78 %80 
					                         Private f32* %82 = OpAccessChain %9 %13 
					                                              OpStore %82 %81 
					                         Private f32* %83 = OpAccessChain %9 %13 
					                                  f32 %84 = OpLoad %83 
					                                  f32 %85 = OpLoad %54 
					                                  f32 %86 = OpFMul %84 %85 
					                         Private f32* %87 = OpAccessChain %9 %13 
					                                              OpStore %87 %86 
					                  read_only Texture2D %94 = OpLoad %93 
					                              sampler %98 = OpLoad %97 
					          read_only Texture2DSampled %100 = OpSampledImage %94 %98 
					                               f32_2 %101 = OpLoad vs_TEXCOORD0 
					                               f32_4 %103 = OpImageSampleImplicitLod %100 %101 
					                               f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
					                                              OpStore %90 %104 
					                 read_only Texture2D %107 = OpLoad %106 
					                             sampler %109 = OpLoad %108 
					          read_only Texture2DSampled %110 = OpSampledImage %107 %109 
					                               f32_2 %111 = OpLoad vs_TEXCOORD0 
					                               f32_4 %112 = OpImageSampleImplicitLod %110 %111 
					                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
					                                              OpStore %105 %113 
					                               f32_3 %115 = OpLoad %90 
					                               f32_3 %116 = OpLoad %105 
					                               f32_3 %117 = OpFNegate %116 
					                               f32_3 %118 = OpFAdd %115 %117 
					                                              OpStore %114 %118 
					                               f32_2 %121 = OpLoad %9 
					                               f32_3 %122 = OpVectorShuffle %121 %121 0 0 0 
					                               f32_3 %123 = OpLoad %114 
					                               f32_3 %124 = OpFMul %122 %123 
					                               f32_3 %125 = OpLoad %105 
					                               f32_3 %126 = OpFAdd %124 %125 
					                               f32_4 %127 = OpLoad %120 
					                               f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
					                                              OpStore %120 %128 
					                         Output f32* %131 = OpAccessChain %120 %129 
					                                              OpStore %131 %55 
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
						float _Value1;
						float _Value2;
						float _Value3;
						float _Value4;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec3 u_xlat16_3;
					void main()
					{
					    u_xlat0.x = (-vs_TEXCOORD0.x) + _Value3;
					    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value4;
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat3 = float(1.0) / (-_Value1);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat10_2 = texture(_MainTex2, vs_TEXCOORD0.xy);
					    u_xlat16_3.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat10_2.xyz;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 154247
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
					uniform 	vec4 _ScreenParams;
					uniform 	float _Amount;
					uniform 	float _Value1;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(_Value3, _Value4);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat3 = float(1.0) / (-_Value1);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    u_xlat3 = _Amount / _ScreenParams.y;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat0.y = 0.0;
					    u_xlat6.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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
					; Bound: 154
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %143 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %15 0 Offset 15 
					                                                      OpMemberDecorate %15 1 Offset 15 
					                                                      OpMemberDecorate %15 2 Offset 15 
					                                                      OpMemberDecorate %15 3 Offset 15 
					                                                      OpMemberDecorate %15 4 Offset 15 
					                                                      OpMemberDecorate %15 5 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %110 DescriptorSet 110 
					                                                      OpDecorate %110 Binding 110 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %114 RelaxedPrecision 
					                                                      OpDecorate %114 DescriptorSet 114 
					                                                      OpDecorate %114 Binding 114 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %128 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %141 RelaxedPrecision 
					                                                      OpDecorate %143 Location 143 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeVector %6 4 
					                                              %15 = OpTypeStruct %14 %6 %6 %6 %6 %6 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32_4; f32; f32; f32; f32; f32;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 4 
					                                              %20 = OpTypePointer Uniform %6 
					                                          i32 %23 = OpConstant 5 
					                                              %31 = OpTypeInt 32 0 
					                                          u32 %32 = OpConstant 0 
					                                              %33 = OpTypePointer Private %6 
					                                          i32 %41 = OpConstant 3 
					                                 Private f32* %47 = OpVariable Private 
					                                          f32 %48 = OpConstant 3,674022E-40 
					                                          i32 %49 = OpConstant 2 
					                                          f32 %61 = OpConstant 3,674022E-40 
					                                          f32 %66 = OpConstant 3,674022E-40 
					                                          f32 %68 = OpConstant 3,674022E-40 
					                                          i32 %83 = OpConstant 1 
					                                          i32 %86 = OpConstant 0 
					                                          u32 %87 = OpConstant 1 
					                               Private f32_2* %97 = OpVariable Private 
					                                             %105 = OpTypeVector %6 3 
					                                             %106 = OpTypePointer Private %105 
					                              Private f32_3* %107 = OpVariable Private 
					                                             %108 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %109 = OpTypePointer UniformConstant %108 
					        UniformConstant read_only Texture2D* %110 = OpVariable UniformConstant 
					                                             %112 = OpTypeSampler 
					                                             %113 = OpTypePointer UniformConstant %112 
					                    UniformConstant sampler* %114 = OpVariable UniformConstant 
					                                             %116 = OpTypeSampledImage %108 
					                              Private f32_3* %121 = OpVariable Private 
					                              Private f32_3* %128 = OpVariable Private 
					                              Private f32_3* %135 = OpVariable Private 
					                                             %142 = OpTypePointer Output %14 
					                               Output f32_4* %143 = OpVariable Output 
					                                         f32 %145 = OpConstant 3,674022E-40 
					                                       f32_3 %146 = OpConstantComposite %145 %145 %145 
					                                         u32 %150 = OpConstant 3 
					                                             %151 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_2 %12 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %13 = OpFNegate %12 
					                                 Uniform f32* %21 = OpAccessChain %17 %19 
					                                          f32 %22 = OpLoad %21 
					                                 Uniform f32* %24 = OpAccessChain %17 %23 
					                                          f32 %25 = OpLoad %24 
					                                        f32_2 %26 = OpCompositeConstruct %22 %25 
					                                        f32_2 %27 = OpFAdd %13 %26 
					                                                      OpStore %9 %27 
					                                        f32_2 %28 = OpLoad %9 
					                                        f32_2 %29 = OpLoad %9 
					                                          f32 %30 = OpDot %28 %29 
					                                 Private f32* %34 = OpAccessChain %9 %32 
					                                                      OpStore %34 %30 
					                                 Private f32* %35 = OpAccessChain %9 %32 
					                                          f32 %36 = OpLoad %35 
					                                          f32 %37 = OpExtInst %1 31 %36 
					                                 Private f32* %38 = OpAccessChain %9 %32 
					                                                      OpStore %38 %37 
					                                 Private f32* %39 = OpAccessChain %9 %32 
					                                          f32 %40 = OpLoad %39 
					                                 Uniform f32* %42 = OpAccessChain %17 %41 
					                                          f32 %43 = OpLoad %42 
					                                          f32 %44 = OpFNegate %43 
					                                          f32 %45 = OpFAdd %40 %44 
					                                 Private f32* %46 = OpAccessChain %9 %32 
					                                                      OpStore %46 %45 
					                                 Uniform f32* %50 = OpAccessChain %17 %49 
					                                          f32 %51 = OpLoad %50 
					                                          f32 %52 = OpFNegate %51 
					                                          f32 %53 = OpFDiv %48 %52 
					                                                      OpStore %47 %53 
					                                          f32 %54 = OpLoad %47 
					                                 Private f32* %55 = OpAccessChain %9 %32 
					                                          f32 %56 = OpLoad %55 
					                                          f32 %57 = OpFMul %54 %56 
					                                 Private f32* %58 = OpAccessChain %9 %32 
					                                                      OpStore %58 %57 
					                                 Private f32* %59 = OpAccessChain %9 %32 
					                                          f32 %60 = OpLoad %59 
					                                          f32 %62 = OpExtInst %1 43 %60 %61 %48 
					                                 Private f32* %63 = OpAccessChain %9 %32 
					                                                      OpStore %63 %62 
					                                 Private f32* %64 = OpAccessChain %9 %32 
					                                          f32 %65 = OpLoad %64 
					                                          f32 %67 = OpFMul %65 %66 
					                                          f32 %69 = OpFAdd %67 %68 
					                                                      OpStore %47 %69 
					                                 Private f32* %70 = OpAccessChain %9 %32 
					                                          f32 %71 = OpLoad %70 
					                                 Private f32* %72 = OpAccessChain %9 %32 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpFMul %71 %73 
					                                 Private f32* %75 = OpAccessChain %9 %32 
					                                                      OpStore %75 %74 
					                                          f32 %76 = OpLoad %47 
					                                          f32 %77 = OpFNegate %76 
					                                 Private f32* %78 = OpAccessChain %9 %32 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFMul %77 %79 
					                                          f32 %81 = OpFAdd %80 %48 
					                                 Private f32* %82 = OpAccessChain %9 %32 
					                                                      OpStore %82 %81 
					                                 Uniform f32* %84 = OpAccessChain %17 %83 
					                                          f32 %85 = OpLoad %84 
					                                 Uniform f32* %88 = OpAccessChain %17 %86 %87 
					                                          f32 %89 = OpLoad %88 
					                                          f32 %90 = OpFDiv %85 %89 
					                                                      OpStore %47 %90 
					                                 Private f32* %91 = OpAccessChain %9 %32 
					                                          f32 %92 = OpLoad %91 
					                                          f32 %93 = OpLoad %47 
					                                          f32 %94 = OpFMul %92 %93 
					                                 Private f32* %95 = OpAccessChain %9 %32 
					                                                      OpStore %95 %94 
					                                 Private f32* %96 = OpAccessChain %9 %87 
					                                                      OpStore %96 %61 
					                                        f32_2 %98 = OpLoad %9 
					                                        f32_2 %99 = OpFNegate %98 
					                                       f32_2 %100 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %101 = OpFAdd %99 %100 
					                                                      OpStore %97 %101 
					                                       f32_2 %102 = OpLoad %9 
					                                       f32_2 %103 = OpLoad vs_TEXCOORD0 
					                                       f32_2 %104 = OpFAdd %102 %103 
					                                                      OpStore %9 %104 
					                         read_only Texture2D %111 = OpLoad %110 
					                                     sampler %115 = OpLoad %114 
					                  read_only Texture2DSampled %117 = OpSampledImage %111 %115 
					                                       f32_2 %118 = OpLoad %9 
					                                       f32_4 %119 = OpImageSampleImplicitLod %117 %118 
					                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
					                                                      OpStore %107 %120 
					                         read_only Texture2D %122 = OpLoad %110 
					                                     sampler %123 = OpLoad %114 
					                  read_only Texture2DSampled %124 = OpSampledImage %122 %123 
					                                       f32_2 %125 = OpLoad %97 
					                                       f32_4 %126 = OpImageSampleImplicitLod %124 %125 
					                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
					                                                      OpStore %121 %127 
					                         read_only Texture2D %129 = OpLoad %110 
					                                     sampler %130 = OpLoad %114 
					                  read_only Texture2DSampled %131 = OpSampledImage %129 %130 
					                                       f32_2 %132 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %133 = OpImageSampleImplicitLod %131 %132 
					                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
					                                                      OpStore %128 %134 
					                                       f32_3 %136 = OpLoad %121 
					                                       f32_3 %137 = OpLoad %128 
					                                       f32_3 %138 = OpFAdd %136 %137 
					                                                      OpStore %135 %138 
					                                       f32_3 %139 = OpLoad %107 
					                                       f32_3 %140 = OpLoad %135 
					                                       f32_3 %141 = OpFAdd %139 %140 
					                                                      OpStore %135 %141 
					                                       f32_3 %144 = OpLoad %135 
					                                       f32_3 %147 = OpFMul %144 %146 
					                                       f32_4 %148 = OpLoad %143 
					                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
					                                                      OpStore %143 %149 
					                                 Output f32* %152 = OpAccessChain %143 %150 
					                                                      OpStore %152 %48 
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
						float _Amount;
						float _Value1;
						float _Value2;
						float _Value3;
						float _Value4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = (-vs_TEXCOORD0.xy) + vec2(_Value3, _Value4);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat3 = float(1.0) / (-_Value1);
					    u_xlat0.x = u_xlat3 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3) * u_xlat0.x + 1.0;
					    u_xlat3 = _Amount / _ScreenParams.y;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat0.y = 0.0;
					    u_xlat6.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_2.xyz;
					    u_xlat16_0.xyz = u_xlat10_1.xyz + u_xlat16_0.xyz;
					    SV_Target0.xyz = u_xlat16_0.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
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