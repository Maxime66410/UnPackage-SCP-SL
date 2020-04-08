Shader "CameraFilterPack/Blur_GaussianBlur" {
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
			GpuProgramID 15538
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
					uniform 	float _Distortion;
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					ivec2 u_xlati2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					int u_xlati10;
					float u_xlat13;
					ivec2 u_xlati13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					int u_xlati16;
					vec4 TempArray0[6];
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlati10 = int(0xFFFFFFFEu);
					    while(true){
					        u_xlatb15 = 2<u_xlati10;
					        if(u_xlatb15){break;}
					        u_xlati2.xy = ivec2(u_xlati10) + ivec2(2, 1);
					        u_xlat15 = TempArray0[u_xlati2.x].x;
					        u_xlat16 = float(u_xlati10);
					        u_xlat3.x = u_xlat16 * _Distortion;
					        u_xlat2.xzw = u_xlat1.xyz;
					        u_xlati16 = int(0xFFFFFFFEu);
					        while(true){
					            u_xlatb13 = 2<u_xlati16;
					            if(u_xlatb13){break;}
					            u_xlati13.xy = ivec2(u_xlati16) + ivec2(2, 1);
					            u_xlat13 = TempArray0[u_xlati13.x].x;
					            u_xlat13 = u_xlat15 * u_xlat13;
					            u_xlat4.x = float(u_xlati16);
					            u_xlat3.y = u_xlat4.x * _Distortion;
					            u_xlat4.xy = u_xlat0.xy * _ScreenResolution.xy + u_xlat3.xy;
					            u_xlat4.xy = u_xlat4.xy / _ScreenResolution.xy;
					            u_xlat10_4 = texture(_MainTex, u_xlat4.xy);
					            u_xlat2.xzw = vec3(u_xlat13) * u_xlat10_4.xyz + u_xlat2.xzw;
					            u_xlati16 = u_xlati13.y;
					        }
					        u_xlat1.xyz = u_xlat2.xzw;
					        u_xlati10 = u_xlati2.y;
					    }
					    SV_Target0.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25);
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
					; Bound: 190
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %178 
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
					                                              OpDecorate %148 RelaxedPrecision 
					                                              OpDecorate %151 RelaxedPrecision 
					                                              OpDecorate %151 DescriptorSet 151 
					                                              OpDecorate %151 Binding 151 
					                                              OpDecorate %152 RelaxedPrecision 
					                                              OpDecorate %155 RelaxedPrecision 
					                                              OpDecorate %155 DescriptorSet 155 
					                                              OpDecorate %155 Binding 155 
					                                              OpDecorate %156 RelaxedPrecision 
					                                              OpDecorate %161 RelaxedPrecision 
					                                              OpDecorate %163 RelaxedPrecision 
					                                              OpDecorate %164 RelaxedPrecision 
					                                              OpDecorate %165 RelaxedPrecision 
					                                              OpDecorate %178 Location 178 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeVector %6 4 
					                                      %14 = OpTypeStruct %6 %13 %13 
					                                      %15 = OpTypePointer Uniform %14 
					 Uniform struct {f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
					                                      %17 = OpTypeInt 32 1 
					                                  i32 %18 = OpConstant 2 
					                                      %19 = OpTypePointer Uniform %13 
					                                      %28 = OpTypeInt 32 0 
					                                  u32 %29 = OpConstant 6 
					                                      %30 = OpTypeArray %13 %29 
					                                      %31 = OpTypePointer Private %30 
					                    Private f32_4[6]* %32 = OpVariable Private 
					                                  i32 %33 = OpConstant 5 
					                                  f32 %34 = OpConstant 3,674022E-40 
					                                  u32 %35 = OpConstant 0 
					                                      %36 = OpTypePointer Private %6 
					                                  f32 %38 = OpConstant 3,674022E-40 
					                                  i32 %40 = OpConstant 1 
					                                  i32 %42 = OpConstant 3 
					                                  i32 %44 = OpConstant 0 
					                                  i32 %46 = OpConstant 4 
					                                      %48 = OpTypeVector %6 3 
					                                      %49 = OpTypePointer Private %48 
					                       Private f32_3* %50 = OpVariable Private 
					                                  u32 %52 = OpConstant 1 
					                                  u32 %54 = OpConstant 2 
					                                      %56 = OpTypePointer Private %17 
					                         Private i32* %57 = OpVariable Private 
					                                  i32 %58 = OpConstant -2 
					                                      %64 = OpTypeBool 
					                                 bool %65 = OpConstantTrue 
					                                      %66 = OpTypePointer Private %64 
					                        Private bool* %67 = OpVariable Private 
					                                      %74 = OpTypeVector %17 2 
					                                      %75 = OpTypePointer Private %74 
					                       Private i32_2* %76 = OpVariable Private 
					                                i32_2 %79 = OpConstantComposite %18 %40 
					                         Private f32* %81 = OpVariable Private 
					                         Private f32* %86 = OpVariable Private 
					                       Private f32_2* %89 = OpVariable Private 
					                                      %91 = OpTypePointer Uniform %6 
					                                      %96 = OpTypePointer Private %13 
					                       Private f32_4* %97 = OpVariable Private 
					                        Private i32* %101 = OpVariable Private 
					                       Private bool* %107 = OpVariable Private 
					                      Private i32_2* %114 = OpVariable Private 
					                        Private f32* %118 = OpVariable Private 
					                      Private f32_2* %126 = OpVariable Private 
					                      Private f32_3* %148 = OpVariable Private 
					                                     %149 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %150 = OpTypePointer UniformConstant %149 
					UniformConstant read_only Texture2D* %151 = OpVariable UniformConstant 
					                                     %153 = OpTypeSampler 
					                                     %154 = OpTypePointer UniformConstant %153 
					            UniformConstant sampler* %155 = OpVariable UniformConstant 
					                                     %157 = OpTypeSampledImage %149 
					                                     %177 = OpTypePointer Output %13 
					                       Output f32_4* %178 = OpVariable Output 
					                                 f32 %180 = OpConstant 3,674022E-40 
					                               f32_3 %181 = OpConstantComposite %180 %180 %180 
					                                 f32 %185 = OpConstant 3,674022E-40 
					                                 u32 %186 = OpConstant 3 
					                                     %187 = OpTypePointer Output %6 
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
					                         Private f32* %37 = OpAccessChain %32 %33 %35 
					                                              OpStore %37 %34 
					                         Private f32* %39 = OpAccessChain %32 %18 %35 
					                                              OpStore %39 %38 
					                         Private f32* %41 = OpAccessChain %32 %40 %35 
					                                              OpStore %41 %38 
					                         Private f32* %43 = OpAccessChain %32 %42 %35 
					                                              OpStore %43 %38 
					                         Private f32* %45 = OpAccessChain %32 %44 %35 
					                                              OpStore %45 %38 
					                         Private f32* %47 = OpAccessChain %32 %46 %35 
					                                              OpStore %47 %38 
					                         Private f32* %51 = OpAccessChain %50 %35 
					                                              OpStore %51 %34 
					                         Private f32* %53 = OpAccessChain %50 %52 
					                                              OpStore %53 %34 
					                         Private f32* %55 = OpAccessChain %50 %54 
					                                              OpStore %55 %34 
					                                              OpStore %57 %58 
					                                              OpBranch %59 
					                                      %59 = OpLabel 
					                                              OpLoopMerge %61 %62 None 
					                                              OpBranch %63 
					                                      %63 = OpLabel 
					                                              OpBranchConditional %65 %60 %61 
					                                      %60 = OpLabel 
					                                  i32 %68 = OpLoad %57 
					                                 bool %69 = OpSLessThan %18 %68 
					                                              OpStore %67 %69 
					                                 bool %70 = OpLoad %67 
					                                              OpSelectionMerge %72 None 
					                                              OpBranchConditional %70 %71 %72 
					                                      %71 = OpLabel 
					                                              OpBranch %61 
					                                      %72 = OpLabel 
					                                  i32 %77 = OpLoad %57 
					                                i32_2 %78 = OpCompositeConstruct %77 %77 
					                                i32_2 %80 = OpIAdd %78 %79 
					                                              OpStore %76 %80 
					                         Private i32* %82 = OpAccessChain %76 %35 
					                                  i32 %83 = OpLoad %82 
					                         Private f32* %84 = OpAccessChain %32 %83 %35 
					                                  f32 %85 = OpLoad %84 
					                                              OpStore %81 %85 
					                                  i32 %87 = OpLoad %57 
					                                  f32 %88 = OpConvertSToF %87 
					                                              OpStore %86 %88 
					                                  f32 %90 = OpLoad %86 
					                         Uniform f32* %92 = OpAccessChain %16 %44 
					                                  f32 %93 = OpLoad %92 
					                                  f32 %94 = OpFMul %90 %93 
					                         Private f32* %95 = OpAccessChain %89 %35 
					                                              OpStore %95 %94 
					                                f32_3 %98 = OpLoad %50 
					                                f32_4 %99 = OpLoad %97 
					                               f32_4 %100 = OpVectorShuffle %99 %98 4 1 5 6 
					                                              OpStore %97 %100 
					                                              OpStore %101 %58 
					                                              OpBranch %102 
					                                     %102 = OpLabel 
					                                              OpLoopMerge %104 %105 None 
					                                              OpBranch %106 
					                                     %106 = OpLabel 
					                                              OpBranchConditional %65 %103 %104 
					                                     %103 = OpLabel 
					                                 i32 %108 = OpLoad %101 
					                                bool %109 = OpSLessThan %18 %108 
					                                              OpStore %107 %109 
					                                bool %110 = OpLoad %107 
					                                              OpSelectionMerge %112 None 
					                                              OpBranchConditional %110 %111 %112 
					                                     %111 = OpLabel 
					                                              OpBranch %104 
					                                     %112 = OpLabel 
					                                 i32 %115 = OpLoad %101 
					                               i32_2 %116 = OpCompositeConstruct %115 %115 
					                               i32_2 %117 = OpIAdd %116 %79 
					                                              OpStore %114 %117 
					                        Private i32* %119 = OpAccessChain %114 %35 
					                                 i32 %120 = OpLoad %119 
					                        Private f32* %121 = OpAccessChain %32 %120 %35 
					                                 f32 %122 = OpLoad %121 
					                                              OpStore %118 %122 
					                                 f32 %123 = OpLoad %81 
					                                 f32 %124 = OpLoad %118 
					                                 f32 %125 = OpFMul %123 %124 
					                                              OpStore %118 %125 
					                                 i32 %127 = OpLoad %101 
					                                 f32 %128 = OpConvertSToF %127 
					                        Private f32* %129 = OpAccessChain %126 %35 
					                                              OpStore %129 %128 
					                        Private f32* %130 = OpAccessChain %126 %35 
					                                 f32 %131 = OpLoad %130 
					                        Uniform f32* %132 = OpAccessChain %16 %44 
					                                 f32 %133 = OpLoad %132 
					                                 f32 %134 = OpFMul %131 %133 
					                        Private f32* %135 = OpAccessChain %89 %52 
					                                              OpStore %135 %134 
					                               f32_2 %136 = OpLoad %9 
					                      Uniform f32_4* %137 = OpAccessChain %16 %40 
					                               f32_4 %138 = OpLoad %137 
					                               f32_2 %139 = OpVectorShuffle %138 %138 0 1 
					                               f32_2 %140 = OpFMul %136 %139 
					                               f32_2 %141 = OpLoad %89 
					                               f32_2 %142 = OpFAdd %140 %141 
					                                              OpStore %126 %142 
					                               f32_2 %143 = OpLoad %126 
					                      Uniform f32_4* %144 = OpAccessChain %16 %40 
					                               f32_4 %145 = OpLoad %144 
					                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
					                               f32_2 %147 = OpFDiv %143 %146 
					                                              OpStore %126 %147 
					                 read_only Texture2D %152 = OpLoad %151 
					                             sampler %156 = OpLoad %155 
					          read_only Texture2DSampled %158 = OpSampledImage %152 %156 
					                               f32_2 %159 = OpLoad %126 
					                               f32_4 %160 = OpImageSampleImplicitLod %158 %159 
					                               f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
					                                              OpStore %148 %161 
					                                 f32 %162 = OpLoad %118 
					                               f32_3 %163 = OpCompositeConstruct %162 %162 %162 
					                               f32_3 %164 = OpLoad %148 
					                               f32_3 %165 = OpFMul %163 %164 
					                               f32_4 %166 = OpLoad %97 
					                               f32_3 %167 = OpVectorShuffle %166 %166 0 2 3 
					                               f32_3 %168 = OpFAdd %165 %167 
					                               f32_4 %169 = OpLoad %97 
					                               f32_4 %170 = OpVectorShuffle %169 %168 4 1 5 6 
					                                              OpStore %97 %170 
					                        Private i32* %171 = OpAccessChain %114 %52 
					                                 i32 %172 = OpLoad %171 
					                                              OpStore %101 %172 
					                                              OpBranch %105 
					                                     %105 = OpLabel 
					                                              OpBranch %102 
					                                     %104 = OpLabel 
					                               f32_4 %173 = OpLoad %97 
					                               f32_3 %174 = OpVectorShuffle %173 %173 0 2 3 
					                                              OpStore %50 %174 
					                        Private i32* %175 = OpAccessChain %76 %52 
					                                 i32 %176 = OpLoad %175 
					                                              OpStore %57 %176 
					                                              OpBranch %62 
					                                      %62 = OpLabel 
					                                              OpBranch %59 
					                                      %61 = OpLabel 
					                               f32_3 %179 = OpLoad %50 
					                               f32_3 %182 = OpFMul %179 %181 
					                               f32_4 %183 = OpLoad %178 
					                               f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
					                                              OpStore %178 %184 
					                         Output f32* %188 = OpAccessChain %178 %186 
					                                              OpStore %188 %185 
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
						float _Distortion;
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					ivec2 u_xlati2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					int u_xlati10;
					float u_xlat13;
					ivec2 u_xlati13;
					bool u_xlatb13;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					int u_xlati16;
					vec4 TempArray0[6];
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlati10 = int(0xFFFFFFFEu);
					    while(true){
					        u_xlatb15 = 2<u_xlati10;
					        if(u_xlatb15){break;}
					        u_xlati2.xy = ivec2(u_xlati10) + ivec2(2, 1);
					        u_xlat15 = TempArray0[u_xlati2.x].x;
					        u_xlat16 = float(u_xlati10);
					        u_xlat3.x = u_xlat16 * _Distortion;
					        u_xlat2.xzw = u_xlat1.xyz;
					        u_xlati16 = int(0xFFFFFFFEu);
					        while(true){
					            u_xlatb13 = 2<u_xlati16;
					            if(u_xlatb13){break;}
					            u_xlati13.xy = ivec2(u_xlati16) + ivec2(2, 1);
					            u_xlat13 = TempArray0[u_xlati13.x].x;
					            u_xlat13 = u_xlat15 * u_xlat13;
					            u_xlat4.x = float(u_xlati16);
					            u_xlat3.y = u_xlat4.x * _Distortion;
					            u_xlat4.xy = u_xlat0.xy * _ScreenResolution.xy + u_xlat3.xy;
					            u_xlat4.xy = u_xlat4.xy / _ScreenResolution.xy;
					            u_xlat10_4 = texture(_MainTex, u_xlat4.xy);
					            u_xlat2.xzw = vec3(u_xlat13) * u_xlat10_4.xyz + u_xlat2.xzw;
					            u_xlati16 = u_xlati13.y;
					        }
					        u_xlat1.xyz = u_xlat2.xzw;
					        u_xlati10 = u_xlati2.y;
					    }
					    SV_Target0.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25);
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