Shader "CameraFilterPack/Blur_Focus" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Size ("Size", Range(0, 1)) = 1
		_Circle ("Circle", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_CenterX ("_CenterX", Range(-1, 1)) = 0
		_CenterY ("_CenterY", Range(-1, 1)) = 0
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 48432
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
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _Circle;
					uniform 	float _Size;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_3;
					float u_xlat8;
					vec2 u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8 = _Size * 5.0;
					    u_xlat1.xy = vec2(_CenterX, _CenterY) * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat1.xy = u_xlat0.xy + (-u_xlat1.xy);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat12) * u_xlat1.xy;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat12 = 0.0;
					    while(true){
					        u_xlatb9 = u_xlat12>=_Size;
					        if(u_xlatb9){break;}
					        u_xlat9.x = u_xlat12 / _Circle;
					        u_xlat9.xy = u_xlat1.xy * u_xlat9.xx + u_xlat0.xy;
					        u_xlat10_3 = textureLod(_MainTex, u_xlat9.xy, 0.0);
					        u_xlat2.xyz = u_xlat2.xyz + u_xlat10_3.xyz;
					        u_xlat12 = u_xlat12 + 0.200000003;
					    }
					    SV_Target0.xyz = u_xlat2.xyz / vec3(u_xlat8);
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
					; Bound: 134
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %11 %122 
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
					                                                     OpDecorate %101 RelaxedPrecision 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %104 DescriptorSet 104 
					                                                     OpDecorate %104 Binding 104 
					                                                     OpDecorate %105 RelaxedPrecision 
					                                                     OpDecorate %108 RelaxedPrecision 
					                                                     OpDecorate %108 DescriptorSet 108 
					                                                     OpDecorate %108 Binding 108 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %114 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate %122 Location 122 
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
					                                             %28 = OpTypePointer Private %6 
					                                Private f32* %29 = OpVariable Private 
					                                         i32 %30 = OpConstant 3 
					                                             %31 = OpTypePointer Uniform %6 
					                                         f32 %34 = OpConstant 3,674022E-40 
					                              Private f32_2* %36 = OpVariable Private 
					                                         i32 %37 = OpConstant 0 
					                                         i32 %40 = OpConstant 1 
					                                         f32 %44 = OpConstant 3,674022E-40 
					                                       f32_2 %45 = OpConstantComposite %44 %44 
					                                Private f32* %52 = OpVariable Private 
					                                             %60 = OpTypeVector %6 3 
					                                             %61 = OpTypePointer Private %60 
					                              Private f32_3* %62 = OpVariable Private 
					                                         f32 %63 = OpConstant 3,674022E-40 
					                                             %64 = OpTypeInt 32 0 
					                                         u32 %65 = OpConstant 0 
					                                         u32 %67 = OpConstant 1 
					                                         u32 %69 = OpConstant 2 
					                                             %76 = OpTypeBool 
					                                        bool %77 = OpConstantTrue 
					                                             %78 = OpTypePointer Private %76 
					                               Private bool* %79 = OpVariable Private 
					                              Private f32_2* %88 = OpVariable Private 
					                                         i32 %90 = OpConstant 2 
					                             Private f32_3* %101 = OpVariable Private 
					                                            %102 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %103 = OpTypePointer UniformConstant %102 
					       UniformConstant read_only Texture2D* %104 = OpVariable UniformConstant 
					                                            %106 = OpTypeSampler 
					                                            %107 = OpTypePointer UniformConstant %106 
					                   UniformConstant sampler* %108 = OpVariable UniformConstant 
					                                            %110 = OpTypeSampledImage %102 
					                                        f32 %119 = OpConstant 3,674022E-40 
					                                            %121 = OpTypePointer Output %13 
					                              Output f32_4* %122 = OpVariable Output 
					                                        f32 %129 = OpConstant 3,674022E-40 
					                                        u32 %130 = OpConstant 3 
					                                            %131 = OpTypePointer Output %6 
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
					                                Uniform f32* %32 = OpAccessChain %16 %30 
					                                         f32 %33 = OpLoad %32 
					                                         f32 %35 = OpFMul %33 %34 
					                                                     OpStore %29 %35 
					                                Uniform f32* %38 = OpAccessChain %16 %37 
					                                         f32 %39 = OpLoad %38 
					                                Uniform f32* %41 = OpAccessChain %16 %40 
					                                         f32 %42 = OpLoad %41 
					                                       f32_2 %43 = OpCompositeConstruct %39 %42 
					                                       f32_2 %46 = OpFMul %43 %45 
					                                       f32_2 %47 = OpFAdd %46 %45 
					                                                     OpStore %36 %47 
					                                       f32_2 %48 = OpLoad %9 
					                                       f32_2 %49 = OpLoad %36 
					                                       f32_2 %50 = OpFNegate %49 
					                                       f32_2 %51 = OpFAdd %48 %50 
					                                                     OpStore %36 %51 
					                                       f32_2 %53 = OpLoad %36 
					                                       f32_2 %54 = OpLoad %36 
					                                         f32 %55 = OpDot %53 %54 
					                                                     OpStore %52 %55 
					                                         f32 %56 = OpLoad %52 
					                                       f32_2 %57 = OpCompositeConstruct %56 %56 
					                                       f32_2 %58 = OpLoad %36 
					                                       f32_2 %59 = OpFMul %57 %58 
					                                                     OpStore %36 %59 
					                                Private f32* %66 = OpAccessChain %62 %65 
					                                                     OpStore %66 %63 
					                                Private f32* %68 = OpAccessChain %62 %67 
					                                                     OpStore %68 %63 
					                                Private f32* %70 = OpAccessChain %62 %69 
					                                                     OpStore %70 %63 
					                                                     OpStore %52 %63 
					                                                     OpBranch %71 
					                                             %71 = OpLabel 
					                                                     OpLoopMerge %73 %74 None 
					                                                     OpBranch %75 
					                                             %75 = OpLabel 
					                                                     OpBranchConditional %77 %72 %73 
					                                             %72 = OpLabel 
					                                         f32 %80 = OpLoad %52 
					                                Uniform f32* %81 = OpAccessChain %16 %30 
					                                         f32 %82 = OpLoad %81 
					                                        bool %83 = OpFOrdGreaterThanEqual %80 %82 
					                                                     OpStore %79 %83 
					                                        bool %84 = OpLoad %79 
					                                                     OpSelectionMerge %86 None 
					                                                     OpBranchConditional %84 %85 %86 
					                                             %85 = OpLabel 
					                                                     OpBranch %73 
					                                             %86 = OpLabel 
					                                         f32 %89 = OpLoad %52 
					                                Uniform f32* %91 = OpAccessChain %16 %90 
					                                         f32 %92 = OpLoad %91 
					                                         f32 %93 = OpFDiv %89 %92 
					                                Private f32* %94 = OpAccessChain %88 %65 
					                                                     OpStore %94 %93 
					                                       f32_2 %95 = OpLoad %36 
					                                       f32_2 %96 = OpLoad %88 
					                                       f32_2 %97 = OpVectorShuffle %96 %96 0 0 
					                                       f32_2 %98 = OpFMul %95 %97 
					                                       f32_2 %99 = OpLoad %9 
					                                      f32_2 %100 = OpFAdd %98 %99 
					                                                     OpStore %88 %100 
					                        read_only Texture2D %105 = OpLoad %104 
					                                    sampler %109 = OpLoad %108 
					                 read_only Texture2DSampled %111 = OpSampledImage %105 %109 
					                                      f32_2 %112 = OpLoad %88 
					                                      f32_4 %113 = OpImageSampleExplicitLod %111 %112 Lod %13 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
					                                                     OpStore %101 %114 
					                                      f32_3 %115 = OpLoad %62 
					                                      f32_3 %116 = OpLoad %101 
					                                      f32_3 %117 = OpFAdd %115 %116 
					                                                     OpStore %62 %117 
					                                        f32 %118 = OpLoad %52 
					                                        f32 %120 = OpFAdd %118 %119 
					                                                     OpStore %52 %120 
					                                                     OpBranch %74 
					                                             %74 = OpLabel 
					                                                     OpBranch %71 
					                                             %73 = OpLabel 
					                                      f32_3 %123 = OpLoad %62 
					                                        f32 %124 = OpLoad %29 
					                                      f32_3 %125 = OpCompositeConstruct %124 %124 %124 
					                                      f32_3 %126 = OpFDiv %123 %125 
					                                      f32_4 %127 = OpLoad %122 
					                                      f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
					                                                     OpStore %122 %128 
					                                Output f32* %132 = OpAccessChain %122 %130 
					                                                     OpStore %132 %129 
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
						float _CenterX;
						float _CenterY;
						float _Circle;
						float _Size;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_3;
					float u_xlat8;
					vec2 u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8 = _Size * 5.0;
					    u_xlat1.xy = vec2(_CenterX, _CenterY) * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat1.xy = u_xlat0.xy + (-u_xlat1.xy);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.xy = vec2(u_xlat12) * u_xlat1.xy;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat12 = 0.0;
					    while(true){
					        u_xlatb9 = u_xlat12>=_Size;
					        if(u_xlatb9){break;}
					        u_xlat9.x = u_xlat12 / _Circle;
					        u_xlat9.xy = u_xlat1.xy * u_xlat9.xx + u_xlat0.xy;
					        u_xlat10_3 = textureLod(_MainTex, u_xlat9.xy, 0.0);
					        u_xlat2.xyz = u_xlat2.xyz + u_xlat10_3.xyz;
					        u_xlat12 = u_xlat12 + 0.200000003;
					    }
					    SV_Target0.xyz = u_xlat2.xyz / vec3(u_xlat8);
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