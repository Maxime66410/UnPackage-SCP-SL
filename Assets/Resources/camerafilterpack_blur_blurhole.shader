Shader "CameraFilterPack/BlurHole" {
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
			GpuProgramID 19072
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
					uniform 	float _Radius;
					uniform 	float _SpotSize;
					uniform 	float _CenterX;
					uniform 	float _CenterY;
					uniform 	float _Alpha;
					uniform 	float _Alpha2;
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					ivec2 u_xlati2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					float u_xlat10;
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
					    u_xlat10 = _SpotSize * 0.150000006;
					    u_xlat2.xy = (-u_xlat0.xy) + vec2(_CenterX, _CenterY);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat15 = u_xlat15 + (-_Radius);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat10 = u_xlat10 * u_xlat15;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat15 = u_xlat10 * -2.0 + 3.0;
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat10 = (-u_xlat15) * u_xlat10 + 1.0;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyw = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat10_2.xyz);
					    u_xlat0.xyw = vec3(vec3(_Alpha2, _Alpha2, _Alpha2)) * u_xlat0.xyw + u_xlat10_2.xyz;
					    u_xlat10 = (-u_xlat10) + 1.0;
					    u_xlat10 = u_xlat10 * _Alpha;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat0.xyw);
					    SV_Target0.xyz = vec3(u_xlat10) * u_xlat1.xyz + u_xlat0.xyw;
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
					; Bound: 299
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %285 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %14 0 Offset 14 
					                                                      OpMemberDecorate %14 1 Offset 14 
					                                                      OpMemberDecorate %14 2 Offset 14 
					                                                      OpMemberDecorate %14 3 Offset 14 
					                                                      OpMemberDecorate %14 4 Offset 14 
					                                                      OpMemberDecorate %14 5 Offset 14 
					                                                      OpMemberDecorate %14 6 Offset 14 
					                                                      OpMemberDecorate %14 7 Offset 14 
					                                                      OpMemberDecorate %14 8 RelaxedPrecision 
					                                                      OpMemberDecorate %14 8 Offset 14 
					                                                      OpDecorate %14 Block 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %156 RelaxedPrecision 
					                                                      OpDecorate %156 DescriptorSet 156 
					                                                      OpDecorate %156 Binding 156 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %160 RelaxedPrecision 
					                                                      OpDecorate %160 DescriptorSet 160 
					                                                      OpDecorate %160 Binding 160 
					                                                      OpDecorate %161 RelaxedPrecision 
					                                                      OpDecorate %166 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %169 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %232 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %245 RelaxedPrecision 
					                                                      OpDecorate %246 RelaxedPrecision 
					                                                      OpDecorate %247 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %285 Location 285 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %7 %7 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 8 
					                                              %19 = OpTypePointer Uniform %7 
					                                              %30 = OpTypeInt 32 0 
					                                          u32 %31 = OpConstant 6 
					                                              %32 = OpTypeArray %7 %31 
					                                              %33 = OpTypePointer Private %32 
					                            Private f32_4[6]* %34 = OpVariable Private 
					                                          i32 %35 = OpConstant 5 
					                                          f32 %36 = OpConstant 3,674022E-40 
					                                          u32 %37 = OpConstant 0 
					                                              %38 = OpTypePointer Private %6 
					                                          i32 %40 = OpConstant 2 
					                                          f32 %41 = OpConstant 3,674022E-40 
					                                          i32 %43 = OpConstant 1 
					                                          i32 %45 = OpConstant 3 
					                                          i32 %47 = OpConstant 0 
					                                          i32 %49 = OpConstant 4 
					                                              %51 = OpTypeVector %6 3 
					                                              %52 = OpTypePointer Private %51 
					                               Private f32_3* %53 = OpVariable Private 
					                                          u32 %55 = OpConstant 1 
					                                          u32 %57 = OpConstant 2 
					                                              %59 = OpTypePointer Private %17 
					                                 Private i32* %60 = OpVariable Private 
					                                          i32 %61 = OpConstant -2 
					                                              %67 = OpTypeBool 
					                                         bool %68 = OpConstantTrue 
					                                              %69 = OpTypePointer Private %67 
					                                Private bool* %70 = OpVariable Private 
					                                              %77 = OpTypeVector %17 2 
					                                              %78 = OpTypePointer Private %77 
					                               Private i32_2* %79 = OpVariable Private 
					                                        i32_2 %82 = OpConstantComposite %40 %43 
					                                 Private f32* %84 = OpVariable Private 
					                                 Private f32* %89 = OpVariable Private 
					                                              %92 = OpTypePointer Private %10 
					                               Private f32_2* %93 = OpVariable Private 
					                                              %95 = OpTypePointer Uniform %6 
					                              Private f32_4* %100 = OpVariable Private 
					                                Private i32* %104 = OpVariable Private 
					                               Private bool* %110 = OpVariable Private 
					                              Private i32_2* %117 = OpVariable Private 
					                                Private f32* %121 = OpVariable Private 
					                              Private f32_2* %129 = OpVariable Private 
					                                         i32 %141 = OpConstant 7 
					                              Private f32_3* %153 = OpVariable Private 
					                                             %154 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %155 = OpTypePointer UniformConstant %154 
					        UniformConstant read_only Texture2D* %156 = OpVariable UniformConstant 
					                                             %158 = OpTypeSampler 
					                                             %159 = OpTypePointer UniformConstant %158 
					                    UniformConstant sampler* %160 = OpVariable UniformConstant 
					                                             %162 = OpTypeSampledImage %154 
					                                Private f32* %182 = OpVariable Private 
					                                         f32 %185 = OpConstant 3,674022E-40 
					                                         f32 %210 = OpConstant 3,674022E-40 
					                                         f32 %219 = OpConstant 3,674022E-40 
					                                         f32 %221 = OpConstant 3,674022E-40 
					                              Private f32_4* %231 = OpVariable Private 
					                                         f32 %242 = OpConstant 3,674022E-40 
					                                       f32_3 %243 = OpConstantComposite %242 %242 %242 
					                                         i32 %251 = OpConstant 6 
					                                             %284 = OpTypePointer Output %7 
					                               Output f32_4* %285 = OpVariable Output 
					                                         u32 %295 = OpConstant 3 
					                                             %296 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %20 = OpAccessChain %16 %18 
					                                        f32_4 %21 = OpLoad %20 
					                                        f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                                        f32_2 %23 = OpFMul %13 %22 
					                               Uniform f32_4* %24 = OpAccessChain %16 %18 
					                                        f32_4 %25 = OpLoad %24 
					                                        f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                                        f32_2 %27 = OpFAdd %23 %26 
					                                        f32_4 %28 = OpLoad %9 
					                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
					                                                      OpStore %9 %29 
					                                 Private f32* %39 = OpAccessChain %34 %35 %37 
					                                                      OpStore %39 %36 
					                                 Private f32* %42 = OpAccessChain %34 %40 %37 
					                                                      OpStore %42 %41 
					                                 Private f32* %44 = OpAccessChain %34 %43 %37 
					                                                      OpStore %44 %41 
					                                 Private f32* %46 = OpAccessChain %34 %45 %37 
					                                                      OpStore %46 %41 
					                                 Private f32* %48 = OpAccessChain %34 %47 %37 
					                                                      OpStore %48 %41 
					                                 Private f32* %50 = OpAccessChain %34 %49 %37 
					                                                      OpStore %50 %41 
					                                 Private f32* %54 = OpAccessChain %53 %37 
					                                                      OpStore %54 %36 
					                                 Private f32* %56 = OpAccessChain %53 %55 
					                                                      OpStore %56 %36 
					                                 Private f32* %58 = OpAccessChain %53 %57 
					                                                      OpStore %58 %36 
					                                                      OpStore %60 %61 
					                                                      OpBranch %62 
					                                              %62 = OpLabel 
					                                                      OpLoopMerge %64 %65 None 
					                                                      OpBranch %66 
					                                              %66 = OpLabel 
					                                                      OpBranchConditional %68 %63 %64 
					                                              %63 = OpLabel 
					                                          i32 %71 = OpLoad %60 
					                                         bool %72 = OpSLessThan %40 %71 
					                                                      OpStore %70 %72 
					                                         bool %73 = OpLoad %70 
					                                                      OpSelectionMerge %75 None 
					                                                      OpBranchConditional %73 %74 %75 
					                                              %74 = OpLabel 
					                                                      OpBranch %64 
					                                              %75 = OpLabel 
					                                          i32 %80 = OpLoad %60 
					                                        i32_2 %81 = OpCompositeConstruct %80 %80 
					                                        i32_2 %83 = OpIAdd %81 %82 
					                                                      OpStore %79 %83 
					                                 Private i32* %85 = OpAccessChain %79 %37 
					                                          i32 %86 = OpLoad %85 
					                                 Private f32* %87 = OpAccessChain %34 %86 %37 
					                                          f32 %88 = OpLoad %87 
					                                                      OpStore %84 %88 
					                                          i32 %90 = OpLoad %60 
					                                          f32 %91 = OpConvertSToF %90 
					                                                      OpStore %89 %91 
					                                          f32 %94 = OpLoad %89 
					                                 Uniform f32* %96 = OpAccessChain %16 %47 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFMul %94 %97 
					                                 Private f32* %99 = OpAccessChain %93 %37 
					                                                      OpStore %99 %98 
					                                       f32_3 %101 = OpLoad %53 
					                                       f32_4 %102 = OpLoad %100 
					                                       f32_4 %103 = OpVectorShuffle %102 %101 4 1 5 6 
					                                                      OpStore %100 %103 
					                                                      OpStore %104 %61 
					                                                      OpBranch %105 
					                                             %105 = OpLabel 
					                                                      OpLoopMerge %107 %108 None 
					                                                      OpBranch %109 
					                                             %109 = OpLabel 
					                                                      OpBranchConditional %68 %106 %107 
					                                             %106 = OpLabel 
					                                         i32 %111 = OpLoad %104 
					                                        bool %112 = OpSLessThan %40 %111 
					                                                      OpStore %110 %112 
					                                        bool %113 = OpLoad %110 
					                                                      OpSelectionMerge %115 None 
					                                                      OpBranchConditional %113 %114 %115 
					                                             %114 = OpLabel 
					                                                      OpBranch %107 
					                                             %115 = OpLabel 
					                                         i32 %118 = OpLoad %104 
					                                       i32_2 %119 = OpCompositeConstruct %118 %118 
					                                       i32_2 %120 = OpIAdd %119 %82 
					                                                      OpStore %117 %120 
					                                Private i32* %122 = OpAccessChain %117 %37 
					                                         i32 %123 = OpLoad %122 
					                                Private f32* %124 = OpAccessChain %34 %123 %37 
					                                         f32 %125 = OpLoad %124 
					                                                      OpStore %121 %125 
					                                         f32 %126 = OpLoad %84 
					                                         f32 %127 = OpLoad %121 
					                                         f32 %128 = OpFMul %126 %127 
					                                                      OpStore %121 %128 
					                                         i32 %130 = OpLoad %104 
					                                         f32 %131 = OpConvertSToF %130 
					                                Private f32* %132 = OpAccessChain %129 %37 
					                                                      OpStore %132 %131 
					                                Private f32* %133 = OpAccessChain %129 %37 
					                                         f32 %134 = OpLoad %133 
					                                Uniform f32* %135 = OpAccessChain %16 %47 
					                                         f32 %136 = OpLoad %135 
					                                         f32 %137 = OpFMul %134 %136 
					                                Private f32* %138 = OpAccessChain %93 %55 
					                                                      OpStore %138 %137 
					                                       f32_4 %139 = OpLoad %9 
					                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
					                              Uniform f32_4* %142 = OpAccessChain %16 %141 
					                                       f32_4 %143 = OpLoad %142 
					                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
					                                       f32_2 %145 = OpFMul %140 %144 
					                                       f32_2 %146 = OpLoad %93 
					                                       f32_2 %147 = OpFAdd %145 %146 
					                                                      OpStore %129 %147 
					                                       f32_2 %148 = OpLoad %129 
					                              Uniform f32_4* %149 = OpAccessChain %16 %141 
					                                       f32_4 %150 = OpLoad %149 
					                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
					                                       f32_2 %152 = OpFDiv %148 %151 
					                                                      OpStore %129 %152 
					                         read_only Texture2D %157 = OpLoad %156 
					                                     sampler %161 = OpLoad %160 
					                  read_only Texture2DSampled %163 = OpSampledImage %157 %161 
					                                       f32_2 %164 = OpLoad %129 
					                                       f32_4 %165 = OpImageSampleImplicitLod %163 %164 
					                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
					                                                      OpStore %153 %166 
					                                         f32 %167 = OpLoad %121 
					                                       f32_3 %168 = OpCompositeConstruct %167 %167 %167 
					                                       f32_3 %169 = OpLoad %153 
					                                       f32_3 %170 = OpFMul %168 %169 
					                                       f32_4 %171 = OpLoad %100 
					                                       f32_3 %172 = OpVectorShuffle %171 %171 0 2 3 
					                                       f32_3 %173 = OpFAdd %170 %172 
					                                       f32_4 %174 = OpLoad %100 
					                                       f32_4 %175 = OpVectorShuffle %174 %173 4 1 5 6 
					                                                      OpStore %100 %175 
					                                Private i32* %176 = OpAccessChain %117 %55 
					                                         i32 %177 = OpLoad %176 
					                                                      OpStore %104 %177 
					                                                      OpBranch %108 
					                                             %108 = OpLabel 
					                                                      OpBranch %105 
					                                             %107 = OpLabel 
					                                       f32_4 %178 = OpLoad %100 
					                                       f32_3 %179 = OpVectorShuffle %178 %178 0 2 3 
					                                                      OpStore %53 %179 
					                                Private i32* %180 = OpAccessChain %79 %55 
					                                         i32 %181 = OpLoad %180 
					                                                      OpStore %60 %181 
					                                                      OpBranch %65 
					                                              %65 = OpLabel 
					                                                      OpBranch %62 
					                                              %64 = OpLabel 
					                                Uniform f32* %183 = OpAccessChain %16 %40 
					                                         f32 %184 = OpLoad %183 
					                                         f32 %186 = OpFMul %184 %185 
					                                                      OpStore %182 %186 
					                                       f32_4 %187 = OpLoad %9 
					                                       f32_2 %188 = OpVectorShuffle %187 %187 0 1 
					                                       f32_2 %189 = OpFNegate %188 
					                                Uniform f32* %190 = OpAccessChain %16 %45 
					                                         f32 %191 = OpLoad %190 
					                                Uniform f32* %192 = OpAccessChain %16 %49 
					                                         f32 %193 = OpLoad %192 
					                                       f32_2 %194 = OpCompositeConstruct %191 %193 
					                                       f32_2 %195 = OpFAdd %189 %194 
					                                       f32_4 %196 = OpLoad %100 
					                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 2 3 
					                                                      OpStore %100 %197 
					                                       f32_4 %198 = OpLoad %100 
					                                       f32_2 %199 = OpVectorShuffle %198 %198 0 1 
					                                       f32_4 %200 = OpLoad %100 
					                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
					                                         f32 %202 = OpDot %199 %201 
					                                                      OpStore %84 %202 
					                                         f32 %203 = OpLoad %84 
					                                         f32 %204 = OpExtInst %1 31 %203 
					                                                      OpStore %84 %204 
					                                         f32 %205 = OpLoad %84 
					                                Uniform f32* %206 = OpAccessChain %16 %43 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFNegate %207 
					                                         f32 %209 = OpFAdd %205 %208 
					                                                      OpStore %84 %209 
					                                         f32 %211 = OpLoad %182 
					                                         f32 %212 = OpFDiv %210 %211 
					                                                      OpStore %182 %212 
					                                         f32 %213 = OpLoad %182 
					                                         f32 %214 = OpLoad %84 
					                                         f32 %215 = OpFMul %213 %214 
					                                                      OpStore %182 %215 
					                                         f32 %216 = OpLoad %182 
					                                         f32 %217 = OpExtInst %1 43 %216 %36 %210 
					                                                      OpStore %182 %217 
					                                         f32 %218 = OpLoad %182 
					                                         f32 %220 = OpFMul %218 %219 
					                                         f32 %222 = OpFAdd %220 %221 
					                                                      OpStore %84 %222 
					                                         f32 %223 = OpLoad %182 
					                                         f32 %224 = OpLoad %182 
					                                         f32 %225 = OpFMul %223 %224 
					                                                      OpStore %182 %225 
					                                         f32 %226 = OpLoad %84 
					                                         f32 %227 = OpFNegate %226 
					                                         f32 %228 = OpLoad %182 
					                                         f32 %229 = OpFMul %227 %228 
					                                         f32 %230 = OpFAdd %229 %210 
					                                                      OpStore %182 %230 
					                         read_only Texture2D %232 = OpLoad %156 
					                                     sampler %233 = OpLoad %160 
					                  read_only Texture2DSampled %234 = OpSampledImage %232 %233 
					                                       f32_4 %235 = OpLoad %9 
					                                       f32_2 %236 = OpVectorShuffle %235 %235 0 1 
					                                       f32_4 %237 = OpImageSampleImplicitLod %234 %236 
					                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
					                                       f32_4 %239 = OpLoad %231 
					                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 2 6 
					                                                      OpStore %231 %240 
					                                       f32_3 %241 = OpLoad %53 
					                                       f32_3 %244 = OpFMul %241 %243 
					                                       f32_4 %245 = OpLoad %231 
					                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 3 
					                                       f32_3 %247 = OpFNegate %246 
					                                       f32_3 %248 = OpFAdd %244 %247 
					                                       f32_4 %249 = OpLoad %100 
					                                       f32_4 %250 = OpVectorShuffle %249 %248 4 5 6 3 
					                                                      OpStore %100 %250 
					                                Uniform f32* %252 = OpAccessChain %16 %251 
					                                         f32 %253 = OpLoad %252 
					                                Uniform f32* %254 = OpAccessChain %16 %251 
					                                         f32 %255 = OpLoad %254 
					                                Uniform f32* %256 = OpAccessChain %16 %251 
					                                         f32 %257 = OpLoad %256 
					                                       f32_3 %258 = OpCompositeConstruct %253 %255 %257 
					                                         f32 %259 = OpCompositeExtract %258 0 
					                                         f32 %260 = OpCompositeExtract %258 1 
					                                         f32 %261 = OpCompositeExtract %258 2 
					                                       f32_3 %262 = OpCompositeConstruct %259 %260 %261 
					                                       f32_4 %263 = OpLoad %100 
					                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
					                                       f32_3 %265 = OpFMul %262 %264 
					                                       f32_4 %266 = OpLoad %231 
					                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 3 
					                                       f32_3 %268 = OpFAdd %265 %267 
					                                       f32_4 %269 = OpLoad %9 
					                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 2 6 
					                                                      OpStore %9 %270 
					                                         f32 %271 = OpLoad %182 
					                                         f32 %272 = OpFNegate %271 
					                                         f32 %273 = OpFAdd %272 %210 
					                                                      OpStore %182 %273 
					                                         f32 %274 = OpLoad %182 
					                                Uniform f32* %275 = OpAccessChain %16 %35 
					                                         f32 %276 = OpLoad %275 
					                                         f32 %277 = OpFMul %274 %276 
					                                                      OpStore %182 %277 
					                                       f32_3 %278 = OpLoad %53 
					                                       f32_3 %279 = OpFMul %278 %243 
					                                       f32_4 %280 = OpLoad %9 
					                                       f32_3 %281 = OpVectorShuffle %280 %280 0 1 3 
					                                       f32_3 %282 = OpFNegate %281 
					                                       f32_3 %283 = OpFAdd %279 %282 
					                                                      OpStore %53 %283 
					                                         f32 %286 = OpLoad %182 
					                                       f32_3 %287 = OpCompositeConstruct %286 %286 %286 
					                                       f32_3 %288 = OpLoad %53 
					                                       f32_3 %289 = OpFMul %287 %288 
					                                       f32_4 %290 = OpLoad %9 
					                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 3 
					                                       f32_3 %292 = OpFAdd %289 %291 
					                                       f32_4 %293 = OpLoad %285 
					                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
					                                                      OpStore %285 %294 
					                                 Output f32* %297 = OpAccessChain %285 %295 
					                                                      OpStore %297 %210 
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
						float _Radius;
						float _SpotSize;
						float _CenterX;
						float _CenterY;
						float _Alpha;
						float _Alpha2;
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					ivec2 u_xlati2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					float u_xlat10;
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
					    u_xlat10 = _SpotSize * 0.150000006;
					    u_xlat2.xy = (-u_xlat0.xy) + vec2(_CenterX, _CenterY);
					    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat15 = u_xlat15 + (-_Radius);
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat10 = u_xlat10 * u_xlat15;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat15 = u_xlat10 * -2.0 + 3.0;
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat10 = (-u_xlat15) * u_xlat10 + 1.0;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyw = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat10_2.xyz);
					    u_xlat0.xyw = vec3(vec3(_Alpha2, _Alpha2, _Alpha2)) * u_xlat0.xyw + u_xlat10_2.xyz;
					    u_xlat10 = (-u_xlat10) + 1.0;
					    u_xlat10 = u_xlat10 * _Alpha;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat0.xyw);
					    SV_Target0.xyz = vec3(u_xlat10) * u_xlat1.xyz + u_xlat0.xyw;
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