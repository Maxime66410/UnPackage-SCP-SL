Shader "CameraFilterPack/Distortion_FishEye" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.87
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 2808
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					float u_xlat1;
					bool u_xlatb1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb7;
					vec2 u_xlat10;
					float u_xlat11;
					float u_xlat12;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat1 = dot(u_xlat10.xy, u_xlat10.xy);
					    u_xlat6 = sqrt(u_xlat1);
					    u_xlat11 = _Distortion + -0.5;
					    u_xlat16 = u_xlat11 * 4.44289351;
					    u_xlatb2 = 0.0<u_xlat11;
					    if(u_xlatb2){
					        u_xlat2.x = inversesqrt(u_xlat1);
					        u_xlat2.xy = u_xlat10.xy * u_xlat2.xx;
					        u_xlat12 = u_xlat16 * u_xlat6;
					        u_xlat3 = sin(u_xlat12);
					        u_xlat4 = cos(u_xlat12);
					        u_xlat12 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = vec2(u_xlat12) * u_xlat2.xy;
					        u_xlat2.xy = u_xlat2.xy * vec2(0.5, 0.5);
					        u_xlat12 = u_xlat11 * 2.22144675;
					        u_xlat3 = sin(u_xlat12);
					        u_xlat4 = cos(u_xlat12);
					        u_xlat12 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat12);
					        u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    } else {
					        u_xlatb2 = u_xlat11<0.0;
					        if(u_xlatb2){
					            u_xlat1 = inversesqrt(u_xlat1);
					            u_xlat10.xy = u_xlat10.xy * vec2(u_xlat1);
					            u_xlat1 = (-u_xlat16) * u_xlat6;
					            u_xlat1 = u_xlat1 * 10.0;
					            u_xlat6 = min(abs(u_xlat1), 1.0);
					            u_xlat16 = max(abs(u_xlat1), 1.0);
					            u_xlat16 = float(1.0) / u_xlat16;
					            u_xlat6 = u_xlat16 * u_xlat6;
					            u_xlat16 = u_xlat6 * u_xlat6;
					            u_xlat2.x = u_xlat16 * 0.0208350997 + -0.0851330012;
					            u_xlat2.x = u_xlat16 * u_xlat2.x + 0.180141002;
					            u_xlat2.x = u_xlat16 * u_xlat2.x + -0.330299497;
					            u_xlat16 = u_xlat16 * u_xlat2.x + 0.999866009;
					            u_xlat2.x = u_xlat16 * u_xlat6;
					            u_xlatb7 = 1.0<abs(u_xlat1);
					            u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
					            u_xlat2.x = u_xlatb7 ? u_xlat2.x : float(0.0);
					            u_xlat6 = u_xlat6 * u_xlat16 + u_xlat2.x;
					            u_xlat1 = min(u_xlat1, 1.0);
					            u_xlatb1 = u_xlat1<(-u_xlat1);
					            u_xlat1 = (u_xlatb1) ? (-u_xlat6) : u_xlat6;
					            u_xlat10.xy = u_xlat10.xy * vec2(u_xlat1);
					            u_xlat10.xy = u_xlat10.xy * vec2(0.5, 0.5);
					            u_xlat1 = u_xlat11 * -22.214468;
					            u_xlat6 = min(abs(u_xlat1), 1.0);
					            u_xlat11 = max(abs(u_xlat1), 1.0);
					            u_xlat11 = float(1.0) / u_xlat11;
					            u_xlat6 = u_xlat11 * u_xlat6;
					            u_xlat11 = u_xlat6 * u_xlat6;
					            u_xlat16 = u_xlat11 * 0.0208350997 + -0.0851330012;
					            u_xlat16 = u_xlat11 * u_xlat16 + 0.180141002;
					            u_xlat16 = u_xlat11 * u_xlat16 + -0.330299497;
					            u_xlat11 = u_xlat11 * u_xlat16 + 0.999866009;
					            u_xlat16 = u_xlat11 * u_xlat6;
					            u_xlatb2 = 1.0<abs(u_xlat1);
					            u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
					            u_xlat16 = u_xlatb2 ? u_xlat16 : float(0.0);
					            u_xlat6 = u_xlat6 * u_xlat11 + u_xlat16;
					            u_xlat1 = min(u_xlat1, 1.0);
					            u_xlatb1 = u_xlat1<(-u_xlat1);
					            u_xlat1 = (u_xlatb1) ? (-u_xlat6) : u_xlat6;
					            u_xlat10.xy = u_xlat10.xy / vec2(u_xlat1);
					            u_xlat0.xy = u_xlat10.xy + vec2(0.5, 0.5);
					        }
					    }
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
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
					; Bound: 315
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %307 
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
					                                              OpDecorate %292 RelaxedPrecision 
					                                              OpDecorate %295 RelaxedPrecision 
					                                              OpDecorate %295 DescriptorSet 295 
					                                              OpDecorate %295 Binding 295 
					                                              OpDecorate %296 RelaxedPrecision 
					                                              OpDecorate %299 RelaxedPrecision 
					                                              OpDecorate %299 DescriptorSet 299 
					                                              OpDecorate %299 Binding 299 
					                                              OpDecorate %300 RelaxedPrecision 
					                                              OpDecorate %305 RelaxedPrecision 
					                                              OpDecorate %307 Location 307 
					                                              OpDecorate %308 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeVector %6 4 
					                                      %14 = OpTypeStruct %6 %13 
					                                      %15 = OpTypePointer Uniform %14 
					        Uniform struct {f32; f32_4;}* %16 = OpVariable Uniform 
					                                      %17 = OpTypeInt 32 1 
					                                  i32 %18 = OpConstant 1 
					                                      %19 = OpTypePointer Uniform %13 
					                       Private f32_2* %28 = OpVariable Private 
					                                  f32 %30 = OpConstant 3,674022E-40 
					                                f32_2 %31 = OpConstantComposite %30 %30 
					                                      %33 = OpTypePointer Private %6 
					                         Private f32* %34 = OpVariable Private 
					                         Private f32* %38 = OpVariable Private 
					                         Private f32* %41 = OpVariable Private 
					                                  i32 %42 = OpConstant 0 
					                                      %43 = OpTypePointer Uniform %6 
					                         Private f32* %47 = OpVariable Private 
					                                  f32 %49 = OpConstant 3,674022E-40 
					                                      %51 = OpTypeBool 
					                                      %52 = OpTypePointer Private %51 
					                        Private bool* %53 = OpVariable Private 
					                                  f32 %54 = OpConstant 3,674022E-40 
					                       Private f32_2* %60 = OpVariable Private 
					                                      %63 = OpTypeInt 32 0 
					                                  u32 %64 = OpConstant 0 
					                         Private f32* %70 = OpVariable Private 
					                         Private f32* %74 = OpVariable Private 
					                         Private f32* %77 = OpVariable Private 
					                                  f32 %88 = OpConstant 3,674022E-40 
					                                f32_2 %89 = OpConstantComposite %88 %88 
					                                  f32 %92 = OpConstant 3,674022E-40 
					                                 f32 %124 = OpConstant 3,674022E-40 
					                                 f32 %128 = OpConstant 3,674022E-40 
					                                 f32 %142 = OpConstant 3,674022E-40 
					                                 f32 %144 = OpConstant 3,674022E-40 
					                                 f32 %151 = OpConstant 3,674022E-40 
					                                 f32 %158 = OpConstant 3,674022E-40 
					                                 f32 %165 = OpConstant 3,674022E-40 
					                       Private bool* %171 = OpVariable Private 
					                                 f32 %177 = OpConstant 3,674022E-40 
					                                 f32 %179 = OpConstant 3,674022E-40 
					                                     %183 = OpTypePointer Function %6 
					                       Private bool* %200 = OpVariable Private 
					                                 f32 %221 = OpConstant 3,674022E-40 
					                                     %290 = OpTypeVector %6 3 
					                                     %291 = OpTypePointer Private %290 
					                      Private f32_3* %292 = OpVariable Private 
					                                     %293 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %294 = OpTypePointer UniformConstant %293 
					UniformConstant read_only Texture2D* %295 = OpVariable UniformConstant 
					                                     %297 = OpTypeSampler 
					                                     %298 = OpTypePointer UniformConstant %297 
					            UniformConstant sampler* %299 = OpVariable UniformConstant 
					                                     %301 = OpTypeSampledImage %293 
					                                     %306 = OpTypePointer Output %13 
					                       Output f32_4* %307 = OpVariable Output 
					                                 u32 %311 = OpConstant 3 
					                                     %312 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Function f32* %184 = OpVariable Function 
					                       Function f32* %206 = OpVariable Function 
					                       Function f32* %276 = OpVariable Function 
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
					                                f32_2 %35 = OpLoad %28 
					                                f32_2 %36 = OpLoad %28 
					                                  f32 %37 = OpDot %35 %36 
					                                              OpStore %34 %37 
					                                  f32 %39 = OpLoad %34 
					                                  f32 %40 = OpExtInst %1 31 %39 
					                                              OpStore %38 %40 
					                         Uniform f32* %44 = OpAccessChain %16 %42 
					                                  f32 %45 = OpLoad %44 
					                                  f32 %46 = OpFAdd %45 %30 
					                                              OpStore %41 %46 
					                                  f32 %48 = OpLoad %41 
					                                  f32 %50 = OpFMul %48 %49 
					                                              OpStore %47 %50 
					                                  f32 %55 = OpLoad %41 
					                                 bool %56 = OpFOrdLessThan %54 %55 
					                                              OpStore %53 %56 
					                                 bool %57 = OpLoad %53 
					                                              OpSelectionMerge %59 None 
					                                              OpBranchConditional %57 %58 %107 
					                                      %58 = OpLabel 
					                                  f32 %61 = OpLoad %34 
					                                  f32 %62 = OpExtInst %1 32 %61 
					                         Private f32* %65 = OpAccessChain %60 %64 
					                                              OpStore %65 %62 
					                                f32_2 %66 = OpLoad %28 
					                                f32_2 %67 = OpLoad %60 
					                                f32_2 %68 = OpVectorShuffle %67 %67 0 0 
					                                f32_2 %69 = OpFMul %66 %68 
					                                              OpStore %60 %69 
					                                  f32 %71 = OpLoad %47 
					                                  f32 %72 = OpLoad %38 
					                                  f32 %73 = OpFMul %71 %72 
					                                              OpStore %70 %73 
					                                  f32 %75 = OpLoad %70 
					                                  f32 %76 = OpExtInst %1 13 %75 
					                                              OpStore %74 %76 
					                                  f32 %78 = OpLoad %70 
					                                  f32 %79 = OpExtInst %1 14 %78 
					                                              OpStore %77 %79 
					                                  f32 %80 = OpLoad %74 
					                                  f32 %81 = OpLoad %77 
					                                  f32 %82 = OpFDiv %80 %81 
					                                              OpStore %70 %82 
					                                  f32 %83 = OpLoad %70 
					                                f32_2 %84 = OpCompositeConstruct %83 %83 
					                                f32_2 %85 = OpLoad %60 
					                                f32_2 %86 = OpFMul %84 %85 
					                                              OpStore %60 %86 
					                                f32_2 %87 = OpLoad %60 
					                                f32_2 %90 = OpFMul %87 %89 
					                                              OpStore %60 %90 
					                                  f32 %91 = OpLoad %41 
					                                  f32 %93 = OpFMul %91 %92 
					                                              OpStore %70 %93 
					                                  f32 %94 = OpLoad %70 
					                                  f32 %95 = OpExtInst %1 13 %94 
					                                              OpStore %74 %95 
					                                  f32 %96 = OpLoad %70 
					                                  f32 %97 = OpExtInst %1 14 %96 
					                                              OpStore %77 %97 
					                                  f32 %98 = OpLoad %74 
					                                  f32 %99 = OpLoad %77 
					                                 f32 %100 = OpFDiv %98 %99 
					                                              OpStore %70 %100 
					                               f32_2 %101 = OpLoad %60 
					                                 f32 %102 = OpLoad %70 
					                               f32_2 %103 = OpCompositeConstruct %102 %102 
					                               f32_2 %104 = OpFDiv %101 %103 
					                                              OpStore %60 %104 
					                               f32_2 %105 = OpLoad %60 
					                               f32_2 %106 = OpFAdd %105 %89 
					                                              OpStore %9 %106 
					                                              OpBranch %59 
					                                     %107 = OpLabel 
					                                 f32 %108 = OpLoad %41 
					                                bool %109 = OpFOrdLessThan %108 %54 
					                                              OpStore %53 %109 
					                                bool %110 = OpLoad %53 
					                                              OpSelectionMerge %112 None 
					                                              OpBranchConditional %110 %111 %112 
					                                     %111 = OpLabel 
					                                 f32 %113 = OpLoad %34 
					                                 f32 %114 = OpExtInst %1 32 %113 
					                                              OpStore %34 %114 
					                               f32_2 %115 = OpLoad %28 
					                                 f32 %116 = OpLoad %34 
					                               f32_2 %117 = OpCompositeConstruct %116 %116 
					                               f32_2 %118 = OpFMul %115 %117 
					                                              OpStore %28 %118 
					                                 f32 %119 = OpLoad %47 
					                                 f32 %120 = OpFNegate %119 
					                                 f32 %121 = OpLoad %38 
					                                 f32 %122 = OpFMul %120 %121 
					                                              OpStore %34 %122 
					                                 f32 %123 = OpLoad %34 
					                                 f32 %125 = OpFMul %123 %124 
					                                              OpStore %34 %125 
					                                 f32 %126 = OpLoad %34 
					                                 f32 %127 = OpExtInst %1 4 %126 
					                                 f32 %129 = OpExtInst %1 37 %127 %128 
					                                              OpStore %38 %129 
					                                 f32 %130 = OpLoad %34 
					                                 f32 %131 = OpExtInst %1 4 %130 
					                                 f32 %132 = OpExtInst %1 40 %131 %128 
					                                              OpStore %47 %132 
					                                 f32 %133 = OpLoad %47 
					                                 f32 %134 = OpFDiv %128 %133 
					                                              OpStore %47 %134 
					                                 f32 %135 = OpLoad %47 
					                                 f32 %136 = OpLoad %38 
					                                 f32 %137 = OpFMul %135 %136 
					                                              OpStore %38 %137 
					                                 f32 %138 = OpLoad %38 
					                                 f32 %139 = OpLoad %38 
					                                 f32 %140 = OpFMul %138 %139 
					                                              OpStore %47 %140 
					                                 f32 %141 = OpLoad %47 
					                                 f32 %143 = OpFMul %141 %142 
					                                 f32 %145 = OpFAdd %143 %144 
					                        Private f32* %146 = OpAccessChain %60 %64 
					                                              OpStore %146 %145 
					                                 f32 %147 = OpLoad %47 
					                        Private f32* %148 = OpAccessChain %60 %64 
					                                 f32 %149 = OpLoad %148 
					                                 f32 %150 = OpFMul %147 %149 
					                                 f32 %152 = OpFAdd %150 %151 
					                        Private f32* %153 = OpAccessChain %60 %64 
					                                              OpStore %153 %152 
					                                 f32 %154 = OpLoad %47 
					                        Private f32* %155 = OpAccessChain %60 %64 
					                                 f32 %156 = OpLoad %155 
					                                 f32 %157 = OpFMul %154 %156 
					                                 f32 %159 = OpFAdd %157 %158 
					                        Private f32* %160 = OpAccessChain %60 %64 
					                                              OpStore %160 %159 
					                                 f32 %161 = OpLoad %47 
					                        Private f32* %162 = OpAccessChain %60 %64 
					                                 f32 %163 = OpLoad %162 
					                                 f32 %164 = OpFMul %161 %163 
					                                 f32 %166 = OpFAdd %164 %165 
					                                              OpStore %47 %166 
					                                 f32 %167 = OpLoad %47 
					                                 f32 %168 = OpLoad %38 
					                                 f32 %169 = OpFMul %167 %168 
					                        Private f32* %170 = OpAccessChain %60 %64 
					                                              OpStore %170 %169 
					                                 f32 %172 = OpLoad %34 
					                                 f32 %173 = OpExtInst %1 4 %172 
					                                bool %174 = OpFOrdLessThan %128 %173 
					                                              OpStore %171 %174 
					                        Private f32* %175 = OpAccessChain %60 %64 
					                                 f32 %176 = OpLoad %175 
					                                 f32 %178 = OpFMul %176 %177 
					                                 f32 %180 = OpFAdd %178 %179 
					                        Private f32* %181 = OpAccessChain %60 %64 
					                                              OpStore %181 %180 
					                                bool %182 = OpLoad %171 
					                                              OpSelectionMerge %186 None 
					                                              OpBranchConditional %182 %185 %189 
					                                     %185 = OpLabel 
					                        Private f32* %187 = OpAccessChain %60 %64 
					                                 f32 %188 = OpLoad %187 
					                                              OpStore %184 %188 
					                                              OpBranch %186 
					                                     %189 = OpLabel 
					                                              OpStore %184 %54 
					                                              OpBranch %186 
					                                     %186 = OpLabel 
					                                 f32 %190 = OpLoad %184 
					                        Private f32* %191 = OpAccessChain %60 %64 
					                                              OpStore %191 %190 
					                                 f32 %192 = OpLoad %38 
					                                 f32 %193 = OpLoad %47 
					                                 f32 %194 = OpFMul %192 %193 
					                        Private f32* %195 = OpAccessChain %60 %64 
					                                 f32 %196 = OpLoad %195 
					                                 f32 %197 = OpFAdd %194 %196 
					                                              OpStore %38 %197 
					                                 f32 %198 = OpLoad %34 
					                                 f32 %199 = OpExtInst %1 37 %198 %128 
					                                              OpStore %34 %199 
					                                 f32 %201 = OpLoad %34 
					                                 f32 %202 = OpLoad %34 
					                                 f32 %203 = OpFNegate %202 
					                                bool %204 = OpFOrdLessThan %201 %203 
					                                              OpStore %200 %204 
					                                bool %205 = OpLoad %200 
					                                              OpSelectionMerge %208 None 
					                                              OpBranchConditional %205 %207 %211 
					                                     %207 = OpLabel 
					                                 f32 %209 = OpLoad %38 
					                                 f32 %210 = OpFNegate %209 
					                                              OpStore %206 %210 
					                                              OpBranch %208 
					                                     %211 = OpLabel 
					                                 f32 %212 = OpLoad %38 
					                                              OpStore %206 %212 
					                                              OpBranch %208 
					                                     %208 = OpLabel 
					                                 f32 %213 = OpLoad %206 
					                                              OpStore %34 %213 
					                               f32_2 %214 = OpLoad %28 
					                                 f32 %215 = OpLoad %34 
					                               f32_2 %216 = OpCompositeConstruct %215 %215 
					                               f32_2 %217 = OpFMul %214 %216 
					                                              OpStore %28 %217 
					                               f32_2 %218 = OpLoad %28 
					                               f32_2 %219 = OpFMul %218 %89 
					                                              OpStore %28 %219 
					                                 f32 %220 = OpLoad %41 
					                                 f32 %222 = OpFMul %220 %221 
					                                              OpStore %34 %222 
					                                 f32 %223 = OpLoad %34 
					                                 f32 %224 = OpExtInst %1 4 %223 
					                                 f32 %225 = OpExtInst %1 37 %224 %128 
					                                              OpStore %38 %225 
					                                 f32 %226 = OpLoad %34 
					                                 f32 %227 = OpExtInst %1 4 %226 
					                                 f32 %228 = OpExtInst %1 40 %227 %128 
					                                              OpStore %41 %228 
					                                 f32 %229 = OpLoad %41 
					                                 f32 %230 = OpFDiv %128 %229 
					                                              OpStore %41 %230 
					                                 f32 %231 = OpLoad %41 
					                                 f32 %232 = OpLoad %38 
					                                 f32 %233 = OpFMul %231 %232 
					                                              OpStore %38 %233 
					                                 f32 %234 = OpLoad %38 
					                                 f32 %235 = OpLoad %38 
					                                 f32 %236 = OpFMul %234 %235 
					                                              OpStore %41 %236 
					                                 f32 %237 = OpLoad %41 
					                                 f32 %238 = OpFMul %237 %142 
					                                 f32 %239 = OpFAdd %238 %144 
					                                              OpStore %47 %239 
					                                 f32 %240 = OpLoad %41 
					                                 f32 %241 = OpLoad %47 
					                                 f32 %242 = OpFMul %240 %241 
					                                 f32 %243 = OpFAdd %242 %151 
					                                              OpStore %47 %243 
					                                 f32 %244 = OpLoad %41 
					                                 f32 %245 = OpLoad %47 
					                                 f32 %246 = OpFMul %244 %245 
					                                 f32 %247 = OpFAdd %246 %158 
					                                              OpStore %47 %247 
					                                 f32 %248 = OpLoad %41 
					                                 f32 %249 = OpLoad %47 
					                                 f32 %250 = OpFMul %248 %249 
					                                 f32 %251 = OpFAdd %250 %165 
					                                              OpStore %41 %251 
					                                 f32 %252 = OpLoad %41 
					                                 f32 %253 = OpLoad %38 
					                                 f32 %254 = OpFMul %252 %253 
					                                              OpStore %47 %254 
					                                 f32 %255 = OpLoad %34 
					                                 f32 %256 = OpExtInst %1 4 %255 
					                                bool %257 = OpFOrdLessThan %128 %256 
					                                              OpStore %53 %257 
					                                 f32 %258 = OpLoad %47 
					                                 f32 %259 = OpFMul %258 %177 
					                                 f32 %260 = OpFAdd %259 %179 
					                                              OpStore %47 %260 
					                                bool %261 = OpLoad %53 
					                                 f32 %262 = OpLoad %47 
					                                 f32 %263 = OpSelect %261 %262 %54 
					                                              OpStore %47 %263 
					                                 f32 %264 = OpLoad %38 
					                                 f32 %265 = OpLoad %41 
					                                 f32 %266 = OpFMul %264 %265 
					                                 f32 %267 = OpLoad %47 
					                                 f32 %268 = OpFAdd %266 %267 
					                                              OpStore %38 %268 
					                                 f32 %269 = OpLoad %34 
					                                 f32 %270 = OpExtInst %1 37 %269 %128 
					                                              OpStore %34 %270 
					                                 f32 %271 = OpLoad %34 
					                                 f32 %272 = OpLoad %34 
					                                 f32 %273 = OpFNegate %272 
					                                bool %274 = OpFOrdLessThan %271 %273 
					                                              OpStore %200 %274 
					                                bool %275 = OpLoad %200 
					                                              OpSelectionMerge %278 None 
					                                              OpBranchConditional %275 %277 %281 
					                                     %277 = OpLabel 
					                                 f32 %279 = OpLoad %38 
					                                 f32 %280 = OpFNegate %279 
					                                              OpStore %276 %280 
					                                              OpBranch %278 
					                                     %281 = OpLabel 
					                                 f32 %282 = OpLoad %38 
					                                              OpStore %276 %282 
					                                              OpBranch %278 
					                                     %278 = OpLabel 
					                                 f32 %283 = OpLoad %276 
					                                              OpStore %34 %283 
					                               f32_2 %284 = OpLoad %28 
					                                 f32 %285 = OpLoad %34 
					                               f32_2 %286 = OpCompositeConstruct %285 %285 
					                               f32_2 %287 = OpFDiv %284 %286 
					                                              OpStore %28 %287 
					                               f32_2 %288 = OpLoad %28 
					                               f32_2 %289 = OpFAdd %288 %89 
					                                              OpStore %9 %289 
					                                              OpBranch %112 
					                                     %112 = OpLabel 
					                                              OpBranch %59 
					                                      %59 = OpLabel 
					                 read_only Texture2D %296 = OpLoad %295 
					                             sampler %300 = OpLoad %299 
					          read_only Texture2DSampled %302 = OpSampledImage %296 %300 
					                               f32_2 %303 = OpLoad %9 
					                               f32_4 %304 = OpImageSampleImplicitLod %302 %303 
					                               f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
					                                              OpStore %292 %305 
					                               f32_3 %308 = OpLoad %292 
					                               f32_4 %309 = OpLoad %307 
					                               f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
					                                              OpStore %307 %310 
					                         Output f32* %313 = OpAccessChain %307 %311 
					                                              OpStore %313 %128 
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
						vec4 unused_0_2;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					float u_xlat1;
					bool u_xlatb1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb7;
					vec2 u_xlat10;
					float u_xlat11;
					float u_xlat12;
					float u_xlat16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat1 = dot(u_xlat10.xy, u_xlat10.xy);
					    u_xlat6 = sqrt(u_xlat1);
					    u_xlat11 = _Distortion + -0.5;
					    u_xlat16 = u_xlat11 * 4.44289351;
					    u_xlatb2 = 0.0<u_xlat11;
					    if(u_xlatb2){
					        u_xlat2.x = inversesqrt(u_xlat1);
					        u_xlat2.xy = u_xlat10.xy * u_xlat2.xx;
					        u_xlat12 = u_xlat16 * u_xlat6;
					        u_xlat3 = sin(u_xlat12);
					        u_xlat4 = cos(u_xlat12);
					        u_xlat12 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = vec2(u_xlat12) * u_xlat2.xy;
					        u_xlat2.xy = u_xlat2.xy * vec2(0.5, 0.5);
					        u_xlat12 = u_xlat11 * 2.22144675;
					        u_xlat3 = sin(u_xlat12);
					        u_xlat4 = cos(u_xlat12);
					        u_xlat12 = u_xlat3 / u_xlat4;
					        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat12);
					        u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    } else {
					        u_xlatb2 = u_xlat11<0.0;
					        if(u_xlatb2){
					            u_xlat1 = inversesqrt(u_xlat1);
					            u_xlat10.xy = u_xlat10.xy * vec2(u_xlat1);
					            u_xlat1 = (-u_xlat16) * u_xlat6;
					            u_xlat1 = u_xlat1 * 10.0;
					            u_xlat6 = min(abs(u_xlat1), 1.0);
					            u_xlat16 = max(abs(u_xlat1), 1.0);
					            u_xlat16 = float(1.0) / u_xlat16;
					            u_xlat6 = u_xlat16 * u_xlat6;
					            u_xlat16 = u_xlat6 * u_xlat6;
					            u_xlat2.x = u_xlat16 * 0.0208350997 + -0.0851330012;
					            u_xlat2.x = u_xlat16 * u_xlat2.x + 0.180141002;
					            u_xlat2.x = u_xlat16 * u_xlat2.x + -0.330299497;
					            u_xlat16 = u_xlat16 * u_xlat2.x + 0.999866009;
					            u_xlat2.x = u_xlat16 * u_xlat6;
					            u_xlatb7 = 1.0<abs(u_xlat1);
					            u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
					            u_xlat2.x = u_xlatb7 ? u_xlat2.x : float(0.0);
					            u_xlat6 = u_xlat6 * u_xlat16 + u_xlat2.x;
					            u_xlat1 = min(u_xlat1, 1.0);
					            u_xlatb1 = u_xlat1<(-u_xlat1);
					            u_xlat1 = (u_xlatb1) ? (-u_xlat6) : u_xlat6;
					            u_xlat10.xy = u_xlat10.xy * vec2(u_xlat1);
					            u_xlat10.xy = u_xlat10.xy * vec2(0.5, 0.5);
					            u_xlat1 = u_xlat11 * -22.214468;
					            u_xlat6 = min(abs(u_xlat1), 1.0);
					            u_xlat11 = max(abs(u_xlat1), 1.0);
					            u_xlat11 = float(1.0) / u_xlat11;
					            u_xlat6 = u_xlat11 * u_xlat6;
					            u_xlat11 = u_xlat6 * u_xlat6;
					            u_xlat16 = u_xlat11 * 0.0208350997 + -0.0851330012;
					            u_xlat16 = u_xlat11 * u_xlat16 + 0.180141002;
					            u_xlat16 = u_xlat11 * u_xlat16 + -0.330299497;
					            u_xlat11 = u_xlat11 * u_xlat16 + 0.999866009;
					            u_xlat16 = u_xlat11 * u_xlat6;
					            u_xlatb2 = 1.0<abs(u_xlat1);
					            u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
					            u_xlat16 = u_xlatb2 ? u_xlat16 : float(0.0);
					            u_xlat6 = u_xlat6 * u_xlat11 + u_xlat16;
					            u_xlat1 = min(u_xlat1, 1.0);
					            u_xlatb1 = u_xlat1<(-u_xlat1);
					            u_xlat1 = (u_xlatb1) ? (-u_xlat6) : u_xlat6;
					            u_xlat10.xy = u_xlat10.xy / vec2(u_xlat1);
					            u_xlat0.xy = u_xlat10.xy + vec2(0.5, 0.5);
					        //ENDIF
					        }
					    //ENDIF
					    }
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
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