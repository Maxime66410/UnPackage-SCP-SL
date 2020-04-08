Shader "CameraFilterPack/CameraFilterPack_NewGlitch4" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 34666
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
					uniform 	float _Speed;
					uniform 	float Fade;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec3 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bvec2 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat10;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = _Speed * _TimeX;
					    u_xlat4.xy = u_xlat0.xx * vec2(0.5, 0.200000003);
					    u_xlatb1.xy = greaterThanEqual(u_xlat4.xyxx, (-u_xlat4.xyxx)).xy;
					    u_xlat4.xy = fract(abs(u_xlat4.xy));
					    u_xlat0.y = (u_xlatb1.x) ? u_xlat4.x : (-u_xlat4.x);
					    u_xlat0.z = (u_xlatb1.y) ? u_xlat4.y : (-u_xlat4.y);
					    u_xlat1.xyz = vs_TEXCOORD0.yxy * vec3(1000.0, -0.00469483575, 0.18083182);
					    u_xlat12 = u_xlat0.x * 10.0 + u_xlat1.x;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatb0.xyz = lessThan(vec4(0.899999976, 0.949999988, 0.75, 0.0), u_xlat0.xyzx).xyz;
					    u_xlat1.xy = vec2(_TimeX) * vec2(vec2(_Speed, _Speed)) + u_xlat1.yz;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat12 = cos(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.00999999978 + vs_TEXCOORD0.x;
					    u_xlat2.x = (u_xlatb0.y) ? u_xlat12 : vs_TEXCOORD0.x;
					    u_xlat2.y = vs_TEXCOORD0.y;
					    u_xlat3 = u_xlat2.xyyy * vec4(32.0, 32.0, 32.0, 32.0);
					    u_xlat3 = floor(u_xlat3);
					    u_xlat3 = u_xlat3 + vec4(32.0499992, 236.0, -62.0499992, -36.0);
					    u_xlat4.x = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat4.z = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat4.xz = sin(u_xlat4.xz);
					    u_xlat4.xz = u_xlat4.xz * vec2(43758.5469, 43758.5469);
					    u_xlat3.xy = fract(u_xlat4.xz);
					    u_xlat4.xz = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat4.xz = u_xlat4.xz * vec2(0.015625, 0.015625) + u_xlat2.xy;
					    u_xlat4.xy = (u_xlatb0.z) ? u_xlat4.xz : u_xlat2.xy;
					    u_xlat2 = texture(_MainTex, u_xlat4.xy);
					    u_xlat4.x = dot(u_xlat2.xzy, vec3(0.25, 0.25, 0.5));
					    u_xlat0 = (u_xlatb0.x) ? u_xlat4.xxxx : u_xlat2;
					    u_xlat2 = vs_TEXCOORD0.xyxy * vec4(0.00469483575, -0.18083182, 0.00469483575, 0.18083182);
					    u_xlat2.xy = vec2(_TimeX) * vec2(vec2(_Speed, _Speed)) + (-u_xlat2.xy);
					    u_xlat10.xy = vec2(_TimeX) * vec2(vec2(_Speed, _Speed)) + u_xlat2.zw;
					    u_xlat13 = dot(u_xlat10.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13 = sin(u_xlat13);
					    u_xlat1.w = u_xlat13 * 43758.5469;
					    u_xlat1.xz = fract(u_xlat1.xw);
					    u_xlat13 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13 = sin(u_xlat13);
					    u_xlat13 = u_xlat13 * 43758.5469;
					    u_xlat1.y = fract(u_xlat13);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xyz + vec3(-0.125, -0.125, -0.125);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 + (-u_xlat10_1);
					    SV_Target0 = vec4(vec4(Fade, Fade, Fade, Fade)) * u_xlat0 + u_xlat10_1;
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
					; Bound: 407
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %88 %386 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %10 0 Offset 10 
					                                              OpMemberDecorate %10 1 Offset 10 
					                                              OpMemberDecorate %10 2 Offset 10 
					                                              OpDecorate %10 Block 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate vs_TEXCOORD0 Location 88 
					                                              OpDecorate %266 RelaxedPrecision 
					                                              OpDecorate %266 DescriptorSet 266 
					                                              OpDecorate %266 Binding 266 
					                                              OpDecorate %267 RelaxedPrecision 
					                                              OpDecorate %270 RelaxedPrecision 
					                                              OpDecorate %270 DescriptorSet 270 
					                                              OpDecorate %270 Binding 270 
					                                              OpDecorate %271 RelaxedPrecision 
					                                              OpDecorate %375 RelaxedPrecision 
					                                              OpDecorate %376 RelaxedPrecision 
					                                              OpDecorate %377 RelaxedPrecision 
					                                              OpDecorate %382 RelaxedPrecision 
					                                              OpDecorate %383 RelaxedPrecision 
					                                              OpDecorate %386 Location 386 
					                                              OpDecorate %404 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeStruct %6 %6 %6 
					                                      %11 = OpTypePointer Uniform %10 
					     Uniform struct {f32; f32; f32;}* %12 = OpVariable Uniform 
					                                      %13 = OpTypeInt 32 1 
					                                  i32 %14 = OpConstant 1 
					                                      %15 = OpTypePointer Uniform %6 
					                                  i32 %18 = OpConstant 0 
					                                      %22 = OpTypeInt 32 0 
					                                  u32 %23 = OpConstant 0 
					                                      %24 = OpTypePointer Private %6 
					                                      %26 = OpTypeVector %6 3 
					                                      %27 = OpTypePointer Private %26 
					                       Private f32_3* %28 = OpVariable Private 
					                                      %29 = OpTypeVector %6 2 
					                                  f32 %32 = OpConstant 3,674022E-40 
					                                  f32 %33 = OpConstant 3,674022E-40 
					                                f32_2 %34 = OpConstantComposite %32 %33 
					                                      %38 = OpTypeBool 
					                                      %39 = OpTypeVector %38 2 
					                                      %40 = OpTypePointer Private %39 
					                      Private bool_2* %41 = OpVariable Private 
					                                      %47 = OpTypeVector %38 4 
					                                      %56 = OpTypePointer Private %38 
					                                      %59 = OpTypePointer Function %6 
					                                  u32 %70 = OpConstant 1 
					                                  u32 %84 = OpConstant 2 
					                       Private f32_4* %86 = OpVariable Private 
					                                      %87 = OpTypePointer Input %29 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                  f32 %91 = OpConstant 3,674022E-40 
					                                  f32 %92 = OpConstant 3,674022E-40 
					                                  f32 %93 = OpConstant 3,674022E-40 
					                                f32_3 %94 = OpConstantComposite %91 %92 %93 
					                         Private f32* %98 = OpVariable Private 
					                                 f32 %101 = OpConstant 3,674022E-40 
					                                 f32 %108 = OpConstant 3,674022E-40 
					                                 f32 %109 = OpConstant 3,674022E-40 
					                               f32_2 %110 = OpConstantComposite %108 %109 
					                                 f32 %119 = OpConstant 3,674022E-40 
					                                     %126 = OpTypeVector %38 3 
					                                     %127 = OpTypePointer Private %126 
					                     Private bool_3* %128 = OpVariable Private 
					                                 f32 %129 = OpConstant 3,674022E-40 
					                                 f32 %130 = OpConstant 3,674022E-40 
					                                 f32 %131 = OpConstant 3,674022E-40 
					                                 f32 %132 = OpConstant 3,674022E-40 
					                               f32_4 %133 = OpConstantComposite %129 %130 %131 %132 
					                                 f32 %170 = OpConstant 3,674022E-40 
					                                     %172 = OpTypePointer Input %6 
					                      Private f32_4* %176 = OpVariable Private 
					                      Private f32_4* %191 = OpVariable Private 
					                                 f32 %194 = OpConstant 3,674022E-40 
					                               f32_4 %195 = OpConstantComposite %194 %194 %194 %194 
					                                 f32 %200 = OpConstant 3,674022E-40 
					                                 f32 %201 = OpConstant 3,674022E-40 
					                                 f32 %202 = OpConstant 3,674022E-40 
					                                 f32 %203 = OpConstant 3,674022E-40 
					                               f32_4 %204 = OpConstantComposite %200 %201 %202 %203 
					                               f32_2 %221 = OpConstantComposite %119 %119 
					                                 f32 %232 = OpConstant 3,674022E-40 
					                               f32_2 %233 = OpConstantComposite %232 %232 
					                                 f32 %235 = OpConstant 3,674022E-40 
					                               f32_2 %236 = OpConstantComposite %235 %235 
					                                 f32 %242 = OpConstant 3,674022E-40 
					                               f32_2 %243 = OpConstantComposite %242 %242 
					                                     %252 = OpTypePointer Function %29 
					                                     %264 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %265 = OpTypePointer UniformConstant %264 
					UniformConstant read_only Texture2D* %266 = OpVariable UniformConstant 
					                                     %268 = OpTypeSampler 
					                                     %269 = OpTypePointer UniformConstant %268 
					            UniformConstant sampler* %270 = OpVariable UniformConstant 
					                                     %272 = OpTypeSampledImage %264 
					                                 f32 %279 = OpConstant 3,674022E-40 
					                               f32_3 %280 = OpConstantComposite %279 %279 %32 
					                                     %285 = OpTypePointer Function %7 
					                                 f32 %296 = OpConstant 3,674022E-40 
					                                 f32 %297 = OpConstant 3,674022E-40 
					                               f32_4 %298 = OpConstantComposite %296 %297 %296 %93 
					                                     %318 = OpTypePointer Private %29 
					                      Private f32_2* %319 = OpVariable Private 
					                        Private f32* %335 = OpVariable Private 
					                                 u32 %342 = OpConstant 3 
					                               f32_3 %361 = OpConstantComposite %279 %279 %279 
					                                 f32 %370 = OpConstant 3,674022E-40 
					                               f32_3 %371 = OpConstantComposite %370 %370 %370 
					                      Private f32_4* %375 = OpVariable Private 
					                                     %385 = OpTypePointer Output %7 
					                       Output f32_4* %386 = OpVariable Output 
					                                 i32 %387 = OpConstant 2 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function f32* %60 = OpVariable Function 
					                        Function f32* %74 = OpVariable Function 
					                       Function f32* %179 = OpVariable Function 
					                     Function f32_2* %253 = OpVariable Function 
					                     Function f32_4* %286 = OpVariable Function 
					                         Uniform f32* %16 = OpAccessChain %12 %14 
					                                  f32 %17 = OpLoad %16 
					                         Uniform f32* %19 = OpAccessChain %12 %18 
					                                  f32 %20 = OpLoad %19 
					                                  f32 %21 = OpFMul %17 %20 
					                         Private f32* %25 = OpAccessChain %9 %23 
					                                              OpStore %25 %21 
					                                f32_4 %30 = OpLoad %9 
					                                f32_2 %31 = OpVectorShuffle %30 %30 0 0 
					                                f32_2 %35 = OpFMul %31 %34 
					                                f32_3 %36 = OpLoad %28 
					                                f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
					                                              OpStore %28 %37 
					                                f32_3 %42 = OpLoad %28 
					                                f32_4 %43 = OpVectorShuffle %42 %42 0 1 0 0 
					                                f32_3 %44 = OpLoad %28 
					                                f32_4 %45 = OpVectorShuffle %44 %44 0 1 0 0 
					                                f32_4 %46 = OpFNegate %45 
					                               bool_4 %48 = OpFOrdGreaterThanEqual %43 %46 
					                               bool_2 %49 = OpVectorShuffle %48 %48 0 1 
					                                              OpStore %41 %49 
					                                f32_3 %50 = OpLoad %28 
					                                f32_2 %51 = OpVectorShuffle %50 %50 0 1 
					                                f32_2 %52 = OpExtInst %1 4 %51 
					                                f32_2 %53 = OpExtInst %1 10 %52 
					                                f32_3 %54 = OpLoad %28 
					                                f32_3 %55 = OpVectorShuffle %54 %53 3 4 2 
					                                              OpStore %28 %55 
					                        Private bool* %57 = OpAccessChain %41 %23 
					                                 bool %58 = OpLoad %57 
					                                              OpSelectionMerge %62 None 
					                                              OpBranchConditional %58 %61 %65 
					                                      %61 = OpLabel 
					                         Private f32* %63 = OpAccessChain %28 %23 
					                                  f32 %64 = OpLoad %63 
					                                              OpStore %60 %64 
					                                              OpBranch %62 
					                                      %65 = OpLabel 
					                         Private f32* %66 = OpAccessChain %28 %23 
					                                  f32 %67 = OpLoad %66 
					                                  f32 %68 = OpFNegate %67 
					                                              OpStore %60 %68 
					                                              OpBranch %62 
					                                      %62 = OpLabel 
					                                  f32 %69 = OpLoad %60 
					                         Private f32* %71 = OpAccessChain %9 %70 
					                                              OpStore %71 %69 
					                        Private bool* %72 = OpAccessChain %41 %70 
					                                 bool %73 = OpLoad %72 
					                                              OpSelectionMerge %76 None 
					                                              OpBranchConditional %73 %75 %79 
					                                      %75 = OpLabel 
					                         Private f32* %77 = OpAccessChain %28 %70 
					                                  f32 %78 = OpLoad %77 
					                                              OpStore %74 %78 
					                                              OpBranch %76 
					                                      %79 = OpLabel 
					                         Private f32* %80 = OpAccessChain %28 %70 
					                                  f32 %81 = OpLoad %80 
					                                  f32 %82 = OpFNegate %81 
					                                              OpStore %74 %82 
					                                              OpBranch %76 
					                                      %76 = OpLabel 
					                                  f32 %83 = OpLoad %74 
					                         Private f32* %85 = OpAccessChain %9 %84 
					                                              OpStore %85 %83 
					                                f32_2 %89 = OpLoad vs_TEXCOORD0 
					                                f32_3 %90 = OpVectorShuffle %89 %89 1 0 1 
					                                f32_3 %95 = OpFMul %90 %94 
					                                f32_4 %96 = OpLoad %86 
					                                f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
					                                              OpStore %86 %97 
					                         Private f32* %99 = OpAccessChain %9 %23 
					                                 f32 %100 = OpLoad %99 
					                                 f32 %102 = OpFMul %100 %101 
					                        Private f32* %103 = OpAccessChain %86 %23 
					                                 f32 %104 = OpLoad %103 
					                                 f32 %105 = OpFAdd %102 %104 
					                                              OpStore %98 %105 
					                               f32_4 %106 = OpLoad %9 
					                               f32_2 %107 = OpVectorShuffle %106 %106 0 0 
					                                 f32 %111 = OpDot %107 %110 
					                        Private f32* %112 = OpAccessChain %9 %23 
					                                              OpStore %112 %111 
					                        Private f32* %113 = OpAccessChain %9 %23 
					                                 f32 %114 = OpLoad %113 
					                                 f32 %115 = OpExtInst %1 13 %114 
					                        Private f32* %116 = OpAccessChain %9 %23 
					                                              OpStore %116 %115 
					                        Private f32* %117 = OpAccessChain %9 %23 
					                                 f32 %118 = OpLoad %117 
					                                 f32 %120 = OpFMul %118 %119 
					                        Private f32* %121 = OpAccessChain %9 %23 
					                                              OpStore %121 %120 
					                        Private f32* %122 = OpAccessChain %9 %23 
					                                 f32 %123 = OpLoad %122 
					                                 f32 %124 = OpExtInst %1 10 %123 
					                        Private f32* %125 = OpAccessChain %9 %23 
					                                              OpStore %125 %124 
					                               f32_4 %134 = OpLoad %9 
					                               f32_4 %135 = OpVectorShuffle %134 %134 0 1 2 0 
					                              bool_4 %136 = OpFOrdLessThan %133 %135 
					                              bool_3 %137 = OpVectorShuffle %136 %136 0 1 2 
					                                              OpStore %128 %137 
					                        Uniform f32* %138 = OpAccessChain %12 %18 
					                                 f32 %139 = OpLoad %138 
					                               f32_2 %140 = OpCompositeConstruct %139 %139 
					                        Uniform f32* %141 = OpAccessChain %12 %14 
					                                 f32 %142 = OpLoad %141 
					                        Uniform f32* %143 = OpAccessChain %12 %14 
					                                 f32 %144 = OpLoad %143 
					                               f32_2 %145 = OpCompositeConstruct %142 %144 
					                                 f32 %146 = OpCompositeExtract %145 0 
					                                 f32 %147 = OpCompositeExtract %145 1 
					                               f32_2 %148 = OpCompositeConstruct %146 %147 
					                               f32_2 %149 = OpFMul %140 %148 
					                               f32_4 %150 = OpLoad %86 
					                               f32_2 %151 = OpVectorShuffle %150 %150 1 2 
					                               f32_2 %152 = OpFAdd %149 %151 
					                               f32_4 %153 = OpLoad %86 
					                               f32_4 %154 = OpVectorShuffle %153 %152 4 5 2 3 
					                                              OpStore %86 %154 
					                               f32_4 %155 = OpLoad %86 
					                               f32_2 %156 = OpVectorShuffle %155 %155 0 1 
					                                 f32 %157 = OpDot %156 %110 
					                        Private f32* %158 = OpAccessChain %86 %23 
					                                              OpStore %158 %157 
					                        Private f32* %159 = OpAccessChain %86 %23 
					                                 f32 %160 = OpLoad %159 
					                                 f32 %161 = OpExtInst %1 13 %160 
					                        Private f32* %162 = OpAccessChain %86 %23 
					                                              OpStore %162 %161 
					                        Private f32* %163 = OpAccessChain %86 %23 
					                                 f32 %164 = OpLoad %163 
					                                 f32 %165 = OpFMul %164 %119 
					                        Private f32* %166 = OpAccessChain %86 %23 
					                                              OpStore %166 %165 
					                                 f32 %167 = OpLoad %98 
					                                 f32 %168 = OpExtInst %1 14 %167 
					                                              OpStore %98 %168 
					                                 f32 %169 = OpLoad %98 
					                                 f32 %171 = OpFMul %169 %170 
					                          Input f32* %173 = OpAccessChain vs_TEXCOORD0 %23 
					                                 f32 %174 = OpLoad %173 
					                                 f32 %175 = OpFAdd %171 %174 
					                                              OpStore %98 %175 
					                       Private bool* %177 = OpAccessChain %128 %70 
					                                bool %178 = OpLoad %177 
					                                              OpSelectionMerge %181 None 
					                                              OpBranchConditional %178 %180 %183 
					                                     %180 = OpLabel 
					                                 f32 %182 = OpLoad %98 
					                                              OpStore %179 %182 
					                                              OpBranch %181 
					                                     %183 = OpLabel 
					                          Input f32* %184 = OpAccessChain vs_TEXCOORD0 %23 
					                                 f32 %185 = OpLoad %184 
					                                              OpStore %179 %185 
					                                              OpBranch %181 
					                                     %181 = OpLabel 
					                                 f32 %186 = OpLoad %179 
					                        Private f32* %187 = OpAccessChain %176 %23 
					                                              OpStore %187 %186 
					                          Input f32* %188 = OpAccessChain vs_TEXCOORD0 %70 
					                                 f32 %189 = OpLoad %188 
					                        Private f32* %190 = OpAccessChain %176 %70 
					                                              OpStore %190 %189 
					                               f32_4 %192 = OpLoad %176 
					                               f32_4 %193 = OpVectorShuffle %192 %192 0 1 1 1 
					                               f32_4 %196 = OpFMul %193 %195 
					                                              OpStore %191 %196 
					                               f32_4 %197 = OpLoad %191 
					                               f32_4 %198 = OpExtInst %1 8 %197 
					                                              OpStore %191 %198 
					                               f32_4 %199 = OpLoad %191 
					                               f32_4 %205 = OpFAdd %199 %204 
					                                              OpStore %191 %205 
					                               f32_4 %206 = OpLoad %191 
					                               f32_2 %207 = OpVectorShuffle %206 %206 0 1 
					                                 f32 %208 = OpDot %207 %110 
					                        Private f32* %209 = OpAccessChain %28 %23 
					                                              OpStore %209 %208 
					                               f32_4 %210 = OpLoad %191 
					                               f32_2 %211 = OpVectorShuffle %210 %210 2 3 
					                                 f32 %212 = OpDot %211 %110 
					                        Private f32* %213 = OpAccessChain %28 %84 
					                                              OpStore %213 %212 
					                               f32_3 %214 = OpLoad %28 
					                               f32_2 %215 = OpVectorShuffle %214 %214 0 2 
					                               f32_2 %216 = OpExtInst %1 13 %215 
					                               f32_3 %217 = OpLoad %28 
					                               f32_3 %218 = OpVectorShuffle %217 %216 3 1 4 
					                                              OpStore %28 %218 
					                               f32_3 %219 = OpLoad %28 
					                               f32_2 %220 = OpVectorShuffle %219 %219 0 2 
					                               f32_2 %222 = OpFMul %220 %221 
					                               f32_3 %223 = OpLoad %28 
					                               f32_3 %224 = OpVectorShuffle %223 %222 3 1 4 
					                                              OpStore %28 %224 
					                               f32_3 %225 = OpLoad %28 
					                               f32_2 %226 = OpVectorShuffle %225 %225 0 2 
					                               f32_2 %227 = OpExtInst %1 10 %226 
					                               f32_4 %228 = OpLoad %191 
					                               f32_4 %229 = OpVectorShuffle %228 %227 4 5 2 3 
					                                              OpStore %191 %229 
					                               f32_4 %230 = OpLoad %191 
					                               f32_2 %231 = OpVectorShuffle %230 %230 0 1 
					                               f32_2 %234 = OpFMul %231 %233 
					                               f32_2 %237 = OpFAdd %234 %236 
					                               f32_3 %238 = OpLoad %28 
					                               f32_3 %239 = OpVectorShuffle %238 %237 3 1 4 
					                                              OpStore %28 %239 
					                               f32_3 %240 = OpLoad %28 
					                               f32_2 %241 = OpVectorShuffle %240 %240 0 2 
					                               f32_2 %244 = OpFMul %241 %243 
					                               f32_4 %245 = OpLoad %176 
					                               f32_2 %246 = OpVectorShuffle %245 %245 0 1 
					                               f32_2 %247 = OpFAdd %244 %246 
					                               f32_3 %248 = OpLoad %28 
					                               f32_3 %249 = OpVectorShuffle %248 %247 3 1 4 
					                                              OpStore %28 %249 
					                       Private bool* %250 = OpAccessChain %128 %84 
					                                bool %251 = OpLoad %250 
					                                              OpSelectionMerge %255 None 
					                                              OpBranchConditional %251 %254 %258 
					                                     %254 = OpLabel 
					                               f32_3 %256 = OpLoad %28 
					                               f32_2 %257 = OpVectorShuffle %256 %256 0 2 
					                                              OpStore %253 %257 
					                                              OpBranch %255 
					                                     %258 = OpLabel 
					                               f32_4 %259 = OpLoad %176 
					                               f32_2 %260 = OpVectorShuffle %259 %259 0 1 
					                                              OpStore %253 %260 
					                                              OpBranch %255 
					                                     %255 = OpLabel 
					                               f32_2 %261 = OpLoad %253 
					                               f32_3 %262 = OpLoad %28 
					                               f32_3 %263 = OpVectorShuffle %262 %261 3 4 2 
					                                              OpStore %28 %263 
					                 read_only Texture2D %267 = OpLoad %266 
					                             sampler %271 = OpLoad %270 
					          read_only Texture2DSampled %273 = OpSampledImage %267 %271 
					                               f32_3 %274 = OpLoad %28 
					                               f32_2 %275 = OpVectorShuffle %274 %274 0 1 
					                               f32_4 %276 = OpImageSampleImplicitLod %273 %275 
					                                              OpStore %176 %276 
					                               f32_4 %277 = OpLoad %176 
					                               f32_3 %278 = OpVectorShuffle %277 %277 0 2 1 
					                                 f32 %281 = OpDot %278 %280 
					                        Private f32* %282 = OpAccessChain %28 %23 
					                                              OpStore %282 %281 
					                       Private bool* %283 = OpAccessChain %128 %23 
					                                bool %284 = OpLoad %283 
					                                              OpSelectionMerge %288 None 
					                                              OpBranchConditional %284 %287 %291 
					                                     %287 = OpLabel 
					                               f32_3 %289 = OpLoad %28 
					                               f32_4 %290 = OpVectorShuffle %289 %289 0 0 0 0 
					                                              OpStore %286 %290 
					                                              OpBranch %288 
					                                     %291 = OpLabel 
					                               f32_4 %292 = OpLoad %176 
					                                              OpStore %286 %292 
					                                              OpBranch %288 
					                                     %288 = OpLabel 
					                               f32_4 %293 = OpLoad %286 
					                                              OpStore %9 %293 
					                               f32_2 %294 = OpLoad vs_TEXCOORD0 
					                               f32_4 %295 = OpVectorShuffle %294 %294 0 1 0 1 
					                               f32_4 %299 = OpFMul %295 %298 
					                                              OpStore %176 %299 
					                        Uniform f32* %300 = OpAccessChain %12 %18 
					                                 f32 %301 = OpLoad %300 
					                               f32_2 %302 = OpCompositeConstruct %301 %301 
					                        Uniform f32* %303 = OpAccessChain %12 %14 
					                                 f32 %304 = OpLoad %303 
					                        Uniform f32* %305 = OpAccessChain %12 %14 
					                                 f32 %306 = OpLoad %305 
					                               f32_2 %307 = OpCompositeConstruct %304 %306 
					                                 f32 %308 = OpCompositeExtract %307 0 
					                                 f32 %309 = OpCompositeExtract %307 1 
					                               f32_2 %310 = OpCompositeConstruct %308 %309 
					                               f32_2 %311 = OpFMul %302 %310 
					                               f32_4 %312 = OpLoad %176 
					                               f32_2 %313 = OpVectorShuffle %312 %312 0 1 
					                               f32_2 %314 = OpFNegate %313 
					                               f32_2 %315 = OpFAdd %311 %314 
					                               f32_4 %316 = OpLoad %176 
					                               f32_4 %317 = OpVectorShuffle %316 %315 4 5 2 3 
					                                              OpStore %176 %317 
					                        Uniform f32* %320 = OpAccessChain %12 %18 
					                                 f32 %321 = OpLoad %320 
					                               f32_2 %322 = OpCompositeConstruct %321 %321 
					                        Uniform f32* %323 = OpAccessChain %12 %14 
					                                 f32 %324 = OpLoad %323 
					                        Uniform f32* %325 = OpAccessChain %12 %14 
					                                 f32 %326 = OpLoad %325 
					                               f32_2 %327 = OpCompositeConstruct %324 %326 
					                                 f32 %328 = OpCompositeExtract %327 0 
					                                 f32 %329 = OpCompositeExtract %327 1 
					                               f32_2 %330 = OpCompositeConstruct %328 %329 
					                               f32_2 %331 = OpFMul %322 %330 
					                               f32_4 %332 = OpLoad %176 
					                               f32_2 %333 = OpVectorShuffle %332 %332 2 3 
					                               f32_2 %334 = OpFAdd %331 %333 
					                                              OpStore %319 %334 
					                               f32_2 %336 = OpLoad %319 
					                                 f32 %337 = OpDot %336 %110 
					                                              OpStore %335 %337 
					                                 f32 %338 = OpLoad %335 
					                                 f32 %339 = OpExtInst %1 13 %338 
					                                              OpStore %335 %339 
					                                 f32 %340 = OpLoad %335 
					                                 f32 %341 = OpFMul %340 %119 
					                        Private f32* %343 = OpAccessChain %86 %342 
					                                              OpStore %343 %341 
					                               f32_4 %344 = OpLoad %86 
					                               f32_2 %345 = OpVectorShuffle %344 %344 0 3 
					                               f32_2 %346 = OpExtInst %1 10 %345 
					                               f32_4 %347 = OpLoad %86 
					                               f32_4 %348 = OpVectorShuffle %347 %346 4 1 5 3 
					                                              OpStore %86 %348 
					                               f32_4 %349 = OpLoad %176 
					                               f32_2 %350 = OpVectorShuffle %349 %349 0 1 
					                                 f32 %351 = OpDot %350 %110 
					                                              OpStore %335 %351 
					                                 f32 %352 = OpLoad %335 
					                                 f32 %353 = OpExtInst %1 13 %352 
					                                              OpStore %335 %353 
					                                 f32 %354 = OpLoad %335 
					                                 f32 %355 = OpFMul %354 %119 
					                                              OpStore %335 %355 
					                                 f32 %356 = OpLoad %335 
					                                 f32 %357 = OpExtInst %1 10 %356 
					                        Private f32* %358 = OpAccessChain %86 %70 
					                                              OpStore %358 %357 
					                               f32_4 %359 = OpLoad %86 
					                               f32_3 %360 = OpVectorShuffle %359 %359 0 1 2 
					                               f32_3 %362 = OpFMul %360 %361 
					                               f32_4 %363 = OpLoad %9 
					                               f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
					                               f32_3 %365 = OpFAdd %362 %364 
					                               f32_4 %366 = OpLoad %86 
					                               f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
					                                              OpStore %86 %367 
					                               f32_4 %368 = OpLoad %86 
					                               f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
					                               f32_3 %372 = OpFAdd %369 %371 
					                               f32_4 %373 = OpLoad %9 
					                               f32_4 %374 = OpVectorShuffle %373 %372 4 5 6 3 
					                                              OpStore %9 %374 
					                 read_only Texture2D %376 = OpLoad %266 
					                             sampler %377 = OpLoad %270 
					          read_only Texture2DSampled %378 = OpSampledImage %376 %377 
					                               f32_2 %379 = OpLoad vs_TEXCOORD0 
					                               f32_4 %380 = OpImageSampleImplicitLod %378 %379 
					                                              OpStore %375 %380 
					                               f32_4 %381 = OpLoad %9 
					                               f32_4 %382 = OpLoad %375 
					                               f32_4 %383 = OpFNegate %382 
					                               f32_4 %384 = OpFAdd %381 %383 
					                                              OpStore %9 %384 
					                        Uniform f32* %388 = OpAccessChain %12 %387 
					                                 f32 %389 = OpLoad %388 
					                        Uniform f32* %390 = OpAccessChain %12 %387 
					                                 f32 %391 = OpLoad %390 
					                        Uniform f32* %392 = OpAccessChain %12 %387 
					                                 f32 %393 = OpLoad %392 
					                        Uniform f32* %394 = OpAccessChain %12 %387 
					                                 f32 %395 = OpLoad %394 
					                               f32_4 %396 = OpCompositeConstruct %389 %391 %393 %395 
					                                 f32 %397 = OpCompositeExtract %396 0 
					                                 f32 %398 = OpCompositeExtract %396 1 
					                                 f32 %399 = OpCompositeExtract %396 2 
					                                 f32 %400 = OpCompositeExtract %396 3 
					                               f32_4 %401 = OpCompositeConstruct %397 %398 %399 %400 
					                               f32_4 %402 = OpLoad %9 
					                               f32_4 %403 = OpFMul %401 %402 
					                               f32_4 %404 = OpLoad %375 
					                               f32_4 %405 = OpFAdd %403 %404 
					                                              OpStore %386 %405 
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
						float _Speed;
						float Fade;
						vec4 unused_0_4[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec3 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bvec2 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat10;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0.x = _Speed * _TimeX;
					    u_xlat4.xy = u_xlat0.xx * vec2(0.5, 0.200000003);
					    u_xlatb1.xy = greaterThanEqual(u_xlat4.xyxx, (-u_xlat4.xyxx)).xy;
					    u_xlat4.xy = fract(abs(u_xlat4.xy));
					    u_xlat0.y = (u_xlatb1.x) ? u_xlat4.x : (-u_xlat4.x);
					    u_xlat0.z = (u_xlatb1.y) ? u_xlat4.y : (-u_xlat4.y);
					    u_xlat1.xyz = vs_TEXCOORD0.yxy * vec3(1000.0, -0.00469483575, 0.18083182);
					    u_xlat12 = u_xlat0.x * 10.0 + u_xlat1.x;
					    u_xlat0.x = dot(u_xlat0.xx, vec2(12.9898005, 78.2330017));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43758.5469;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatb0.xyz = lessThan(vec4(0.899999976, 0.949999988, 0.75, 0.0), u_xlat0.xyzx).xyz;
					    u_xlat1.xy = vec2(_TimeX) * vec2(vec2(_Speed, _Speed)) + u_xlat1.yz;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat12 = cos(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.00999999978 + vs_TEXCOORD0.x;
					    u_xlat2.x = (u_xlatb0.y) ? u_xlat12 : vs_TEXCOORD0.x;
					    u_xlat2.y = vs_TEXCOORD0.y;
					    u_xlat3 = u_xlat2.xyyy * vec4(32.0, 32.0, 32.0, 32.0);
					    u_xlat3 = floor(u_xlat3);
					    u_xlat3 = u_xlat3 + vec4(32.0499992, 236.0, -62.0499992, -36.0);
					    u_xlat4.x = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat4.z = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat4.xz = sin(u_xlat4.xz);
					    u_xlat4.xz = u_xlat4.xz * vec2(43758.5469, 43758.5469);
					    u_xlat3.xy = fract(u_xlat4.xz);
					    u_xlat4.xz = u_xlat3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat4.xz = u_xlat4.xz * vec2(0.015625, 0.015625) + u_xlat2.xy;
					    u_xlat4.xy = (u_xlatb0.z) ? u_xlat4.xz : u_xlat2.xy;
					    u_xlat2 = texture(_MainTex, u_xlat4.xy);
					    u_xlat4.x = dot(u_xlat2.xzy, vec3(0.25, 0.25, 0.5));
					    u_xlat0 = (u_xlatb0.x) ? u_xlat4.xxxx : u_xlat2;
					    u_xlat2 = vs_TEXCOORD0.xyxy * vec4(0.00469483575, -0.18083182, 0.00469483575, 0.18083182);
					    u_xlat2.xy = vec2(_TimeX) * vec2(vec2(_Speed, _Speed)) + (-u_xlat2.xy);
					    u_xlat10.xy = vec2(_TimeX) * vec2(vec2(_Speed, _Speed)) + u_xlat2.zw;
					    u_xlat13 = dot(u_xlat10.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13 = sin(u_xlat13);
					    u_xlat1.w = u_xlat13 * 43758.5469;
					    u_xlat1.xz = fract(u_xlat1.xw);
					    u_xlat13 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13 = sin(u_xlat13);
					    u_xlat13 = u_xlat13 * 43758.5469;
					    u_xlat1.y = fract(u_xlat13);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat1.xyz + vec3(-0.125, -0.125, -0.125);
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 + (-u_xlat10_1);
					    SV_Target0 = vec4(vec4(Fade, Fade, Fade, Fade)) * u_xlat0 + u_xlat10_1;
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