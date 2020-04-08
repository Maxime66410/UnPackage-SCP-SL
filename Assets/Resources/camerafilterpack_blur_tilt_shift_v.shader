Shader "CameraFilterPack/BlurTiltShift_V" {
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
			GpuProgramID 32028
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
					    u_xlat0.x = (-vs_TEXCOORD0.y) + 0.5;
					    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value3;
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
					; Bound: 159
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %11 %148 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate vs_TEXCOORD0 Location 11 
					                                                     OpMemberDecorate %27 0 Offset 27 
					                                                     OpMemberDecorate %27 1 Offset 27 
					                                                     OpMemberDecorate %27 2 Offset 27 
					                                                     OpMemberDecorate %27 3 Offset 27 
					                                                     OpMemberDecorate %27 4 Offset 27 
					                                                     OpDecorate %27 Block 
					                                                     OpDecorate %29 DescriptorSet 29 
					                                                     OpDecorate %29 Binding 29 
					                                                     OpDecorate %112 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %115 DescriptorSet 115 
					                                                     OpDecorate %115 Binding 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                                     OpDecorate %119 DescriptorSet 119 
					                                                     OpDecorate %119 Binding 119 
					                                                     OpDecorate %120 RelaxedPrecision 
					                                                     OpDecorate %125 RelaxedPrecision 
					                                                     OpDecorate %126 RelaxedPrecision 
					                                                     OpDecorate %127 RelaxedPrecision 
					                                                     OpDecorate %128 RelaxedPrecision 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                                     OpDecorate %134 RelaxedPrecision 
					                                                     OpDecorate %135 RelaxedPrecision 
					                                                     OpDecorate %139 RelaxedPrecision 
					                                                     OpDecorate %140 RelaxedPrecision 
					                                                     OpDecorate %141 RelaxedPrecision 
					                                                     OpDecorate %142 RelaxedPrecision 
					                                                     OpDecorate %143 RelaxedPrecision 
					                                                     OpDecorate %144 RelaxedPrecision 
					                                                     OpDecorate %145 RelaxedPrecision 
					                                                     OpDecorate %146 RelaxedPrecision 
					                                                     OpDecorate %148 Location 148 
					                                                     OpDecorate %149 RelaxedPrecision 
					                                                     OpDecorate %152 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 2 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_2* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                             %12 = OpTypeInt 32 0 
					                                         u32 %13 = OpConstant 1 
					                                             %14 = OpTypePointer Input %6 
					                                         f32 %18 = OpConstant 3,674022E-40 
					                                         u32 %20 = OpConstant 0 
					                                             %21 = OpTypePointer Private %6 
					                                             %26 = OpTypeVector %6 4 
					                                             %27 = OpTypeStruct %26 %6 %6 %6 %6 
					                                             %28 = OpTypePointer Uniform %27 
					Uniform struct {f32_4; f32; f32; f32; f32;}* %29 = OpVariable Uniform 
					                                             %30 = OpTypeInt 32 1 
					                                         i32 %31 = OpConstant 4 
					                                             %32 = OpTypePointer Uniform %6 
					                                         i32 %47 = OpConstant 3 
					                                Private f32* %53 = OpVariable Private 
					                                         f32 %54 = OpConstant 3,674022E-40 
					                                         i32 %55 = OpConstant 2 
					                                         f32 %67 = OpConstant 3,674022E-40 
					                                         f32 %72 = OpConstant 3,674022E-40 
					                                         f32 %74 = OpConstant 3,674022E-40 
					                                         i32 %89 = OpConstant 1 
					                                         i32 %92 = OpConstant 0 
					                             Private f32_2* %102 = OpVariable Private 
					                                            %110 = OpTypeVector %6 3 
					                                            %111 = OpTypePointer Private %110 
					                             Private f32_3* %112 = OpVariable Private 
					                                            %113 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %114 = OpTypePointer UniformConstant %113 
					       UniformConstant read_only Texture2D* %115 = OpVariable UniformConstant 
					                                            %117 = OpTypeSampler 
					                                            %118 = OpTypePointer UniformConstant %117 
					                   UniformConstant sampler* %119 = OpVariable UniformConstant 
					                                            %121 = OpTypeSampledImage %113 
					                             Private f32_3* %126 = OpVariable Private 
					                             Private f32_3* %133 = OpVariable Private 
					                             Private f32_3* %140 = OpVariable Private 
					                                            %147 = OpTypePointer Output %26 
					                              Output f32_4* %148 = OpVariable Output 
					                                        f32 %150 = OpConstant 3,674022E-40 
					                                      f32_3 %151 = OpConstantComposite %150 %150 %150 
					                                        u32 %155 = OpConstant 3 
					                                            %156 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                  Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
					                                         f32 %16 = OpLoad %15 
					                                         f32 %17 = OpFNegate %16 
					                                         f32 %19 = OpFAdd %17 %18 
					                                Private f32* %22 = OpAccessChain %9 %20 
					                                                     OpStore %22 %19 
					                                  Input f32* %23 = OpAccessChain vs_TEXCOORD0 %13 
					                                         f32 %24 = OpLoad %23 
					                                         f32 %25 = OpFNegate %24 
					                                Uniform f32* %33 = OpAccessChain %29 %31 
					                                         f32 %34 = OpLoad %33 
					                                         f32 %35 = OpFAdd %25 %34 
					                                Private f32* %36 = OpAccessChain %9 %13 
					                                                     OpStore %36 %35 
					                                       f32_2 %37 = OpLoad %9 
					                                       f32_2 %38 = OpLoad %9 
					                                         f32 %39 = OpDot %37 %38 
					                                Private f32* %40 = OpAccessChain %9 %20 
					                                                     OpStore %40 %39 
					                                Private f32* %41 = OpAccessChain %9 %20 
					                                         f32 %42 = OpLoad %41 
					                                         f32 %43 = OpExtInst %1 31 %42 
					                                Private f32* %44 = OpAccessChain %9 %20 
					                                                     OpStore %44 %43 
					                                Private f32* %45 = OpAccessChain %9 %20 
					                                         f32 %46 = OpLoad %45 
					                                Uniform f32* %48 = OpAccessChain %29 %47 
					                                         f32 %49 = OpLoad %48 
					                                         f32 %50 = OpFNegate %49 
					                                         f32 %51 = OpFAdd %46 %50 
					                                Private f32* %52 = OpAccessChain %9 %20 
					                                                     OpStore %52 %51 
					                                Uniform f32* %56 = OpAccessChain %29 %55 
					                                         f32 %57 = OpLoad %56 
					                                         f32 %58 = OpFNegate %57 
					                                         f32 %59 = OpFDiv %54 %58 
					                                                     OpStore %53 %59 
					                                         f32 %60 = OpLoad %53 
					                                Private f32* %61 = OpAccessChain %9 %20 
					                                         f32 %62 = OpLoad %61 
					                                         f32 %63 = OpFMul %60 %62 
					                                Private f32* %64 = OpAccessChain %9 %20 
					                                                     OpStore %64 %63 
					                                Private f32* %65 = OpAccessChain %9 %20 
					                                         f32 %66 = OpLoad %65 
					                                         f32 %68 = OpExtInst %1 43 %66 %67 %54 
					                                Private f32* %69 = OpAccessChain %9 %20 
					                                                     OpStore %69 %68 
					                                Private f32* %70 = OpAccessChain %9 %20 
					                                         f32 %71 = OpLoad %70 
					                                         f32 %73 = OpFMul %71 %72 
					                                         f32 %75 = OpFAdd %73 %74 
					                                                     OpStore %53 %75 
					                                Private f32* %76 = OpAccessChain %9 %20 
					                                         f32 %77 = OpLoad %76 
					                                Private f32* %78 = OpAccessChain %9 %20 
					                                         f32 %79 = OpLoad %78 
					                                         f32 %80 = OpFMul %77 %79 
					                                Private f32* %81 = OpAccessChain %9 %20 
					                                                     OpStore %81 %80 
					                                         f32 %82 = OpLoad %53 
					                                         f32 %83 = OpFNegate %82 
					                                Private f32* %84 = OpAccessChain %9 %20 
					                                         f32 %85 = OpLoad %84 
					                                         f32 %86 = OpFMul %83 %85 
					                                         f32 %87 = OpFAdd %86 %54 
					                                Private f32* %88 = OpAccessChain %9 %20 
					                                                     OpStore %88 %87 
					                                Uniform f32* %90 = OpAccessChain %29 %89 
					                                         f32 %91 = OpLoad %90 
					                                Uniform f32* %93 = OpAccessChain %29 %92 %20 
					                                         f32 %94 = OpLoad %93 
					                                         f32 %95 = OpFDiv %91 %94 
					                                                     OpStore %53 %95 
					                                Private f32* %96 = OpAccessChain %9 %20 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpLoad %53 
					                                         f32 %99 = OpFMul %97 %98 
					                               Private f32* %100 = OpAccessChain %9 %13 
					                                                     OpStore %100 %99 
					                               Private f32* %101 = OpAccessChain %9 %20 
					                                                     OpStore %101 %67 
					                                      f32_2 %103 = OpLoad %9 
					                                      f32_2 %104 = OpFNegate %103 
					                                      f32_2 %105 = OpLoad vs_TEXCOORD0 
					                                      f32_2 %106 = OpFAdd %104 %105 
					                                                     OpStore %102 %106 
					                                      f32_2 %107 = OpLoad %9 
					                                      f32_2 %108 = OpLoad vs_TEXCOORD0 
					                                      f32_2 %109 = OpFAdd %107 %108 
					                                                     OpStore %9 %109 
					                        read_only Texture2D %116 = OpLoad %115 
					                                    sampler %120 = OpLoad %119 
					                 read_only Texture2DSampled %122 = OpSampledImage %116 %120 
					                                      f32_2 %123 = OpLoad %9 
					                                      f32_4 %124 = OpImageSampleImplicitLod %122 %123 
					                                      f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
					                                                     OpStore %112 %125 
					                        read_only Texture2D %127 = OpLoad %115 
					                                    sampler %128 = OpLoad %119 
					                 read_only Texture2DSampled %129 = OpSampledImage %127 %128 
					                                      f32_2 %130 = OpLoad %102 
					                                      f32_4 %131 = OpImageSampleImplicitLod %129 %130 
					                                      f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                                     OpStore %126 %132 
					                        read_only Texture2D %134 = OpLoad %115 
					                                    sampler %135 = OpLoad %119 
					                 read_only Texture2DSampled %136 = OpSampledImage %134 %135 
					                                      f32_2 %137 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %138 = OpImageSampleImplicitLod %136 %137 
					                                      f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
					                                                     OpStore %133 %139 
					                                      f32_3 %141 = OpLoad %126 
					                                      f32_3 %142 = OpLoad %133 
					                                      f32_3 %143 = OpFAdd %141 %142 
					                                                     OpStore %140 %143 
					                                      f32_3 %144 = OpLoad %112 
					                                      f32_3 %145 = OpLoad %140 
					                                      f32_3 %146 = OpFAdd %144 %145 
					                                                     OpStore %140 %146 
					                                      f32_3 %149 = OpLoad %140 
					                                      f32_3 %152 = OpFMul %149 %151 
					                                      f32_4 %153 = OpLoad %148 
					                                      f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
					                                                     OpStore %148 %154 
					                                Output f32* %157 = OpAccessChain %148 %155 
					                                                     OpStore %157 %54 
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
					    u_xlat0.x = (-vs_TEXCOORD0.y) + 0.5;
					    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value3;
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
			GpuProgramID 82307
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
					    u_xlat0.x = (-vs_TEXCOORD0.y) + 0.5;
					    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value3;
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
					; Bound: 131
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %118 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 11 
					                                              OpMemberDecorate %26 0 Offset 26 
					                                              OpMemberDecorate %26 1 Offset 26 
					                                              OpMemberDecorate %26 2 Offset 26 
					                                              OpDecorate %26 Block 
					                                              OpDecorate %28 DescriptorSet 28 
					                                              OpDecorate %28 Binding 28 
					                                              OpDecorate %88 RelaxedPrecision 
					                                              OpDecorate %91 RelaxedPrecision 
					                                              OpDecorate %91 DescriptorSet 91 
					                                              OpDecorate %91 Binding 91 
					                                              OpDecorate %92 RelaxedPrecision 
					                                              OpDecorate %95 RelaxedPrecision 
					                                              OpDecorate %95 DescriptorSet 95 
					                                              OpDecorate %95 Binding 95 
					                                              OpDecorate %96 RelaxedPrecision 
					                                              OpDecorate %102 RelaxedPrecision 
					                                              OpDecorate %103 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %104 DescriptorSet 104 
					                                              OpDecorate %104 Binding 104 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %106 DescriptorSet 106 
					                                              OpDecorate %106 Binding 106 
					                                              OpDecorate %107 RelaxedPrecision 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 RelaxedPrecision 
					                                              OpDecorate %115 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %118 Location 118 
					                                              OpDecorate %121 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %12 = OpTypeInt 32 0 
					                                  u32 %13 = OpConstant 1 
					                                      %14 = OpTypePointer Input %6 
					                                  f32 %18 = OpConstant 3,674022E-40 
					                                  u32 %20 = OpConstant 0 
					                                      %21 = OpTypePointer Private %6 
					                                      %26 = OpTypeStruct %6 %6 %6 
					                                      %27 = OpTypePointer Uniform %26 
					     Uniform struct {f32; f32; f32;}* %28 = OpVariable Uniform 
					                                      %29 = OpTypeInt 32 1 
					                                  i32 %30 = OpConstant 2 
					                                      %31 = OpTypePointer Uniform %6 
					                                  i32 %46 = OpConstant 1 
					                         Private f32* %52 = OpVariable Private 
					                                  f32 %53 = OpConstant 3,674022E-40 
					                                  i32 %54 = OpConstant 0 
					                                  f32 %66 = OpConstant 3,674022E-40 
					                                  f32 %71 = OpConstant 3,674022E-40 
					                                  f32 %73 = OpConstant 3,674022E-40 
					                                      %86 = OpTypeVector %6 3 
					                                      %87 = OpTypePointer Private %86 
					                       Private f32_3* %88 = OpVariable Private 
					                                      %89 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %90 = OpTypePointer UniformConstant %89 
					 UniformConstant read_only Texture2D* %91 = OpVariable UniformConstant 
					                                      %93 = OpTypeSampler 
					                                      %94 = OpTypePointer UniformConstant %93 
					             UniformConstant sampler* %95 = OpVariable UniformConstant 
					                                      %97 = OpTypeSampledImage %89 
					                                     %100 = OpTypeVector %6 4 
					                      Private f32_3* %103 = OpVariable Private 
					UniformConstant read_only Texture2D* %104 = OpVariable UniformConstant 
					            UniformConstant sampler* %106 = OpVariable UniformConstant 
					                      Private f32_3* %112 = OpVariable Private 
					                                     %117 = OpTypePointer Output %100 
					                       Output f32_4* %118 = OpVariable Output 
					                                 u32 %127 = OpConstant 3 
					                                     %128 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                           Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
					                                  f32 %16 = OpLoad %15 
					                                  f32 %17 = OpFNegate %16 
					                                  f32 %19 = OpFAdd %17 %18 
					                         Private f32* %22 = OpAccessChain %9 %20 
					                                              OpStore %22 %19 
					                           Input f32* %23 = OpAccessChain vs_TEXCOORD0 %13 
					                                  f32 %24 = OpLoad %23 
					                                  f32 %25 = OpFNegate %24 
					                         Uniform f32* %32 = OpAccessChain %28 %30 
					                                  f32 %33 = OpLoad %32 
					                                  f32 %34 = OpFAdd %25 %33 
					                         Private f32* %35 = OpAccessChain %9 %13 
					                                              OpStore %35 %34 
					                                f32_2 %36 = OpLoad %9 
					                                f32_2 %37 = OpLoad %9 
					                                  f32 %38 = OpDot %36 %37 
					                         Private f32* %39 = OpAccessChain %9 %20 
					                                              OpStore %39 %38 
					                         Private f32* %40 = OpAccessChain %9 %20 
					                                  f32 %41 = OpLoad %40 
					                                  f32 %42 = OpExtInst %1 31 %41 
					                         Private f32* %43 = OpAccessChain %9 %20 
					                                              OpStore %43 %42 
					                         Private f32* %44 = OpAccessChain %9 %20 
					                                  f32 %45 = OpLoad %44 
					                         Uniform f32* %47 = OpAccessChain %28 %46 
					                                  f32 %48 = OpLoad %47 
					                                  f32 %49 = OpFNegate %48 
					                                  f32 %50 = OpFAdd %45 %49 
					                         Private f32* %51 = OpAccessChain %9 %20 
					                                              OpStore %51 %50 
					                         Uniform f32* %55 = OpAccessChain %28 %54 
					                                  f32 %56 = OpLoad %55 
					                                  f32 %57 = OpFNegate %56 
					                                  f32 %58 = OpFDiv %53 %57 
					                                              OpStore %52 %58 
					                                  f32 %59 = OpLoad %52 
					                         Private f32* %60 = OpAccessChain %9 %20 
					                                  f32 %61 = OpLoad %60 
					                                  f32 %62 = OpFMul %59 %61 
					                         Private f32* %63 = OpAccessChain %9 %20 
					                                              OpStore %63 %62 
					                         Private f32* %64 = OpAccessChain %9 %20 
					                                  f32 %65 = OpLoad %64 
					                                  f32 %67 = OpExtInst %1 43 %65 %66 %53 
					                         Private f32* %68 = OpAccessChain %9 %20 
					                                              OpStore %68 %67 
					                         Private f32* %69 = OpAccessChain %9 %20 
					                                  f32 %70 = OpLoad %69 
					                                  f32 %72 = OpFMul %70 %71 
					                                  f32 %74 = OpFAdd %72 %73 
					                                              OpStore %52 %74 
					                         Private f32* %75 = OpAccessChain %9 %20 
					                                  f32 %76 = OpLoad %75 
					                         Private f32* %77 = OpAccessChain %9 %20 
					                                  f32 %78 = OpLoad %77 
					                                  f32 %79 = OpFMul %76 %78 
					                         Private f32* %80 = OpAccessChain %9 %20 
					                                              OpStore %80 %79 
					                         Private f32* %81 = OpAccessChain %9 %20 
					                                  f32 %82 = OpLoad %81 
					                                  f32 %83 = OpLoad %52 
					                                  f32 %84 = OpFMul %82 %83 
					                         Private f32* %85 = OpAccessChain %9 %20 
					                                              OpStore %85 %84 
					                  read_only Texture2D %92 = OpLoad %91 
					                              sampler %96 = OpLoad %95 
					           read_only Texture2DSampled %98 = OpSampledImage %92 %96 
					                                f32_2 %99 = OpLoad vs_TEXCOORD0 
					                               f32_4 %101 = OpImageSampleImplicitLod %98 %99 
					                               f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
					                                              OpStore %88 %102 
					                 read_only Texture2D %105 = OpLoad %104 
					                             sampler %107 = OpLoad %106 
					          read_only Texture2DSampled %108 = OpSampledImage %105 %107 
					                               f32_2 %109 = OpLoad vs_TEXCOORD0 
					                               f32_4 %110 = OpImageSampleImplicitLod %108 %109 
					                               f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
					                                              OpStore %103 %111 
					                               f32_3 %113 = OpLoad %88 
					                               f32_3 %114 = OpLoad %103 
					                               f32_3 %115 = OpFNegate %114 
					                               f32_3 %116 = OpFAdd %113 %115 
					                                              OpStore %112 %116 
					                               f32_2 %119 = OpLoad %9 
					                               f32_3 %120 = OpVectorShuffle %119 %119 0 0 0 
					                               f32_3 %121 = OpLoad %112 
					                               f32_3 %122 = OpFMul %120 %121 
					                               f32_3 %123 = OpLoad %103 
					                               f32_3 %124 = OpFAdd %122 %123 
					                               f32_4 %125 = OpLoad %118 
					                               f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
					                                              OpStore %118 %126 
					                         Output f32* %129 = OpAccessChain %118 %127 
					                                              OpStore %129 %53 
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
						vec4 unused_0_4;
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
					    u_xlat0.x = (-vs_TEXCOORD0.y) + 0.5;
					    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value3;
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
			GpuProgramID 167317
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
					    u_xlat0.x = (-vs_TEXCOORD0.y) + 0.5;
					    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value3;
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
					; Bound: 159
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %11 %148 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate vs_TEXCOORD0 Location 11 
					                                                     OpMemberDecorate %27 0 Offset 27 
					                                                     OpMemberDecorate %27 1 Offset 27 
					                                                     OpMemberDecorate %27 2 Offset 27 
					                                                     OpMemberDecorate %27 3 Offset 27 
					                                                     OpMemberDecorate %27 4 Offset 27 
					                                                     OpDecorate %27 Block 
					                                                     OpDecorate %29 DescriptorSet 29 
					                                                     OpDecorate %29 Binding 29 
					                                                     OpDecorate %112 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %115 DescriptorSet 115 
					                                                     OpDecorate %115 Binding 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate %119 RelaxedPrecision 
					                                                     OpDecorate %119 DescriptorSet 119 
					                                                     OpDecorate %119 Binding 119 
					                                                     OpDecorate %120 RelaxedPrecision 
					                                                     OpDecorate %125 RelaxedPrecision 
					                                                     OpDecorate %126 RelaxedPrecision 
					                                                     OpDecorate %127 RelaxedPrecision 
					                                                     OpDecorate %128 RelaxedPrecision 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                                     OpDecorate %134 RelaxedPrecision 
					                                                     OpDecorate %135 RelaxedPrecision 
					                                                     OpDecorate %139 RelaxedPrecision 
					                                                     OpDecorate %140 RelaxedPrecision 
					                                                     OpDecorate %141 RelaxedPrecision 
					                                                     OpDecorate %142 RelaxedPrecision 
					                                                     OpDecorate %143 RelaxedPrecision 
					                                                     OpDecorate %144 RelaxedPrecision 
					                                                     OpDecorate %145 RelaxedPrecision 
					                                                     OpDecorate %146 RelaxedPrecision 
					                                                     OpDecorate %148 Location 148 
					                                                     OpDecorate %149 RelaxedPrecision 
					                                                     OpDecorate %152 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 2 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_2* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                             %12 = OpTypeInt 32 0 
					                                         u32 %13 = OpConstant 1 
					                                             %14 = OpTypePointer Input %6 
					                                         f32 %18 = OpConstant 3,674022E-40 
					                                         u32 %20 = OpConstant 0 
					                                             %21 = OpTypePointer Private %6 
					                                             %26 = OpTypeVector %6 4 
					                                             %27 = OpTypeStruct %26 %6 %6 %6 %6 
					                                             %28 = OpTypePointer Uniform %27 
					Uniform struct {f32_4; f32; f32; f32; f32;}* %29 = OpVariable Uniform 
					                                             %30 = OpTypeInt 32 1 
					                                         i32 %31 = OpConstant 4 
					                                             %32 = OpTypePointer Uniform %6 
					                                         i32 %47 = OpConstant 3 
					                                Private f32* %53 = OpVariable Private 
					                                         f32 %54 = OpConstant 3,674022E-40 
					                                         i32 %55 = OpConstant 2 
					                                         f32 %67 = OpConstant 3,674022E-40 
					                                         f32 %72 = OpConstant 3,674022E-40 
					                                         f32 %74 = OpConstant 3,674022E-40 
					                                         i32 %89 = OpConstant 1 
					                                         i32 %92 = OpConstant 0 
					                             Private f32_2* %102 = OpVariable Private 
					                                            %110 = OpTypeVector %6 3 
					                                            %111 = OpTypePointer Private %110 
					                             Private f32_3* %112 = OpVariable Private 
					                                            %113 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %114 = OpTypePointer UniformConstant %113 
					       UniformConstant read_only Texture2D* %115 = OpVariable UniformConstant 
					                                            %117 = OpTypeSampler 
					                                            %118 = OpTypePointer UniformConstant %117 
					                   UniformConstant sampler* %119 = OpVariable UniformConstant 
					                                            %121 = OpTypeSampledImage %113 
					                             Private f32_3* %126 = OpVariable Private 
					                             Private f32_3* %133 = OpVariable Private 
					                             Private f32_3* %140 = OpVariable Private 
					                                            %147 = OpTypePointer Output %26 
					                              Output f32_4* %148 = OpVariable Output 
					                                        f32 %150 = OpConstant 3,674022E-40 
					                                      f32_3 %151 = OpConstantComposite %150 %150 %150 
					                                        u32 %155 = OpConstant 3 
					                                            %156 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                  Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
					                                         f32 %16 = OpLoad %15 
					                                         f32 %17 = OpFNegate %16 
					                                         f32 %19 = OpFAdd %17 %18 
					                                Private f32* %22 = OpAccessChain %9 %20 
					                                                     OpStore %22 %19 
					                                  Input f32* %23 = OpAccessChain vs_TEXCOORD0 %13 
					                                         f32 %24 = OpLoad %23 
					                                         f32 %25 = OpFNegate %24 
					                                Uniform f32* %33 = OpAccessChain %29 %31 
					                                         f32 %34 = OpLoad %33 
					                                         f32 %35 = OpFAdd %25 %34 
					                                Private f32* %36 = OpAccessChain %9 %13 
					                                                     OpStore %36 %35 
					                                       f32_2 %37 = OpLoad %9 
					                                       f32_2 %38 = OpLoad %9 
					                                         f32 %39 = OpDot %37 %38 
					                                Private f32* %40 = OpAccessChain %9 %20 
					                                                     OpStore %40 %39 
					                                Private f32* %41 = OpAccessChain %9 %20 
					                                         f32 %42 = OpLoad %41 
					                                         f32 %43 = OpExtInst %1 31 %42 
					                                Private f32* %44 = OpAccessChain %9 %20 
					                                                     OpStore %44 %43 
					                                Private f32* %45 = OpAccessChain %9 %20 
					                                         f32 %46 = OpLoad %45 
					                                Uniform f32* %48 = OpAccessChain %29 %47 
					                                         f32 %49 = OpLoad %48 
					                                         f32 %50 = OpFNegate %49 
					                                         f32 %51 = OpFAdd %46 %50 
					                                Private f32* %52 = OpAccessChain %9 %20 
					                                                     OpStore %52 %51 
					                                Uniform f32* %56 = OpAccessChain %29 %55 
					                                         f32 %57 = OpLoad %56 
					                                         f32 %58 = OpFNegate %57 
					                                         f32 %59 = OpFDiv %54 %58 
					                                                     OpStore %53 %59 
					                                         f32 %60 = OpLoad %53 
					                                Private f32* %61 = OpAccessChain %9 %20 
					                                         f32 %62 = OpLoad %61 
					                                         f32 %63 = OpFMul %60 %62 
					                                Private f32* %64 = OpAccessChain %9 %20 
					                                                     OpStore %64 %63 
					                                Private f32* %65 = OpAccessChain %9 %20 
					                                         f32 %66 = OpLoad %65 
					                                         f32 %68 = OpExtInst %1 43 %66 %67 %54 
					                                Private f32* %69 = OpAccessChain %9 %20 
					                                                     OpStore %69 %68 
					                                Private f32* %70 = OpAccessChain %9 %20 
					                                         f32 %71 = OpLoad %70 
					                                         f32 %73 = OpFMul %71 %72 
					                                         f32 %75 = OpFAdd %73 %74 
					                                                     OpStore %53 %75 
					                                Private f32* %76 = OpAccessChain %9 %20 
					                                         f32 %77 = OpLoad %76 
					                                Private f32* %78 = OpAccessChain %9 %20 
					                                         f32 %79 = OpLoad %78 
					                                         f32 %80 = OpFMul %77 %79 
					                                Private f32* %81 = OpAccessChain %9 %20 
					                                                     OpStore %81 %80 
					                                         f32 %82 = OpLoad %53 
					                                         f32 %83 = OpFNegate %82 
					                                Private f32* %84 = OpAccessChain %9 %20 
					                                         f32 %85 = OpLoad %84 
					                                         f32 %86 = OpFMul %83 %85 
					                                         f32 %87 = OpFAdd %86 %54 
					                                Private f32* %88 = OpAccessChain %9 %20 
					                                                     OpStore %88 %87 
					                                Uniform f32* %90 = OpAccessChain %29 %89 
					                                         f32 %91 = OpLoad %90 
					                                Uniform f32* %93 = OpAccessChain %29 %92 %13 
					                                         f32 %94 = OpLoad %93 
					                                         f32 %95 = OpFDiv %91 %94 
					                                                     OpStore %53 %95 
					                                Private f32* %96 = OpAccessChain %9 %20 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpLoad %53 
					                                         f32 %99 = OpFMul %97 %98 
					                               Private f32* %100 = OpAccessChain %9 %20 
					                                                     OpStore %100 %99 
					                               Private f32* %101 = OpAccessChain %9 %13 
					                                                     OpStore %101 %67 
					                                      f32_2 %103 = OpLoad %9 
					                                      f32_2 %104 = OpFNegate %103 
					                                      f32_2 %105 = OpLoad vs_TEXCOORD0 
					                                      f32_2 %106 = OpFAdd %104 %105 
					                                                     OpStore %102 %106 
					                                      f32_2 %107 = OpLoad %9 
					                                      f32_2 %108 = OpLoad vs_TEXCOORD0 
					                                      f32_2 %109 = OpFAdd %107 %108 
					                                                     OpStore %9 %109 
					                        read_only Texture2D %116 = OpLoad %115 
					                                    sampler %120 = OpLoad %119 
					                 read_only Texture2DSampled %122 = OpSampledImage %116 %120 
					                                      f32_2 %123 = OpLoad %9 
					                                      f32_4 %124 = OpImageSampleImplicitLod %122 %123 
					                                      f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
					                                                     OpStore %112 %125 
					                        read_only Texture2D %127 = OpLoad %115 
					                                    sampler %128 = OpLoad %119 
					                 read_only Texture2DSampled %129 = OpSampledImage %127 %128 
					                                      f32_2 %130 = OpLoad %102 
					                                      f32_4 %131 = OpImageSampleImplicitLod %129 %130 
					                                      f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                                     OpStore %126 %132 
					                        read_only Texture2D %134 = OpLoad %115 
					                                    sampler %135 = OpLoad %119 
					                 read_only Texture2DSampled %136 = OpSampledImage %134 %135 
					                                      f32_2 %137 = OpLoad vs_TEXCOORD0 
					                                      f32_4 %138 = OpImageSampleImplicitLod %136 %137 
					                                      f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
					                                                     OpStore %133 %139 
					                                      f32_3 %141 = OpLoad %126 
					                                      f32_3 %142 = OpLoad %133 
					                                      f32_3 %143 = OpFAdd %141 %142 
					                                                     OpStore %140 %143 
					                                      f32_3 %144 = OpLoad %112 
					                                      f32_3 %145 = OpLoad %140 
					                                      f32_3 %146 = OpFAdd %144 %145 
					                                                     OpStore %140 %146 
					                                      f32_3 %149 = OpLoad %140 
					                                      f32_3 %152 = OpFMul %149 %151 
					                                      f32_4 %153 = OpLoad %148 
					                                      f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
					                                                     OpStore %148 %154 
					                                Output f32* %157 = OpAccessChain %148 %155 
					                                                     OpStore %157 %54 
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
					    u_xlat0.x = (-vs_TEXCOORD0.y) + 0.5;
					    u_xlat0.y = (-vs_TEXCOORD0.y) + _Value3;
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