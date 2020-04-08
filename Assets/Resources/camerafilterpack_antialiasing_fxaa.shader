Shader "CameraFilterPack/Antialiasing_FXAA" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			GpuProgramID 60793
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					float u_xlat7;
					vec2 u_xlat8;
					vec2 u_xlat12;
					vec2 u_xlat14;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat20;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat1.xy = (-u_xlat12.xy) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat2 = u_xlat12.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat4.xy = u_xlat12.xy + u_xlat0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.x = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat1.y = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat1.z = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat1.w = dot(u_xlat10_4.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat16_2 = dot(u_xlat10_5.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat8.xy = min(u_xlat1.yw, u_xlat1.xz);
					    u_xlat8.x = min(u_xlat8.y, u_xlat8.x);
					    u_xlat8.x = min(u_xlat8.x, u_xlat16_2);
					    u_xlat14.xy = max(u_xlat1.yw, u_xlat1.xz);
					    u_xlat14.x = max(u_xlat14.y, u_xlat14.x);
					    u_xlat2.x = max(u_xlat14.x, u_xlat16_2);
					    u_xlat14.xy = u_xlat1.yw + u_xlat1.xz;
					    u_xlat20 = (-u_xlat14.y) + u_xlat14.x;
					    u_xlat3.x = (-u_xlat20);
					    u_xlat1.xy = u_xlat1.zw + u_xlat1.xy;
					    u_xlat3.y = (-u_xlat1.y) + u_xlat1.x;
					    u_xlat1.x = u_xlat1.z + u_xlat14.x;
					    u_xlat1.x = u_xlat1.w + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.03125;
					    u_xlat1.x = max(u_xlat1.x, 0.0078125);
					    u_xlat7 = min(abs(u_xlat20), abs(u_xlat3.y));
					    u_xlat1.x = u_xlat1.x + u_xlat7;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xx * u_xlat3.xy;
					    u_xlat1.xy = max(u_xlat1.xy, vec2(-8.0, -8.0));
					    u_xlat1.xy = min(u_xlat1.xy, vec2(8.0, 8.0));
					    u_xlat12.xy = u_xlat12.xy * u_xlat1.xy;
					    u_xlat1 = u_xlat12.xyxy * vec4(-0.165999994, -0.165999994, -0.5, -0.5) + u_xlat0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0.xy = u_xlat12.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
					    u_xlat18 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlatb1 = u_xlat18<u_xlat8.x;
					    u_xlatb18 = u_xlat2.x<u_xlat18;
					    u_xlatb18 = u_xlatb18 || u_xlatb1;
					    if(u_xlatb18){
					        SV_Target0.xyz = u_xlat10_3.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat16_0.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    }
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
					; Bound: 340
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %326 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 RelaxedPrecision 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %49 DescriptorSet 49 
					                                             OpDecorate %49 Binding 49 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %53 DescriptorSet 53 
					                                             OpDecorate %53 Binding 53 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %123 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %160 RelaxedPrecision 
					                                             OpDecorate %264 RelaxedPrecision 
					                                             OpDecorate %265 RelaxedPrecision 
					                                             OpDecorate %270 RelaxedPrecision 
					                                             OpDecorate %271 RelaxedPrecision 
					                                             OpDecorate %272 RelaxedPrecision 
					                                             OpDecorate %277 RelaxedPrecision 
					                                             OpDecorate %284 RelaxedPrecision 
					                                             OpDecorate %285 RelaxedPrecision 
					                                             OpDecorate %286 RelaxedPrecision 
					                                             OpDecorate %290 RelaxedPrecision 
					                                             OpDecorate %291 RelaxedPrecision 
					                                             OpDecorate %292 RelaxedPrecision 
					                                             OpDecorate %293 RelaxedPrecision 
					                                             OpDecorate %294 RelaxedPrecision 
					                                             OpDecorate %295 RelaxedPrecision 
					                                             OpDecorate %298 RelaxedPrecision 
					                                             OpDecorate %299 RelaxedPrecision 
					                                             OpDecorate %301 RelaxedPrecision 
					                                             OpDecorate %302 RelaxedPrecision 
					                                             OpDecorate %303 RelaxedPrecision 
					                                             OpDecorate %305 RelaxedPrecision 
					                                             OpDecorate %306 RelaxedPrecision 
					                                             OpDecorate %326 Location 326 
					                                             OpDecorate %327 RelaxedPrecision 
					                                             OpDecorate %334 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %13 %13 
					                                     %15 = OpTypePointer Uniform %14 
					     Uniform struct {f32_4; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 1 
					                                     %19 = OpTypePointer Uniform %13 
					                      Private f32_2* %28 = OpVariable Private 
					                                 f32 %29 = OpConstant 3,674022E-40 
					                               f32_2 %30 = OpConstantComposite %29 %29 
					                                 i32 %31 = OpConstant 0 
					                                     %36 = OpTypePointer Private %13 
					                      Private f32_4* %37 = OpVariable Private 
					                                     %44 = OpTypeVector %6 3 
					                                     %45 = OpTypePointer Private %44 
					                      Private f32_3* %46 = OpVariable Private 
					                                     %47 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %48 = OpTypePointer UniformConstant %47 
					UniformConstant read_only Texture2D* %49 = OpVariable UniformConstant 
					                                     %51 = OpTypeSampler 
					                                     %52 = OpTypePointer UniformConstant %51 
					            UniformConstant sampler* %53 = OpVariable UniformConstant 
					                                     %55 = OpTypeSampledImage %47 
					                      Private f32_4* %61 = OpVariable Private 
					                                 f32 %64 = OpConstant 3,674022E-40 
					                               f32_4 %65 = OpConstantComposite %29 %64 %64 %29 
					                      Private f32_3* %70 = OpVariable Private 
					                      Private f32_3* %78 = OpVariable Private 
					                      Private f32_2* %86 = OpVariable Private 
					                      Private f32_3* %90 = OpVariable Private 
					                      Private f32_3* %97 = OpVariable Private 
					                                f32 %105 = OpConstant 3,674022E-40 
					                                f32 %106 = OpConstant 3,674022E-40 
					                                f32 %107 = OpConstant 3,674022E-40 
					                              f32_3 %108 = OpConstantComposite %105 %106 %107 
					                                    %110 = OpTypeInt 32 0 
					                                u32 %111 = OpConstant 0 
					                                    %112 = OpTypePointer Private %6 
					                                u32 %116 = OpConstant 1 
					                                u32 %120 = OpConstant 2 
					                                u32 %124 = OpConstant 3 
					                       Private f32* %126 = OpVariable Private 
					                     Private f32_2* %129 = OpVariable Private 
					                     Private f32_2* %146 = OpVariable Private 
					                       Private f32* %168 = OpVariable Private 
					                     Private f32_2* %175 = OpVariable Private 
					                                f32 %207 = OpConstant 3,674022E-40 
					                                f32 %212 = OpConstant 3,674022E-40 
					                       Private f32* %215 = OpVariable Private 
					                                f32 %239 = OpConstant 3,674022E-40 
					                              f32_2 %240 = OpConstantComposite %239 %239 
					                                f32 %246 = OpConstant 3,674022E-40 
					                              f32_2 %247 = OpConstantComposite %246 %246 
					                                f32 %257 = OpConstant 3,674022E-40 
					                                f32 %258 = OpConstant 3,674022E-40 
					                              f32_4 %259 = OpConstantComposite %257 %257 %258 %258 
					                                f32 %279 = OpConstant 3,674022E-40 
					                              f32_2 %280 = OpConstantComposite %279 %279 
					                     Private f32_3* %284 = OpVariable Private 
					                     Private f32_3* %291 = OpVariable Private 
					                                f32 %296 = OpConstant 3,674022E-40 
					                              f32_3 %297 = OpConstantComposite %296 %296 %296 
					                              f32_3 %300 = OpConstantComposite %279 %279 %279 
					                       Private f32* %304 = OpVariable Private 
					                                    %307 = OpTypeBool 
					                                    %308 = OpTypePointer Private %307 
					                      Private bool* %309 = OpVariable Private 
					                      Private bool* %314 = OpVariable Private 
					                                    %325 = OpTypePointer Output %13 
					                      Output f32_4* %326 = OpVariable Output 
					                                    %330 = OpTypePointer Output %6 
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
					                      Uniform f32_4* %32 = OpAccessChain %16 %31 
					                               f32_4 %33 = OpLoad %32 
					                               f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                               f32_2 %35 = OpFDiv %30 %34 
					                                             OpStore %28 %35 
					                               f32_2 %38 = OpLoad %28 
					                               f32_2 %39 = OpFNegate %38 
					                               f32_2 %40 = OpLoad %9 
					                               f32_2 %41 = OpFAdd %39 %40 
					                               f32_4 %42 = OpLoad %37 
					                               f32_4 %43 = OpVectorShuffle %42 %41 4 5 2 3 
					                                             OpStore %37 %43 
					                 read_only Texture2D %50 = OpLoad %49 
					                             sampler %54 = OpLoad %53 
					          read_only Texture2DSampled %56 = OpSampledImage %50 %54 
					                               f32_4 %57 = OpLoad %37 
					                               f32_2 %58 = OpVectorShuffle %57 %57 0 1 
					                               f32_4 %59 = OpImageSampleImplicitLod %56 %58 
					                               f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
					                                             OpStore %46 %60 
					                               f32_2 %62 = OpLoad %28 
					                               f32_4 %63 = OpVectorShuffle %62 %62 0 1 0 1 
					                               f32_4 %66 = OpFMul %63 %65 
					                               f32_2 %67 = OpLoad %9 
					                               f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
					                               f32_4 %69 = OpFAdd %66 %68 
					                                             OpStore %61 %69 
					                 read_only Texture2D %71 = OpLoad %49 
					                             sampler %72 = OpLoad %53 
					          read_only Texture2DSampled %73 = OpSampledImage %71 %72 
					                               f32_4 %74 = OpLoad %61 
					                               f32_2 %75 = OpVectorShuffle %74 %74 0 1 
					                               f32_4 %76 = OpImageSampleImplicitLod %73 %75 
					                               f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
					                                             OpStore %70 %77 
					                 read_only Texture2D %79 = OpLoad %49 
					                             sampler %80 = OpLoad %53 
					          read_only Texture2DSampled %81 = OpSampledImage %79 %80 
					                               f32_4 %82 = OpLoad %61 
					                               f32_2 %83 = OpVectorShuffle %82 %82 2 3 
					                               f32_4 %84 = OpImageSampleImplicitLod %81 %83 
					                               f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                             OpStore %78 %85 
					                               f32_2 %87 = OpLoad %28 
					                               f32_2 %88 = OpLoad %9 
					                               f32_2 %89 = OpFAdd %87 %88 
					                                             OpStore %86 %89 
					                 read_only Texture2D %91 = OpLoad %49 
					                             sampler %92 = OpLoad %53 
					          read_only Texture2DSampled %93 = OpSampledImage %91 %92 
					                               f32_2 %94 = OpLoad %86 
					                               f32_4 %95 = OpImageSampleImplicitLod %93 %94 
					                               f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
					                                             OpStore %90 %96 
					                 read_only Texture2D %98 = OpLoad %49 
					                             sampler %99 = OpLoad %53 
					         read_only Texture2DSampled %100 = OpSampledImage %98 %99 
					                              f32_2 %101 = OpLoad %9 
					                              f32_4 %102 = OpImageSampleImplicitLod %100 %101 
					                              f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
					                                             OpStore %97 %103 
					                              f32_3 %104 = OpLoad %46 
					                                f32 %109 = OpDot %104 %108 
					                       Private f32* %113 = OpAccessChain %37 %111 
					                                             OpStore %113 %109 
					                              f32_3 %114 = OpLoad %70 
					                                f32 %115 = OpDot %114 %108 
					                       Private f32* %117 = OpAccessChain %37 %116 
					                                             OpStore %117 %115 
					                              f32_3 %118 = OpLoad %78 
					                                f32 %119 = OpDot %118 %108 
					                       Private f32* %121 = OpAccessChain %37 %120 
					                                             OpStore %121 %119 
					                              f32_3 %122 = OpLoad %90 
					                                f32 %123 = OpDot %122 %108 
					                       Private f32* %125 = OpAccessChain %37 %124 
					                                             OpStore %125 %123 
					                              f32_3 %127 = OpLoad %97 
					                                f32 %128 = OpDot %127 %108 
					                                             OpStore %126 %128 
					                              f32_4 %130 = OpLoad %37 
					                              f32_2 %131 = OpVectorShuffle %130 %130 1 3 
					                              f32_4 %132 = OpLoad %37 
					                              f32_2 %133 = OpVectorShuffle %132 %132 0 2 
					                              f32_2 %134 = OpExtInst %1 37 %131 %133 
					                                             OpStore %129 %134 
					                       Private f32* %135 = OpAccessChain %129 %116 
					                                f32 %136 = OpLoad %135 
					                       Private f32* %137 = OpAccessChain %129 %111 
					                                f32 %138 = OpLoad %137 
					                                f32 %139 = OpExtInst %1 37 %136 %138 
					                       Private f32* %140 = OpAccessChain %129 %111 
					                                             OpStore %140 %139 
					                       Private f32* %141 = OpAccessChain %129 %111 
					                                f32 %142 = OpLoad %141 
					                                f32 %143 = OpLoad %126 
					                                f32 %144 = OpExtInst %1 37 %142 %143 
					                       Private f32* %145 = OpAccessChain %129 %111 
					                                             OpStore %145 %144 
					                              f32_4 %147 = OpLoad %37 
					                              f32_2 %148 = OpVectorShuffle %147 %147 1 3 
					                              f32_4 %149 = OpLoad %37 
					                              f32_2 %150 = OpVectorShuffle %149 %149 0 2 
					                              f32_2 %151 = OpExtInst %1 40 %148 %150 
					                                             OpStore %146 %151 
					                       Private f32* %152 = OpAccessChain %146 %116 
					                                f32 %153 = OpLoad %152 
					                       Private f32* %154 = OpAccessChain %146 %111 
					                                f32 %155 = OpLoad %154 
					                                f32 %156 = OpExtInst %1 40 %153 %155 
					                       Private f32* %157 = OpAccessChain %146 %111 
					                                             OpStore %157 %156 
					                       Private f32* %158 = OpAccessChain %146 %111 
					                                f32 %159 = OpLoad %158 
					                                f32 %160 = OpLoad %126 
					                                f32 %161 = OpExtInst %1 40 %159 %160 
					                       Private f32* %162 = OpAccessChain %61 %111 
					                                             OpStore %162 %161 
					                              f32_4 %163 = OpLoad %37 
					                              f32_2 %164 = OpVectorShuffle %163 %163 1 3 
					                              f32_4 %165 = OpLoad %37 
					                              f32_2 %166 = OpVectorShuffle %165 %165 0 2 
					                              f32_2 %167 = OpFAdd %164 %166 
					                                             OpStore %146 %167 
					                       Private f32* %169 = OpAccessChain %146 %116 
					                                f32 %170 = OpLoad %169 
					                                f32 %171 = OpFNegate %170 
					                       Private f32* %172 = OpAccessChain %146 %111 
					                                f32 %173 = OpLoad %172 
					                                f32 %174 = OpFAdd %171 %173 
					                                             OpStore %168 %174 
					                                f32 %176 = OpLoad %168 
					                                f32 %177 = OpFNegate %176 
					                       Private f32* %178 = OpAccessChain %175 %111 
					                                             OpStore %178 %177 
					                              f32_4 %179 = OpLoad %37 
					                              f32_2 %180 = OpVectorShuffle %179 %179 2 3 
					                              f32_4 %181 = OpLoad %37 
					                              f32_2 %182 = OpVectorShuffle %181 %181 0 1 
					                              f32_2 %183 = OpFAdd %180 %182 
					                              f32_4 %184 = OpLoad %37 
					                              f32_4 %185 = OpVectorShuffle %184 %183 4 5 2 3 
					                                             OpStore %37 %185 
					                       Private f32* %186 = OpAccessChain %37 %116 
					                                f32 %187 = OpLoad %186 
					                                f32 %188 = OpFNegate %187 
					                       Private f32* %189 = OpAccessChain %37 %111 
					                                f32 %190 = OpLoad %189 
					                                f32 %191 = OpFAdd %188 %190 
					                       Private f32* %192 = OpAccessChain %175 %116 
					                                             OpStore %192 %191 
					                       Private f32* %193 = OpAccessChain %37 %120 
					                                f32 %194 = OpLoad %193 
					                       Private f32* %195 = OpAccessChain %146 %111 
					                                f32 %196 = OpLoad %195 
					                                f32 %197 = OpFAdd %194 %196 
					                       Private f32* %198 = OpAccessChain %37 %111 
					                                             OpStore %198 %197 
					                       Private f32* %199 = OpAccessChain %37 %124 
					                                f32 %200 = OpLoad %199 
					                       Private f32* %201 = OpAccessChain %37 %111 
					                                f32 %202 = OpLoad %201 
					                                f32 %203 = OpFAdd %200 %202 
					                       Private f32* %204 = OpAccessChain %37 %111 
					                                             OpStore %204 %203 
					                       Private f32* %205 = OpAccessChain %37 %111 
					                                f32 %206 = OpLoad %205 
					                                f32 %208 = OpFMul %206 %207 
					                       Private f32* %209 = OpAccessChain %37 %111 
					                                             OpStore %209 %208 
					                       Private f32* %210 = OpAccessChain %37 %111 
					                                f32 %211 = OpLoad %210 
					                                f32 %213 = OpExtInst %1 40 %211 %212 
					                       Private f32* %214 = OpAccessChain %37 %111 
					                                             OpStore %214 %213 
					                                f32 %216 = OpLoad %168 
					                                f32 %217 = OpExtInst %1 4 %216 
					                       Private f32* %218 = OpAccessChain %175 %116 
					                                f32 %219 = OpLoad %218 
					                                f32 %220 = OpExtInst %1 4 %219 
					                                f32 %221 = OpExtInst %1 37 %217 %220 
					                                             OpStore %215 %221 
					                       Private f32* %222 = OpAccessChain %37 %111 
					                                f32 %223 = OpLoad %222 
					                                f32 %224 = OpLoad %215 
					                                f32 %225 = OpFAdd %223 %224 
					                       Private f32* %226 = OpAccessChain %37 %111 
					                                             OpStore %226 %225 
					                       Private f32* %227 = OpAccessChain %37 %111 
					                                f32 %228 = OpLoad %227 
					                                f32 %229 = OpFDiv %29 %228 
					                       Private f32* %230 = OpAccessChain %37 %111 
					                                             OpStore %230 %229 
					                              f32_4 %231 = OpLoad %37 
					                              f32_2 %232 = OpVectorShuffle %231 %231 0 0 
					                              f32_2 %233 = OpLoad %175 
					                              f32_2 %234 = OpFMul %232 %233 
					                              f32_4 %235 = OpLoad %37 
					                              f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
					                                             OpStore %37 %236 
					                              f32_4 %237 = OpLoad %37 
					                              f32_2 %238 = OpVectorShuffle %237 %237 0 1 
					                              f32_2 %241 = OpExtInst %1 40 %238 %240 
					                              f32_4 %242 = OpLoad %37 
					                              f32_4 %243 = OpVectorShuffle %242 %241 4 5 2 3 
					                                             OpStore %37 %243 
					                              f32_4 %244 = OpLoad %37 
					                              f32_2 %245 = OpVectorShuffle %244 %244 0 1 
					                              f32_2 %248 = OpExtInst %1 37 %245 %247 
					                              f32_4 %249 = OpLoad %37 
					                              f32_4 %250 = OpVectorShuffle %249 %248 4 5 2 3 
					                                             OpStore %37 %250 
					                              f32_2 %251 = OpLoad %28 
					                              f32_4 %252 = OpLoad %37 
					                              f32_2 %253 = OpVectorShuffle %252 %252 0 1 
					                              f32_2 %254 = OpFMul %251 %253 
					                                             OpStore %28 %254 
					                              f32_2 %255 = OpLoad %28 
					                              f32_4 %256 = OpVectorShuffle %255 %255 0 1 0 1 
					                              f32_4 %260 = OpFMul %256 %259 
					                              f32_2 %261 = OpLoad %9 
					                              f32_4 %262 = OpVectorShuffle %261 %261 0 1 0 1 
					                              f32_4 %263 = OpFAdd %260 %262 
					                                             OpStore %37 %263 
					                read_only Texture2D %264 = OpLoad %49 
					                            sampler %265 = OpLoad %53 
					         read_only Texture2DSampled %266 = OpSampledImage %264 %265 
					                              f32_4 %267 = OpLoad %37 
					                              f32_2 %268 = OpVectorShuffle %267 %267 0 1 
					                              f32_4 %269 = OpImageSampleImplicitLod %266 %268 
					                              f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
					                                             OpStore %70 %270 
					                read_only Texture2D %271 = OpLoad %49 
					                            sampler %272 = OpLoad %53 
					         read_only Texture2DSampled %273 = OpSampledImage %271 %272 
					                              f32_4 %274 = OpLoad %37 
					                              f32_2 %275 = OpVectorShuffle %274 %274 2 3 
					                              f32_4 %276 = OpImageSampleImplicitLod %273 %275 
					                              f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
					                                             OpStore %46 %277 
					                              f32_2 %278 = OpLoad %28 
					                              f32_2 %281 = OpFMul %278 %280 
					                              f32_2 %282 = OpLoad %9 
					                              f32_2 %283 = OpFAdd %281 %282 
					                                             OpStore %9 %283 
					                read_only Texture2D %285 = OpLoad %49 
					                            sampler %286 = OpLoad %53 
					         read_only Texture2DSampled %287 = OpSampledImage %285 %286 
					                              f32_2 %288 = OpLoad %9 
					                              f32_4 %289 = OpImageSampleImplicitLod %287 %288 
					                              f32_3 %290 = OpVectorShuffle %289 %289 0 1 2 
					                                             OpStore %284 %290 
					                              f32_3 %292 = OpLoad %284 
					                              f32_3 %293 = OpLoad %46 
					                              f32_3 %294 = OpFAdd %292 %293 
					                                             OpStore %291 %294 
					                              f32_3 %295 = OpLoad %291 
					                              f32_3 %298 = OpFMul %295 %297 
					                                             OpStore %291 %298 
					                              f32_3 %299 = OpLoad %70 
					                              f32_3 %301 = OpFMul %299 %300 
					                              f32_3 %302 = OpLoad %291 
					                              f32_3 %303 = OpFAdd %301 %302 
					                                             OpStore %291 %303 
					                              f32_3 %305 = OpLoad %291 
					                                f32 %306 = OpDot %305 %108 
					                                             OpStore %304 %306 
					                                f32 %310 = OpLoad %304 
					                       Private f32* %311 = OpAccessChain %129 %111 
					                                f32 %312 = OpLoad %311 
					                               bool %313 = OpFOrdLessThan %310 %312 
					                                             OpStore %309 %313 
					                       Private f32* %315 = OpAccessChain %61 %111 
					                                f32 %316 = OpLoad %315 
					                                f32 %317 = OpLoad %304 
					                               bool %318 = OpFOrdLessThan %316 %317 
					                                             OpStore %314 %318 
					                               bool %319 = OpLoad %314 
					                               bool %320 = OpLoad %309 
					                               bool %321 = OpLogicalOr %319 %320 
					                                             OpStore %314 %321 
					                               bool %322 = OpLoad %314 
					                                             OpSelectionMerge %324 None 
					                                             OpBranchConditional %322 %323 %333 
					                                    %323 = OpLabel 
					                              f32_3 %327 = OpLoad %70 
					                              f32_4 %328 = OpLoad %326 
					                              f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
					                                             OpStore %326 %329 
					                        Output f32* %331 = OpAccessChain %326 %124 
					                                             OpStore %331 %29 
					                                             OpReturn
					                                    %333 = OpLabel 
					                              f32_3 %334 = OpLoad %291 
					                              f32_4 %335 = OpLoad %326 
					                              f32_4 %336 = OpVectorShuffle %335 %334 4 5 6 3 
					                                             OpStore %326 %336 
					                        Output f32* %337 = OpAccessChain %326 %124 
					                                             OpStore %337 %29 
					                                             OpReturn
					                                    %324 = OpLabel 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec2 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					float u_xlat7;
					vec2 u_xlat8;
					vec2 u_xlat12;
					vec2 u_xlat14;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat20;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat1.xy = (-u_xlat12.xy) + u_xlat0.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat2 = u_xlat12.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat4.xy = u_xlat12.xy + u_xlat0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.x = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat1.y = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat1.z = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat1.w = dot(u_xlat10_4.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat16_2 = dot(u_xlat10_5.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat8.xy = min(u_xlat1.yw, u_xlat1.xz);
					    u_xlat8.x = min(u_xlat8.y, u_xlat8.x);
					    u_xlat8.x = min(u_xlat8.x, u_xlat16_2);
					    u_xlat14.xy = max(u_xlat1.yw, u_xlat1.xz);
					    u_xlat14.x = max(u_xlat14.y, u_xlat14.x);
					    u_xlat2.x = max(u_xlat14.x, u_xlat16_2);
					    u_xlat14.xy = u_xlat1.yw + u_xlat1.xz;
					    u_xlat20 = (-u_xlat14.y) + u_xlat14.x;
					    u_xlat3.x = (-u_xlat20);
					    u_xlat1.xy = u_xlat1.zw + u_xlat1.xy;
					    u_xlat3.y = (-u_xlat1.y) + u_xlat1.x;
					    u_xlat1.x = u_xlat1.z + u_xlat14.x;
					    u_xlat1.x = u_xlat1.w + u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.03125;
					    u_xlat1.x = max(u_xlat1.x, 0.0078125);
					    u_xlat7 = min(abs(u_xlat20), abs(u_xlat3.y));
					    u_xlat1.x = u_xlat1.x + u_xlat7;
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat1.xy = u_xlat1.xx * u_xlat3.xy;
					    u_xlat1.xy = max(u_xlat1.xy, vec2(-8.0, -8.0));
					    u_xlat1.xy = min(u_xlat1.xy, vec2(8.0, 8.0));
					    u_xlat12.xy = u_xlat12.xy * u_xlat1.xy;
					    u_xlat1 = u_xlat12.xyxy * vec4(-0.165999994, -0.165999994, -0.5, -0.5) + u_xlat0.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0.xy = u_xlat12.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
					    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_0.xyz;
					    u_xlat18 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlatb1 = u_xlat18<u_xlat8.x;
					    u_xlatb18 = u_xlat2.x<u_xlat18;
					    u_xlatb18 = u_xlatb18 || u_xlatb1;
					    if(u_xlatb18){
					        SV_Target0.xyz = u_xlat10_3.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    } else {
					        SV_Target0.xyz = u_xlat16_0.xyz;
					        SV_Target0.w = 1.0;
					        return;
					    //ENDIF
					    }
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