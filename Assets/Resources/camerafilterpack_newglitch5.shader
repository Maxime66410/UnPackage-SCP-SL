Shader "CameraFilterPack/CameraFilterPack_NewGlitch5" {
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
			GpuProgramID 16302
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
					uniform 	float Parasite;
					uniform 	float ZoomX;
					uniform 	float ZoomY;
					uniform 	float PosX;
					uniform 	float PosY;
					uniform 	vec4 _ScreenResolution;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					bvec2 u_xlatb6;
					vec3 u_xlat8;
					float u_xlat10;
					vec2 u_xlat11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.w = Parasite;
					    u_xlat1.x = vs_TEXCOORD0.x + (-PosX);
					    u_xlat6.x = abs(u_xlat1.x) + PosY;
					    u_xlat6.y = vs_TEXCOORD0.y;
					    u_xlat1.xy = u_xlat6.xy + vec2(ZoomX);
					    u_xlat11.x = ZoomY + 1.0;
					    u_xlat0.yz = u_xlat1.xy / u_xlat11.xx;
					    u_xlat1 = u_xlat0.zwzw * vec4(128.0, 128.0, 32.0, 128.0);
					    u_xlat2 = floor(u_xlat1);
					    u_xlat1 = fract(u_xlat1);
					    u_xlat2.xy = u_xlat2.yw * vec2(59.0, 59.0) + u_xlat2.xz;
					    u_xlat3.xyz = u_xlat2.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat3.xyz = sin(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat15 = (-u_xlat3.y) + u_xlat3.z;
					    u_xlat4 = u_xlat1 * u_xlat1;
					    u_xlat1 = (-u_xlat1) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat1 = u_xlat1 * u_xlat4;
					    u_xlat15 = u_xlat1.x * u_xlat15 + u_xlat3.y;
					    u_xlat2.xz = sin(u_xlat2.xy);
					    u_xlat8.xyz = u_xlat2.yyy + vec3(1.0, 59.0, 60.0);
					    u_xlat8.xyz = sin(u_xlat8.xyz);
					    u_xlat8.xyz = u_xlat8.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat8.xyz = fract(u_xlat8.xyz);
					    u_xlat2.xy = u_xlat2.xz * vec2(43812.1758, 43812.1758);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat12 = (-u_xlat2.x) + u_xlat3.x;
					    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
					    u_xlat15 = u_xlat15 + (-u_xlat1.x);
					    u_xlat4.zw = u_xlat1.yy * vec2(u_xlat15) + u_xlat1.xx;
					    u_xlat15 = (-u_xlat8.y) + u_xlat8.z;
					    u_xlat15 = u_xlat1.z * u_xlat15 + u_xlat8.y;
					    u_xlat1.x = (-u_xlat2.y) + u_xlat8.x;
					    u_xlat1.x = u_xlat1.z * u_xlat1.x + u_xlat2.y;
					    u_xlat15 = u_xlat15 + (-u_xlat1.x);
					    u_xlat1.y = u_xlat1.w * u_xlat15 + u_xlat1.x;
					    u_xlat15 = u_xlat1.y + -0.5;
					    u_xlat4.x = u_xlat15 * 1.20000005 + u_xlat4.w;
					    u_xlat15 = (-u_xlat1.y) + u_xlat4.x;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 * _TimeX;
					    u_xlat15 = u_xlat15 * _Speed;
					    u_xlat11.x = u_xlat1.y + u_xlat4.x;
					    u_xlat11.x = sin(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * _TimeX;
					    u_xlat15 = u_xlat11.x * _Speed + u_xlat15;
					    u_xlat15 = fract(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.00100000005;
					    u_xlat1.x = _Speed * _TimeX;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = cos(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat11.x = u_xlat4.w + -0.5;
					    u_xlat4.y = (-u_xlat11.x) * 0.5 + u_xlat4.w;
					    u_xlat11.x = u_xlat4.y * _ScreenResolution.y;
					    u_xlat16 = (-ZoomX) + 1.0;
					    u_xlat11.x = u_xlat11.x / u_xlat16;
					    u_xlat1.x = u_xlat11.x / u_xlat1.x;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = (-u_xlat4.x) * u_xlat4.y + u_xlat15;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat6.x = u_xlat0.z * _ScreenResolution.y;
					    u_xlat1.y = u_xlat6.x / u_xlat16;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.140000001, 0.5);
					    u_xlat6.x = fract(u_xlat1.y);
					    u_xlat15 = u_xlat1.x * u_xlat6.x + u_xlat15;
					    u_xlat15 = u_xlat15 * Parasite;
					    u_xlat1.x = u_xlat15 * _TimeX;
					    u_xlat15 = u_xlat15 * 0.800000012;
					    u_xlat1.x = u_xlat1.x * _Speed;
					    u_xlat1.x = u_xlat1.x * 0.0720000044;
					    u_xlat6.x = u_xlat15 / u_xlat4.y;
					    u_xlat15 = (-u_xlat15) * _TimeX;
					    u_xlat0.w = u_xlat15 * _Speed;
					    u_xlat6.x = u_xlat6.x * Parasite;
					    u_xlat0.x = u_xlat6.x * 2.41000009 + u_xlat0.y;
					    u_xlatb6.xy = greaterThanEqual(u_xlat0.xzxx, (-u_xlat0.xzxx)).xy;
					    u_xlat0.xy = fract(abs(u_xlat0.xz));
					    {
					        vec4 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb6.y) ? u_xlat0.y : (-u_xlat0.y);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(-17280.0, -17280.0, 0.0900000036);
					    u_xlat10 = u_xlat2.y + u_xlat2.x;
					    u_xlat10 = u_xlat2.z + u_xlat10;
					    u_xlat6.x = u_xlat10 * 0.476190507;
					    u_xlat3.xyz = vec3(u_xlat10) * vec3(0.476190507, 0.476190507, 0.476190507) + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.569999993, 0.569999993, 0.569999993);
					    u_xlat0.z = u_xlat1.x / u_xlat6.x;
					    u_xlat0.w = u_xlat0.w / u_xlat6.x;
					    u_xlat1.xy = fract(u_xlat0.xy);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.y * 59.0 + u_xlat0.x;
					    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
					    u_xlat3.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xzw * vec3(43812.1758, 0.0799999982, 0.00800000038);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat3.xyz = sin(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat5 = (-u_xlat3.y) + u_xlat3.z;
					    u_xlat5 = u_xlat1.x * u_xlat5 + u_xlat3.y;
					    u_xlat11.x = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat0.x = u_xlat1.x * u_xlat11.x + u_xlat0.x;
					    u_xlat5 = (-u_xlat0.x) + u_xlat5;
					    u_xlat0.x = u_xlat1.y * u_xlat5 + u_xlat0.x;
					    u_xlat1 = (-u_xlat2) + u_xlat0.xxxx;
					    u_xlat1 = u_xlat0.zzzz * u_xlat1 + u_xlat2;
					    u_xlat1 = u_xlat4 + u_xlat1;
					    u_xlat3 = (-u_xlat2) * u_xlat1 + u_xlat0.xxxx;
					    u_xlat1 = u_xlat1 * u_xlat2;
					    SV_Target0 = u_xlat0.wwww * u_xlat3 + u_xlat1;
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
					; Bound: 741
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %25 %733 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %10 0 Offset 10 
					                                                      OpMemberDecorate %10 1 Offset 10 
					                                                      OpMemberDecorate %10 2 Offset 10 
					                                                      OpMemberDecorate %10 3 Offset 10 
					                                                      OpMemberDecorate %10 4 Offset 10 
					                                                      OpMemberDecorate %10 5 Offset 10 
					                                                      OpMemberDecorate %10 6 Offset 10 
					                                                      OpMemberDecorate %10 7 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 25 
					                                                      OpDecorate %531 RelaxedPrecision 
					                                                      OpDecorate %531 DescriptorSet 531 
					                                                      OpDecorate %531 Binding 531 
					                                                      OpDecorate %532 RelaxedPrecision 
					                                                      OpDecorate %535 RelaxedPrecision 
					                                                      OpDecorate %535 DescriptorSet 535 
					                                                      OpDecorate %535 Binding 535 
					                                                      OpDecorate %536 RelaxedPrecision 
					                                                      OpDecorate %733 Location 733 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %6 %6 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 2 
					                                              %15 = OpTypePointer Uniform %6 
					                                              %18 = OpTypeInt 32 0 
					                                          u32 %19 = OpConstant 3 
					                                              %20 = OpTypePointer Private %6 
					                               Private f32_4* %22 = OpVariable Private 
					                                              %23 = OpTypeVector %6 2 
					                                              %24 = OpTypePointer Input %23 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          u32 %26 = OpConstant 0 
					                                              %27 = OpTypePointer Input %6 
					                                          i32 %30 = OpConstant 5 
					                                              %36 = OpTypePointer Private %23 
					                               Private f32_2* %37 = OpVariable Private 
					                                          i32 %41 = OpConstant 6 
					                                          u32 %46 = OpConstant 1 
					                                          i32 %51 = OpConstant 3 
					                               Private f32_2* %58 = OpVariable Private 
					                                          i32 %59 = OpConstant 4 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                          f32 %74 = OpConstant 3,674022E-40 
					                                          f32 %75 = OpConstant 3,674022E-40 
					                                        f32_4 %76 = OpConstantComposite %74 %74 %75 %74 
					                               Private f32_4* %78 = OpVariable Private 
					                                          f32 %85 = OpConstant 3,674022E-40 
					                                        f32_2 %86 = OpConstantComposite %85 %85 
					                               Private f32_4* %93 = OpVariable Private 
					                                              %94 = OpTypeVector %6 3 
					                                          f32 %97 = OpConstant 3,674022E-40 
					                                        f32_3 %98 = OpConstantComposite %62 %85 %97 
					                                         f32 %109 = OpConstant 3,674022E-40 
					                                       f32_3 %110 = OpConstantComposite %109 %109 %109 
					                                Private f32* %119 = OpVariable Private 
					                                         u32 %123 = OpConstant 2 
					                              Private f32_4* %127 = OpVariable Private 
					                                         f32 %133 = OpConstant 3,674022E-40 
					                                       f32_4 %134 = OpConstantComposite %133 %133 %133 %133 
					                                         f32 %136 = OpConstant 3,674022E-40 
					                                       f32_4 %137 = OpConstantComposite %136 %136 %136 %136 
					                                             %154 = OpTypePointer Private %94 
					                              Private f32_3* %155 = OpVariable Private 
					                                       f32_2 %167 = OpConstantComposite %109 %109 
					                                Private f32* %176 = OpVariable Private 
					                                         f32 %250 = OpConstant 3,674022E-40 
					                                         f32 %253 = OpConstant 3,674022E-40 
					                                         i32 %268 = OpConstant 0 
					                                         i32 %273 = OpConstant 1 
					                                         f32 %303 = OpConstant 3,674022E-40 
					                                         f32 %308 = OpConstant 3,674022E-40 
					                                         f32 %318 = OpConstant 3,674022E-40 
					                                         f32 %319 = OpConstant 3,674022E-40 
					                                       f32_2 %320 = OpConstantComposite %318 %319 
					                                         f32 %329 = OpConstant 3,674022E-40 
					                                         i32 %350 = OpConstant 7 
					                                Private f32* %355 = OpVariable Private 
					                                         f32 %411 = OpConstant 3,674022E-40 
					                                       f32_2 %412 = OpConstantComposite %411 %303 
					                                         f32 %437 = OpConstant 3,674022E-40 
					                                         f32 %447 = OpConstant 3,674022E-40 
					                                         f32 %473 = OpConstant 3,674022E-40 
					                                             %479 = OpTypeBool 
					                                             %480 = OpTypeVector %479 2 
					                                             %481 = OpTypePointer Private %480 
					                             Private bool_2* %482 = OpVariable Private 
					                                             %488 = OpTypeVector %479 4 
					                                             %497 = OpTypePointer Function %7 
					                                             %500 = OpTypePointer Private %479 
					                                             %503 = OpTypePointer Function %6 
					                                             %529 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %530 = OpTypePointer UniformConstant %529 
					        UniformConstant read_only Texture2D* %531 = OpVariable UniformConstant 
					                                             %533 = OpTypeSampler 
					                                             %534 = OpTypePointer UniformConstant %533 
					                    UniformConstant sampler* %535 = OpVariable UniformConstant 
					                                             %537 = OpTypeSampledImage %529 
					                                         f32 %544 = OpConstant 3,674022E-40 
					                                         f32 %545 = OpConstant 3,674022E-40 
					                                       f32_3 %546 = OpConstantComposite %544 %544 %545 
					                                Private f32* %550 = OpVariable Private 
					                                         f32 %561 = OpConstant 3,674022E-40 
					                                       f32_3 %566 = OpConstantComposite %561 %561 %561 
					                                         f32 %575 = OpConstant 3,674022E-40 
					                                       f32_3 %576 = OpConstantComposite %575 %575 %575 
					                                       f32_2 %617 = OpConstantComposite %133 %133 
					                                       f32_2 %619 = OpConstantComposite %136 %136 
					                                         f32 %640 = OpConstant 3,674022E-40 
					                                         f32 %641 = OpConstant 3,674022E-40 
					                                       f32_3 %642 = OpConstantComposite %109 %640 %641 
					                                Private f32* %665 = OpVariable Private 
					                                             %732 = OpTypePointer Output %7 
					                               Output f32_4* %733 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                             Function f32_4* %498 = OpVariable Function 
					                               Function f32* %504 = OpVariable Function 
					                               Function f32* %517 = OpVariable Function 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                 Private f32* %21 = OpAccessChain %9 %19 
					                                                      OpStore %21 %17 
					                                   Input f32* %28 = OpAccessChain vs_TEXCOORD0 %26 
					                                          f32 %29 = OpLoad %28 
					                                 Uniform f32* %31 = OpAccessChain %12 %30 
					                                          f32 %32 = OpLoad %31 
					                                          f32 %33 = OpFNegate %32 
					                                          f32 %34 = OpFAdd %29 %33 
					                                 Private f32* %35 = OpAccessChain %22 %26 
					                                                      OpStore %35 %34 
					                                 Private f32* %38 = OpAccessChain %22 %26 
					                                          f32 %39 = OpLoad %38 
					                                          f32 %40 = OpExtInst %1 4 %39 
					                                 Uniform f32* %42 = OpAccessChain %12 %41 
					                                          f32 %43 = OpLoad %42 
					                                          f32 %44 = OpFAdd %40 %43 
					                                 Private f32* %45 = OpAccessChain %37 %26 
					                                                      OpStore %45 %44 
					                                   Input f32* %47 = OpAccessChain vs_TEXCOORD0 %46 
					                                          f32 %48 = OpLoad %47 
					                                 Private f32* %49 = OpAccessChain %37 %46 
					                                                      OpStore %49 %48 
					                                        f32_2 %50 = OpLoad %37 
					                                 Uniform f32* %52 = OpAccessChain %12 %51 
					                                          f32 %53 = OpLoad %52 
					                                        f32_2 %54 = OpCompositeConstruct %53 %53 
					                                        f32_2 %55 = OpFAdd %50 %54 
					                                        f32_4 %56 = OpLoad %22 
					                                        f32_4 %57 = OpVectorShuffle %56 %55 4 5 2 3 
					                                                      OpStore %22 %57 
					                                 Uniform f32* %60 = OpAccessChain %12 %59 
					                                          f32 %61 = OpLoad %60 
					                                          f32 %63 = OpFAdd %61 %62 
					                                 Private f32* %64 = OpAccessChain %58 %26 
					                                                      OpStore %64 %63 
					                                        f32_4 %65 = OpLoad %22 
					                                        f32_2 %66 = OpVectorShuffle %65 %65 0 1 
					                                        f32_2 %67 = OpLoad %58 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 0 
					                                        f32_2 %69 = OpFDiv %66 %68 
					                                        f32_4 %70 = OpLoad %9 
					                                        f32_4 %71 = OpVectorShuffle %70 %69 0 4 5 3 
					                                                      OpStore %9 %71 
					                                        f32_4 %72 = OpLoad %9 
					                                        f32_4 %73 = OpVectorShuffle %72 %72 2 3 2 3 
					                                        f32_4 %77 = OpFMul %73 %76 
					                                                      OpStore %22 %77 
					                                        f32_4 %79 = OpLoad %22 
					                                        f32_4 %80 = OpExtInst %1 8 %79 
					                                                      OpStore %78 %80 
					                                        f32_4 %81 = OpLoad %22 
					                                        f32_4 %82 = OpExtInst %1 10 %81 
					                                                      OpStore %22 %82 
					                                        f32_4 %83 = OpLoad %78 
					                                        f32_2 %84 = OpVectorShuffle %83 %83 1 3 
					                                        f32_2 %87 = OpFMul %84 %86 
					                                        f32_4 %88 = OpLoad %78 
					                                        f32_2 %89 = OpVectorShuffle %88 %88 0 2 
					                                        f32_2 %90 = OpFAdd %87 %89 
					                                        f32_4 %91 = OpLoad %78 
					                                        f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
					                                                      OpStore %78 %92 
					                                        f32_4 %95 = OpLoad %78 
					                                        f32_3 %96 = OpVectorShuffle %95 %95 0 0 0 
					                                        f32_3 %99 = OpFAdd %96 %98 
					                                       f32_4 %100 = OpLoad %93 
					                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
					                                                      OpStore %93 %101 
					                                       f32_4 %102 = OpLoad %93 
					                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
					                                       f32_3 %104 = OpExtInst %1 13 %103 
					                                       f32_4 %105 = OpLoad %93 
					                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
					                                                      OpStore %93 %106 
					                                       f32_4 %107 = OpLoad %93 
					                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
					                                       f32_3 %111 = OpFMul %108 %110 
					                                       f32_4 %112 = OpLoad %93 
					                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
					                                                      OpStore %93 %113 
					                                       f32_4 %114 = OpLoad %93 
					                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
					                                       f32_3 %116 = OpExtInst %1 10 %115 
					                                       f32_4 %117 = OpLoad %93 
					                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                      OpStore %93 %118 
					                                Private f32* %120 = OpAccessChain %93 %46 
					                                         f32 %121 = OpLoad %120 
					                                         f32 %122 = OpFNegate %121 
					                                Private f32* %124 = OpAccessChain %93 %123 
					                                         f32 %125 = OpLoad %124 
					                                         f32 %126 = OpFAdd %122 %125 
					                                                      OpStore %119 %126 
					                                       f32_4 %128 = OpLoad %22 
					                                       f32_4 %129 = OpLoad %22 
					                                       f32_4 %130 = OpFMul %128 %129 
					                                                      OpStore %127 %130 
					                                       f32_4 %131 = OpLoad %22 
					                                       f32_4 %132 = OpFNegate %131 
					                                       f32_4 %135 = OpFMul %132 %134 
					                                       f32_4 %138 = OpFAdd %135 %137 
					                                                      OpStore %22 %138 
					                                       f32_4 %139 = OpLoad %22 
					                                       f32_4 %140 = OpLoad %127 
					                                       f32_4 %141 = OpFMul %139 %140 
					                                                      OpStore %22 %141 
					                                Private f32* %142 = OpAccessChain %22 %26 
					                                         f32 %143 = OpLoad %142 
					                                         f32 %144 = OpLoad %119 
					                                         f32 %145 = OpFMul %143 %144 
					                                Private f32* %146 = OpAccessChain %93 %46 
					                                         f32 %147 = OpLoad %146 
					                                         f32 %148 = OpFAdd %145 %147 
					                                                      OpStore %119 %148 
					                                       f32_4 %149 = OpLoad %78 
					                                       f32_2 %150 = OpVectorShuffle %149 %149 0 1 
					                                       f32_2 %151 = OpExtInst %1 13 %150 
					                                       f32_4 %152 = OpLoad %78 
					                                       f32_4 %153 = OpVectorShuffle %152 %151 4 1 5 3 
					                                                      OpStore %78 %153 
					                                       f32_4 %156 = OpLoad %78 
					                                       f32_3 %157 = OpVectorShuffle %156 %156 1 1 1 
					                                       f32_3 %158 = OpFAdd %157 %98 
					                                                      OpStore %155 %158 
					                                       f32_3 %159 = OpLoad %155 
					                                       f32_3 %160 = OpExtInst %1 13 %159 
					                                                      OpStore %155 %160 
					                                       f32_3 %161 = OpLoad %155 
					                                       f32_3 %162 = OpFMul %161 %110 
					                                                      OpStore %155 %162 
					                                       f32_3 %163 = OpLoad %155 
					                                       f32_3 %164 = OpExtInst %1 10 %163 
					                                                      OpStore %155 %164 
					                                       f32_4 %165 = OpLoad %78 
					                                       f32_2 %166 = OpVectorShuffle %165 %165 0 2 
					                                       f32_2 %168 = OpFMul %166 %167 
					                                       f32_4 %169 = OpLoad %78 
					                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 2 3 
					                                                      OpStore %78 %170 
					                                       f32_4 %171 = OpLoad %78 
					                                       f32_2 %172 = OpVectorShuffle %171 %171 0 1 
					                                       f32_2 %173 = OpExtInst %1 10 %172 
					                                       f32_4 %174 = OpLoad %78 
					                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 2 3 
					                                                      OpStore %78 %175 
					                                Private f32* %177 = OpAccessChain %78 %26 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpFNegate %178 
					                                Private f32* %180 = OpAccessChain %93 %26 
					                                         f32 %181 = OpLoad %180 
					                                         f32 %182 = OpFAdd %179 %181 
					                                                      OpStore %176 %182 
					                                Private f32* %183 = OpAccessChain %22 %26 
					                                         f32 %184 = OpLoad %183 
					                                         f32 %185 = OpLoad %176 
					                                         f32 %186 = OpFMul %184 %185 
					                                Private f32* %187 = OpAccessChain %78 %26 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpFAdd %186 %188 
					                                Private f32* %190 = OpAccessChain %22 %26 
					                                                      OpStore %190 %189 
					                                         f32 %191 = OpLoad %119 
					                                Private f32* %192 = OpAccessChain %22 %26 
					                                         f32 %193 = OpLoad %192 
					                                         f32 %194 = OpFNegate %193 
					                                         f32 %195 = OpFAdd %191 %194 
					                                                      OpStore %119 %195 
					                                       f32_4 %196 = OpLoad %22 
					                                       f32_2 %197 = OpVectorShuffle %196 %196 1 1 
					                                         f32 %198 = OpLoad %119 
					                                       f32_2 %199 = OpCompositeConstruct %198 %198 
					                                       f32_2 %200 = OpFMul %197 %199 
					                                       f32_4 %201 = OpLoad %22 
					                                       f32_2 %202 = OpVectorShuffle %201 %201 0 0 
					                                       f32_2 %203 = OpFAdd %200 %202 
					                                       f32_4 %204 = OpLoad %127 
					                                       f32_4 %205 = OpVectorShuffle %204 %203 0 1 4 5 
					                                                      OpStore %127 %205 
					                                Private f32* %206 = OpAccessChain %155 %46 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFNegate %207 
					                                Private f32* %209 = OpAccessChain %155 %123 
					                                         f32 %210 = OpLoad %209 
					                                         f32 %211 = OpFAdd %208 %210 
					                                                      OpStore %119 %211 
					                                Private f32* %212 = OpAccessChain %22 %123 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpLoad %119 
					                                         f32 %215 = OpFMul %213 %214 
					                                Private f32* %216 = OpAccessChain %155 %46 
					                                         f32 %217 = OpLoad %216 
					                                         f32 %218 = OpFAdd %215 %217 
					                                                      OpStore %119 %218 
					                                Private f32* %219 = OpAccessChain %78 %46 
					                                         f32 %220 = OpLoad %219 
					                                         f32 %221 = OpFNegate %220 
					                                Private f32* %222 = OpAccessChain %155 %26 
					                                         f32 %223 = OpLoad %222 
					                                         f32 %224 = OpFAdd %221 %223 
					                                Private f32* %225 = OpAccessChain %22 %26 
					                                                      OpStore %225 %224 
					                                Private f32* %226 = OpAccessChain %22 %123 
					                                         f32 %227 = OpLoad %226 
					                                Private f32* %228 = OpAccessChain %22 %26 
					                                         f32 %229 = OpLoad %228 
					                                         f32 %230 = OpFMul %227 %229 
					                                Private f32* %231 = OpAccessChain %78 %46 
					                                         f32 %232 = OpLoad %231 
					                                         f32 %233 = OpFAdd %230 %232 
					                                Private f32* %234 = OpAccessChain %22 %26 
					                                                      OpStore %234 %233 
					                                         f32 %235 = OpLoad %119 
					                                Private f32* %236 = OpAccessChain %22 %26 
					                                         f32 %237 = OpLoad %236 
					                                         f32 %238 = OpFNegate %237 
					                                         f32 %239 = OpFAdd %235 %238 
					                                                      OpStore %119 %239 
					                                Private f32* %240 = OpAccessChain %22 %19 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpLoad %119 
					                                         f32 %243 = OpFMul %241 %242 
					                                Private f32* %244 = OpAccessChain %22 %26 
					                                         f32 %245 = OpLoad %244 
					                                         f32 %246 = OpFAdd %243 %245 
					                                Private f32* %247 = OpAccessChain %22 %46 
					                                                      OpStore %247 %246 
					                                Private f32* %248 = OpAccessChain %22 %46 
					                                         f32 %249 = OpLoad %248 
					                                         f32 %251 = OpFAdd %249 %250 
					                                                      OpStore %119 %251 
					                                         f32 %252 = OpLoad %119 
					                                         f32 %254 = OpFMul %252 %253 
					                                Private f32* %255 = OpAccessChain %127 %19 
					                                         f32 %256 = OpLoad %255 
					                                         f32 %257 = OpFAdd %254 %256 
					                                Private f32* %258 = OpAccessChain %127 %26 
					                                                      OpStore %258 %257 
					                                Private f32* %259 = OpAccessChain %22 %46 
					                                         f32 %260 = OpLoad %259 
					                                         f32 %261 = OpFNegate %260 
					                                Private f32* %262 = OpAccessChain %127 %26 
					                                         f32 %263 = OpLoad %262 
					                                         f32 %264 = OpFAdd %261 %263 
					                                                      OpStore %119 %264 
					                                         f32 %265 = OpLoad %119 
					                                         f32 %266 = OpExtInst %1 13 %265 
					                                                      OpStore %119 %266 
					                                         f32 %267 = OpLoad %119 
					                                Uniform f32* %269 = OpAccessChain %12 %268 
					                                         f32 %270 = OpLoad %269 
					                                         f32 %271 = OpFMul %267 %270 
					                                                      OpStore %119 %271 
					                                         f32 %272 = OpLoad %119 
					                                Uniform f32* %274 = OpAccessChain %12 %273 
					                                         f32 %275 = OpLoad %274 
					                                         f32 %276 = OpFMul %272 %275 
					                                                      OpStore %119 %276 
					                                Private f32* %277 = OpAccessChain %22 %46 
					                                         f32 %278 = OpLoad %277 
					                                Private f32* %279 = OpAccessChain %127 %26 
					                                         f32 %280 = OpLoad %279 
					                                         f32 %281 = OpFAdd %278 %280 
					                                Private f32* %282 = OpAccessChain %58 %26 
					                                                      OpStore %282 %281 
					                                Private f32* %283 = OpAccessChain %58 %26 
					                                         f32 %284 = OpLoad %283 
					                                         f32 %285 = OpExtInst %1 13 %284 
					                                Private f32* %286 = OpAccessChain %58 %26 
					                                                      OpStore %286 %285 
					                                Private f32* %287 = OpAccessChain %58 %26 
					                                         f32 %288 = OpLoad %287 
					                                Uniform f32* %289 = OpAccessChain %12 %268 
					                                         f32 %290 = OpLoad %289 
					                                         f32 %291 = OpFMul %288 %290 
					                                Private f32* %292 = OpAccessChain %58 %26 
					                                                      OpStore %292 %291 
					                                Private f32* %293 = OpAccessChain %58 %26 
					                                         f32 %294 = OpLoad %293 
					                                Uniform f32* %295 = OpAccessChain %12 %273 
					                                         f32 %296 = OpLoad %295 
					                                         f32 %297 = OpFMul %294 %296 
					                                         f32 %298 = OpLoad %119 
					                                         f32 %299 = OpFAdd %297 %298 
					                                                      OpStore %119 %299 
					                                         f32 %300 = OpLoad %119 
					                                         f32 %301 = OpExtInst %1 10 %300 
					                                                      OpStore %119 %301 
					                                         f32 %302 = OpLoad %119 
					                                         f32 %304 = OpFMul %302 %303 
					                                                      OpStore %119 %304 
					                                         f32 %305 = OpLoad %119 
					                                         f32 %306 = OpExtInst %1 13 %305 
					                                                      OpStore %119 %306 
					                                         f32 %307 = OpLoad %119 
					                                         f32 %309 = OpFMul %307 %308 
					                                                      OpStore %119 %309 
					                                Uniform f32* %310 = OpAccessChain %12 %273 
					                                         f32 %311 = OpLoad %310 
					                                Uniform f32* %312 = OpAccessChain %12 %268 
					                                         f32 %313 = OpLoad %312 
					                                         f32 %314 = OpFMul %311 %313 
					                                Private f32* %315 = OpAccessChain %22 %26 
					                                                      OpStore %315 %314 
					                                       f32_4 %316 = OpLoad %22 
					                                       f32_2 %317 = OpVectorShuffle %316 %316 0 1 
					                                         f32 %321 = OpDot %317 %320 
					                                Private f32* %322 = OpAccessChain %22 %26 
					                                                      OpStore %322 %321 
					                                Private f32* %323 = OpAccessChain %22 %26 
					                                         f32 %324 = OpLoad %323 
					                                         f32 %325 = OpExtInst %1 14 %324 
					                                Private f32* %326 = OpAccessChain %22 %26 
					                                                      OpStore %326 %325 
					                                Private f32* %327 = OpAccessChain %22 %26 
					                                         f32 %328 = OpLoad %327 
					                                         f32 %330 = OpFMul %328 %329 
					                                Private f32* %331 = OpAccessChain %22 %26 
					                                                      OpStore %331 %330 
					                                Private f32* %332 = OpAccessChain %22 %26 
					                                         f32 %333 = OpLoad %332 
					                                         f32 %334 = OpExtInst %1 10 %333 
					                                Private f32* %335 = OpAccessChain %22 %26 
					                                                      OpStore %335 %334 
					                                Private f32* %336 = OpAccessChain %127 %19 
					                                         f32 %337 = OpLoad %336 
					                                         f32 %338 = OpFAdd %337 %250 
					                                Private f32* %339 = OpAccessChain %58 %26 
					                                                      OpStore %339 %338 
					                                Private f32* %340 = OpAccessChain %58 %26 
					                                         f32 %341 = OpLoad %340 
					                                         f32 %342 = OpFNegate %341 
					                                         f32 %343 = OpFMul %342 %303 
					                                Private f32* %344 = OpAccessChain %127 %19 
					                                         f32 %345 = OpLoad %344 
					                                         f32 %346 = OpFAdd %343 %345 
					                                Private f32* %347 = OpAccessChain %127 %46 
					                                                      OpStore %347 %346 
					                                Private f32* %348 = OpAccessChain %127 %46 
					                                         f32 %349 = OpLoad %348 
					                                Uniform f32* %351 = OpAccessChain %12 %350 %46 
					                                         f32 %352 = OpLoad %351 
					                                         f32 %353 = OpFMul %349 %352 
					                                Private f32* %354 = OpAccessChain %58 %26 
					                                                      OpStore %354 %353 
					                                Uniform f32* %356 = OpAccessChain %12 %51 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %358 = OpFNegate %357 
					                                         f32 %359 = OpFAdd %358 %62 
					                                                      OpStore %355 %359 
					                                Private f32* %360 = OpAccessChain %58 %26 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpLoad %355 
					                                         f32 %363 = OpFDiv %361 %362 
					                                Private f32* %364 = OpAccessChain %58 %26 
					                                                      OpStore %364 %363 
					                                Private f32* %365 = OpAccessChain %58 %26 
					                                         f32 %366 = OpLoad %365 
					                                Private f32* %367 = OpAccessChain %22 %26 
					                                         f32 %368 = OpLoad %367 
					                                         f32 %369 = OpFDiv %366 %368 
					                                Private f32* %370 = OpAccessChain %22 %26 
					                                                      OpStore %370 %369 
					                                Private f32* %371 = OpAccessChain %22 %26 
					                                         f32 %372 = OpLoad %371 
					                                         f32 %373 = OpExtInst %1 10 %372 
					                                Private f32* %374 = OpAccessChain %22 %26 
					                                                      OpStore %374 %373 
					                                         f32 %375 = OpLoad %119 
					                                Private f32* %376 = OpAccessChain %22 %26 
					                                         f32 %377 = OpLoad %376 
					                                         f32 %378 = OpFMul %375 %377 
					                                                      OpStore %119 %378 
					                                Private f32* %379 = OpAccessChain %127 %26 
					                                         f32 %380 = OpLoad %379 
					                                         f32 %381 = OpFNegate %380 
					                                Private f32* %382 = OpAccessChain %127 %46 
					                                         f32 %383 = OpLoad %382 
					                                         f32 %384 = OpFMul %381 %383 
					                                         f32 %385 = OpLoad %119 
					                                         f32 %386 = OpFAdd %384 %385 
					                                Private f32* %387 = OpAccessChain %22 %26 
					                                                      OpStore %387 %386 
					                                Private f32* %388 = OpAccessChain %22 %26 
					                                         f32 %389 = OpLoad %388 
					                                         f32 %390 = OpExtInst %1 13 %389 
					                                Private f32* %391 = OpAccessChain %22 %26 
					                                                      OpStore %391 %390 
					                                Private f32* %392 = OpAccessChain %22 %46 
					                                         f32 %393 = OpLoad %392 
					                                Private f32* %394 = OpAccessChain %22 %26 
					                                         f32 %395 = OpLoad %394 
					                                         f32 %396 = OpFMul %393 %395 
					                                Private f32* %397 = OpAccessChain %22 %26 
					                                                      OpStore %397 %396 
					                                Private f32* %398 = OpAccessChain %9 %123 
					                                         f32 %399 = OpLoad %398 
					                                Uniform f32* %400 = OpAccessChain %12 %350 %46 
					                                         f32 %401 = OpLoad %400 
					                                         f32 %402 = OpFMul %399 %401 
					                                Private f32* %403 = OpAccessChain %37 %26 
					                                                      OpStore %403 %402 
					                                Private f32* %404 = OpAccessChain %37 %26 
					                                         f32 %405 = OpLoad %404 
					                                         f32 %406 = OpLoad %355 
					                                         f32 %407 = OpFDiv %405 %406 
					                                Private f32* %408 = OpAccessChain %22 %46 
					                                                      OpStore %408 %407 
					                                       f32_4 %409 = OpLoad %22 
					                                       f32_2 %410 = OpVectorShuffle %409 %409 0 1 
					                                       f32_2 %413 = OpFMul %410 %412 
					                                       f32_4 %414 = OpLoad %22 
					                                       f32_4 %415 = OpVectorShuffle %414 %413 4 5 2 3 
					                                                      OpStore %22 %415 
					                                Private f32* %416 = OpAccessChain %22 %46 
					                                         f32 %417 = OpLoad %416 
					                                         f32 %418 = OpExtInst %1 10 %417 
					                                Private f32* %419 = OpAccessChain %37 %26 
					                                                      OpStore %419 %418 
					                                Private f32* %420 = OpAccessChain %22 %26 
					                                         f32 %421 = OpLoad %420 
					                                Private f32* %422 = OpAccessChain %37 %26 
					                                         f32 %423 = OpLoad %422 
					                                         f32 %424 = OpFMul %421 %423 
					                                         f32 %425 = OpLoad %119 
					                                         f32 %426 = OpFAdd %424 %425 
					                                                      OpStore %119 %426 
					                                         f32 %427 = OpLoad %119 
					                                Uniform f32* %428 = OpAccessChain %12 %14 
					                                         f32 %429 = OpLoad %428 
					                                         f32 %430 = OpFMul %427 %429 
					                                                      OpStore %119 %430 
					                                         f32 %431 = OpLoad %119 
					                                Uniform f32* %432 = OpAccessChain %12 %268 
					                                         f32 %433 = OpLoad %432 
					                                         f32 %434 = OpFMul %431 %433 
					                                Private f32* %435 = OpAccessChain %22 %26 
					                                                      OpStore %435 %434 
					                                         f32 %436 = OpLoad %119 
					                                         f32 %438 = OpFMul %436 %437 
					                                                      OpStore %119 %438 
					                                Private f32* %439 = OpAccessChain %22 %26 
					                                         f32 %440 = OpLoad %439 
					                                Uniform f32* %441 = OpAccessChain %12 %273 
					                                         f32 %442 = OpLoad %441 
					                                         f32 %443 = OpFMul %440 %442 
					                                Private f32* %444 = OpAccessChain %22 %26 
					                                                      OpStore %444 %443 
					                                Private f32* %445 = OpAccessChain %22 %26 
					                                         f32 %446 = OpLoad %445 
					                                         f32 %448 = OpFMul %446 %447 
					                                Private f32* %449 = OpAccessChain %22 %26 
					                                                      OpStore %449 %448 
					                                         f32 %450 = OpLoad %119 
					                                Private f32* %451 = OpAccessChain %127 %46 
					                                         f32 %452 = OpLoad %451 
					                                         f32 %453 = OpFDiv %450 %452 
					                                Private f32* %454 = OpAccessChain %37 %26 
					                                                      OpStore %454 %453 
					                                         f32 %455 = OpLoad %119 
					                                         f32 %456 = OpFNegate %455 
					                                Uniform f32* %457 = OpAccessChain %12 %268 
					                                         f32 %458 = OpLoad %457 
					                                         f32 %459 = OpFMul %456 %458 
					                                                      OpStore %119 %459 
					                                         f32 %460 = OpLoad %119 
					                                Uniform f32* %461 = OpAccessChain %12 %273 
					                                         f32 %462 = OpLoad %461 
					                                         f32 %463 = OpFMul %460 %462 
					                                Private f32* %464 = OpAccessChain %9 %19 
					                                                      OpStore %464 %463 
					                                Private f32* %465 = OpAccessChain %37 %26 
					                                         f32 %466 = OpLoad %465 
					                                Uniform f32* %467 = OpAccessChain %12 %14 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %469 = OpFMul %466 %468 
					                                Private f32* %470 = OpAccessChain %37 %26 
					                                                      OpStore %470 %469 
					                                Private f32* %471 = OpAccessChain %37 %26 
					                                         f32 %472 = OpLoad %471 
					                                         f32 %474 = OpFMul %472 %473 
					                                Private f32* %475 = OpAccessChain %9 %46 
					                                         f32 %476 = OpLoad %475 
					                                         f32 %477 = OpFAdd %474 %476 
					                                Private f32* %478 = OpAccessChain %9 %26 
					                                                      OpStore %478 %477 
					                                       f32_4 %483 = OpLoad %9 
					                                       f32_4 %484 = OpVectorShuffle %483 %483 0 2 0 0 
					                                       f32_4 %485 = OpLoad %9 
					                                       f32_4 %486 = OpVectorShuffle %485 %485 0 2 0 0 
					                                       f32_4 %487 = OpFNegate %486 
					                                      bool_4 %489 = OpFOrdGreaterThanEqual %484 %487 
					                                      bool_2 %490 = OpVectorShuffle %489 %489 0 1 
					                                                      OpStore %482 %490 
					                                       f32_4 %491 = OpLoad %9 
					                                       f32_2 %492 = OpVectorShuffle %491 %491 0 2 
					                                       f32_2 %493 = OpExtInst %1 4 %492 
					                                       f32_2 %494 = OpExtInst %1 10 %493 
					                                       f32_4 %495 = OpLoad %9 
					                                       f32_4 %496 = OpVectorShuffle %495 %494 4 5 2 3 
					                                                      OpStore %9 %496 
					                                       f32_4 %499 = OpLoad %9 
					                                                      OpStore %498 %499 
					                               Private bool* %501 = OpAccessChain %482 %26 
					                                        bool %502 = OpLoad %501 
					                                                      OpSelectionMerge %506 None 
					                                                      OpBranchConditional %502 %505 %509 
					                                             %505 = OpLabel 
					                                Private f32* %507 = OpAccessChain %9 %26 
					                                         f32 %508 = OpLoad %507 
					                                                      OpStore %504 %508 
					                                                      OpBranch %506 
					                                             %509 = OpLabel 
					                                Private f32* %510 = OpAccessChain %9 %26 
					                                         f32 %511 = OpLoad %510 
					                                         f32 %512 = OpFNegate %511 
					                                                      OpStore %504 %512 
					                                                      OpBranch %506 
					                                             %506 = OpLabel 
					                                         f32 %513 = OpLoad %504 
					                               Function f32* %514 = OpAccessChain %498 %26 
					                                                      OpStore %514 %513 
					                               Private bool* %515 = OpAccessChain %482 %46 
					                                        bool %516 = OpLoad %515 
					                                                      OpSelectionMerge %519 None 
					                                                      OpBranchConditional %516 %518 %522 
					                                             %518 = OpLabel 
					                                Private f32* %520 = OpAccessChain %9 %46 
					                                         f32 %521 = OpLoad %520 
					                                                      OpStore %517 %521 
					                                                      OpBranch %519 
					                                             %522 = OpLabel 
					                                Private f32* %523 = OpAccessChain %9 %46 
					                                         f32 %524 = OpLoad %523 
					                                         f32 %525 = OpFNegate %524 
					                                                      OpStore %517 %525 
					                                                      OpBranch %519 
					                                             %519 = OpLabel 
					                                         f32 %526 = OpLoad %517 
					                               Function f32* %527 = OpAccessChain %498 %46 
					                                                      OpStore %527 %526 
					                                       f32_4 %528 = OpLoad %498 
					                                                      OpStore %9 %528 
					                         read_only Texture2D %532 = OpLoad %531 
					                                     sampler %536 = OpLoad %535 
					                  read_only Texture2DSampled %538 = OpSampledImage %532 %536 
					                                       f32_4 %539 = OpLoad %9 
					                                       f32_2 %540 = OpVectorShuffle %539 %539 0 1 
					                                       f32_4 %541 = OpImageSampleImplicitLod %538 %540 
					                                                      OpStore %78 %541 
					                                       f32_4 %542 = OpLoad %9 
					                                       f32_3 %543 = OpVectorShuffle %542 %542 0 1 3 
					                                       f32_3 %547 = OpFMul %543 %546 
					                                       f32_4 %548 = OpLoad %9 
					                                       f32_4 %549 = OpVectorShuffle %548 %547 4 5 2 6 
					                                                      OpStore %9 %549 
					                                Private f32* %551 = OpAccessChain %78 %46 
					                                         f32 %552 = OpLoad %551 
					                                Private f32* %553 = OpAccessChain %78 %26 
					                                         f32 %554 = OpLoad %553 
					                                         f32 %555 = OpFAdd %552 %554 
					                                                      OpStore %550 %555 
					                                Private f32* %556 = OpAccessChain %78 %123 
					                                         f32 %557 = OpLoad %556 
					                                         f32 %558 = OpLoad %550 
					                                         f32 %559 = OpFAdd %557 %558 
					                                                      OpStore %550 %559 
					                                         f32 %560 = OpLoad %550 
					                                         f32 %562 = OpFMul %560 %561 
					                                Private f32* %563 = OpAccessChain %37 %26 
					                                                      OpStore %563 %562 
					                                         f32 %564 = OpLoad %550 
					                                       f32_3 %565 = OpCompositeConstruct %564 %564 %564 
					                                       f32_3 %567 = OpFMul %565 %566 
					                                       f32_4 %568 = OpLoad %78 
					                                       f32_3 %569 = OpVectorShuffle %568 %568 0 1 2 
					                                       f32_3 %570 = OpFAdd %567 %569 
					                                       f32_4 %571 = OpLoad %93 
					                                       f32_4 %572 = OpVectorShuffle %571 %570 4 5 6 3 
					                                                      OpStore %93 %572 
					                                       f32_4 %573 = OpLoad %93 
					                                       f32_3 %574 = OpVectorShuffle %573 %573 0 1 2 
					                                       f32_3 %577 = OpFMul %574 %576 
					                                       f32_4 %578 = OpLoad %78 
					                                       f32_4 %579 = OpVectorShuffle %578 %577 4 5 6 3 
					                                                      OpStore %78 %579 
					                                Private f32* %580 = OpAccessChain %22 %26 
					                                         f32 %581 = OpLoad %580 
					                                Private f32* %582 = OpAccessChain %37 %26 
					                                         f32 %583 = OpLoad %582 
					                                         f32 %584 = OpFDiv %581 %583 
					                                Private f32* %585 = OpAccessChain %9 %123 
					                                                      OpStore %585 %584 
					                                Private f32* %586 = OpAccessChain %9 %19 
					                                         f32 %587 = OpLoad %586 
					                                Private f32* %588 = OpAccessChain %37 %26 
					                                         f32 %589 = OpLoad %588 
					                                         f32 %590 = OpFDiv %587 %589 
					                                Private f32* %591 = OpAccessChain %9 %19 
					                                                      OpStore %591 %590 
					                                       f32_4 %592 = OpLoad %9 
					                                       f32_2 %593 = OpVectorShuffle %592 %592 0 1 
					                                       f32_2 %594 = OpExtInst %1 10 %593 
					                                       f32_4 %595 = OpLoad %22 
					                                       f32_4 %596 = OpVectorShuffle %595 %594 4 5 2 3 
					                                                      OpStore %22 %596 
					                                       f32_4 %597 = OpLoad %9 
					                                       f32_2 %598 = OpVectorShuffle %597 %597 0 1 
					                                       f32_2 %599 = OpExtInst %1 8 %598 
					                                       f32_4 %600 = OpLoad %9 
					                                       f32_4 %601 = OpVectorShuffle %600 %599 4 5 2 3 
					                                                      OpStore %9 %601 
					                                Private f32* %602 = OpAccessChain %9 %46 
					                                         f32 %603 = OpLoad %602 
					                                         f32 %604 = OpFMul %603 %85 
					                                Private f32* %605 = OpAccessChain %9 %26 
					                                         f32 %606 = OpLoad %605 
					                                         f32 %607 = OpFAdd %604 %606 
					                                Private f32* %608 = OpAccessChain %9 %26 
					                                                      OpStore %608 %607 
					                                       f32_4 %609 = OpLoad %22 
					                                       f32_2 %610 = OpVectorShuffle %609 %609 0 1 
					                                       f32_4 %611 = OpLoad %22 
					                                       f32_2 %612 = OpVectorShuffle %611 %611 0 1 
					                                       f32_2 %613 = OpFMul %610 %612 
					                                                      OpStore %58 %613 
					                                       f32_4 %614 = OpLoad %22 
					                                       f32_2 %615 = OpVectorShuffle %614 %614 0 1 
					                                       f32_2 %616 = OpFNegate %615 
					                                       f32_2 %618 = OpFMul %616 %617 
					                                       f32_2 %620 = OpFAdd %618 %619 
					                                       f32_4 %621 = OpLoad %22 
					                                       f32_4 %622 = OpVectorShuffle %621 %620 4 5 2 3 
					                                                      OpStore %22 %622 
					                                       f32_4 %623 = OpLoad %22 
					                                       f32_2 %624 = OpVectorShuffle %623 %623 0 1 
					                                       f32_2 %625 = OpLoad %58 
					                                       f32_2 %626 = OpFMul %624 %625 
					                                       f32_4 %627 = OpLoad %22 
					                                       f32_4 %628 = OpVectorShuffle %627 %626 4 5 2 3 
					                                                      OpStore %22 %628 
					                                       f32_4 %629 = OpLoad %9 
					                                       f32_3 %630 = OpVectorShuffle %629 %629 0 0 0 
					                                       f32_3 %631 = OpFAdd %630 %98 
					                                       f32_4 %632 = OpLoad %93 
					                                       f32_4 %633 = OpVectorShuffle %632 %631 4 5 6 3 
					                                                      OpStore %93 %633 
					                                Private f32* %634 = OpAccessChain %9 %26 
					                                         f32 %635 = OpLoad %634 
					                                         f32 %636 = OpExtInst %1 13 %635 
					                                Private f32* %637 = OpAccessChain %9 %26 
					                                                      OpStore %637 %636 
					                                       f32_4 %638 = OpLoad %9 
					                                       f32_3 %639 = OpVectorShuffle %638 %638 0 2 3 
					                                       f32_3 %643 = OpFMul %639 %642 
					                                       f32_4 %644 = OpLoad %9 
					                                       f32_4 %645 = OpVectorShuffle %644 %643 4 1 5 6 
					                                                      OpStore %9 %645 
					                                Private f32* %646 = OpAccessChain %9 %26 
					                                         f32 %647 = OpLoad %646 
					                                         f32 %648 = OpExtInst %1 10 %647 
					                                Private f32* %649 = OpAccessChain %9 %26 
					                                                      OpStore %649 %648 
					                                       f32_4 %650 = OpLoad %93 
					                                       f32_3 %651 = OpVectorShuffle %650 %650 0 1 2 
					                                       f32_3 %652 = OpExtInst %1 13 %651 
					                                       f32_4 %653 = OpLoad %93 
					                                       f32_4 %654 = OpVectorShuffle %653 %652 4 5 6 3 
					                                                      OpStore %93 %654 
					                                       f32_4 %655 = OpLoad %93 
					                                       f32_3 %656 = OpVectorShuffle %655 %655 0 1 2 
					                                       f32_3 %657 = OpFMul %656 %110 
					                                       f32_4 %658 = OpLoad %93 
					                                       f32_4 %659 = OpVectorShuffle %658 %657 4 5 6 3 
					                                                      OpStore %93 %659 
					                                       f32_4 %660 = OpLoad %93 
					                                       f32_3 %661 = OpVectorShuffle %660 %660 0 1 2 
					                                       f32_3 %662 = OpExtInst %1 10 %661 
					                                       f32_4 %663 = OpLoad %93 
					                                       f32_4 %664 = OpVectorShuffle %663 %662 4 5 6 3 
					                                                      OpStore %93 %664 
					                                Private f32* %666 = OpAccessChain %93 %46 
					                                         f32 %667 = OpLoad %666 
					                                         f32 %668 = OpFNegate %667 
					                                Private f32* %669 = OpAccessChain %93 %123 
					                                         f32 %670 = OpLoad %669 
					                                         f32 %671 = OpFAdd %668 %670 
					                                                      OpStore %665 %671 
					                                Private f32* %672 = OpAccessChain %22 %26 
					                                         f32 %673 = OpLoad %672 
					                                         f32 %674 = OpLoad %665 
					                                         f32 %675 = OpFMul %673 %674 
					                                Private f32* %676 = OpAccessChain %93 %46 
					                                         f32 %677 = OpLoad %676 
					                                         f32 %678 = OpFAdd %675 %677 
					                                                      OpStore %665 %678 
					                                Private f32* %679 = OpAccessChain %9 %26 
					                                         f32 %680 = OpLoad %679 
					                                         f32 %681 = OpFNegate %680 
					                                Private f32* %682 = OpAccessChain %93 %26 
					                                         f32 %683 = OpLoad %682 
					                                         f32 %684 = OpFAdd %681 %683 
					                                Private f32* %685 = OpAccessChain %58 %26 
					                                                      OpStore %685 %684 
					                                Private f32* %686 = OpAccessChain %22 %26 
					                                         f32 %687 = OpLoad %686 
					                                Private f32* %688 = OpAccessChain %58 %26 
					                                         f32 %689 = OpLoad %688 
					                                         f32 %690 = OpFMul %687 %689 
					                                Private f32* %691 = OpAccessChain %9 %26 
					                                         f32 %692 = OpLoad %691 
					                                         f32 %693 = OpFAdd %690 %692 
					                                Private f32* %694 = OpAccessChain %9 %26 
					                                                      OpStore %694 %693 
					                                Private f32* %695 = OpAccessChain %9 %26 
					                                         f32 %696 = OpLoad %695 
					                                         f32 %697 = OpFNegate %696 
					                                         f32 %698 = OpLoad %665 
					                                         f32 %699 = OpFAdd %697 %698 
					                                                      OpStore %665 %699 
					                                Private f32* %700 = OpAccessChain %22 %46 
					                                         f32 %701 = OpLoad %700 
					                                         f32 %702 = OpLoad %665 
					                                         f32 %703 = OpFMul %701 %702 
					                                Private f32* %704 = OpAccessChain %9 %26 
					                                         f32 %705 = OpLoad %704 
					                                         f32 %706 = OpFAdd %703 %705 
					                                Private f32* %707 = OpAccessChain %9 %26 
					                                                      OpStore %707 %706 
					                                       f32_4 %708 = OpLoad %78 
					                                       f32_4 %709 = OpFNegate %708 
					                                       f32_4 %710 = OpLoad %9 
					                                       f32_4 %711 = OpVectorShuffle %710 %710 0 0 0 0 
					                                       f32_4 %712 = OpFAdd %709 %711 
					                                                      OpStore %22 %712 
					                                       f32_4 %713 = OpLoad %9 
					                                       f32_4 %714 = OpVectorShuffle %713 %713 2 2 2 2 
					                                       f32_4 %715 = OpLoad %22 
					                                       f32_4 %716 = OpFMul %714 %715 
					                                       f32_4 %717 = OpLoad %78 
					                                       f32_4 %718 = OpFAdd %716 %717 
					                                                      OpStore %22 %718 
					                                       f32_4 %719 = OpLoad %127 
					                                       f32_4 %720 = OpLoad %22 
					                                       f32_4 %721 = OpFAdd %719 %720 
					                                                      OpStore %22 %721 
					                                       f32_4 %722 = OpLoad %78 
					                                       f32_4 %723 = OpFNegate %722 
					                                       f32_4 %724 = OpLoad %22 
					                                       f32_4 %725 = OpFMul %723 %724 
					                                       f32_4 %726 = OpLoad %9 
					                                       f32_4 %727 = OpVectorShuffle %726 %726 0 0 0 0 
					                                       f32_4 %728 = OpFAdd %725 %727 
					                                                      OpStore %93 %728 
					                                       f32_4 %729 = OpLoad %22 
					                                       f32_4 %730 = OpLoad %78 
					                                       f32_4 %731 = OpFMul %729 %730 
					                                                      OpStore %22 %731 
					                                       f32_4 %734 = OpLoad %9 
					                                       f32_4 %735 = OpVectorShuffle %734 %734 3 3 3 3 
					                                       f32_4 %736 = OpLoad %93 
					                                       f32_4 %737 = OpFMul %735 %736 
					                                       f32_4 %738 = OpLoad %22 
					                                       f32_4 %739 = OpFAdd %737 %738 
					                                                      OpStore %733 %739 
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
						float Parasite;
						float ZoomX;
						float ZoomY;
						float PosX;
						float PosY;
						vec4 _ScreenResolution;
						vec4 unused_0_9;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					bvec2 u_xlatb6;
					vec3 u_xlat8;
					float u_xlat10;
					vec2 u_xlat11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0.w = Parasite;
					    u_xlat1.x = vs_TEXCOORD0.x + (-PosX);
					    u_xlat6.x = abs(u_xlat1.x) + PosY;
					    u_xlat6.y = vs_TEXCOORD0.y;
					    u_xlat1.xy = u_xlat6.xy + vec2(ZoomX);
					    u_xlat11.x = ZoomY + 1.0;
					    u_xlat0.yz = u_xlat1.xy / u_xlat11.xx;
					    u_xlat1 = u_xlat0.zwzw * vec4(128.0, 128.0, 32.0, 128.0);
					    u_xlat2 = floor(u_xlat1);
					    u_xlat1 = fract(u_xlat1);
					    u_xlat2.xy = u_xlat2.yw * vec2(59.0, 59.0) + u_xlat2.xz;
					    u_xlat3.xyz = u_xlat2.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat3.xyz = sin(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat15 = (-u_xlat3.y) + u_xlat3.z;
					    u_xlat4 = u_xlat1 * u_xlat1;
					    u_xlat1 = (-u_xlat1) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat1 = u_xlat1 * u_xlat4;
					    u_xlat15 = u_xlat1.x * u_xlat15 + u_xlat3.y;
					    u_xlat2.xz = sin(u_xlat2.xy);
					    u_xlat8.xyz = u_xlat2.yyy + vec3(1.0, 59.0, 60.0);
					    u_xlat8.xyz = sin(u_xlat8.xyz);
					    u_xlat8.xyz = u_xlat8.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat8.xyz = fract(u_xlat8.xyz);
					    u_xlat2.xy = u_xlat2.xz * vec2(43812.1758, 43812.1758);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat12 = (-u_xlat2.x) + u_xlat3.x;
					    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
					    u_xlat15 = u_xlat15 + (-u_xlat1.x);
					    u_xlat4.zw = u_xlat1.yy * vec2(u_xlat15) + u_xlat1.xx;
					    u_xlat15 = (-u_xlat8.y) + u_xlat8.z;
					    u_xlat15 = u_xlat1.z * u_xlat15 + u_xlat8.y;
					    u_xlat1.x = (-u_xlat2.y) + u_xlat8.x;
					    u_xlat1.x = u_xlat1.z * u_xlat1.x + u_xlat2.y;
					    u_xlat15 = u_xlat15 + (-u_xlat1.x);
					    u_xlat1.y = u_xlat1.w * u_xlat15 + u_xlat1.x;
					    u_xlat15 = u_xlat1.y + -0.5;
					    u_xlat4.x = u_xlat15 * 1.20000005 + u_xlat4.w;
					    u_xlat15 = (-u_xlat1.y) + u_xlat4.x;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 * _TimeX;
					    u_xlat15 = u_xlat15 * _Speed;
					    u_xlat11.x = u_xlat1.y + u_xlat4.x;
					    u_xlat11.x = sin(u_xlat11.x);
					    u_xlat11.x = u_xlat11.x * _TimeX;
					    u_xlat15 = u_xlat11.x * _Speed + u_xlat15;
					    u_xlat15 = fract(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat15 = sin(u_xlat15);
					    u_xlat15 = u_xlat15 * 0.00100000005;
					    u_xlat1.x = _Speed * _TimeX;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = cos(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat11.x = u_xlat4.w + -0.5;
					    u_xlat4.y = (-u_xlat11.x) * 0.5 + u_xlat4.w;
					    u_xlat11.x = u_xlat4.y * _ScreenResolution.y;
					    u_xlat16 = (-ZoomX) + 1.0;
					    u_xlat11.x = u_xlat11.x / u_xlat16;
					    u_xlat1.x = u_xlat11.x / u_xlat1.x;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = (-u_xlat4.x) * u_xlat4.y + u_xlat15;
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat6.x = u_xlat0.z * _ScreenResolution.y;
					    u_xlat1.y = u_xlat6.x / u_xlat16;
					    u_xlat1.xy = u_xlat1.xy * vec2(0.140000001, 0.5);
					    u_xlat6.x = fract(u_xlat1.y);
					    u_xlat15 = u_xlat1.x * u_xlat6.x + u_xlat15;
					    u_xlat15 = u_xlat15 * Parasite;
					    u_xlat1.x = u_xlat15 * _TimeX;
					    u_xlat15 = u_xlat15 * 0.800000012;
					    u_xlat1.x = u_xlat1.x * _Speed;
					    u_xlat1.x = u_xlat1.x * 0.0720000044;
					    u_xlat6.x = u_xlat15 / u_xlat4.y;
					    u_xlat15 = (-u_xlat15) * _TimeX;
					    u_xlat0.w = u_xlat15 * _Speed;
					    u_xlat6.x = u_xlat6.x * Parasite;
					    u_xlat0.x = u_xlat6.x * 2.41000009 + u_xlat0.y;
					    u_xlatb6.xy = greaterThanEqual(u_xlat0.xzxx, (-u_xlat0.xzxx)).xy;
					    u_xlat0.xy = fract(abs(u_xlat0.xz));
					    {
					        vec4 hlslcc_movcTemp = u_xlat0;
					        hlslcc_movcTemp.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
					        hlslcc_movcTemp.y = (u_xlatb6.y) ? u_xlat0.y : (-u_xlat0.y);
					        u_xlat0 = hlslcc_movcTemp;
					    }
					    u_xlat2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(-17280.0, -17280.0, 0.0900000036);
					    u_xlat10 = u_xlat2.y + u_xlat2.x;
					    u_xlat10 = u_xlat2.z + u_xlat10;
					    u_xlat6.x = u_xlat10 * 0.476190507;
					    u_xlat3.xyz = vec3(u_xlat10) * vec3(0.476190507, 0.476190507, 0.476190507) + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(0.569999993, 0.569999993, 0.569999993);
					    u_xlat0.z = u_xlat1.x / u_xlat6.x;
					    u_xlat0.w = u_xlat0.w / u_xlat6.x;
					    u_xlat1.xy = fract(u_xlat0.xy);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.y * 59.0 + u_xlat0.x;
					    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
					    u_xlat1.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
					    u_xlat3.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xzw * vec3(43812.1758, 0.0799999982, 0.00800000038);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat3.xyz = sin(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat5 = (-u_xlat3.y) + u_xlat3.z;
					    u_xlat5 = u_xlat1.x * u_xlat5 + u_xlat3.y;
					    u_xlat11.x = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat0.x = u_xlat1.x * u_xlat11.x + u_xlat0.x;
					    u_xlat5 = (-u_xlat0.x) + u_xlat5;
					    u_xlat0.x = u_xlat1.y * u_xlat5 + u_xlat0.x;
					    u_xlat1 = (-u_xlat2) + u_xlat0.xxxx;
					    u_xlat1 = u_xlat0.zzzz * u_xlat1 + u_xlat2;
					    u_xlat1 = u_xlat4 + u_xlat1;
					    u_xlat3 = (-u_xlat2) * u_xlat1 + u_xlat0.xxxx;
					    u_xlat1 = u_xlat1 * u_xlat2;
					    SV_Target0 = u_xlat0.wwww * u_xlat3 + u_xlat1;
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