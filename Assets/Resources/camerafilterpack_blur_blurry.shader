Shader "CameraFilterPack/Blur_Blurry" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Amount ("_Amount", Range(0, 20)) = 5
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 25218
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					ivec2 u_xlati2;
					bool u_xlatb2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					ivec2 u_xlati5;
					vec4 u_xlat10_6;
					vec3 u_xlat10;
					vec2 u_xlat14;
					int u_xlati17;
					int u_xlati22;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat14.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat14.xy = u_xlat14.xy * vec2(_Amount);
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlati22 = int(0);
					    while(true){
					        u_xlatb2 = u_xlati22>=3;
					        if(u_xlatb2){break;}
					        u_xlati2.xy = ivec2(u_xlati22) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat2.x = float(u_xlati2.x);
					        u_xlat3.x = u_xlat14.x * u_xlat2.x;
					        u_xlat4.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati22].xyz);
					        u_xlat4.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati22].xyz);
					        u_xlat4.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati22].xyz);
					        u_xlat2.xzw = u_xlat1.xyz;
					        u_xlati17 = 0;
					        while(true){
					            u_xlatb24 = u_xlati17>=3;
					            if(u_xlatb24){break;}
					            u_xlati5.xy = ivec2(u_xlati17) + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat24 = float(u_xlati5.x);
					            u_xlat3.y = u_xlat14.y * u_xlat24;
					            u_xlat10.xz = u_xlat0.xy + u_xlat3.xy;
					            u_xlat25 = dot(u_xlat4.xyz, ImmCB_0_0_0[u_xlati17].xyz);
					            u_xlat10_6 = texture(_MainTex, u_xlat10.xz);
					            u_xlat2.xzw = vec3(u_xlat25) * u_xlat10_6.xyz + u_xlat2.xzw;
					            u_xlati17 = u_xlati5.y;
					        }
					        u_xlat1.xyz = u_xlat2.xzw;
					        u_xlati22 = u_xlati2.y;
					    }
					    SV_Target0.xyz = u_xlat1.xyz * vec3(0.0625, 0.0625, 0.0625);
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
					; Bound: 224
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %213 
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
					                                              OpDecorate %179 RelaxedPrecision 
					                                              OpDecorate %182 RelaxedPrecision 
					                                              OpDecorate %182 DescriptorSet 182 
					                                              OpDecorate %182 Binding 182 
					                                              OpDecorate %183 RelaxedPrecision 
					                                              OpDecorate %186 RelaxedPrecision 
					                                              OpDecorate %186 DescriptorSet 186 
					                                              OpDecorate %186 Binding 186 
					                                              OpDecorate %187 RelaxedPrecision 
					                                              OpDecorate %193 RelaxedPrecision 
					                                              OpDecorate %197 RelaxedPrecision 
					                                              OpDecorate %198 RelaxedPrecision 
					                                              OpDecorate %199 RelaxedPrecision 
					                                              OpDecorate %200 RelaxedPrecision 
					                                              OpDecorate %213 Location 213 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeVector %6 4 
					                                      %14 = OpTypeStruct %13 %6 %13 
					                                      %15 = OpTypePointer Uniform %14 
					 Uniform struct {f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
					                                      %17 = OpTypeInt 32 1 
					                                  i32 %18 = OpConstant 2 
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
					                                  f32 %46 = OpConstant 3,674022E-40 
					                                      %47 = OpTypeInt 32 0 
					                                  u32 %48 = OpConstant 0 
					                                      %49 = OpTypePointer Private %6 
					                                  u32 %51 = OpConstant 1 
					                                  u32 %53 = OpConstant 2 
					                                      %55 = OpTypePointer Private %17 
					                         Private i32* %56 = OpVariable Private 
					                                      %62 = OpTypeBool 
					                                 bool %63 = OpConstantTrue 
					                                      %64 = OpTypePointer Private %62 
					                        Private bool* %65 = OpVariable Private 
					                                  i32 %67 = OpConstant 3 
					                                      %73 = OpTypeVector %17 2 
					                                      %74 = OpTypePointer Private %73 
					                       Private i32_2* %75 = OpVariable Private 
					                                  i32 %78 = OpConstant -1 
					                                i32_2 %79 = OpConstantComposite %78 %37 
					                                      %81 = OpTypePointer Private %13 
					                       Private f32_4* %82 = OpVariable Private 
					                       Private f32_2* %87 = OpVariable Private 
					                       Private f32_3* %94 = OpVariable Private 
					                                  f32 %95 = OpConstant 3,674022E-40 
					                                f32_3 %96 = OpConstantComposite %29 %95 %29 
					                                      %97 = OpTypeVector %47 4 
					                                  u32 %98 = OpConstant 4 
					                                      %99 = OpTypeArray %97 %98 
					                                 u32 %100 = OpConstant 1065353216 
					                               u32_4 %101 = OpConstantComposite %100 %48 %48 %48 
					                               u32_4 %102 = OpConstantComposite %48 %100 %48 %48 
					                               u32_4 %103 = OpConstantComposite %48 %48 %100 %48 
					                               u32_4 %104 = OpConstantComposite %48 %48 %48 %100 
					                            u32_4[4] %105 = OpConstantComposite %101 %102 %103 %104 
					                                     %107 = OpTypeVector %47 3 
					                                     %108 = OpTypePointer Function %99 
					                                     %110 = OpTypePointer Function %97 
					                                 f32 %117 = OpConstant 3,674022E-40 
					                               f32_3 %118 = OpConstantComposite %95 %117 %95 
					                        Private i32* %138 = OpVariable Private 
					                       Private bool* %144 = OpVariable Private 
					                      Private i32_2* %151 = OpVariable Private 
					                        Private f32* %155 = OpVariable Private 
					                      Private f32_3* %164 = OpVariable Private 
					                        Private f32* %170 = OpVariable Private 
					                      Private f32_4* %179 = OpVariable Private 
					                                     %180 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %181 = OpTypePointer UniformConstant %180 
					UniformConstant read_only Texture2D* %182 = OpVariable UniformConstant 
					                                     %184 = OpTypeSampler 
					                                     %185 = OpTypePointer UniformConstant %184 
					            UniformConstant sampler* %186 = OpVariable UniformConstant 
					                                     %188 = OpTypeSampledImage %180 
					                                     %212 = OpTypePointer Output %13 
					                       Output f32_4* %213 = OpVariable Output 
					                                 f32 %215 = OpConstant 3,674022E-40 
					                               f32_3 %216 = OpConstantComposite %215 %215 %215 
					                                 u32 %220 = OpConstant 3 
					                                     %221 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                  Function u32_4[4]* %109 = OpVariable Function 
					                  Function u32_4[4]* %120 = OpVariable Function 
					                  Function u32_4[4]* %128 = OpVariable Function 
					                  Function u32_4[4]* %173 = OpVariable Function 
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
					                         Private f32* %50 = OpAccessChain %45 %48 
					                                              OpStore %50 %46 
					                         Private f32* %52 = OpAccessChain %45 %51 
					                                              OpStore %52 %46 
					                         Private f32* %54 = OpAccessChain %45 %53 
					                                              OpStore %54 %46 
					                                              OpStore %56 %31 
					                                              OpBranch %57 
					                                      %57 = OpLabel 
					                                              OpLoopMerge %59 %60 None 
					                                              OpBranch %61 
					                                      %61 = OpLabel 
					                                              OpBranchConditional %63 %58 %59 
					                                      %58 = OpLabel 
					                                  i32 %66 = OpLoad %56 
					                                 bool %68 = OpSGreaterThanEqual %66 %67 
					                                              OpStore %65 %68 
					                                 bool %69 = OpLoad %65 
					                                              OpSelectionMerge %71 None 
					                                              OpBranchConditional %69 %70 %71 
					                                      %70 = OpLabel 
					                                              OpBranch %59 
					                                      %71 = OpLabel 
					                                  i32 %76 = OpLoad %56 
					                                i32_2 %77 = OpCompositeConstruct %76 %76 
					                                i32_2 %80 = OpIAdd %77 %79 
					                                              OpStore %75 %80 
					                         Private i32* %83 = OpAccessChain %75 %48 
					                                  i32 %84 = OpLoad %83 
					                                  f32 %85 = OpConvertSToF %84 
					                         Private f32* %86 = OpAccessChain %82 %48 
					                                              OpStore %86 %85 
					                         Private f32* %88 = OpAccessChain %28 %48 
					                                  f32 %89 = OpLoad %88 
					                         Private f32* %90 = OpAccessChain %82 %48 
					                                  f32 %91 = OpLoad %90 
					                                  f32 %92 = OpFMul %89 %91 
					                         Private f32* %93 = OpAccessChain %87 %48 
					                                              OpStore %93 %92 
					                                 i32 %106 = OpLoad %56 
					                                              OpStore %109 %105 
					                     Function u32_4* %111 = OpAccessChain %109 %106 
					                               u32_4 %112 = OpLoad %111 
					                               u32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
					                               f32_3 %114 = OpBitcast %113 
					                                 f32 %115 = OpDot %96 %114 
					                        Private f32* %116 = OpAccessChain %94 %48 
					                                              OpStore %116 %115 
					                                 i32 %119 = OpLoad %56 
					                                              OpStore %120 %105 
					                     Function u32_4* %121 = OpAccessChain %120 %119 
					                               u32_4 %122 = OpLoad %121 
					                               u32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
					                               f32_3 %124 = OpBitcast %123 
					                                 f32 %125 = OpDot %118 %124 
					                        Private f32* %126 = OpAccessChain %94 %51 
					                                              OpStore %126 %125 
					                                 i32 %127 = OpLoad %56 
					                                              OpStore %128 %105 
					                     Function u32_4* %129 = OpAccessChain %128 %127 
					                               u32_4 %130 = OpLoad %129 
					                               u32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
					                               f32_3 %132 = OpBitcast %131 
					                                 f32 %133 = OpDot %96 %132 
					                        Private f32* %134 = OpAccessChain %94 %53 
					                                              OpStore %134 %133 
					                               f32_3 %135 = OpLoad %45 
					                               f32_4 %136 = OpLoad %82 
					                               f32_4 %137 = OpVectorShuffle %136 %135 4 1 5 6 
					                                              OpStore %82 %137 
					                                              OpStore %138 %31 
					                                              OpBranch %139 
					                                     %139 = OpLabel 
					                                              OpLoopMerge %141 %142 None 
					                                              OpBranch %143 
					                                     %143 = OpLabel 
					                                              OpBranchConditional %63 %140 %141 
					                                     %140 = OpLabel 
					                                 i32 %145 = OpLoad %138 
					                                bool %146 = OpSGreaterThanEqual %145 %67 
					                                              OpStore %144 %146 
					                                bool %147 = OpLoad %144 
					                                              OpSelectionMerge %149 None 
					                                              OpBranchConditional %147 %148 %149 
					                                     %148 = OpLabel 
					                                              OpBranch %141 
					                                     %149 = OpLabel 
					                                 i32 %152 = OpLoad %138 
					                               i32_2 %153 = OpCompositeConstruct %152 %152 
					                               i32_2 %154 = OpIAdd %153 %79 
					                                              OpStore %151 %154 
					                        Private i32* %156 = OpAccessChain %151 %48 
					                                 i32 %157 = OpLoad %156 
					                                 f32 %158 = OpConvertSToF %157 
					                                              OpStore %155 %158 
					                        Private f32* %159 = OpAccessChain %28 %51 
					                                 f32 %160 = OpLoad %159 
					                                 f32 %161 = OpLoad %155 
					                                 f32 %162 = OpFMul %160 %161 
					                        Private f32* %163 = OpAccessChain %87 %51 
					                                              OpStore %163 %162 
					                               f32_2 %165 = OpLoad %9 
					                               f32_2 %166 = OpLoad %87 
					                               f32_2 %167 = OpFAdd %165 %166 
					                               f32_3 %168 = OpLoad %164 
					                               f32_3 %169 = OpVectorShuffle %168 %167 3 1 4 
					                                              OpStore %164 %169 
					                               f32_3 %171 = OpLoad %94 
					                                 i32 %172 = OpLoad %138 
					                                              OpStore %173 %105 
					                     Function u32_4* %174 = OpAccessChain %173 %172 
					                               u32_4 %175 = OpLoad %174 
					                               u32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
					                               f32_3 %177 = OpBitcast %176 
					                                 f32 %178 = OpDot %171 %177 
					                                              OpStore %170 %178 
					                 read_only Texture2D %183 = OpLoad %182 
					                             sampler %187 = OpLoad %186 
					          read_only Texture2DSampled %189 = OpSampledImage %183 %187 
					                               f32_3 %190 = OpLoad %164 
					                               f32_2 %191 = OpVectorShuffle %190 %190 0 2 
					                               f32_4 %192 = OpImageSampleImplicitLod %189 %191 
					                               f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                               f32_4 %194 = OpLoad %179 
					                               f32_4 %195 = OpVectorShuffle %194 %193 4 1 5 6 
					                                              OpStore %179 %195 
					                                 f32 %196 = OpLoad %170 
					                               f32_3 %197 = OpCompositeConstruct %196 %196 %196 
					                               f32_4 %198 = OpLoad %179 
					                               f32_3 %199 = OpVectorShuffle %198 %198 0 2 3 
					                               f32_3 %200 = OpFMul %197 %199 
					                               f32_4 %201 = OpLoad %82 
					                               f32_3 %202 = OpVectorShuffle %201 %201 0 2 3 
					                               f32_3 %203 = OpFAdd %200 %202 
					                               f32_4 %204 = OpLoad %82 
					                               f32_4 %205 = OpVectorShuffle %204 %203 4 1 5 6 
					                                              OpStore %82 %205 
					                        Private i32* %206 = OpAccessChain %151 %51 
					                                 i32 %207 = OpLoad %206 
					                                              OpStore %138 %207 
					                                              OpBranch %142 
					                                     %142 = OpLabel 
					                                              OpBranch %139 
					                                     %141 = OpLabel 
					                               f32_4 %208 = OpLoad %82 
					                               f32_3 %209 = OpVectorShuffle %208 %208 0 2 3 
					                                              OpStore %45 %209 
					                        Private i32* %210 = OpAccessChain %75 %51 
					                                 i32 %211 = OpLoad %210 
					                                              OpStore %56 %211 
					                                              OpBranch %60 
					                                      %60 = OpLabel 
					                                              OpBranch %57 
					                                      %59 = OpLabel 
					                               f32_3 %214 = OpLoad %45 
					                               f32_3 %217 = OpFMul %214 %216 
					                               f32_4 %218 = OpLoad %213 
					                               f32_4 %219 = OpVectorShuffle %218 %217 4 5 6 3 
					                                              OpStore %213 %219 
					                         Output f32* %222 = OpAccessChain %213 %220 
					                                              OpStore %222 %29 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					ivec2 u_xlati2;
					bool u_xlatb2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					ivec2 u_xlati5;
					vec4 u_xlat10_6;
					vec3 u_xlat10;
					vec2 u_xlat14;
					int u_xlati17;
					int u_xlati22;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat14.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat14.xy = u_xlat14.xy * vec2(_Amount);
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlati22 = int(0);
					    while(true){
					        u_xlatb2 = u_xlati22>=3;
					        if(u_xlatb2){break;}
					        u_xlati2.xy = ivec2(u_xlati22) + ivec2(int(0xFFFFFFFFu), 1);
					        u_xlat2.x = float(u_xlati2.x);
					        u_xlat3.x = u_xlat14.x * u_xlat2.x;
					        u_xlat4.x = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati22].xyz);
					        u_xlat4.y = dot(vec3(2.0, 4.0, 2.0), ImmCB_0_0_0[u_xlati22].xyz);
					        u_xlat4.z = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati22].xyz);
					        u_xlat2.xzw = u_xlat1.xyz;
					        u_xlati17 = 0;
					        while(true){
					            u_xlatb24 = u_xlati17>=3;
					            if(u_xlatb24){break;}
					            u_xlati5.xy = ivec2(u_xlati17) + ivec2(int(0xFFFFFFFFu), 1);
					            u_xlat24 = float(u_xlati5.x);
					            u_xlat3.y = u_xlat14.y * u_xlat24;
					            u_xlat10.xz = u_xlat0.xy + u_xlat3.xy;
					            u_xlat25 = dot(u_xlat4.xyz, ImmCB_0_0_0[u_xlati17].xyz);
					            u_xlat10_6 = texture(_MainTex, u_xlat10.xz);
					            u_xlat2.xzw = vec3(u_xlat25) * u_xlat10_6.xyz + u_xlat2.xzw;
					            u_xlati17 = u_xlati5.y;
					        }
					        u_xlat1.xyz = u_xlat2.xzw;
					        u_xlati22 = u_xlati2.y;
					    }
					    SV_Target0.xyz = u_xlat1.xyz * vec3(0.0625, 0.0625, 0.0625);
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