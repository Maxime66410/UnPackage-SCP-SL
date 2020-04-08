Shader "CameraFilterPack/Drawing_Crosshatch" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 54257
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
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					float u_xlat16_3;
					vec4 u_xlat10_3;
					bvec4 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					float u_xlat16_6;
					bool u_xlatb6;
					float u_xlat16_8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat16_14;
					float u_xlat19;
					float u_xlat16_19;
					bool u_xlatb19;
					float u_xlat16_20;
					void main()
					{
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat1 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat2 = u_xlat1.zwzw * _ScreenResolution.xyxy + vec4(-1.0, -1.0, -1.0, 0.0);
					    u_xlat2 = u_xlat0 * u_xlat2;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2 = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_8 = dot(u_xlat10_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat3 = u_xlat1.zwzw * _ScreenResolution.xyxy + vec4(1.0, -1.0, 1.0, 0.0);
					    u_xlat3 = u_xlat0 * u_xlat3;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_14 = dot(u_xlat10_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_20 = dot(u_xlat10_4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_3 = (-u_xlat16_20) + (-u_xlat16_8);
					    u_xlat16_8 = u_xlat16_2 * -2.0 + (-u_xlat16_8);
					    u_xlat16_2 = (-u_xlat16_2) + u_xlat16_8;
					    u_xlat16_2 = u_xlat16_20 + u_xlat16_2;
					    u_xlat16_2 = u_xlat16_14 * 2.0 + u_xlat16_2;
					    u_xlat4 = u_xlat1.zwzw * _ScreenResolution.xyxy + vec4(1.0, 1.0, 0.0, -1.0);
					    u_xlat4 = u_xlat0 * u_xlat4;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_8 = dot(u_xlat10_4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_14 = dot(u_xlat10_5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_20 = u_xlat16_14 + u_xlat16_3;
					    u_xlat16_2 = u_xlat16_14 + u_xlat16_2;
					    u_xlat16_8 = u_xlat16_8 * -2.0 + u_xlat16_20;
					    u_xlat3 = u_xlat1 * _ScreenResolution.xyxy + vec4(-1.0, 1.0, 0.0, 1.0);
					    u_xlat0 = u_xlat0 * u_xlat3;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_6 = dot(u_xlat10_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_6 = u_xlat16_6 + u_xlat16_8;
					    u_xlat16_0 = u_xlat16_0 * 2.0 + u_xlat16_6;
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
					    u_xlat16_0 = u_xlat16_2 * u_xlat16_2 + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat6.xy = u_xlat1.zw * _ScreenResolution.xy;
					    u_xlat6.z = u_xlat1.z * _ScreenResolution.x + (-u_xlat6.y);
					    u_xlat6.x = u_xlat6.y + u_xlat6.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat12 = u_xlat6.z * 0.100000001;
					    u_xlat12 = floor(u_xlat12);
					    u_xlat12 = (-u_xlat12) * 10.0 + u_xlat6.z;
					    u_xlatb12 = _Distortion>=u_xlat12;
					    u_xlat16_19 = min(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_19 = min(u_xlat10_1.z, u_xlat16_19);
					    u_xlat16_2 = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_2 = max(u_xlat10_1.z, u_xlat16_2);
					    u_xlat19 = (-u_xlat16_19) + u_xlat16_2;
					    u_xlat16_2 = float(1.0) / u_xlat16_2;
					    u_xlat2.xyz = u_xlat10_1.xyz * vec3(u_xlat16_2);
					    u_xlat1.x = dot(u_xlat10_1.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlatb3 = lessThan(u_xlat1.xxxx, vec4(0.800000012, 0.600000024, 0.300000012, 0.150000006));
					    u_xlatb1 = 0.100000001<u_xlat19;
					    u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat1.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
					    u_xlat19 = u_xlat6.x * 0.100000001;
					    u_xlat19 = floor(u_xlat19);
					    u_xlat19 = (-u_xlat19) * 10.0 + u_xlat6.x;
					    u_xlat6.xz = u_xlat6.xz + vec2(-5.0, -5.0);
					    u_xlatb19 = _Distortion>=u_xlat19;
					    u_xlat2.xyz = (bool(u_xlatb19)) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = (u_xlatb3.x) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat4.xyz = (bool(u_xlatb12)) ? u_xlat4.xyz : u_xlat2.xyz;
					    u_xlat2.xyz = (u_xlatb3.y) ? u_xlat4.xyz : u_xlat2.xyz;
					    u_xlat12 = u_xlat6.x * 0.100000001;
					    u_xlat12 = floor(u_xlat12);
					    u_xlat6.x = (-u_xlat12) * 10.0 + u_xlat6.x;
					    u_xlatb6 = _Distortion>=u_xlat6.x;
					    u_xlat1.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat2.xyz;
					    u_xlat1.xyz = (u_xlatb3.z) ? u_xlat1.xyz : u_xlat2.xyz;
					    u_xlat6.x = u_xlat6.z * 0.100000001;
					    u_xlat6.x = floor(u_xlat6.x);
					    u_xlat6.x = (-u_xlat6.x) * 10.0 + u_xlat6.z;
					    u_xlatb6 = _Distortion>=u_xlat6.x;
					    u_xlat6.xyz = (bool(u_xlatb6)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    u_xlat6.xyz = (u_xlatb3.w) ? u_xlat6.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat6.xyz;
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
					; Bound: 539
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %25 %529 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %12 0 Offset 12 
					                                             OpMemberDecorate %12 1 Offset 12 
					                                             OpMemberDecorate %12 2 RelaxedPrecision 
					                                             OpMemberDecorate %12 2 Offset 12 
					                                             OpDecorate %12 Block 
					                                             OpDecorate %14 DescriptorSet 14 
					                                             OpDecorate %14 Binding 14 
					                                             OpDecorate vs_TEXCOORD0 Location 25 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %56 DescriptorSet 56 
					                                             OpDecorate %56 Binding 56 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %60 DescriptorSet 60 
					                                             OpDecorate %60 Binding 60 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %69 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %121 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %123 RelaxedPrecision 
					                                             OpDecorate %124 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %130 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %135 RelaxedPrecision 
					                                             OpDecorate %136 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %158 RelaxedPrecision 
					                                             OpDecorate %163 RelaxedPrecision 
					                                             OpDecorate %164 RelaxedPrecision 
					                                             OpDecorate %165 RelaxedPrecision 
					                                             OpDecorate %166 RelaxedPrecision 
					                                             OpDecorate %171 RelaxedPrecision 
					                                             OpDecorate %172 RelaxedPrecision 
					                                             OpDecorate %173 RelaxedPrecision 
					                                             OpDecorate %174 RelaxedPrecision 
					                                             OpDecorate %175 RelaxedPrecision 
					                                             OpDecorate %176 RelaxedPrecision 
					                                             OpDecorate %177 RelaxedPrecision 
					                                             OpDecorate %178 RelaxedPrecision 
					                                             OpDecorate %179 RelaxedPrecision 
					                                             OpDecorate %180 RelaxedPrecision 
					                                             OpDecorate %181 RelaxedPrecision 
					                                             OpDecorate %182 RelaxedPrecision 
					                                             OpDecorate %183 RelaxedPrecision 
					                                             OpDecorate %184 RelaxedPrecision 
					                                             OpDecorate %185 RelaxedPrecision 
					                                             OpDecorate %186 RelaxedPrecision 
					                                             OpDecorate %197 RelaxedPrecision 
					                                             OpDecorate %198 RelaxedPrecision 
					                                             OpDecorate %203 RelaxedPrecision 
					                                             OpDecorate %204 RelaxedPrecision 
					                                             OpDecorate %205 RelaxedPrecision 
					                                             OpDecorate %206 RelaxedPrecision 
					                                             OpDecorate %211 RelaxedPrecision 
					                                             OpDecorate %212 RelaxedPrecision 
					                                             OpDecorate %213 RelaxedPrecision 
					                                             OpDecorate %214 RelaxedPrecision 
					                                             OpDecorate %215 RelaxedPrecision 
					                                             OpDecorate %216 RelaxedPrecision 
					                                             OpDecorate %217 RelaxedPrecision 
					                                             OpDecorate %218 RelaxedPrecision 
					                                             OpDecorate %219 RelaxedPrecision 
					                                             OpDecorate %220 RelaxedPrecision 
					                                             OpDecorate %221 RelaxedPrecision 
					                                             OpDecorate %222 RelaxedPrecision 
					                                             OpDecorate %223 RelaxedPrecision 
					                                             OpDecorate %224 RelaxedPrecision 
					                                             OpDecorate %225 RelaxedPrecision 
					                                             OpDecorate %226 RelaxedPrecision 
					                                             OpDecorate %227 RelaxedPrecision 
					                                             OpDecorate %228 RelaxedPrecision 
					                                             OpDecorate %229 RelaxedPrecision 
					                                             OpDecorate %230 RelaxedPrecision 
					                                             OpDecorate %231 RelaxedPrecision 
					                                             OpDecorate %232 RelaxedPrecision 
					                                             OpDecorate %233 RelaxedPrecision 
					                                             OpDecorate %234 RelaxedPrecision 
					                                             OpDecorate %235 RelaxedPrecision 
					                                             OpDecorate %266 RelaxedPrecision 
					                                             OpDecorate %267 RelaxedPrecision 
					                                             OpDecorate %268 RelaxedPrecision 
					                                             OpDecorate %273 RelaxedPrecision 
					                                             OpDecorate %296 RelaxedPrecision 
					                                             OpDecorate %298 RelaxedPrecision 
					                                             OpDecorate %300 RelaxedPrecision 
					                                             OpDecorate %301 RelaxedPrecision 
					                                             OpDecorate %303 RelaxedPrecision 
					                                             OpDecorate %304 RelaxedPrecision 
					                                             OpDecorate %305 RelaxedPrecision 
					                                             OpDecorate %307 RelaxedPrecision 
					                                             OpDecorate %309 RelaxedPrecision 
					                                             OpDecorate %310 RelaxedPrecision 
					                                             OpDecorate %312 RelaxedPrecision 
					                                             OpDecorate %313 RelaxedPrecision 
					                                             OpDecorate %314 RelaxedPrecision 
					                                             OpDecorate %316 RelaxedPrecision 
					                                             OpDecorate %317 RelaxedPrecision 
					                                             OpDecorate %318 RelaxedPrecision 
					                                             OpDecorate %319 RelaxedPrecision 
					                                             OpDecorate %320 RelaxedPrecision 
					                                             OpDecorate %321 RelaxedPrecision 
					                                             OpDecorate %322 RelaxedPrecision 
					                                             OpDecorate %323 RelaxedPrecision 
					                                             OpDecorate %324 RelaxedPrecision 
					                                             OpDecorate %325 RelaxedPrecision 
					                                             OpDecorate %328 RelaxedPrecision 
					                                             OpDecorate %329 RelaxedPrecision 
					                                             OpDecorate %529 Location 529 
					                                             OpDecorate %530 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                 f32 %10 = OpConstant 3,674022E-40 
					                               f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
					                                     %12 = OpTypeStruct %6 %7 %7 
					                                     %13 = OpTypePointer Uniform %12 
					Uniform struct {f32; f32_4; f32_4;}* %14 = OpVariable Uniform 
					                                     %15 = OpTypeInt 32 1 
					                                 i32 %16 = OpConstant 1 
					                                     %17 = OpTypePointer Uniform %7 
					                      Private f32_4* %22 = OpVariable Private 
					                                     %23 = OpTypeVector %6 2 
					                                     %24 = OpTypePointer Input %23 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %28 = OpConstant 2 
					                      Private f32_4* %37 = OpVariable Private 
					                                 f32 %44 = OpConstant 3,674022E-40 
					                                 f32 %45 = OpConstant 3,674022E-40 
					                               f32_4 %46 = OpConstantComposite %44 %44 %44 %45 
					                                     %51 = OpTypeVector %6 3 
					                                     %52 = OpTypePointer Private %51 
					                      Private f32_3* %53 = OpVariable Private 
					                                     %54 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %55 = OpTypePointer UniformConstant %54 
					UniformConstant read_only Texture2D* %56 = OpVariable UniformConstant 
					                                     %58 = OpTypeSampler 
					                                     %59 = OpTypePointer UniformConstant %58 
					            UniformConstant sampler* %60 = OpVariable UniformConstant 
					                                     %62 = OpTypeSampledImage %54 
					                      Private f32_3* %68 = OpVariable Private 
					                                     %76 = OpTypePointer Private %6 
					                        Private f32* %77 = OpVariable Private 
					                                 f32 %79 = OpConstant 3,674022E-40 
					                                 f32 %80 = OpConstant 3,674022E-40 
					                                 f32 %81 = OpConstant 3,674022E-40 
					                               f32_3 %82 = OpConstantComposite %79 %80 %81 
					                        Private f32* %84 = OpVariable Private 
					                      Private f32_4* %87 = OpVariable Private 
					                               f32_4 %94 = OpConstantComposite %10 %44 %10 %45 
					                      Private f32_3* %99 = OpVariable Private 
					                       Private f32* %114 = OpVariable Private 
					                       Private f32* %117 = OpVariable Private 
					                       Private f32* %120 = OpVariable Private 
					                                f32 %127 = OpConstant 3,674022E-40 
					                                f32 %140 = OpConstant 3,674022E-40 
					                     Private f32_4* %144 = OpVariable Private 
					                              f32_4 %151 = OpConstantComposite %10 %10 %45 %44 
					                     Private f32_3* %156 = OpVariable Private 
					                     Private f32_3* %164 = OpVariable Private 
					                       Private f32* %172 = OpVariable Private 
					                              f32_4 %192 = OpConstantComposite %44 %10 %45 %10 
					                     Private f32_3* %204 = OpVariable Private 
					                       Private f32* %212 = OpVariable Private 
					                       Private f32* %215 = OpVariable Private 
					                     Private f32_3* %236 = OpVariable Private 
					                                    %245 = OpTypeInt 32 0 
					                                u32 %246 = OpConstant 2 
					                                u32 %249 = OpConstant 0 
					                                    %250 = OpTypePointer Uniform %6 
					                                u32 %254 = OpConstant 1 
					                     Private f32_3* %266 = OpVariable Private 
					                       Private f32* %274 = OpVariable Private 
					                                f32 %277 = OpConstant 3,674022E-40 
					                                f32 %283 = OpConstant 3,674022E-40 
					                                    %288 = OpTypeBool 
					                                    %289 = OpTypePointer Private %288 
					                      Private bool* %290 = OpVariable Private 
					                                i32 %291 = OpConstant 0 
					                       Private f32* %296 = OpVariable Private 
					                       Private f32* %315 = OpVariable Private 
					                                    %331 = OpTypeVector %288 4 
					                                    %332 = OpTypePointer Private %331 
					                    Private bool_4* %333 = OpVariable Private 
					                                f32 %336 = OpConstant 3,674022E-40 
					                                f32 %337 = OpConstant 3,674022E-40 
					                                f32 %338 = OpConstant 3,674022E-40 
					                                f32 %339 = OpConstant 3,674022E-40 
					                              f32_4 %340 = OpConstantComposite %336 %337 %338 %339 
					                      Private bool* %342 = OpVariable Private 
					                                    %346 = OpTypePointer Function %51 
					                              f32_3 %353 = OpConstantComposite %10 %10 %10 
					                              f32_3 %359 = OpConstantComposite %336 %336 %336 
					                                f32 %376 = OpConstant 3,674022E-40 
					                              f32_2 %377 = OpConstantComposite %376 %376 
					                      Private bool* %381 = OpVariable Private 
					                              f32_3 %409 = OpConstantComposite %337 %337 %337 
					                              f32_3 %415 = OpConstantComposite %338 %338 %338 
					                      Private bool* %456 = OpVariable Private 
					                              f32_3 %512 = OpConstantComposite %45 %45 %45 
					                                u32 %517 = OpConstant 3 
					                                    %528 = OpTypePointer Output %7 
					                      Output f32_4* %529 = OpVariable Output 
					                                    %536 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                    Function f32_3* %347 = OpVariable Function 
					                    Function f32_3* %387 = OpVariable Function 
					                    Function f32_3* %398 = OpVariable Function 
					                    Function f32_3* %420 = OpVariable Function 
					                    Function f32_3* %433 = OpVariable Function 
					                    Function f32_3* %463 = OpVariable Function 
					                    Function f32_3* %476 = OpVariable Function 
					                    Function f32_3* %509 = OpVariable Function 
					                    Function f32_3* %520 = OpVariable Function 
					                      Uniform f32_4* %18 = OpAccessChain %14 %16 
					                               f32_4 %19 = OpLoad %18 
					                               f32_4 %20 = OpVectorShuffle %19 %19 0 1 0 1 
					                               f32_4 %21 = OpFDiv %11 %20 
					                                             OpStore %9 %21 
					                               f32_2 %26 = OpLoad vs_TEXCOORD0 
					                               f32_4 %27 = OpVectorShuffle %26 %26 0 1 0 1 
					                      Uniform f32_4* %29 = OpAccessChain %14 %28 
					                               f32_4 %30 = OpLoad %29 
					                               f32_4 %31 = OpVectorShuffle %30 %30 0 1 0 1 
					                               f32_4 %32 = OpFMul %27 %31 
					                      Uniform f32_4* %33 = OpAccessChain %14 %28 
					                               f32_4 %34 = OpLoad %33 
					                               f32_4 %35 = OpVectorShuffle %34 %34 2 3 2 3 
					                               f32_4 %36 = OpFAdd %32 %35 
					                                             OpStore %22 %36 
					                               f32_4 %38 = OpLoad %22 
					                               f32_4 %39 = OpVectorShuffle %38 %38 2 3 2 3 
					                      Uniform f32_4* %40 = OpAccessChain %14 %16 
					                               f32_4 %41 = OpLoad %40 
					                               f32_4 %42 = OpVectorShuffle %41 %41 0 1 0 1 
					                               f32_4 %43 = OpFMul %39 %42 
					                               f32_4 %47 = OpFAdd %43 %46 
					                                             OpStore %37 %47 
					                               f32_4 %48 = OpLoad %9 
					                               f32_4 %49 = OpLoad %37 
					                               f32_4 %50 = OpFMul %48 %49 
					                                             OpStore %37 %50 
					                 read_only Texture2D %57 = OpLoad %56 
					                             sampler %61 = OpLoad %60 
					          read_only Texture2DSampled %63 = OpSampledImage %57 %61 
					                               f32_4 %64 = OpLoad %37 
					                               f32_2 %65 = OpVectorShuffle %64 %64 0 1 
					                               f32_4 %66 = OpImageSampleImplicitLod %63 %65 
					                               f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
					                                             OpStore %53 %67 
					                 read_only Texture2D %69 = OpLoad %56 
					                             sampler %70 = OpLoad %60 
					          read_only Texture2DSampled %71 = OpSampledImage %69 %70 
					                               f32_4 %72 = OpLoad %37 
					                               f32_2 %73 = OpVectorShuffle %72 %72 2 3 
					                               f32_4 %74 = OpImageSampleImplicitLod %71 %73 
					                               f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
					                                             OpStore %68 %75 
					                               f32_3 %78 = OpLoad %68 
					                                 f32 %83 = OpDot %78 %82 
					                                             OpStore %77 %83 
					                               f32_3 %85 = OpLoad %53 
					                                 f32 %86 = OpDot %85 %82 
					                                             OpStore %84 %86 
					                               f32_4 %88 = OpLoad %22 
					                               f32_4 %89 = OpVectorShuffle %88 %88 2 3 2 3 
					                      Uniform f32_4* %90 = OpAccessChain %14 %16 
					                               f32_4 %91 = OpLoad %90 
					                               f32_4 %92 = OpVectorShuffle %91 %91 0 1 0 1 
					                               f32_4 %93 = OpFMul %89 %92 
					                               f32_4 %95 = OpFAdd %93 %94 
					                                             OpStore %87 %95 
					                               f32_4 %96 = OpLoad %9 
					                               f32_4 %97 = OpLoad %87 
					                               f32_4 %98 = OpFMul %96 %97 
					                                             OpStore %87 %98 
					                read_only Texture2D %100 = OpLoad %56 
					                            sampler %101 = OpLoad %60 
					         read_only Texture2DSampled %102 = OpSampledImage %100 %101 
					                              f32_4 %103 = OpLoad %87 
					                              f32_2 %104 = OpVectorShuffle %103 %103 0 1 
					                              f32_4 %105 = OpImageSampleImplicitLod %102 %104 
					                              f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
					                                             OpStore %99 %106 
					                read_only Texture2D %107 = OpLoad %56 
					                            sampler %108 = OpLoad %60 
					         read_only Texture2DSampled %109 = OpSampledImage %107 %108 
					                              f32_4 %110 = OpLoad %87 
					                              f32_2 %111 = OpVectorShuffle %110 %110 2 3 
					                              f32_4 %112 = OpImageSampleImplicitLod %109 %111 
					                              f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
					                                             OpStore %53 %113 
					                              f32_3 %115 = OpLoad %53 
					                                f32 %116 = OpDot %115 %82 
					                                             OpStore %114 %116 
					                              f32_3 %118 = OpLoad %99 
					                                f32 %119 = OpDot %118 %82 
					                                             OpStore %117 %119 
					                                f32 %121 = OpLoad %117 
					                                f32 %122 = OpFNegate %121 
					                                f32 %123 = OpLoad %84 
					                                f32 %124 = OpFNegate %123 
					                                f32 %125 = OpFAdd %122 %124 
					                                             OpStore %120 %125 
					                                f32 %126 = OpLoad %77 
					                                f32 %128 = OpFMul %126 %127 
					                                f32 %129 = OpLoad %84 
					                                f32 %130 = OpFNegate %129 
					                                f32 %131 = OpFAdd %128 %130 
					                                             OpStore %84 %131 
					                                f32 %132 = OpLoad %77 
					                                f32 %133 = OpFNegate %132 
					                                f32 %134 = OpLoad %84 
					                                f32 %135 = OpFAdd %133 %134 
					                                             OpStore %77 %135 
					                                f32 %136 = OpLoad %117 
					                                f32 %137 = OpLoad %77 
					                                f32 %138 = OpFAdd %136 %137 
					                                             OpStore %77 %138 
					                                f32 %139 = OpLoad %114 
					                                f32 %141 = OpFMul %139 %140 
					                                f32 %142 = OpLoad %77 
					                                f32 %143 = OpFAdd %141 %142 
					                                             OpStore %77 %143 
					                              f32_4 %145 = OpLoad %22 
					                              f32_4 %146 = OpVectorShuffle %145 %145 2 3 2 3 
					                     Uniform f32_4* %147 = OpAccessChain %14 %16 
					                              f32_4 %148 = OpLoad %147 
					                              f32_4 %149 = OpVectorShuffle %148 %148 0 1 0 1 
					                              f32_4 %150 = OpFMul %146 %149 
					                              f32_4 %152 = OpFAdd %150 %151 
					                                             OpStore %144 %152 
					                              f32_4 %153 = OpLoad %9 
					                              f32_4 %154 = OpLoad %144 
					                              f32_4 %155 = OpFMul %153 %154 
					                                             OpStore %144 %155 
					                read_only Texture2D %157 = OpLoad %56 
					                            sampler %158 = OpLoad %60 
					         read_only Texture2DSampled %159 = OpSampledImage %157 %158 
					                              f32_4 %160 = OpLoad %144 
					                              f32_2 %161 = OpVectorShuffle %160 %160 0 1 
					                              f32_4 %162 = OpImageSampleImplicitLod %159 %161 
					                              f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
					                                             OpStore %156 %163 
					                read_only Texture2D %165 = OpLoad %56 
					                            sampler %166 = OpLoad %60 
					         read_only Texture2DSampled %167 = OpSampledImage %165 %166 
					                              f32_4 %168 = OpLoad %144 
					                              f32_2 %169 = OpVectorShuffle %168 %168 2 3 
					                              f32_4 %170 = OpImageSampleImplicitLod %167 %169 
					                              f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
					                                             OpStore %164 %171 
					                              f32_3 %173 = OpLoad %164 
					                                f32 %174 = OpDot %173 %82 
					                                             OpStore %172 %174 
					                              f32_3 %175 = OpLoad %156 
					                                f32 %176 = OpDot %175 %82 
					                                             OpStore %84 %176 
					                                f32 %177 = OpLoad %84 
					                                f32 %178 = OpLoad %120 
					                                f32 %179 = OpFAdd %177 %178 
					                                             OpStore %114 %179 
					                                f32 %180 = OpLoad %84 
					                                f32 %181 = OpLoad %77 
					                                f32 %182 = OpFAdd %180 %181 
					                                             OpStore %77 %182 
					                                f32 %183 = OpLoad %172 
					                                f32 %184 = OpFMul %183 %127 
					                                f32 %185 = OpLoad %114 
					                                f32 %186 = OpFAdd %184 %185 
					                                             OpStore %84 %186 
					                              f32_4 %187 = OpLoad %22 
					                     Uniform f32_4* %188 = OpAccessChain %14 %16 
					                              f32_4 %189 = OpLoad %188 
					                              f32_4 %190 = OpVectorShuffle %189 %189 0 1 0 1 
					                              f32_4 %191 = OpFMul %187 %190 
					                              f32_4 %193 = OpFAdd %191 %192 
					                                             OpStore %87 %193 
					                              f32_4 %194 = OpLoad %9 
					                              f32_4 %195 = OpLoad %87 
					                              f32_4 %196 = OpFMul %194 %195 
					                                             OpStore %9 %196 
					                read_only Texture2D %197 = OpLoad %56 
					                            sampler %198 = OpLoad %60 
					         read_only Texture2DSampled %199 = OpSampledImage %197 %198 
					                              f32_4 %200 = OpLoad %9 
					                              f32_2 %201 = OpVectorShuffle %200 %200 0 1 
					                              f32_4 %202 = OpImageSampleImplicitLod %199 %201 
					                              f32_3 %203 = OpVectorShuffle %202 %202 0 1 2 
					                                             OpStore %53 %203 
					                read_only Texture2D %205 = OpLoad %56 
					                            sampler %206 = OpLoad %60 
					         read_only Texture2DSampled %207 = OpSampledImage %205 %206 
					                              f32_4 %208 = OpLoad %9 
					                              f32_2 %209 = OpVectorShuffle %208 %208 2 3 
					                              f32_4 %210 = OpImageSampleImplicitLod %207 %209 
					                              f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
					                                             OpStore %204 %211 
					                              f32_3 %213 = OpLoad %204 
					                                f32 %214 = OpDot %213 %82 
					                                             OpStore %212 %214 
					                              f32_3 %216 = OpLoad %53 
					                                f32 %217 = OpDot %216 %82 
					                                             OpStore %215 %217 
					                                f32 %218 = OpLoad %215 
					                                f32 %219 = OpLoad %84 
					                                f32 %220 = OpFAdd %218 %219 
					                                             OpStore %215 %220 
					                                f32 %221 = OpLoad %212 
					                                f32 %222 = OpFMul %221 %140 
					                                f32 %223 = OpLoad %215 
					                                f32 %224 = OpFAdd %222 %223 
					                                             OpStore %212 %224 
					                                f32 %225 = OpLoad %212 
					                                f32 %226 = OpLoad %212 
					                                f32 %227 = OpFMul %225 %226 
					                                             OpStore %212 %227 
					                                f32 %228 = OpLoad %77 
					                                f32 %229 = OpLoad %77 
					                                f32 %230 = OpFMul %228 %229 
					                                f32 %231 = OpLoad %212 
					                                f32 %232 = OpFAdd %230 %231 
					                                             OpStore %212 %232 
					                                f32 %233 = OpLoad %212 
					                                f32 %234 = OpFNegate %233 
					                                f32 %235 = OpFAdd %234 %10 
					                                             OpStore %212 %235 
					                              f32_4 %237 = OpLoad %22 
					                              f32_2 %238 = OpVectorShuffle %237 %237 2 3 
					                     Uniform f32_4* %239 = OpAccessChain %14 %16 
					                              f32_4 %240 = OpLoad %239 
					                              f32_2 %241 = OpVectorShuffle %240 %240 0 1 
					                              f32_2 %242 = OpFMul %238 %241 
					                              f32_3 %243 = OpLoad %236 
					                              f32_3 %244 = OpVectorShuffle %243 %242 3 4 2 
					                                             OpStore %236 %244 
					                       Private f32* %247 = OpAccessChain %22 %246 
					                                f32 %248 = OpLoad %247 
					                       Uniform f32* %251 = OpAccessChain %14 %16 %249 
					                                f32 %252 = OpLoad %251 
					                                f32 %253 = OpFMul %248 %252 
					                       Private f32* %255 = OpAccessChain %236 %254 
					                                f32 %256 = OpLoad %255 
					                                f32 %257 = OpFNegate %256 
					                                f32 %258 = OpFAdd %253 %257 
					                       Private f32* %259 = OpAccessChain %236 %246 
					                                             OpStore %259 %258 
					                       Private f32* %260 = OpAccessChain %236 %254 
					                                f32 %261 = OpLoad %260 
					                       Private f32* %262 = OpAccessChain %236 %249 
					                                f32 %263 = OpLoad %262 
					                                f32 %264 = OpFAdd %261 %263 
					                       Private f32* %265 = OpAccessChain %236 %249 
					                                             OpStore %265 %264 
					                read_only Texture2D %267 = OpLoad %56 
					                            sampler %268 = OpLoad %60 
					         read_only Texture2DSampled %269 = OpSampledImage %267 %268 
					                              f32_4 %270 = OpLoad %22 
					                              f32_2 %271 = OpVectorShuffle %270 %270 2 3 
					                              f32_4 %272 = OpImageSampleImplicitLod %269 %271 
					                              f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
					                                             OpStore %266 %273 
					                       Private f32* %275 = OpAccessChain %236 %246 
					                                f32 %276 = OpLoad %275 
					                                f32 %278 = OpFMul %276 %277 
					                                             OpStore %274 %278 
					                                f32 %279 = OpLoad %274 
					                                f32 %280 = OpExtInst %1 8 %279 
					                                             OpStore %274 %280 
					                                f32 %281 = OpLoad %274 
					                                f32 %282 = OpFNegate %281 
					                                f32 %284 = OpFMul %282 %283 
					                       Private f32* %285 = OpAccessChain %236 %246 
					                                f32 %286 = OpLoad %285 
					                                f32 %287 = OpFAdd %284 %286 
					                                             OpStore %274 %287 
					                       Uniform f32* %292 = OpAccessChain %14 %291 
					                                f32 %293 = OpLoad %292 
					                                f32 %294 = OpLoad %274 
					                               bool %295 = OpFOrdGreaterThanEqual %293 %294 
					                                             OpStore %290 %295 
					                       Private f32* %297 = OpAccessChain %266 %254 
					                                f32 %298 = OpLoad %297 
					                       Private f32* %299 = OpAccessChain %266 %249 
					                                f32 %300 = OpLoad %299 
					                                f32 %301 = OpExtInst %1 37 %298 %300 
					                                             OpStore %296 %301 
					                       Private f32* %302 = OpAccessChain %266 %246 
					                                f32 %303 = OpLoad %302 
					                                f32 %304 = OpLoad %296 
					                                f32 %305 = OpExtInst %1 37 %303 %304 
					                                             OpStore %296 %305 
					                       Private f32* %306 = OpAccessChain %266 %254 
					                                f32 %307 = OpLoad %306 
					                       Private f32* %308 = OpAccessChain %266 %249 
					                                f32 %309 = OpLoad %308 
					                                f32 %310 = OpExtInst %1 40 %307 %309 
					                                             OpStore %77 %310 
					                       Private f32* %311 = OpAccessChain %266 %246 
					                                f32 %312 = OpLoad %311 
					                                f32 %313 = OpLoad %77 
					                                f32 %314 = OpExtInst %1 40 %312 %313 
					                                             OpStore %77 %314 
					                                f32 %316 = OpLoad %296 
					                                f32 %317 = OpFNegate %316 
					                                f32 %318 = OpLoad %77 
					                                f32 %319 = OpFAdd %317 %318 
					                                             OpStore %315 %319 
					                                f32 %320 = OpLoad %77 
					                                f32 %321 = OpFDiv %10 %320 
					                                             OpStore %77 %321 
					                              f32_3 %322 = OpLoad %266 
					                                f32 %323 = OpLoad %77 
					                              f32_3 %324 = OpCompositeConstruct %323 %323 %323 
					                              f32_3 %325 = OpFMul %322 %324 
					                              f32_4 %326 = OpLoad %37 
					                              f32_4 %327 = OpVectorShuffle %326 %325 4 5 6 3 
					                                             OpStore %37 %327 
					                              f32_3 %328 = OpLoad %266 
					                                f32 %329 = OpDot %328 %82 
					                       Private f32* %330 = OpAccessChain %22 %249 
					                                             OpStore %330 %329 
					                              f32_4 %334 = OpLoad %22 
					                              f32_4 %335 = OpVectorShuffle %334 %334 0 0 0 0 
					                             bool_4 %341 = OpFOrdLessThan %335 %340 
					                                             OpStore %333 %341 
					                                f32 %343 = OpLoad %315 
					                               bool %344 = OpFOrdLessThan %277 %343 
					                                             OpStore %342 %344 
					                               bool %345 = OpLoad %342 
					                                             OpSelectionMerge %349 None 
					                                             OpBranchConditional %345 %348 %352 
					                                    %348 = OpLabel 
					                              f32_4 %350 = OpLoad %37 
					                              f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
					                                             OpStore %347 %351 
					                                             OpBranch %349 
					                                    %352 = OpLabel 
					                                             OpStore %347 %353 
					                                             OpBranch %349 
					                                    %349 = OpLabel 
					                              f32_3 %354 = OpLoad %347 
					                              f32_4 %355 = OpLoad %22 
					                              f32_4 %356 = OpVectorShuffle %355 %354 4 5 6 3 
					                                             OpStore %22 %356 
					                              f32_4 %357 = OpLoad %22 
					                              f32_3 %358 = OpVectorShuffle %357 %357 0 1 2 
					                              f32_3 %360 = OpFMul %358 %359 
					                              f32_4 %361 = OpLoad %37 
					                              f32_4 %362 = OpVectorShuffle %361 %360 4 5 6 3 
					                                             OpStore %37 %362 
					                       Private f32* %363 = OpAccessChain %236 %249 
					                                f32 %364 = OpLoad %363 
					                                f32 %365 = OpFMul %364 %277 
					                                             OpStore %315 %365 
					                                f32 %366 = OpLoad %315 
					                                f32 %367 = OpExtInst %1 8 %366 
					                                             OpStore %315 %367 
					                                f32 %368 = OpLoad %315 
					                                f32 %369 = OpFNegate %368 
					                                f32 %370 = OpFMul %369 %283 
					                       Private f32* %371 = OpAccessChain %236 %249 
					                                f32 %372 = OpLoad %371 
					                                f32 %373 = OpFAdd %370 %372 
					                                             OpStore %315 %373 
					                              f32_3 %374 = OpLoad %236 
					                              f32_2 %375 = OpVectorShuffle %374 %374 0 2 
					                              f32_2 %378 = OpFAdd %375 %377 
					                              f32_3 %379 = OpLoad %236 
					                              f32_3 %380 = OpVectorShuffle %379 %378 3 1 4 
					                                             OpStore %236 %380 
					                       Uniform f32* %382 = OpAccessChain %14 %291 
					                                f32 %383 = OpLoad %382 
					                                f32 %384 = OpLoad %315 
					                               bool %385 = OpFOrdGreaterThanEqual %383 %384 
					                                             OpStore %381 %385 
					                               bool %386 = OpLoad %381 
					                                             OpSelectionMerge %389 None 
					                                             OpBranchConditional %386 %388 %392 
					                                    %388 = OpLabel 
					                              f32_4 %390 = OpLoad %37 
					                              f32_3 %391 = OpVectorShuffle %390 %390 0 1 2 
					                                             OpStore %387 %391 
					                                             OpBranch %389 
					                                    %392 = OpLabel 
					                                             OpStore %387 %353 
					                                             OpBranch %389 
					                                    %389 = OpLabel 
					                              f32_3 %393 = OpLoad %387 
					                              f32_4 %394 = OpLoad %37 
					                              f32_4 %395 = OpVectorShuffle %394 %393 4 5 6 3 
					                                             OpStore %37 %395 
					                      Private bool* %396 = OpAccessChain %333 %249 
					                               bool %397 = OpLoad %396 
					                                             OpSelectionMerge %400 None 
					                                             OpBranchConditional %397 %399 %403 
					                                    %399 = OpLabel 
					                              f32_4 %401 = OpLoad %37 
					                              f32_3 %402 = OpVectorShuffle %401 %401 0 1 2 
					                                             OpStore %398 %402 
					                                             OpBranch %400 
					                                    %403 = OpLabel 
					                                             OpStore %398 %353 
					                                             OpBranch %400 
					                                    %400 = OpLabel 
					                              f32_3 %404 = OpLoad %398 
					                              f32_4 %405 = OpLoad %37 
					                              f32_4 %406 = OpVectorShuffle %405 %404 4 5 6 3 
					                                             OpStore %37 %406 
					                              f32_4 %407 = OpLoad %22 
					                              f32_3 %408 = OpVectorShuffle %407 %407 0 1 2 
					                              f32_3 %410 = OpFMul %408 %409 
					                              f32_4 %411 = OpLoad %144 
					                              f32_4 %412 = OpVectorShuffle %411 %410 4 5 6 3 
					                                             OpStore %144 %412 
					                              f32_4 %413 = OpLoad %22 
					                              f32_3 %414 = OpVectorShuffle %413 %413 0 1 2 
					                              f32_3 %416 = OpFMul %414 %415 
					                              f32_4 %417 = OpLoad %22 
					                              f32_4 %418 = OpVectorShuffle %417 %416 4 5 6 3 
					                                             OpStore %22 %418 
					                               bool %419 = OpLoad %290 
					                                             OpSelectionMerge %422 None 
					                                             OpBranchConditional %419 %421 %425 
					                                    %421 = OpLabel 
					                              f32_4 %423 = OpLoad %144 
					                              f32_3 %424 = OpVectorShuffle %423 %423 0 1 2 
					                                             OpStore %420 %424 
					                                             OpBranch %422 
					                                    %425 = OpLabel 
					                              f32_4 %426 = OpLoad %37 
					                              f32_3 %427 = OpVectorShuffle %426 %426 0 1 2 
					                                             OpStore %420 %427 
					                                             OpBranch %422 
					                                    %422 = OpLabel 
					                              f32_3 %428 = OpLoad %420 
					                              f32_4 %429 = OpLoad %144 
					                              f32_4 %430 = OpVectorShuffle %429 %428 4 5 6 3 
					                                             OpStore %144 %430 
					                      Private bool* %431 = OpAccessChain %333 %254 
					                               bool %432 = OpLoad %431 
					                                             OpSelectionMerge %435 None 
					                                             OpBranchConditional %432 %434 %438 
					                                    %434 = OpLabel 
					                              f32_4 %436 = OpLoad %144 
					                              f32_3 %437 = OpVectorShuffle %436 %436 0 1 2 
					                                             OpStore %433 %437 
					                                             OpBranch %435 
					                                    %438 = OpLabel 
					                              f32_4 %439 = OpLoad %37 
					                              f32_3 %440 = OpVectorShuffle %439 %439 0 1 2 
					                                             OpStore %433 %440 
					                                             OpBranch %435 
					                                    %435 = OpLabel 
					                              f32_3 %441 = OpLoad %433 
					                              f32_4 %442 = OpLoad %37 
					                              f32_4 %443 = OpVectorShuffle %442 %441 4 5 6 3 
					                                             OpStore %37 %443 
					                       Private f32* %444 = OpAccessChain %236 %249 
					                                f32 %445 = OpLoad %444 
					                                f32 %446 = OpFMul %445 %277 
					                                             OpStore %274 %446 
					                                f32 %447 = OpLoad %274 
					                                f32 %448 = OpExtInst %1 8 %447 
					                                             OpStore %274 %448 
					                                f32 %449 = OpLoad %274 
					                                f32 %450 = OpFNegate %449 
					                                f32 %451 = OpFMul %450 %283 
					                       Private f32* %452 = OpAccessChain %236 %249 
					                                f32 %453 = OpLoad %452 
					                                f32 %454 = OpFAdd %451 %453 
					                       Private f32* %455 = OpAccessChain %236 %249 
					                                             OpStore %455 %454 
					                       Uniform f32* %457 = OpAccessChain %14 %291 
					                                f32 %458 = OpLoad %457 
					                       Private f32* %459 = OpAccessChain %236 %249 
					                                f32 %460 = OpLoad %459 
					                               bool %461 = OpFOrdGreaterThanEqual %458 %460 
					                                             OpStore %456 %461 
					                               bool %462 = OpLoad %456 
					                                             OpSelectionMerge %465 None 
					                                             OpBranchConditional %462 %464 %468 
					                                    %464 = OpLabel 
					                              f32_4 %466 = OpLoad %22 
					                              f32_3 %467 = OpVectorShuffle %466 %466 0 1 2 
					                                             OpStore %463 %467 
					                                             OpBranch %465 
					                                    %468 = OpLabel 
					                              f32_4 %469 = OpLoad %37 
					                              f32_3 %470 = OpVectorShuffle %469 %469 0 1 2 
					                                             OpStore %463 %470 
					                                             OpBranch %465 
					                                    %465 = OpLabel 
					                              f32_3 %471 = OpLoad %463 
					                              f32_4 %472 = OpLoad %22 
					                              f32_4 %473 = OpVectorShuffle %472 %471 4 5 6 3 
					                                             OpStore %22 %473 
					                      Private bool* %474 = OpAccessChain %333 %246 
					                               bool %475 = OpLoad %474 
					                                             OpSelectionMerge %478 None 
					                                             OpBranchConditional %475 %477 %481 
					                                    %477 = OpLabel 
					                              f32_4 %479 = OpLoad %22 
					                              f32_3 %480 = OpVectorShuffle %479 %479 0 1 2 
					                                             OpStore %476 %480 
					                                             OpBranch %478 
					                                    %481 = OpLabel 
					                              f32_4 %482 = OpLoad %37 
					                              f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
					                                             OpStore %476 %483 
					                                             OpBranch %478 
					                                    %478 = OpLabel 
					                              f32_3 %484 = OpLoad %476 
					                              f32_4 %485 = OpLoad %22 
					                              f32_4 %486 = OpVectorShuffle %485 %484 4 5 6 3 
					                                             OpStore %22 %486 
					                       Private f32* %487 = OpAccessChain %236 %246 
					                                f32 %488 = OpLoad %487 
					                                f32 %489 = OpFMul %488 %277 
					                       Private f32* %490 = OpAccessChain %236 %249 
					                                             OpStore %490 %489 
					                       Private f32* %491 = OpAccessChain %236 %249 
					                                f32 %492 = OpLoad %491 
					                                f32 %493 = OpExtInst %1 8 %492 
					                       Private f32* %494 = OpAccessChain %236 %249 
					                                             OpStore %494 %493 
					                       Private f32* %495 = OpAccessChain %236 %249 
					                                f32 %496 = OpLoad %495 
					                                f32 %497 = OpFNegate %496 
					                                f32 %498 = OpFMul %497 %283 
					                       Private f32* %499 = OpAccessChain %236 %246 
					                                f32 %500 = OpLoad %499 
					                                f32 %501 = OpFAdd %498 %500 
					                       Private f32* %502 = OpAccessChain %236 %249 
					                                             OpStore %502 %501 
					                       Uniform f32* %503 = OpAccessChain %14 %291 
					                                f32 %504 = OpLoad %503 
					                       Private f32* %505 = OpAccessChain %236 %249 
					                                f32 %506 = OpLoad %505 
					                               bool %507 = OpFOrdGreaterThanEqual %504 %506 
					                                             OpStore %456 %507 
					                               bool %508 = OpLoad %456 
					                                             OpSelectionMerge %511 None 
					                                             OpBranchConditional %508 %510 %513 
					                                    %510 = OpLabel 
					                                             OpStore %509 %512 
					                                             OpBranch %511 
					                                    %513 = OpLabel 
					                              f32_4 %514 = OpLoad %22 
					                              f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
					                                             OpStore %509 %515 
					                                             OpBranch %511 
					                                    %511 = OpLabel 
					                              f32_3 %516 = OpLoad %509 
					                                             OpStore %236 %516 
					                      Private bool* %518 = OpAccessChain %333 %517 
					                               bool %519 = OpLoad %518 
					                                             OpSelectionMerge %522 None 
					                                             OpBranchConditional %519 %521 %524 
					                                    %521 = OpLabel 
					                              f32_3 %523 = OpLoad %236 
					                                             OpStore %520 %523 
					                                             OpBranch %522 
					                                    %524 = OpLabel 
					                              f32_4 %525 = OpLoad %22 
					                              f32_3 %526 = OpVectorShuffle %525 %525 0 1 2 
					                                             OpStore %520 %526 
					                                             OpBranch %522 
					                                    %522 = OpLabel 
					                              f32_3 %527 = OpLoad %520 
					                                             OpStore %236 %527 
					                                f32 %530 = OpLoad %212 
					                              f32_3 %531 = OpCompositeConstruct %530 %530 %530 
					                              f32_3 %532 = OpLoad %236 
					                              f32_3 %533 = OpFMul %531 %532 
					                              f32_4 %534 = OpLoad %529 
					                              f32_4 %535 = OpVectorShuffle %534 %533 4 5 6 3 
					                                             OpStore %529 %535 
					                        Output f32* %537 = OpAccessChain %529 %517 
					                                             OpStore %537 %10 
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
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					float u_xlat16_3;
					vec4 u_xlat10_3;
					bvec4 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					vec3 u_xlat6;
					float u_xlat16_6;
					bool u_xlatb6;
					float u_xlat16_8;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat16_14;
					float u_xlat19;
					float u_xlat16_19;
					bool u_xlatb19;
					float u_xlat16_20;
					void main()
					{
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat1 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat2 = u_xlat1.zwzw * _ScreenResolution.xyxy + vec4(-1.0, -1.0, -1.0, 0.0);
					    u_xlat2 = u_xlat0 * u_xlat2;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_2 = dot(u_xlat10_2.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_8 = dot(u_xlat10_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat3 = u_xlat1.zwzw * _ScreenResolution.xyxy + vec4(1.0, -1.0, 1.0, 0.0);
					    u_xlat3 = u_xlat0 * u_xlat3;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_14 = dot(u_xlat10_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_20 = dot(u_xlat10_4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_3 = (-u_xlat16_20) + (-u_xlat16_8);
					    u_xlat16_8 = u_xlat16_2 * -2.0 + (-u_xlat16_8);
					    u_xlat16_2 = (-u_xlat16_2) + u_xlat16_8;
					    u_xlat16_2 = u_xlat16_20 + u_xlat16_2;
					    u_xlat16_2 = u_xlat16_14 * 2.0 + u_xlat16_2;
					    u_xlat4 = u_xlat1.zwzw * _ScreenResolution.xyxy + vec4(1.0, 1.0, 0.0, -1.0);
					    u_xlat4 = u_xlat0 * u_xlat4;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_8 = dot(u_xlat10_4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_14 = dot(u_xlat10_5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_20 = u_xlat16_14 + u_xlat16_3;
					    u_xlat16_2 = u_xlat16_14 + u_xlat16_2;
					    u_xlat16_8 = u_xlat16_8 * -2.0 + u_xlat16_20;
					    u_xlat3 = u_xlat1 * _ScreenResolution.xyxy + vec4(-1.0, 1.0, 0.0, 1.0);
					    u_xlat0 = u_xlat0 * u_xlat3;
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_6 = dot(u_xlat10_3.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat16_6 = u_xlat16_6 + u_xlat16_8;
					    u_xlat16_0 = u_xlat16_0 * 2.0 + u_xlat16_6;
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
					    u_xlat16_0 = u_xlat16_2 * u_xlat16_2 + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat6.xy = u_xlat1.zw * _ScreenResolution.xy;
					    u_xlat6.z = u_xlat1.z * _ScreenResolution.x + (-u_xlat6.y);
					    u_xlat6.x = u_xlat6.y + u_xlat6.x;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat12 = u_xlat6.z * 0.100000001;
					    u_xlat12 = floor(u_xlat12);
					    u_xlat12 = (-u_xlat12) * 10.0 + u_xlat6.z;
					    u_xlatb12 = _Distortion>=u_xlat12;
					    u_xlat16_19 = min(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_19 = min(u_xlat10_1.z, u_xlat16_19);
					    u_xlat16_2 = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_2 = max(u_xlat10_1.z, u_xlat16_2);
					    u_xlat19 = (-u_xlat16_19) + u_xlat16_2;
					    u_xlat16_2 = float(1.0) / u_xlat16_2;
					    u_xlat2.xyz = u_xlat10_1.xyz * vec3(u_xlat16_2);
					    u_xlat1.x = dot(u_xlat10_1.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlatb3 = lessThan(u_xlat1.xxxx, vec4(0.800000012, 0.600000024, 0.300000012, 0.150000006));
					    u_xlatb1 = 0.100000001<u_xlat19;
					    u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = u_xlat1.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
					    u_xlat19 = u_xlat6.x * 0.100000001;
					    u_xlat19 = floor(u_xlat19);
					    u_xlat19 = (-u_xlat19) * 10.0 + u_xlat6.x;
					    u_xlat6.xz = u_xlat6.xz + vec2(-5.0, -5.0);
					    u_xlatb19 = _Distortion>=u_xlat19;
					    u_xlat2.xyz = (bool(u_xlatb19)) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat2.xyz = (u_xlatb3.x) ? u_xlat2.xyz : vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = u_xlat1.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat4.xyz = (bool(u_xlatb12)) ? u_xlat4.xyz : u_xlat2.xyz;
					    u_xlat2.xyz = (u_xlatb3.y) ? u_xlat4.xyz : u_xlat2.xyz;
					    u_xlat12 = u_xlat6.x * 0.100000001;
					    u_xlat12 = floor(u_xlat12);
					    u_xlat6.x = (-u_xlat12) * 10.0 + u_xlat6.x;
					    u_xlatb6 = _Distortion>=u_xlat6.x;
					    u_xlat1.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat2.xyz;
					    u_xlat1.xyz = (u_xlatb3.z) ? u_xlat1.xyz : u_xlat2.xyz;
					    u_xlat6.x = u_xlat6.z * 0.100000001;
					    u_xlat6.x = floor(u_xlat6.x);
					    u_xlat6.x = (-u_xlat6.x) * 10.0 + u_xlat6.z;
					    u_xlatb6 = _Distortion>=u_xlat6.x;
					    u_xlat6.xyz = (bool(u_xlatb6)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
					    u_xlat6.xyz = (u_xlatb3.w) ? u_xlat6.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat6.xyz;
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