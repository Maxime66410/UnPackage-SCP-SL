Shader "CameraFilterPack/FX_Hexagon_Black" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(0.2, 10)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 30997
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
					uniform 	vec4 _ScreenResolution;
					uniform 	float _Value;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bool u_xlatb2;
					vec2 u_xlat3;
					bvec2 u_xlatb3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb7;
					bool u_xlatb8;
					vec2 u_xlat9;
					vec2 u_xlat12;
					bvec2 u_xlatb12;
					float u_xlat19;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat1 = _ScreenResolution.x * _Value;
					    u_xlat7.xyz = vec3(u_xlat1) * vec3(0.0108253174, 0.00937500037, 0.0108253174);
					    u_xlat2.xyz = u_xlat12.yxy / u_xlat7.yxy;
					    u_xlatb12.xy = greaterThanEqual(u_xlat2.yzyz, (-u_xlat2.yzyz)).xy;
					    u_xlat3.xy = fract(abs(u_xlat2.yz));
					    u_xlat2.xyz = floor(u_xlat2.xyz);
					    u_xlat12.x = (u_xlatb12.x) ? u_xlat3.x : (-u_xlat3.x);
					    u_xlat12.y = (u_xlatb12.y) ? u_xlat3.y : (-u_xlat3.y);
					    u_xlat12.xy = u_xlat7.zy * u_xlat12.xy;
					    u_xlat7.xy = vec2(u_xlat1) * vec2(0.00312500005, 0.00541265868);
					    u_xlat19 = u_xlat7.x / u_xlat7.y;
					    u_xlat3.x = u_xlat12.x * u_xlat19;
					    u_xlat7.x = u_xlat12.x * u_xlat19 + (-u_xlat7.x);
					    u_xlatb7 = u_xlat12.y<u_xlat7.x;
					    u_xlat9.xy = vec2(u_xlat1) * vec2(0.00312500005, 0.00625000009) + (-u_xlat3.xx);
					    u_xlatb19 = u_xlat12.y<u_xlat3.x;
					    u_xlatb3.xy = lessThan(u_xlat12.yyyy, u_xlat9.xyxx).xy;
					    u_xlatb12.x = u_xlat7.y<u_xlat12.x;
					    u_xlat4 = u_xlat2.yzyz + vec4(-1.0, -1.0, -1.0, 0.0);
					    u_xlat5.z = (u_xlatb3.y) ? u_xlat4.y : u_xlat2.z;
					    u_xlat5.xy = u_xlat2.yz + vec2(0.0, -1.0);
					    u_xlat9.xy = (bool(u_xlatb19)) ? u_xlat5.xy : u_xlat4.zw;
					    u_xlat12.xy = (u_xlatb12.x) ? u_xlat5.xz : u_xlat9.xy;
					    u_xlat2.w = (u_xlatb7) ? u_xlat4.y : u_xlat2.z;
					    u_xlat7.xz = (u_xlatb3.x) ? u_xlat4.xy : u_xlat2.yw;
					    u_xlat2.x = u_xlat2.x * 0.5;
					    u_xlatb8 = u_xlat2.x>=(-u_xlat2.x);
					    u_xlat2.x = fract(abs(u_xlat2.x));
					    u_xlat2.x = (u_xlatb8) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlatb2 = 0.0<u_xlat2.x;
					    u_xlat12.xy = (bool(u_xlatb2)) ? u_xlat7.xz : u_xlat12.xy;
					    u_xlat7.x = u_xlat12.y * 0.5;
					    u_xlatb19 = u_xlat7.x>=(-u_xlat7.x);
					    u_xlat7.x = fract(abs(u_xlat7.x));
					    u_xlat7.x = (u_xlatb19) ? u_xlat7.x : (-u_xlat7.x);
					    u_xlat7.x = dot(u_xlat7.xx, u_xlat7.yy);
					    u_xlat12.x = dot(u_xlat12.xx, u_xlat7.yy);
					    u_xlat2.x = (-u_xlat7.x) + u_xlat12.x;
					    u_xlat12.x = u_xlat1 * 0.00937500037;
					    u_xlat2.y = u_xlat12.x * u_xlat12.y;
					    u_xlat12.xy = vec2(u_xlat1) * vec2(0.0108253174, 0.00625000009) + u_xlat2.xy;
					    u_xlat0.xy = (-u_xlat0.xy) * _ScreenResolution.xy + u_xlat12.xy;
					    u_xlat12.xy = u_xlat12.xy / _ScreenResolution.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat12.xy);
					    u_xlat6 = dot(abs(u_xlat0.xy), vec2(0.5, 0.866025388));
					    u_xlat0.x = max(abs(u_xlat0.x), u_xlat6);
					    u_xlat6 = u_xlat1 * 0.00625000009 + -1.0;
					    u_xlat12.x = u_xlat1 * 0.00625000009 + (-u_xlat6);
					    u_xlat0.x = u_xlat0.x * 1.15470052 + (-u_xlat6);
					    u_xlat6 = float(1.0) / u_xlat12.x;
					    u_xlat0.x = u_xlat6 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6) * u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat10_2.xyz;
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
					; Bound: 458
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %448 
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
					                                              OpDecorate %372 RelaxedPrecision 
					                                              OpDecorate %375 RelaxedPrecision 
					                                              OpDecorate %375 DescriptorSet 375 
					                                              OpDecorate %375 Binding 375 
					                                              OpDecorate %376 RelaxedPrecision 
					                                              OpDecorate %379 RelaxedPrecision 
					                                              OpDecorate %379 DescriptorSet 379 
					                                              OpDecorate %379 Binding 379 
					                                              OpDecorate %380 RelaxedPrecision 
					                                              OpDecorate %385 RelaxedPrecision 
					                                              OpDecorate %448 Location 448 
					                                              OpDecorate %451 RelaxedPrecision 
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
					                                  i32 %30 = OpConstant 0 
					                                      %35 = OpTypePointer Private %6 
					                         Private f32* %36 = OpVariable Private 
					                                      %37 = OpTypeInt 32 0 
					                                  u32 %38 = OpConstant 0 
					                                      %39 = OpTypePointer Uniform %6 
					                                  i32 %42 = OpConstant 1 
					                                      %46 = OpTypeVector %6 3 
					                                      %47 = OpTypePointer Private %46 
					                       Private f32_3* %48 = OpVariable Private 
					                                  f32 %51 = OpConstant 3,674022E-40 
					                                  f32 %52 = OpConstant 3,674022E-40 
					                                f32_3 %53 = OpConstantComposite %51 %52 %51 
					                                      %55 = OpTypePointer Private %13 
					                       Private f32_4* %56 = OpVariable Private 
					                                      %64 = OpTypeBool 
					                                      %65 = OpTypeVector %64 2 
					                                      %66 = OpTypePointer Private %65 
					                      Private bool_2* %67 = OpVariable Private 
					                                      %73 = OpTypeVector %64 4 
					                       Private f32_2* %76 = OpVariable Private 
					                                      %86 = OpTypePointer Private %64 
					                                      %89 = OpTypePointer Function %6 
					                                 u32 %101 = OpConstant 1 
					                                 f32 %121 = OpConstant 3,674022E-40 
					                                 f32 %122 = OpConstant 3,674022E-40 
					                               f32_2 %123 = OpConstantComposite %121 %122 
					                        Private f32* %127 = OpVariable Private 
					                       Private bool* %147 = OpVariable Private 
					                      Private f32_2* %153 = OpVariable Private 
					                                 f32 %156 = OpConstant 3,674022E-40 
					                               f32_2 %157 = OpConstantComposite %121 %156 
					                       Private bool* %163 = OpVariable Private 
					                     Private bool_2* %169 = OpVariable Private 
					                      Private f32_4* %182 = OpVariable Private 
					                                 f32 %185 = OpConstant 3,674022E-40 
					                                 f32 %186 = OpConstant 3,674022E-40 
					                               f32_4 %187 = OpConstantComposite %185 %185 %185 %186 
					                      Private f32_3* %189 = OpVariable Private 
					                                 u32 %198 = OpConstant 2 
					                               f32_2 %205 = OpConstantComposite %186 %185 
					                                     %210 = OpTypePointer Function %7 
					                                 u32 %240 = OpConstant 3 
					                                 f32 %257 = OpConstant 3,674022E-40 
					                       Private bool* %260 = OpVariable Private 
					                       Private bool* %284 = OpVariable Private 
					                               f32_2 %354 = OpConstantComposite %51 %156 
					                      Private f32_3* %372 = OpVariable Private 
					                                     %373 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %374 = OpTypePointer UniformConstant %373 
					UniformConstant read_only Texture2D* %375 = OpVariable UniformConstant 
					                                     %377 = OpTypeSampler 
					                                     %378 = OpTypePointer UniformConstant %377 
					            UniformConstant sampler* %379 = OpVariable UniformConstant 
					                                     %381 = OpTypeSampledImage %373 
					                        Private f32* %386 = OpVariable Private 
					                                 f32 %389 = OpConstant 3,674022E-40 
					                               f32_2 %390 = OpConstantComposite %257 %389 
					                                 f32 %409 = OpConstant 3,674022E-40 
					                                 f32 %415 = OpConstant 3,674022E-40 
					                                 f32 %430 = OpConstant 3,674022E-40 
					                                 f32 %432 = OpConstant 3,674022E-40 
					                                     %447 = OpTypePointer Output %13 
					                       Output f32_4* %448 = OpVariable Output 
					                                     %455 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function f32* %90 = OpVariable Function 
					                       Function f32* %104 = OpVariable Function 
					                       Function f32* %192 = OpVariable Function 
					                     Function f32_2* %211 = OpVariable Function 
					                     Function f32_2* %222 = OpVariable Function 
					                       Function f32* %231 = OpVariable Function 
					                     Function f32_2* %244 = OpVariable Function 
					                       Function f32* %273 = OpVariable Function 
					                     Function f32_2* %289 = OpVariable Function 
					                       Function f32* %313 = OpVariable Function 
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
					                                f32_2 %29 = OpLoad %9 
					                       Uniform f32_4* %31 = OpAccessChain %16 %30 
					                                f32_4 %32 = OpLoad %31 
					                                f32_2 %33 = OpVectorShuffle %32 %32 0 1 
					                                f32_2 %34 = OpFMul %29 %33 
					                                              OpStore %28 %34 
					                         Uniform f32* %40 = OpAccessChain %16 %30 %38 
					                                  f32 %41 = OpLoad %40 
					                         Uniform f32* %43 = OpAccessChain %16 %42 
					                                  f32 %44 = OpLoad %43 
					                                  f32 %45 = OpFMul %41 %44 
					                                              OpStore %36 %45 
					                                  f32 %49 = OpLoad %36 
					                                f32_3 %50 = OpCompositeConstruct %49 %49 %49 
					                                f32_3 %54 = OpFMul %50 %53 
					                                              OpStore %48 %54 
					                                f32_2 %57 = OpLoad %28 
					                                f32_3 %58 = OpVectorShuffle %57 %57 1 0 1 
					                                f32_3 %59 = OpLoad %48 
					                                f32_3 %60 = OpVectorShuffle %59 %59 1 0 1 
					                                f32_3 %61 = OpFDiv %58 %60 
					                                f32_4 %62 = OpLoad %56 
					                                f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
					                                              OpStore %56 %63 
					                                f32_4 %68 = OpLoad %56 
					                                f32_4 %69 = OpVectorShuffle %68 %68 1 2 1 2 
					                                f32_4 %70 = OpLoad %56 
					                                f32_4 %71 = OpVectorShuffle %70 %70 1 2 1 2 
					                                f32_4 %72 = OpFNegate %71 
					                               bool_4 %74 = OpFOrdGreaterThanEqual %69 %72 
					                               bool_2 %75 = OpVectorShuffle %74 %74 0 1 
					                                              OpStore %67 %75 
					                                f32_4 %77 = OpLoad %56 
					                                f32_2 %78 = OpVectorShuffle %77 %77 1 2 
					                                f32_2 %79 = OpExtInst %1 4 %78 
					                                f32_2 %80 = OpExtInst %1 10 %79 
					                                              OpStore %76 %80 
					                                f32_4 %81 = OpLoad %56 
					                                f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
					                                f32_3 %83 = OpExtInst %1 8 %82 
					                                f32_4 %84 = OpLoad %56 
					                                f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
					                                              OpStore %56 %85 
					                        Private bool* %87 = OpAccessChain %67 %38 
					                                 bool %88 = OpLoad %87 
					                                              OpSelectionMerge %92 None 
					                                              OpBranchConditional %88 %91 %95 
					                                      %91 = OpLabel 
					                         Private f32* %93 = OpAccessChain %76 %38 
					                                  f32 %94 = OpLoad %93 
					                                              OpStore %90 %94 
					                                              OpBranch %92 
					                                      %95 = OpLabel 
					                         Private f32* %96 = OpAccessChain %76 %38 
					                                  f32 %97 = OpLoad %96 
					                                  f32 %98 = OpFNegate %97 
					                                              OpStore %90 %98 
					                                              OpBranch %92 
					                                      %92 = OpLabel 
					                                  f32 %99 = OpLoad %90 
					                        Private f32* %100 = OpAccessChain %28 %38 
					                                              OpStore %100 %99 
					                       Private bool* %102 = OpAccessChain %67 %101 
					                                bool %103 = OpLoad %102 
					                                              OpSelectionMerge %106 None 
					                                              OpBranchConditional %103 %105 %109 
					                                     %105 = OpLabel 
					                        Private f32* %107 = OpAccessChain %76 %101 
					                                 f32 %108 = OpLoad %107 
					                                              OpStore %104 %108 
					                                              OpBranch %106 
					                                     %109 = OpLabel 
					                        Private f32* %110 = OpAccessChain %76 %101 
					                                 f32 %111 = OpLoad %110 
					                                 f32 %112 = OpFNegate %111 
					                                              OpStore %104 %112 
					                                              OpBranch %106 
					                                     %106 = OpLabel 
					                                 f32 %113 = OpLoad %104 
					                        Private f32* %114 = OpAccessChain %28 %101 
					                                              OpStore %114 %113 
					                               f32_3 %115 = OpLoad %48 
					                               f32_2 %116 = OpVectorShuffle %115 %115 2 1 
					                               f32_2 %117 = OpLoad %28 
					                               f32_2 %118 = OpFMul %116 %117 
					                                              OpStore %28 %118 
					                                 f32 %119 = OpLoad %36 
					                               f32_2 %120 = OpCompositeConstruct %119 %119 
					                               f32_2 %124 = OpFMul %120 %123 
					                               f32_3 %125 = OpLoad %48 
					                               f32_3 %126 = OpVectorShuffle %125 %124 3 4 2 
					                                              OpStore %48 %126 
					                        Private f32* %128 = OpAccessChain %48 %38 
					                                 f32 %129 = OpLoad %128 
					                        Private f32* %130 = OpAccessChain %48 %101 
					                                 f32 %131 = OpLoad %130 
					                                 f32 %132 = OpFDiv %129 %131 
					                                              OpStore %127 %132 
					                        Private f32* %133 = OpAccessChain %28 %38 
					                                 f32 %134 = OpLoad %133 
					                                 f32 %135 = OpLoad %127 
					                                 f32 %136 = OpFMul %134 %135 
					                        Private f32* %137 = OpAccessChain %76 %38 
					                                              OpStore %137 %136 
					                        Private f32* %138 = OpAccessChain %28 %38 
					                                 f32 %139 = OpLoad %138 
					                                 f32 %140 = OpLoad %127 
					                                 f32 %141 = OpFMul %139 %140 
					                        Private f32* %142 = OpAccessChain %48 %38 
					                                 f32 %143 = OpLoad %142 
					                                 f32 %144 = OpFNegate %143 
					                                 f32 %145 = OpFAdd %141 %144 
					                        Private f32* %146 = OpAccessChain %48 %38 
					                                              OpStore %146 %145 
					                        Private f32* %148 = OpAccessChain %28 %101 
					                                 f32 %149 = OpLoad %148 
					                        Private f32* %150 = OpAccessChain %48 %38 
					                                 f32 %151 = OpLoad %150 
					                                bool %152 = OpFOrdLessThan %149 %151 
					                                              OpStore %147 %152 
					                                 f32 %154 = OpLoad %36 
					                               f32_2 %155 = OpCompositeConstruct %154 %154 
					                               f32_2 %158 = OpFMul %155 %157 
					                               f32_2 %159 = OpLoad %76 
					                               f32_2 %160 = OpVectorShuffle %159 %159 0 0 
					                               f32_2 %161 = OpFNegate %160 
					                               f32_2 %162 = OpFAdd %158 %161 
					                                              OpStore %153 %162 
					                        Private f32* %164 = OpAccessChain %28 %101 
					                                 f32 %165 = OpLoad %164 
					                        Private f32* %166 = OpAccessChain %76 %38 
					                                 f32 %167 = OpLoad %166 
					                                bool %168 = OpFOrdLessThan %165 %167 
					                                              OpStore %163 %168 
					                               f32_2 %170 = OpLoad %28 
					                               f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
					                               f32_2 %172 = OpLoad %153 
					                               f32_4 %173 = OpVectorShuffle %172 %172 0 1 0 0 
					                              bool_4 %174 = OpFOrdLessThan %171 %173 
					                              bool_2 %175 = OpVectorShuffle %174 %174 0 1 
					                                              OpStore %169 %175 
					                        Private f32* %176 = OpAccessChain %48 %101 
					                                 f32 %177 = OpLoad %176 
					                        Private f32* %178 = OpAccessChain %28 %38 
					                                 f32 %179 = OpLoad %178 
					                                bool %180 = OpFOrdLessThan %177 %179 
					                       Private bool* %181 = OpAccessChain %67 %38 
					                                              OpStore %181 %180 
					                               f32_4 %183 = OpLoad %56 
					                               f32_4 %184 = OpVectorShuffle %183 %183 1 2 1 2 
					                               f32_4 %188 = OpFAdd %184 %187 
					                                              OpStore %182 %188 
					                       Private bool* %190 = OpAccessChain %169 %101 
					                                bool %191 = OpLoad %190 
					                                              OpSelectionMerge %194 None 
					                                              OpBranchConditional %191 %193 %197 
					                                     %193 = OpLabel 
					                        Private f32* %195 = OpAccessChain %182 %101 
					                                 f32 %196 = OpLoad %195 
					                                              OpStore %192 %196 
					                                              OpBranch %194 
					                                     %197 = OpLabel 
					                        Private f32* %199 = OpAccessChain %56 %198 
					                                 f32 %200 = OpLoad %199 
					                                              OpStore %192 %200 
					                                              OpBranch %194 
					                                     %194 = OpLabel 
					                                 f32 %201 = OpLoad %192 
					                        Private f32* %202 = OpAccessChain %189 %198 
					                                              OpStore %202 %201 
					                               f32_4 %203 = OpLoad %56 
					                               f32_2 %204 = OpVectorShuffle %203 %203 1 2 
					                               f32_2 %206 = OpFAdd %204 %205 
					                               f32_3 %207 = OpLoad %189 
					                               f32_3 %208 = OpVectorShuffle %207 %206 3 4 2 
					                                              OpStore %189 %208 
					                                bool %209 = OpLoad %163 
					                                              OpSelectionMerge %213 None 
					                                              OpBranchConditional %209 %212 %216 
					                                     %212 = OpLabel 
					                               f32_3 %214 = OpLoad %189 
					                               f32_2 %215 = OpVectorShuffle %214 %214 0 1 
					                                              OpStore %211 %215 
					                                              OpBranch %213 
					                                     %216 = OpLabel 
					                               f32_4 %217 = OpLoad %182 
					                               f32_2 %218 = OpVectorShuffle %217 %217 2 3 
					                                              OpStore %211 %218 
					                                              OpBranch %213 
					                                     %213 = OpLabel 
					                               f32_2 %219 = OpLoad %211 
					                                              OpStore %153 %219 
					                       Private bool* %220 = OpAccessChain %67 %38 
					                                bool %221 = OpLoad %220 
					                                              OpSelectionMerge %224 None 
					                                              OpBranchConditional %221 %223 %227 
					                                     %223 = OpLabel 
					                               f32_3 %225 = OpLoad %189 
					                               f32_2 %226 = OpVectorShuffle %225 %225 0 2 
					                                              OpStore %222 %226 
					                                              OpBranch %224 
					                                     %227 = OpLabel 
					                               f32_2 %228 = OpLoad %153 
					                                              OpStore %222 %228 
					                                              OpBranch %224 
					                                     %224 = OpLabel 
					                               f32_2 %229 = OpLoad %222 
					                                              OpStore %28 %229 
					                                bool %230 = OpLoad %147 
					                                              OpSelectionMerge %233 None 
					                                              OpBranchConditional %230 %232 %236 
					                                     %232 = OpLabel 
					                        Private f32* %234 = OpAccessChain %182 %101 
					                                 f32 %235 = OpLoad %234 
					                                              OpStore %231 %235 
					                                              OpBranch %233 
					                                     %236 = OpLabel 
					                        Private f32* %237 = OpAccessChain %56 %198 
					                                 f32 %238 = OpLoad %237 
					                                              OpStore %231 %238 
					                                              OpBranch %233 
					                                     %233 = OpLabel 
					                                 f32 %239 = OpLoad %231 
					                        Private f32* %241 = OpAccessChain %56 %240 
					                                              OpStore %241 %239 
					                       Private bool* %242 = OpAccessChain %169 %38 
					                                bool %243 = OpLoad %242 
					                                              OpSelectionMerge %246 None 
					                                              OpBranchConditional %243 %245 %249 
					                                     %245 = OpLabel 
					                               f32_4 %247 = OpLoad %182 
					                               f32_2 %248 = OpVectorShuffle %247 %247 0 1 
					                                              OpStore %244 %248 
					                                              OpBranch %246 
					                                     %249 = OpLabel 
					                               f32_4 %250 = OpLoad %56 
					                               f32_2 %251 = OpVectorShuffle %250 %250 1 3 
					                                              OpStore %244 %251 
					                                              OpBranch %246 
					                                     %246 = OpLabel 
					                               f32_2 %252 = OpLoad %244 
					                               f32_3 %253 = OpLoad %48 
					                               f32_3 %254 = OpVectorShuffle %253 %252 3 1 4 
					                                              OpStore %48 %254 
					                        Private f32* %255 = OpAccessChain %56 %38 
					                                 f32 %256 = OpLoad %255 
					                                 f32 %258 = OpFMul %256 %257 
					                        Private f32* %259 = OpAccessChain %56 %38 
					                                              OpStore %259 %258 
					                        Private f32* %261 = OpAccessChain %56 %38 
					                                 f32 %262 = OpLoad %261 
					                        Private f32* %263 = OpAccessChain %56 %38 
					                                 f32 %264 = OpLoad %263 
					                                 f32 %265 = OpFNegate %264 
					                                bool %266 = OpFOrdGreaterThanEqual %262 %265 
					                                              OpStore %260 %266 
					                        Private f32* %267 = OpAccessChain %56 %38 
					                                 f32 %268 = OpLoad %267 
					                                 f32 %269 = OpExtInst %1 4 %268 
					                                 f32 %270 = OpExtInst %1 10 %269 
					                        Private f32* %271 = OpAccessChain %56 %38 
					                                              OpStore %271 %270 
					                                bool %272 = OpLoad %260 
					                                              OpSelectionMerge %275 None 
					                                              OpBranchConditional %272 %274 %278 
					                                     %274 = OpLabel 
					                        Private f32* %276 = OpAccessChain %56 %38 
					                                 f32 %277 = OpLoad %276 
					                                              OpStore %273 %277 
					                                              OpBranch %275 
					                                     %278 = OpLabel 
					                        Private f32* %279 = OpAccessChain %56 %38 
					                                 f32 %280 = OpLoad %279 
					                                 f32 %281 = OpFNegate %280 
					                                              OpStore %273 %281 
					                                              OpBranch %275 
					                                     %275 = OpLabel 
					                                 f32 %282 = OpLoad %273 
					                        Private f32* %283 = OpAccessChain %56 %38 
					                                              OpStore %283 %282 
					                        Private f32* %285 = OpAccessChain %56 %38 
					                                 f32 %286 = OpLoad %285 
					                                bool %287 = OpFOrdLessThan %186 %286 
					                                              OpStore %284 %287 
					                                bool %288 = OpLoad %284 
					                                              OpSelectionMerge %291 None 
					                                              OpBranchConditional %288 %290 %294 
					                                     %290 = OpLabel 
					                               f32_3 %292 = OpLoad %48 
					                               f32_2 %293 = OpVectorShuffle %292 %292 0 2 
					                                              OpStore %289 %293 
					                                              OpBranch %291 
					                                     %294 = OpLabel 
					                               f32_2 %295 = OpLoad %28 
					                                              OpStore %289 %295 
					                                              OpBranch %291 
					                                     %291 = OpLabel 
					                               f32_2 %296 = OpLoad %289 
					                                              OpStore %28 %296 
					                        Private f32* %297 = OpAccessChain %28 %101 
					                                 f32 %298 = OpLoad %297 
					                                 f32 %299 = OpFMul %298 %257 
					                        Private f32* %300 = OpAccessChain %48 %38 
					                                              OpStore %300 %299 
					                        Private f32* %301 = OpAccessChain %48 %38 
					                                 f32 %302 = OpLoad %301 
					                        Private f32* %303 = OpAccessChain %48 %38 
					                                 f32 %304 = OpLoad %303 
					                                 f32 %305 = OpFNegate %304 
					                                bool %306 = OpFOrdGreaterThanEqual %302 %305 
					                                              OpStore %163 %306 
					                        Private f32* %307 = OpAccessChain %48 %38 
					                                 f32 %308 = OpLoad %307 
					                                 f32 %309 = OpExtInst %1 4 %308 
					                                 f32 %310 = OpExtInst %1 10 %309 
					                        Private f32* %311 = OpAccessChain %48 %38 
					                                              OpStore %311 %310 
					                                bool %312 = OpLoad %163 
					                                              OpSelectionMerge %315 None 
					                                              OpBranchConditional %312 %314 %318 
					                                     %314 = OpLabel 
					                        Private f32* %316 = OpAccessChain %48 %38 
					                                 f32 %317 = OpLoad %316 
					                                              OpStore %313 %317 
					                                              OpBranch %315 
					                                     %318 = OpLabel 
					                        Private f32* %319 = OpAccessChain %48 %38 
					                                 f32 %320 = OpLoad %319 
					                                 f32 %321 = OpFNegate %320 
					                                              OpStore %313 %321 
					                                              OpBranch %315 
					                                     %315 = OpLabel 
					                                 f32 %322 = OpLoad %313 
					                        Private f32* %323 = OpAccessChain %48 %38 
					                                              OpStore %323 %322 
					                               f32_3 %324 = OpLoad %48 
					                               f32_2 %325 = OpVectorShuffle %324 %324 0 0 
					                               f32_3 %326 = OpLoad %48 
					                               f32_2 %327 = OpVectorShuffle %326 %326 1 1 
					                                 f32 %328 = OpDot %325 %327 
					                        Private f32* %329 = OpAccessChain %48 %38 
					                                              OpStore %329 %328 
					                               f32_2 %330 = OpLoad %28 
					                               f32_2 %331 = OpVectorShuffle %330 %330 0 0 
					                               f32_3 %332 = OpLoad %48 
					                               f32_2 %333 = OpVectorShuffle %332 %332 1 1 
					                                 f32 %334 = OpDot %331 %333 
					                        Private f32* %335 = OpAccessChain %28 %38 
					                                              OpStore %335 %334 
					                        Private f32* %336 = OpAccessChain %48 %38 
					                                 f32 %337 = OpLoad %336 
					                                 f32 %338 = OpFNegate %337 
					                        Private f32* %339 = OpAccessChain %28 %38 
					                                 f32 %340 = OpLoad %339 
					                                 f32 %341 = OpFAdd %338 %340 
					                        Private f32* %342 = OpAccessChain %56 %38 
					                                              OpStore %342 %341 
					                                 f32 %343 = OpLoad %36 
					                                 f32 %344 = OpFMul %343 %52 
					                        Private f32* %345 = OpAccessChain %28 %38 
					                                              OpStore %345 %344 
					                        Private f32* %346 = OpAccessChain %28 %38 
					                                 f32 %347 = OpLoad %346 
					                        Private f32* %348 = OpAccessChain %28 %101 
					                                 f32 %349 = OpLoad %348 
					                                 f32 %350 = OpFMul %347 %349 
					                        Private f32* %351 = OpAccessChain %56 %101 
					                                              OpStore %351 %350 
					                                 f32 %352 = OpLoad %36 
					                               f32_2 %353 = OpCompositeConstruct %352 %352 
					                               f32_2 %355 = OpFMul %353 %354 
					                               f32_4 %356 = OpLoad %56 
					                               f32_2 %357 = OpVectorShuffle %356 %356 0 1 
					                               f32_2 %358 = OpFAdd %355 %357 
					                                              OpStore %28 %358 
					                               f32_2 %359 = OpLoad %9 
					                               f32_2 %360 = OpFNegate %359 
					                      Uniform f32_4* %361 = OpAccessChain %16 %30 
					                               f32_4 %362 = OpLoad %361 
					                               f32_2 %363 = OpVectorShuffle %362 %362 0 1 
					                               f32_2 %364 = OpFMul %360 %363 
					                               f32_2 %365 = OpLoad %28 
					                               f32_2 %366 = OpFAdd %364 %365 
					                                              OpStore %9 %366 
					                               f32_2 %367 = OpLoad %28 
					                      Uniform f32_4* %368 = OpAccessChain %16 %30 
					                               f32_4 %369 = OpLoad %368 
					                               f32_2 %370 = OpVectorShuffle %369 %369 0 1 
					                               f32_2 %371 = OpFDiv %367 %370 
					                                              OpStore %28 %371 
					                 read_only Texture2D %376 = OpLoad %375 
					                             sampler %380 = OpLoad %379 
					          read_only Texture2DSampled %382 = OpSampledImage %376 %380 
					                               f32_2 %383 = OpLoad %28 
					                               f32_4 %384 = OpImageSampleImplicitLod %382 %383 
					                               f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
					                                              OpStore %372 %385 
					                               f32_2 %387 = OpLoad %9 
					                               f32_2 %388 = OpExtInst %1 4 %387 
					                                 f32 %391 = OpDot %388 %390 
					                                              OpStore %386 %391 
					                        Private f32* %392 = OpAccessChain %9 %38 
					                                 f32 %393 = OpLoad %392 
					                                 f32 %394 = OpExtInst %1 4 %393 
					                                 f32 %395 = OpLoad %386 
					                                 f32 %396 = OpExtInst %1 40 %394 %395 
					                        Private f32* %397 = OpAccessChain %9 %38 
					                                              OpStore %397 %396 
					                                 f32 %398 = OpLoad %36 
					                                 f32 %399 = OpFMul %398 %156 
					                                 f32 %400 = OpFAdd %399 %185 
					                                              OpStore %386 %400 
					                                 f32 %401 = OpLoad %36 
					                                 f32 %402 = OpFMul %401 %156 
					                                 f32 %403 = OpLoad %386 
					                                 f32 %404 = OpFNegate %403 
					                                 f32 %405 = OpFAdd %402 %404 
					                        Private f32* %406 = OpAccessChain %28 %38 
					                                              OpStore %406 %405 
					                        Private f32* %407 = OpAccessChain %9 %38 
					                                 f32 %408 = OpLoad %407 
					                                 f32 %410 = OpFMul %408 %409 
					                                 f32 %411 = OpLoad %386 
					                                 f32 %412 = OpFNegate %411 
					                                 f32 %413 = OpFAdd %410 %412 
					                        Private f32* %414 = OpAccessChain %9 %38 
					                                              OpStore %414 %413 
					                        Private f32* %416 = OpAccessChain %28 %38 
					                                 f32 %417 = OpLoad %416 
					                                 f32 %418 = OpFDiv %415 %417 
					                                              OpStore %386 %418 
					                                 f32 %419 = OpLoad %386 
					                        Private f32* %420 = OpAccessChain %9 %38 
					                                 f32 %421 = OpLoad %420 
					                                 f32 %422 = OpFMul %419 %421 
					                        Private f32* %423 = OpAccessChain %9 %38 
					                                              OpStore %423 %422 
					                        Private f32* %424 = OpAccessChain %9 %38 
					                                 f32 %425 = OpLoad %424 
					                                 f32 %426 = OpExtInst %1 43 %425 %186 %415 
					                        Private f32* %427 = OpAccessChain %9 %38 
					                                              OpStore %427 %426 
					                        Private f32* %428 = OpAccessChain %9 %38 
					                                 f32 %429 = OpLoad %428 
					                                 f32 %431 = OpFMul %429 %430 
					                                 f32 %433 = OpFAdd %431 %432 
					                                              OpStore %386 %433 
					                        Private f32* %434 = OpAccessChain %9 %38 
					                                 f32 %435 = OpLoad %434 
					                        Private f32* %436 = OpAccessChain %9 %38 
					                                 f32 %437 = OpLoad %436 
					                                 f32 %438 = OpFMul %435 %437 
					                        Private f32* %439 = OpAccessChain %9 %38 
					                                              OpStore %439 %438 
					                                 f32 %440 = OpLoad %386 
					                                 f32 %441 = OpFNegate %440 
					                        Private f32* %442 = OpAccessChain %9 %38 
					                                 f32 %443 = OpLoad %442 
					                                 f32 %444 = OpFMul %441 %443 
					                                 f32 %445 = OpFAdd %444 %415 
					                        Private f32* %446 = OpAccessChain %9 %38 
					                                              OpStore %446 %445 
					                               f32_2 %449 = OpLoad %9 
					                               f32_3 %450 = OpVectorShuffle %449 %449 0 0 0 
					                               f32_3 %451 = OpLoad %372 
					                               f32_3 %452 = OpFMul %450 %451 
					                               f32_4 %453 = OpLoad %448 
					                               f32_4 %454 = OpVectorShuffle %453 %452 4 5 6 3 
					                                              OpStore %448 %454 
					                         Output f32* %456 = OpAccessChain %448 %240 
					                                              OpStore %456 %415 
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
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
						float _Value;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bool u_xlatb2;
					vec2 u_xlat3;
					bvec2 u_xlatb3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat6;
					vec3 u_xlat7;
					bool u_xlatb7;
					bool u_xlatb8;
					vec2 u_xlat9;
					vec2 u_xlat12;
					bvec2 u_xlatb12;
					float u_xlat19;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat1 = _ScreenResolution.x * _Value;
					    u_xlat7.xyz = vec3(u_xlat1) * vec3(0.0108253174, 0.00937500037, 0.0108253174);
					    u_xlat2.xyz = u_xlat12.yxy / u_xlat7.yxy;
					    u_xlatb12.xy = greaterThanEqual(u_xlat2.yzyz, (-u_xlat2.yzyz)).xy;
					    u_xlat3.xy = fract(abs(u_xlat2.yz));
					    u_xlat2.xyz = floor(u_xlat2.xyz);
					    u_xlat12.x = (u_xlatb12.x) ? u_xlat3.x : (-u_xlat3.x);
					    u_xlat12.y = (u_xlatb12.y) ? u_xlat3.y : (-u_xlat3.y);
					    u_xlat12.xy = u_xlat7.zy * u_xlat12.xy;
					    u_xlat7.xy = vec2(u_xlat1) * vec2(0.00312500005, 0.00541265868);
					    u_xlat19 = u_xlat7.x / u_xlat7.y;
					    u_xlat3.x = u_xlat12.x * u_xlat19;
					    u_xlat7.x = u_xlat12.x * u_xlat19 + (-u_xlat7.x);
					    u_xlatb7 = u_xlat12.y<u_xlat7.x;
					    u_xlat9.xy = vec2(u_xlat1) * vec2(0.00312500005, 0.00625000009) + (-u_xlat3.xx);
					    u_xlatb19 = u_xlat12.y<u_xlat3.x;
					    u_xlatb3.xy = lessThan(u_xlat12.yyyy, u_xlat9.xyxx).xy;
					    u_xlatb12.x = u_xlat7.y<u_xlat12.x;
					    u_xlat4 = u_xlat2.yzyz + vec4(-1.0, -1.0, -1.0, 0.0);
					    u_xlat5.z = (u_xlatb3.y) ? u_xlat4.y : u_xlat2.z;
					    u_xlat5.xy = u_xlat2.yz + vec2(0.0, -1.0);
					    u_xlat9.xy = (bool(u_xlatb19)) ? u_xlat5.xy : u_xlat4.zw;
					    u_xlat12.xy = (u_xlatb12.x) ? u_xlat5.xz : u_xlat9.xy;
					    u_xlat2.w = (u_xlatb7) ? u_xlat4.y : u_xlat2.z;
					    u_xlat7.xz = (u_xlatb3.x) ? u_xlat4.xy : u_xlat2.yw;
					    u_xlat2.x = u_xlat2.x * 0.5;
					    u_xlatb8 = u_xlat2.x>=(-u_xlat2.x);
					    u_xlat2.x = fract(abs(u_xlat2.x));
					    u_xlat2.x = (u_xlatb8) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlatb2 = 0.0<u_xlat2.x;
					    u_xlat12.xy = (bool(u_xlatb2)) ? u_xlat7.xz : u_xlat12.xy;
					    u_xlat7.x = u_xlat12.y * 0.5;
					    u_xlatb19 = u_xlat7.x>=(-u_xlat7.x);
					    u_xlat7.x = fract(abs(u_xlat7.x));
					    u_xlat7.x = (u_xlatb19) ? u_xlat7.x : (-u_xlat7.x);
					    u_xlat7.x = dot(u_xlat7.xx, u_xlat7.yy);
					    u_xlat12.x = dot(u_xlat12.xx, u_xlat7.yy);
					    u_xlat2.x = (-u_xlat7.x) + u_xlat12.x;
					    u_xlat12.x = u_xlat1 * 0.00937500037;
					    u_xlat2.y = u_xlat12.x * u_xlat12.y;
					    u_xlat12.xy = vec2(u_xlat1) * vec2(0.0108253174, 0.00625000009) + u_xlat2.xy;
					    u_xlat0.xy = (-u_xlat0.xy) * _ScreenResolution.xy + u_xlat12.xy;
					    u_xlat12.xy = u_xlat12.xy / _ScreenResolution.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat12.xy);
					    u_xlat6 = dot(abs(u_xlat0.xy), vec2(0.5, 0.866025388));
					    u_xlat0.x = max(abs(u_xlat0.x), u_xlat6);
					    u_xlat6 = u_xlat1 * 0.00625000009 + -1.0;
					    u_xlat12.x = u_xlat1 * 0.00625000009 + (-u_xlat6);
					    u_xlat0.x = u_xlat0.x * 1.15470052 + (-u_xlat6);
					    u_xlat6 = float(1.0) / u_xlat12.x;
					    u_xlat0.x = u_xlat6 * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat6) * u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat10_2.xyz;
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