Shader "CameraFilterPack/TV_ARCADE" {
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
			GpuProgramID 34250
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
					uniform 	float _TimeX;
					uniform 	float Fade;
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat6.xy = u_xlat6.xy * vec2(2.20000005, 2.20000005);
					    u_xlat1.x = abs(u_xlat6.y) * 0.200000003;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = abs(u_xlat1.x) * 0.25;
					    u_xlat6.x = u_xlat6.x * u_xlat6.x + 1.0;
					    u_xlat1.y = u_xlat6.x * u_xlat6.y;
					    u_xlat6.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat6.xy = u_xlat6.xy * vec2(0.920000017, 0.920000017) + vec2(0.0399999991, 0.0399999991);
					    u_xlat6.xy = (-u_xlat0.xy) + u_xlat6.xy;
					    u_xlat0.xy = vec2(vec2(Fade, Fade)) * u_xlat6.xy + u_xlat0.xy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat6.xy = u_xlat0.yy * vec2(21.0, 29.0);
					    u_xlat6.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat6.xy;
					    u_xlat6.xy = sin(u_xlat6.xy);
					    u_xlat6.x = u_xlat6.y * u_xlat6.x;
					    u_xlat9 = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat9 = u_xlat0.y * 31.0 + u_xlat9;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat6.x = u_xlat9 * u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 0.00170000002 + u_xlat0.x;
					    u_xlat1.x = u_xlat6.x + 0.00100000005;
					    u_xlat1.y = u_xlat0.y + 0.00100000005;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + vec3(0.0199999996, 0.0199999996, 0.0199999996);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_2.xyz;
					    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
					    u_xlat6.x = u_xlat0.x * u_xlat0.y;
					    u_xlat6.x = u_xlat6.x * 16.0;
					    u_xlat2.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat6.x = u_xlat6.x * u_xlat2.x;
					    u_xlat6.x = u_xlat2.y * u_xlat6.x;
					    u_xlat6.x = log2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 0.300000012;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat1.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.66000009, 2.66000009, 2.66000009);
					    u_xlat6.x = u_xlat0.y * _ScreenResolution.y;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xw = vec2(_TimeX) * vec2(3.5, 110.0);
					    u_xlat0.x = u_xlat6.x * 1.5 + u_xlat0.x;
					    u_xlat0.xw = sin(u_xlat0.xw);
					    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 1.70000005;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat9 = u_xlat0.w * 0.00999999978 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_2.xyz;
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
					; Bound: 373
					; Schema: 0
					                                                  OpCapability Shader 
					                                           %1 = OpExtInstImport "GLSL.std.450" 
					                                                  OpMemoryModel Logical GLSL450 
					                                                  OpEntryPoint Fragment %4 "main" %11 %350 
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
					                                                  OpDecorate %194 RelaxedPrecision 
					                                                  OpDecorate %195 RelaxedPrecision 
					                                                  OpDecorate %198 RelaxedPrecision 
					                                                  OpDecorate %199 RelaxedPrecision 
					                                                  OpDecorate %200 RelaxedPrecision 
					                                                  OpDecorate %201 RelaxedPrecision 
					                                                  OpDecorate %202 RelaxedPrecision 
					                                                  OpDecorate %203 RelaxedPrecision 
					                                                  OpDecorate %206 RelaxedPrecision 
					                                                  OpDecorate %207 RelaxedPrecision 
					                                                  OpDecorate %210 RelaxedPrecision 
					                                                  OpDecorate %211 RelaxedPrecision 
					                                                  OpDecorate %212 RelaxedPrecision 
					                                                  OpDecorate %213 RelaxedPrecision 
					                                                  OpDecorate %214 RelaxedPrecision 
					                                                  OpDecorate %215 RelaxedPrecision 
					                                                  OpDecorate %216 RelaxedPrecision 
					                                                  OpDecorate %259 RelaxedPrecision 
					                                                  OpDecorate %273 RelaxedPrecision 
					                                                  OpDecorate %274 RelaxedPrecision 
					                                                  OpDecorate %275 RelaxedPrecision 
					                                                  OpDecorate %279 RelaxedPrecision 
					                                                  OpDecorate %345 RelaxedPrecision 
					                                                  OpDecorate %346 RelaxedPrecision 
					                                                  OpDecorate %347 RelaxedPrecision 
					                                                  OpDecorate %350 Location 350 
					                                                  OpDecorate %364 RelaxedPrecision 
					                                                  OpDecorate %365 RelaxedPrecision 
					                                           %2 = OpTypeVoid 
					                                           %3 = OpTypeFunction %2 
					                                           %6 = OpTypeFloat 32 
					                                           %7 = OpTypeVector %6 2 
					                                           %8 = OpTypePointer Private %7 
					                            Private f32_2* %9 = OpVariable Private 
					                                          %10 = OpTypePointer Input %7 
					                    Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          %13 = OpTypeVector %6 4 
					                                          %14 = OpTypeStruct %6 %6 %13 %13 
					                                          %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32_4; f32_4;}* %16 = OpVariable Uniform 
					                                          %17 = OpTypeInt 32 1 
					                                      i32 %18 = OpConstant 3 
					                                          %19 = OpTypePointer Uniform %13 
					                           Private f32_2* %28 = OpVariable Private 
					                                      f32 %30 = OpConstant 3,674022E-40 
					                                    f32_2 %31 = OpConstantComposite %30 %30 
					                                      f32 %34 = OpConstant 3,674022E-40 
					                                    f32_2 %35 = OpConstantComposite %34 %34 
					                                          %37 = OpTypeVector %6 3 
					                                          %38 = OpTypePointer Private %37 
					                           Private f32_3* %39 = OpVariable Private 
					                                          %40 = OpTypeInt 32 0 
					                                      u32 %41 = OpConstant 1 
					                                          %42 = OpTypePointer Private %6 
					                                      f32 %46 = OpConstant 3,674022E-40 
					                                      u32 %48 = OpConstant 0 
					                                      f32 %55 = OpConstant 3,674022E-40 
					                                      f32 %67 = OpConstant 3,674022E-40 
					                                      f32 %85 = OpConstant 3,674022E-40 
					                                    f32_2 %86 = OpConstantComposite %85 %85 
					                                      f32 %90 = OpConstant 3,674022E-40 
					                                    f32_2 %91 = OpConstantComposite %90 %90 
					                                      f32 %93 = OpConstant 3,674022E-40 
					                                    f32_2 %94 = OpConstantComposite %93 %93 
					                                     i32 %100 = OpConstant 1 
					                                         %101 = OpTypePointer Uniform %6 
					                                     f32 %115 = OpConstant 3,674022E-40 
					                                     f32 %121 = OpConstant 3,674022E-40 
					                                     f32 %122 = OpConstant 3,674022E-40 
					                                   f32_2 %123 = OpConstantComposite %121 %122 
					                                     i32 %125 = OpConstant 0 
					                                     f32 %129 = OpConstant 3,674022E-40 
					                                     f32 %130 = OpConstant 3,674022E-40 
					                                   f32_2 %131 = OpConstantComposite %129 %130 
					                            Private f32* %143 = OpVariable Private 
					                                     f32 %146 = OpConstant 3,674022E-40 
					                                     f32 %151 = OpConstant 3,674022E-40 
					                                     f32 %164 = OpConstant 3,674022E-40 
					                                     f32 %172 = OpConstant 3,674022E-40 
					                          Private f32_3* %179 = OpVariable Private 
					                                         %180 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                         %181 = OpTypePointer UniformConstant %180 
					    UniformConstant read_only Texture2D* %182 = OpVariable UniformConstant 
					                                         %184 = OpTypeSampler 
					                                         %185 = OpTypePointer UniformConstant %184 
					                UniformConstant sampler* %186 = OpVariable UniformConstant 
					                                         %188 = OpTypeSampledImage %180 
					                          Private f32_3* %194 = OpVariable Private 
					                                     f32 %196 = OpConstant 3,674022E-40 
					                                   f32_3 %197 = OpConstantComposite %196 %196 %196 
					                          Private f32_3* %199 = OpVariable Private 
					                                     f32 %204 = OpConstant 3,674022E-40 
					                                   f32_3 %205 = OpConstantComposite %204 %204 %204 
					                                     f32 %208 = OpConstant 3,674022E-40 
					                                   f32_3 %209 = OpConstantComposite %208 %208 %208 
					                                     f32 %225 = OpConstant 3,674022E-40 
					                          Private f32_2* %228 = OpVariable Private 
					                                   f32_2 %231 = OpConstantComposite %55 %55 
					                                     f32 %262 = OpConstant 3,674022E-40 
					                                   f32_3 %263 = OpConstantComposite %262 %262 %262 
					                                     i32 %267 = OpConstant 2 
					                                         %272 = OpTypePointer Private %13 
					                          Private f32_4* %273 = OpVariable Private 
					                            Private f32* %282 = OpVariable Private 
					                                     f32 %285 = OpConstant 3,674022E-40 
					                                     f32 %289 = OpConstant 3,674022E-40 
					                                     f32 %300 = OpConstant 3,674022E-40 
					                                     f32 %310 = OpConstant 3,674022E-40 
					                                     f32 %328 = OpConstant 3,674022E-40 
					                                     f32 %337 = OpConstant 3,674022E-40 
					                                         %349 = OpTypePointer Output %13 
					                           Output f32_4* %350 = OpVariable Output 
					                                     u32 %369 = OpConstant 3 
					                                         %370 = OpTypePointer Output %6 
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
					                                    f32_2 %29 = OpLoad %9 
					                                    f32_2 %32 = OpFAdd %29 %31 
					                                                  OpStore %28 %32 
					                                    f32_2 %33 = OpLoad %28 
					                                    f32_2 %36 = OpFMul %33 %35 
					                                                  OpStore %28 %36 
					                             Private f32* %43 = OpAccessChain %28 %41 
					                                      f32 %44 = OpLoad %43 
					                                      f32 %45 = OpExtInst %1 4 %44 
					                                      f32 %47 = OpFMul %45 %46 
					                             Private f32* %49 = OpAccessChain %39 %48 
					                                                  OpStore %49 %47 
					                             Private f32* %50 = OpAccessChain %39 %48 
					                                      f32 %51 = OpLoad %50 
					                             Private f32* %52 = OpAccessChain %39 %48 
					                                      f32 %53 = OpLoad %52 
					                                      f32 %54 = OpFMul %51 %53 
					                                      f32 %56 = OpFAdd %54 %55 
					                             Private f32* %57 = OpAccessChain %39 %48 
					                                                  OpStore %57 %56 
					                             Private f32* %58 = OpAccessChain %28 %48 
					                                      f32 %59 = OpLoad %58 
					                             Private f32* %60 = OpAccessChain %39 %48 
					                                      f32 %61 = OpLoad %60 
					                                      f32 %62 = OpFMul %59 %61 
					                             Private f32* %63 = OpAccessChain %39 %48 
					                                                  OpStore %63 %62 
					                             Private f32* %64 = OpAccessChain %39 %48 
					                                      f32 %65 = OpLoad %64 
					                                      f32 %66 = OpExtInst %1 4 %65 
					                                      f32 %68 = OpFMul %66 %67 
					                             Private f32* %69 = OpAccessChain %28 %48 
					                                                  OpStore %69 %68 
					                             Private f32* %70 = OpAccessChain %28 %48 
					                                      f32 %71 = OpLoad %70 
					                             Private f32* %72 = OpAccessChain %28 %48 
					                                      f32 %73 = OpLoad %72 
					                                      f32 %74 = OpFMul %71 %73 
					                                      f32 %75 = OpFAdd %74 %55 
					                             Private f32* %76 = OpAccessChain %28 %48 
					                                                  OpStore %76 %75 
					                             Private f32* %77 = OpAccessChain %28 %48 
					                                      f32 %78 = OpLoad %77 
					                             Private f32* %79 = OpAccessChain %28 %41 
					                                      f32 %80 = OpLoad %79 
					                                      f32 %81 = OpFMul %78 %80 
					                             Private f32* %82 = OpAccessChain %39 %41 
					                                                  OpStore %82 %81 
					                                    f32_3 %83 = OpLoad %39 
					                                    f32_2 %84 = OpVectorShuffle %83 %83 0 1 
					                                    f32_2 %87 = OpFMul %84 %86 
					                                    f32_2 %88 = OpFAdd %87 %86 
					                                                  OpStore %28 %88 
					                                    f32_2 %89 = OpLoad %28 
					                                    f32_2 %92 = OpFMul %89 %91 
					                                    f32_2 %95 = OpFAdd %92 %94 
					                                                  OpStore %28 %95 
					                                    f32_2 %96 = OpLoad %9 
					                                    f32_2 %97 = OpFNegate %96 
					                                    f32_2 %98 = OpLoad %28 
					                                    f32_2 %99 = OpFAdd %97 %98 
					                                                  OpStore %28 %99 
					                            Uniform f32* %102 = OpAccessChain %16 %100 
					                                     f32 %103 = OpLoad %102 
					                            Uniform f32* %104 = OpAccessChain %16 %100 
					                                     f32 %105 = OpLoad %104 
					                                   f32_2 %106 = OpCompositeConstruct %103 %105 
					                                     f32 %107 = OpCompositeExtract %106 0 
					                                     f32 %108 = OpCompositeExtract %106 1 
					                                   f32_2 %109 = OpCompositeConstruct %107 %108 
					                                   f32_2 %110 = OpLoad %28 
					                                   f32_2 %111 = OpFMul %109 %110 
					                                   f32_2 %112 = OpLoad %9 
					                                   f32_2 %113 = OpFAdd %111 %112 
					                                                  OpStore %9 %113 
					                                   f32_2 %114 = OpLoad %9 
					                                   f32_2 %116 = OpCompositeConstruct %115 %115 
					                                   f32_2 %117 = OpCompositeConstruct %55 %55 
					                                   f32_2 %118 = OpExtInst %1 43 %114 %116 %117 
					                                                  OpStore %9 %118 
					                                   f32_2 %119 = OpLoad %9 
					                                   f32_2 %120 = OpVectorShuffle %119 %119 1 1 
					                                   f32_2 %124 = OpFMul %120 %123 
					                                                  OpStore %28 %124 
					                            Uniform f32* %126 = OpAccessChain %16 %125 
					                                     f32 %127 = OpLoad %126 
					                                   f32_2 %128 = OpCompositeConstruct %127 %127 
					                                   f32_2 %132 = OpFMul %128 %131 
					                                   f32_2 %133 = OpLoad %28 
					                                   f32_2 %134 = OpFAdd %132 %133 
					                                                  OpStore %28 %134 
					                                   f32_2 %135 = OpLoad %28 
					                                   f32_2 %136 = OpExtInst %1 13 %135 
					                                                  OpStore %28 %136 
					                            Private f32* %137 = OpAccessChain %28 %41 
					                                     f32 %138 = OpLoad %137 
					                            Private f32* %139 = OpAccessChain %28 %48 
					                                     f32 %140 = OpLoad %139 
					                                     f32 %141 = OpFMul %138 %140 
					                            Private f32* %142 = OpAccessChain %28 %48 
					                                                  OpStore %142 %141 
					                            Uniform f32* %144 = OpAccessChain %16 %125 
					                                     f32 %145 = OpLoad %144 
					                                     f32 %147 = OpFMul %145 %146 
					                                     f32 %148 = OpFAdd %147 %129 
					                                                  OpStore %143 %148 
					                            Private f32* %149 = OpAccessChain %9 %41 
					                                     f32 %150 = OpLoad %149 
					                                     f32 %152 = OpFMul %150 %151 
					                                     f32 %153 = OpLoad %143 
					                                     f32 %154 = OpFAdd %152 %153 
					                                                  OpStore %143 %154 
					                                     f32 %155 = OpLoad %143 
					                                     f32 %156 = OpExtInst %1 13 %155 
					                                                  OpStore %143 %156 
					                                     f32 %157 = OpLoad %143 
					                            Private f32* %158 = OpAccessChain %28 %48 
					                                     f32 %159 = OpLoad %158 
					                                     f32 %160 = OpFMul %157 %159 
					                            Private f32* %161 = OpAccessChain %28 %48 
					                                                  OpStore %161 %160 
					                            Private f32* %162 = OpAccessChain %28 %48 
					                                     f32 %163 = OpLoad %162 
					                                     f32 %165 = OpFMul %163 %164 
					                            Private f32* %166 = OpAccessChain %9 %48 
					                                     f32 %167 = OpLoad %166 
					                                     f32 %168 = OpFAdd %165 %167 
					                            Private f32* %169 = OpAccessChain %28 %48 
					                                                  OpStore %169 %168 
					                            Private f32* %170 = OpAccessChain %28 %48 
					                                     f32 %171 = OpLoad %170 
					                                     f32 %173 = OpFAdd %171 %172 
					                            Private f32* %174 = OpAccessChain %39 %48 
					                                                  OpStore %174 %173 
					                            Private f32* %175 = OpAccessChain %9 %41 
					                                     f32 %176 = OpLoad %175 
					                                     f32 %177 = OpFAdd %176 %172 
					                            Private f32* %178 = OpAccessChain %39 %41 
					                                                  OpStore %178 %177 
					                     read_only Texture2D %183 = OpLoad %182 
					                                 sampler %187 = OpLoad %186 
					              read_only Texture2DSampled %189 = OpSampledImage %183 %187 
					                                   f32_3 %190 = OpLoad %39 
					                                   f32_2 %191 = OpVectorShuffle %190 %190 0 1 
					                                   f32_4 %192 = OpImageSampleImplicitLod %189 %191 
					                                   f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
					                                                  OpStore %179 %193 
					                                   f32_3 %195 = OpLoad %179 
					                                   f32_3 %198 = OpFAdd %195 %197 
					                                                  OpStore %194 %198 
					                                   f32_3 %200 = OpLoad %194 
					                                   f32_3 %201 = OpLoad %194 
					                                   f32_3 %202 = OpFMul %200 %201 
					                                                  OpStore %199 %202 
					                                   f32_3 %203 = OpLoad %199 
					                                   f32_3 %206 = OpFMul %203 %205 
					                                                  OpStore %199 %206 
					                                   f32_3 %207 = OpLoad %194 
					                                   f32_3 %210 = OpFMul %207 %209 
					                                   f32_3 %211 = OpLoad %199 
					                                   f32_3 %212 = OpFAdd %210 %211 
					                                                  OpStore %194 %212 
					                                   f32_3 %213 = OpLoad %194 
					                                   f32_3 %214 = OpCompositeConstruct %115 %115 %115 
					                                   f32_3 %215 = OpCompositeConstruct %55 %55 %55 
					                                   f32_3 %216 = OpExtInst %1 43 %213 %214 %215 
					                                                  OpStore %194 %216 
					                            Private f32* %217 = OpAccessChain %9 %48 
					                                     f32 %218 = OpLoad %217 
					                            Private f32* %219 = OpAccessChain %9 %41 
					                                     f32 %220 = OpLoad %219 
					                                     f32 %221 = OpFMul %218 %220 
					                            Private f32* %222 = OpAccessChain %28 %48 
					                                                  OpStore %222 %221 
					                            Private f32* %223 = OpAccessChain %28 %48 
					                                     f32 %224 = OpLoad %223 
					                                     f32 %226 = OpFMul %224 %225 
					                            Private f32* %227 = OpAccessChain %28 %48 
					                                                  OpStore %227 %226 
					                                   f32_2 %229 = OpLoad %9 
					                                   f32_2 %230 = OpFNegate %229 
					                                   f32_2 %232 = OpFAdd %230 %231 
					                                                  OpStore %228 %232 
					                            Private f32* %233 = OpAccessChain %28 %48 
					                                     f32 %234 = OpLoad %233 
					                            Private f32* %235 = OpAccessChain %228 %48 
					                                     f32 %236 = OpLoad %235 
					                                     f32 %237 = OpFMul %234 %236 
					                            Private f32* %238 = OpAccessChain %28 %48 
					                                                  OpStore %238 %237 
					                            Private f32* %239 = OpAccessChain %228 %41 
					                                     f32 %240 = OpLoad %239 
					                            Private f32* %241 = OpAccessChain %28 %48 
					                                     f32 %242 = OpLoad %241 
					                                     f32 %243 = OpFMul %240 %242 
					                            Private f32* %244 = OpAccessChain %28 %48 
					                                                  OpStore %244 %243 
					                            Private f32* %245 = OpAccessChain %28 %48 
					                                     f32 %246 = OpLoad %245 
					                                     f32 %247 = OpExtInst %1 30 %246 
					                            Private f32* %248 = OpAccessChain %28 %48 
					                                                  OpStore %248 %247 
					                            Private f32* %249 = OpAccessChain %28 %48 
					                                     f32 %250 = OpLoad %249 
					                                     f32 %251 = OpFMul %250 %129 
					                            Private f32* %252 = OpAccessChain %28 %48 
					                                                  OpStore %252 %251 
					                            Private f32* %253 = OpAccessChain %28 %48 
					                                     f32 %254 = OpLoad %253 
					                                     f32 %255 = OpExtInst %1 29 %254 
					                            Private f32* %256 = OpAccessChain %28 %48 
					                                                  OpStore %256 %255 
					                                   f32_2 %257 = OpLoad %28 
					                                   f32_3 %258 = OpVectorShuffle %257 %257 0 0 0 
					                                   f32_3 %259 = OpLoad %194 
					                                   f32_3 %260 = OpFMul %258 %259 
					                                                  OpStore %39 %260 
					                                   f32_3 %261 = OpLoad %39 
					                                   f32_3 %264 = OpFMul %261 %263 
					                                                  OpStore %39 %264 
					                            Private f32* %265 = OpAccessChain %9 %41 
					                                     f32 %266 = OpLoad %265 
					                            Uniform f32* %268 = OpAccessChain %16 %267 %41 
					                                     f32 %269 = OpLoad %268 
					                                     f32 %270 = OpFMul %266 %269 
					                            Private f32* %271 = OpAccessChain %28 %48 
					                                                  OpStore %271 %270 
					                     read_only Texture2D %274 = OpLoad %182 
					                                 sampler %275 = OpLoad %186 
					              read_only Texture2DSampled %276 = OpSampledImage %274 %275 
					                                   f32_2 %277 = OpLoad %9 
					                                   f32_4 %278 = OpImageSampleImplicitLod %276 %277 
					                                   f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
					                                   f32_4 %280 = OpLoad %273 
					                                   f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 6 
					                                                  OpStore %273 %281 
					                            Uniform f32* %283 = OpAccessChain %16 %125 
					                                     f32 %284 = OpLoad %283 
					                                     f32 %286 = OpFMul %284 %285 
					                                                  OpStore %282 %286 
					                            Private f32* %287 = OpAccessChain %28 %48 
					                                     f32 %288 = OpLoad %287 
					                                     f32 %290 = OpFMul %288 %289 
					                                     f32 %291 = OpLoad %282 
					                                     f32 %292 = OpFAdd %290 %291 
					                            Private f32* %293 = OpAccessChain %28 %48 
					                                                  OpStore %293 %292 
					                            Private f32* %294 = OpAccessChain %28 %48 
					                                     f32 %295 = OpLoad %294 
					                                     f32 %296 = OpExtInst %1 13 %295 
					                            Private f32* %297 = OpAccessChain %28 %48 
					                                                  OpStore %297 %296 
					                            Private f32* %298 = OpAccessChain %28 %48 
					                                     f32 %299 = OpLoad %298 
					                                     f32 %301 = OpFMul %299 %300 
					                                     f32 %302 = OpFAdd %301 %300 
					                            Private f32* %303 = OpAccessChain %28 %48 
					                                                  OpStore %303 %302 
					                            Private f32* %304 = OpAccessChain %28 %48 
					                                     f32 %305 = OpLoad %304 
					                                     f32 %306 = OpExtInst %1 30 %305 
					                            Private f32* %307 = OpAccessChain %28 %48 
					                                                  OpStore %307 %306 
					                            Private f32* %308 = OpAccessChain %28 %48 
					                                     f32 %309 = OpLoad %308 
					                                     f32 %311 = OpFMul %309 %310 
					                            Private f32* %312 = OpAccessChain %28 %48 
					                                                  OpStore %312 %311 
					                            Private f32* %313 = OpAccessChain %28 %48 
					                                     f32 %314 = OpLoad %313 
					                                     f32 %315 = OpExtInst %1 29 %314 
					                            Private f32* %316 = OpAccessChain %28 %48 
					                                                  OpStore %316 %315 
					                            Private f32* %317 = OpAccessChain %28 %48 
					                                     f32 %318 = OpLoad %317 
					                                     f32 %319 = OpFMul %318 %130 
					                                     f32 %320 = OpFAdd %319 %204 
					                            Private f32* %321 = OpAccessChain %28 %48 
					                                                  OpStore %321 %320 
					                                   f32_2 %322 = OpLoad %28 
					                                   f32_3 %323 = OpVectorShuffle %322 %322 0 0 0 
					                                   f32_3 %324 = OpLoad %39 
					                                   f32_3 %325 = OpFMul %323 %324 
					                                                  OpStore %39 %325 
					                            Uniform f32* %326 = OpAccessChain %16 %125 
					                                     f32 %327 = OpLoad %326 
					                                     f32 %329 = OpFMul %327 %328 
					                            Private f32* %330 = OpAccessChain %28 %48 
					                                                  OpStore %330 %329 
					                            Private f32* %331 = OpAccessChain %28 %48 
					                                     f32 %332 = OpLoad %331 
					                                     f32 %333 = OpExtInst %1 13 %332 
					                            Private f32* %334 = OpAccessChain %28 %48 
					                                                  OpStore %334 %333 
					                            Private f32* %335 = OpAccessChain %28 %48 
					                                     f32 %336 = OpLoad %335 
					                                     f32 %338 = OpFMul %336 %337 
					                                     f32 %339 = OpFAdd %338 %55 
					                            Private f32* %340 = OpAccessChain %28 %48 
					                                                  OpStore %340 %339 
					                                   f32_3 %341 = OpLoad %39 
					                                   f32_2 %342 = OpLoad %28 
					                                   f32_3 %343 = OpVectorShuffle %342 %342 0 0 0 
					                                   f32_3 %344 = OpFMul %341 %343 
					                                   f32_4 %345 = OpLoad %273 
					                                   f32_3 %346 = OpVectorShuffle %345 %345 0 1 3 
					                                   f32_3 %347 = OpFNegate %346 
					                                   f32_3 %348 = OpFAdd %344 %347 
					                                                  OpStore %39 %348 
					                            Uniform f32* %351 = OpAccessChain %16 %100 
					                                     f32 %352 = OpLoad %351 
					                            Uniform f32* %353 = OpAccessChain %16 %100 
					                                     f32 %354 = OpLoad %353 
					                            Uniform f32* %355 = OpAccessChain %16 %100 
					                                     f32 %356 = OpLoad %355 
					                                   f32_3 %357 = OpCompositeConstruct %352 %354 %356 
					                                     f32 %358 = OpCompositeExtract %357 0 
					                                     f32 %359 = OpCompositeExtract %357 1 
					                                     f32 %360 = OpCompositeExtract %357 2 
					                                   f32_3 %361 = OpCompositeConstruct %358 %359 %360 
					                                   f32_3 %362 = OpLoad %39 
					                                   f32_3 %363 = OpFMul %361 %362 
					                                   f32_4 %364 = OpLoad %273 
					                                   f32_3 %365 = OpVectorShuffle %364 %364 0 1 3 
					                                   f32_3 %366 = OpFAdd %363 %365 
					                                   f32_4 %367 = OpLoad %350 
					                                   f32_4 %368 = OpVectorShuffle %367 %366 4 5 6 3 
					                                                  OpStore %350 %368 
					                             Output f32* %371 = OpAccessChain %350 %369 
					                                                  OpStore %371 %55 
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
						float _TimeX;
						float Fade;
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec2 u_xlat2;
					vec3 u_xlat16_2;
					vec4 u_xlat10_2;
					vec2 u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat6.xy = u_xlat6.xy * vec2(2.20000005, 2.20000005);
					    u_xlat1.x = abs(u_xlat6.y) * 0.200000003;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.0;
					    u_xlat1.x = u_xlat6.x * u_xlat1.x;
					    u_xlat6.x = abs(u_xlat1.x) * 0.25;
					    u_xlat6.x = u_xlat6.x * u_xlat6.x + 1.0;
					    u_xlat1.y = u_xlat6.x * u_xlat6.y;
					    u_xlat6.xy = u_xlat1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat6.xy = u_xlat6.xy * vec2(0.920000017, 0.920000017) + vec2(0.0399999991, 0.0399999991);
					    u_xlat6.xy = (-u_xlat0.xy) + u_xlat6.xy;
					    u_xlat0.xy = vec2(vec2(Fade, Fade)) * u_xlat6.xy + u_xlat0.xy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlat6.xy = u_xlat0.yy * vec2(21.0, 29.0);
					    u_xlat6.xy = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat6.xy;
					    u_xlat6.xy = sin(u_xlat6.xy);
					    u_xlat6.x = u_xlat6.y * u_xlat6.x;
					    u_xlat9 = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat9 = u_xlat0.y * 31.0 + u_xlat9;
					    u_xlat9 = sin(u_xlat9);
					    u_xlat6.x = u_xlat9 * u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 0.00170000002 + u_xlat0.x;
					    u_xlat1.x = u_xlat6.x + 0.00100000005;
					    u_xlat1.y = u_xlat0.y + 0.00100000005;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz + vec3(0.0199999996, 0.0199999996, 0.0199999996);
					    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
					    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_2.xyz;
					    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
					    u_xlat6.x = u_xlat0.x * u_xlat0.y;
					    u_xlat6.x = u_xlat6.x * 16.0;
					    u_xlat2.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
					    u_xlat6.x = u_xlat6.x * u_xlat2.x;
					    u_xlat6.x = u_xlat2.y * u_xlat6.x;
					    u_xlat6.x = log2(u_xlat6.x);
					    u_xlat6.x = u_xlat6.x * 0.300000012;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat1.xyz = u_xlat6.xxx * u_xlat16_1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(2.66000009, 2.66000009, 2.66000009);
					    u_xlat6.x = u_xlat0.y * _ScreenResolution.y;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xw = vec2(_TimeX) * vec2(3.5, 110.0);
					    u_xlat0.x = u_xlat6.x * 1.5 + u_xlat0.x;
					    u_xlat0.xw = sin(u_xlat0.xw);
					    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 1.70000005;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat9 = u_xlat0.w * 0.00999999978 + 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_2.xyz;
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