Shader "CameraFilterPack/Blur_Bloom" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Amount ("_Amount", Range(0, 20)) = 5
		_Glow ("_Glow", Range(0, 20)) = 5
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 38929
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
					vec3 ImmCB_0_0_0[4];
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Amount;
					uniform 	float _Glow;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					ivec2 u_xlati3;
					bool u_xlatb3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat10_7;
					vec3 u_xlat8;
					vec2 u_xlat12;
					vec2 u_xlat16;
					float u_xlat19;
					ivec2 u_xlati19;
					bool u_xlatb19;
					int u_xlati25;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat16.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat16.xy = u_xlat16.xy * vec2(_Amount);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlati25 = 0;
					    while(true){
					        u_xlatb3 = u_xlati25>=3;
					        if(u_xlatb3){break;}
					        u_xlati3.xy = ivec2(u_xlati25) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat3 = float(u_xlati3.x);
					        u_xlat4.x = u_xlat16.x * u_xlat3;
					        u_xlat5.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati25].xyz);
					        u_xlat5.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati25].xyz);
					        u_xlat5.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati25].xyz);
					        u_xlat6 = u_xlat2;
					        u_xlati3.x = 0;
					        while(true){
					            u_xlatb19 = u_xlati3.x>=3;
					            if(u_xlatb19){break;}
					            u_xlati19.xy = u_xlati3.xx + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat19 = float(u_xlati19.x);
					            u_xlat4.y = u_xlat16.y * u_xlat19;
					            u_xlat12.xy = u_xlat0.xy + u_xlat4.xy;
					            u_xlat19 = dot(u_xlat5.xyz, ImmCB_0_0_0[u_xlati3.x].xyz);
					            u_xlat10_7 = texture(_MainTex, u_xlat12.xy);
					            u_xlat6 = vec4(u_xlat19) * u_xlat10_7 + u_xlat6;
					            u_xlati3.x = u_xlati19.y;
					        }
					        u_xlat2 = u_xlat6;
					        u_xlati25 = u_xlati3.y;
					    }
					    u_xlat0.x = u_xlat2.w * 0.125;
					    u_xlat8.xyz = u_xlat2.xyz * vec3(0.125, 0.125, 0.125) + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_Glow, _Glow, _Glow)) * u_xlat8.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat0.x;
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
					; Bound: 246
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %11 %222 
					                                                  OpExecutionMode %4 OriginUpperLeft 
					                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                  OpDecorate vs_TEXCOORD0 Location 11 
					                                                  OpMemberDecorate %14 0 Offset 14 
					                                                  OpMemberDecorate %14 1 Offset 14 
					                                                  OpMemberDecorate %14 2 Offset 14 
					                                                  OpMemberDecorate %14 3 RelaxedPrecision 
					                                                  OpMemberDecorate %14 3 Offset 14 
					                                                  OpDecorate %14 Block 
					                                                  OpDecorate %16 DescriptorSet 16 
					                                                  OpDecorate %16 Binding 16 
					                                                  OpDecorate %21 RelaxedPrecision 
					                                                  OpDecorate %22 RelaxedPrecision 
					                                                  OpDecorate %25 RelaxedPrecision 
					                                                  OpDecorate %26 RelaxedPrecision 
					                                                  OpDecorate %45 RelaxedPrecision 
					                                                  OpDecorate %48 RelaxedPrecision 
					                                                  OpDecorate %48 DescriptorSet 48 
					                                                  OpDecorate %48 Binding 48 
					                                                  OpDecorate %49 RelaxedPrecision 
					                                                  OpDecorate %52 RelaxedPrecision 
					                                                  OpDecorate %52 DescriptorSet 52 
					                                                  OpDecorate %52 Binding 52 
					                                                  OpDecorate %53 RelaxedPrecision 
					                                                  OpDecorate %58 RelaxedPrecision 
					                                                  OpDecorate %190 RelaxedPrecision 
					                                                  OpDecorate %191 RelaxedPrecision 
					                                                  OpDecorate %192 RelaxedPrecision 
					                                                  OpDecorate %197 RelaxedPrecision 
					                                                  OpDecorate %198 RelaxedPrecision 
					                                                  OpDecorate %199 RelaxedPrecision 
					                                                  OpDecorate %218 RelaxedPrecision 
					                                                  OpDecorate %219 RelaxedPrecision 
					                                                  OpDecorate %222 Location 222 
					                                                  OpDecorate %237 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 2 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_2* %9 = OpVariable Private 
					                                          %10 = OpTypePointer Input %7 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          %13 = OpTypeVector %6 4 
					                                          %14 = OpTypeStruct %13 %6 %6 %13 
					                                          %15 = OpTypePointer Uniform %14 
					Uniform struct {f32_4; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                          %17 = OpTypeInt 32 1 
					                                      i32 %18 = OpConstant 3 
					                                          %19 = OpTypePointer Uniform %13 
					                           Private f32_2* %28 = OpVariable Private 
					                                      f32 %29 = OpConstant 3,674022E-40 
					                                    f32_2 %30 = OpConstantComposite %29 %29 
					                                      i32 %31 = OpConstant 0 
					                                      i32 %37 = OpConstant 1 
					                                          %38 = OpTypePointer Uniform %6 
					                                          %43 = OpTypeVector %6 3 
					                                          %44 = OpTypePointer Private %43 
					                           Private f32_3* %45 = OpVariable Private 
					                                          %46 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                          %47 = OpTypePointer UniformConstant %46 
					     UniformConstant read_only Texture2D* %48 = OpVariable UniformConstant 
					                                          %50 = OpTypeSampler 
					                                          %51 = OpTypePointer UniformConstant %50 
					                 UniformConstant sampler* %52 = OpVariable UniformConstant 
					                                          %54 = OpTypeSampledImage %46 
					                                          %59 = OpTypePointer Private %13 
					                           Private f32_4* %60 = OpVariable Private 
					                                      f32 %61 = OpConstant 3,674022E-40 
					                                          %62 = OpTypeInt 32 0 
					                                      u32 %63 = OpConstant 0 
					                                          %64 = OpTypePointer Private %6 
					                                      u32 %66 = OpConstant 1 
					                                      u32 %68 = OpConstant 2 
					                                      u32 %70 = OpConstant 3 
					                                          %72 = OpTypePointer Private %17 
					                             Private i32* %73 = OpVariable Private 
					                                          %79 = OpTypeBool 
					                                     bool %80 = OpConstantTrue 
					                                          %81 = OpTypePointer Private %79 
					                            Private bool* %82 = OpVariable Private 
					                                          %89 = OpTypeVector %17 2 
					                                          %90 = OpTypePointer Private %89 
					                           Private i32_2* %91 = OpVariable Private 
					                                      i32 %94 = OpConstant -1 
					                                    i32_2 %95 = OpConstantComposite %94 %37 
					                             Private f32* %97 = OpVariable Private 
					                          Private f32_2* %101 = OpVariable Private 
					                          Private f32_3* %107 = OpVariable Private 
					                                     f32 %108 = OpConstant 3,674022E-40 
					                                   f32_3 %109 = OpConstantComposite %29 %108 %29 
					                                         %110 = OpTypeVector %62 4 
					                                     u32 %111 = OpConstant 4 
					                                         %112 = OpTypeArray %110 %111 
					                                     u32 %113 = OpConstant 1065353216 
					                                   u32_4 %114 = OpConstantComposite %113 %63 %63 %63 
					                                   u32_4 %115 = OpConstantComposite %63 %113 %63 %63 
					                                   u32_4 %116 = OpConstantComposite %63 %63 %113 %63 
					                                   u32_4 %117 = OpConstantComposite %63 %63 %63 %113 
					                                u32_4[4] %118 = OpConstantComposite %114 %115 %116 %117 
					                                         %120 = OpTypeVector %62 3 
					                                         %121 = OpTypePointer Function %112 
					                                         %123 = OpTypePointer Function %110 
					                                     f32 %130 = OpConstant 3,674022E-40 
					                                   f32_3 %131 = OpConstantComposite %108 %130 %108 
					                          Private f32_4* %148 = OpVariable Private 
					                           Private bool* %156 = OpVariable Private 
					                          Private i32_2* %164 = OpVariable Private 
					                            Private f32* %168 = OpVariable Private 
					                          Private f32_2* %177 = OpVariable Private 
					                          Private f32_4* %190 = OpVariable Private 
					                                     f32 %210 = OpConstant 3,674022E-40 
					                          Private f32_3* %213 = OpVariable Private 
					                                   f32_3 %216 = OpConstantComposite %210 %210 %210 
					                                         %221 = OpTypePointer Output %13 
					                           Output f32_4* %222 = OpVariable Output 
					                                     i32 %223 = OpConstant 2 
					                                         %243 = OpTypePointer Output %6 
					                                      void %4 = OpFunction None %3 
					                                           %5 = OpLabel 
					                      Function u32_4[4]* %122 = OpVariable Function 
					                      Function u32_4[4]* %133 = OpVariable Function 
					                      Function u32_4[4]* %141 = OpVariable Function 
					                      Function u32_4[4]* %184 = OpVariable Function 
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
					                           Uniform f32_4* %32 = OpAccessChain %16 %31 
					                                    f32_4 %33 = OpLoad %32 
					                                    f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                    f32_2 %35 = OpFDiv %30 %34 
					                                                  OpStore %28 %35 
					                                    f32_2 %36 = OpLoad %28 
					                             Uniform f32* %39 = OpAccessChain %16 %37 
					                                      f32 %40 = OpLoad %39 
					                                    f32_2 %41 = OpCompositeConstruct %40 %40 
					                                    f32_2 %42 = OpFMul %36 %41 
					                                                  OpStore %28 %42 
					                      read_only Texture2D %49 = OpLoad %48 
					                                  sampler %53 = OpLoad %52 
					               read_only Texture2DSampled %55 = OpSampledImage %49 %53 
					                                    f32_2 %56 = OpLoad %9 
					                                    f32_4 %57 = OpImageSampleImplicitLod %55 %56 
					                                    f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
					                                                  OpStore %45 %58 
					                             Private f32* %65 = OpAccessChain %60 %63 
					                                                  OpStore %65 %61 
					                             Private f32* %67 = OpAccessChain %60 %66 
					                                                  OpStore %67 %61 
					                             Private f32* %69 = OpAccessChain %60 %68 
					                                                  OpStore %69 %61 
					                             Private f32* %71 = OpAccessChain %60 %70 
					                                                  OpStore %71 %61 
					                                                  OpStore %73 %31 
					                                                  OpBranch %74 
					                                          %74 = OpLabel 
					                                                  OpLoopMerge %76 %77 None 
					                                                  OpBranch %78 
					                                          %78 = OpLabel 
					                                                  OpBranchConditional %80 %75 %76 
					                                          %75 = OpLabel 
					                                      i32 %83 = OpLoad %73 
					                                     bool %84 = OpSGreaterThanEqual %83 %18 
					                                                  OpStore %82 %84 
					                                     bool %85 = OpLoad %82 
					                                                  OpSelectionMerge %87 None 
					                                                  OpBranchConditional %85 %86 %87 
					                                          %86 = OpLabel 
					                                                  OpBranch %76 
					                                          %87 = OpLabel 
					                                      i32 %92 = OpLoad %73 
					                                    i32_2 %93 = OpCompositeConstruct %92 %92 
					                                    i32_2 %96 = OpIAdd %93 %95 
					                                                  OpStore %91 %96 
					                             Private i32* %98 = OpAccessChain %91 %63 
					                                      i32 %99 = OpLoad %98 
					                                     f32 %100 = OpConvertSToF %99 
					                                                  OpStore %97 %100 
					                            Private f32* %102 = OpAccessChain %28 %63 
					                                     f32 %103 = OpLoad %102 
					                                     f32 %104 = OpLoad %97 
					                                     f32 %105 = OpFMul %103 %104 
					                            Private f32* %106 = OpAccessChain %101 %63 
					                                                  OpStore %106 %105 
					                                     i32 %119 = OpLoad %73 
					                                                  OpStore %122 %118 
					                         Function u32_4* %124 = OpAccessChain %122 %119 
					                                   u32_4 %125 = OpLoad %124 
					                                   u32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
					                                   f32_3 %127 = OpBitcast %126 
					                                     f32 %128 = OpDot %109 %127 
					                            Private f32* %129 = OpAccessChain %107 %63 
					                                                  OpStore %129 %128 
					                                     i32 %132 = OpLoad %73 
					                                                  OpStore %133 %118 
					                         Function u32_4* %134 = OpAccessChain %133 %132 
					                                   u32_4 %135 = OpLoad %134 
					                                   u32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
					                                   f32_3 %137 = OpBitcast %136 
					                                     f32 %138 = OpDot %131 %137 
					                            Private f32* %139 = OpAccessChain %107 %66 
					                                                  OpStore %139 %138 
					                                     i32 %140 = OpLoad %73 
					                                                  OpStore %141 %118 
					                         Function u32_4* %142 = OpAccessChain %141 %140 
					                                   u32_4 %143 = OpLoad %142 
					                                   u32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
					                                   f32_3 %145 = OpBitcast %144 
					                                     f32 %146 = OpDot %109 %145 
					                            Private f32* %147 = OpAccessChain %107 %68 
					                                                  OpStore %147 %146 
					                                   f32_4 %149 = OpLoad %60 
					                                                  OpStore %148 %149 
					                            Private i32* %150 = OpAccessChain %91 %63 
					                                                  OpStore %150 %31 
					                                                  OpBranch %151 
					                                         %151 = OpLabel 
					                                                  OpLoopMerge %153 %154 None 
					                                                  OpBranch %155 
					                                         %155 = OpLabel 
					                                                  OpBranchConditional %80 %152 %153 
					                                         %152 = OpLabel 
					                            Private i32* %157 = OpAccessChain %91 %63 
					                                     i32 %158 = OpLoad %157 
					                                    bool %159 = OpSGreaterThanEqual %158 %18 
					                                                  OpStore %156 %159 
					                                    bool %160 = OpLoad %156 
					                                                  OpSelectionMerge %162 None 
					                                                  OpBranchConditional %160 %161 %162 
					                                         %161 = OpLabel 
					                                                  OpBranch %153 
					                                         %162 = OpLabel 
					                                   i32_2 %165 = OpLoad %91 
					                                   i32_2 %166 = OpVectorShuffle %165 %165 0 0 
					                                   i32_2 %167 = OpIAdd %166 %95 
					                                                  OpStore %164 %167 
					                            Private i32* %169 = OpAccessChain %164 %63 
					                                     i32 %170 = OpLoad %169 
					                                     f32 %171 = OpConvertSToF %170 
					                                                  OpStore %168 %171 
					                            Private f32* %172 = OpAccessChain %28 %66 
					                                     f32 %173 = OpLoad %172 
					                                     f32 %174 = OpLoad %168 
					                                     f32 %175 = OpFMul %173 %174 
					                            Private f32* %176 = OpAccessChain %101 %66 
					                                                  OpStore %176 %175 
					                                   f32_2 %178 = OpLoad %9 
					                                   f32_2 %179 = OpLoad %101 
					                                   f32_2 %180 = OpFAdd %178 %179 
					                                                  OpStore %177 %180 
					                                   f32_3 %181 = OpLoad %107 
					                            Private i32* %182 = OpAccessChain %91 %63 
					                                     i32 %183 = OpLoad %182 
					                                                  OpStore %184 %118 
					                         Function u32_4* %185 = OpAccessChain %184 %183 
					                                   u32_4 %186 = OpLoad %185 
					                                   u32_3 %187 = OpVectorShuffle %186 %186 0 1 2 
					                                   f32_3 %188 = OpBitcast %187 
					                                     f32 %189 = OpDot %181 %188 
					                                                  OpStore %168 %189 
					                     read_only Texture2D %191 = OpLoad %48 
					                                 sampler %192 = OpLoad %52 
					              read_only Texture2DSampled %193 = OpSampledImage %191 %192 
					                                   f32_2 %194 = OpLoad %177 
					                                   f32_4 %195 = OpImageSampleImplicitLod %193 %194 
					                                                  OpStore %190 %195 
					                                     f32 %196 = OpLoad %168 
					                                   f32_4 %197 = OpCompositeConstruct %196 %196 %196 %196 
					                                   f32_4 %198 = OpLoad %190 
					                                   f32_4 %199 = OpFMul %197 %198 
					                                   f32_4 %200 = OpLoad %148 
					                                   f32_4 %201 = OpFAdd %199 %200 
					                                                  OpStore %148 %201 
					                            Private i32* %202 = OpAccessChain %164 %66 
					                                     i32 %203 = OpLoad %202 
					                            Private i32* %204 = OpAccessChain %91 %63 
					                                                  OpStore %204 %203 
					                                                  OpBranch %154 
					                                         %154 = OpLabel 
					                                                  OpBranch %151 
					                                         %153 = OpLabel 
					                                   f32_4 %205 = OpLoad %148 
					                                                  OpStore %60 %205 
					                            Private i32* %206 = OpAccessChain %91 %66 
					                                     i32 %207 = OpLoad %206 
					                                                  OpStore %73 %207 
					                                                  OpBranch %77 
					                                          %77 = OpLabel 
					                                                  OpBranch %74 
					                                          %76 = OpLabel 
					                            Private f32* %208 = OpAccessChain %60 %70 
					                                     f32 %209 = OpLoad %208 
					                                     f32 %211 = OpFMul %209 %210 
					                            Private f32* %212 = OpAccessChain %9 %63 
					                                                  OpStore %212 %211 
					                                   f32_4 %214 = OpLoad %60 
					                                   f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
					                                   f32_3 %217 = OpFMul %215 %216 
					                                   f32_3 %218 = OpLoad %45 
					                                   f32_3 %219 = OpFNegate %218 
					                                   f32_3 %220 = OpFAdd %217 %219 
					                                                  OpStore %213 %220 
					                            Uniform f32* %224 = OpAccessChain %16 %223 
					                                     f32 %225 = OpLoad %224 
					                            Uniform f32* %226 = OpAccessChain %16 %223 
					                                     f32 %227 = OpLoad %226 
					                            Uniform f32* %228 = OpAccessChain %16 %223 
					                                     f32 %229 = OpLoad %228 
					                                   f32_3 %230 = OpCompositeConstruct %225 %227 %229 
					                                     f32 %231 = OpCompositeExtract %230 0 
					                                     f32 %232 = OpCompositeExtract %230 1 
					                                     f32 %233 = OpCompositeExtract %230 2 
					                                   f32_3 %234 = OpCompositeConstruct %231 %232 %233 
					                                   f32_3 %235 = OpLoad %213 
					                                   f32_3 %236 = OpFMul %234 %235 
					                                   f32_3 %237 = OpLoad %45 
					                                   f32_3 %238 = OpFAdd %236 %237 
					                                   f32_4 %239 = OpLoad %222 
					                                   f32_4 %240 = OpVectorShuffle %239 %238 4 5 6 3 
					                                                  OpStore %222 %240 
					                            Private f32* %241 = OpAccessChain %9 %63 
					                                     f32 %242 = OpLoad %241 
					                             Output f32* %244 = OpAccessChain %222 %70 
					                                                  OpStore %244 %242 
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
					
					vec3 ImmCB_0_0_0[4];
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
						float _Amount;
						float _Glow;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					ivec2 u_xlati3;
					bool u_xlatb3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat10_7;
					vec3 u_xlat8;
					vec2 u_xlat12;
					vec2 u_xlat16;
					float u_xlat19;
					ivec2 u_xlati19;
					bool u_xlatb19;
					int u_xlati25;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat16.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat16.xy = u_xlat16.xy * vec2(_Amount);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat2.w = float(0.0);
					    u_xlati25 = 0;
					    while(true){
					        u_xlatb3 = u_xlati25>=3;
					        if(u_xlatb3){break;}
					        u_xlati3.xy = ivec2(u_xlati25) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat3 = float(u_xlati3.x);
					        u_xlat4.x = u_xlat16.x * u_xlat3;
					        u_xlat5.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati25].xyz);
					        u_xlat5.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati25].xyz);
					        u_xlat5.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati25].xyz);
					        u_xlat6 = u_xlat2;
					        u_xlati3.x = 0;
					        while(true){
					            u_xlatb19 = u_xlati3.x>=3;
					            if(u_xlatb19){break;}
					            u_xlati19.xy = u_xlati3.xx + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat19 = float(u_xlati19.x);
					            u_xlat4.y = u_xlat16.y * u_xlat19;
					            u_xlat12.xy = u_xlat0.xy + u_xlat4.xy;
					            u_xlat19 = dot(u_xlat5.xyz, ImmCB_0_0_0[u_xlati3.x].xyz);
					            u_xlat10_7 = texture(_MainTex, u_xlat12.xy);
					            u_xlat6 = vec4(u_xlat19) * u_xlat10_7 + u_xlat6;
					            u_xlati3.x = u_xlati19.y;
					        }
					        u_xlat2 = u_xlat6;
					        u_xlati25 = u_xlati3.y;
					    }
					    u_xlat0.x = u_xlat2.w * 0.125;
					    u_xlat8.xyz = u_xlat2.xyz * vec3(0.125, 0.125, 0.125) + (-u_xlat10_1.xyz);
					    SV_Target0.xyz = vec3(vec3(_Glow, _Glow, _Glow)) * u_xlat8.xyz + u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat0.x;
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