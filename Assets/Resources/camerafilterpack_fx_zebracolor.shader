Shader "CameraFilterPack/FX_ZebraColor" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value ("_Value", Range(1, 10)) = 10
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 24008
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
					vec4 u_xlat10_1;
					float u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					float u_xlat4;
					vec3 u_xlat16_4;
					float u_xlat8;
					float u_xlat16_8;
					float u_xlat12;
					float u_xlat16_12;
					bool u_xlatb12;
					float u_xlat13;
					float u_xlat16_13;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat16_8 = max(abs(u_xlat10_1.y), abs(u_xlat10_1.x));
					    u_xlat16_8 = float(1.0) / u_xlat16_8;
					    u_xlat16_12 = min(abs(u_xlat10_1.y), abs(u_xlat10_1.x));
					    u_xlat16_8 = u_xlat16_8 * u_xlat16_12;
					    u_xlat16_12 = u_xlat16_8 * u_xlat16_8;
					    u_xlat16_13 = u_xlat16_12 * 0.0208350997 + -0.0851330012;
					    u_xlat16_13 = u_xlat16_12 * u_xlat16_13 + 0.180141002;
					    u_xlat16_13 = u_xlat16_12 * u_xlat16_13 + -0.330299497;
					    u_xlat16_12 = u_xlat16_12 * u_xlat16_13 + 0.999866009;
					    u_xlat16_13 = u_xlat16_12 * u_xlat16_8;
					    u_xlat13 = u_xlat16_13 * -2.0 + 1.57079637;
					    u_xlatb2 = abs(u_xlat10_1.y)<abs(u_xlat10_1.x);
					    u_xlat13 = u_xlatb2 ? u_xlat13 : float(0.0);
					    u_xlat8 = u_xlat16_8 * u_xlat16_12 + u_xlat13;
					    u_xlatb12 = u_xlat10_1.y<(-u_xlat10_1.y);
					    u_xlat12 = u_xlatb12 ? -3.14159274 : float(0.0);
					    u_xlat8 = u_xlat12 + u_xlat8;
					    u_xlat12 = min(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlatb12 = u_xlat12<(-u_xlat12);
					    u_xlat13 = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlatb13 = u_xlat13>=(-u_xlat13);
					    u_xlatb12 = u_xlatb12 && u_xlatb13;
					    u_xlat8 = (u_xlatb12) ? (-u_xlat8) : u_xlat8;
					    u_xlat8 = u_xlat8 * _Value;
					    u_xlat8 = u_xlat8 * 0.636619747;
					    u_xlat8 = floor(u_xlat8);
					    u_xlat8 = u_xlat8 * 3.14159274;
					    u_xlat8 = u_xlat8 / _Value;
					    u_xlat8 = u_xlat8 + 1.57079637;
					    u_xlat2 = sin(u_xlat8);
					    u_xlat3.x = cos(u_xlat8);
					    u_xlat3.y = u_xlat2;
					    u_xlat0.x = dot(u_xlat3.xy, u_xlat0.xy);
					    u_xlat16_4.x = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_4.x = u_xlat10_1.z + u_xlat16_4.x;
					    u_xlat4 = u_xlat16_4.x * _Value;
					    u_xlat4 = u_xlat4 * 0.333333343;
					    u_xlat4 = floor(u_xlat4);
					    u_xlat4 = u_xlat4 / _Value;
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = u_xlat0.x * 3.14159274;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat16_4.x = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat16_4.x = sqrt(u_xlat16_4.x);
					    u_xlat16_4.xyz = u_xlat10_1.xyz / u_xlat16_4.xxx;
					    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat0.xxx;
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
					; Bound: 281
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %270 
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
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %33 DescriptorSet 33 
					                                             OpDecorate %33 Binding 33 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %37 RelaxedPrecision 
					                                             OpDecorate %37 DescriptorSet 37 
					                                             OpDecorate %37 Binding 37 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %124 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %153 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %208 RelaxedPrecision 
					                                             OpDecorate %210 RelaxedPrecision 
					                                             OpDecorate %212 RelaxedPrecision 
					                                             OpDecorate %213 RelaxedPrecision 
					                                             OpDecorate %217 RelaxedPrecision 
					                                             OpDecorate %219 RelaxedPrecision 
					                                             OpDecorate %220 RelaxedPrecision 
					                                             OpDecorate %224 RelaxedPrecision 
					                                             OpDecorate %257 RelaxedPrecision 
					                                             OpDecorate %258 RelaxedPrecision 
					                                             OpDecorate %259 RelaxedPrecision 
					                                             OpDecorate %262 RelaxedPrecision 
					                                             OpDecorate %263 RelaxedPrecision 
					                                             OpDecorate %265 RelaxedPrecision 
					                                             OpDecorate %266 RelaxedPrecision 
					                                             OpDecorate %267 RelaxedPrecision 
					                                             OpDecorate %268 RelaxedPrecision 
					                                             OpDecorate %270 Location 270 
					                                             OpDecorate %271 RelaxedPrecision 
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
					                                     %28 = OpTypeVector %6 3 
					                                     %29 = OpTypePointer Private %28 
					                      Private f32_3* %30 = OpVariable Private 
					                                     %31 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %32 = OpTypePointer UniformConstant %31 
					UniformConstant read_only Texture2D* %33 = OpVariable UniformConstant 
					                                     %35 = OpTypeSampler 
					                                     %36 = OpTypePointer UniformConstant %35 
					            UniformConstant sampler* %37 = OpVariable UniformConstant 
					                                     %39 = OpTypeSampledImage %31 
					                                 i32 %45 = OpConstant 0 
					                                     %50 = OpTypePointer Private %6 
					                        Private f32* %51 = OpVariable Private 
					                                     %52 = OpTypeInt 32 0 
					                                 u32 %53 = OpConstant 1 
					                                 u32 %57 = OpConstant 0 
					                                 f32 %62 = OpConstant 3,674022E-40 
					                        Private f32* %65 = OpVariable Private 
					                        Private f32* %79 = OpVariable Private 
					                                 f32 %81 = OpConstant 3,674022E-40 
					                                 f32 %83 = OpConstant 3,674022E-40 
					                                 f32 %88 = OpConstant 3,674022E-40 
					                                 f32 %93 = OpConstant 3,674022E-40 
					                                 f32 %98 = OpConstant 3,674022E-40 
					                       Private f32* %103 = OpVariable Private 
					                                f32 %105 = OpConstant 3,674022E-40 
					                                f32 %107 = OpConstant 3,674022E-40 
					                                    %109 = OpTypeBool 
					                                    %110 = OpTypePointer Private %109 
					                      Private bool* %111 = OpVariable Private 
					                                f32 %121 = OpConstant 3,674022E-40 
					                       Private f32* %123 = OpVariable Private 
					                      Private bool* %129 = OpVariable Private 
					                       Private f32* %136 = OpVariable Private 
					                                f32 %138 = OpConstant 3,674022E-40 
					                      Private bool* %157 = OpVariable Private 
					                                    %166 = OpTypePointer Function %6 
					                                i32 %176 = OpConstant 1 
					                                    %177 = OpTypePointer Uniform %6 
					                                f32 %182 = OpConstant 3,674022E-40 
					                                f32 %187 = OpConstant 3,674022E-40 
					                       Private f32* %195 = OpVariable Private 
					                     Private f32_2* %198 = OpVariable Private 
					                     Private f32_3* %208 = OpVariable Private 
					                                u32 %215 = OpConstant 2 
					                       Private f32* %222 = OpVariable Private 
					                                f32 %229 = OpConstant 3,674022E-40 
					                                f32 %253 = OpConstant 3,674022E-40 
					                                    %269 = OpTypePointer Output %13 
					                      Output f32_4* %270 = OpVariable Output 
					                                u32 %277 = OpConstant 3 
					                                    %278 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Function f32* %167 = OpVariable Function 
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
					                 read_only Texture2D %34 = OpLoad %33 
					                             sampler %38 = OpLoad %37 
					          read_only Texture2DSampled %40 = OpSampledImage %34 %38 
					                               f32_2 %41 = OpLoad %9 
					                               f32_4 %42 = OpImageSampleImplicitLod %40 %41 
					                               f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
					                                             OpStore %30 %43 
					                               f32_2 %44 = OpLoad %9 
					                      Uniform f32_4* %46 = OpAccessChain %16 %45 
					                               f32_4 %47 = OpLoad %46 
					                               f32_2 %48 = OpVectorShuffle %47 %47 0 1 
					                               f32_2 %49 = OpFMul %44 %48 
					                                             OpStore %9 %49 
					                        Private f32* %54 = OpAccessChain %30 %53 
					                                 f32 %55 = OpLoad %54 
					                                 f32 %56 = OpExtInst %1 4 %55 
					                        Private f32* %58 = OpAccessChain %30 %57 
					                                 f32 %59 = OpLoad %58 
					                                 f32 %60 = OpExtInst %1 4 %59 
					                                 f32 %61 = OpExtInst %1 40 %56 %60 
					                                             OpStore %51 %61 
					                                 f32 %63 = OpLoad %51 
					                                 f32 %64 = OpFDiv %62 %63 
					                                             OpStore %51 %64 
					                        Private f32* %66 = OpAccessChain %30 %53 
					                                 f32 %67 = OpLoad %66 
					                                 f32 %68 = OpExtInst %1 4 %67 
					                        Private f32* %69 = OpAccessChain %30 %57 
					                                 f32 %70 = OpLoad %69 
					                                 f32 %71 = OpExtInst %1 4 %70 
					                                 f32 %72 = OpExtInst %1 37 %68 %71 
					                                             OpStore %65 %72 
					                                 f32 %73 = OpLoad %51 
					                                 f32 %74 = OpLoad %65 
					                                 f32 %75 = OpFMul %73 %74 
					                                             OpStore %51 %75 
					                                 f32 %76 = OpLoad %51 
					                                 f32 %77 = OpLoad %51 
					                                 f32 %78 = OpFMul %76 %77 
					                                             OpStore %65 %78 
					                                 f32 %80 = OpLoad %65 
					                                 f32 %82 = OpFMul %80 %81 
					                                 f32 %84 = OpFAdd %82 %83 
					                                             OpStore %79 %84 
					                                 f32 %85 = OpLoad %65 
					                                 f32 %86 = OpLoad %79 
					                                 f32 %87 = OpFMul %85 %86 
					                                 f32 %89 = OpFAdd %87 %88 
					                                             OpStore %79 %89 
					                                 f32 %90 = OpLoad %65 
					                                 f32 %91 = OpLoad %79 
					                                 f32 %92 = OpFMul %90 %91 
					                                 f32 %94 = OpFAdd %92 %93 
					                                             OpStore %79 %94 
					                                 f32 %95 = OpLoad %65 
					                                 f32 %96 = OpLoad %79 
					                                 f32 %97 = OpFMul %95 %96 
					                                 f32 %99 = OpFAdd %97 %98 
					                                             OpStore %65 %99 
					                                f32 %100 = OpLoad %65 
					                                f32 %101 = OpLoad %51 
					                                f32 %102 = OpFMul %100 %101 
					                                             OpStore %79 %102 
					                                f32 %104 = OpLoad %79 
					                                f32 %106 = OpFMul %104 %105 
					                                f32 %108 = OpFAdd %106 %107 
					                                             OpStore %103 %108 
					                       Private f32* %112 = OpAccessChain %30 %53 
					                                f32 %113 = OpLoad %112 
					                                f32 %114 = OpExtInst %1 4 %113 
					                       Private f32* %115 = OpAccessChain %30 %57 
					                                f32 %116 = OpLoad %115 
					                                f32 %117 = OpExtInst %1 4 %116 
					                               bool %118 = OpFOrdLessThan %114 %117 
					                                             OpStore %111 %118 
					                               bool %119 = OpLoad %111 
					                                f32 %120 = OpLoad %103 
					                                f32 %122 = OpSelect %119 %120 %121 
					                                             OpStore %103 %122 
					                                f32 %124 = OpLoad %51 
					                                f32 %125 = OpLoad %65 
					                                f32 %126 = OpFMul %124 %125 
					                                f32 %127 = OpLoad %103 
					                                f32 %128 = OpFAdd %126 %127 
					                                             OpStore %123 %128 
					                       Private f32* %130 = OpAccessChain %30 %53 
					                                f32 %131 = OpLoad %130 
					                       Private f32* %132 = OpAccessChain %30 %53 
					                                f32 %133 = OpLoad %132 
					                                f32 %134 = OpFNegate %133 
					                               bool %135 = OpFOrdLessThan %131 %134 
					                                             OpStore %129 %135 
					                               bool %137 = OpLoad %129 
					                                f32 %139 = OpSelect %137 %138 %121 
					                                             OpStore %136 %139 
					                                f32 %140 = OpLoad %136 
					                                f32 %141 = OpLoad %123 
					                                f32 %142 = OpFAdd %140 %141 
					                                             OpStore %123 %142 
					                       Private f32* %143 = OpAccessChain %30 %53 
					                                f32 %144 = OpLoad %143 
					                       Private f32* %145 = OpAccessChain %30 %57 
					                                f32 %146 = OpLoad %145 
					                                f32 %147 = OpExtInst %1 37 %144 %146 
					                                             OpStore %136 %147 
					                                f32 %148 = OpLoad %136 
					                                f32 %149 = OpLoad %136 
					                                f32 %150 = OpFNegate %149 
					                               bool %151 = OpFOrdLessThan %148 %150 
					                                             OpStore %129 %151 
					                       Private f32* %152 = OpAccessChain %30 %53 
					                                f32 %153 = OpLoad %152 
					                       Private f32* %154 = OpAccessChain %30 %57 
					                                f32 %155 = OpLoad %154 
					                                f32 %156 = OpExtInst %1 40 %153 %155 
					                                             OpStore %103 %156 
					                                f32 %158 = OpLoad %103 
					                                f32 %159 = OpLoad %103 
					                                f32 %160 = OpFNegate %159 
					                               bool %161 = OpFOrdGreaterThanEqual %158 %160 
					                                             OpStore %157 %161 
					                               bool %162 = OpLoad %129 
					                               bool %163 = OpLoad %157 
					                               bool %164 = OpLogicalAnd %162 %163 
					                                             OpStore %129 %164 
					                               bool %165 = OpLoad %129 
					                                             OpSelectionMerge %169 None 
					                                             OpBranchConditional %165 %168 %172 
					                                    %168 = OpLabel 
					                                f32 %170 = OpLoad %123 
					                                f32 %171 = OpFNegate %170 
					                                             OpStore %167 %171 
					                                             OpBranch %169 
					                                    %172 = OpLabel 
					                                f32 %173 = OpLoad %123 
					                                             OpStore %167 %173 
					                                             OpBranch %169 
					                                    %169 = OpLabel 
					                                f32 %174 = OpLoad %167 
					                                             OpStore %123 %174 
					                                f32 %175 = OpLoad %123 
					                       Uniform f32* %178 = OpAccessChain %16 %176 
					                                f32 %179 = OpLoad %178 
					                                f32 %180 = OpFMul %175 %179 
					                                             OpStore %123 %180 
					                                f32 %181 = OpLoad %123 
					                                f32 %183 = OpFMul %181 %182 
					                                             OpStore %123 %183 
					                                f32 %184 = OpLoad %123 
					                                f32 %185 = OpExtInst %1 8 %184 
					                                             OpStore %123 %185 
					                                f32 %186 = OpLoad %123 
					                                f32 %188 = OpFMul %186 %187 
					                                             OpStore %123 %188 
					                                f32 %189 = OpLoad %123 
					                       Uniform f32* %190 = OpAccessChain %16 %176 
					                                f32 %191 = OpLoad %190 
					                                f32 %192 = OpFDiv %189 %191 
					                                             OpStore %123 %192 
					                                f32 %193 = OpLoad %123 
					                                f32 %194 = OpFAdd %193 %107 
					                                             OpStore %123 %194 
					                                f32 %196 = OpLoad %123 
					                                f32 %197 = OpExtInst %1 13 %196 
					                                             OpStore %195 %197 
					                                f32 %199 = OpLoad %123 
					                                f32 %200 = OpExtInst %1 14 %199 
					                       Private f32* %201 = OpAccessChain %198 %57 
					                                             OpStore %201 %200 
					                                f32 %202 = OpLoad %195 
					                       Private f32* %203 = OpAccessChain %198 %53 
					                                             OpStore %203 %202 
					                              f32_2 %204 = OpLoad %198 
					                              f32_2 %205 = OpLoad %9 
					                                f32 %206 = OpDot %204 %205 
					                       Private f32* %207 = OpAccessChain %9 %57 
					                                             OpStore %207 %206 
					                       Private f32* %209 = OpAccessChain %30 %53 
					                                f32 %210 = OpLoad %209 
					                       Private f32* %211 = OpAccessChain %30 %57 
					                                f32 %212 = OpLoad %211 
					                                f32 %213 = OpFAdd %210 %212 
					                       Private f32* %214 = OpAccessChain %208 %57 
					                                             OpStore %214 %213 
					                       Private f32* %216 = OpAccessChain %30 %215 
					                                f32 %217 = OpLoad %216 
					                       Private f32* %218 = OpAccessChain %208 %57 
					                                f32 %219 = OpLoad %218 
					                                f32 %220 = OpFAdd %217 %219 
					                       Private f32* %221 = OpAccessChain %208 %57 
					                                             OpStore %221 %220 
					                       Private f32* %223 = OpAccessChain %208 %57 
					                                f32 %224 = OpLoad %223 
					                       Uniform f32* %225 = OpAccessChain %16 %176 
					                                f32 %226 = OpLoad %225 
					                                f32 %227 = OpFMul %224 %226 
					                                             OpStore %222 %227 
					                                f32 %228 = OpLoad %222 
					                                f32 %230 = OpFMul %228 %229 
					                                             OpStore %222 %230 
					                                f32 %231 = OpLoad %222 
					                                f32 %232 = OpExtInst %1 8 %231 
					                                             OpStore %222 %232 
					                                f32 %233 = OpLoad %222 
					                       Uniform f32* %234 = OpAccessChain %16 %176 
					                                f32 %235 = OpLoad %234 
					                                f32 %236 = OpFDiv %233 %235 
					                                             OpStore %222 %236 
					                       Private f32* %237 = OpAccessChain %9 %57 
					                                f32 %238 = OpLoad %237 
					                                f32 %239 = OpLoad %222 
					                                f32 %240 = OpFMul %238 %239 
					                       Private f32* %241 = OpAccessChain %9 %57 
					                                             OpStore %241 %240 
					                       Private f32* %242 = OpAccessChain %9 %57 
					                                f32 %243 = OpLoad %242 
					                                f32 %244 = OpFMul %243 %187 
					                       Private f32* %245 = OpAccessChain %9 %57 
					                                             OpStore %245 %244 
					                       Private f32* %246 = OpAccessChain %9 %57 
					                                f32 %247 = OpLoad %246 
					                                f32 %248 = OpExtInst %1 14 %247 
					                       Private f32* %249 = OpAccessChain %9 %57 
					                                             OpStore %249 %248 
					                       Private f32* %250 = OpAccessChain %9 %57 
					                                f32 %251 = OpLoad %250 
					                                f32 %252 = OpFNegate %251 
					                                f32 %254 = OpFMul %252 %253 
					                                f32 %255 = OpFAdd %254 %253 
					                       Private f32* %256 = OpAccessChain %9 %57 
					                                             OpStore %256 %255 
					                              f32_3 %257 = OpLoad %30 
					                              f32_3 %258 = OpLoad %30 
					                                f32 %259 = OpDot %257 %258 
					                       Private f32* %260 = OpAccessChain %208 %57 
					                                             OpStore %260 %259 
					                       Private f32* %261 = OpAccessChain %208 %57 
					                                f32 %262 = OpLoad %261 
					                                f32 %263 = OpExtInst %1 31 %262 
					                       Private f32* %264 = OpAccessChain %208 %57 
					                                             OpStore %264 %263 
					                              f32_3 %265 = OpLoad %30 
					                              f32_3 %266 = OpLoad %208 
					                              f32_3 %267 = OpVectorShuffle %266 %266 0 0 0 
					                              f32_3 %268 = OpFDiv %265 %267 
					                                             OpStore %208 %268 
					                              f32_3 %271 = OpLoad %208 
					                              f32_2 %272 = OpLoad %9 
					                              f32_3 %273 = OpVectorShuffle %272 %272 0 0 0 
					                              f32_3 %274 = OpFMul %271 %273 
					                              f32_4 %275 = OpLoad %270 
					                              f32_4 %276 = OpVectorShuffle %275 %274 4 5 6 3 
					                                             OpStore %270 %276 
					                        Output f32* %279 = OpAccessChain %270 %277 
					                                             OpStore %279 %62 
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
					vec4 u_xlat10_1;
					float u_xlat2;
					bool u_xlatb2;
					vec2 u_xlat3;
					float u_xlat4;
					vec3 u_xlat16_4;
					float u_xlat8;
					float u_xlat16_8;
					float u_xlat12;
					float u_xlat16_12;
					bool u_xlatb12;
					float u_xlat13;
					float u_xlat16_13;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat16_8 = max(abs(u_xlat10_1.y), abs(u_xlat10_1.x));
					    u_xlat16_8 = float(1.0) / u_xlat16_8;
					    u_xlat16_12 = min(abs(u_xlat10_1.y), abs(u_xlat10_1.x));
					    u_xlat16_8 = u_xlat16_8 * u_xlat16_12;
					    u_xlat16_12 = u_xlat16_8 * u_xlat16_8;
					    u_xlat16_13 = u_xlat16_12 * 0.0208350997 + -0.0851330012;
					    u_xlat16_13 = u_xlat16_12 * u_xlat16_13 + 0.180141002;
					    u_xlat16_13 = u_xlat16_12 * u_xlat16_13 + -0.330299497;
					    u_xlat16_12 = u_xlat16_12 * u_xlat16_13 + 0.999866009;
					    u_xlat16_13 = u_xlat16_12 * u_xlat16_8;
					    u_xlat13 = u_xlat16_13 * -2.0 + 1.57079637;
					    u_xlatb2 = abs(u_xlat10_1.y)<abs(u_xlat10_1.x);
					    u_xlat13 = u_xlatb2 ? u_xlat13 : float(0.0);
					    u_xlat8 = u_xlat16_8 * u_xlat16_12 + u_xlat13;
					    u_xlatb12 = u_xlat10_1.y<(-u_xlat10_1.y);
					    u_xlat12 = u_xlatb12 ? -3.14159274 : float(0.0);
					    u_xlat8 = u_xlat12 + u_xlat8;
					    u_xlat12 = min(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlatb12 = u_xlat12<(-u_xlat12);
					    u_xlat13 = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlatb13 = u_xlat13>=(-u_xlat13);
					    u_xlatb12 = u_xlatb12 && u_xlatb13;
					    u_xlat8 = (u_xlatb12) ? (-u_xlat8) : u_xlat8;
					    u_xlat8 = u_xlat8 * _Value;
					    u_xlat8 = u_xlat8 * 0.636619747;
					    u_xlat8 = floor(u_xlat8);
					    u_xlat8 = u_xlat8 * 3.14159274;
					    u_xlat8 = u_xlat8 / _Value;
					    u_xlat8 = u_xlat8 + 1.57079637;
					    u_xlat2 = sin(u_xlat8);
					    u_xlat3.x = cos(u_xlat8);
					    u_xlat3.y = u_xlat2;
					    u_xlat0.x = dot(u_xlat3.xy, u_xlat0.xy);
					    u_xlat16_4.x = u_xlat10_1.y + u_xlat10_1.x;
					    u_xlat16_4.x = u_xlat10_1.z + u_xlat16_4.x;
					    u_xlat4 = u_xlat16_4.x * _Value;
					    u_xlat4 = u_xlat4 * 0.333333343;
					    u_xlat4 = floor(u_xlat4);
					    u_xlat4 = u_xlat4 / _Value;
					    u_xlat0.x = u_xlat0.x * u_xlat4;
					    u_xlat0.x = u_xlat0.x * 3.14159274;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) * 0.5 + 0.5;
					    u_xlat16_4.x = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlat16_4.x = sqrt(u_xlat16_4.x);
					    u_xlat16_4.xyz = u_xlat10_1.xyz / u_xlat16_4.xxx;
					    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat0.xxx;
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