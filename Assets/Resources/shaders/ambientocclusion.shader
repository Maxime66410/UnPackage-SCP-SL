Shader "Hidden/Post FX/Ambient Occlusion" {
	Properties {
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 52070
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "FOG_OFF" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    u_xlat0.xyz = in_TEXCOORD0.xyx;
					    phase0_Output0_1 = u_xlat0;
					    vs_TEXCOORD2.xy = u_xlat0.zw;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "FOG_OFF" }
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
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 unity_OrthoParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	vec4 _CameraDepthTexture_ST;
					uniform 	int _SampleCount;
					uniform 	float _Intensity;
					uniform 	float _Radius;
					uniform 	float _Downsample;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthNormalsTexture;
					UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					int u_xlati0;
					bvec2 u_xlatb0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					int u_xlati1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					bvec2 u_xlatb3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat10_6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat9;
					bool u_xlatb9;
					vec3 u_xlat10;
					vec3 u_xlat14;
					int u_xlati14;
					bvec2 u_xlatb14;
					float u_xlat18;
					float u_xlat16_18;
					vec2 u_xlat22;
					float u_xlat27;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					int u_xlati30;
					bool u_xlatb30;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat10_1 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_18 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_18 = 2.0 / u_xlat16_18;
					    u_xlat10.xy = u_xlat16_1.xy * vec2(u_xlat16_18);
					    u_xlat10.z = u_xlat16_18 + -1.0;
					    u_xlat2.xyz = u_xlat10.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat10_3 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat18 = (-unity_OrthoParams.w) + 1.0;
					    u_xlat27 = u_xlat10_3.x * _ZBufferParams.x;
					    u_xlat1 = (-unity_OrthoParams.w) * u_xlat27 + 1.0;
					    u_xlat27 = u_xlat18 * u_xlat27 + _ZBufferParams.y;
					    u_xlat27 = u_xlat1 / u_xlat27;
					    u_xlatb3.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlatb1 = u_xlatb3.y || u_xlatb3.x;
					    u_xlati1 = u_xlatb1 ? 1 : int(0);
					    u_xlatb0.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
					    u_xlatb0.x = u_xlatb0.y || u_xlatb0.x;
					    u_xlati0 = u_xlatb0.x ? 1 : int(0);
					    u_xlati0 = u_xlati0 + u_xlati1;
					    u_xlat0.x = float(u_xlati0);
					    u_xlatb9 = u_xlat27>=0.999989986;
					    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat9 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 100000000.0;
					    u_xlat3.z = u_xlat27 * _ProjectionParams.z + u_xlat0.x;
					    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat4.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat4.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat0.xy = u_xlat0.xy / u_xlat4.xy;
					    u_xlat27 = (-u_xlat3.z) + 1.0;
					    u_xlat27 = unity_OrthoParams.w * u_xlat27 + u_xlat3.z;
					    u_xlat3.xy = vec2(u_xlat27) * u_xlat0.xy;
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Downsample, _Downsample));
					    u_xlat0.xy = u_xlat0.xy * _ScreenParams.xy;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat0.xy);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 52.9829178;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat9 = float(_SampleCount);
					    u_xlat5.x = 12.9898005;
					    u_xlat27 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat29 = float(u_xlati_loop_1);
					        u_xlat5.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat29;
					        u_xlat30 = u_xlat5.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat0.x + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat5.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat0.x + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat29 = u_xlat29 + 1.0;
					        u_xlat29 = u_xlat29 / u_xlat9;
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = u_xlat29 * _Radius;
					        u_xlat14.xyz = vec3(u_xlat29) * u_xlat6.xyz;
					        u_xlat29 = dot((-u_xlat2.xyz), u_xlat14.xyz);
					        u_xlatb29 = u_xlat29>=0.0;
					        u_xlat14.xyz = (bool(u_xlatb29)) ? (-u_xlat14.xyz) : u_xlat14.xyz;
					        u_xlat14.xyz = u_xlat3.xyz + u_xlat14.xyz;
					        u_xlat22.xy = u_xlat14.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat14.xx + u_xlat22.xy;
					        u_xlat22.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat14.zz + u_xlat22.xy;
					        u_xlat29 = (-u_xlat14.z) + 1.0;
					        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat14.z;
					        u_xlat22.xy = u_xlat22.xy / vec2(u_xlat29);
					        u_xlat22.xy = u_xlat22.xy + vec2(1.0, 1.0);
					        u_xlat14.xy = u_xlat22.xy * _CameraDepthTexture_ST.xy;
					        u_xlat14.xy = u_xlat14.xy * vec2(0.5, 0.5) + _CameraDepthTexture_ST.zw;
					        u_xlat10_6 = texture(_CameraDepthTexture, u_xlat14.xy);
					        u_xlat29 = u_xlat10_6.x * _ZBufferParams.x;
					        u_xlat30 = (-unity_OrthoParams.w) * u_xlat29 + 1.0;
					        u_xlat29 = u_xlat18 * u_xlat29 + _ZBufferParams.y;
					        u_xlat29 = u_xlat30 / u_xlat29;
					        u_xlatb6.xy = lessThan(u_xlat14.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb30 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati30 = u_xlatb30 ? 1 : int(0);
					        u_xlatb14.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat14.xyxx).xy;
					        u_xlatb14.x = u_xlatb14.y || u_xlatb14.x;
					        u_xlati14 = u_xlatb14.x ? 1 : int(0);
					        u_xlati30 = u_xlati30 + u_xlati14;
					        u_xlat30 = float(u_xlati30);
					        u_xlatb14.x = u_xlat29>=0.999989986;
					        u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 + u_xlat14.x;
					        u_xlat30 = u_xlat30 * 100000000.0;
					        u_xlat6.z = u_xlat29 * _ProjectionParams.z + u_xlat30;
					        u_xlat22.xy = u_xlat22.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat22.xy = u_xlat22.xy + vec2(-1.0, -1.0);
					        u_xlat22.xy = u_xlat22.xy / u_xlat4.xy;
					        u_xlat29 = (-u_xlat6.z) + 1.0;
					        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat6.z;
					        u_xlat6.xy = vec2(u_xlat29) * u_xlat22.xy;
					        u_xlat14.xyz = (-u_xlat3.xyz) + u_xlat6.xyz;
					        u_xlat29 = dot(u_xlat14.xyz, u_xlat2.xyz);
					        u_xlat29 = (-u_xlat3.z) * 0.00200000009 + u_xlat29;
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat30 = dot(u_xlat14.xyz, u_xlat14.xyz);
					        u_xlat30 = u_xlat30 + 9.99999975e-05;
					        u_xlat29 = u_xlat29 / u_xlat30;
					        u_xlat27 = u_xlat27 + u_xlat29;
					    }
					    u_xlat0.x = u_xlat27 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    SV_Target0.x = exp2(u_xlat0.x);
					    SV_Target0.yzw = u_xlat10.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "FOG_OFF" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %115 %128 %131 
					                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 Location 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 128 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 Location 131 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                                            %100 = OpTypePointer Function %6 
					                             Private f32_4* %109 = OpVariable Private 
					                                        u32 %111 = OpConstant 3 
					                                            %113 = OpTypeVector %6 2 
					                                            %114 = OpTypePointer Output %113 
					                      Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                            %117 = OpTypePointer Output %6 
					                                            %119 = OpTypeVector %6 3 
					                                        u32 %124 = OpConstant 0 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %101 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                        bool %99 = OpLoad %84 
					                                                     OpSelectionMerge %103 None 
					                                                     OpBranchConditional %99 %102 %105 
					                                            %102 = OpLabel 
					                                        f32 %104 = OpLoad %91 
					                                                     OpStore %101 %104 
					                                                     OpBranch %103 
					                                            %105 = OpLabel 
					                                 Input f32* %106 = OpAccessChain %92 %68 
					                                        f32 %107 = OpLoad %106 
					                                                     OpStore %101 %107 
					                                                     OpBranch %103 
					                                            %103 = OpLabel 
					                                        f32 %108 = OpLoad %101 
					                                                     OpStore %91 %108 
					                                        f32 %110 = OpLoad %91 
					                               Private f32* %112 = OpAccessChain %109 %111 
					                                                     OpStore %112 %110 
					                                        f32 %116 = OpLoad %91 
					                                Output f32* %118 = OpAccessChain vs_TEXCOORD2 %68 
					                                                     OpStore %118 %116 
					                                      f32_4 %120 = OpLoad %92 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 1 0 
					                                      f32_4 %122 = OpLoad %109 
					                                      f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
					                                                     OpStore %109 %123 
					                                 Input f32* %125 = OpAccessChain %92 %124 
					                                        f32 %126 = OpLoad %125 
					                                Output f32* %127 = OpAccessChain vs_TEXCOORD2 %124 
					                                                     OpStore %127 %126 
					                                      f32_4 %129 = OpLoad %109 
					                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                                     OpStore vs_TEXCOORD0 %130 
					                                      f32_4 %132 = OpLoad %109 
					                                      f32_2 %133 = OpVectorShuffle %132 %132 2 3 
					                                                     OpStore vs_TEXCOORD1 %133 
					                                Output f32* %134 = OpAccessChain %72 %22 %68 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %72 %22 %68 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 670
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %197 %653 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %19 0 Offset 19 
					                                                      OpMemberDecorate %19 1 Offset 19 
					                                                      OpMemberDecorate %19 2 Offset 19 
					                                                      OpMemberDecorate %19 3 Offset 19 
					                                                      OpMemberDecorate %19 4 Offset 19 
					                                                      OpMemberDecorate %19 5 Offset 19 
					                                                      OpMemberDecorate %19 6 Offset 19 
					                                                      OpMemberDecorate %19 7 RelaxedPrecision 
					                                                      OpMemberDecorate %19 7 Offset 19 
					                                                      OpMemberDecorate %19 8 Offset 19 
					                                                      OpMemberDecorate %19 9 Offset 19 
					                                                      OpDecorate %19 Block 
					                                                      OpDecorate %21 DescriptorSet 21 
					                                                      OpDecorate %21 Binding 21 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %37 DescriptorSet 37 
					                                                      OpDecorate %37 Binding 37 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate %41 DescriptorSet 41 
					                                                      OpDecorate %41 Binding 41 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %48 RelaxedPrecision 
					                                                      OpDecorate %49 RelaxedPrecision 
					                                                      OpDecorate %50 RelaxedPrecision 
					                                                      OpDecorate %54 RelaxedPrecision 
					                                                      OpDecorate %58 RelaxedPrecision 
					                                                      OpDecorate %60 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %65 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %68 RelaxedPrecision 
					                                                      OpDecorate %69 RelaxedPrecision 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %71 RelaxedPrecision 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %75 RelaxedPrecision 
					                                                      OpDecorate %77 RelaxedPrecision 
					                                                      OpDecorate %85 DescriptorSet 85 
					                                                      OpDecorate %85 Binding 85 
					                                                      OpDecorate %87 DescriptorSet 87 
					                                                      OpDecorate %87 Binding 87 
					                                                      OpDecorate %196 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 197 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %200 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %244 RelaxedPrecision 
					                                                      OpDecorate %245 RelaxedPrecision 
					                                                      OpDecorate %246 RelaxedPrecision 
					                                                      OpDecorate %247 RelaxedPrecision 
					                                                      OpDecorate %248 RelaxedPrecision 
					                                                      OpDecorate %294 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %635 RelaxedPrecision 
					                                                      OpDecorate %653 RelaxedPrecision 
					                                                      OpDecorate %653 Location 653 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeVector %6 4 
					                                              %15 = OpTypeInt 32 0 
					                                          u32 %16 = OpConstant 4 
					                                              %17 = OpTypeArray %14 %16 
					                                              %18 = OpTypeInt 32 1 
					                                              %19 = OpTypeStruct %14 %14 %14 %14 %17 %14 %18 %6 %6 %6 
					                                              %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4; i32; f32; f32; f32;}* %21 = OpVariable Uniform 
					                                          i32 %22 = OpConstant 5 
					                                              %23 = OpTypePointer Uniform %14 
					                               Private f32_3* %34 = OpVariable Private 
					                                              %35 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %36 = OpTypePointer UniformConstant %35 
					         UniformConstant read_only Texture2D* %37 = OpVariable UniformConstant 
					                                              %39 = OpTypeSampler 
					                                              %40 = OpTypePointer UniformConstant %39 
					                     UniformConstant sampler* %41 = OpVariable UniformConstant 
					                                              %43 = OpTypeSampledImage %35 
					                               Private f32_3* %49 = OpVariable Private 
					                                          f32 %51 = OpConstant 3,674022E-40 
					                                          f32 %52 = OpConstant 3,674022E-40 
					                                        f32_3 %53 = OpConstantComposite %51 %51 %52 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                          f32 %56 = OpConstant 3,674022E-40 
					                                        f32_3 %57 = OpConstantComposite %55 %55 %56 
					                                              %59 = OpTypePointer Private %6 
					                                 Private f32* %60 = OpVariable Private 
					                                          f32 %64 = OpConstant 3,674022E-40 
					                               Private f32_3* %67 = OpVariable Private 
					                                          f32 %76 = OpConstant 3,674022E-40 
					                                          u32 %78 = OpConstant 2 
					                               Private f32_3* %80 = OpVariable Private 
					                                        f32_3 %82 = OpConstantComposite %56 %56 %76 
					                                 Private f32* %84 = OpVariable Private 
					         UniformConstant read_only Texture2D* %85 = OpVariable UniformConstant 
					                     UniformConstant sampler* %87 = OpVariable UniformConstant 
					                                          u32 %93 = OpConstant 0 
					                                 Private f32* %95 = OpVariable Private 
					                                          i32 %96 = OpConstant 3 
					                                          u32 %97 = OpConstant 3 
					                                              %98 = OpTypePointer Uniform %6 
					                                         i32 %104 = OpConstant 2 
					                                Private f32* %108 = OpVariable Private 
					                                         u32 %118 = OpConstant 1 
					                                             %125 = OpTypeBool 
					                                             %126 = OpTypeVector %125 2 
					                                             %127 = OpTypePointer Private %126 
					                             Private bool_2* %128 = OpVariable Private 
					                                       f32_4 %131 = OpConstantComposite %52 %52 %52 %52 
					                                             %132 = OpTypeVector %125 4 
					                                             %135 = OpTypePointer Private %125 
					                               Private bool* %136 = OpVariable Private 
					                                             %142 = OpTypePointer Private %18 
					                                Private i32* %143 = OpVariable Private 
					                                         i32 %145 = OpConstant 1 
					                                         i32 %146 = OpConstant 0 
					                             Private bool_2* %148 = OpVariable Private 
					                                       f32_4 %149 = OpConstantComposite %56 %56 %52 %52 
					                                Private i32* %160 = OpVariable Private 
					                               Private bool* %170 = OpVariable Private 
					                                         f32 %171 = OpConstant 3,674022E-40 
					                                Private f32* %174 = OpVariable Private 
					                                         f32 %184 = OpConstant 3,674022E-40 
					                                             %195 = OpTypePointer Private %10 
					                              Private f32_2* %196 = OpVariable Private 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                       f32_2 %199 = OpConstantComposite %64 %64 
					                                       f32_2 %201 = OpConstantComposite %76 %76 
					                              Private f32_2* %203 = OpVariable Private 
					                                         i32 %205 = OpConstant 4 
					                              Private f32_2* %211 = OpVariable Private 
					                                         i32 %239 = OpConstant 9 
					                                         f32 %256 = OpConstant 3,674022E-40 
					                                         f32 %257 = OpConstant 3,674022E-40 
					                                       f32_2 %258 = OpConstantComposite %256 %257 
					                                         f32 %264 = OpConstant 3,674022E-40 
					                                Private f32* %268 = OpVariable Private 
					                                         i32 %269 = OpConstant 6 
					                                             %270 = OpTypePointer Uniform %18 
					                                         f32 %274 = OpConstant 3,674022E-40 
					                                Private f32* %276 = OpVariable Private 
					                                             %277 = OpTypePointer Function %18 
					                              Private f32_2* %288 = OpVariable Private 
					                                             %292 = OpTypePointer Input %6 
					                                         f32 %295 = OpConstant 3,674022E-40 
					                                Private f32* %301 = OpVariable Private 
					                                         f32 %304 = OpConstant 3,674022E-40 
					                                         f32 %309 = OpConstant 3,674022E-40 
					                              Private f32_3* %318 = OpVariable Private 
					                                Private f32* %323 = OpVariable Private 
					                                       f32_2 %325 = OpConstantComposite %56 %304 
					                                         f32 %337 = OpConstant 3,674022E-40 
					                                Private f32* %339 = OpVariable Private 
					                              Private f32_2* %342 = OpVariable Private 
					                                         i32 %372 = OpConstant 8 
					                               Private bool* %384 = OpVariable Private 
					                                             %388 = OpTypePointer Function %7 
					                                       f32_2 %438 = OpConstantComposite %56 %56 
					                                         f32 %449 = OpConstant 3,674022E-40 
					                                       f32_2 %450 = OpConstantComposite %449 %449 
					                                Private f32* %469 = OpVariable Private 
					                             Private bool_2* %485 = OpVariable Private 
					                                             %490 = OpTypeVector %18 3 
					                                             %491 = OpTypePointer Private %490 
					                              Private i32_3* %492 = OpVariable Private 
					                                         u32 %496 = OpConstant 4294967295 
					                             Private bool_2* %505 = OpVariable Private 
					                                             %521 = OpTypeVector %18 2 
					                                             %524 = OpTypeVector %15 2 
					                                       u32_2 %526 = OpConstantComposite %118 %118 
					                               Private bool* %541 = OpVariable Private 
					                                Private f32* %544 = OpVariable Private 
					                                         f32 %602 = OpConstant 3,674022E-40 
					                                         f32 %614 = OpConstant 3,674022E-40 
					                                         i32 %633 = OpConstant 7 
					                                         f32 %649 = OpConstant 3,674022E-40 
					                                             %652 = OpTypePointer Output %14 
					                               Output f32_4* %653 = OpVariable Output 
					                                             %657 = OpTypePointer Output %6 
					                                         f32 %660 = OpConstant 3,674022E-40 
					                                       f32_3 %661 = OpConstantComposite %449 %449 %660 
					                                       f32_3 %663 = OpConstantComposite %449 %449 %449 
					                               Private bool* %668 = OpVariable Private 
					                                Private i32* %669 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %278 = OpVariable Function 
					                             Function f32_3* %389 = OpVariable Function 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %24 = OpAccessChain %21 %22 
					                                        f32_4 %25 = OpLoad %24 
					                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
					                                        f32_2 %27 = OpFMul %13 %26 
					                               Uniform f32_4* %28 = OpAccessChain %21 %22 
					                                        f32_4 %29 = OpLoad %28 
					                                        f32_2 %30 = OpVectorShuffle %29 %29 2 3 
					                                        f32_2 %31 = OpFAdd %27 %30 
					                                        f32_3 %32 = OpLoad %9 
					                                        f32_3 %33 = OpVectorShuffle %32 %31 3 4 2 
					                                                      OpStore %9 %33 
					                          read_only Texture2D %38 = OpLoad %37 
					                                      sampler %42 = OpLoad %41 
					                   read_only Texture2DSampled %44 = OpSampledImage %38 %42 
					                                        f32_3 %45 = OpLoad %9 
					                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                        f32_4 %47 = OpImageSampleImplicitLod %44 %46 
					                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
					                                                      OpStore %34 %48 
					                                        f32_3 %50 = OpLoad %34 
					                                        f32_3 %54 = OpFMul %50 %53 
					                                        f32_3 %58 = OpFAdd %54 %57 
					                                                      OpStore %49 %58 
					                                        f32_3 %61 = OpLoad %49 
					                                        f32_3 %62 = OpLoad %49 
					                                          f32 %63 = OpDot %61 %62 
					                                                      OpStore %60 %63 
					                                          f32 %65 = OpLoad %60 
					                                          f32 %66 = OpFDiv %64 %65 
					                                                      OpStore %60 %66 
					                                        f32_3 %68 = OpLoad %49 
					                                        f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                                          f32 %70 = OpLoad %60 
					                                        f32_2 %71 = OpCompositeConstruct %70 %70 
					                                        f32_2 %72 = OpFMul %69 %71 
					                                        f32_3 %73 = OpLoad %67 
					                                        f32_3 %74 = OpVectorShuffle %73 %72 3 4 2 
					                                                      OpStore %67 %74 
					                                          f32 %75 = OpLoad %60 
					                                          f32 %77 = OpFAdd %75 %76 
					                                 Private f32* %79 = OpAccessChain %67 %78 
					                                                      OpStore %79 %77 
					                                        f32_3 %81 = OpLoad %67 
					                                        f32_3 %83 = OpFMul %81 %82 
					                                                      OpStore %80 %83 
					                          read_only Texture2D %86 = OpLoad %85 
					                                      sampler %88 = OpLoad %87 
					                   read_only Texture2DSampled %89 = OpSampledImage %86 %88 
					                                        f32_3 %90 = OpLoad %9 
					                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
					                                        f32_4 %92 = OpImageSampleImplicitLod %89 %91 
					                                          f32 %94 = OpCompositeExtract %92 0 
					                                                      OpStore %84 %94 
					                                 Uniform f32* %99 = OpAccessChain %21 %96 %97 
					                                         f32 %100 = OpLoad %99 
					                                         f32 %101 = OpFNegate %100 
					                                         f32 %102 = OpFAdd %101 %56 
					                                                      OpStore %95 %102 
					                                         f32 %103 = OpLoad %84 
					                                Uniform f32* %105 = OpAccessChain %21 %104 %93 
					                                         f32 %106 = OpLoad %105 
					                                         f32 %107 = OpFMul %103 %106 
					                                                      OpStore %84 %107 
					                                Uniform f32* %109 = OpAccessChain %21 %96 %97 
					                                         f32 %110 = OpLoad %109 
					                                         f32 %111 = OpFNegate %110 
					                                         f32 %112 = OpLoad %84 
					                                         f32 %113 = OpFMul %111 %112 
					                                         f32 %114 = OpFAdd %113 %56 
					                                                      OpStore %108 %114 
					                                         f32 %115 = OpLoad %95 
					                                         f32 %116 = OpLoad %84 
					                                         f32 %117 = OpFMul %115 %116 
					                                Uniform f32* %119 = OpAccessChain %21 %104 %118 
					                                         f32 %120 = OpLoad %119 
					                                         f32 %121 = OpFAdd %117 %120 
					                                                      OpStore %84 %121 
					                                         f32 %122 = OpLoad %108 
					                                         f32 %123 = OpLoad %84 
					                                         f32 %124 = OpFDiv %122 %123 
					                                                      OpStore %84 %124 
					                                       f32_3 %129 = OpLoad %9 
					                                       f32_4 %130 = OpVectorShuffle %129 %129 0 1 0 0 
					                                      bool_4 %133 = OpFOrdLessThan %130 %131 
					                                      bool_2 %134 = OpVectorShuffle %133 %133 0 1 
					                                                      OpStore %128 %134 
					                               Private bool* %137 = OpAccessChain %128 %118 
					                                        bool %138 = OpLoad %137 
					                               Private bool* %139 = OpAccessChain %128 %93 
					                                        bool %140 = OpLoad %139 
					                                        bool %141 = OpLogicalOr %138 %140 
					                                                      OpStore %136 %141 
					                                        bool %144 = OpLoad %136 
					                                         i32 %147 = OpSelect %144 %145 %146 
					                                                      OpStore %143 %147 
					                                       f32_3 %150 = OpLoad %9 
					                                       f32_4 %151 = OpVectorShuffle %150 %150 0 1 0 0 
					                                      bool_4 %152 = OpFOrdLessThan %149 %151 
					                                      bool_2 %153 = OpVectorShuffle %152 %152 0 1 
					                                                      OpStore %148 %153 
					                               Private bool* %154 = OpAccessChain %148 %118 
					                                        bool %155 = OpLoad %154 
					                               Private bool* %156 = OpAccessChain %148 %93 
					                                        bool %157 = OpLoad %156 
					                                        bool %158 = OpLogicalOr %155 %157 
					                               Private bool* %159 = OpAccessChain %148 %93 
					                                                      OpStore %159 %158 
					                               Private bool* %161 = OpAccessChain %148 %93 
					                                        bool %162 = OpLoad %161 
					                                         i32 %163 = OpSelect %162 %145 %146 
					                                                      OpStore %160 %163 
					                                         i32 %164 = OpLoad %160 
					                                         i32 %165 = OpLoad %143 
					                                         i32 %166 = OpIAdd %164 %165 
					                                                      OpStore %160 %166 
					                                         i32 %167 = OpLoad %160 
					                                         f32 %168 = OpConvertSToF %167 
					                                Private f32* %169 = OpAccessChain %9 %93 
					                                                      OpStore %169 %168 
					                                         f32 %172 = OpLoad %84 
					                                        bool %173 = OpFOrdGreaterThanEqual %171 %172 
					                                                      OpStore %170 %173 
					                                        bool %175 = OpLoad %170 
					                                         f32 %176 = OpSelect %175 %56 %52 
					                                                      OpStore %174 %176 
					                                         f32 %177 = OpLoad %174 
					                                Private f32* %178 = OpAccessChain %9 %93 
					                                         f32 %179 = OpLoad %178 
					                                         f32 %180 = OpFAdd %177 %179 
					                                Private f32* %181 = OpAccessChain %9 %93 
					                                                      OpStore %181 %180 
					                                Private f32* %182 = OpAccessChain %9 %93 
					                                         f32 %183 = OpLoad %182 
					                                         f32 %185 = OpFMul %183 %184 
					                                Private f32* %186 = OpAccessChain %9 %93 
					                                                      OpStore %186 %185 
					                                         f32 %187 = OpLoad %84 
					                                Uniform f32* %188 = OpAccessChain %21 %146 %78 
					                                         f32 %189 = OpLoad %188 
					                                         f32 %190 = OpFMul %187 %189 
					                                Private f32* %191 = OpAccessChain %9 %93 
					                                         f32 %192 = OpLoad %191 
					                                         f32 %193 = OpFAdd %190 %192 
					                                Private f32* %194 = OpAccessChain %9 %78 
					                                                      OpStore %194 %193 
					                                       f32_2 %198 = OpLoad vs_TEXCOORD1 
					                                       f32_2 %200 = OpFMul %198 %199 
					                                       f32_2 %202 = OpFAdd %200 %201 
					                                                      OpStore %196 %202 
					                                       f32_2 %204 = OpLoad %196 
					                              Uniform f32_4* %206 = OpAccessChain %21 %205 %104 
					                                       f32_4 %207 = OpLoad %206 
					                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
					                                       f32_2 %209 = OpFNegate %208 
					                                       f32_2 %210 = OpFAdd %204 %209 
					                                                      OpStore %203 %210 
					                                Uniform f32* %212 = OpAccessChain %21 %205 %146 %93 
					                                         f32 %213 = OpLoad %212 
					                                Private f32* %214 = OpAccessChain %211 %93 
					                                                      OpStore %214 %213 
					                                Uniform f32* %215 = OpAccessChain %21 %205 %145 %118 
					                                         f32 %216 = OpLoad %215 
					                                Private f32* %217 = OpAccessChain %211 %118 
					                                                      OpStore %217 %216 
					                                       f32_2 %218 = OpLoad %203 
					                                       f32_2 %219 = OpLoad %211 
					                                       f32_2 %220 = OpFDiv %218 %219 
					                                                      OpStore %203 %220 
					                                Private f32* %221 = OpAccessChain %9 %78 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpFNegate %222 
					                                         f32 %224 = OpFAdd %223 %56 
					                                                      OpStore %108 %224 
					                                Uniform f32* %225 = OpAccessChain %21 %96 %97 
					                                         f32 %226 = OpLoad %225 
					                                         f32 %227 = OpLoad %108 
					                                         f32 %228 = OpFMul %226 %227 
					                                Private f32* %229 = OpAccessChain %9 %78 
					                                         f32 %230 = OpLoad %229 
					                                         f32 %231 = OpFAdd %228 %230 
					                                                      OpStore %108 %231 
					                                         f32 %232 = OpLoad %108 
					                                       f32_2 %233 = OpCompositeConstruct %232 %232 
					                                       f32_2 %234 = OpLoad %203 
					                                       f32_2 %235 = OpFMul %233 %234 
					                                       f32_3 %236 = OpLoad %9 
					                                       f32_3 %237 = OpVectorShuffle %236 %235 3 4 2 
					                                                      OpStore %9 %237 
					                                       f32_2 %238 = OpLoad vs_TEXCOORD0 
					                                Uniform f32* %240 = OpAccessChain %21 %239 
					                                         f32 %241 = OpLoad %240 
					                                Uniform f32* %242 = OpAccessChain %21 %239 
					                                         f32 %243 = OpLoad %242 
					                                       f32_2 %244 = OpCompositeConstruct %241 %243 
					                                         f32 %245 = OpCompositeExtract %244 0 
					                                         f32 %246 = OpCompositeExtract %244 1 
					                                       f32_2 %247 = OpCompositeConstruct %245 %246 
					                                       f32_2 %248 = OpFMul %238 %247 
					                                                      OpStore %203 %248 
					                                       f32_2 %249 = OpLoad %203 
					                              Uniform f32_4* %250 = OpAccessChain %21 %145 
					                                       f32_4 %251 = OpLoad %250 
					                                       f32_2 %252 = OpVectorShuffle %251 %251 0 1 
					                                       f32_2 %253 = OpFMul %249 %252 
					                                                      OpStore %203 %253 
					                                       f32_2 %254 = OpLoad %203 
					                                       f32_2 %255 = OpExtInst %1 8 %254 
					                                                      OpStore %203 %255 
					                                       f32_2 %259 = OpLoad %203 
					                                         f32 %260 = OpDot %258 %259 
					                                                      OpStore %108 %260 
					                                         f32 %261 = OpLoad %108 
					                                         f32 %262 = OpExtInst %1 10 %261 
					                                                      OpStore %108 %262 
					                                         f32 %263 = OpLoad %108 
					                                         f32 %265 = OpFMul %263 %264 
					                                                      OpStore %108 %265 
					                                         f32 %266 = OpLoad %108 
					                                         f32 %267 = OpExtInst %1 10 %266 
					                                                      OpStore %108 %267 
					                                Uniform i32* %271 = OpAccessChain %21 %269 
					                                         i32 %272 = OpLoad %271 
					                                         f32 %273 = OpConvertSToF %272 
					                                                      OpStore %268 %273 
					                                Private f32* %275 = OpAccessChain %203 %93 
					                                                      OpStore %275 %274 
					                                                      OpStore %276 %52 
					                                                      OpStore %278 %146 
					                                                      OpBranch %279 
					                                             %279 = OpLabel 
					                                                      OpLoopMerge %281 %282 None 
					                                                      OpBranch %283 
					                                             %283 = OpLabel 
					                                         i32 %284 = OpLoad %278 
					                                Uniform i32* %285 = OpAccessChain %21 %269 
					                                         i32 %286 = OpLoad %285 
					                                        bool %287 = OpSLessThan %284 %286 
					                                                      OpBranchConditional %287 %280 %281 
					                                             %280 = OpLabel 
					                                         i32 %289 = OpLoad %278 
					                                         f32 %290 = OpConvertSToF %289 
					                                Private f32* %291 = OpAccessChain %288 %93 
					                                                      OpStore %291 %290 
					                                  Input f32* %293 = OpAccessChain vs_TEXCOORD0 %93 
					                                         f32 %294 = OpLoad %293 
					                                         f32 %296 = OpFMul %294 %295 
					                                Private f32* %297 = OpAccessChain %288 %93 
					                                         f32 %298 = OpLoad %297 
					                                         f32 %299 = OpFAdd %296 %298 
					                                Private f32* %300 = OpAccessChain %203 %118 
					                                                      OpStore %300 %299 
					                                Private f32* %302 = OpAccessChain %203 %118 
					                                         f32 %303 = OpLoad %302 
					                                         f32 %305 = OpFMul %303 %304 
					                                                      OpStore %301 %305 
					                                         f32 %306 = OpLoad %301 
					                                         f32 %307 = OpExtInst %1 13 %306 
					                                                      OpStore %301 %307 
					                                         f32 %308 = OpLoad %301 
					                                         f32 %310 = OpFMul %308 %309 
					                                                      OpStore %301 %310 
					                                         f32 %311 = OpLoad %301 
					                                         f32 %312 = OpExtInst %1 10 %311 
					                                                      OpStore %301 %312 
					                                         f32 %313 = OpLoad %108 
					                                         f32 %314 = OpLoad %301 
					                                         f32 %315 = OpFAdd %313 %314 
					                                                      OpStore %301 %315 
					                                         f32 %316 = OpLoad %301 
					                                         f32 %317 = OpExtInst %1 10 %316 
					                                                      OpStore %301 %317 
					                                         f32 %319 = OpLoad %301 
					                                         f32 %320 = OpFMul %319 %64 
					                                         f32 %321 = OpFAdd %320 %76 
					                                Private f32* %322 = OpAccessChain %318 %78 
					                                                      OpStore %322 %321 
					                                       f32_2 %324 = OpLoad %203 
					                                         f32 %326 = OpDot %324 %325 
					                                                      OpStore %323 %326 
					                                         f32 %327 = OpLoad %323 
					                                         f32 %328 = OpExtInst %1 13 %327 
					                                                      OpStore %323 %328 
					                                         f32 %329 = OpLoad %323 
					                                         f32 %330 = OpFMul %329 %309 
					                                                      OpStore %323 %330 
					                                         f32 %331 = OpLoad %323 
					                                         f32 %332 = OpExtInst %1 10 %331 
					                                                      OpStore %323 %332 
					                                         f32 %333 = OpLoad %108 
					                                         f32 %334 = OpLoad %323 
					                                         f32 %335 = OpFAdd %333 %334 
					                                                      OpStore %323 %335 
					                                         f32 %336 = OpLoad %323 
					                                         f32 %338 = OpFMul %336 %337 
					                                                      OpStore %323 %338 
					                                         f32 %340 = OpLoad %323 
					                                         f32 %341 = OpExtInst %1 13 %340 
					                                                      OpStore %339 %341 
					                                         f32 %343 = OpLoad %323 
					                                         f32 %344 = OpExtInst %1 14 %343 
					                                Private f32* %345 = OpAccessChain %342 %93 
					                                                      OpStore %345 %344 
					                                Private f32* %346 = OpAccessChain %318 %78 
					                                         f32 %347 = OpLoad %346 
					                                         f32 %348 = OpFNegate %347 
					                                Private f32* %349 = OpAccessChain %318 %78 
					                                         f32 %350 = OpLoad %349 
					                                         f32 %351 = OpFMul %348 %350 
					                                         f32 %352 = OpFAdd %351 %56 
					                                                      OpStore %323 %352 
					                                         f32 %353 = OpLoad %323 
					                                         f32 %354 = OpExtInst %1 31 %353 
					                                                      OpStore %323 %354 
					                                         f32 %355 = OpLoad %339 
					                                Private f32* %356 = OpAccessChain %342 %118 
					                                                      OpStore %356 %355 
					                                         f32 %357 = OpLoad %323 
					                                       f32_2 %358 = OpCompositeConstruct %357 %357 
					                                       f32_2 %359 = OpLoad %342 
					                                       f32_2 %360 = OpFMul %358 %359 
					                                       f32_3 %361 = OpLoad %318 
					                                       f32_3 %362 = OpVectorShuffle %361 %360 3 4 2 
					                                                      OpStore %318 %362 
					                                Private f32* %363 = OpAccessChain %288 %93 
					                                         f32 %364 = OpLoad %363 
					                                         f32 %365 = OpFAdd %364 %56 
					                                                      OpStore %323 %365 
					                                         f32 %366 = OpLoad %323 
					                                         f32 %367 = OpLoad %268 
					                                         f32 %368 = OpFDiv %366 %367 
					                                                      OpStore %323 %368 
					                                         f32 %369 = OpLoad %323 
					                                         f32 %370 = OpExtInst %1 31 %369 
					                                                      OpStore %323 %370 
					                                         f32 %371 = OpLoad %323 
					                                Uniform f32* %373 = OpAccessChain %21 %372 
					                                         f32 %374 = OpLoad %373 
					                                         f32 %375 = OpFMul %371 %374 
					                                                      OpStore %323 %375 
					                                         f32 %376 = OpLoad %323 
					                                       f32_3 %377 = OpCompositeConstruct %376 %376 %376 
					                                       f32_3 %378 = OpLoad %318 
					                                       f32_3 %379 = OpFMul %377 %378 
					                                                      OpStore %318 %379 
					                                       f32_3 %380 = OpLoad %80 
					                                       f32_3 %381 = OpFNegate %380 
					                                       f32_3 %382 = OpLoad %318 
					                                         f32 %383 = OpDot %381 %382 
					                                                      OpStore %323 %383 
					                                         f32 %385 = OpLoad %323 
					                                        bool %386 = OpFOrdGreaterThanEqual %385 %52 
					                                                      OpStore %384 %386 
					                                        bool %387 = OpLoad %384 
					                                                      OpSelectionMerge %391 None 
					                                                      OpBranchConditional %387 %390 %394 
					                                             %390 = OpLabel 
					                                       f32_3 %392 = OpLoad %318 
					                                       f32_3 %393 = OpFNegate %392 
					                                                      OpStore %389 %393 
					                                                      OpBranch %391 
					                                             %394 = OpLabel 
					                                       f32_3 %395 = OpLoad %318 
					                                                      OpStore %389 %395 
					                                                      OpBranch %391 
					                                             %391 = OpLabel 
					                                       f32_3 %396 = OpLoad %389 
					                                                      OpStore %318 %396 
					                                       f32_3 %397 = OpLoad %9 
					                                       f32_3 %398 = OpLoad %318 
					                                       f32_3 %399 = OpFAdd %397 %398 
					                                                      OpStore %318 %399 
					                                       f32_3 %400 = OpLoad %318 
					                                       f32_2 %401 = OpVectorShuffle %400 %400 1 1 
					                              Uniform f32_4* %402 = OpAccessChain %21 %205 %145 
					                                       f32_4 %403 = OpLoad %402 
					                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
					                                       f32_2 %405 = OpFMul %401 %404 
					                                                      OpStore %288 %405 
					                              Uniform f32_4* %406 = OpAccessChain %21 %205 %146 
					                                       f32_4 %407 = OpLoad %406 
					                                       f32_2 %408 = OpVectorShuffle %407 %407 0 1 
					                                       f32_3 %409 = OpLoad %318 
					                                       f32_2 %410 = OpVectorShuffle %409 %409 0 0 
					                                       f32_2 %411 = OpFMul %408 %410 
					                                       f32_2 %412 = OpLoad %288 
					                                       f32_2 %413 = OpFAdd %411 %412 
					                                                      OpStore %288 %413 
					                              Uniform f32_4* %414 = OpAccessChain %21 %205 %104 
					                                       f32_4 %415 = OpLoad %414 
					                                       f32_2 %416 = OpVectorShuffle %415 %415 0 1 
					                                       f32_3 %417 = OpLoad %318 
					                                       f32_2 %418 = OpVectorShuffle %417 %417 2 2 
					                                       f32_2 %419 = OpFMul %416 %418 
					                                       f32_2 %420 = OpLoad %288 
					                                       f32_2 %421 = OpFAdd %419 %420 
					                                                      OpStore %288 %421 
					                                Private f32* %422 = OpAccessChain %318 %78 
					                                         f32 %423 = OpLoad %422 
					                                         f32 %424 = OpFNegate %423 
					                                         f32 %425 = OpFAdd %424 %56 
					                                                      OpStore %323 %425 
					                                Uniform f32* %426 = OpAccessChain %21 %96 %97 
					                                         f32 %427 = OpLoad %426 
					                                         f32 %428 = OpLoad %323 
					                                         f32 %429 = OpFMul %427 %428 
					                                Private f32* %430 = OpAccessChain %318 %78 
					                                         f32 %431 = OpLoad %430 
					                                         f32 %432 = OpFAdd %429 %431 
					                                                      OpStore %323 %432 
					                                       f32_2 %433 = OpLoad %288 
					                                         f32 %434 = OpLoad %323 
					                                       f32_2 %435 = OpCompositeConstruct %434 %434 
					                                       f32_2 %436 = OpFDiv %433 %435 
					                                                      OpStore %288 %436 
					                                       f32_2 %437 = OpLoad %288 
					                                       f32_2 %439 = OpFAdd %437 %438 
					                                                      OpStore %288 %439 
					                                       f32_2 %440 = OpLoad %288 
					                              Uniform f32_4* %441 = OpAccessChain %21 %22 
					                                       f32_4 %442 = OpLoad %441 
					                                       f32_2 %443 = OpVectorShuffle %442 %442 0 1 
					                                       f32_2 %444 = OpFMul %440 %443 
					                                       f32_3 %445 = OpLoad %318 
					                                       f32_3 %446 = OpVectorShuffle %445 %444 3 4 2 
					                                                      OpStore %318 %446 
					                                       f32_3 %447 = OpLoad %318 
					                                       f32_2 %448 = OpVectorShuffle %447 %447 0 1 
					                                       f32_2 %451 = OpFMul %448 %450 
					                              Uniform f32_4* %452 = OpAccessChain %21 %22 
					                                       f32_4 %453 = OpLoad %452 
					                                       f32_2 %454 = OpVectorShuffle %453 %453 2 3 
					                                       f32_2 %455 = OpFAdd %451 %454 
					                                       f32_3 %456 = OpLoad %318 
					                                       f32_3 %457 = OpVectorShuffle %456 %455 3 4 2 
					                                                      OpStore %318 %457 
					                         read_only Texture2D %458 = OpLoad %85 
					                                     sampler %459 = OpLoad %87 
					                  read_only Texture2DSampled %460 = OpSampledImage %458 %459 
					                                       f32_3 %461 = OpLoad %318 
					                                       f32_2 %462 = OpVectorShuffle %461 %461 0 1 
					                                       f32_4 %463 = OpImageSampleImplicitLod %460 %462 
					                                         f32 %464 = OpCompositeExtract %463 0 
					                                                      OpStore %323 %464 
					                                         f32 %465 = OpLoad %323 
					                                Uniform f32* %466 = OpAccessChain %21 %104 %93 
					                                         f32 %467 = OpLoad %466 
					                                         f32 %468 = OpFMul %465 %467 
					                                                      OpStore %323 %468 
					                                Uniform f32* %470 = OpAccessChain %21 %96 %97 
					                                         f32 %471 = OpLoad %470 
					                                         f32 %472 = OpFNegate %471 
					                                         f32 %473 = OpLoad %323 
					                                         f32 %474 = OpFMul %472 %473 
					                                         f32 %475 = OpFAdd %474 %56 
					                                                      OpStore %469 %475 
					                                         f32 %476 = OpLoad %95 
					                                         f32 %477 = OpLoad %323 
					                                         f32 %478 = OpFMul %476 %477 
					                                Uniform f32* %479 = OpAccessChain %21 %104 %118 
					                                         f32 %480 = OpLoad %479 
					                                         f32 %481 = OpFAdd %478 %480 
					                                                      OpStore %323 %481 
					                                         f32 %482 = OpLoad %469 
					                                         f32 %483 = OpLoad %323 
					                                         f32 %484 = OpFDiv %482 %483 
					                                                      OpStore %323 %484 
					                                       f32_3 %486 = OpLoad %318 
					                                       f32_4 %487 = OpVectorShuffle %486 %486 0 1 0 1 
					                                      bool_4 %488 = OpFOrdLessThan %487 %131 
					                                      bool_2 %489 = OpVectorShuffle %488 %488 0 1 
					                                                      OpStore %485 %489 
					                               Private bool* %493 = OpAccessChain %485 %118 
					                                        bool %494 = OpLoad %493 
					                                         u32 %495 = OpSelect %494 %118 %93 
					                                         u32 %497 = OpIMul %495 %496 
					                               Private bool* %498 = OpAccessChain %485 %93 
					                                        bool %499 = OpLoad %498 
					                                         u32 %500 = OpSelect %499 %118 %93 
					                                         u32 %501 = OpIMul %500 %496 
					                                         u32 %502 = OpBitwiseOr %497 %501 
					                                         i32 %503 = OpBitcast %502 
					                                Private i32* %504 = OpAccessChain %492 %78 
					                                                      OpStore %504 %503 
					                                       f32_3 %506 = OpLoad %318 
					                                       f32_4 %507 = OpVectorShuffle %506 %506 0 1 0 0 
					                                      bool_4 %508 = OpFOrdLessThan %149 %507 
					                                      bool_2 %509 = OpVectorShuffle %508 %508 0 1 
					                                                      OpStore %505 %509 
					                               Private bool* %510 = OpAccessChain %505 %118 
					                                        bool %511 = OpLoad %510 
					                                         u32 %512 = OpSelect %511 %118 %93 
					                                         u32 %513 = OpIMul %512 %496 
					                               Private bool* %514 = OpAccessChain %505 %93 
					                                        bool %515 = OpLoad %514 
					                                         u32 %516 = OpSelect %515 %118 %93 
					                                         u32 %517 = OpIMul %516 %496 
					                                         u32 %518 = OpBitwiseOr %513 %517 
					                                         i32 %519 = OpBitcast %518 
					                                Private i32* %520 = OpAccessChain %492 %93 
					                                                      OpStore %520 %519 
					                                       i32_3 %522 = OpLoad %492 
					                                       i32_2 %523 = OpVectorShuffle %522 %522 0 2 
					                                       u32_2 %525 = OpBitcast %523 
					                                       u32_2 %527 = OpBitwiseAnd %525 %526 
					                                       i32_2 %528 = OpBitcast %527 
					                                       i32_3 %529 = OpLoad %492 
					                                       i32_3 %530 = OpVectorShuffle %529 %528 3 1 4 
					                                                      OpStore %492 %530 
					                                Private i32* %531 = OpAccessChain %492 %93 
					                                         i32 %532 = OpLoad %531 
					                                Private i32* %533 = OpAccessChain %492 %78 
					                                         i32 %534 = OpLoad %533 
					                                         i32 %535 = OpIAdd %532 %534 
					                                Private i32* %536 = OpAccessChain %492 %93 
					                                                      OpStore %536 %535 
					                                Private i32* %537 = OpAccessChain %492 %93 
					                                         i32 %538 = OpLoad %537 
					                                         f32 %539 = OpConvertSToF %538 
					                                Private f32* %540 = OpAccessChain %318 %93 
					                                                      OpStore %540 %539 
					                                         f32 %542 = OpLoad %323 
					                                        bool %543 = OpFOrdGreaterThanEqual %171 %542 
					                                                      OpStore %541 %543 
					                                        bool %545 = OpLoad %541 
					                                         f32 %546 = OpSelect %545 %56 %52 
					                                                      OpStore %544 %546 
					                                         f32 %547 = OpLoad %544 
					                                Private f32* %548 = OpAccessChain %318 %93 
					                                         f32 %549 = OpLoad %548 
					                                         f32 %550 = OpFAdd %547 %549 
					                                Private f32* %551 = OpAccessChain %318 %93 
					                                                      OpStore %551 %550 
					                                Private f32* %552 = OpAccessChain %318 %93 
					                                         f32 %553 = OpLoad %552 
					                                         f32 %554 = OpFMul %553 %184 
					                                Private f32* %555 = OpAccessChain %318 %93 
					                                                      OpStore %555 %554 
					                                         f32 %556 = OpLoad %323 
					                                Uniform f32* %557 = OpAccessChain %21 %146 %78 
					                                         f32 %558 = OpLoad %557 
					                                         f32 %559 = OpFMul %556 %558 
					                                Private f32* %560 = OpAccessChain %318 %93 
					                                         f32 %561 = OpLoad %560 
					                                         f32 %562 = OpFAdd %559 %561 
					                                Private f32* %563 = OpAccessChain %318 %78 
					                                                      OpStore %563 %562 
					                                       f32_2 %564 = OpLoad %288 
					                              Uniform f32_4* %565 = OpAccessChain %21 %205 %104 
					                                       f32_4 %566 = OpLoad %565 
					                                       f32_2 %567 = OpVectorShuffle %566 %566 0 1 
					                                       f32_2 %568 = OpFNegate %567 
					                                       f32_2 %569 = OpFAdd %564 %568 
					                                                      OpStore %288 %569 
					                                       f32_2 %570 = OpLoad %288 
					                                       f32_2 %571 = OpFAdd %570 %201 
					                                                      OpStore %288 %571 
					                                       f32_2 %572 = OpLoad %288 
					                                       f32_2 %573 = OpLoad %211 
					                                       f32_2 %574 = OpFDiv %572 %573 
					                                                      OpStore %288 %574 
					                                Private f32* %575 = OpAccessChain %318 %78 
					                                         f32 %576 = OpLoad %575 
					                                         f32 %577 = OpFNegate %576 
					                                         f32 %578 = OpFAdd %577 %56 
					                                                      OpStore %323 %578 
					                                Uniform f32* %579 = OpAccessChain %21 %96 %97 
					                                         f32 %580 = OpLoad %579 
					                                         f32 %581 = OpLoad %323 
					                                         f32 %582 = OpFMul %580 %581 
					                                Private f32* %583 = OpAccessChain %318 %78 
					                                         f32 %584 = OpLoad %583 
					                                         f32 %585 = OpFAdd %582 %584 
					                                                      OpStore %323 %585 
					                                         f32 %586 = OpLoad %323 
					                                       f32_2 %587 = OpCompositeConstruct %586 %586 
					                                       f32_2 %588 = OpLoad %288 
					                                       f32_2 %589 = OpFMul %587 %588 
					                                       f32_3 %590 = OpLoad %318 
					                                       f32_3 %591 = OpVectorShuffle %590 %589 3 4 2 
					                                                      OpStore %318 %591 
					                                       f32_3 %592 = OpLoad %9 
					                                       f32_3 %593 = OpFNegate %592 
					                                       f32_3 %594 = OpLoad %318 
					                                       f32_3 %595 = OpFAdd %593 %594 
					                                                      OpStore %318 %595 
					                                       f32_3 %596 = OpLoad %318 
					                                       f32_3 %597 = OpLoad %80 
					                                         f32 %598 = OpDot %596 %597 
					                                                      OpStore %323 %598 
					                                Private f32* %599 = OpAccessChain %9 %78 
					                                         f32 %600 = OpLoad %599 
					                                         f32 %601 = OpFNegate %600 
					                                         f32 %603 = OpFMul %601 %602 
					                                         f32 %604 = OpLoad %323 
					                                         f32 %605 = OpFAdd %603 %604 
					                                                      OpStore %323 %605 
					                                         f32 %606 = OpLoad %323 
					                                         f32 %607 = OpExtInst %1 40 %606 %52 
					                                                      OpStore %323 %607 
					                                       f32_3 %608 = OpLoad %318 
					                                       f32_3 %609 = OpLoad %318 
					                                         f32 %610 = OpDot %608 %609 
					                                Private f32* %611 = OpAccessChain %288 %93 
					                                                      OpStore %611 %610 
					                                Private f32* %612 = OpAccessChain %288 %93 
					                                         f32 %613 = OpLoad %612 
					                                         f32 %615 = OpFAdd %613 %614 
					                                Private f32* %616 = OpAccessChain %288 %93 
					                                                      OpStore %616 %615 
					                                         f32 %617 = OpLoad %323 
					                                Private f32* %618 = OpAccessChain %288 %93 
					                                         f32 %619 = OpLoad %618 
					                                         f32 %620 = OpFDiv %617 %619 
					                                                      OpStore %323 %620 
					                                         f32 %621 = OpLoad %323 
					                                         f32 %622 = OpLoad %276 
					                                         f32 %623 = OpFAdd %621 %622 
					                                                      OpStore %276 %623 
					                                                      OpBranch %282 
					                                             %282 = OpLabel 
					                                         i32 %624 = OpLoad %278 
					                                         i32 %625 = OpIAdd %624 %145 
					                                                      OpStore %278 %625 
					                                                      OpBranch %279 
					                                             %281 = OpLabel 
					                                         f32 %626 = OpLoad %276 
					                                Uniform f32* %627 = OpAccessChain %21 %372 
					                                         f32 %628 = OpLoad %627 
					                                         f32 %629 = OpFMul %626 %628 
					                                Private f32* %630 = OpAccessChain %9 %93 
					                                                      OpStore %630 %629 
					                                Private f32* %631 = OpAccessChain %9 %93 
					                                         f32 %632 = OpLoad %631 
					                                Uniform f32* %634 = OpAccessChain %21 %633 
					                                         f32 %635 = OpLoad %634 
					                                         f32 %636 = OpFMul %632 %635 
					                                Private f32* %637 = OpAccessChain %9 %93 
					                                                      OpStore %637 %636 
					                                Private f32* %638 = OpAccessChain %9 %93 
					                                         f32 %639 = OpLoad %638 
					                                         f32 %640 = OpLoad %268 
					                                         f32 %641 = OpFDiv %639 %640 
					                                Private f32* %642 = OpAccessChain %9 %93 
					                                                      OpStore %642 %641 
					                                Private f32* %643 = OpAccessChain %9 %93 
					                                         f32 %644 = OpLoad %643 
					                                         f32 %645 = OpExtInst %1 30 %644 
					                                Private f32* %646 = OpAccessChain %9 %93 
					                                                      OpStore %646 %645 
					                                Private f32* %647 = OpAccessChain %9 %93 
					                                         f32 %648 = OpLoad %647 
					                                         f32 %650 = OpFMul %648 %649 
					                                Private f32* %651 = OpAccessChain %9 %93 
					                                                      OpStore %651 %650 
					                                Private f32* %654 = OpAccessChain %9 %93 
					                                         f32 %655 = OpLoad %654 
					                                         f32 %656 = OpExtInst %1 29 %655 
					                                 Output f32* %658 = OpAccessChain %653 %93 
					                                                      OpStore %658 %656 
					                                       f32_3 %659 = OpLoad %67 
					                                       f32_3 %662 = OpFMul %659 %661 
					                                       f32_3 %664 = OpFAdd %662 %663 
					                                       f32_4 %665 = OpLoad %653 
					                                       f32_4 %666 = OpVectorShuffle %665 %664 0 4 5 6 
					                                                      OpStore %653 %666 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "FOG_OFF" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _CameraDepthTexture_ST;
						int _SampleCount;
						vec4 unused_0_3;
						float _Intensity;
						float _Radius;
						float _Downsample;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 _ZBufferParams;
						vec4 unity_OrthoParams;
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_2_2[12];
					};
					uniform  sampler2D _CameraDepthNormalsTexture;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					int u_xlati0;
					bvec2 u_xlatb0;
					float u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					int u_xlati1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					bvec2 u_xlatb3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat10_6;
					bvec2 u_xlatb6;
					float u_xlat7;
					vec2 u_xlat8;
					float u_xlat9;
					bool u_xlatb9;
					vec3 u_xlat10;
					vec3 u_xlat14;
					int u_xlati14;
					bvec2 u_xlatb14;
					float u_xlat18;
					float u_xlat16_18;
					vec2 u_xlat22;
					float u_xlat27;
					float u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					int u_xlati30;
					bool u_xlatb30;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat10_1 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_18 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
					    u_xlat16_18 = 2.0 / u_xlat16_18;
					    u_xlat10.xy = u_xlat16_1.xy * vec2(u_xlat16_18);
					    u_xlat10.z = u_xlat16_18 + -1.0;
					    u_xlat2.xyz = u_xlat10.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat10_3 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat18 = (-unity_OrthoParams.w) + 1.0;
					    u_xlat27 = u_xlat10_3.x * _ZBufferParams.x;
					    u_xlat1 = (-unity_OrthoParams.w) * u_xlat27 + 1.0;
					    u_xlat27 = u_xlat18 * u_xlat27 + _ZBufferParams.y;
					    u_xlat27 = u_xlat1 / u_xlat27;
					    u_xlatb3.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlatb1 = u_xlatb3.y || u_xlatb3.x;
					    u_xlati1 = u_xlatb1 ? 1 : int(0);
					    u_xlatb0.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
					    u_xlatb0.x = u_xlatb0.y || u_xlatb0.x;
					    u_xlati0 = u_xlatb0.x ? 1 : int(0);
					    u_xlati0 = u_xlati0 + u_xlati1;
					    u_xlat0.x = float(u_xlati0);
					    u_xlatb9 = 9.99999975e-06>=u_xlat27;
					    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat9 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 100000000.0;
					    u_xlat3.z = u_xlat27 * _ProjectionParams.z + u_xlat0.x;
					    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy + (-unity_CameraProjection[2].xy);
					    u_xlat4.x = unity_CameraProjection[0].x;
					    u_xlat4.y = unity_CameraProjection[1].y;
					    u_xlat0.xy = u_xlat0.xy / u_xlat4.xy;
					    u_xlat27 = (-u_xlat3.z) + 1.0;
					    u_xlat27 = unity_OrthoParams.w * u_xlat27 + u_xlat3.z;
					    u_xlat3.xy = vec2(u_xlat27) * u_xlat0.xy;
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Downsample, _Downsample));
					    u_xlat0.xy = u_xlat0.xy * _ScreenParams.xy;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat0.xy);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 52.9829178;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat9 = float(_SampleCount);
					    u_xlat5.x = 12.9898005;
					    u_xlat27 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat29 = float(u_xlati_loop_1);
					        u_xlat29 = u_xlat29 * 1.00010002;
					        u_xlat29 = floor(u_xlat29);
					        u_xlat5.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat29;
					        u_xlat30 = u_xlat5.y * 78.2330017;
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat0.x + u_xlat30;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat6.z = u_xlat30 * 2.0 + -1.0;
					        u_xlat30 = dot(u_xlat5.xy, vec2(1.0, 78.2330017));
					        u_xlat30 = sin(u_xlat30);
					        u_xlat30 = u_xlat30 * 43758.5469;
					        u_xlat30 = fract(u_xlat30);
					        u_xlat30 = u_xlat0.x + u_xlat30;
					        u_xlat30 = u_xlat30 * 6.28318548;
					        u_xlat7 = sin(u_xlat30);
					        u_xlat8.x = cos(u_xlat30);
					        u_xlat30 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat30 = sqrt(u_xlat30);
					        u_xlat8.y = u_xlat7;
					        u_xlat6.xy = vec2(u_xlat30) * u_xlat8.xy;
					        u_xlat29 = u_xlat29 + 1.0;
					        u_xlat29 = u_xlat29 / u_xlat9;
					        u_xlat29 = sqrt(u_xlat29);
					        u_xlat29 = u_xlat29 * _Radius;
					        u_xlat14.xyz = vec3(u_xlat29) * u_xlat6.xyz;
					        u_xlat29 = dot((-u_xlat2.xyz), u_xlat14.xyz);
					        u_xlatb29 = u_xlat29>=0.0;
					        u_xlat14.xyz = (bool(u_xlatb29)) ? (-u_xlat14.xyz) : u_xlat14.xyz;
					        u_xlat14.xyz = u_xlat3.xyz + u_xlat14.xyz;
					        u_xlat22.xy = u_xlat14.yy * unity_CameraProjection[1].xy;
					        u_xlat22.xy = unity_CameraProjection[0].xy * u_xlat14.xx + u_xlat22.xy;
					        u_xlat22.xy = unity_CameraProjection[2].xy * u_xlat14.zz + u_xlat22.xy;
					        u_xlat29 = (-u_xlat14.z) + 1.0;
					        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat14.z;
					        u_xlat22.xy = u_xlat22.xy / vec2(u_xlat29);
					        u_xlat22.xy = u_xlat22.xy + vec2(1.0, 1.0);
					        u_xlat14.xy = u_xlat22.xy * vec2(0.5, 0.5);
					        u_xlat14.xy = u_xlat14.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					        u_xlat10_6 = texture(_CameraDepthTexture, u_xlat14.xy);
					        u_xlat29 = u_xlat10_6.x * _ZBufferParams.x;
					        u_xlat30 = (-unity_OrthoParams.w) * u_xlat29 + 1.0;
					        u_xlat29 = u_xlat18 * u_xlat29 + _ZBufferParams.y;
					        u_xlat29 = u_xlat30 / u_xlat29;
					        u_xlatb6.xy = lessThan(u_xlat14.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb30 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati30 = u_xlatb30 ? 1 : int(0);
					        u_xlatb14.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat14.xyxx).xy;
					        u_xlatb14.x = u_xlatb14.y || u_xlatb14.x;
					        u_xlati14 = u_xlatb14.x ? 1 : int(0);
					        u_xlati30 = u_xlati30 + u_xlati14;
					        u_xlat30 = float(u_xlati30);
					        u_xlatb14.x = 9.99999975e-06>=u_xlat29;
					        u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
					        u_xlat30 = u_xlat30 + u_xlat14.x;
					        u_xlat30 = u_xlat30 * 100000000.0;
					        u_xlat6.z = u_xlat29 * _ProjectionParams.z + u_xlat30;
					        u_xlat22.xy = u_xlat22.xy + (-unity_CameraProjection[2].xy);
					        u_xlat22.xy = u_xlat22.xy + vec2(-1.0, -1.0);
					        u_xlat22.xy = u_xlat22.xy / u_xlat4.xy;
					        u_xlat29 = (-u_xlat6.z) + 1.0;
					        u_xlat29 = unity_OrthoParams.w * u_xlat29 + u_xlat6.z;
					        u_xlat6.xy = vec2(u_xlat29) * u_xlat22.xy;
					        u_xlat14.xyz = (-u_xlat3.xyz) + u_xlat6.xyz;
					        u_xlat29 = dot(u_xlat14.xyz, u_xlat2.xyz);
					        u_xlat29 = (-u_xlat3.z) * 0.00200000009 + u_xlat29;
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat30 = dot(u_xlat14.xyz, u_xlat14.xyz);
					        u_xlat30 = u_xlat30 + 9.99999975e-05;
					        u_xlat29 = u_xlat29 / u_xlat30;
					        u_xlat27 = u_xlat27 + u_xlat29;
					    }
					    u_xlat0.x = u_xlat27 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat9;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    SV_Target0.x = exp2(u_xlat0.x);
					    SV_Target0.yzw = u_xlat10.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "FOG_OFF" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "FOG_OFF" }
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 124839
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "FOG_OFF" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    u_xlat0.xyz = in_TEXCOORD0.xyx;
					    phase0_Output0_1 = u_xlat0;
					    vs_TEXCOORD2.xy = u_xlat0.zw;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "FOG_OFF" }
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
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 unity_OrthoParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	vec4 _CameraDepthTexture_ST;
					uniform 	int _SampleCount;
					uniform 	float _Intensity;
					uniform 	float _Radius;
					uniform 	float _Downsample;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					ivec4 u_xlati0;
					bvec2 u_xlatb0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					bvec2 u_xlatb1;
					float u_xlat2;
					vec3 u_xlat16_2;
					int u_xlati2;
					bool u_xlatb2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat10_6;
					bvec2 u_xlatb6;
					vec2 u_xlat7;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat13;
					bvec2 u_xlatb13;
					float u_xlat16;
					float u_xlat16_16;
					int u_xlati17;
					vec2 u_xlat20;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat27;
					int u_xlati27;
					bool u_xlatb27;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat10_1 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_16 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_16 = 2.0 / u_xlat16_16;
					    u_xlat10.xy = u_xlat16_2.xy * vec2(u_xlat16_16);
					    u_xlat10.z = u_xlat16_16 + -1.0;
					    u_xlat3.xyz = u_xlat10.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16 = dot(u_xlat10_1.zw, vec2(1.0, 0.00392156886));
					    u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati0.w = int((uint(u_xlatb1.y) * 0xffffffffu) | (uint(u_xlatb1.x) * 0xffffffffu));
					    u_xlatb0.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
					    u_xlati0.x = int((uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.x) * 0xffffffffu));
					    u_xlati0.xw = ivec2(uvec2(u_xlati0.xw) & uvec2(1u, 1u));
					    u_xlati0.x = u_xlati0.x + u_xlati0.w;
					    u_xlat0.x = float(u_xlati0.x);
					    u_xlatb8 = u_xlat16>=0.999989986;
					    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat8 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 100000000.0;
					    u_xlat0.x = u_xlat16 * _ProjectionParams.z + u_xlat0.x;
					    u_xlat0.z = (-_ProjectionParams.z) * 1.52587891e-05 + u_xlat0.x;
					    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat1.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat4.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat4.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat4.xy;
					    u_xlat24 = (-u_xlat0.z) + 1.0;
					    u_xlat24 = unity_OrthoParams.w * u_xlat24 + u_xlat0.z;
					    u_xlat0.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(vec2(_Downsample, _Downsample));
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat24 = dot(vec2(0.0671105608, 0.00583714992), u_xlat1.xy);
					    u_xlat24 = fract(u_xlat24);
					    u_xlat24 = u_xlat24 * 52.9829178;
					    u_xlat24 = fract(u_xlat24);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat5.x = 12.9898005;
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat25 = float(u_xlati_loop_1);
					        u_xlat5.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat25;
					        u_xlat2 = u_xlat5.y * 78.2330017;
					        u_xlat2 = sin(u_xlat2);
					        u_xlat2 = u_xlat2 * 43758.5469;
					        u_xlat2 = fract(u_xlat2);
					        u_xlat2 = u_xlat24 + u_xlat2;
					        u_xlat2 = fract(u_xlat2);
					        u_xlat6.z = u_xlat2 * 2.0 + -1.0;
					        u_xlat2 = dot(u_xlat5.xy, vec2(1.0, 78.2330017));
					        u_xlat2 = sin(u_xlat2);
					        u_xlat2 = u_xlat2 * 43758.5469;
					        u_xlat2 = fract(u_xlat2);
					        u_xlat2 = u_xlat24 + u_xlat2;
					        u_xlat2 = u_xlat2 * 6.28318548;
					        u_xlat7.x = cos(u_xlat2);
					        u_xlat2 = sin(u_xlat2);
					        u_xlat27 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat27 = sqrt(u_xlat27);
					        u_xlat7.y = u_xlat2;
					        u_xlat6.xy = vec2(u_xlat27) * u_xlat7.xy;
					        u_xlat25 = u_xlat25 + 1.0;
					        u_xlat25 = u_xlat25 / u_xlat1.x;
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = u_xlat25 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat25) * u_xlat6.xyz;
					        u_xlat25 = dot((-u_xlat3.xyz), u_xlat13.xyz);
					        u_xlatb25 = u_xlat25>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb25)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat0.xyz + u_xlat13.xyz;
					        u_xlat20.xy = u_xlat13.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat20.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat20.xy;
					        u_xlat20.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat20.xy;
					        u_xlat25 = (-u_xlat13.z) + 1.0;
					        u_xlat25 = unity_OrthoParams.w * u_xlat25 + u_xlat13.z;
					        u_xlat20.xy = u_xlat20.xy / vec2(u_xlat25);
					        u_xlat20.xy = u_xlat20.xy + vec2(1.0, 1.0);
					        u_xlat13.xy = u_xlat20.xy * vec2(0.5, 0.5);
					        u_xlat13.xy = u_xlat13.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					        u_xlat10_6 = texture(_CameraDepthNormalsTexture, u_xlat13.xy);
					        u_xlat25 = dot(u_xlat10_6.zw, vec2(1.0, 0.00392156886));
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb2 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati2 = u_xlatb2 ? 1 : int(0);
					        u_xlatb13.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb27 = u_xlatb13.y || u_xlatb13.x;
					        u_xlati27 = u_xlatb27 ? 1 : int(0);
					        u_xlati2 = u_xlati2 + u_xlati27;
					        u_xlat2 = float(u_xlati2);
					        u_xlatb27 = u_xlat25>=0.999989986;
					        u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					        u_xlat2 = u_xlat2 + u_xlat27;
					        u_xlat2 = u_xlat2 * 100000000.0;
					        u_xlat6.z = u_xlat25 * _ProjectionParams.z + u_xlat2;
					        u_xlat20.xy = u_xlat20.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat20.xy = u_xlat20.xy + vec2(-1.0, -1.0);
					        u_xlat20.xy = u_xlat20.xy / u_xlat4.xy;
					        u_xlat25 = (-u_xlat6.z) + 1.0;
					        u_xlat25 = unity_OrthoParams.w * u_xlat25 + u_xlat6.z;
					        u_xlat6.xy = vec2(u_xlat25) * u_xlat20.xy;
					        u_xlat13.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat25 = dot(u_xlat13.xyz, u_xlat3.xyz);
					        u_xlat25 = (-u_xlat0.z) * 0.00200000009 + u_xlat25;
					        u_xlat25 = max(u_xlat25, 0.0);
					        u_xlat2 = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat2 = u_xlat2 + 9.99999975e-05;
					        u_xlat25 = u_xlat25 / u_xlat2;
					        u_xlat9 = u_xlat25 + u_xlat9;
					    }
					    u_xlat0.x = u_xlat9 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    SV_Target0.x = exp2(u_xlat0.x);
					    SV_Target0.yzw = u_xlat10.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "FOG_OFF" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %115 %128 %131 
					                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 Location 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 128 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 Location 131 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                                            %100 = OpTypePointer Function %6 
					                             Private f32_4* %109 = OpVariable Private 
					                                        u32 %111 = OpConstant 3 
					                                            %113 = OpTypeVector %6 2 
					                                            %114 = OpTypePointer Output %113 
					                      Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                            %117 = OpTypePointer Output %6 
					                                            %119 = OpTypeVector %6 3 
					                                        u32 %124 = OpConstant 0 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %101 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                        bool %99 = OpLoad %84 
					                                                     OpSelectionMerge %103 None 
					                                                     OpBranchConditional %99 %102 %105 
					                                            %102 = OpLabel 
					                                        f32 %104 = OpLoad %91 
					                                                     OpStore %101 %104 
					                                                     OpBranch %103 
					                                            %105 = OpLabel 
					                                 Input f32* %106 = OpAccessChain %92 %68 
					                                        f32 %107 = OpLoad %106 
					                                                     OpStore %101 %107 
					                                                     OpBranch %103 
					                                            %103 = OpLabel 
					                                        f32 %108 = OpLoad %101 
					                                                     OpStore %91 %108 
					                                        f32 %110 = OpLoad %91 
					                               Private f32* %112 = OpAccessChain %109 %111 
					                                                     OpStore %112 %110 
					                                        f32 %116 = OpLoad %91 
					                                Output f32* %118 = OpAccessChain vs_TEXCOORD2 %68 
					                                                     OpStore %118 %116 
					                                      f32_4 %120 = OpLoad %92 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 1 0 
					                                      f32_4 %122 = OpLoad %109 
					                                      f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
					                                                     OpStore %109 %123 
					                                 Input f32* %125 = OpAccessChain %92 %124 
					                                        f32 %126 = OpLoad %125 
					                                Output f32* %127 = OpAccessChain vs_TEXCOORD2 %124 
					                                                     OpStore %127 %126 
					                                      f32_4 %129 = OpLoad %109 
					                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                                     OpStore vs_TEXCOORD0 %130 
					                                      f32_4 %132 = OpLoad %109 
					                                      f32_2 %133 = OpVectorShuffle %132 %132 2 3 
					                                                     OpStore vs_TEXCOORD1 %133 
					                                Output f32* %134 = OpAccessChain %72 %22 %68 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %72 %22 %68 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 621
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %196 %605 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %19 0 Offset 19 
					                                                      OpMemberDecorate %19 1 Offset 19 
					                                                      OpMemberDecorate %19 2 Offset 19 
					                                                      OpMemberDecorate %19 3 Offset 19 
					                                                      OpMemberDecorate %19 4 Offset 19 
					                                                      OpMemberDecorate %19 5 Offset 19 
					                                                      OpMemberDecorate %19 6 RelaxedPrecision 
					                                                      OpMemberDecorate %19 6 Offset 19 
					                                                      OpMemberDecorate %19 7 Offset 19 
					                                                      OpMemberDecorate %19 8 Offset 19 
					                                                      OpDecorate %19 Block 
					                                                      OpDecorate %21 DescriptorSet 21 
					                                                      OpDecorate %21 Binding 21 
					                                                      OpDecorate %35 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %38 DescriptorSet 38 
					                                                      OpDecorate %38 Binding 38 
					                                                      OpDecorate %39 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %42 DescriptorSet 42 
					                                                      OpDecorate %42 Binding 42 
					                                                      OpDecorate %43 RelaxedPrecision 
					                                                      OpDecorate %49 RelaxedPrecision 
					                                                      OpDecorate %50 RelaxedPrecision 
					                                                      OpDecorate %51 RelaxedPrecision 
					                                                      OpDecorate %55 RelaxedPrecision 
					                                                      OpDecorate %59 RelaxedPrecision 
					                                                      OpDecorate %61 RelaxedPrecision 
					                                                      OpDecorate %62 RelaxedPrecision 
					                                                      OpDecorate %63 RelaxedPrecision 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %67 RelaxedPrecision 
					                                                      OpDecorate %69 RelaxedPrecision 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %71 RelaxedPrecision 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %73 RelaxedPrecision 
					                                                      OpDecorate %76 RelaxedPrecision 
					                                                      OpDecorate %78 RelaxedPrecision 
					                                                      OpDecorate %86 RelaxedPrecision 
					                                                      OpDecorate %87 RelaxedPrecision 
					                                                      OpDecorate %90 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 196 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %246 RelaxedPrecision 
					                                                      OpDecorate %247 RelaxedPrecision 
					                                                      OpDecorate %248 RelaxedPrecision 
					                                                      OpDecorate %249 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %296 RelaxedPrecision 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %460 RelaxedPrecision 
					                                                      OpDecorate %461 RelaxedPrecision 
					                                                      OpDecorate %462 RelaxedPrecision 
					                                                      OpDecorate %467 RelaxedPrecision 
					                                                      OpDecorate %468 RelaxedPrecision 
					                                                      OpDecorate %469 RelaxedPrecision 
					                                                      OpDecorate %586 RelaxedPrecision 
					                                                      OpDecorate %605 RelaxedPrecision 
					                                                      OpDecorate %605 Location 605 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeVector %6 4 
					                                              %15 = OpTypeInt 32 0 
					                                          u32 %16 = OpConstant 4 
					                                              %17 = OpTypeArray %14 %16 
					                                              %18 = OpTypeInt 32 1 
					                                              %19 = OpTypeStruct %14 %14 %14 %17 %14 %18 %6 %6 %6 
					                                              %20 = OpTypePointer Uniform %19 
					Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_4; i32; f32; f32; f32;}* %21 = OpVariable Uniform 
					                                          i32 %22 = OpConstant 4 
					                                              %23 = OpTypePointer Uniform %14 
					                                              %34 = OpTypePointer Private %14 
					                               Private f32_4* %35 = OpVariable Private 
					                                              %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %37 = OpTypePointer UniformConstant %36 
					         UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
					                                              %40 = OpTypeSampler 
					                                              %41 = OpTypePointer UniformConstant %40 
					                     UniformConstant sampler* %42 = OpVariable UniformConstant 
					                                              %44 = OpTypeSampledImage %36 
					                               Private f32_3* %49 = OpVariable Private 
					                                          f32 %52 = OpConstant 3,674022E-40 
					                                          f32 %53 = OpConstant 3,674022E-40 
					                                        f32_3 %54 = OpConstantComposite %52 %52 %53 
					                                          f32 %56 = OpConstant 3,674022E-40 
					                                          f32 %57 = OpConstant 3,674022E-40 
					                                        f32_3 %58 = OpConstantComposite %56 %56 %57 
					                                              %60 = OpTypePointer Private %6 
					                                 Private f32* %61 = OpVariable Private 
					                                          f32 %65 = OpConstant 3,674022E-40 
					                               Private f32_3* %68 = OpVariable Private 
					                                          f32 %77 = OpConstant 3,674022E-40 
					                                          u32 %79 = OpConstant 2 
					                               Private f32_3* %81 = OpVariable Private 
					                                        f32_3 %83 = OpConstantComposite %57 %57 %77 
					                                 Private f32* %85 = OpVariable Private 
					                                          f32 %88 = OpConstant 3,674022E-40 
					                                        f32_2 %89 = OpConstantComposite %57 %88 
					                                              %91 = OpTypeBool 
					                                              %92 = OpTypeVector %91 2 
					                                              %93 = OpTypePointer Private %92 
					                              Private bool_2* %94 = OpVariable Private 
					                                        f32_4 %97 = OpConstantComposite %53 %53 %53 %53 
					                                              %98 = OpTypeVector %91 4 
					                                             %101 = OpTypeVector %18 4 
					                                             %102 = OpTypePointer Private %101 
					                              Private i32_4* %103 = OpVariable Private 
					                                         u32 %104 = OpConstant 1 
					                                             %105 = OpTypePointer Private %91 
					                                         u32 %108 = OpConstant 0 
					                                         u32 %110 = OpConstant 4294967295 
					                                         u32 %118 = OpConstant 3 
					                                             %119 = OpTypePointer Private %18 
					                             Private bool_2* %121 = OpVariable Private 
					                                       f32_4 %122 = OpConstantComposite %57 %57 %53 %53 
					                                             %138 = OpTypeVector %18 2 
					                                             %141 = OpTypeVector %15 2 
					                                       u32_2 %143 = OpConstantComposite %104 %104 
					                               Private bool* %158 = OpVariable Private 
					                                         f32 %159 = OpConstant 3,674022E-40 
					                                Private f32* %162 = OpVariable Private 
					                                         f32 %172 = OpConstant 3,674022E-40 
					                                         i32 %176 = OpConstant 0 
					                                             %177 = OpTypePointer Uniform %6 
					                                         f32 %188 = OpConstant 3,674022E-40 
					                                             %194 = OpTypePointer Private %10 
					                              Private f32_2* %195 = OpVariable Private 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                       f32_2 %198 = OpConstantComposite %65 %65 
					                                       f32_2 %200 = OpConstantComposite %77 %77 
					                              Private f32_2* %202 = OpVariable Private 
					                                         i32 %204 = OpConstant 3 
					                                         i32 %205 = OpConstant 2 
					                              Private f32_2* %211 = OpVariable Private 
					                                         i32 %215 = OpConstant 1 
					                                Private f32* %222 = OpVariable Private 
					                                         i32 %241 = OpConstant 8 
					                                         f32 %258 = OpConstant 3,674022E-40 
					                                         f32 %259 = OpConstant 3,674022E-40 
					                                       f32_2 %260 = OpConstantComposite %258 %259 
					                                         f32 %266 = OpConstant 3,674022E-40 
					                                         i32 %270 = OpConstant 5 
					                                             %271 = OpTypePointer Uniform %18 
					                              Private f32_2* %276 = OpVariable Private 
					                                         f32 %277 = OpConstant 3,674022E-40 
					                                Private f32* %279 = OpVariable Private 
					                                             %280 = OpTypePointer Function %18 
					                                Private f32* %291 = OpVariable Private 
					                                             %294 = OpTypePointer Input %6 
					                                         f32 %297 = OpConstant 3,674022E-40 
					                                Private f32* %302 = OpVariable Private 
					                                         f32 %305 = OpConstant 3,674022E-40 
					                                         f32 %310 = OpConstant 3,674022E-40 
					                              Private f32_3* %319 = OpVariable Private 
					                                       f32_2 %325 = OpConstantComposite %57 %305 
					                                         f32 %337 = OpConstant 3,674022E-40 
					                              Private f32_2* %339 = OpVariable Private 
					                                Private f32* %345 = OpVariable Private 
					                                         i32 %372 = OpConstant 7 
					                              Private f32_3* %376 = OpVariable Private 
					                               Private bool* %385 = OpVariable Private 
					                                             %389 = OpTypePointer Function %7 
					                              Private f32_2* %401 = OpVariable Private 
					                                       f32_2 %440 = OpConstantComposite %57 %57 
					                                         f32 %451 = OpConstant 3,674022E-40 
					                                       f32_2 %452 = OpConstantComposite %451 %451 
					                              Private f32_2* %460 = OpVariable Private 
					                             Private bool_2* %470 = OpVariable Private 
					                               Private bool* %475 = OpVariable Private 
					                                Private i32* %481 = OpVariable Private 
					                             Private bool_2* %484 = OpVariable Private 
					                               Private bool* %489 = OpVariable Private 
					                                Private i32* %495 = OpVariable Private 
					                                         f32 %557 = OpConstant 3,674022E-40 
					                                         f32 %567 = OpConstant 3,674022E-40 
					                                         i32 %584 = OpConstant 6 
					                                         f32 %601 = OpConstant 3,674022E-40 
					                                             %604 = OpTypePointer Output %14 
					                               Output f32_4* %605 = OpVariable Output 
					                                             %609 = OpTypePointer Output %6 
					                                         f32 %612 = OpConstant 3,674022E-40 
					                                       f32_3 %613 = OpConstantComposite %451 %451 %612 
					                                       f32_3 %615 = OpConstantComposite %451 %451 %451 
					                                Private i32* %620 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %281 = OpVariable Function 
					                             Function f32_3* %390 = OpVariable Function 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %24 = OpAccessChain %21 %22 
					                                        f32_4 %25 = OpLoad %24 
					                                        f32_2 %26 = OpVectorShuffle %25 %25 0 1 
					                                        f32_2 %27 = OpFMul %13 %26 
					                               Uniform f32_4* %28 = OpAccessChain %21 %22 
					                                        f32_4 %29 = OpLoad %28 
					                                        f32_2 %30 = OpVectorShuffle %29 %29 2 3 
					                                        f32_2 %31 = OpFAdd %27 %30 
					                                        f32_3 %32 = OpLoad %9 
					                                        f32_3 %33 = OpVectorShuffle %32 %31 3 4 2 
					                                                      OpStore %9 %33 
					                          read_only Texture2D %39 = OpLoad %38 
					                                      sampler %43 = OpLoad %42 
					                   read_only Texture2DSampled %45 = OpSampledImage %39 %43 
					                                        f32_3 %46 = OpLoad %9 
					                                        f32_2 %47 = OpVectorShuffle %46 %46 0 1 
					                                        f32_4 %48 = OpImageSampleImplicitLod %45 %47 
					                                                      OpStore %35 %48 
					                                        f32_4 %50 = OpLoad %35 
					                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
					                                        f32_3 %55 = OpFMul %51 %54 
					                                        f32_3 %59 = OpFAdd %55 %58 
					                                                      OpStore %49 %59 
					                                        f32_3 %62 = OpLoad %49 
					                                        f32_3 %63 = OpLoad %49 
					                                          f32 %64 = OpDot %62 %63 
					                                                      OpStore %61 %64 
					                                          f32 %66 = OpLoad %61 
					                                          f32 %67 = OpFDiv %65 %66 
					                                                      OpStore %61 %67 
					                                        f32_3 %69 = OpLoad %49 
					                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
					                                          f32 %71 = OpLoad %61 
					                                        f32_2 %72 = OpCompositeConstruct %71 %71 
					                                        f32_2 %73 = OpFMul %70 %72 
					                                        f32_3 %74 = OpLoad %68 
					                                        f32_3 %75 = OpVectorShuffle %74 %73 3 4 2 
					                                                      OpStore %68 %75 
					                                          f32 %76 = OpLoad %61 
					                                          f32 %78 = OpFAdd %76 %77 
					                                 Private f32* %80 = OpAccessChain %68 %79 
					                                                      OpStore %80 %78 
					                                        f32_3 %82 = OpLoad %68 
					                                        f32_3 %84 = OpFMul %82 %83 
					                                                      OpStore %81 %84 
					                                        f32_4 %86 = OpLoad %35 
					                                        f32_2 %87 = OpVectorShuffle %86 %86 2 3 
					                                          f32 %90 = OpDot %87 %89 
					                                                      OpStore %85 %90 
					                                        f32_3 %95 = OpLoad %9 
					                                        f32_4 %96 = OpVectorShuffle %95 %95 0 1 0 0 
					                                       bool_4 %99 = OpFOrdLessThan %96 %97 
					                                      bool_2 %100 = OpVectorShuffle %99 %99 0 1 
					                                                      OpStore %94 %100 
					                               Private bool* %106 = OpAccessChain %94 %104 
					                                        bool %107 = OpLoad %106 
					                                         u32 %109 = OpSelect %107 %104 %108 
					                                         u32 %111 = OpIMul %109 %110 
					                               Private bool* %112 = OpAccessChain %94 %108 
					                                        bool %113 = OpLoad %112 
					                                         u32 %114 = OpSelect %113 %104 %108 
					                                         u32 %115 = OpIMul %114 %110 
					                                         u32 %116 = OpBitwiseOr %111 %115 
					                                         i32 %117 = OpBitcast %116 
					                                Private i32* %120 = OpAccessChain %103 %118 
					                                                      OpStore %120 %117 
					                                       f32_3 %123 = OpLoad %9 
					                                       f32_4 %124 = OpVectorShuffle %123 %123 0 1 0 0 
					                                      bool_4 %125 = OpFOrdLessThan %122 %124 
					                                      bool_2 %126 = OpVectorShuffle %125 %125 0 1 
					                                                      OpStore %121 %126 
					                               Private bool* %127 = OpAccessChain %121 %104 
					                                        bool %128 = OpLoad %127 
					                                         u32 %129 = OpSelect %128 %104 %108 
					                                         u32 %130 = OpIMul %129 %110 
					                               Private bool* %131 = OpAccessChain %121 %108 
					                                        bool %132 = OpLoad %131 
					                                         u32 %133 = OpSelect %132 %104 %108 
					                                         u32 %134 = OpIMul %133 %110 
					                                         u32 %135 = OpBitwiseOr %130 %134 
					                                         i32 %136 = OpBitcast %135 
					                                Private i32* %137 = OpAccessChain %103 %108 
					                                                      OpStore %137 %136 
					                                       i32_4 %139 = OpLoad %103 
					                                       i32_2 %140 = OpVectorShuffle %139 %139 0 3 
					                                       u32_2 %142 = OpBitcast %140 
					                                       u32_2 %144 = OpBitwiseAnd %142 %143 
					                                       i32_2 %145 = OpBitcast %144 
					                                       i32_4 %146 = OpLoad %103 
					                                       i32_4 %147 = OpVectorShuffle %146 %145 4 1 2 5 
					                                                      OpStore %103 %147 
					                                Private i32* %148 = OpAccessChain %103 %108 
					                                         i32 %149 = OpLoad %148 
					                                Private i32* %150 = OpAccessChain %103 %118 
					                                         i32 %151 = OpLoad %150 
					                                         i32 %152 = OpIAdd %149 %151 
					                                Private i32* %153 = OpAccessChain %103 %108 
					                                                      OpStore %153 %152 
					                                Private i32* %154 = OpAccessChain %103 %108 
					                                         i32 %155 = OpLoad %154 
					                                         f32 %156 = OpConvertSToF %155 
					                                Private f32* %157 = OpAccessChain %9 %108 
					                                                      OpStore %157 %156 
					                                         f32 %160 = OpLoad %85 
					                                        bool %161 = OpFOrdGreaterThanEqual %159 %160 
					                                                      OpStore %158 %161 
					                                        bool %163 = OpLoad %158 
					                                         f32 %164 = OpSelect %163 %57 %53 
					                                                      OpStore %162 %164 
					                                         f32 %165 = OpLoad %162 
					                                Private f32* %166 = OpAccessChain %9 %108 
					                                         f32 %167 = OpLoad %166 
					                                         f32 %168 = OpFAdd %165 %167 
					                                Private f32* %169 = OpAccessChain %9 %108 
					                                                      OpStore %169 %168 
					                                Private f32* %170 = OpAccessChain %9 %108 
					                                         f32 %171 = OpLoad %170 
					                                         f32 %173 = OpFMul %171 %172 
					                                Private f32* %174 = OpAccessChain %9 %108 
					                                                      OpStore %174 %173 
					                                         f32 %175 = OpLoad %85 
					                                Uniform f32* %178 = OpAccessChain %21 %176 %79 
					                                         f32 %179 = OpLoad %178 
					                                         f32 %180 = OpFMul %175 %179 
					                                Private f32* %181 = OpAccessChain %9 %108 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpFAdd %180 %182 
					                                Private f32* %184 = OpAccessChain %9 %108 
					                                                      OpStore %184 %183 
					                                Uniform f32* %185 = OpAccessChain %21 %176 %79 
					                                         f32 %186 = OpLoad %185 
					                                         f32 %187 = OpFNegate %186 
					                                         f32 %189 = OpFMul %187 %188 
					                                Private f32* %190 = OpAccessChain %9 %108 
					                                         f32 %191 = OpLoad %190 
					                                         f32 %192 = OpFAdd %189 %191 
					                                Private f32* %193 = OpAccessChain %9 %79 
					                                                      OpStore %193 %192 
					                                       f32_2 %197 = OpLoad vs_TEXCOORD1 
					                                       f32_2 %199 = OpFMul %197 %198 
					                                       f32_2 %201 = OpFAdd %199 %200 
					                                                      OpStore %195 %201 
					                                       f32_2 %203 = OpLoad %195 
					                              Uniform f32_4* %206 = OpAccessChain %21 %204 %205 
					                                       f32_4 %207 = OpLoad %206 
					                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
					                                       f32_2 %209 = OpFNegate %208 
					                                       f32_2 %210 = OpFAdd %203 %209 
					                                                      OpStore %202 %210 
					                                Uniform f32* %212 = OpAccessChain %21 %204 %176 %108 
					                                         f32 %213 = OpLoad %212 
					                                Private f32* %214 = OpAccessChain %211 %108 
					                                                      OpStore %214 %213 
					                                Uniform f32* %216 = OpAccessChain %21 %204 %215 %104 
					                                         f32 %217 = OpLoad %216 
					                                Private f32* %218 = OpAccessChain %211 %104 
					                                                      OpStore %218 %217 
					                                       f32_2 %219 = OpLoad %202 
					                                       f32_2 %220 = OpLoad %211 
					                                       f32_2 %221 = OpFDiv %219 %220 
					                                                      OpStore %202 %221 
					                                Private f32* %223 = OpAccessChain %9 %79 
					                                         f32 %224 = OpLoad %223 
					                                         f32 %225 = OpFNegate %224 
					                                         f32 %226 = OpFAdd %225 %57 
					                                                      OpStore %222 %226 
					                                Uniform f32* %227 = OpAccessChain %21 %205 %118 
					                                         f32 %228 = OpLoad %227 
					                                         f32 %229 = OpLoad %222 
					                                         f32 %230 = OpFMul %228 %229 
					                                Private f32* %231 = OpAccessChain %9 %79 
					                                         f32 %232 = OpLoad %231 
					                                         f32 %233 = OpFAdd %230 %232 
					                                                      OpStore %222 %233 
					                                         f32 %234 = OpLoad %222 
					                                       f32_2 %235 = OpCompositeConstruct %234 %234 
					                                       f32_2 %236 = OpLoad %202 
					                                       f32_2 %237 = OpFMul %235 %236 
					                                       f32_3 %238 = OpLoad %9 
					                                       f32_3 %239 = OpVectorShuffle %238 %237 3 4 2 
					                                                      OpStore %9 %239 
					                                       f32_2 %240 = OpLoad vs_TEXCOORD0 
					                                Uniform f32* %242 = OpAccessChain %21 %241 
					                                         f32 %243 = OpLoad %242 
					                                Uniform f32* %244 = OpAccessChain %21 %241 
					                                         f32 %245 = OpLoad %244 
					                                       f32_2 %246 = OpCompositeConstruct %243 %245 
					                                         f32 %247 = OpCompositeExtract %246 0 
					                                         f32 %248 = OpCompositeExtract %246 1 
					                                       f32_2 %249 = OpCompositeConstruct %247 %248 
					                                       f32_2 %250 = OpFMul %240 %249 
					                                                      OpStore %202 %250 
					                                       f32_2 %251 = OpLoad %202 
					                              Uniform f32_4* %252 = OpAccessChain %21 %215 
					                                       f32_4 %253 = OpLoad %252 
					                                       f32_2 %254 = OpVectorShuffle %253 %253 0 1 
					                                       f32_2 %255 = OpFMul %251 %254 
					                                                      OpStore %202 %255 
					                                       f32_2 %256 = OpLoad %202 
					                                       f32_2 %257 = OpExtInst %1 8 %256 
					                                                      OpStore %202 %257 
					                                       f32_2 %261 = OpLoad %202 
					                                         f32 %262 = OpDot %260 %261 
					                                                      OpStore %222 %262 
					                                         f32 %263 = OpLoad %222 
					                                         f32 %264 = OpExtInst %1 10 %263 
					                                                      OpStore %222 %264 
					                                         f32 %265 = OpLoad %222 
					                                         f32 %267 = OpFMul %265 %266 
					                                                      OpStore %222 %267 
					                                         f32 %268 = OpLoad %222 
					                                         f32 %269 = OpExtInst %1 10 %268 
					                                                      OpStore %222 %269 
					                                Uniform i32* %272 = OpAccessChain %21 %270 
					                                         i32 %273 = OpLoad %272 
					                                         f32 %274 = OpConvertSToF %273 
					                                Private f32* %275 = OpAccessChain %202 %108 
					                                                      OpStore %275 %274 
					                                Private f32* %278 = OpAccessChain %276 %108 
					                                                      OpStore %278 %277 
					                                                      OpStore %279 %53 
					                                                      OpStore %281 %176 
					                                                      OpBranch %282 
					                                             %282 = OpLabel 
					                                                      OpLoopMerge %284 %285 None 
					                                                      OpBranch %286 
					                                             %286 = OpLabel 
					                                         i32 %287 = OpLoad %281 
					                                Uniform i32* %288 = OpAccessChain %21 %270 
					                                         i32 %289 = OpLoad %288 
					                                        bool %290 = OpSLessThan %287 %289 
					                                                      OpBranchConditional %290 %283 %284 
					                                             %283 = OpLabel 
					                                         i32 %292 = OpLoad %281 
					                                         f32 %293 = OpConvertSToF %292 
					                                                      OpStore %291 %293 
					                                  Input f32* %295 = OpAccessChain vs_TEXCOORD0 %108 
					                                         f32 %296 = OpLoad %295 
					                                         f32 %298 = OpFMul %296 %297 
					                                         f32 %299 = OpLoad %291 
					                                         f32 %300 = OpFAdd %298 %299 
					                                Private f32* %301 = OpAccessChain %276 %104 
					                                                      OpStore %301 %300 
					                                Private f32* %303 = OpAccessChain %276 %104 
					                                         f32 %304 = OpLoad %303 
					                                         f32 %306 = OpFMul %304 %305 
					                                                      OpStore %302 %306 
					                                         f32 %307 = OpLoad %302 
					                                         f32 %308 = OpExtInst %1 13 %307 
					                                                      OpStore %302 %308 
					                                         f32 %309 = OpLoad %302 
					                                         f32 %311 = OpFMul %309 %310 
					                                                      OpStore %302 %311 
					                                         f32 %312 = OpLoad %302 
					                                         f32 %313 = OpExtInst %1 10 %312 
					                                                      OpStore %302 %313 
					                                         f32 %314 = OpLoad %222 
					                                         f32 %315 = OpLoad %302 
					                                         f32 %316 = OpFAdd %314 %315 
					                                                      OpStore %302 %316 
					                                         f32 %317 = OpLoad %302 
					                                         f32 %318 = OpExtInst %1 10 %317 
					                                                      OpStore %302 %318 
					                                         f32 %320 = OpLoad %302 
					                                         f32 %321 = OpFMul %320 %65 
					                                         f32 %322 = OpFAdd %321 %77 
					                                Private f32* %323 = OpAccessChain %319 %79 
					                                                      OpStore %323 %322 
					                                       f32_2 %324 = OpLoad %276 
					                                         f32 %326 = OpDot %324 %325 
					                                                      OpStore %302 %326 
					                                         f32 %327 = OpLoad %302 
					                                         f32 %328 = OpExtInst %1 13 %327 
					                                                      OpStore %302 %328 
					                                         f32 %329 = OpLoad %302 
					                                         f32 %330 = OpFMul %329 %310 
					                                                      OpStore %302 %330 
					                                         f32 %331 = OpLoad %302 
					                                         f32 %332 = OpExtInst %1 10 %331 
					                                                      OpStore %302 %332 
					                                         f32 %333 = OpLoad %222 
					                                         f32 %334 = OpLoad %302 
					                                         f32 %335 = OpFAdd %333 %334 
					                                                      OpStore %302 %335 
					                                         f32 %336 = OpLoad %302 
					                                         f32 %338 = OpFMul %336 %337 
					                                                      OpStore %302 %338 
					                                         f32 %340 = OpLoad %302 
					                                         f32 %341 = OpExtInst %1 14 %340 
					                                Private f32* %342 = OpAccessChain %339 %108 
					                                                      OpStore %342 %341 
					                                         f32 %343 = OpLoad %302 
					                                         f32 %344 = OpExtInst %1 13 %343 
					                                                      OpStore %302 %344 
					                                Private f32* %346 = OpAccessChain %319 %79 
					                                         f32 %347 = OpLoad %346 
					                                         f32 %348 = OpFNegate %347 
					                                Private f32* %349 = OpAccessChain %319 %79 
					                                         f32 %350 = OpLoad %349 
					                                         f32 %351 = OpFMul %348 %350 
					                                         f32 %352 = OpFAdd %351 %57 
					                                                      OpStore %345 %352 
					                                         f32 %353 = OpLoad %345 
					                                         f32 %354 = OpExtInst %1 31 %353 
					                                                      OpStore %345 %354 
					                                         f32 %355 = OpLoad %302 
					                                Private f32* %356 = OpAccessChain %339 %104 
					                                                      OpStore %356 %355 
					                                         f32 %357 = OpLoad %345 
					                                       f32_2 %358 = OpCompositeConstruct %357 %357 
					                                       f32_2 %359 = OpLoad %339 
					                                       f32_2 %360 = OpFMul %358 %359 
					                                       f32_3 %361 = OpLoad %319 
					                                       f32_3 %362 = OpVectorShuffle %361 %360 3 4 2 
					                                                      OpStore %319 %362 
					                                         f32 %363 = OpLoad %291 
					                                         f32 %364 = OpFAdd %363 %57 
					                                                      OpStore %291 %364 
					                                         f32 %365 = OpLoad %291 
					                                Private f32* %366 = OpAccessChain %202 %108 
					                                         f32 %367 = OpLoad %366 
					                                         f32 %368 = OpFDiv %365 %367 
					                                                      OpStore %291 %368 
					                                         f32 %369 = OpLoad %291 
					                                         f32 %370 = OpExtInst %1 31 %369 
					                                                      OpStore %291 %370 
					                                         f32 %371 = OpLoad %291 
					                                Uniform f32* %373 = OpAccessChain %21 %372 
					                                         f32 %374 = OpLoad %373 
					                                         f32 %375 = OpFMul %371 %374 
					                                                      OpStore %291 %375 
					                                         f32 %377 = OpLoad %291 
					                                       f32_3 %378 = OpCompositeConstruct %377 %377 %377 
					                                       f32_3 %379 = OpLoad %319 
					                                       f32_3 %380 = OpFMul %378 %379 
					                                                      OpStore %376 %380 
					                                       f32_3 %381 = OpLoad %81 
					                                       f32_3 %382 = OpFNegate %381 
					                                       f32_3 %383 = OpLoad %376 
					                                         f32 %384 = OpDot %382 %383 
					                                                      OpStore %291 %384 
					                                         f32 %386 = OpLoad %291 
					                                        bool %387 = OpFOrdGreaterThanEqual %386 %53 
					                                                      OpStore %385 %387 
					                                        bool %388 = OpLoad %385 
					                                                      OpSelectionMerge %392 None 
					                                                      OpBranchConditional %388 %391 %395 
					                                             %391 = OpLabel 
					                                       f32_3 %393 = OpLoad %376 
					                                       f32_3 %394 = OpFNegate %393 
					                                                      OpStore %390 %394 
					                                                      OpBranch %392 
					                                             %395 = OpLabel 
					                                       f32_3 %396 = OpLoad %376 
					                                                      OpStore %390 %396 
					                                                      OpBranch %392 
					                                             %392 = OpLabel 
					                                       f32_3 %397 = OpLoad %390 
					                                                      OpStore %376 %397 
					                                       f32_3 %398 = OpLoad %9 
					                                       f32_3 %399 = OpLoad %376 
					                                       f32_3 %400 = OpFAdd %398 %399 
					                                                      OpStore %376 %400 
					                                       f32_3 %402 = OpLoad %376 
					                                       f32_2 %403 = OpVectorShuffle %402 %402 1 1 
					                              Uniform f32_4* %404 = OpAccessChain %21 %204 %215 
					                                       f32_4 %405 = OpLoad %404 
					                                       f32_2 %406 = OpVectorShuffle %405 %405 0 1 
					                                       f32_2 %407 = OpFMul %403 %406 
					                                                      OpStore %401 %407 
					                              Uniform f32_4* %408 = OpAccessChain %21 %204 %176 
					                                       f32_4 %409 = OpLoad %408 
					                                       f32_2 %410 = OpVectorShuffle %409 %409 0 1 
					                                       f32_3 %411 = OpLoad %376 
					                                       f32_2 %412 = OpVectorShuffle %411 %411 0 0 
					                                       f32_2 %413 = OpFMul %410 %412 
					                                       f32_2 %414 = OpLoad %401 
					                                       f32_2 %415 = OpFAdd %413 %414 
					                                                      OpStore %401 %415 
					                              Uniform f32_4* %416 = OpAccessChain %21 %204 %205 
					                                       f32_4 %417 = OpLoad %416 
					                                       f32_2 %418 = OpVectorShuffle %417 %417 0 1 
					                                       f32_3 %419 = OpLoad %376 
					                                       f32_2 %420 = OpVectorShuffle %419 %419 2 2 
					                                       f32_2 %421 = OpFMul %418 %420 
					                                       f32_2 %422 = OpLoad %401 
					                                       f32_2 %423 = OpFAdd %421 %422 
					                                                      OpStore %401 %423 
					                                Private f32* %424 = OpAccessChain %376 %79 
					                                         f32 %425 = OpLoad %424 
					                                         f32 %426 = OpFNegate %425 
					                                         f32 %427 = OpFAdd %426 %57 
					                                                      OpStore %291 %427 
					                                Uniform f32* %428 = OpAccessChain %21 %205 %118 
					                                         f32 %429 = OpLoad %428 
					                                         f32 %430 = OpLoad %291 
					                                         f32 %431 = OpFMul %429 %430 
					                                Private f32* %432 = OpAccessChain %376 %79 
					                                         f32 %433 = OpLoad %432 
					                                         f32 %434 = OpFAdd %431 %433 
					                                                      OpStore %291 %434 
					                                       f32_2 %435 = OpLoad %401 
					                                         f32 %436 = OpLoad %291 
					                                       f32_2 %437 = OpCompositeConstruct %436 %436 
					                                       f32_2 %438 = OpFDiv %435 %437 
					                                                      OpStore %401 %438 
					                                       f32_2 %439 = OpLoad %401 
					                                       f32_2 %441 = OpFAdd %439 %440 
					                                                      OpStore %401 %441 
					                                       f32_2 %442 = OpLoad %401 
					                              Uniform f32_4* %443 = OpAccessChain %21 %22 
					                                       f32_4 %444 = OpLoad %443 
					                                       f32_2 %445 = OpVectorShuffle %444 %444 0 1 
					                                       f32_2 %446 = OpFMul %442 %445 
					                                       f32_3 %447 = OpLoad %376 
					                                       f32_3 %448 = OpVectorShuffle %447 %446 3 4 2 
					                                                      OpStore %376 %448 
					                                       f32_3 %449 = OpLoad %376 
					                                       f32_2 %450 = OpVectorShuffle %449 %449 0 1 
					                                       f32_2 %453 = OpFMul %450 %452 
					                              Uniform f32_4* %454 = OpAccessChain %21 %22 
					                                       f32_4 %455 = OpLoad %454 
					                                       f32_2 %456 = OpVectorShuffle %455 %455 2 3 
					                                       f32_2 %457 = OpFAdd %453 %456 
					                                       f32_3 %458 = OpLoad %376 
					                                       f32_3 %459 = OpVectorShuffle %458 %457 3 4 2 
					                                                      OpStore %376 %459 
					                         read_only Texture2D %461 = OpLoad %38 
					                                     sampler %462 = OpLoad %42 
					                  read_only Texture2DSampled %463 = OpSampledImage %461 %462 
					                                       f32_3 %464 = OpLoad %376 
					                                       f32_2 %465 = OpVectorShuffle %464 %464 0 1 
					                                       f32_4 %466 = OpImageSampleImplicitLod %463 %465 
					                                       f32_2 %467 = OpVectorShuffle %466 %466 2 3 
					                                                      OpStore %460 %467 
					                                       f32_2 %468 = OpLoad %460 
					                                         f32 %469 = OpDot %468 %89 
					                                                      OpStore %291 %469 
					                                       f32_3 %471 = OpLoad %376 
					                                       f32_4 %472 = OpVectorShuffle %471 %471 0 1 0 0 
					                                      bool_4 %473 = OpFOrdLessThan %472 %97 
					                                      bool_2 %474 = OpVectorShuffle %473 %473 0 1 
					                                                      OpStore %470 %474 
					                               Private bool* %476 = OpAccessChain %470 %104 
					                                        bool %477 = OpLoad %476 
					                               Private bool* %478 = OpAccessChain %470 %108 
					                                        bool %479 = OpLoad %478 
					                                        bool %480 = OpLogicalOr %477 %479 
					                                                      OpStore %475 %480 
					                                        bool %482 = OpLoad %475 
					                                         i32 %483 = OpSelect %482 %215 %176 
					                                                      OpStore %481 %483 
					                                       f32_3 %485 = OpLoad %376 
					                                       f32_4 %486 = OpVectorShuffle %485 %485 0 1 0 0 
					                                      bool_4 %487 = OpFOrdLessThan %122 %486 
					                                      bool_2 %488 = OpVectorShuffle %487 %487 0 1 
					                                                      OpStore %484 %488 
					                               Private bool* %490 = OpAccessChain %484 %104 
					                                        bool %491 = OpLoad %490 
					                               Private bool* %492 = OpAccessChain %484 %108 
					                                        bool %493 = OpLoad %492 
					                                        bool %494 = OpLogicalOr %491 %493 
					                                                      OpStore %489 %494 
					                                        bool %496 = OpLoad %489 
					                                         i32 %497 = OpSelect %496 %215 %176 
					                                                      OpStore %495 %497 
					                                         i32 %498 = OpLoad %481 
					                                         i32 %499 = OpLoad %495 
					                                         i32 %500 = OpIAdd %498 %499 
					                                                      OpStore %481 %500 
					                                         i32 %501 = OpLoad %481 
					                                         f32 %502 = OpConvertSToF %501 
					                                                      OpStore %302 %502 
					                                         f32 %503 = OpLoad %291 
					                                        bool %504 = OpFOrdGreaterThanEqual %159 %503 
					                                                      OpStore %489 %504 
					                                        bool %505 = OpLoad %489 
					                                         f32 %506 = OpSelect %505 %57 %53 
					                                                      OpStore %345 %506 
					                                         f32 %507 = OpLoad %302 
					                                         f32 %508 = OpLoad %345 
					                                         f32 %509 = OpFAdd %507 %508 
					                                                      OpStore %302 %509 
					                                         f32 %510 = OpLoad %302 
					                                         f32 %511 = OpFMul %510 %172 
					                                                      OpStore %302 %511 
					                                         f32 %512 = OpLoad %291 
					                                Uniform f32* %513 = OpAccessChain %21 %176 %79 
					                                         f32 %514 = OpLoad %513 
					                                         f32 %515 = OpFMul %512 %514 
					                                         f32 %516 = OpLoad %302 
					                                         f32 %517 = OpFAdd %515 %516 
					                                Private f32* %518 = OpAccessChain %319 %79 
					                                                      OpStore %518 %517 
					                                       f32_2 %519 = OpLoad %401 
					                              Uniform f32_4* %520 = OpAccessChain %21 %204 %205 
					                                       f32_4 %521 = OpLoad %520 
					                                       f32_2 %522 = OpVectorShuffle %521 %521 0 1 
					                                       f32_2 %523 = OpFNegate %522 
					                                       f32_2 %524 = OpFAdd %519 %523 
					                                                      OpStore %401 %524 
					                                       f32_2 %525 = OpLoad %401 
					                                       f32_2 %526 = OpFAdd %525 %200 
					                                                      OpStore %401 %526 
					                                       f32_2 %527 = OpLoad %401 
					                                       f32_2 %528 = OpLoad %211 
					                                       f32_2 %529 = OpFDiv %527 %528 
					                                                      OpStore %401 %529 
					                                Private f32* %530 = OpAccessChain %319 %79 
					                                         f32 %531 = OpLoad %530 
					                                         f32 %532 = OpFNegate %531 
					                                         f32 %533 = OpFAdd %532 %57 
					                                                      OpStore %291 %533 
					                                Uniform f32* %534 = OpAccessChain %21 %205 %118 
					                                         f32 %535 = OpLoad %534 
					                                         f32 %536 = OpLoad %291 
					                                         f32 %537 = OpFMul %535 %536 
					                                Private f32* %538 = OpAccessChain %319 %79 
					                                         f32 %539 = OpLoad %538 
					                                         f32 %540 = OpFAdd %537 %539 
					                                                      OpStore %291 %540 
					                                         f32 %541 = OpLoad %291 
					                                       f32_2 %542 = OpCompositeConstruct %541 %541 
					                                       f32_2 %543 = OpLoad %401 
					                                       f32_2 %544 = OpFMul %542 %543 
					                                       f32_3 %545 = OpLoad %319 
					                                       f32_3 %546 = OpVectorShuffle %545 %544 3 4 2 
					                                                      OpStore %319 %546 
					                                       f32_3 %547 = OpLoad %9 
					                                       f32_3 %548 = OpFNegate %547 
					                                       f32_3 %549 = OpLoad %319 
					                                       f32_3 %550 = OpFAdd %548 %549 
					                                                      OpStore %376 %550 
					                                       f32_3 %551 = OpLoad %376 
					                                       f32_3 %552 = OpLoad %81 
					                                         f32 %553 = OpDot %551 %552 
					                                                      OpStore %291 %553 
					                                Private f32* %554 = OpAccessChain %9 %79 
					                                         f32 %555 = OpLoad %554 
					                                         f32 %556 = OpFNegate %555 
					                                         f32 %558 = OpFMul %556 %557 
					                                         f32 %559 = OpLoad %291 
					                                         f32 %560 = OpFAdd %558 %559 
					                                                      OpStore %291 %560 
					                                         f32 %561 = OpLoad %291 
					                                         f32 %562 = OpExtInst %1 40 %561 %53 
					                                                      OpStore %291 %562 
					                                       f32_3 %563 = OpLoad %376 
					                                       f32_3 %564 = OpLoad %376 
					                                         f32 %565 = OpDot %563 %564 
					                                                      OpStore %302 %565 
					                                         f32 %566 = OpLoad %302 
					                                         f32 %568 = OpFAdd %566 %567 
					                                                      OpStore %302 %568 
					                                         f32 %569 = OpLoad %291 
					                                         f32 %570 = OpLoad %302 
					                                         f32 %571 = OpFDiv %569 %570 
					                                                      OpStore %291 %571 
					                                         f32 %572 = OpLoad %291 
					                                         f32 %573 = OpLoad %279 
					                                         f32 %574 = OpFAdd %572 %573 
					                                                      OpStore %279 %574 
					                                                      OpBranch %285 
					                                             %285 = OpLabel 
					                                         i32 %575 = OpLoad %281 
					                                         i32 %576 = OpIAdd %575 %215 
					                                                      OpStore %281 %576 
					                                                      OpBranch %282 
					                                             %284 = OpLabel 
					                                         f32 %577 = OpLoad %279 
					                                Uniform f32* %578 = OpAccessChain %21 %372 
					                                         f32 %579 = OpLoad %578 
					                                         f32 %580 = OpFMul %577 %579 
					                                Private f32* %581 = OpAccessChain %9 %108 
					                                                      OpStore %581 %580 
					                                Private f32* %582 = OpAccessChain %9 %108 
					                                         f32 %583 = OpLoad %582 
					                                Uniform f32* %585 = OpAccessChain %21 %584 
					                                         f32 %586 = OpLoad %585 
					                                         f32 %587 = OpFMul %583 %586 
					                                Private f32* %588 = OpAccessChain %9 %108 
					                                                      OpStore %588 %587 
					                                Private f32* %589 = OpAccessChain %9 %108 
					                                         f32 %590 = OpLoad %589 
					                                Private f32* %591 = OpAccessChain %202 %108 
					                                         f32 %592 = OpLoad %591 
					                                         f32 %593 = OpFDiv %590 %592 
					                                Private f32* %594 = OpAccessChain %9 %108 
					                                                      OpStore %594 %593 
					                                Private f32* %595 = OpAccessChain %9 %108 
					                                         f32 %596 = OpLoad %595 
					                                         f32 %597 = OpExtInst %1 30 %596 
					                                Private f32* %598 = OpAccessChain %9 %108 
					                                                      OpStore %598 %597 
					                                Private f32* %599 = OpAccessChain %9 %108 
					                                         f32 %600 = OpLoad %599 
					                                         f32 %602 = OpFMul %600 %601 
					                                Private f32* %603 = OpAccessChain %9 %108 
					                                                      OpStore %603 %602 
					                                Private f32* %606 = OpAccessChain %9 %108 
					                                         f32 %607 = OpLoad %606 
					                                         f32 %608 = OpExtInst %1 29 %607 
					                                 Output f32* %610 = OpAccessChain %605 %108 
					                                                      OpStore %610 %608 
					                                       f32_3 %611 = OpLoad %68 
					                                       f32_3 %614 = OpFMul %611 %613 
					                                       f32_3 %616 = OpFAdd %614 %615 
					                                       f32_4 %617 = OpLoad %605 
					                                       f32_4 %618 = OpVectorShuffle %617 %616 0 4 5 6 
					                                                      OpStore %605 %618 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "FOG_OFF" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _CameraDepthTexture_ST;
						int _SampleCount;
						vec4 unused_0_3;
						float _Intensity;
						float _Radius;
						float _Downsample;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 unused_1_3;
						vec4 unity_OrthoParams;
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_2_2[12];
					};
					uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					ivec4 u_xlati0;
					bvec2 u_xlatb0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					bvec2 u_xlatb1;
					float u_xlat2;
					vec3 u_xlat16_2;
					int u_xlati2;
					bool u_xlatb2;
					vec3 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat10_6;
					bvec2 u_xlatb6;
					vec2 u_xlat7;
					float u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					vec3 u_xlat10;
					vec3 u_xlat13;
					bvec2 u_xlatb13;
					float u_xlat16;
					float u_xlat16_16;
					int u_xlati17;
					vec2 u_xlat20;
					float u_xlat24;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat27;
					int u_xlati27;
					bool u_xlatb27;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat10_1 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_16 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_16 = 2.0 / u_xlat16_16;
					    u_xlat10.xy = u_xlat16_2.xy * vec2(u_xlat16_16);
					    u_xlat10.z = u_xlat16_16 + -1.0;
					    u_xlat3.xyz = u_xlat10.xyz * vec3(1.0, 1.0, -1.0);
					    u_xlat16 = dot(u_xlat10_1.zw, vec2(1.0, 0.00392156886));
					    u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlati0.w = int((uint(u_xlatb1.y) * 0xffffffffu) | (uint(u_xlatb1.x) * 0xffffffffu));
					    u_xlatb0.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
					    u_xlati0.x = int((uint(u_xlatb0.y) * 0xffffffffu) | (uint(u_xlatb0.x) * 0xffffffffu));
					    u_xlati0.xw = ivec2(uvec2(u_xlati0.xw) & uvec2(1u, 1u));
					    u_xlati0.x = u_xlati0.x + u_xlati0.w;
					    u_xlat0.x = float(u_xlati0.x);
					    u_xlatb8 = 9.99999975e-06>=u_xlat16;
					    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat8 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 100000000.0;
					    u_xlat0.x = u_xlat16 * _ProjectionParams.z + u_xlat0.x;
					    u_xlat0.z = (-_ProjectionParams.z) * 1.52587891e-05 + u_xlat0.x;
					    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xy = u_xlat1.xy + (-unity_CameraProjection[2].xy);
					    u_xlat4.x = unity_CameraProjection[0].x;
					    u_xlat4.y = unity_CameraProjection[1].y;
					    u_xlat1.xy = u_xlat1.xy / u_xlat4.xy;
					    u_xlat24 = (-u_xlat0.z) + 1.0;
					    u_xlat24 = unity_OrthoParams.w * u_xlat24 + u_xlat0.z;
					    u_xlat0.xy = vec2(u_xlat24) * u_xlat1.xy;
					    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(vec2(_Downsample, _Downsample));
					    u_xlat1.xy = u_xlat1.xy * _ScreenParams.xy;
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat24 = dot(vec2(0.0671105608, 0.00583714992), u_xlat1.xy);
					    u_xlat24 = fract(u_xlat24);
					    u_xlat24 = u_xlat24 * 52.9829178;
					    u_xlat24 = fract(u_xlat24);
					    u_xlat1.x = float(_SampleCount);
					    u_xlat5.x = 12.9898005;
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat25 = float(u_xlati_loop_1);
					        u_xlat25 = u_xlat25 * 1.00010002;
					        u_xlat25 = floor(u_xlat25);
					        u_xlat5.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat25;
					        u_xlat2 = u_xlat5.y * 78.2330017;
					        u_xlat2 = sin(u_xlat2);
					        u_xlat2 = u_xlat2 * 43758.5469;
					        u_xlat2 = fract(u_xlat2);
					        u_xlat2 = u_xlat24 + u_xlat2;
					        u_xlat2 = fract(u_xlat2);
					        u_xlat6.z = u_xlat2 * 2.0 + -1.0;
					        u_xlat2 = dot(u_xlat5.xy, vec2(1.0, 78.2330017));
					        u_xlat2 = sin(u_xlat2);
					        u_xlat2 = u_xlat2 * 43758.5469;
					        u_xlat2 = fract(u_xlat2);
					        u_xlat2 = u_xlat24 + u_xlat2;
					        u_xlat2 = u_xlat2 * 6.28318548;
					        u_xlat7.x = cos(u_xlat2);
					        u_xlat2 = sin(u_xlat2);
					        u_xlat27 = (-u_xlat6.z) * u_xlat6.z + 1.0;
					        u_xlat27 = sqrt(u_xlat27);
					        u_xlat7.y = u_xlat2;
					        u_xlat6.xy = vec2(u_xlat27) * u_xlat7.xy;
					        u_xlat25 = u_xlat25 + 1.0;
					        u_xlat25 = u_xlat25 / u_xlat1.x;
					        u_xlat25 = sqrt(u_xlat25);
					        u_xlat25 = u_xlat25 * _Radius;
					        u_xlat13.xyz = vec3(u_xlat25) * u_xlat6.xyz;
					        u_xlat25 = dot((-u_xlat3.xyz), u_xlat13.xyz);
					        u_xlatb25 = u_xlat25>=0.0;
					        u_xlat13.xyz = (bool(u_xlatb25)) ? (-u_xlat13.xyz) : u_xlat13.xyz;
					        u_xlat13.xyz = u_xlat0.xyz + u_xlat13.xyz;
					        u_xlat20.xy = u_xlat13.yy * unity_CameraProjection[1].xy;
					        u_xlat20.xy = unity_CameraProjection[0].xy * u_xlat13.xx + u_xlat20.xy;
					        u_xlat20.xy = unity_CameraProjection[2].xy * u_xlat13.zz + u_xlat20.xy;
					        u_xlat25 = (-u_xlat13.z) + 1.0;
					        u_xlat25 = unity_OrthoParams.w * u_xlat25 + u_xlat13.z;
					        u_xlat20.xy = u_xlat20.xy / vec2(u_xlat25);
					        u_xlat20.xy = u_xlat20.xy + vec2(1.0, 1.0);
					        u_xlat13.xy = u_xlat20.xy * vec2(0.5, 0.5);
					        u_xlat13.xy = u_xlat13.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					        u_xlat10_6 = texture(_CameraDepthNormalsTexture, u_xlat13.xy);
					        u_xlat25 = dot(u_xlat10_6.zw, vec2(1.0, 0.00392156886));
					        u_xlatb6.xy = lessThan(u_xlat13.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb2 = u_xlatb6.y || u_xlatb6.x;
					        u_xlati2 = u_xlatb2 ? 1 : int(0);
					        u_xlatb13.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat13.xyxx).xy;
					        u_xlatb27 = u_xlatb13.y || u_xlatb13.x;
					        u_xlati27 = u_xlatb27 ? 1 : int(0);
					        u_xlati2 = u_xlati2 + u_xlati27;
					        u_xlat2 = float(u_xlati2);
					        u_xlatb27 = 9.99999975e-06>=u_xlat25;
					        u_xlat27 = u_xlatb27 ? 1.0 : float(0.0);
					        u_xlat2 = u_xlat2 + u_xlat27;
					        u_xlat2 = u_xlat2 * 100000000.0;
					        u_xlat6.z = u_xlat25 * _ProjectionParams.z + u_xlat2;
					        u_xlat20.xy = u_xlat20.xy + (-unity_CameraProjection[2].xy);
					        u_xlat20.xy = u_xlat20.xy + vec2(-1.0, -1.0);
					        u_xlat20.xy = u_xlat20.xy / u_xlat4.xy;
					        u_xlat25 = (-u_xlat6.z) + 1.0;
					        u_xlat25 = unity_OrthoParams.w * u_xlat25 + u_xlat6.z;
					        u_xlat6.xy = vec2(u_xlat25) * u_xlat20.xy;
					        u_xlat13.xyz = (-u_xlat0.xyz) + u_xlat6.xyz;
					        u_xlat25 = dot(u_xlat13.xyz, u_xlat3.xyz);
					        u_xlat25 = (-u_xlat0.z) * 0.00200000009 + u_xlat25;
					        u_xlat25 = max(u_xlat25, 0.0);
					        u_xlat2 = dot(u_xlat13.xyz, u_xlat13.xyz);
					        u_xlat2 = u_xlat2 + 9.99999975e-05;
					        u_xlat25 = u_xlat25 / u_xlat2;
					        u_xlat9 = u_xlat25 + u_xlat9;
					    }
					    u_xlat0.x = u_xlat9 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat1.x;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    SV_Target0.x = exp2(u_xlat0.x);
					    SV_Target0.yzw = u_xlat10.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "FOG_OFF" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "FOG_OFF" }
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 173809
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "FOG_OFF" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    u_xlat0.xyz = in_TEXCOORD0.xyx;
					    phase0_Output0_1 = u_xlat0;
					    vs_TEXCOORD2.xy = u_xlat0.zw;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "FOG_OFF" }
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
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 _ScreenParams;
					uniform 	vec4 _ZBufferParams;
					uniform 	vec4 unity_OrthoParams;
					uniform 	vec4 hlslcc_mtx4x4unity_CameraProjection[4];
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _CameraDepthTexture_ST;
					uniform 	int _SampleCount;
					uniform 	float _Intensity;
					uniform 	float _Radius;
					uniform 	float _Downsample;
					UNITY_LOCATION(0) uniform  sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					int u_xlati0;
					bvec2 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec2 u_xlatb2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					bvec2 u_xlatb5;
					float u_xlat6;
					vec2 u_xlat7;
					float u_xlat8;
					bool u_xlatb8;
					vec3 u_xlat12;
					ivec3 u_xlati12;
					bvec2 u_xlatb12;
					float u_xlat16;
					bool u_xlatb16;
					vec2 u_xlat19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat24;
					float u_xlat25;
					int u_xlati25;
					bool u_xlatb25;
					float u_xlat26;
					bool u_xlatb26;
					float u_xlat28;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat10_1 = texture(_CameraGBufferTexture2, u_xlat0.xy);
					    u_xlat16 = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlatb16 = u_xlat16!=0.0;
					    u_xlat16 = (u_xlatb16) ? -1.0 : -0.0;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat16);
					    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat10_2 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat16 = (-unity_OrthoParams.w) + 1.0;
					    u_xlat24 = u_xlat10_2.x * _ZBufferParams.x;
					    u_xlat25 = (-unity_OrthoParams.w) * u_xlat24 + 1.0;
					    u_xlat24 = u_xlat16 * u_xlat24 + _ZBufferParams.y;
					    u_xlat24 = u_xlat25 / u_xlat24;
					    u_xlatb2.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlatb25 = u_xlatb2.y || u_xlatb2.x;
					    u_xlati25 = u_xlatb25 ? 1 : int(0);
					    u_xlatb0.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
					    u_xlatb0.x = u_xlatb0.y || u_xlatb0.x;
					    u_xlati0 = u_xlatb0.x ? 1 : int(0);
					    u_xlati0 = u_xlati0 + u_xlati25;
					    u_xlat0.x = float(u_xlati0);
					    u_xlatb8 = u_xlat24>=0.999989986;
					    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat8 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 100000000.0;
					    u_xlat2.z = u_xlat24 * _ProjectionParams.z + u_xlat0.x;
					    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					    u_xlat3.x = hlslcc_mtx4x4unity_CameraProjection[0].x;
					    u_xlat3.y = hlslcc_mtx4x4unity_CameraProjection[1].y;
					    u_xlat0.xy = u_xlat0.xy / u_xlat3.xy;
					    u_xlat24 = (-u_xlat2.z) + 1.0;
					    u_xlat24 = unity_OrthoParams.w * u_xlat24 + u_xlat2.z;
					    u_xlat2.xy = vec2(u_xlat24) * u_xlat0.xy;
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Downsample, _Downsample));
					    u_xlat0.xy = u_xlat0.xy * _ScreenParams.xy;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat0.xy);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 52.9829178;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat8 = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat24 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat26 = float(u_xlati_loop_1);
					        u_xlat4.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat26;
					        u_xlat19.x = u_xlat4.y * 78.2330017;
					        u_xlat19.x = sin(u_xlat19.x);
					        u_xlat19.x = u_xlat19.x * 43758.5469;
					        u_xlat19.x = fract(u_xlat19.x);
					        u_xlat19.x = u_xlat0.x + u_xlat19.x;
					        u_xlat19.x = fract(u_xlat19.x);
					        u_xlat5.z = u_xlat19.x * 2.0 + -1.0;
					        u_xlat19.x = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat19.x = sin(u_xlat19.x);
					        u_xlat19.x = u_xlat19.x * 43758.5469;
					        u_xlat19.x = fract(u_xlat19.x);
					        u_xlat19.x = u_xlat0.x + u_xlat19.x;
					        u_xlat19.x = u_xlat19.x * 6.28318548;
					        u_xlat6 = sin(u_xlat19.x);
					        u_xlat7.x = cos(u_xlat19.x);
					        u_xlat19.x = (-u_xlat5.z) * u_xlat5.z + 1.0;
					        u_xlat19.x = sqrt(u_xlat19.x);
					        u_xlat7.y = u_xlat6;
					        u_xlat5.xy = u_xlat19.xx * u_xlat7.xy;
					        u_xlat26 = u_xlat26 + 1.0;
					        u_xlat26 = u_xlat26 / u_xlat8;
					        u_xlat26 = sqrt(u_xlat26);
					        u_xlat26 = u_xlat26 * _Radius;
					        u_xlat12.xyz = vec3(u_xlat26) * u_xlat5.xyz;
					        u_xlat26 = dot((-u_xlat1.xyz), u_xlat12.xyz);
					        u_xlatb26 = u_xlat26>=0.0;
					        u_xlat12.xyz = (bool(u_xlatb26)) ? (-u_xlat12.xyz) : u_xlat12.xyz;
					        u_xlat12.xyz = u_xlat2.xyz + u_xlat12.xyz;
					        u_xlat19.xy = u_xlat12.yy * hlslcc_mtx4x4unity_CameraProjection[1].xy;
					        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[0].xy * u_xlat12.xx + u_xlat19.xy;
					        u_xlat19.xy = hlslcc_mtx4x4unity_CameraProjection[2].xy * u_xlat12.zz + u_xlat19.xy;
					        u_xlat26 = (-u_xlat12.z) + 1.0;
					        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat12.z;
					        u_xlat19.xy = u_xlat19.xy / vec2(u_xlat26);
					        u_xlat19.xy = u_xlat19.xy + vec2(1.0, 1.0);
					        u_xlat12.xy = u_xlat19.xy * vec2(0.5, 0.5);
					        u_xlat12.xy = u_xlat12.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					        u_xlat10_5 = texture(_CameraDepthTexture, u_xlat12.xy);
					        u_xlat26 = u_xlat10_5.x * _ZBufferParams.x;
					        u_xlat28 = (-unity_OrthoParams.w) * u_xlat26 + 1.0;
					        u_xlat26 = u_xlat16 * u_xlat26 + _ZBufferParams.y;
					        u_xlat26 = u_xlat28 / u_xlat26;
					        u_xlatb5.xy = lessThan(u_xlat12.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlati12.z = int((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu));
					        u_xlatb12.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat12.xyxx).xy;
					        u_xlati12.x = int((uint(u_xlatb12.y) * 0xffffffffu) | (uint(u_xlatb12.x) * 0xffffffffu));
					        u_xlati12.xz = ivec2(uvec2(u_xlati12.xz) & uvec2(1u, 1u));
					        u_xlati12.x = u_xlati12.x + u_xlati12.z;
					        u_xlat12.x = float(u_xlati12.x);
					        u_xlatb20 = u_xlat26>=0.999989986;
					        u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
					        u_xlat12.x = u_xlat20 + u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * 100000000.0;
					        u_xlat5.z = u_xlat26 * _ProjectionParams.z + u_xlat12.x;
					        u_xlat19.xy = u_xlat19.xy + (-hlslcc_mtx4x4unity_CameraProjection[2].xy);
					        u_xlat19.xy = u_xlat19.xy + vec2(-1.0, -1.0);
					        u_xlat19.xy = u_xlat19.xy / u_xlat3.xy;
					        u_xlat26 = (-u_xlat5.z) + 1.0;
					        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat5.z;
					        u_xlat5.xy = vec2(u_xlat26) * u_xlat19.xy;
					        u_xlat12.xyz = (-u_xlat2.xyz) + u_xlat5.xyz;
					        u_xlat26 = dot(u_xlat12.xyz, u_xlat1.xyz);
					        u_xlat26 = (-u_xlat2.z) * 0.00200000009 + u_xlat26;
					        u_xlat26 = max(u_xlat26, 0.0);
					        u_xlat19.x = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat19.x = u_xlat19.x + 9.99999975e-05;
					        u_xlat26 = u_xlat26 / u_xlat19.x;
					        u_xlat24 = u_xlat24 + u_xlat26;
					    }
					    u_xlat0.x = u_xlat24 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat8;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    SV_Target0.x = exp2(u_xlat0.x);
					    SV_Target0.yzw = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "FOG_OFF" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %115 %128 %131 
					                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 Location 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 128 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 Location 131 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                                            %100 = OpTypePointer Function %6 
					                             Private f32_4* %109 = OpVariable Private 
					                                        u32 %111 = OpConstant 3 
					                                            %113 = OpTypeVector %6 2 
					                                            %114 = OpTypePointer Output %113 
					                      Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                            %117 = OpTypePointer Output %6 
					                                            %119 = OpTypeVector %6 3 
					                                        u32 %124 = OpConstant 0 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %101 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                        bool %99 = OpLoad %84 
					                                                     OpSelectionMerge %103 None 
					                                                     OpBranchConditional %99 %102 %105 
					                                            %102 = OpLabel 
					                                        f32 %104 = OpLoad %91 
					                                                     OpStore %101 %104 
					                                                     OpBranch %103 
					                                            %105 = OpLabel 
					                                 Input f32* %106 = OpAccessChain %92 %68 
					                                        f32 %107 = OpLoad %106 
					                                                     OpStore %101 %107 
					                                                     OpBranch %103 
					                                            %103 = OpLabel 
					                                        f32 %108 = OpLoad %101 
					                                                     OpStore %91 %108 
					                                        f32 %110 = OpLoad %91 
					                               Private f32* %112 = OpAccessChain %109 %111 
					                                                     OpStore %112 %110 
					                                        f32 %116 = OpLoad %91 
					                                Output f32* %118 = OpAccessChain vs_TEXCOORD2 %68 
					                                                     OpStore %118 %116 
					                                      f32_4 %120 = OpLoad %92 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 1 0 
					                                      f32_4 %122 = OpLoad %109 
					                                      f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
					                                                     OpStore %109 %123 
					                                 Input f32* %125 = OpAccessChain %92 %124 
					                                        f32 %126 = OpLoad %125 
					                                Output f32* %127 = OpAccessChain vs_TEXCOORD2 %124 
					                                                     OpStore %127 %126 
					                                      f32_4 %129 = OpLoad %109 
					                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                                     OpStore vs_TEXCOORD0 %130 
					                                      f32_4 %132 = OpLoad %109 
					                                      f32_2 %133 = OpVectorShuffle %132 %132 2 3 
					                                                     OpStore vs_TEXCOORD1 %133 
					                                Output f32* %134 = OpAccessChain %72 %22 %68 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %72 %22 %68 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 732
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %217 %717 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpDecorate %13 RelaxedPrecision 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpDecorate %18 ArrayStride 18 
					                                                      OpMemberDecorate %20 0 Offset 20 
					                                                      OpMemberDecorate %20 1 Offset 20 
					                                                      OpMemberDecorate %20 2 Offset 20 
					                                                      OpMemberDecorate %20 3 Offset 20 
					                                                      OpMemberDecorate %20 4 Offset 20 
					                                                      OpMemberDecorate %20 5 Offset 20 
					                                                      OpMemberDecorate %20 6 Offset 20 
					                                                      OpMemberDecorate %20 7 Offset 20 
					                                                      OpMemberDecorate %20 8 RelaxedPrecision 
					                                                      OpMemberDecorate %20 8 Offset 20 
					                                                      OpMemberDecorate %20 9 Offset 20 
					                                                      OpMemberDecorate %20 10 Offset 20 
					                                                      OpDecorate %20 Block 
					                                                      OpDecorate %22 DescriptorSet 22 
					                                                      OpDecorate %22 Binding 22 
					                                                      OpDecorate %35 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %38 DescriptorSet 38 
					                                                      OpDecorate %38 Binding 38 
					                                                      OpDecorate %39 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %42 DescriptorSet 42 
					                                                      OpDecorate %42 Binding 42 
					                                                      OpDecorate %43 RelaxedPrecision 
					                                                      OpDecorate %49 RelaxedPrecision 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %53 RelaxedPrecision 
					                                                      OpDecorate %54 RelaxedPrecision 
					                                                      OpDecorate %67 RelaxedPrecision 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %72 RelaxedPrecision 
					                                                      OpDecorate %73 RelaxedPrecision 
					                                                      OpDecorate %108 DescriptorSet 108 
					                                                      OpDecorate %108 Binding 108 
					                                                      OpDecorate %110 DescriptorSet 110 
					                                                      OpDecorate %110 Binding 110 
					                                                      OpDecorate %216 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 217 
					                                                      OpDecorate %218 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %271 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %328 RelaxedPrecision 
					                                                      OpDecorate %330 RelaxedPrecision 
					                                                      OpDecorate %698 RelaxedPrecision 
					                                                      OpDecorate %717 RelaxedPrecision 
					                                                      OpDecorate %717 Location 717 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeVector %6 4 
					                                              %15 = OpTypeInt 32 0 
					                                          u32 %16 = OpConstant 4 
					                                              %17 = OpTypeArray %14 %16 
					                                              %18 = OpTypeArray %14 %16 
					                                              %19 = OpTypeInt 32 1 
					                                              %20 = OpTypeStruct %14 %14 %14 %14 %17 %18 %14 %19 %6 %6 %6 
					                                              %21 = OpTypePointer Uniform %20 
					Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4; i32; f32; f32; f32;}* %22 = OpVariable Uniform 
					                                          i32 %23 = OpConstant 6 
					                                              %24 = OpTypePointer Uniform %14 
					                               Private f32_3* %35 = OpVariable Private 
					                                              %36 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %37 = OpTypePointer UniformConstant %36 
					         UniformConstant read_only Texture2D* %38 = OpVariable UniformConstant 
					                                              %40 = OpTypeSampler 
					                                              %41 = OpTypePointer UniformConstant %40 
					                     UniformConstant sampler* %42 = OpVariable UniformConstant 
					                                              %44 = OpTypeSampledImage %36 
					                                              %50 = OpTypePointer Private %6 
					                                 Private f32* %51 = OpVariable Private 
					                                              %55 = OpTypeBool 
					                                              %56 = OpTypePointer Private %55 
					                                Private bool* %57 = OpVariable Private 
					                                          f32 %59 = OpConstant 3,674022E-40 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                          f32 %63 = OpConstant 3,674022E-40 
					                                              %65 = OpTypePointer Private %14 
					                               Private f32_4* %66 = OpVariable Private 
					                                          f32 %68 = OpConstant 3,674022E-40 
					                                        f32_3 %69 = OpConstantComposite %68 %68 %68 
					                               Private f32_3* %76 = OpVariable Private 
					                                          i32 %79 = OpConstant 5 
					                                          i32 %80 = OpConstant 1 
					                                          i32 %85 = OpConstant 0 
					                                          i32 %96 = OpConstant 2 
					        UniformConstant read_only Texture2D* %108 = OpVariable UniformConstant 
					                    UniformConstant sampler* %110 = OpVariable UniformConstant 
					                                         u32 %116 = OpConstant 0 
					                                Private f32* %118 = OpVariable Private 
					                                         i32 %119 = OpConstant 3 
					                                         u32 %120 = OpConstant 3 
					                                             %121 = OpTypePointer Uniform %6 
					                                         f32 %125 = OpConstant 3,674022E-40 
					                                Private f32* %131 = OpVariable Private 
					                                         u32 %141 = OpConstant 1 
					                                             %148 = OpTypeVector %55 2 
					                                             %149 = OpTypePointer Private %148 
					                             Private bool_2* %150 = OpVariable Private 
					                                       f32_4 %153 = OpConstantComposite %59 %59 %59 %59 
					                                             %154 = OpTypeVector %55 4 
					                               Private bool* %157 = OpVariable Private 
					                                             %163 = OpTypePointer Private %19 
					                                Private i32* %164 = OpVariable Private 
					                             Private bool_2* %167 = OpVariable Private 
					                                       f32_4 %168 = OpConstantComposite %125 %125 %59 %59 
					                                Private i32* %179 = OpVariable Private 
					                               Private bool* %189 = OpVariable Private 
					                                         f32 %190 = OpConstant 3,674022E-40 
					                                Private f32* %193 = OpVariable Private 
					                                         f32 %203 = OpConstant 3,674022E-40 
					                                         u32 %207 = OpConstant 2 
					                                             %215 = OpTypePointer Private %10 
					                              Private f32_2* %216 = OpVariable Private 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                       f32_2 %219 = OpConstantComposite %68 %68 
					                                       f32_2 %221 = OpConstantComposite %62 %62 
					                                         i32 %224 = OpConstant 4 
					                              Private f32_2* %232 = OpVariable Private 
					                                         i32 %264 = OpConstant 10 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                         f32 %290 = OpConstant 3,674022E-40 
					                                       f32_2 %291 = OpConstantComposite %289 %290 
					                                         f32 %298 = OpConstant 3,674022E-40 
					                                         i32 %302 = OpConstant 7 
					                                             %303 = OpTypePointer Uniform %19 
					                              Private f32_2* %308 = OpVariable Private 
					                                         f32 %309 = OpConstant 3,674022E-40 
					                                Private f32* %311 = OpVariable Private 
					                                             %312 = OpTypePointer Function %19 
					                                Private f32* %323 = OpVariable Private 
					                                             %326 = OpTypePointer Input %6 
					                                         f32 %329 = OpConstant 3,674022E-40 
					                              Private f32_2* %334 = OpVariable Private 
					                                         f32 %337 = OpConstant 3,674022E-40 
					                                         f32 %346 = OpConstant 3,674022E-40 
					                              Private f32_3* %362 = OpVariable Private 
					                                       f32_2 %369 = OpConstantComposite %125 %337 
					                                         f32 %391 = OpConstant 3,674022E-40 
					                                Private f32* %394 = OpVariable Private 
					                              Private f32_2* %398 = OpVariable Private 
					                                         i32 %432 = OpConstant 9 
					                              Private f32_3* %436 = OpVariable Private 
					                               Private bool* %446 = OpVariable Private 
					                                             %450 = OpTypePointer Function %7 
					                                       f32_2 %500 = OpConstantComposite %125 %125 
					                                         f32 %511 = OpConstant 3,674022E-40 
					                                       f32_2 %512 = OpConstantComposite %511 %511 
					                                Private f32* %531 = OpVariable Private 
					                             Private bool_2* %547 = OpVariable Private 
					                                             %552 = OpTypeVector %19 3 
					                                             %553 = OpTypePointer Private %552 
					                              Private i32_3* %554 = OpVariable Private 
					                                         u32 %558 = OpConstant 4294967295 
					                             Private bool_2* %567 = OpVariable Private 
					                                             %583 = OpTypeVector %19 2 
					                                             %586 = OpTypeVector %15 2 
					                                       u32_2 %588 = OpConstantComposite %141 %141 
					                               Private bool* %603 = OpVariable Private 
					                                Private f32* %606 = OpVariable Private 
					                                         f32 %665 = OpConstant 3,674022E-40 
					                                         f32 %677 = OpConstant 3,674022E-40 
					                                         i32 %696 = OpConstant 8 
					                                         f32 %713 = OpConstant 3,674022E-40 
					                                             %716 = OpTypePointer Output %14 
					                               Output f32_4* %717 = OpVariable Output 
					                                             %721 = OpTypePointer Output %6 
					                                       f32_3 %725 = OpConstantComposite %511 %511 %511 
					                                Private i32* %731 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %313 = OpVariable Function 
					                             Function f32_3* %451 = OpVariable Function 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %25 = OpAccessChain %22 %23 
					                                        f32_4 %26 = OpLoad %25 
					                                        f32_2 %27 = OpVectorShuffle %26 %26 0 1 
					                                        f32_2 %28 = OpFMul %13 %27 
					                               Uniform f32_4* %29 = OpAccessChain %22 %23 
					                                        f32_4 %30 = OpLoad %29 
					                                        f32_2 %31 = OpVectorShuffle %30 %30 2 3 
					                                        f32_2 %32 = OpFAdd %28 %31 
					                                        f32_3 %33 = OpLoad %9 
					                                        f32_3 %34 = OpVectorShuffle %33 %32 3 4 2 
					                                                      OpStore %9 %34 
					                          read_only Texture2D %39 = OpLoad %38 
					                                      sampler %43 = OpLoad %42 
					                   read_only Texture2DSampled %45 = OpSampledImage %39 %43 
					                                        f32_3 %46 = OpLoad %9 
					                                        f32_2 %47 = OpVectorShuffle %46 %46 0 1 
					                                        f32_4 %48 = OpImageSampleImplicitLod %45 %47 
					                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
					                                                      OpStore %35 %49 
					                                        f32_3 %52 = OpLoad %35 
					                                        f32_3 %53 = OpLoad %35 
					                                          f32 %54 = OpDot %52 %53 
					                                                      OpStore %51 %54 
					                                          f32 %58 = OpLoad %51 
					                                         bool %60 = OpFOrdNotEqual %58 %59 
					                                                      OpStore %57 %60 
					                                         bool %61 = OpLoad %57 
					                                          f32 %64 = OpSelect %61 %62 %63 
					                                                      OpStore %51 %64 
					                                        f32_3 %67 = OpLoad %35 
					                                        f32_3 %70 = OpFMul %67 %69 
					                                          f32 %71 = OpLoad %51 
					                                        f32_3 %72 = OpCompositeConstruct %71 %71 %71 
					                                        f32_3 %73 = OpFAdd %70 %72 
					                                        f32_4 %74 = OpLoad %66 
					                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
					                                                      OpStore %66 %75 
					                                        f32_4 %77 = OpLoad %66 
					                                        f32_3 %78 = OpVectorShuffle %77 %77 1 1 1 
					                               Uniform f32_4* %81 = OpAccessChain %22 %79 %80 
					                                        f32_4 %82 = OpLoad %81 
					                                        f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
					                                        f32_3 %84 = OpFMul %78 %83 
					                                                      OpStore %76 %84 
					                               Uniform f32_4* %86 = OpAccessChain %22 %79 %85 
					                                        f32_4 %87 = OpLoad %86 
					                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
					                                        f32_4 %89 = OpLoad %66 
					                                        f32_3 %90 = OpVectorShuffle %89 %89 0 0 0 
					                                        f32_3 %91 = OpFMul %88 %90 
					                                        f32_3 %92 = OpLoad %76 
					                                        f32_3 %93 = OpFAdd %91 %92 
					                                        f32_4 %94 = OpLoad %66 
					                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 6 
					                                                      OpStore %66 %95 
					                               Uniform f32_4* %97 = OpAccessChain %22 %79 %96 
					                                        f32_4 %98 = OpLoad %97 
					                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
					                                       f32_4 %100 = OpLoad %66 
					                                       f32_3 %101 = OpVectorShuffle %100 %100 2 2 2 
					                                       f32_3 %102 = OpFMul %99 %101 
					                                       f32_4 %103 = OpLoad %66 
					                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 3 
					                                       f32_3 %105 = OpFAdd %102 %104 
					                                       f32_4 %106 = OpLoad %66 
					                                       f32_4 %107 = OpVectorShuffle %106 %105 4 5 6 3 
					                                                      OpStore %66 %107 
					                         read_only Texture2D %109 = OpLoad %108 
					                                     sampler %111 = OpLoad %110 
					                  read_only Texture2DSampled %112 = OpSampledImage %109 %111 
					                                       f32_3 %113 = OpLoad %9 
					                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
					                                       f32_4 %115 = OpImageSampleImplicitLod %112 %114 
					                                         f32 %117 = OpCompositeExtract %115 0 
					                                                      OpStore %51 %117 
					                                Uniform f32* %122 = OpAccessChain %22 %119 %120 
					                                         f32 %123 = OpLoad %122 
					                                         f32 %124 = OpFNegate %123 
					                                         f32 %126 = OpFAdd %124 %125 
					                                                      OpStore %118 %126 
					                                         f32 %127 = OpLoad %51 
					                                Uniform f32* %128 = OpAccessChain %22 %96 %116 
					                                         f32 %129 = OpLoad %128 
					                                         f32 %130 = OpFMul %127 %129 
					                                                      OpStore %51 %130 
					                                Uniform f32* %132 = OpAccessChain %22 %119 %120 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFNegate %133 
					                                         f32 %135 = OpLoad %51 
					                                         f32 %136 = OpFMul %134 %135 
					                                         f32 %137 = OpFAdd %136 %125 
					                                                      OpStore %131 %137 
					                                         f32 %138 = OpLoad %118 
					                                         f32 %139 = OpLoad %51 
					                                         f32 %140 = OpFMul %138 %139 
					                                Uniform f32* %142 = OpAccessChain %22 %96 %141 
					                                         f32 %143 = OpLoad %142 
					                                         f32 %144 = OpFAdd %140 %143 
					                                                      OpStore %51 %144 
					                                         f32 %145 = OpLoad %131 
					                                         f32 %146 = OpLoad %51 
					                                         f32 %147 = OpFDiv %145 %146 
					                                                      OpStore %51 %147 
					                                       f32_3 %151 = OpLoad %9 
					                                       f32_4 %152 = OpVectorShuffle %151 %151 0 1 0 0 
					                                      bool_4 %155 = OpFOrdLessThan %152 %153 
					                                      bool_2 %156 = OpVectorShuffle %155 %155 0 1 
					                                                      OpStore %150 %156 
					                               Private bool* %158 = OpAccessChain %150 %141 
					                                        bool %159 = OpLoad %158 
					                               Private bool* %160 = OpAccessChain %150 %116 
					                                        bool %161 = OpLoad %160 
					                                        bool %162 = OpLogicalOr %159 %161 
					                                                      OpStore %157 %162 
					                                        bool %165 = OpLoad %157 
					                                         i32 %166 = OpSelect %165 %80 %85 
					                                                      OpStore %164 %166 
					                                       f32_3 %169 = OpLoad %9 
					                                       f32_4 %170 = OpVectorShuffle %169 %169 0 1 0 0 
					                                      bool_4 %171 = OpFOrdLessThan %168 %170 
					                                      bool_2 %172 = OpVectorShuffle %171 %171 0 1 
					                                                      OpStore %167 %172 
					                               Private bool* %173 = OpAccessChain %167 %141 
					                                        bool %174 = OpLoad %173 
					                               Private bool* %175 = OpAccessChain %167 %116 
					                                        bool %176 = OpLoad %175 
					                                        bool %177 = OpLogicalOr %174 %176 
					                               Private bool* %178 = OpAccessChain %167 %116 
					                                                      OpStore %178 %177 
					                               Private bool* %180 = OpAccessChain %167 %116 
					                                        bool %181 = OpLoad %180 
					                                         i32 %182 = OpSelect %181 %80 %85 
					                                                      OpStore %179 %182 
					                                         i32 %183 = OpLoad %179 
					                                         i32 %184 = OpLoad %164 
					                                         i32 %185 = OpIAdd %183 %184 
					                                                      OpStore %179 %185 
					                                         i32 %186 = OpLoad %179 
					                                         f32 %187 = OpConvertSToF %186 
					                                Private f32* %188 = OpAccessChain %9 %116 
					                                                      OpStore %188 %187 
					                                         f32 %191 = OpLoad %51 
					                                        bool %192 = OpFOrdGreaterThanEqual %190 %191 
					                                                      OpStore %189 %192 
					                                        bool %194 = OpLoad %189 
					                                         f32 %195 = OpSelect %194 %125 %59 
					                                                      OpStore %193 %195 
					                                         f32 %196 = OpLoad %193 
					                                Private f32* %197 = OpAccessChain %9 %116 
					                                         f32 %198 = OpLoad %197 
					                                         f32 %199 = OpFAdd %196 %198 
					                                Private f32* %200 = OpAccessChain %9 %116 
					                                                      OpStore %200 %199 
					                                Private f32* %201 = OpAccessChain %9 %116 
					                                         f32 %202 = OpLoad %201 
					                                         f32 %204 = OpFMul %202 %203 
					                                Private f32* %205 = OpAccessChain %9 %116 
					                                                      OpStore %205 %204 
					                                         f32 %206 = OpLoad %51 
					                                Uniform f32* %208 = OpAccessChain %22 %85 %207 
					                                         f32 %209 = OpLoad %208 
					                                         f32 %210 = OpFMul %206 %209 
					                                Private f32* %211 = OpAccessChain %9 %116 
					                                         f32 %212 = OpLoad %211 
					                                         f32 %213 = OpFAdd %210 %212 
					                                Private f32* %214 = OpAccessChain %9 %207 
					                                                      OpStore %214 %213 
					                                       f32_2 %218 = OpLoad vs_TEXCOORD1 
					                                       f32_2 %220 = OpFMul %218 %219 
					                                       f32_2 %222 = OpFAdd %220 %221 
					                                                      OpStore %216 %222 
					                                       f32_2 %223 = OpLoad %216 
					                              Uniform f32_4* %225 = OpAccessChain %22 %224 %96 
					                                       f32_4 %226 = OpLoad %225 
					                                       f32_2 %227 = OpVectorShuffle %226 %226 0 1 
					                                       f32_2 %228 = OpFNegate %227 
					                                       f32_2 %229 = OpFAdd %223 %228 
					                                       f32_3 %230 = OpLoad %76 
					                                       f32_3 %231 = OpVectorShuffle %230 %229 3 4 2 
					                                                      OpStore %76 %231 
					                                Uniform f32* %233 = OpAccessChain %22 %224 %85 %116 
					                                         f32 %234 = OpLoad %233 
					                                Private f32* %235 = OpAccessChain %232 %116 
					                                                      OpStore %235 %234 
					                                Uniform f32* %236 = OpAccessChain %22 %224 %80 %141 
					                                         f32 %237 = OpLoad %236 
					                                Private f32* %238 = OpAccessChain %232 %141 
					                                                      OpStore %238 %237 
					                                       f32_3 %239 = OpLoad %76 
					                                       f32_2 %240 = OpVectorShuffle %239 %239 0 1 
					                                       f32_2 %241 = OpLoad %232 
					                                       f32_2 %242 = OpFDiv %240 %241 
					                                       f32_3 %243 = OpLoad %76 
					                                       f32_3 %244 = OpVectorShuffle %243 %242 3 4 2 
					                                                      OpStore %76 %244 
					                                Private f32* %245 = OpAccessChain %9 %207 
					                                         f32 %246 = OpLoad %245 
					                                         f32 %247 = OpFNegate %246 
					                                         f32 %248 = OpFAdd %247 %125 
					                                                      OpStore %131 %248 
					                                Uniform f32* %249 = OpAccessChain %22 %119 %120 
					                                         f32 %250 = OpLoad %249 
					                                         f32 %251 = OpLoad %131 
					                                         f32 %252 = OpFMul %250 %251 
					                                Private f32* %253 = OpAccessChain %9 %207 
					                                         f32 %254 = OpLoad %253 
					                                         f32 %255 = OpFAdd %252 %254 
					                                                      OpStore %131 %255 
					                                         f32 %256 = OpLoad %131 
					                                       f32_2 %257 = OpCompositeConstruct %256 %256 
					                                       f32_3 %258 = OpLoad %76 
					                                       f32_2 %259 = OpVectorShuffle %258 %258 0 1 
					                                       f32_2 %260 = OpFMul %257 %259 
					                                       f32_3 %261 = OpLoad %9 
					                                       f32_3 %262 = OpVectorShuffle %261 %260 3 4 2 
					                                                      OpStore %9 %262 
					                                       f32_2 %263 = OpLoad vs_TEXCOORD0 
					                                Uniform f32* %265 = OpAccessChain %22 %264 
					                                         f32 %266 = OpLoad %265 
					                                Uniform f32* %267 = OpAccessChain %22 %264 
					                                         f32 %268 = OpLoad %267 
					                                       f32_2 %269 = OpCompositeConstruct %266 %268 
					                                         f32 %270 = OpCompositeExtract %269 0 
					                                         f32 %271 = OpCompositeExtract %269 1 
					                                       f32_2 %272 = OpCompositeConstruct %270 %271 
					                                       f32_2 %273 = OpFMul %263 %272 
					                                       f32_3 %274 = OpLoad %76 
					                                       f32_3 %275 = OpVectorShuffle %274 %273 3 4 2 
					                                                      OpStore %76 %275 
					                                       f32_3 %276 = OpLoad %76 
					                                       f32_2 %277 = OpVectorShuffle %276 %276 0 1 
					                              Uniform f32_4* %278 = OpAccessChain %22 %80 
					                                       f32_4 %279 = OpLoad %278 
					                                       f32_2 %280 = OpVectorShuffle %279 %279 0 1 
					                                       f32_2 %281 = OpFMul %277 %280 
					                                       f32_3 %282 = OpLoad %76 
					                                       f32_3 %283 = OpVectorShuffle %282 %281 3 4 2 
					                                                      OpStore %76 %283 
					                                       f32_3 %284 = OpLoad %76 
					                                       f32_2 %285 = OpVectorShuffle %284 %284 0 1 
					                                       f32_2 %286 = OpExtInst %1 8 %285 
					                                       f32_3 %287 = OpLoad %76 
					                                       f32_3 %288 = OpVectorShuffle %287 %286 3 4 2 
					                                                      OpStore %76 %288 
					                                       f32_3 %292 = OpLoad %76 
					                                       f32_2 %293 = OpVectorShuffle %292 %292 0 1 
					                                         f32 %294 = OpDot %291 %293 
					                                                      OpStore %131 %294 
					                                         f32 %295 = OpLoad %131 
					                                         f32 %296 = OpExtInst %1 10 %295 
					                                                      OpStore %131 %296 
					                                         f32 %297 = OpLoad %131 
					                                         f32 %299 = OpFMul %297 %298 
					                                                      OpStore %131 %299 
					                                         f32 %300 = OpLoad %131 
					                                         f32 %301 = OpExtInst %1 10 %300 
					                                                      OpStore %131 %301 
					                                Uniform i32* %304 = OpAccessChain %22 %302 
					                                         i32 %305 = OpLoad %304 
					                                         f32 %306 = OpConvertSToF %305 
					                                Private f32* %307 = OpAccessChain %76 %116 
					                                                      OpStore %307 %306 
					                                Private f32* %310 = OpAccessChain %308 %116 
					                                                      OpStore %310 %309 
					                                                      OpStore %311 %59 
					                                                      OpStore %313 %85 
					                                                      OpBranch %314 
					                                             %314 = OpLabel 
					                                                      OpLoopMerge %316 %317 None 
					                                                      OpBranch %318 
					                                             %318 = OpLabel 
					                                         i32 %319 = OpLoad %313 
					                                Uniform i32* %320 = OpAccessChain %22 %302 
					                                         i32 %321 = OpLoad %320 
					                                        bool %322 = OpSLessThan %319 %321 
					                                                      OpBranchConditional %322 %315 %316 
					                                             %315 = OpLabel 
					                                         i32 %324 = OpLoad %313 
					                                         f32 %325 = OpConvertSToF %324 
					                                                      OpStore %323 %325 
					                                  Input f32* %327 = OpAccessChain vs_TEXCOORD0 %116 
					                                         f32 %328 = OpLoad %327 
					                                         f32 %330 = OpFMul %328 %329 
					                                         f32 %331 = OpLoad %323 
					                                         f32 %332 = OpFAdd %330 %331 
					                                Private f32* %333 = OpAccessChain %308 %141 
					                                                      OpStore %333 %332 
					                                Private f32* %335 = OpAccessChain %308 %141 
					                                         f32 %336 = OpLoad %335 
					                                         f32 %338 = OpFMul %336 %337 
					                                Private f32* %339 = OpAccessChain %334 %116 
					                                                      OpStore %339 %338 
					                                Private f32* %340 = OpAccessChain %334 %116 
					                                         f32 %341 = OpLoad %340 
					                                         f32 %342 = OpExtInst %1 13 %341 
					                                Private f32* %343 = OpAccessChain %334 %116 
					                                                      OpStore %343 %342 
					                                Private f32* %344 = OpAccessChain %334 %116 
					                                         f32 %345 = OpLoad %344 
					                                         f32 %347 = OpFMul %345 %346 
					                                Private f32* %348 = OpAccessChain %334 %116 
					                                                      OpStore %348 %347 
					                                Private f32* %349 = OpAccessChain %334 %116 
					                                         f32 %350 = OpLoad %349 
					                                         f32 %351 = OpExtInst %1 10 %350 
					                                Private f32* %352 = OpAccessChain %334 %116 
					                                                      OpStore %352 %351 
					                                         f32 %353 = OpLoad %131 
					                                Private f32* %354 = OpAccessChain %334 %116 
					                                         f32 %355 = OpLoad %354 
					                                         f32 %356 = OpFAdd %353 %355 
					                                Private f32* %357 = OpAccessChain %334 %116 
					                                                      OpStore %357 %356 
					                                Private f32* %358 = OpAccessChain %334 %116 
					                                         f32 %359 = OpLoad %358 
					                                         f32 %360 = OpExtInst %1 10 %359 
					                                Private f32* %361 = OpAccessChain %334 %116 
					                                                      OpStore %361 %360 
					                                Private f32* %363 = OpAccessChain %334 %116 
					                                         f32 %364 = OpLoad %363 
					                                         f32 %365 = OpFMul %364 %68 
					                                         f32 %366 = OpFAdd %365 %62 
					                                Private f32* %367 = OpAccessChain %362 %207 
					                                                      OpStore %367 %366 
					                                       f32_2 %368 = OpLoad %308 
					                                         f32 %370 = OpDot %368 %369 
					                                Private f32* %371 = OpAccessChain %334 %116 
					                                                      OpStore %371 %370 
					                                Private f32* %372 = OpAccessChain %334 %116 
					                                         f32 %373 = OpLoad %372 
					                                         f32 %374 = OpExtInst %1 13 %373 
					                                Private f32* %375 = OpAccessChain %334 %116 
					                                                      OpStore %375 %374 
					                                Private f32* %376 = OpAccessChain %334 %116 
					                                         f32 %377 = OpLoad %376 
					                                         f32 %378 = OpFMul %377 %346 
					                                Private f32* %379 = OpAccessChain %334 %116 
					                                                      OpStore %379 %378 
					                                Private f32* %380 = OpAccessChain %334 %116 
					                                         f32 %381 = OpLoad %380 
					                                         f32 %382 = OpExtInst %1 10 %381 
					                                Private f32* %383 = OpAccessChain %334 %116 
					                                                      OpStore %383 %382 
					                                         f32 %384 = OpLoad %131 
					                                Private f32* %385 = OpAccessChain %334 %116 
					                                         f32 %386 = OpLoad %385 
					                                         f32 %387 = OpFAdd %384 %386 
					                                Private f32* %388 = OpAccessChain %334 %116 
					                                                      OpStore %388 %387 
					                                Private f32* %389 = OpAccessChain %334 %116 
					                                         f32 %390 = OpLoad %389 
					                                         f32 %392 = OpFMul %390 %391 
					                                Private f32* %393 = OpAccessChain %334 %116 
					                                                      OpStore %393 %392 
					                                Private f32* %395 = OpAccessChain %334 %116 
					                                         f32 %396 = OpLoad %395 
					                                         f32 %397 = OpExtInst %1 13 %396 
					                                                      OpStore %394 %397 
					                                Private f32* %399 = OpAccessChain %334 %116 
					                                         f32 %400 = OpLoad %399 
					                                         f32 %401 = OpExtInst %1 14 %400 
					                                Private f32* %402 = OpAccessChain %398 %116 
					                                                      OpStore %402 %401 
					                                Private f32* %403 = OpAccessChain %362 %207 
					                                         f32 %404 = OpLoad %403 
					                                         f32 %405 = OpFNegate %404 
					                                Private f32* %406 = OpAccessChain %362 %207 
					                                         f32 %407 = OpLoad %406 
					                                         f32 %408 = OpFMul %405 %407 
					                                         f32 %409 = OpFAdd %408 %125 
					                                Private f32* %410 = OpAccessChain %334 %116 
					                                                      OpStore %410 %409 
					                                Private f32* %411 = OpAccessChain %334 %116 
					                                         f32 %412 = OpLoad %411 
					                                         f32 %413 = OpExtInst %1 31 %412 
					                                Private f32* %414 = OpAccessChain %334 %116 
					                                                      OpStore %414 %413 
					                                         f32 %415 = OpLoad %394 
					                                Private f32* %416 = OpAccessChain %398 %141 
					                                                      OpStore %416 %415 
					                                       f32_2 %417 = OpLoad %334 
					                                       f32_2 %418 = OpVectorShuffle %417 %417 0 0 
					                                       f32_2 %419 = OpLoad %398 
					                                       f32_2 %420 = OpFMul %418 %419 
					                                       f32_3 %421 = OpLoad %362 
					                                       f32_3 %422 = OpVectorShuffle %421 %420 3 4 2 
					                                                      OpStore %362 %422 
					                                         f32 %423 = OpLoad %323 
					                                         f32 %424 = OpFAdd %423 %125 
					                                                      OpStore %323 %424 
					                                         f32 %425 = OpLoad %323 
					                                Private f32* %426 = OpAccessChain %76 %116 
					                                         f32 %427 = OpLoad %426 
					                                         f32 %428 = OpFDiv %425 %427 
					                                                      OpStore %323 %428 
					                                         f32 %429 = OpLoad %323 
					                                         f32 %430 = OpExtInst %1 31 %429 
					                                                      OpStore %323 %430 
					                                         f32 %431 = OpLoad %323 
					                                Uniform f32* %433 = OpAccessChain %22 %432 
					                                         f32 %434 = OpLoad %433 
					                                         f32 %435 = OpFMul %431 %434 
					                                                      OpStore %323 %435 
					                                         f32 %437 = OpLoad %323 
					                                       f32_3 %438 = OpCompositeConstruct %437 %437 %437 
					                                       f32_3 %439 = OpLoad %362 
					                                       f32_3 %440 = OpFMul %438 %439 
					                                                      OpStore %436 %440 
					                                       f32_4 %441 = OpLoad %66 
					                                       f32_3 %442 = OpVectorShuffle %441 %441 0 1 2 
					                                       f32_3 %443 = OpFNegate %442 
					                                       f32_3 %444 = OpLoad %436 
					                                         f32 %445 = OpDot %443 %444 
					                                                      OpStore %323 %445 
					                                         f32 %447 = OpLoad %323 
					                                        bool %448 = OpFOrdGreaterThanEqual %447 %59 
					                                                      OpStore %446 %448 
					                                        bool %449 = OpLoad %446 
					                                                      OpSelectionMerge %453 None 
					                                                      OpBranchConditional %449 %452 %456 
					                                             %452 = OpLabel 
					                                       f32_3 %454 = OpLoad %436 
					                                       f32_3 %455 = OpFNegate %454 
					                                                      OpStore %451 %455 
					                                                      OpBranch %453 
					                                             %456 = OpLabel 
					                                       f32_3 %457 = OpLoad %436 
					                                                      OpStore %451 %457 
					                                                      OpBranch %453 
					                                             %453 = OpLabel 
					                                       f32_3 %458 = OpLoad %451 
					                                                      OpStore %436 %458 
					                                       f32_3 %459 = OpLoad %9 
					                                       f32_3 %460 = OpLoad %436 
					                                       f32_3 %461 = OpFAdd %459 %460 
					                                                      OpStore %436 %461 
					                                       f32_3 %462 = OpLoad %436 
					                                       f32_2 %463 = OpVectorShuffle %462 %462 1 1 
					                              Uniform f32_4* %464 = OpAccessChain %22 %224 %80 
					                                       f32_4 %465 = OpLoad %464 
					                                       f32_2 %466 = OpVectorShuffle %465 %465 0 1 
					                                       f32_2 %467 = OpFMul %463 %466 
					                                                      OpStore %334 %467 
					                              Uniform f32_4* %468 = OpAccessChain %22 %224 %85 
					                                       f32_4 %469 = OpLoad %468 
					                                       f32_2 %470 = OpVectorShuffle %469 %469 0 1 
					                                       f32_3 %471 = OpLoad %436 
					                                       f32_2 %472 = OpVectorShuffle %471 %471 0 0 
					                                       f32_2 %473 = OpFMul %470 %472 
					                                       f32_2 %474 = OpLoad %334 
					                                       f32_2 %475 = OpFAdd %473 %474 
					                                                      OpStore %334 %475 
					                              Uniform f32_4* %476 = OpAccessChain %22 %224 %96 
					                                       f32_4 %477 = OpLoad %476 
					                                       f32_2 %478 = OpVectorShuffle %477 %477 0 1 
					                                       f32_3 %479 = OpLoad %436 
					                                       f32_2 %480 = OpVectorShuffle %479 %479 2 2 
					                                       f32_2 %481 = OpFMul %478 %480 
					                                       f32_2 %482 = OpLoad %334 
					                                       f32_2 %483 = OpFAdd %481 %482 
					                                                      OpStore %334 %483 
					                                Private f32* %484 = OpAccessChain %436 %207 
					                                         f32 %485 = OpLoad %484 
					                                         f32 %486 = OpFNegate %485 
					                                         f32 %487 = OpFAdd %486 %125 
					                                                      OpStore %323 %487 
					                                Uniform f32* %488 = OpAccessChain %22 %119 %120 
					                                         f32 %489 = OpLoad %488 
					                                         f32 %490 = OpLoad %323 
					                                         f32 %491 = OpFMul %489 %490 
					                                Private f32* %492 = OpAccessChain %436 %207 
					                                         f32 %493 = OpLoad %492 
					                                         f32 %494 = OpFAdd %491 %493 
					                                                      OpStore %323 %494 
					                                       f32_2 %495 = OpLoad %334 
					                                         f32 %496 = OpLoad %323 
					                                       f32_2 %497 = OpCompositeConstruct %496 %496 
					                                       f32_2 %498 = OpFDiv %495 %497 
					                                                      OpStore %334 %498 
					                                       f32_2 %499 = OpLoad %334 
					                                       f32_2 %501 = OpFAdd %499 %500 
					                                                      OpStore %334 %501 
					                                       f32_2 %502 = OpLoad %334 
					                              Uniform f32_4* %503 = OpAccessChain %22 %23 
					                                       f32_4 %504 = OpLoad %503 
					                                       f32_2 %505 = OpVectorShuffle %504 %504 0 1 
					                                       f32_2 %506 = OpFMul %502 %505 
					                                       f32_3 %507 = OpLoad %436 
					                                       f32_3 %508 = OpVectorShuffle %507 %506 3 4 2 
					                                                      OpStore %436 %508 
					                                       f32_3 %509 = OpLoad %436 
					                                       f32_2 %510 = OpVectorShuffle %509 %509 0 1 
					                                       f32_2 %513 = OpFMul %510 %512 
					                              Uniform f32_4* %514 = OpAccessChain %22 %23 
					                                       f32_4 %515 = OpLoad %514 
					                                       f32_2 %516 = OpVectorShuffle %515 %515 2 3 
					                                       f32_2 %517 = OpFAdd %513 %516 
					                                       f32_3 %518 = OpLoad %436 
					                                       f32_3 %519 = OpVectorShuffle %518 %517 3 4 2 
					                                                      OpStore %436 %519 
					                         read_only Texture2D %520 = OpLoad %108 
					                                     sampler %521 = OpLoad %110 
					                  read_only Texture2DSampled %522 = OpSampledImage %520 %521 
					                                       f32_3 %523 = OpLoad %436 
					                                       f32_2 %524 = OpVectorShuffle %523 %523 0 1 
					                                       f32_4 %525 = OpImageSampleImplicitLod %522 %524 
					                                         f32 %526 = OpCompositeExtract %525 0 
					                                                      OpStore %323 %526 
					                                         f32 %527 = OpLoad %323 
					                                Uniform f32* %528 = OpAccessChain %22 %96 %116 
					                                         f32 %529 = OpLoad %528 
					                                         f32 %530 = OpFMul %527 %529 
					                                                      OpStore %323 %530 
					                                Uniform f32* %532 = OpAccessChain %22 %119 %120 
					                                         f32 %533 = OpLoad %532 
					                                         f32 %534 = OpFNegate %533 
					                                         f32 %535 = OpLoad %323 
					                                         f32 %536 = OpFMul %534 %535 
					                                         f32 %537 = OpFAdd %536 %125 
					                                                      OpStore %531 %537 
					                                         f32 %538 = OpLoad %118 
					                                         f32 %539 = OpLoad %323 
					                                         f32 %540 = OpFMul %538 %539 
					                                Uniform f32* %541 = OpAccessChain %22 %96 %141 
					                                         f32 %542 = OpLoad %541 
					                                         f32 %543 = OpFAdd %540 %542 
					                                                      OpStore %323 %543 
					                                         f32 %544 = OpLoad %531 
					                                         f32 %545 = OpLoad %323 
					                                         f32 %546 = OpFDiv %544 %545 
					                                                      OpStore %323 %546 
					                                       f32_3 %548 = OpLoad %436 
					                                       f32_4 %549 = OpVectorShuffle %548 %548 0 1 0 0 
					                                      bool_4 %550 = OpFOrdLessThan %549 %153 
					                                      bool_2 %551 = OpVectorShuffle %550 %550 0 1 
					                                                      OpStore %547 %551 
					                               Private bool* %555 = OpAccessChain %547 %141 
					                                        bool %556 = OpLoad %555 
					                                         u32 %557 = OpSelect %556 %141 %116 
					                                         u32 %559 = OpIMul %557 %558 
					                               Private bool* %560 = OpAccessChain %547 %116 
					                                        bool %561 = OpLoad %560 
					                                         u32 %562 = OpSelect %561 %141 %116 
					                                         u32 %563 = OpIMul %562 %558 
					                                         u32 %564 = OpBitwiseOr %559 %563 
					                                         i32 %565 = OpBitcast %564 
					                                Private i32* %566 = OpAccessChain %554 %207 
					                                                      OpStore %566 %565 
					                                       f32_3 %568 = OpLoad %436 
					                                       f32_4 %569 = OpVectorShuffle %568 %568 0 1 0 0 
					                                      bool_4 %570 = OpFOrdLessThan %168 %569 
					                                      bool_2 %571 = OpVectorShuffle %570 %570 0 1 
					                                                      OpStore %567 %571 
					                               Private bool* %572 = OpAccessChain %567 %141 
					                                        bool %573 = OpLoad %572 
					                                         u32 %574 = OpSelect %573 %141 %116 
					                                         u32 %575 = OpIMul %574 %558 
					                               Private bool* %576 = OpAccessChain %567 %116 
					                                        bool %577 = OpLoad %576 
					                                         u32 %578 = OpSelect %577 %141 %116 
					                                         u32 %579 = OpIMul %578 %558 
					                                         u32 %580 = OpBitwiseOr %575 %579 
					                                         i32 %581 = OpBitcast %580 
					                                Private i32* %582 = OpAccessChain %554 %116 
					                                                      OpStore %582 %581 
					                                       i32_3 %584 = OpLoad %554 
					                                       i32_2 %585 = OpVectorShuffle %584 %584 0 2 
					                                       u32_2 %587 = OpBitcast %585 
					                                       u32_2 %589 = OpBitwiseAnd %587 %588 
					                                       i32_2 %590 = OpBitcast %589 
					                                       i32_3 %591 = OpLoad %554 
					                                       i32_3 %592 = OpVectorShuffle %591 %590 3 1 4 
					                                                      OpStore %554 %592 
					                                Private i32* %593 = OpAccessChain %554 %116 
					                                         i32 %594 = OpLoad %593 
					                                Private i32* %595 = OpAccessChain %554 %207 
					                                         i32 %596 = OpLoad %595 
					                                         i32 %597 = OpIAdd %594 %596 
					                                Private i32* %598 = OpAccessChain %554 %116 
					                                                      OpStore %598 %597 
					                                Private i32* %599 = OpAccessChain %554 %116 
					                                         i32 %600 = OpLoad %599 
					                                         f32 %601 = OpConvertSToF %600 
					                                Private f32* %602 = OpAccessChain %436 %116 
					                                                      OpStore %602 %601 
					                                         f32 %604 = OpLoad %323 
					                                        bool %605 = OpFOrdGreaterThanEqual %190 %604 
					                                                      OpStore %603 %605 
					                                        bool %607 = OpLoad %603 
					                                         f32 %608 = OpSelect %607 %125 %59 
					                                                      OpStore %606 %608 
					                                         f32 %609 = OpLoad %606 
					                                Private f32* %610 = OpAccessChain %436 %116 
					                                         f32 %611 = OpLoad %610 
					                                         f32 %612 = OpFAdd %609 %611 
					                                Private f32* %613 = OpAccessChain %436 %116 
					                                                      OpStore %613 %612 
					                                Private f32* %614 = OpAccessChain %436 %116 
					                                         f32 %615 = OpLoad %614 
					                                         f32 %616 = OpFMul %615 %203 
					                                Private f32* %617 = OpAccessChain %436 %116 
					                                                      OpStore %617 %616 
					                                         f32 %618 = OpLoad %323 
					                                Uniform f32* %619 = OpAccessChain %22 %85 %207 
					                                         f32 %620 = OpLoad %619 
					                                         f32 %621 = OpFMul %618 %620 
					                                Private f32* %622 = OpAccessChain %436 %116 
					                                         f32 %623 = OpLoad %622 
					                                         f32 %624 = OpFAdd %621 %623 
					                                Private f32* %625 = OpAccessChain %362 %207 
					                                                      OpStore %625 %624 
					                                       f32_2 %626 = OpLoad %334 
					                              Uniform f32_4* %627 = OpAccessChain %22 %224 %96 
					                                       f32_4 %628 = OpLoad %627 
					                                       f32_2 %629 = OpVectorShuffle %628 %628 0 1 
					                                       f32_2 %630 = OpFNegate %629 
					                                       f32_2 %631 = OpFAdd %626 %630 
					                                                      OpStore %334 %631 
					                                       f32_2 %632 = OpLoad %334 
					                                       f32_2 %633 = OpFAdd %632 %221 
					                                                      OpStore %334 %633 
					                                       f32_2 %634 = OpLoad %334 
					                                       f32_2 %635 = OpLoad %232 
					                                       f32_2 %636 = OpFDiv %634 %635 
					                                                      OpStore %334 %636 
					                                Private f32* %637 = OpAccessChain %362 %207 
					                                         f32 %638 = OpLoad %637 
					                                         f32 %639 = OpFNegate %638 
					                                         f32 %640 = OpFAdd %639 %125 
					                                                      OpStore %323 %640 
					                                Uniform f32* %641 = OpAccessChain %22 %119 %120 
					                                         f32 %642 = OpLoad %641 
					                                         f32 %643 = OpLoad %323 
					                                         f32 %644 = OpFMul %642 %643 
					                                Private f32* %645 = OpAccessChain %362 %207 
					                                         f32 %646 = OpLoad %645 
					                                         f32 %647 = OpFAdd %644 %646 
					                                                      OpStore %323 %647 
					                                         f32 %648 = OpLoad %323 
					                                       f32_2 %649 = OpCompositeConstruct %648 %648 
					                                       f32_2 %650 = OpLoad %334 
					                                       f32_2 %651 = OpFMul %649 %650 
					                                       f32_3 %652 = OpLoad %362 
					                                       f32_3 %653 = OpVectorShuffle %652 %651 3 4 2 
					                                                      OpStore %362 %653 
					                                       f32_3 %654 = OpLoad %9 
					                                       f32_3 %655 = OpFNegate %654 
					                                       f32_3 %656 = OpLoad %362 
					                                       f32_3 %657 = OpFAdd %655 %656 
					                                                      OpStore %436 %657 
					                                       f32_3 %658 = OpLoad %436 
					                                       f32_4 %659 = OpLoad %66 
					                                       f32_3 %660 = OpVectorShuffle %659 %659 0 1 2 
					                                         f32 %661 = OpDot %658 %660 
					                                                      OpStore %323 %661 
					                                Private f32* %662 = OpAccessChain %9 %207 
					                                         f32 %663 = OpLoad %662 
					                                         f32 %664 = OpFNegate %663 
					                                         f32 %666 = OpFMul %664 %665 
					                                         f32 %667 = OpLoad %323 
					                                         f32 %668 = OpFAdd %666 %667 
					                                                      OpStore %323 %668 
					                                         f32 %669 = OpLoad %323 
					                                         f32 %670 = OpExtInst %1 40 %669 %59 
					                                                      OpStore %323 %670 
					                                       f32_3 %671 = OpLoad %436 
					                                       f32_3 %672 = OpLoad %436 
					                                         f32 %673 = OpDot %671 %672 
					                                Private f32* %674 = OpAccessChain %334 %116 
					                                                      OpStore %674 %673 
					                                Private f32* %675 = OpAccessChain %334 %116 
					                                         f32 %676 = OpLoad %675 
					                                         f32 %678 = OpFAdd %676 %677 
					                                Private f32* %679 = OpAccessChain %334 %116 
					                                                      OpStore %679 %678 
					                                         f32 %680 = OpLoad %323 
					                                Private f32* %681 = OpAccessChain %334 %116 
					                                         f32 %682 = OpLoad %681 
					                                         f32 %683 = OpFDiv %680 %682 
					                                                      OpStore %323 %683 
					                                         f32 %684 = OpLoad %323 
					                                         f32 %685 = OpLoad %311 
					                                         f32 %686 = OpFAdd %684 %685 
					                                                      OpStore %311 %686 
					                                                      OpBranch %317 
					                                             %317 = OpLabel 
					                                         i32 %687 = OpLoad %313 
					                                         i32 %688 = OpIAdd %687 %80 
					                                                      OpStore %313 %688 
					                                                      OpBranch %314 
					                                             %316 = OpLabel 
					                                         f32 %689 = OpLoad %311 
					                                Uniform f32* %690 = OpAccessChain %22 %432 
					                                         f32 %691 = OpLoad %690 
					                                         f32 %692 = OpFMul %689 %691 
					                                Private f32* %693 = OpAccessChain %9 %116 
					                                                      OpStore %693 %692 
					                                Private f32* %694 = OpAccessChain %9 %116 
					                                         f32 %695 = OpLoad %694 
					                                Uniform f32* %697 = OpAccessChain %22 %696 
					                                         f32 %698 = OpLoad %697 
					                                         f32 %699 = OpFMul %695 %698 
					                                Private f32* %700 = OpAccessChain %9 %116 
					                                                      OpStore %700 %699 
					                                Private f32* %701 = OpAccessChain %9 %116 
					                                         f32 %702 = OpLoad %701 
					                                Private f32* %703 = OpAccessChain %76 %116 
					                                         f32 %704 = OpLoad %703 
					                                         f32 %705 = OpFDiv %702 %704 
					                                Private f32* %706 = OpAccessChain %9 %116 
					                                                      OpStore %706 %705 
					                                Private f32* %707 = OpAccessChain %9 %116 
					                                         f32 %708 = OpLoad %707 
					                                         f32 %709 = OpExtInst %1 30 %708 
					                                Private f32* %710 = OpAccessChain %9 %116 
					                                                      OpStore %710 %709 
					                                Private f32* %711 = OpAccessChain %9 %116 
					                                         f32 %712 = OpLoad %711 
					                                         f32 %714 = OpFMul %712 %713 
					                                Private f32* %715 = OpAccessChain %9 %116 
					                                                      OpStore %715 %714 
					                                Private f32* %718 = OpAccessChain %9 %116 
					                                         f32 %719 = OpLoad %718 
					                                         f32 %720 = OpExtInst %1 29 %719 
					                                 Output f32* %722 = OpAccessChain %717 %116 
					                                                      OpStore %722 %720 
					                                       f32_4 %723 = OpLoad %66 
					                                       f32_3 %724 = OpVectorShuffle %723 %723 0 1 2 
					                                       f32_3 %726 = OpFMul %724 %725 
					                                       f32_3 %727 = OpFAdd %726 %725 
					                                       f32_4 %728 = OpLoad %717 
					                                       f32_4 %729 = OpVectorShuffle %728 %727 0 4 5 6 
					                                                      OpStore %717 %729 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "FOG_OFF" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _CameraDepthTexture_ST;
						int _SampleCount;
						vec4 unused_0_3;
						float _Intensity;
						float _Radius;
						float _Downsample;
						vec4 unused_0_7;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 _ScreenParams;
						vec4 _ZBufferParams;
						vec4 unity_OrthoParams;
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[6];
						mat4x4 unity_CameraProjection;
						vec4 unused_2_2[4];
						mat4x4 unity_WorldToCamera;
						vec4 unused_2_4[4];
					};
					uniform  sampler2D _CameraGBufferTexture2;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					int u_xlati0;
					bvec2 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					bvec2 u_xlatb2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					bvec2 u_xlatb5;
					float u_xlat6;
					vec2 u_xlat7;
					float u_xlat8;
					bool u_xlatb8;
					vec3 u_xlat12;
					ivec3 u_xlati12;
					bvec2 u_xlatb12;
					float u_xlat16;
					bool u_xlatb16;
					vec2 u_xlat19;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat24;
					float u_xlat25;
					int u_xlati25;
					bool u_xlatb25;
					float u_xlat26;
					bool u_xlatb26;
					float u_xlat28;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat10_1 = texture(_CameraGBufferTexture2, u_xlat0.xy);
					    u_xlat16 = dot(u_xlat10_1.xyz, u_xlat10_1.xyz);
					    u_xlatb16 = u_xlat16!=0.0;
					    u_xlat16 = (u_xlatb16) ? -1.0 : -0.0;
					    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat16);
					    u_xlat2.xyz = u_xlat1.yyy * unity_WorldToCamera[1].xyz;
					    u_xlat1.xyw = unity_WorldToCamera[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = unity_WorldToCamera[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat10_2 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat16 = (-unity_OrthoParams.w) + 1.0;
					    u_xlat24 = u_xlat10_2.x * _ZBufferParams.x;
					    u_xlat25 = (-unity_OrthoParams.w) * u_xlat24 + 1.0;
					    u_xlat24 = u_xlat16 * u_xlat24 + _ZBufferParams.y;
					    u_xlat24 = u_xlat25 / u_xlat24;
					    u_xlatb2.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlatb25 = u_xlatb2.y || u_xlatb2.x;
					    u_xlati25 = u_xlatb25 ? 1 : int(0);
					    u_xlatb0.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
					    u_xlatb0.x = u_xlatb0.y || u_xlatb0.x;
					    u_xlati0 = u_xlatb0.x ? 1 : int(0);
					    u_xlati0 = u_xlati0 + u_xlati25;
					    u_xlat0.x = float(u_xlati0);
					    u_xlatb8 = 9.99999975e-06>=u_xlat24;
					    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat8 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 100000000.0;
					    u_xlat2.z = u_xlat24 * _ProjectionParams.z + u_xlat0.x;
					    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy + (-unity_CameraProjection[2].xy);
					    u_xlat3.x = unity_CameraProjection[0].x;
					    u_xlat3.y = unity_CameraProjection[1].y;
					    u_xlat0.xy = u_xlat0.xy / u_xlat3.xy;
					    u_xlat24 = (-u_xlat2.z) + 1.0;
					    u_xlat24 = unity_OrthoParams.w * u_xlat24 + u_xlat2.z;
					    u_xlat2.xy = vec2(u_xlat24) * u_xlat0.xy;
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(vec2(_Downsample, _Downsample));
					    u_xlat0.xy = u_xlat0.xy * _ScreenParams.xy;
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat0.x = dot(vec2(0.0671105608, 0.00583714992), u_xlat0.xy);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 52.9829178;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat8 = float(_SampleCount);
					    u_xlat4.x = 12.9898005;
					    u_xlat24 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
					    {
					        u_xlat26 = float(u_xlati_loop_1);
					        u_xlat26 = u_xlat26 * 1.00010002;
					        u_xlat26 = floor(u_xlat26);
					        u_xlat4.y = vs_TEXCOORD0.x * 1.00000001e-10 + u_xlat26;
					        u_xlat19.x = u_xlat4.y * 78.2330017;
					        u_xlat19.x = sin(u_xlat19.x);
					        u_xlat19.x = u_xlat19.x * 43758.5469;
					        u_xlat19.x = fract(u_xlat19.x);
					        u_xlat19.x = u_xlat0.x + u_xlat19.x;
					        u_xlat19.x = fract(u_xlat19.x);
					        u_xlat5.z = u_xlat19.x * 2.0 + -1.0;
					        u_xlat19.x = dot(u_xlat4.xy, vec2(1.0, 78.2330017));
					        u_xlat19.x = sin(u_xlat19.x);
					        u_xlat19.x = u_xlat19.x * 43758.5469;
					        u_xlat19.x = fract(u_xlat19.x);
					        u_xlat19.x = u_xlat0.x + u_xlat19.x;
					        u_xlat19.x = u_xlat19.x * 6.28318548;
					        u_xlat6 = sin(u_xlat19.x);
					        u_xlat7.x = cos(u_xlat19.x);
					        u_xlat19.x = (-u_xlat5.z) * u_xlat5.z + 1.0;
					        u_xlat19.x = sqrt(u_xlat19.x);
					        u_xlat7.y = u_xlat6;
					        u_xlat5.xy = u_xlat19.xx * u_xlat7.xy;
					        u_xlat26 = u_xlat26 + 1.0;
					        u_xlat26 = u_xlat26 / u_xlat8;
					        u_xlat26 = sqrt(u_xlat26);
					        u_xlat26 = u_xlat26 * _Radius;
					        u_xlat12.xyz = vec3(u_xlat26) * u_xlat5.xyz;
					        u_xlat26 = dot((-u_xlat1.xyz), u_xlat12.xyz);
					        u_xlatb26 = u_xlat26>=0.0;
					        u_xlat12.xyz = (bool(u_xlatb26)) ? (-u_xlat12.xyz) : u_xlat12.xyz;
					        u_xlat12.xyz = u_xlat2.xyz + u_xlat12.xyz;
					        u_xlat19.xy = u_xlat12.yy * unity_CameraProjection[1].xy;
					        u_xlat19.xy = unity_CameraProjection[0].xy * u_xlat12.xx + u_xlat19.xy;
					        u_xlat19.xy = unity_CameraProjection[2].xy * u_xlat12.zz + u_xlat19.xy;
					        u_xlat26 = (-u_xlat12.z) + 1.0;
					        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat12.z;
					        u_xlat19.xy = u_xlat19.xy / vec2(u_xlat26);
					        u_xlat19.xy = u_xlat19.xy + vec2(1.0, 1.0);
					        u_xlat12.xy = u_xlat19.xy * vec2(0.5, 0.5);
					        u_xlat12.xy = u_xlat12.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					        u_xlat10_5 = texture(_CameraDepthTexture, u_xlat12.xy);
					        u_xlat26 = u_xlat10_5.x * _ZBufferParams.x;
					        u_xlat28 = (-unity_OrthoParams.w) * u_xlat26 + 1.0;
					        u_xlat26 = u_xlat16 * u_xlat26 + _ZBufferParams.y;
					        u_xlat26 = u_xlat28 / u_xlat26;
					        u_xlatb5.xy = lessThan(u_xlat12.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlati12.z = int((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu));
					        u_xlatb12.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat12.xyxx).xy;
					        u_xlati12.x = int((uint(u_xlatb12.y) * 0xffffffffu) | (uint(u_xlatb12.x) * 0xffffffffu));
					        u_xlati12.xz = ivec2(uvec2(u_xlati12.xz) & uvec2(1u, 1u));
					        u_xlati12.x = u_xlati12.x + u_xlati12.z;
					        u_xlat12.x = float(u_xlati12.x);
					        u_xlatb20 = 9.99999975e-06>=u_xlat26;
					        u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
					        u_xlat12.x = u_xlat20 + u_xlat12.x;
					        u_xlat12.x = u_xlat12.x * 100000000.0;
					        u_xlat5.z = u_xlat26 * _ProjectionParams.z + u_xlat12.x;
					        u_xlat19.xy = u_xlat19.xy + (-unity_CameraProjection[2].xy);
					        u_xlat19.xy = u_xlat19.xy + vec2(-1.0, -1.0);
					        u_xlat19.xy = u_xlat19.xy / u_xlat3.xy;
					        u_xlat26 = (-u_xlat5.z) + 1.0;
					        u_xlat26 = unity_OrthoParams.w * u_xlat26 + u_xlat5.z;
					        u_xlat5.xy = vec2(u_xlat26) * u_xlat19.xy;
					        u_xlat12.xyz = (-u_xlat2.xyz) + u_xlat5.xyz;
					        u_xlat26 = dot(u_xlat12.xyz, u_xlat1.xyz);
					        u_xlat26 = (-u_xlat2.z) * 0.00200000009 + u_xlat26;
					        u_xlat26 = max(u_xlat26, 0.0);
					        u_xlat19.x = dot(u_xlat12.xyz, u_xlat12.xyz);
					        u_xlat19.x = u_xlat19.x + 9.99999975e-05;
					        u_xlat26 = u_xlat26 / u_xlat19.x;
					        u_xlat24 = u_xlat24 + u_xlat26;
					    }
					    u_xlat0.x = u_xlat24 * _Radius;
					    u_xlat0.x = u_xlat0.x * _Intensity;
					    u_xlat0.x = u_xlat0.x / u_xlat8;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.600000024;
					    SV_Target0.x = exp2(u_xlat0.x);
					    SV_Target0.yzw = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "FOG_OFF" }
					"!!!!GL3x"
				}
				SubProgram "vulkan " {
					Keywords { "FOG_OFF" }
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 216623
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    u_xlat0.xyz = in_TEXCOORD0.xyx;
					    phase0_Output0_1 = u_xlat0;
					    vs_TEXCOORD2.xy = u_xlat0.zw;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat16_6;
					float u_xlat7;
					vec3 u_xlat16_7;
					float u_xlat8;
					vec3 u_xlat16_8;
					float u_xlat16_10;
					float u_xlat12;
					float u_xlat13;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD2.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_10 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_10 = 2.0 / u_xlat16_10;
					    u_xlat6.xy = u_xlat16_0.xy * vec2(u_xlat16_10);
					    u_xlat6.z = u_xlat16_10 + -1.0;
					    u_xlat0.xyz = u_xlat6.xyz * vec3(1.0, 1.0, -1.0);
					    SV_Target0.yzw = u_xlat6.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat1.x = _MainTex_TexelSize.x;
					    u_xlat1.y = 0.0;
					    u_xlat2 = (-u_xlat1.xyxy) * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD2.xyxy;
					    u_xlat1 = u_xlat1.xyxy * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD2.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat16_8.xyz);
					    u_xlat15 = u_xlat15 + -0.800000012;
					    u_xlat15 = u_xlat15 * 5.00000048;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat8 = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = u_xlat15 * u_xlat8;
					    u_xlat15 = u_xlat15 * 0.31621623;
					    u_xlat3 = u_xlat15 * u_xlat10_3.x;
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat3 = u_xlat10_4.x * 0.227027029 + u_xlat3;
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_8.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat8 = dot(u_xlat0.xyz, u_xlat16_8.xyz);
					    u_xlat8 = u_xlat8 + -0.800000012;
					    u_xlat8 = u_xlat8 * 5.00000048;
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat13 = u_xlat8 * -2.0 + 3.0;
					    u_xlat8 = u_xlat8 * u_xlat8;
					    u_xlat8 = u_xlat8 * u_xlat13;
					    u_xlat13 = u_xlat8 * 0.31621623;
					    u_xlat15 = u_xlat8 * 0.31621623 + u_xlat15;
					    u_xlat3 = u_xlat10_4.x * u_xlat13 + u_xlat3;
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat7 = dot(u_xlat0.xyz, u_xlat16_7.xyz);
					    u_xlat7 = u_xlat7 + -0.800000012;
					    u_xlat7 = u_xlat7 * 5.00000048;
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = u_xlat7 * -2.0 + 3.0;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat7 = u_xlat7 * u_xlat12;
					    u_xlat12 = u_xlat7 * 0.0702702701;
					    u_xlat15 = u_xlat7 * 0.0702702701 + u_xlat15;
					    u_xlat2.x = u_xlat10_2.x * u_xlat12 + u_xlat3;
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_6.xyz);
					    u_xlat0.x = u_xlat0.x + -0.800000012;
					    u_xlat0.x = u_xlat0.x * 5.00000048;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat5 = u_xlat0.x * 0.0702702701;
					    u_xlat0.x = u_xlat0.x * 0.0702702701 + u_xlat15;
					    u_xlat0.x = u_xlat0.x + 0.227027029;
					    u_xlat5 = u_xlat10_1.x * u_xlat5 + u_xlat2.x;
					    SV_Target0.x = u_xlat5 / u_xlat0.x;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %115 %128 %131 
					                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 Location 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 128 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 Location 131 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                                            %100 = OpTypePointer Function %6 
					                             Private f32_4* %109 = OpVariable Private 
					                                        u32 %111 = OpConstant 3 
					                                            %113 = OpTypeVector %6 2 
					                                            %114 = OpTypePointer Output %113 
					                      Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                            %117 = OpTypePointer Output %6 
					                                            %119 = OpTypeVector %6 3 
					                                        u32 %124 = OpConstant 0 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %101 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                        bool %99 = OpLoad %84 
					                                                     OpSelectionMerge %103 None 
					                                                     OpBranchConditional %99 %102 %105 
					                                            %102 = OpLabel 
					                                        f32 %104 = OpLoad %91 
					                                                     OpStore %101 %104 
					                                                     OpBranch %103 
					                                            %105 = OpLabel 
					                                 Input f32* %106 = OpAccessChain %92 %68 
					                                        f32 %107 = OpLoad %106 
					                                                     OpStore %101 %107 
					                                                     OpBranch %103 
					                                            %103 = OpLabel 
					                                        f32 %108 = OpLoad %101 
					                                                     OpStore %91 %108 
					                                        f32 %110 = OpLoad %91 
					                               Private f32* %112 = OpAccessChain %109 %111 
					                                                     OpStore %112 %110 
					                                        f32 %116 = OpLoad %91 
					                                Output f32* %118 = OpAccessChain vs_TEXCOORD2 %68 
					                                                     OpStore %118 %116 
					                                      f32_4 %120 = OpLoad %92 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 1 0 
					                                      f32_4 %122 = OpLoad %109 
					                                      f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
					                                                     OpStore %109 %123 
					                                 Input f32* %125 = OpAccessChain %92 %124 
					                                        f32 %126 = OpLoad %125 
					                                Output f32* %127 = OpAccessChain vs_TEXCOORD2 %124 
					                                                     OpStore %127 %126 
					                                      f32_4 %129 = OpLoad %109 
					                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                                     OpStore vs_TEXCOORD0 %130 
					                                      f32_4 %132 = OpLoad %109 
					                                      f32_2 %133 = OpVectorShuffle %132 %132 2 3 
					                                                     OpStore vs_TEXCOORD1 %133 
					                                Output f32* %134 = OpAccessChain %72 %22 %68 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %72 %22 %68 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 328
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %22 %64 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                              OpDecorate %9 RelaxedPrecision 
					                                              OpDecorate %12 RelaxedPrecision 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate %13 RelaxedPrecision 
					                                              OpDecorate %16 RelaxedPrecision 
					                                              OpDecorate %16 DescriptorSet 16 
					                                              OpDecorate %16 Binding 16 
					                                              OpDecorate %17 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD2 Location 22 
					                                              OpDecorate %23 RelaxedPrecision 
					                                              OpDecorate %25 RelaxedPrecision 
					                                              OpDecorate %26 RelaxedPrecision 
					                                              OpDecorate %27 RelaxedPrecision 
					                                              OpDecorate %28 RelaxedPrecision 
					                                              OpDecorate %32 RelaxedPrecision 
					                                              OpDecorate %36 RelaxedPrecision 
					                                              OpDecorate %38 RelaxedPrecision 
					                                              OpDecorate %39 RelaxedPrecision 
					                                              OpDecorate %40 RelaxedPrecision 
					                                              OpDecorate %41 RelaxedPrecision 
					                                              OpDecorate %43 RelaxedPrecision 
					                                              OpDecorate %44 RelaxedPrecision 
					                                              OpDecorate %46 RelaxedPrecision 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %48 RelaxedPrecision 
					                                              OpDecorate %49 RelaxedPrecision 
					                                              OpDecorate %50 RelaxedPrecision 
					                                              OpDecorate %53 RelaxedPrecision 
					                                              OpDecorate %55 RelaxedPrecision 
					                                              OpDecorate %64 RelaxedPrecision 
					                                              OpDecorate %64 Location 64 
					                                              OpMemberDecorate %76 0 Offset 76 
					                                              OpDecorate %76 Block 
					                                              OpDecorate %78 DescriptorSet 78 
					                                              OpDecorate %78 Binding 78 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %99 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %107 RelaxedPrecision 
					                                              OpDecorate %108 RelaxedPrecision 
					                                              OpDecorate %108 DescriptorSet 108 
					                                              OpDecorate %108 Binding 108 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %110 DescriptorSet 110 
					                                              OpDecorate %110 Binding 110 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %117 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %124 RelaxedPrecision 
					                                              OpDecorate %125 RelaxedPrecision 
					                                              OpDecorate %127 RelaxedPrecision 
					                                              OpDecorate %129 RelaxedPrecision 
					                                              OpDecorate %131 RelaxedPrecision 
					                                              OpDecorate %134 RelaxedPrecision 
					                                              OpDecorate %136 RelaxedPrecision 
					                                              OpDecorate %138 RelaxedPrecision 
					                                              OpDecorate %139 RelaxedPrecision 
					                                              OpDecorate %141 RelaxedPrecision 
					                                              OpDecorate %142 RelaxedPrecision 
					                                              OpDecorate %143 RelaxedPrecision 
					                                              OpDecorate %144 RelaxedPrecision 
					                                              OpDecorate %145 RelaxedPrecision 
					                                              OpDecorate %147 RelaxedPrecision 
					                                              OpDecorate %149 RelaxedPrecision 
					                                              OpDecorate %150 RelaxedPrecision 
					                                              OpDecorate %151 RelaxedPrecision 
					                                              OpDecorate %152 RelaxedPrecision 
					                                              OpDecorate %153 RelaxedPrecision 
					                                              OpDecorate %154 RelaxedPrecision 
					                                              OpDecorate %155 RelaxedPrecision 
					                                              OpDecorate %156 RelaxedPrecision 
					                                              OpDecorate %158 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %162 RelaxedPrecision 
					                                              OpDecorate %164 RelaxedPrecision 
					                                              OpDecorate %165 RelaxedPrecision 
					                                              OpDecorate %166 RelaxedPrecision 
					                                              OpDecorate %167 RelaxedPrecision 
					                                              OpDecorate %168 RelaxedPrecision 
					                                              OpDecorate %170 RelaxedPrecision 
					                                              OpDecorate %171 RelaxedPrecision 
					                                              OpDecorate %172 RelaxedPrecision 
					                                              OpDecorate %173 RelaxedPrecision 
					                                              OpDecorate %175 RelaxedPrecision 
					                                              OpDecorate %176 RelaxedPrecision 
					                                              OpDecorate %177 RelaxedPrecision 
					                                              OpDecorate %178 RelaxedPrecision 
					                                              OpDecorate %179 RelaxedPrecision 
					                                              OpDecorate %184 RelaxedPrecision 
					                                              OpDecorate %185 RelaxedPrecision 
					                                              OpDecorate %186 RelaxedPrecision 
					                                              OpDecorate %191 RelaxedPrecision 
					                                              OpDecorate %192 RelaxedPrecision 
					                                              OpDecorate %193 RelaxedPrecision 
					                                              OpDecorate %194 RelaxedPrecision 
					                                              OpDecorate %195 RelaxedPrecision 
					                                              OpDecorate %196 RelaxedPrecision 
					                                              OpDecorate %198 RelaxedPrecision 
					                                              OpDecorate %200 RelaxedPrecision 
					                                              OpDecorate %201 RelaxedPrecision 
					                                              OpDecorate %202 RelaxedPrecision 
					                                              OpDecorate %203 RelaxedPrecision 
					                                              OpDecorate %204 RelaxedPrecision 
					                                              OpDecorate %205 RelaxedPrecision 
					                                              OpDecorate %206 RelaxedPrecision 
					                                              OpDecorate %207 RelaxedPrecision 
					                                              OpDecorate %208 RelaxedPrecision 
					                                              OpDecorate %209 RelaxedPrecision 
					                                              OpDecorate %210 RelaxedPrecision 
					                                              OpDecorate %211 RelaxedPrecision 
					                                              OpDecorate %212 RelaxedPrecision 
					                                              OpDecorate %213 RelaxedPrecision 
					                                              OpDecorate %214 RelaxedPrecision 
					                                              OpDecorate %215 RelaxedPrecision 
					                                              OpDecorate %216 RelaxedPrecision 
					                                              OpDecorate %217 RelaxedPrecision 
					                                              OpDecorate %218 RelaxedPrecision 
					                                              OpDecorate %220 RelaxedPrecision 
					                                              OpDecorate %221 RelaxedPrecision 
					                                              OpDecorate %224 RelaxedPrecision 
					                                              OpDecorate %225 RelaxedPrecision 
					                                              OpDecorate %226 RelaxedPrecision 
					                                              OpDecorate %227 RelaxedPrecision 
					                                              OpDecorate %228 RelaxedPrecision 
					                                              OpDecorate %229 RelaxedPrecision 
					                                              OpDecorate %230 RelaxedPrecision 
					                                              OpDecorate %231 RelaxedPrecision 
					                                              OpDecorate %232 RelaxedPrecision 
					                                              OpDecorate %234 RelaxedPrecision 
					                                              OpDecorate %236 RelaxedPrecision 
					                                              OpDecorate %237 RelaxedPrecision 
					                                              OpDecorate %238 RelaxedPrecision 
					                                              OpDecorate %239 RelaxedPrecision 
					                                              OpDecorate %240 RelaxedPrecision 
					                                              OpDecorate %241 RelaxedPrecision 
					                                              OpDecorate %242 RelaxedPrecision 
					                                              OpDecorate %243 RelaxedPrecision 
					                                              OpDecorate %244 RelaxedPrecision 
					                                              OpDecorate %245 RelaxedPrecision 
					                                              OpDecorate %246 RelaxedPrecision 
					                                              OpDecorate %247 RelaxedPrecision 
					                                              OpDecorate %248 RelaxedPrecision 
					                                              OpDecorate %249 RelaxedPrecision 
					                                              OpDecorate %250 RelaxedPrecision 
					                                              OpDecorate %251 RelaxedPrecision 
					                                              OpDecorate %252 RelaxedPrecision 
					                                              OpDecorate %254 RelaxedPrecision 
					                                              OpDecorate %255 RelaxedPrecision 
					                                              OpDecorate %256 RelaxedPrecision 
					                                              OpDecorate %258 RelaxedPrecision 
					                                              OpDecorate %259 RelaxedPrecision 
					                                              OpDecorate %262 RelaxedPrecision 
					                                              OpDecorate %263 RelaxedPrecision 
					                                              OpDecorate %264 RelaxedPrecision 
					                                              OpDecorate %265 RelaxedPrecision 
					                                              OpDecorate %266 RelaxedPrecision 
					                                              OpDecorate %267 RelaxedPrecision 
					                                              OpDecorate %268 RelaxedPrecision 
					                                              OpDecorate %269 RelaxedPrecision 
					                                              OpDecorate %270 RelaxedPrecision 
					                                              OpDecorate %272 RelaxedPrecision 
					                                              OpDecorate %274 RelaxedPrecision 
					                                              OpDecorate %275 RelaxedPrecision 
					                                              OpDecorate %278 RelaxedPrecision 
					                                              OpDecorate %279 RelaxedPrecision 
					                                              OpDecorate %282 RelaxedPrecision 
					                                              OpDecorate %283 RelaxedPrecision 
					                                              OpDecorate %285 RelaxedPrecision 
					                                              OpDecorate %287 RelaxedPrecision 
					                                              OpDecorate %288 RelaxedPrecision 
					                                              OpDecorate %289 RelaxedPrecision 
					                                              OpDecorate %291 RelaxedPrecision 
					                                              OpDecorate %293 RelaxedPrecision 
					                                              OpDecorate %294 RelaxedPrecision 
					                                              OpDecorate %297 RelaxedPrecision 
					                                              OpDecorate %298 RelaxedPrecision 
					                                              OpDecorate %299 RelaxedPrecision 
					                                              OpDecorate %302 RelaxedPrecision 
					                                              OpDecorate %303 RelaxedPrecision 
					                                              OpDecorate %305 RelaxedPrecision 
					                                              OpDecorate %306 RelaxedPrecision 
					                                              OpDecorate %308 RelaxedPrecision 
					                                              OpDecorate %309 RelaxedPrecision 
					                                              OpDecorate %312 RelaxedPrecision 
					                                              OpDecorate %313 RelaxedPrecision 
					                                              OpDecorate %316 RelaxedPrecision 
					                                              OpDecorate %317 RelaxedPrecision 
					                                              OpDecorate %318 RelaxedPrecision 
					                                              OpDecorate %319 RelaxedPrecision 
					                                              OpDecorate %320 RelaxedPrecision 
					                                              OpDecorate %321 RelaxedPrecision 
					                                              OpDecorate %323 RelaxedPrecision 
					                                              OpDecorate %324 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 3 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_3* %9 = OpVariable Private 
					                                      %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %11 = OpTypePointer UniformConstant %10 
					 UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                      %14 = OpTypeSampler 
					                                      %15 = OpTypePointer UniformConstant %14 
					             UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                      %18 = OpTypeSampledImage %10 
					                                      %20 = OpTypeVector %6 2 
					                                      %21 = OpTypePointer Input %20 
					                Input f32_2* vs_TEXCOORD2 = OpVariable Input 
					                                      %24 = OpTypeVector %6 4 
					                       Private f32_3* %27 = OpVariable Private 
					                                  f32 %29 = OpConstant 3,674022E-40 
					                                  f32 %30 = OpConstant 3,674022E-40 
					                                f32_3 %31 = OpConstantComposite %29 %29 %30 
					                                  f32 %33 = OpConstant 3,674022E-40 
					                                  f32 %34 = OpConstant 3,674022E-40 
					                                f32_3 %35 = OpConstantComposite %33 %33 %34 
					                                      %37 = OpTypePointer Private %6 
					                         Private f32* %38 = OpVariable Private 
					                                  f32 %42 = OpConstant 3,674022E-40 
					                       Private f32_3* %45 = OpVariable Private 
					                                  f32 %54 = OpConstant 3,674022E-40 
					                                      %56 = OpTypeInt 32 0 
					                                  u32 %57 = OpConstant 2 
					                       Private f32_3* %59 = OpVariable Private 
					                                f32_3 %61 = OpConstantComposite %34 %34 %54 
					                                      %63 = OpTypePointer Output %24 
					                        Output f32_4* %64 = OpVariable Output 
					                                  f32 %66 = OpConstant 3,674022E-40 
					                                  f32 %67 = OpConstant 3,674022E-40 
					                                f32_3 %68 = OpConstantComposite %66 %66 %67 
					                                f32_3 %70 = OpConstantComposite %66 %66 %66 
					                                      %74 = OpTypePointer Private %24 
					                       Private f32_4* %75 = OpVariable Private 
					                                      %76 = OpTypeStruct %24 
					                                      %77 = OpTypePointer Uniform %76 
					             Uniform struct {f32_4;}* %78 = OpVariable Uniform 
					                                      %79 = OpTypeInt 32 1 
					                                  i32 %80 = OpConstant 0 
					                                  u32 %81 = OpConstant 0 
					                                      %82 = OpTypePointer Uniform %6 
					                                  u32 %86 = OpConstant 1 
					                       Private f32_4* %88 = OpVariable Private 
					                                  f32 %92 = OpConstant 3,674022E-40 
					                                  f32 %93 = OpConstant 3,674022E-40 
					                                  f32 %94 = OpConstant 3,674022E-40 
					                                  f32 %95 = OpConstant 3,674022E-40 
					                                f32_4 %96 = OpConstantComposite %92 %93 %94 %95 
					                      Private f32_4* %107 = OpVariable Private 
					UniformConstant read_only Texture2D* %108 = OpVariable UniformConstant 
					            UniformConstant sampler* %110 = OpVariable UniformConstant 
					                      Private f32_4* %116 = OpVariable Private 
					                      Private f32_3* %123 = OpVariable Private 
					                               f32_3 %126 = OpConstantComposite %42 %42 %42 
					                               f32_3 %128 = OpConstantComposite %54 %54 %54 
					                        Private f32* %134 = OpVariable Private 
					                                 f32 %137 = OpConstant 3,674022E-40 
					                                 f32 %140 = OpConstant 3,674022E-40 
					                        Private f32* %144 = OpVariable Private 
					                                 f32 %146 = OpConstant 3,674022E-40 
					                                 f32 %148 = OpConstant 3,674022E-40 
					                                 f32 %157 = OpConstant 3,674022E-40 
					                        Private f32* %160 = OpVariable Private 
					                        Private f32* %166 = OpVariable Private 
					                                 f32 %174 = OpConstant 3,674022E-40 
					                      Private f32_4* %184 = OpVariable Private 
					                      Private f32_3* %191 = OpVariable Private 
					                        Private f32* %196 = OpVariable Private 
					                        Private f32* %242 = OpVariable Private 
					                                 f32 %253 = OpConstant 3,674022E-40 
					                        Private f32* %285 = OpVariable Private 
					                                     %325 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                  read_only Texture2D %13 = OpLoad %12 
					                              sampler %17 = OpLoad %16 
					           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                f32_2 %23 = OpLoad vs_TEXCOORD2 
					                                f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                                f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                              OpStore %9 %26 
					                                f32_3 %28 = OpLoad %9 
					                                f32_3 %32 = OpFMul %28 %31 
					                                f32_3 %36 = OpFAdd %32 %35 
					                                              OpStore %27 %36 
					                                f32_3 %39 = OpLoad %27 
					                                f32_3 %40 = OpLoad %27 
					                                  f32 %41 = OpDot %39 %40 
					                                              OpStore %38 %41 
					                                  f32 %43 = OpLoad %38 
					                                  f32 %44 = OpFDiv %42 %43 
					                                              OpStore %38 %44 
					                                f32_3 %46 = OpLoad %27 
					                                f32_2 %47 = OpVectorShuffle %46 %46 0 1 
					                                  f32 %48 = OpLoad %38 
					                                f32_2 %49 = OpCompositeConstruct %48 %48 
					                                f32_2 %50 = OpFMul %47 %49 
					                                f32_3 %51 = OpLoad %45 
					                                f32_3 %52 = OpVectorShuffle %51 %50 3 4 2 
					                                              OpStore %45 %52 
					                                  f32 %53 = OpLoad %38 
					                                  f32 %55 = OpFAdd %53 %54 
					                         Private f32* %58 = OpAccessChain %45 %57 
					                                              OpStore %58 %55 
					                                f32_3 %60 = OpLoad %45 
					                                f32_3 %62 = OpFMul %60 %61 
					                                              OpStore %59 %62 
					                                f32_3 %65 = OpLoad %45 
					                                f32_3 %69 = OpFMul %65 %68 
					                                f32_3 %71 = OpFAdd %69 %70 
					                                f32_4 %72 = OpLoad %64 
					                                f32_4 %73 = OpVectorShuffle %72 %71 0 4 5 6 
					                                              OpStore %64 %73 
					                         Uniform f32* %83 = OpAccessChain %78 %80 %81 
					                                  f32 %84 = OpLoad %83 
					                         Private f32* %85 = OpAccessChain %75 %81 
					                                              OpStore %85 %84 
					                         Private f32* %87 = OpAccessChain %75 %86 
					                                              OpStore %87 %30 
					                                f32_4 %89 = OpLoad %75 
					                                f32_4 %90 = OpVectorShuffle %89 %89 0 1 0 1 
					                                f32_4 %91 = OpFNegate %90 
					                                f32_4 %97 = OpFMul %91 %96 
					                                f32_2 %98 = OpLoad vs_TEXCOORD2 
					                                f32_4 %99 = OpVectorShuffle %98 %98 0 1 0 1 
					                               f32_4 %100 = OpFAdd %97 %99 
					                                              OpStore %88 %100 
					                               f32_4 %101 = OpLoad %75 
					                               f32_4 %102 = OpVectorShuffle %101 %101 0 1 0 1 
					                               f32_4 %103 = OpFMul %102 %96 
					                               f32_2 %104 = OpLoad vs_TEXCOORD2 
					                               f32_4 %105 = OpVectorShuffle %104 %104 0 1 0 1 
					                               f32_4 %106 = OpFAdd %103 %105 
					                                              OpStore %75 %106 
					                 read_only Texture2D %109 = OpLoad %108 
					                             sampler %111 = OpLoad %110 
					          read_only Texture2DSampled %112 = OpSampledImage %109 %111 
					                               f32_4 %113 = OpLoad %88 
					                               f32_2 %114 = OpVectorShuffle %113 %113 0 1 
					                               f32_4 %115 = OpImageSampleImplicitLod %112 %114 
					                                              OpStore %107 %115 
					                 read_only Texture2D %117 = OpLoad %108 
					                             sampler %118 = OpLoad %110 
					          read_only Texture2DSampled %119 = OpSampledImage %117 %118 
					                               f32_4 %120 = OpLoad %88 
					                               f32_2 %121 = OpVectorShuffle %120 %120 2 3 
					                               f32_4 %122 = OpImageSampleImplicitLod %119 %121 
					                                              OpStore %116 %122 
					                               f32_4 %124 = OpLoad %107 
					                               f32_3 %125 = OpVectorShuffle %124 %124 1 2 3 
					                               f32_3 %127 = OpFMul %125 %126 
					                               f32_3 %129 = OpFAdd %127 %128 
					                                              OpStore %123 %129 
					                               f32_3 %130 = OpLoad %59 
					                               f32_3 %131 = OpLoad %123 
					                                 f32 %132 = OpDot %130 %131 
					                        Private f32* %133 = OpAccessChain %123 %81 
					                                              OpStore %133 %132 
					                        Private f32* %135 = OpAccessChain %123 %81 
					                                 f32 %136 = OpLoad %135 
					                                 f32 %138 = OpFAdd %136 %137 
					                                              OpStore %134 %138 
					                                 f32 %139 = OpLoad %134 
					                                 f32 %141 = OpFMul %139 %140 
					                                              OpStore %134 %141 
					                                 f32 %142 = OpLoad %134 
					                                 f32 %143 = OpExtInst %1 43 %142 %30 %34 
					                                              OpStore %134 %143 
					                                 f32 %145 = OpLoad %134 
					                                 f32 %147 = OpFMul %145 %146 
					                                 f32 %149 = OpFAdd %147 %148 
					                                              OpStore %144 %149 
					                                 f32 %150 = OpLoad %134 
					                                 f32 %151 = OpLoad %134 
					                                 f32 %152 = OpFMul %150 %151 
					                                              OpStore %134 %152 
					                                 f32 %153 = OpLoad %134 
					                                 f32 %154 = OpLoad %144 
					                                 f32 %155 = OpFMul %153 %154 
					                                              OpStore %134 %155 
					                                 f32 %156 = OpLoad %134 
					                                 f32 %158 = OpFMul %156 %157 
					                        Private f32* %159 = OpAccessChain %123 %81 
					                                              OpStore %159 %158 
					                        Private f32* %161 = OpAccessChain %107 %81 
					                                 f32 %162 = OpLoad %161 
					                        Private f32* %163 = OpAccessChain %123 %81 
					                                 f32 %164 = OpLoad %163 
					                                 f32 %165 = OpFMul %162 %164 
					                                              OpStore %160 %165 
					                 read_only Texture2D %167 = OpLoad %108 
					                             sampler %168 = OpLoad %110 
					          read_only Texture2DSampled %169 = OpSampledImage %167 %168 
					                               f32_2 %170 = OpLoad vs_TEXCOORD2 
					                               f32_4 %171 = OpImageSampleImplicitLod %169 %170 
					                                 f32 %172 = OpCompositeExtract %171 0 
					                                              OpStore %166 %172 
					                                 f32 %173 = OpLoad %166 
					                                 f32 %175 = OpFMul %173 %174 
					                                 f32 %176 = OpLoad %160 
					                                 f32 %177 = OpFAdd %175 %176 
					                                              OpStore %160 %177 
					                 read_only Texture2D %178 = OpLoad %108 
					                             sampler %179 = OpLoad %110 
					          read_only Texture2DSampled %180 = OpSampledImage %178 %179 
					                               f32_4 %181 = OpLoad %75 
					                               f32_2 %182 = OpVectorShuffle %181 %181 0 1 
					                               f32_4 %183 = OpImageSampleImplicitLod %180 %182 
					                                              OpStore %107 %183 
					                 read_only Texture2D %185 = OpLoad %108 
					                             sampler %186 = OpLoad %110 
					          read_only Texture2DSampled %187 = OpSampledImage %185 %186 
					                               f32_4 %188 = OpLoad %75 
					                               f32_2 %189 = OpVectorShuffle %188 %188 2 3 
					                               f32_4 %190 = OpImageSampleImplicitLod %187 %189 
					                                              OpStore %184 %190 
					                               f32_4 %192 = OpLoad %107 
					                               f32_3 %193 = OpVectorShuffle %192 %192 1 2 3 
					                               f32_3 %194 = OpFMul %193 %126 
					                               f32_3 %195 = OpFAdd %194 %128 
					                                              OpStore %191 %195 
					                               f32_3 %197 = OpLoad %59 
					                               f32_3 %198 = OpLoad %191 
					                                 f32 %199 = OpDot %197 %198 
					                                              OpStore %196 %199 
					                                 f32 %200 = OpLoad %196 
					                                 f32 %201 = OpFAdd %200 %137 
					                                              OpStore %134 %201 
					                                 f32 %202 = OpLoad %134 
					                                 f32 %203 = OpFMul %202 %140 
					                                              OpStore %134 %203 
					                                 f32 %204 = OpLoad %134 
					                                 f32 %205 = OpExtInst %1 43 %204 %30 %34 
					                                              OpStore %134 %205 
					                                 f32 %206 = OpLoad %134 
					                                 f32 %207 = OpFMul %206 %146 
					                                 f32 %208 = OpFAdd %207 %148 
					                                              OpStore %144 %208 
					                                 f32 %209 = OpLoad %134 
					                                 f32 %210 = OpLoad %134 
					                                 f32 %211 = OpFMul %209 %210 
					                                              OpStore %134 %211 
					                                 f32 %212 = OpLoad %134 
					                                 f32 %213 = OpLoad %144 
					                                 f32 %214 = OpFMul %212 %213 
					                                              OpStore %134 %214 
					                                 f32 %215 = OpLoad %134 
					                                 f32 %216 = OpFMul %215 %157 
					                                              OpStore %196 %216 
					                                 f32 %217 = OpLoad %134 
					                                 f32 %218 = OpFMul %217 %157 
					                        Private f32* %219 = OpAccessChain %123 %81 
					                                 f32 %220 = OpLoad %219 
					                                 f32 %221 = OpFAdd %218 %220 
					                        Private f32* %222 = OpAccessChain %123 %81 
					                                              OpStore %222 %221 
					                        Private f32* %223 = OpAccessChain %107 %81 
					                                 f32 %224 = OpLoad %223 
					                                 f32 %225 = OpLoad %196 
					                                 f32 %226 = OpFMul %224 %225 
					                                 f32 %227 = OpLoad %160 
					                                 f32 %228 = OpFAdd %226 %227 
					                                              OpStore %160 %228 
					                               f32_4 %229 = OpLoad %116 
					                               f32_3 %230 = OpVectorShuffle %229 %229 1 2 3 
					                               f32_3 %231 = OpFMul %230 %126 
					                               f32_3 %232 = OpFAdd %231 %128 
					                                              OpStore %191 %232 
					                               f32_3 %233 = OpLoad %59 
					                               f32_3 %234 = OpLoad %191 
					                                 f32 %235 = OpDot %233 %234 
					                                              OpStore %196 %235 
					                                 f32 %236 = OpLoad %196 
					                                 f32 %237 = OpFAdd %236 %137 
					                                              OpStore %134 %237 
					                                 f32 %238 = OpLoad %134 
					                                 f32 %239 = OpFMul %238 %140 
					                                              OpStore %134 %239 
					                                 f32 %240 = OpLoad %134 
					                                 f32 %241 = OpExtInst %1 43 %240 %30 %34 
					                                              OpStore %134 %241 
					                                 f32 %243 = OpLoad %134 
					                                 f32 %244 = OpFMul %243 %146 
					                                 f32 %245 = OpFAdd %244 %148 
					                                              OpStore %242 %245 
					                                 f32 %246 = OpLoad %134 
					                                 f32 %247 = OpLoad %134 
					                                 f32 %248 = OpFMul %246 %247 
					                                              OpStore %134 %248 
					                                 f32 %249 = OpLoad %134 
					                                 f32 %250 = OpLoad %242 
					                                 f32 %251 = OpFMul %249 %250 
					                                              OpStore %134 %251 
					                                 f32 %252 = OpLoad %134 
					                                 f32 %254 = OpFMul %252 %253 
					                                              OpStore %196 %254 
					                                 f32 %255 = OpLoad %134 
					                                 f32 %256 = OpFMul %255 %253 
					                        Private f32* %257 = OpAccessChain %123 %81 
					                                 f32 %258 = OpLoad %257 
					                                 f32 %259 = OpFAdd %256 %258 
					                        Private f32* %260 = OpAccessChain %123 %81 
					                                              OpStore %260 %259 
					                        Private f32* %261 = OpAccessChain %116 %81 
					                                 f32 %262 = OpLoad %261 
					                                 f32 %263 = OpLoad %196 
					                                 f32 %264 = OpFMul %262 %263 
					                                 f32 %265 = OpLoad %160 
					                                 f32 %266 = OpFAdd %264 %265 
					                                              OpStore %160 %266 
					                               f32_4 %267 = OpLoad %184 
					                               f32_3 %268 = OpVectorShuffle %267 %267 1 2 3 
					                               f32_3 %269 = OpFMul %268 %126 
					                               f32_3 %270 = OpFAdd %269 %128 
					                                              OpStore %191 %270 
					                               f32_3 %271 = OpLoad %59 
					                               f32_3 %272 = OpLoad %191 
					                                 f32 %273 = OpDot %271 %272 
					                                              OpStore %196 %273 
					                                 f32 %274 = OpLoad %196 
					                                 f32 %275 = OpFAdd %274 %137 
					                        Private f32* %276 = OpAccessChain %27 %81 
					                                              OpStore %276 %275 
					                        Private f32* %277 = OpAccessChain %27 %81 
					                                 f32 %278 = OpLoad %277 
					                                 f32 %279 = OpFMul %278 %140 
					                        Private f32* %280 = OpAccessChain %27 %81 
					                                              OpStore %280 %279 
					                        Private f32* %281 = OpAccessChain %27 %81 
					                                 f32 %282 = OpLoad %281 
					                                 f32 %283 = OpExtInst %1 43 %282 %30 %34 
					                        Private f32* %284 = OpAccessChain %27 %81 
					                                              OpStore %284 %283 
					                        Private f32* %286 = OpAccessChain %27 %81 
					                                 f32 %287 = OpLoad %286 
					                                 f32 %288 = OpFMul %287 %146 
					                                 f32 %289 = OpFAdd %288 %148 
					                                              OpStore %285 %289 
					                        Private f32* %290 = OpAccessChain %27 %81 
					                                 f32 %291 = OpLoad %290 
					                        Private f32* %292 = OpAccessChain %27 %81 
					                                 f32 %293 = OpLoad %292 
					                                 f32 %294 = OpFMul %291 %293 
					                        Private f32* %295 = OpAccessChain %27 %81 
					                                              OpStore %295 %294 
					                        Private f32* %296 = OpAccessChain %27 %81 
					                                 f32 %297 = OpLoad %296 
					                                 f32 %298 = OpLoad %285 
					                                 f32 %299 = OpFMul %297 %298 
					                        Private f32* %300 = OpAccessChain %27 %81 
					                                              OpStore %300 %299 
					                        Private f32* %301 = OpAccessChain %27 %81 
					                                 f32 %302 = OpLoad %301 
					                                 f32 %303 = OpFMul %302 %253 
					                                              OpStore %196 %303 
					                        Private f32* %304 = OpAccessChain %27 %81 
					                                 f32 %305 = OpLoad %304 
					                                 f32 %306 = OpFMul %305 %253 
					                        Private f32* %307 = OpAccessChain %123 %81 
					                                 f32 %308 = OpLoad %307 
					                                 f32 %309 = OpFAdd %306 %308 
					                        Private f32* %310 = OpAccessChain %123 %81 
					                                              OpStore %310 %309 
					                        Private f32* %311 = OpAccessChain %123 %81 
					                                 f32 %312 = OpLoad %311 
					                                 f32 %313 = OpFAdd %312 %174 
					                        Private f32* %314 = OpAccessChain %123 %81 
					                                              OpStore %314 %313 
					                        Private f32* %315 = OpAccessChain %184 %81 
					                                 f32 %316 = OpLoad %315 
					                                 f32 %317 = OpLoad %196 
					                                 f32 %318 = OpFMul %316 %317 
					                                 f32 %319 = OpLoad %160 
					                                 f32 %320 = OpFAdd %318 %319 
					                                              OpStore %160 %320 
					                                 f32 %321 = OpLoad %160 
					                        Private f32* %322 = OpAccessChain %123 %81 
					                                 f32 %323 = OpLoad %322 
					                                 f32 %324 = OpFDiv %321 %323 
					                         Output f32* %326 = OpAccessChain %64 %81 
					                                              OpStore %326 %324 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat16_6;
					float u_xlat7;
					vec3 u_xlat16_7;
					float u_xlat8;
					vec3 u_xlat16_8;
					float u_xlat16_10;
					float u_xlat12;
					float u_xlat13;
					float u_xlat15;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD2.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat16_10 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_10 = 2.0 / u_xlat16_10;
					    u_xlat6.xy = u_xlat16_0.xy * vec2(u_xlat16_10);
					    u_xlat6.z = u_xlat16_10 + -1.0;
					    u_xlat0.xyz = u_xlat6.xyz * vec3(1.0, 1.0, -1.0);
					    SV_Target0.yzw = u_xlat6.xyz * vec3(0.5, 0.5, -0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat1.x = _MainTex_TexelSize.x;
					    u_xlat1.y = 0.0;
					    u_xlat2 = (-u_xlat1.xyxy) * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD2.xyxy;
					    u_xlat1 = u_xlat1.xyxy * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD2.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat16_8.xyz);
					    u_xlat15 = u_xlat15 + -0.800000012;
					    u_xlat15 = u_xlat15 * 5.00000048;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat8 = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = u_xlat15 * u_xlat8;
					    u_xlat15 = u_xlat15 * 0.31621623;
					    u_xlat3 = u_xlat15 * u_xlat10_3.x;
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat3 = u_xlat10_4.x * 0.227027029 + u_xlat3;
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_8.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat8 = dot(u_xlat0.xyz, u_xlat16_8.xyz);
					    u_xlat8 = u_xlat8 + -0.800000012;
					    u_xlat8 = u_xlat8 * 5.00000048;
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat13 = u_xlat8 * -2.0 + 3.0;
					    u_xlat8 = u_xlat8 * u_xlat8;
					    u_xlat8 = u_xlat8 * u_xlat13;
					    u_xlat13 = u_xlat8 * 0.31621623;
					    u_xlat15 = u_xlat8 * 0.31621623 + u_xlat15;
					    u_xlat3 = u_xlat10_4.x * u_xlat13 + u_xlat3;
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat7 = dot(u_xlat0.xyz, u_xlat16_7.xyz);
					    u_xlat7 = u_xlat7 + -0.800000012;
					    u_xlat7 = u_xlat7 * 5.00000048;
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = u_xlat7 * -2.0 + 3.0;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat7 = u_xlat7 * u_xlat12;
					    u_xlat12 = u_xlat7 * 0.0702702701;
					    u_xlat15 = u_xlat7 * 0.0702702701 + u_xlat15;
					    u_xlat2.x = u_xlat10_2.x * u_xlat12 + u_xlat3;
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_6.xyz);
					    u_xlat0.x = u_xlat0.x + -0.800000012;
					    u_xlat0.x = u_xlat0.x * 5.00000048;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat5 = u_xlat0.x * 0.0702702701;
					    u_xlat0.x = u_xlat0.x * 0.0702702701 + u_xlat15;
					    u_xlat0.x = u_xlat0.x + 0.227027029;
					    u_xlat5 = u_xlat10_1.x * u_xlat5 + u_xlat2.x;
					    SV_Target0.x = u_xlat5 / u_xlat0.x;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 275137
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    u_xlat0.xyz = in_TEXCOORD0.xyx;
					    phase0_Output0_1 = u_xlat0;
					    vs_TEXCOORD2.xy = u_xlat0.zw;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
					uniform 	vec4 _MainTex_TexelSize;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _CameraGBufferTexture2;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat6;
					vec3 u_xlat16_6;
					float u_xlat7;
					vec3 u_xlat16_7;
					float u_xlat8;
					vec3 u_xlat16_8;
					float u_xlat12;
					float u_xlat13;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat10_0 = texture(_CameraGBufferTexture2, vs_TEXCOORD2.xy);
					    u_xlat15 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlatb15 = u_xlat15!=0.0;
					    u_xlat15 = (u_xlatb15) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat15);
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat1.x = _MainTex_TexelSize.x;
					    u_xlat1.y = 0.0;
					    u_xlat2 = (-u_xlat1.xyxy) * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD2.xyxy;
					    u_xlat1 = u_xlat1.xyxy * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD2.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat16_8.xyz);
					    u_xlat15 = u_xlat15 + -0.800000012;
					    u_xlat15 = u_xlat15 * 5.00000048;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat8 = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = u_xlat15 * u_xlat8;
					    u_xlat15 = u_xlat15 * 0.31621623;
					    u_xlat3 = u_xlat15 * u_xlat10_3.x;
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat3 = u_xlat10_4.x * 0.227027029 + u_xlat3;
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_8.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat8 = dot(u_xlat0.xyz, u_xlat16_8.xyz);
					    u_xlat8 = u_xlat8 + -0.800000012;
					    u_xlat8 = u_xlat8 * 5.00000048;
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat13 = u_xlat8 * -2.0 + 3.0;
					    u_xlat8 = u_xlat8 * u_xlat8;
					    u_xlat8 = u_xlat8 * u_xlat13;
					    u_xlat13 = u_xlat8 * 0.31621623;
					    u_xlat15 = u_xlat8 * 0.31621623 + u_xlat15;
					    u_xlat3 = u_xlat10_4.x * u_xlat13 + u_xlat3;
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat7 = dot(u_xlat0.xyz, u_xlat16_7.xyz);
					    u_xlat7 = u_xlat7 + -0.800000012;
					    u_xlat7 = u_xlat7 * 5.00000048;
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = u_xlat7 * -2.0 + 3.0;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat7 = u_xlat7 * u_xlat12;
					    u_xlat12 = u_xlat7 * 0.0702702701;
					    u_xlat15 = u_xlat7 * 0.0702702701 + u_xlat15;
					    u_xlat2.x = u_xlat10_2.x * u_xlat12 + u_xlat3;
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat16_6.xyz);
					    SV_Target0.yzw = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.x = u_xlat6 + -0.800000012;
					    u_xlat0.x = u_xlat0.x * 5.00000048;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat5 = u_xlat0.x * 0.0702702701;
					    u_xlat0.x = u_xlat0.x * 0.0702702701 + u_xlat15;
					    u_xlat0.x = u_xlat0.x + 0.227027029;
					    u_xlat5 = u_xlat10_1.x * u_xlat5 + u_xlat2.x;
					    SV_Target0.x = u_xlat5 / u_xlat0.x;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %115 %128 %131 
					                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 Location 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 128 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 Location 131 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                                            %100 = OpTypePointer Function %6 
					                             Private f32_4* %109 = OpVariable Private 
					                                        u32 %111 = OpConstant 3 
					                                            %113 = OpTypeVector %6 2 
					                                            %114 = OpTypePointer Output %113 
					                      Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                            %117 = OpTypePointer Output %6 
					                                            %119 = OpTypeVector %6 3 
					                                        u32 %124 = OpConstant 0 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %101 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                        bool %99 = OpLoad %84 
					                                                     OpSelectionMerge %103 None 
					                                                     OpBranchConditional %99 %102 %105 
					                                            %102 = OpLabel 
					                                        f32 %104 = OpLoad %91 
					                                                     OpStore %101 %104 
					                                                     OpBranch %103 
					                                            %105 = OpLabel 
					                                 Input f32* %106 = OpAccessChain %92 %68 
					                                        f32 %107 = OpLoad %106 
					                                                     OpStore %101 %107 
					                                                     OpBranch %103 
					                                            %103 = OpLabel 
					                                        f32 %108 = OpLoad %101 
					                                                     OpStore %91 %108 
					                                        f32 %110 = OpLoad %91 
					                               Private f32* %112 = OpAccessChain %109 %111 
					                                                     OpStore %112 %110 
					                                        f32 %116 = OpLoad %91 
					                                Output f32* %118 = OpAccessChain vs_TEXCOORD2 %68 
					                                                     OpStore %118 %116 
					                                      f32_4 %120 = OpLoad %92 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 1 0 
					                                      f32_4 %122 = OpLoad %109 
					                                      f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
					                                                     OpStore %109 %123 
					                                 Input f32* %125 = OpAccessChain %92 %124 
					                                        f32 %126 = OpLoad %125 
					                                Output f32* %127 = OpAccessChain vs_TEXCOORD2 %124 
					                                                     OpStore %127 %126 
					                                      f32_4 %129 = OpLoad %109 
					                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                                     OpStore vs_TEXCOORD0 %130 
					                                      f32_4 %132 = OpLoad %109 
					                                      f32_2 %133 = OpVectorShuffle %132 %132 2 3 
					                                                     OpStore vs_TEXCOORD1 %133 
					                                Output f32* %134 = OpAccessChain %72 %22 %68 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %72 %22 %68 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 344
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %22 %293 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                              OpDecorate %9 RelaxedPrecision 
					                                              OpDecorate %12 RelaxedPrecision 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate %13 RelaxedPrecision 
					                                              OpDecorate %16 RelaxedPrecision 
					                                              OpDecorate %16 DescriptorSet 16 
					                                              OpDecorate %16 Binding 16 
					                                              OpDecorate %17 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD2 Location 22 
					                                              OpDecorate %23 RelaxedPrecision 
					                                              OpDecorate %25 RelaxedPrecision 
					                                              OpDecorate %26 RelaxedPrecision 
					                                              OpDecorate %29 RelaxedPrecision 
					                                              OpDecorate %30 RelaxedPrecision 
					                                              OpDecorate %31 RelaxedPrecision 
					                                              OpDecorate %44 RelaxedPrecision 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %49 RelaxedPrecision 
					                                              OpDecorate %50 RelaxedPrecision 
					                                              OpDecorate %58 ArrayStride 58 
					                                              OpMemberDecorate %59 0 Offset 59 
					                                              OpMemberDecorate %59 1 Offset 59 
					                                              OpDecorate %59 Block 
					                                              OpDecorate %61 DescriptorSet 61 
					                                              OpDecorate %61 Binding 61 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %121 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %122 DescriptorSet 122 
					                                              OpDecorate %122 Binding 122 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %124 RelaxedPrecision 
					                                              OpDecorate %124 DescriptorSet 124 
					                                              OpDecorate %124 Binding 124 
					                                              OpDecorate %125 RelaxedPrecision 
					                                              OpDecorate %130 RelaxedPrecision 
					                                              OpDecorate %131 RelaxedPrecision 
					                                              OpDecorate %132 RelaxedPrecision 
					                                              OpDecorate %137 RelaxedPrecision 
					                                              OpDecorate %138 RelaxedPrecision 
					                                              OpDecorate %139 RelaxedPrecision 
					                                              OpDecorate %140 RelaxedPrecision 
					                                              OpDecorate %142 RelaxedPrecision 
					                                              OpDecorate %145 RelaxedPrecision 
					                                              OpDecorate %148 RelaxedPrecision 
					                                              OpDecorate %150 RelaxedPrecision 
					                                              OpDecorate %152 RelaxedPrecision 
					                                              OpDecorate %153 RelaxedPrecision 
					                                              OpDecorate %155 RelaxedPrecision 
					                                              OpDecorate %156 RelaxedPrecision 
					                                              OpDecorate %158 RelaxedPrecision 
					                                              OpDecorate %159 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %162 RelaxedPrecision 
					                                              OpDecorate %164 RelaxedPrecision 
					                                              OpDecorate %165 RelaxedPrecision 
					                                              OpDecorate %166 RelaxedPrecision 
					                                              OpDecorate %167 RelaxedPrecision 
					                                              OpDecorate %168 RelaxedPrecision 
					                                              OpDecorate %169 RelaxedPrecision 
					                                              OpDecorate %170 RelaxedPrecision 
					                                              OpDecorate %171 RelaxedPrecision 
					                                              OpDecorate %173 RelaxedPrecision 
					                                              OpDecorate %175 RelaxedPrecision 
					                                              OpDecorate %177 RelaxedPrecision 
					                                              OpDecorate %179 RelaxedPrecision 
					                                              OpDecorate %180 RelaxedPrecision 
					                                              OpDecorate %181 RelaxedPrecision 
					                                              OpDecorate %182 RelaxedPrecision 
					                                              OpDecorate %183 RelaxedPrecision 
					                                              OpDecorate %185 RelaxedPrecision 
					                                              OpDecorate %186 RelaxedPrecision 
					                                              OpDecorate %187 RelaxedPrecision 
					                                              OpDecorate %188 RelaxedPrecision 
					                                              OpDecorate %190 RelaxedPrecision 
					                                              OpDecorate %191 RelaxedPrecision 
					                                              OpDecorate %192 RelaxedPrecision 
					                                              OpDecorate %193 RelaxedPrecision 
					                                              OpDecorate %194 RelaxedPrecision 
					                                              OpDecorate %199 RelaxedPrecision 
					                                              OpDecorate %200 RelaxedPrecision 
					                                              OpDecorate %201 RelaxedPrecision 
					                                              OpDecorate %206 RelaxedPrecision 
					                                              OpDecorate %207 RelaxedPrecision 
					                                              OpDecorate %208 RelaxedPrecision 
					                                              OpDecorate %209 RelaxedPrecision 
					                                              OpDecorate %210 RelaxedPrecision 
					                                              OpDecorate %211 RelaxedPrecision 
					                                              OpDecorate %214 RelaxedPrecision 
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
					                                              OpDecorate %236 RelaxedPrecision 
					                                              OpDecorate %237 RelaxedPrecision 
					                                              OpDecorate %240 RelaxedPrecision 
					                                              OpDecorate %241 RelaxedPrecision 
					                                              OpDecorate %242 RelaxedPrecision 
					                                              OpDecorate %243 RelaxedPrecision 
					                                              OpDecorate %244 RelaxedPrecision 
					                                              OpDecorate %245 RelaxedPrecision 
					                                              OpDecorate %246 RelaxedPrecision 
					                                              OpDecorate %247 RelaxedPrecision 
					                                              OpDecorate %248 RelaxedPrecision 
					                                              OpDecorate %251 RelaxedPrecision 
					                                              OpDecorate %253 RelaxedPrecision 
					                                              OpDecorate %254 RelaxedPrecision 
					                                              OpDecorate %255 RelaxedPrecision 
					                                              OpDecorate %256 RelaxedPrecision 
					                                              OpDecorate %257 RelaxedPrecision 
					                                              OpDecorate %258 RelaxedPrecision 
					                                              OpDecorate %259 RelaxedPrecision 
					                                              OpDecorate %260 RelaxedPrecision 
					                                              OpDecorate %261 RelaxedPrecision 
					                                              OpDecorate %262 RelaxedPrecision 
					                                              OpDecorate %263 RelaxedPrecision 
					                                              OpDecorate %264 RelaxedPrecision 
					                                              OpDecorate %265 RelaxedPrecision 
					                                              OpDecorate %266 RelaxedPrecision 
					                                              OpDecorate %267 RelaxedPrecision 
					                                              OpDecorate %268 RelaxedPrecision 
					                                              OpDecorate %269 RelaxedPrecision 
					                                              OpDecorate %271 RelaxedPrecision 
					                                              OpDecorate %272 RelaxedPrecision 
					                                              OpDecorate %273 RelaxedPrecision 
					                                              OpDecorate %275 RelaxedPrecision 
					                                              OpDecorate %276 RelaxedPrecision 
					                                              OpDecorate %279 RelaxedPrecision 
					                                              OpDecorate %280 RelaxedPrecision 
					                                              OpDecorate %281 RelaxedPrecision 
					                                              OpDecorate %282 RelaxedPrecision 
					                                              OpDecorate %283 RelaxedPrecision 
					                                              OpDecorate %284 RelaxedPrecision 
					                                              OpDecorate %285 RelaxedPrecision 
					                                              OpDecorate %286 RelaxedPrecision 
					                                              OpDecorate %287 RelaxedPrecision 
					                                              OpDecorate %290 RelaxedPrecision 
					                                              OpDecorate %293 RelaxedPrecision 
					                                              OpDecorate %293 Location 293 
					                                              OpDecorate %302 RelaxedPrecision 
					                                              OpDecorate %303 RelaxedPrecision 
					                                              OpDecorate %304 RelaxedPrecision 
					                                              OpDecorate %305 RelaxedPrecision 
					                                              OpDecorate %306 RelaxedPrecision 
					                                              OpDecorate %307 RelaxedPrecision 
					                                              OpDecorate %308 RelaxedPrecision 
					                                              OpDecorate %309 RelaxedPrecision 
					                                              OpDecorate %310 RelaxedPrecision 
					                                              OpDecorate %311 RelaxedPrecision 
					                                              OpDecorate %312 RelaxedPrecision 
					                                              OpDecorate %313 RelaxedPrecision 
					                                              OpDecorate %314 RelaxedPrecision 
					                                              OpDecorate %315 RelaxedPrecision 
					                                              OpDecorate %316 RelaxedPrecision 
					                                              OpDecorate %317 RelaxedPrecision 
					                                              OpDecorate %318 RelaxedPrecision 
					                                              OpDecorate %319 RelaxedPrecision 
					                                              OpDecorate %320 RelaxedPrecision 
					                                              OpDecorate %321 RelaxedPrecision 
					                                              OpDecorate %322 RelaxedPrecision 
					                                              OpDecorate %324 RelaxedPrecision 
					                                              OpDecorate %325 RelaxedPrecision 
					                                              OpDecorate %328 RelaxedPrecision 
					                                              OpDecorate %329 RelaxedPrecision 
					                                              OpDecorate %332 RelaxedPrecision 
					                                              OpDecorate %333 RelaxedPrecision 
					                                              OpDecorate %334 RelaxedPrecision 
					                                              OpDecorate %335 RelaxedPrecision 
					                                              OpDecorate %336 RelaxedPrecision 
					                                              OpDecorate %337 RelaxedPrecision 
					                                              OpDecorate %339 RelaxedPrecision 
					                                              OpDecorate %340 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 3 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_3* %9 = OpVariable Private 
					                                      %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %11 = OpTypePointer UniformConstant %10 
					 UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                      %14 = OpTypeSampler 
					                                      %15 = OpTypePointer UniformConstant %14 
					             UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                      %18 = OpTypeSampledImage %10 
					                                      %20 = OpTypeVector %6 2 
					                                      %21 = OpTypePointer Input %20 
					                Input f32_2* vs_TEXCOORD2 = OpVariable Input 
					                                      %24 = OpTypeVector %6 4 
					                                      %27 = OpTypePointer Private %6 
					                         Private f32* %28 = OpVariable Private 
					                                      %32 = OpTypeBool 
					                                      %33 = OpTypePointer Private %32 
					                        Private bool* %34 = OpVariable Private 
					                                  f32 %36 = OpConstant 3,674022E-40 
					                                  f32 %39 = OpConstant 3,674022E-40 
					                                  f32 %40 = OpConstant 3,674022E-40 
					                                      %42 = OpTypePointer Private %24 
					                       Private f32_4* %43 = OpVariable Private 
					                                  f32 %45 = OpConstant 3,674022E-40 
					                                f32_3 %46 = OpConstantComposite %45 %45 %45 
					                       Private f32_4* %53 = OpVariable Private 
					                                      %56 = OpTypeInt 32 0 
					                                  u32 %57 = OpConstant 4 
					                                      %58 = OpTypeArray %24 %57 
					                                      %59 = OpTypeStruct %58 %24 
					                                      %60 = OpTypePointer Uniform %59 
					   Uniform struct {f32_4[4]; f32_4;}* %61 = OpVariable Uniform 
					                                      %62 = OpTypeInt 32 1 
					                                  i32 %63 = OpConstant 0 
					                                  i32 %64 = OpConstant 1 
					                                      %65 = OpTypePointer Uniform %24 
					                                  i32 %83 = OpConstant 2 
					                                  u32 %95 = OpConstant 0 
					                                      %96 = OpTypePointer Uniform %6 
					                                 u32 %100 = OpConstant 1 
					                      Private f32_4* %102 = OpVariable Private 
					                                 f32 %106 = OpConstant 3,674022E-40 
					                                 f32 %107 = OpConstant 3,674022E-40 
					                                 f32 %108 = OpConstant 3,674022E-40 
					                                 f32 %109 = OpConstant 3,674022E-40 
					                               f32_4 %110 = OpConstantComposite %106 %107 %108 %109 
					                      Private f32_4* %121 = OpVariable Private 
					UniformConstant read_only Texture2D* %122 = OpVariable UniformConstant 
					            UniformConstant sampler* %124 = OpVariable UniformConstant 
					                      Private f32_4* %130 = OpVariable Private 
					                      Private f32_3* %137 = OpVariable Private 
					                               f32_3 %141 = OpConstantComposite %39 %39 %39 
					                        Private f32* %148 = OpVariable Private 
					                                 f32 %151 = OpConstant 3,674022E-40 
					                                 f32 %154 = OpConstant 3,674022E-40 
					                                 f32 %157 = OpConstant 3,674022E-40 
					                        Private f32* %159 = OpVariable Private 
					                                 f32 %161 = OpConstant 3,674022E-40 
					                                 f32 %163 = OpConstant 3,674022E-40 
					                                 f32 %172 = OpConstant 3,674022E-40 
					                        Private f32* %175 = OpVariable Private 
					                        Private f32* %181 = OpVariable Private 
					                                 f32 %189 = OpConstant 3,674022E-40 
					                      Private f32_4* %199 = OpVariable Private 
					                      Private f32_3* %206 = OpVariable Private 
					                        Private f32* %211 = OpVariable Private 
					                        Private f32* %259 = OpVariable Private 
					                                 f32 %270 = OpConstant 3,674022E-40 
					                                     %292 = OpTypePointer Output %24 
					                       Output f32_4* %293 = OpVariable Output 
					                                 f32 %296 = OpConstant 3,674022E-40 
					                               f32_3 %297 = OpConstantComposite %296 %296 %296 
					                        Private f32* %302 = OpVariable Private 
					                        Private f32* %309 = OpVariable Private 
					                                     %341 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                  read_only Texture2D %13 = OpLoad %12 
					                              sampler %17 = OpLoad %16 
					           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                f32_2 %23 = OpLoad vs_TEXCOORD2 
					                                f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                                f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                              OpStore %9 %26 
					                                f32_3 %29 = OpLoad %9 
					                                f32_3 %30 = OpLoad %9 
					                                  f32 %31 = OpDot %29 %30 
					                                              OpStore %28 %31 
					                                  f32 %35 = OpLoad %28 
					                                 bool %37 = OpFOrdNotEqual %35 %36 
					                                              OpStore %34 %37 
					                                 bool %38 = OpLoad %34 
					                                  f32 %41 = OpSelect %38 %39 %40 
					                                              OpStore %28 %41 
					                                f32_3 %44 = OpLoad %9 
					                                f32_3 %47 = OpFMul %44 %46 
					                                  f32 %48 = OpLoad %28 
					                                f32_3 %49 = OpCompositeConstruct %48 %48 %48 
					                                f32_3 %50 = OpFAdd %47 %49 
					                                f32_4 %51 = OpLoad %43 
					                                f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
					                                              OpStore %43 %52 
					                                f32_4 %54 = OpLoad %43 
					                                f32_3 %55 = OpVectorShuffle %54 %54 1 1 1 
					                       Uniform f32_4* %66 = OpAccessChain %61 %63 %64 
					                                f32_4 %67 = OpLoad %66 
					                                f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
					                                f32_3 %69 = OpFMul %55 %68 
					                                f32_4 %70 = OpLoad %53 
					                                f32_4 %71 = OpVectorShuffle %70 %69 4 5 6 3 
					                                              OpStore %53 %71 
					                       Uniform f32_4* %72 = OpAccessChain %61 %63 %63 
					                                f32_4 %73 = OpLoad %72 
					                                f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
					                                f32_4 %75 = OpLoad %43 
					                                f32_3 %76 = OpVectorShuffle %75 %75 0 0 0 
					                                f32_3 %77 = OpFMul %74 %76 
					                                f32_4 %78 = OpLoad %53 
					                                f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
					                                f32_3 %80 = OpFAdd %77 %79 
					                                f32_4 %81 = OpLoad %43 
					                                f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 6 
					                                              OpStore %43 %82 
					                       Uniform f32_4* %84 = OpAccessChain %61 %63 %83 
					                                f32_4 %85 = OpLoad %84 
					                                f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
					                                f32_4 %87 = OpLoad %43 
					                                f32_3 %88 = OpVectorShuffle %87 %87 2 2 2 
					                                f32_3 %89 = OpFMul %86 %88 
					                                f32_4 %90 = OpLoad %43 
					                                f32_3 %91 = OpVectorShuffle %90 %90 0 1 3 
					                                f32_3 %92 = OpFAdd %89 %91 
					                                f32_4 %93 = OpLoad %43 
					                                f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
					                                              OpStore %43 %94 
					                         Uniform f32* %97 = OpAccessChain %61 %64 %95 
					                                  f32 %98 = OpLoad %97 
					                         Private f32* %99 = OpAccessChain %53 %95 
					                                              OpStore %99 %98 
					                        Private f32* %101 = OpAccessChain %53 %100 
					                                              OpStore %101 %36 
					                               f32_4 %103 = OpLoad %53 
					                               f32_4 %104 = OpVectorShuffle %103 %103 0 1 0 1 
					                               f32_4 %105 = OpFNegate %104 
					                               f32_4 %111 = OpFMul %105 %110 
					                               f32_2 %112 = OpLoad vs_TEXCOORD2 
					                               f32_4 %113 = OpVectorShuffle %112 %112 0 1 0 1 
					                               f32_4 %114 = OpFAdd %111 %113 
					                                              OpStore %102 %114 
					                               f32_4 %115 = OpLoad %53 
					                               f32_4 %116 = OpVectorShuffle %115 %115 0 1 0 1 
					                               f32_4 %117 = OpFMul %116 %110 
					                               f32_2 %118 = OpLoad vs_TEXCOORD2 
					                               f32_4 %119 = OpVectorShuffle %118 %118 0 1 0 1 
					                               f32_4 %120 = OpFAdd %117 %119 
					                                              OpStore %53 %120 
					                 read_only Texture2D %123 = OpLoad %122 
					                             sampler %125 = OpLoad %124 
					          read_only Texture2DSampled %126 = OpSampledImage %123 %125 
					                               f32_4 %127 = OpLoad %102 
					                               f32_2 %128 = OpVectorShuffle %127 %127 0 1 
					                               f32_4 %129 = OpImageSampleImplicitLod %126 %128 
					                                              OpStore %121 %129 
					                 read_only Texture2D %131 = OpLoad %122 
					                             sampler %132 = OpLoad %124 
					          read_only Texture2DSampled %133 = OpSampledImage %131 %132 
					                               f32_4 %134 = OpLoad %102 
					                               f32_2 %135 = OpVectorShuffle %134 %134 2 3 
					                               f32_4 %136 = OpImageSampleImplicitLod %133 %135 
					                                              OpStore %130 %136 
					                               f32_4 %138 = OpLoad %121 
					                               f32_3 %139 = OpVectorShuffle %138 %138 1 2 3 
					                               f32_3 %140 = OpFMul %139 %46 
					                               f32_3 %142 = OpFAdd %140 %141 
					                                              OpStore %137 %142 
					                               f32_4 %143 = OpLoad %43 
					                               f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
					                               f32_3 %145 = OpLoad %137 
					                                 f32 %146 = OpDot %144 %145 
					                        Private f32* %147 = OpAccessChain %137 %95 
					                                              OpStore %147 %146 
					                        Private f32* %149 = OpAccessChain %137 %95 
					                                 f32 %150 = OpLoad %149 
					                                 f32 %152 = OpFAdd %150 %151 
					                                              OpStore %148 %152 
					                                 f32 %153 = OpLoad %148 
					                                 f32 %155 = OpFMul %153 %154 
					                                              OpStore %148 %155 
					                                 f32 %156 = OpLoad %148 
					                                 f32 %158 = OpExtInst %1 43 %156 %36 %157 
					                                              OpStore %148 %158 
					                                 f32 %160 = OpLoad %148 
					                                 f32 %162 = OpFMul %160 %161 
					                                 f32 %164 = OpFAdd %162 %163 
					                                              OpStore %159 %164 
					                                 f32 %165 = OpLoad %148 
					                                 f32 %166 = OpLoad %148 
					                                 f32 %167 = OpFMul %165 %166 
					                                              OpStore %148 %167 
					                                 f32 %168 = OpLoad %148 
					                                 f32 %169 = OpLoad %159 
					                                 f32 %170 = OpFMul %168 %169 
					                                              OpStore %148 %170 
					                                 f32 %171 = OpLoad %148 
					                                 f32 %173 = OpFMul %171 %172 
					                        Private f32* %174 = OpAccessChain %137 %95 
					                                              OpStore %174 %173 
					                        Private f32* %176 = OpAccessChain %121 %95 
					                                 f32 %177 = OpLoad %176 
					                        Private f32* %178 = OpAccessChain %137 %95 
					                                 f32 %179 = OpLoad %178 
					                                 f32 %180 = OpFMul %177 %179 
					                                              OpStore %175 %180 
					                 read_only Texture2D %182 = OpLoad %122 
					                             sampler %183 = OpLoad %124 
					          read_only Texture2DSampled %184 = OpSampledImage %182 %183 
					                               f32_2 %185 = OpLoad vs_TEXCOORD2 
					                               f32_4 %186 = OpImageSampleImplicitLod %184 %185 
					                                 f32 %187 = OpCompositeExtract %186 0 
					                                              OpStore %181 %187 
					                                 f32 %188 = OpLoad %181 
					                                 f32 %190 = OpFMul %188 %189 
					                                 f32 %191 = OpLoad %175 
					                                 f32 %192 = OpFAdd %190 %191 
					                                              OpStore %175 %192 
					                 read_only Texture2D %193 = OpLoad %122 
					                             sampler %194 = OpLoad %124 
					          read_only Texture2DSampled %195 = OpSampledImage %193 %194 
					                               f32_4 %196 = OpLoad %53 
					                               f32_2 %197 = OpVectorShuffle %196 %196 0 1 
					                               f32_4 %198 = OpImageSampleImplicitLod %195 %197 
					                                              OpStore %121 %198 
					                 read_only Texture2D %200 = OpLoad %122 
					                             sampler %201 = OpLoad %124 
					          read_only Texture2DSampled %202 = OpSampledImage %200 %201 
					                               f32_4 %203 = OpLoad %53 
					                               f32_2 %204 = OpVectorShuffle %203 %203 2 3 
					                               f32_4 %205 = OpImageSampleImplicitLod %202 %204 
					                                              OpStore %199 %205 
					                               f32_4 %207 = OpLoad %121 
					                               f32_3 %208 = OpVectorShuffle %207 %207 1 2 3 
					                               f32_3 %209 = OpFMul %208 %46 
					                               f32_3 %210 = OpFAdd %209 %141 
					                                              OpStore %206 %210 
					                               f32_4 %212 = OpLoad %43 
					                               f32_3 %213 = OpVectorShuffle %212 %212 0 1 2 
					                               f32_3 %214 = OpLoad %206 
					                                 f32 %215 = OpDot %213 %214 
					                                              OpStore %211 %215 
					                                 f32 %216 = OpLoad %211 
					                                 f32 %217 = OpFAdd %216 %151 
					                                              OpStore %148 %217 
					                                 f32 %218 = OpLoad %148 
					                                 f32 %219 = OpFMul %218 %154 
					                                              OpStore %148 %219 
					                                 f32 %220 = OpLoad %148 
					                                 f32 %221 = OpExtInst %1 43 %220 %36 %157 
					                                              OpStore %148 %221 
					                                 f32 %222 = OpLoad %148 
					                                 f32 %223 = OpFMul %222 %161 
					                                 f32 %224 = OpFAdd %223 %163 
					                                              OpStore %159 %224 
					                                 f32 %225 = OpLoad %148 
					                                 f32 %226 = OpLoad %148 
					                                 f32 %227 = OpFMul %225 %226 
					                                              OpStore %148 %227 
					                                 f32 %228 = OpLoad %148 
					                                 f32 %229 = OpLoad %159 
					                                 f32 %230 = OpFMul %228 %229 
					                                              OpStore %148 %230 
					                                 f32 %231 = OpLoad %148 
					                                 f32 %232 = OpFMul %231 %172 
					                                              OpStore %211 %232 
					                                 f32 %233 = OpLoad %148 
					                                 f32 %234 = OpFMul %233 %172 
					                        Private f32* %235 = OpAccessChain %137 %95 
					                                 f32 %236 = OpLoad %235 
					                                 f32 %237 = OpFAdd %234 %236 
					                        Private f32* %238 = OpAccessChain %137 %95 
					                                              OpStore %238 %237 
					                        Private f32* %239 = OpAccessChain %121 %95 
					                                 f32 %240 = OpLoad %239 
					                                 f32 %241 = OpLoad %211 
					                                 f32 %242 = OpFMul %240 %241 
					                                 f32 %243 = OpLoad %175 
					                                 f32 %244 = OpFAdd %242 %243 
					                                              OpStore %175 %244 
					                               f32_4 %245 = OpLoad %130 
					                               f32_3 %246 = OpVectorShuffle %245 %245 1 2 3 
					                               f32_3 %247 = OpFMul %246 %46 
					                               f32_3 %248 = OpFAdd %247 %141 
					                                              OpStore %206 %248 
					                               f32_4 %249 = OpLoad %43 
					                               f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
					                               f32_3 %251 = OpLoad %206 
					                                 f32 %252 = OpDot %250 %251 
					                                              OpStore %211 %252 
					                                 f32 %253 = OpLoad %211 
					                                 f32 %254 = OpFAdd %253 %151 
					                                              OpStore %148 %254 
					                                 f32 %255 = OpLoad %148 
					                                 f32 %256 = OpFMul %255 %154 
					                                              OpStore %148 %256 
					                                 f32 %257 = OpLoad %148 
					                                 f32 %258 = OpExtInst %1 43 %257 %36 %157 
					                                              OpStore %148 %258 
					                                 f32 %260 = OpLoad %148 
					                                 f32 %261 = OpFMul %260 %161 
					                                 f32 %262 = OpFAdd %261 %163 
					                                              OpStore %259 %262 
					                                 f32 %263 = OpLoad %148 
					                                 f32 %264 = OpLoad %148 
					                                 f32 %265 = OpFMul %263 %264 
					                                              OpStore %148 %265 
					                                 f32 %266 = OpLoad %148 
					                                 f32 %267 = OpLoad %259 
					                                 f32 %268 = OpFMul %266 %267 
					                                              OpStore %148 %268 
					                                 f32 %269 = OpLoad %148 
					                                 f32 %271 = OpFMul %269 %270 
					                                              OpStore %211 %271 
					                                 f32 %272 = OpLoad %148 
					                                 f32 %273 = OpFMul %272 %270 
					                        Private f32* %274 = OpAccessChain %137 %95 
					                                 f32 %275 = OpLoad %274 
					                                 f32 %276 = OpFAdd %273 %275 
					                        Private f32* %277 = OpAccessChain %137 %95 
					                                              OpStore %277 %276 
					                        Private f32* %278 = OpAccessChain %130 %95 
					                                 f32 %279 = OpLoad %278 
					                                 f32 %280 = OpLoad %211 
					                                 f32 %281 = OpFMul %279 %280 
					                                 f32 %282 = OpLoad %175 
					                                 f32 %283 = OpFAdd %281 %282 
					                                              OpStore %175 %283 
					                               f32_4 %284 = OpLoad %199 
					                               f32_3 %285 = OpVectorShuffle %284 %284 1 2 3 
					                               f32_3 %286 = OpFMul %285 %46 
					                               f32_3 %287 = OpFAdd %286 %141 
					                                              OpStore %206 %287 
					                               f32_4 %288 = OpLoad %43 
					                               f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
					                               f32_3 %290 = OpLoad %206 
					                                 f32 %291 = OpDot %289 %290 
					                                              OpStore %211 %291 
					                               f32_4 %294 = OpLoad %43 
					                               f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
					                               f32_3 %298 = OpFMul %295 %297 
					                               f32_3 %299 = OpFAdd %298 %297 
					                               f32_4 %300 = OpLoad %293 
					                               f32_4 %301 = OpVectorShuffle %300 %299 0 4 5 6 
					                                              OpStore %293 %301 
					                                 f32 %303 = OpLoad %211 
					                                 f32 %304 = OpFAdd %303 %151 
					                                              OpStore %302 %304 
					                                 f32 %305 = OpLoad %302 
					                                 f32 %306 = OpFMul %305 %154 
					                                              OpStore %302 %306 
					                                 f32 %307 = OpLoad %302 
					                                 f32 %308 = OpExtInst %1 43 %307 %36 %157 
					                                              OpStore %302 %308 
					                                 f32 %310 = OpLoad %302 
					                                 f32 %311 = OpFMul %310 %161 
					                                 f32 %312 = OpFAdd %311 %163 
					                                              OpStore %309 %312 
					                                 f32 %313 = OpLoad %302 
					                                 f32 %314 = OpLoad %302 
					                                 f32 %315 = OpFMul %313 %314 
					                                              OpStore %302 %315 
					                                 f32 %316 = OpLoad %302 
					                                 f32 %317 = OpLoad %309 
					                                 f32 %318 = OpFMul %316 %317 
					                                              OpStore %302 %318 
					                                 f32 %319 = OpLoad %302 
					                                 f32 %320 = OpFMul %319 %270 
					                                              OpStore %211 %320 
					                                 f32 %321 = OpLoad %302 
					                                 f32 %322 = OpFMul %321 %270 
					                        Private f32* %323 = OpAccessChain %137 %95 
					                                 f32 %324 = OpLoad %323 
					                                 f32 %325 = OpFAdd %322 %324 
					                        Private f32* %326 = OpAccessChain %137 %95 
					                                              OpStore %326 %325 
					                        Private f32* %327 = OpAccessChain %137 %95 
					                                 f32 %328 = OpLoad %327 
					                                 f32 %329 = OpFAdd %328 %189 
					                        Private f32* %330 = OpAccessChain %137 %95 
					                                              OpStore %330 %329 
					                        Private f32* %331 = OpAccessChain %199 %95 
					                                 f32 %332 = OpLoad %331 
					                                 f32 %333 = OpLoad %211 
					                                 f32 %334 = OpFMul %332 %333 
					                                 f32 %335 = OpLoad %175 
					                                 f32 %336 = OpFAdd %334 %335 
					                                              OpStore %175 %336 
					                                 f32 %337 = OpLoad %175 
					                        Private f32* %338 = OpAccessChain %137 %95 
					                                 f32 %339 = OpLoad %338 
					                                 f32 %340 = OpFDiv %337 %339 
					                         Output f32* %342 = OpAccessChain %293 %95 
					                                              OpStore %342 %340 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_1_0[14];
						mat4x4 unity_WorldToCamera;
						vec4 unused_1_2[4];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraGBufferTexture2;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					float u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					float u_xlat5;
					float u_xlat6;
					vec3 u_xlat16_6;
					float u_xlat7;
					vec3 u_xlat16_7;
					float u_xlat8;
					vec3 u_xlat16_8;
					float u_xlat12;
					float u_xlat13;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat10_0 = texture(_CameraGBufferTexture2, vs_TEXCOORD2.xy);
					    u_xlat15 = dot(u_xlat10_0.xyz, u_xlat10_0.xyz);
					    u_xlatb15 = u_xlat15!=0.0;
					    u_xlat15 = (u_xlatb15) ? -1.0 : -0.0;
					    u_xlat0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(u_xlat15);
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToCamera[1].xyz;
					    u_xlat0.xyw = unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat1.x = _MainTex_TexelSize.x;
					    u_xlat1.y = 0.0;
					    u_xlat2 = (-u_xlat1.xyxy) * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD2.xyxy;
					    u_xlat1 = u_xlat1.xyxy * vec4(2.76923084, 1.38461542, 6.46153831, 3.23076916) + vs_TEXCOORD2.xyxy;
					    u_xlat10_3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat10_2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat16_8.xyz);
					    u_xlat15 = u_xlat15 + -0.800000012;
					    u_xlat15 = u_xlat15 * 5.00000048;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat8 = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = u_xlat15 * u_xlat8;
					    u_xlat15 = u_xlat15 * 0.31621623;
					    u_xlat3 = u_xlat15 * u_xlat10_3.x;
					    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat3 = u_xlat10_4.x * 0.227027029 + u_xlat3;
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_8.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat8 = dot(u_xlat0.xyz, u_xlat16_8.xyz);
					    u_xlat8 = u_xlat8 + -0.800000012;
					    u_xlat8 = u_xlat8 * 5.00000048;
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat13 = u_xlat8 * -2.0 + 3.0;
					    u_xlat8 = u_xlat8 * u_xlat8;
					    u_xlat8 = u_xlat8 * u_xlat13;
					    u_xlat13 = u_xlat8 * 0.31621623;
					    u_xlat15 = u_xlat8 * 0.31621623 + u_xlat15;
					    u_xlat3 = u_xlat10_4.x * u_xlat13 + u_xlat3;
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat7 = dot(u_xlat0.xyz, u_xlat16_7.xyz);
					    u_xlat7 = u_xlat7 + -0.800000012;
					    u_xlat7 = u_xlat7 * 5.00000048;
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = u_xlat7 * -2.0 + 3.0;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat7 = u_xlat7 * u_xlat12;
					    u_xlat12 = u_xlat7 * 0.0702702701;
					    u_xlat15 = u_xlat7 * 0.0702702701 + u_xlat15;
					    u_xlat2.x = u_xlat10_2.x * u_xlat12 + u_xlat3;
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat16_6.xyz);
					    SV_Target0.yzw = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat0.x = u_xlat6 + -0.800000012;
					    u_xlat0.x = u_xlat0.x * 5.00000048;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat5;
					    u_xlat5 = u_xlat0.x * 0.0702702701;
					    u_xlat0.x = u_xlat0.x * 0.0702702701 + u_xlat15;
					    u_xlat0.x = u_xlat0.x + 0.227027029;
					    u_xlat5 = u_xlat10_1.x * u_xlat5 + u_xlat2.x;
					    SV_Target0.x = u_xlat5 / u_xlat0.x;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 359305
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    u_xlat0.xyz = in_TEXCOORD0.xyx;
					    phase0_Output0_1 = u_xlat0;
					    vs_TEXCOORD2.xy = u_xlat0.zw;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	float _Downsample;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec3 u_xlat16_6;
					vec3 u_xlat16_7;
					vec3 u_xlat16_8;
					vec3 u_xlat16_9;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat16_12;
					float u_xlat16_17;
					void main()
					{
					    u_xlat0.x = _MainTex_TexelSize.y / _Downsample;
					    u_xlat0.y = float(1.38461542);
					    u_xlat0.z = float(3.23076916);
					    u_xlat1 = vec4(-0.0, -2.76923084, -0.0, -6.46153831) * u_xlat0.yxzx + vs_TEXCOORD2.xyxy;
					    u_xlat0 = vec4(0.0, 2.76923084, 0.0, 6.46153831) * u_xlat0.yxzx + vs_TEXCOORD2.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_7.x = dot(u_xlat16_8.xyz, u_xlat16_7.xyz);
					    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
					    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
					    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
					    u_xlat16_12 = u_xlat16_7.x * -2.0 + 3.0;
					    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
					    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_12;
					    u_xlat16_7.x = u_xlat16_7.x * 0.31621623;
					    u_xlat16_2 = u_xlat16_7.x * u_xlat10_2.x;
					    u_xlat16_2 = u_xlat10_3.x * 0.227027029 + u_xlat16_2;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_9.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_12 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
					    u_xlat16_12 = u_xlat16_12 + -0.800000012;
					    u_xlat16_12 = u_xlat16_12 * 5.00000048;
					    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
					    u_xlat16_17 = u_xlat16_12 * -2.0 + 3.0;
					    u_xlat16_12 = u_xlat16_12 * u_xlat16_12;
					    u_xlat16_12 = u_xlat16_12 * u_xlat16_17;
					    u_xlat16_17 = u_xlat16_12 * 0.31621623;
					    u_xlat16_7.x = u_xlat16_12 * 0.31621623 + u_xlat16_7.x;
					    u_xlat16_2 = u_xlat10_4.x * u_xlat16_17 + u_xlat16_2;
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_6.x = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
					    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
					    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
					    u_xlat16_11 = u_xlat16_6.x * -2.0 + 3.0;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_11;
					    u_xlat16_11 = u_xlat16_6.x * 0.0702702701;
					    u_xlat16_6.x = u_xlat16_6.x * 0.0702702701 + u_xlat16_7.x;
					    u_xlat16_1 = u_xlat10_1.x * u_xlat16_11 + u_xlat16_2;
					    u_xlat16_5.xyz = u_xlat10_0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.x = dot(u_xlat16_8.xyz, u_xlat16_5.xyz);
					    SV_Target0.yzw = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat16_5.x = u_xlat16_5.x + -0.800000012;
					    u_xlat16_5.x = u_xlat16_5.x * 5.00000048;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_10 = u_xlat16_5.x * -2.0 + 3.0;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_10;
					    u_xlat16_10 = u_xlat16_5.x * 0.0702702701;
					    u_xlat16_5.x = u_xlat16_5.x * 0.0702702701 + u_xlat16_6.x;
					    u_xlat16_5.x = u_xlat16_5.x + 0.227027029;
					    u_xlat16_0 = u_xlat10_0.x * u_xlat16_10 + u_xlat16_1;
					    SV_Target0.x = u_xlat16_0 / u_xlat16_5.x;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %115 %128 %131 
					                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 Location 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 128 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 Location 131 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                                            %100 = OpTypePointer Function %6 
					                             Private f32_4* %109 = OpVariable Private 
					                                        u32 %111 = OpConstant 3 
					                                            %113 = OpTypeVector %6 2 
					                                            %114 = OpTypePointer Output %113 
					                      Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                            %117 = OpTypePointer Output %6 
					                                            %119 = OpTypeVector %6 3 
					                                        u32 %124 = OpConstant 0 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %101 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                        bool %99 = OpLoad %84 
					                                                     OpSelectionMerge %103 None 
					                                                     OpBranchConditional %99 %102 %105 
					                                            %102 = OpLabel 
					                                        f32 %104 = OpLoad %91 
					                                                     OpStore %101 %104 
					                                                     OpBranch %103 
					                                            %105 = OpLabel 
					                                 Input f32* %106 = OpAccessChain %92 %68 
					                                        f32 %107 = OpLoad %106 
					                                                     OpStore %101 %107 
					                                                     OpBranch %103 
					                                            %103 = OpLabel 
					                                        f32 %108 = OpLoad %101 
					                                                     OpStore %91 %108 
					                                        f32 %110 = OpLoad %91 
					                               Private f32* %112 = OpAccessChain %109 %111 
					                                                     OpStore %112 %110 
					                                        f32 %116 = OpLoad %91 
					                                Output f32* %118 = OpAccessChain vs_TEXCOORD2 %68 
					                                                     OpStore %118 %116 
					                                      f32_4 %120 = OpLoad %92 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 1 0 
					                                      f32_4 %122 = OpLoad %109 
					                                      f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
					                                                     OpStore %109 %123 
					                                 Input f32* %125 = OpAccessChain %92 %124 
					                                        f32 %126 = OpLoad %125 
					                                Output f32* %127 = OpAccessChain vs_TEXCOORD2 %124 
					                                                     OpStore %127 %126 
					                                      f32_4 %129 = OpLoad %109 
					                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                                     OpStore vs_TEXCOORD0 %130 
					                                      f32_4 %132 = OpLoad %109 
					                                      f32_2 %133 = OpVectorShuffle %132 %132 2 3 
					                                                     OpStore vs_TEXCOORD1 %133 
					                                Output f32* %134 = OpAccessChain %72 %22 %68 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %72 %22 %68 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 290
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %42 %240 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpMemberDecorate %10 1 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD2 Location 42 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %56 RelaxedPrecision 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %59 DescriptorSet 59 
					                                             OpDecorate %59 Binding 59 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %63 DescriptorSet 63 
					                                             OpDecorate %63 Binding 63 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %72 RelaxedPrecision 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %121 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %123 RelaxedPrecision 
					                                             OpDecorate %124 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %130 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %135 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %158 RelaxedPrecision 
					                                             OpDecorate %159 RelaxedPrecision 
					                                             OpDecorate %160 RelaxedPrecision 
					                                             OpDecorate %161 RelaxedPrecision 
					                                             OpDecorate %162 RelaxedPrecision 
					                                             OpDecorate %163 RelaxedPrecision 
					                                             OpDecorate %164 RelaxedPrecision 
					                                             OpDecorate %165 RelaxedPrecision 
					                                             OpDecorate %166 RelaxedPrecision 
					                                             OpDecorate %167 RelaxedPrecision 
					                                             OpDecorate %168 RelaxedPrecision 
					                                             OpDecorate %169 RelaxedPrecision 
					                                             OpDecorate %170 RelaxedPrecision 
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
					                                             OpDecorate %184 RelaxedPrecision 
					                                             OpDecorate %185 RelaxedPrecision 
					                                             OpDecorate %188 RelaxedPrecision 
					                                             OpDecorate %189 RelaxedPrecision 
					                                             OpDecorate %190 RelaxedPrecision 
					                                             OpDecorate %191 RelaxedPrecision 
					                                             OpDecorate %192 RelaxedPrecision 
					                                             OpDecorate %193 RelaxedPrecision 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %195 RelaxedPrecision 
					                                             OpDecorate %196 RelaxedPrecision 
					                                             OpDecorate %197 RelaxedPrecision 
					                                             OpDecorate %198 RelaxedPrecision 
					                                             OpDecorate %199 RelaxedPrecision 
					                                             OpDecorate %200 RelaxedPrecision 
					                                             OpDecorate %201 RelaxedPrecision 
					                                             OpDecorate %202 RelaxedPrecision 
					                                             OpDecorate %203 RelaxedPrecision 
					                                             OpDecorate %204 RelaxedPrecision 
					                                             OpDecorate %205 RelaxedPrecision 
					                                             OpDecorate %206 RelaxedPrecision 
					                                             OpDecorate %207 RelaxedPrecision 
					                                             OpDecorate %208 RelaxedPrecision 
					                                             OpDecorate %209 RelaxedPrecision 
					                                             OpDecorate %210 RelaxedPrecision 
					                                             OpDecorate %211 RelaxedPrecision 
					                                             OpDecorate %212 RelaxedPrecision 
					                                             OpDecorate %213 RelaxedPrecision 
					                                             OpDecorate %214 RelaxedPrecision 
					                                             OpDecorate %215 RelaxedPrecision 
					                                             OpDecorate %216 RelaxedPrecision 
					                                             OpDecorate %217 RelaxedPrecision 
					                                             OpDecorate %219 RelaxedPrecision 
					                                             OpDecorate %220 RelaxedPrecision 
					                                             OpDecorate %221 RelaxedPrecision 
					                                             OpDecorate %223 RelaxedPrecision 
					                                             OpDecorate %224 RelaxedPrecision 
					                                             OpDecorate %227 RelaxedPrecision 
					                                             OpDecorate %228 RelaxedPrecision 
					                                             OpDecorate %229 RelaxedPrecision 
					                                             OpDecorate %230 RelaxedPrecision 
					                                             OpDecorate %231 RelaxedPrecision 
					                                             OpDecorate %232 RelaxedPrecision 
					                                             OpDecorate %233 RelaxedPrecision 
					                                             OpDecorate %234 RelaxedPrecision 
					                                             OpDecorate %235 RelaxedPrecision 
					                                             OpDecorate %236 RelaxedPrecision 
					                                             OpDecorate %237 RelaxedPrecision 
					                                             OpDecorate %238 RelaxedPrecision 
					                                             OpDecorate %240 RelaxedPrecision 
					                                             OpDecorate %240 Location 240 
					                                             OpDecorate %241 RelaxedPrecision 
					                                             OpDecorate %244 RelaxedPrecision 
					                                             OpDecorate %245 RelaxedPrecision 
					                                             OpDecorate %248 RelaxedPrecision 
					                                             OpDecorate %249 RelaxedPrecision 
					                                             OpDecorate %250 RelaxedPrecision 
					                                             OpDecorate %251 RelaxedPrecision 
					                                             OpDecorate %252 RelaxedPrecision 
					                                             OpDecorate %253 RelaxedPrecision 
					                                             OpDecorate %254 RelaxedPrecision 
					                                             OpDecorate %255 RelaxedPrecision 
					                                             OpDecorate %256 RelaxedPrecision 
					                                             OpDecorate %257 RelaxedPrecision 
					                                             OpDecorate %258 RelaxedPrecision 
					                                             OpDecorate %259 RelaxedPrecision 
					                                             OpDecorate %260 RelaxedPrecision 
					                                             OpDecorate %261 RelaxedPrecision 
					                                             OpDecorate %262 RelaxedPrecision 
					                                             OpDecorate %263 RelaxedPrecision 
					                                             OpDecorate %264 RelaxedPrecision 
					                                             OpDecorate %265 RelaxedPrecision 
					                                             OpDecorate %266 RelaxedPrecision 
					                                             OpDecorate %267 RelaxedPrecision 
					                                             OpDecorate %268 RelaxedPrecision 
					                                             OpDecorate %270 RelaxedPrecision 
					                                             OpDecorate %271 RelaxedPrecision 
					                                             OpDecorate %274 RelaxedPrecision 
					                                             OpDecorate %275 RelaxedPrecision 
					                                             OpDecorate %278 RelaxedPrecision 
					                                             OpDecorate %279 RelaxedPrecision 
					                                             OpDecorate %280 RelaxedPrecision 
					                                             OpDecorate %281 RelaxedPrecision 
					                                             OpDecorate %282 RelaxedPrecision 
					                                             OpDecorate %283 RelaxedPrecision 
					                                             OpDecorate %285 RelaxedPrecision 
					                                             OpDecorate %286 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeStruct %7 %6 
					                                     %11 = OpTypePointer Uniform %10 
					       Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 0 
					                                     %15 = OpTypeInt 32 0 
					                                 u32 %16 = OpConstant 1 
					                                     %17 = OpTypePointer Uniform %6 
					                                 i32 %20 = OpConstant 1 
					                                 u32 %24 = OpConstant 0 
					                                     %25 = OpTypePointer Private %6 
					                                 f32 %27 = OpConstant 3,674022E-40 
					                                 f32 %29 = OpConstant 3,674022E-40 
					                                 u32 %30 = OpConstant 2 
					                      Private f32_4* %32 = OpVariable Private 
					                                 f32 %33 = OpConstant 3,674022E-40 
					                                 f32 %34 = OpConstant 3,674022E-40 
					                                 f32 %35 = OpConstant 3,674022E-40 
					                               f32_4 %36 = OpConstantComposite %33 %34 %33 %35 
					                                     %40 = OpTypeVector %6 2 
					                                     %41 = OpTypePointer Input %40 
					               Input f32_2* vs_TEXCOORD2 = OpVariable Input 
					                                 f32 %46 = OpConstant 3,674022E-40 
					                                 f32 %47 = OpConstant 3,674022E-40 
					                                 f32 %48 = OpConstant 3,674022E-40 
					                               f32_4 %49 = OpConstantComposite %46 %47 %46 %48 
					                      Private f32_4* %56 = OpVariable Private 
					                                     %57 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %58 = OpTypePointer UniformConstant %57 
					UniformConstant read_only Texture2D* %59 = OpVariable UniformConstant 
					                                     %61 = OpTypeSampler 
					                                     %62 = OpTypePointer UniformConstant %61 
					            UniformConstant sampler* %63 = OpVariable UniformConstant 
					                                     %65 = OpTypeSampledImage %57 
					                      Private f32_4* %70 = OpVariable Private 
					                                     %77 = OpTypeVector %6 3 
					                                     %78 = OpTypePointer Private %77 
					                      Private f32_3* %79 = OpVariable Private 
					                                 f32 %82 = OpConstant 3,674022E-40 
					                               f32_3 %83 = OpConstantComposite %82 %82 %82 
					                                 f32 %85 = OpConstant 3,674022E-40 
					                               f32_3 %86 = OpConstantComposite %85 %85 %85 
					                      Private f32_4* %88 = OpVariable Private 
					                      Private f32_3* %94 = OpVariable Private 
					                       Private f32* %103 = OpVariable Private 
					                                f32 %106 = OpConstant 3,674022E-40 
					                                f32 %109 = OpConstant 3,674022E-40 
					                                f32 %112 = OpConstant 3,674022E-40 
					                       Private f32* %114 = OpVariable Private 
					                                f32 %116 = OpConstant 3,674022E-40 
					                                f32 %118 = OpConstant 3,674022E-40 
					                                f32 %127 = OpConstant 3,674022E-40 
					                       Private f32* %130 = OpVariable Private 
					                                f32 %138 = OpConstant 3,674022E-40 
					                     Private f32_4* %148 = OpVariable Private 
					                     Private f32_3* %155 = OpVariable Private 
					                       Private f32* %160 = OpVariable Private 
					                       Private f32* %200 = OpVariable Private 
					                       Private f32* %207 = OpVariable Private 
					                                f32 %218 = OpConstant 3,674022E-40 
					                                    %239 = OpTypePointer Output %7 
					                      Output f32_4* %240 = OpVariable Output 
					                                f32 %242 = OpConstant 3,674022E-40 
					                              f32_3 %243 = OpConstantComposite %242 %242 %242 
					                       Private f32* %248 = OpVariable Private 
					                       Private f32* %255 = OpVariable Private 
					                                    %287 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                        Uniform f32* %18 = OpAccessChain %12 %14 %16 
					                                 f32 %19 = OpLoad %18 
					                        Uniform f32* %21 = OpAccessChain %12 %20 
					                                 f32 %22 = OpLoad %21 
					                                 f32 %23 = OpFDiv %19 %22 
					                        Private f32* %26 = OpAccessChain %9 %24 
					                                             OpStore %26 %23 
					                        Private f32* %28 = OpAccessChain %9 %16 
					                                             OpStore %28 %27 
					                        Private f32* %31 = OpAccessChain %9 %30 
					                                             OpStore %31 %29 
					                               f32_4 %37 = OpLoad %9 
					                               f32_4 %38 = OpVectorShuffle %37 %37 1 0 2 0 
					                               f32_4 %39 = OpFMul %36 %38 
					                               f32_2 %43 = OpLoad vs_TEXCOORD2 
					                               f32_4 %44 = OpVectorShuffle %43 %43 0 1 0 1 
					                               f32_4 %45 = OpFAdd %39 %44 
					                                             OpStore %32 %45 
					                               f32_4 %50 = OpLoad %9 
					                               f32_4 %51 = OpVectorShuffle %50 %50 1 0 2 0 
					                               f32_4 %52 = OpFMul %49 %51 
					                               f32_2 %53 = OpLoad vs_TEXCOORD2 
					                               f32_4 %54 = OpVectorShuffle %53 %53 0 1 0 1 
					                               f32_4 %55 = OpFAdd %52 %54 
					                                             OpStore %9 %55 
					                 read_only Texture2D %60 = OpLoad %59 
					                             sampler %64 = OpLoad %63 
					          read_only Texture2DSampled %66 = OpSampledImage %60 %64 
					                               f32_4 %67 = OpLoad %32 
					                               f32_2 %68 = OpVectorShuffle %67 %67 0 1 
					                               f32_4 %69 = OpImageSampleImplicitLod %66 %68 
					                                             OpStore %56 %69 
					                 read_only Texture2D %71 = OpLoad %59 
					                             sampler %72 = OpLoad %63 
					          read_only Texture2DSampled %73 = OpSampledImage %71 %72 
					                               f32_4 %74 = OpLoad %32 
					                               f32_2 %75 = OpVectorShuffle %74 %74 2 3 
					                               f32_4 %76 = OpImageSampleImplicitLod %73 %75 
					                                             OpStore %70 %76 
					                               f32_4 %80 = OpLoad %56 
					                               f32_3 %81 = OpVectorShuffle %80 %80 1 2 3 
					                               f32_3 %84 = OpFMul %81 %83 
					                               f32_3 %87 = OpFAdd %84 %86 
					                                             OpStore %79 %87 
					                 read_only Texture2D %89 = OpLoad %59 
					                             sampler %90 = OpLoad %63 
					          read_only Texture2DSampled %91 = OpSampledImage %89 %90 
					                               f32_2 %92 = OpLoad vs_TEXCOORD2 
					                               f32_4 %93 = OpImageSampleImplicitLod %91 %92 
					                                             OpStore %88 %93 
					                               f32_4 %95 = OpLoad %88 
					                               f32_3 %96 = OpVectorShuffle %95 %95 1 2 3 
					                               f32_3 %97 = OpFMul %96 %83 
					                               f32_3 %98 = OpFAdd %97 %86 
					                                             OpStore %94 %98 
					                               f32_3 %99 = OpLoad %94 
					                              f32_3 %100 = OpLoad %79 
					                                f32 %101 = OpDot %99 %100 
					                       Private f32* %102 = OpAccessChain %79 %24 
					                                             OpStore %102 %101 
					                       Private f32* %104 = OpAccessChain %79 %24 
					                                f32 %105 = OpLoad %104 
					                                f32 %107 = OpFAdd %105 %106 
					                                             OpStore %103 %107 
					                                f32 %108 = OpLoad %103 
					                                f32 %110 = OpFMul %108 %109 
					                                             OpStore %103 %110 
					                                f32 %111 = OpLoad %103 
					                                f32 %113 = OpExtInst %1 43 %111 %46 %112 
					                                             OpStore %103 %113 
					                                f32 %115 = OpLoad %103 
					                                f32 %117 = OpFMul %115 %116 
					                                f32 %119 = OpFAdd %117 %118 
					                                             OpStore %114 %119 
					                                f32 %120 = OpLoad %103 
					                                f32 %121 = OpLoad %103 
					                                f32 %122 = OpFMul %120 %121 
					                                             OpStore %103 %122 
					                                f32 %123 = OpLoad %103 
					                                f32 %124 = OpLoad %114 
					                                f32 %125 = OpFMul %123 %124 
					                                             OpStore %103 %125 
					                                f32 %126 = OpLoad %103 
					                                f32 %128 = OpFMul %126 %127 
					                       Private f32* %129 = OpAccessChain %79 %24 
					                                             OpStore %129 %128 
					                       Private f32* %131 = OpAccessChain %56 %24 
					                                f32 %132 = OpLoad %131 
					                       Private f32* %133 = OpAccessChain %79 %24 
					                                f32 %134 = OpLoad %133 
					                                f32 %135 = OpFMul %132 %134 
					                                             OpStore %130 %135 
					                       Private f32* %136 = OpAccessChain %88 %24 
					                                f32 %137 = OpLoad %136 
					                                f32 %139 = OpFMul %137 %138 
					                                f32 %140 = OpLoad %130 
					                                f32 %141 = OpFAdd %139 %140 
					                                             OpStore %130 %141 
					                read_only Texture2D %142 = OpLoad %59 
					                            sampler %143 = OpLoad %63 
					         read_only Texture2DSampled %144 = OpSampledImage %142 %143 
					                              f32_4 %145 = OpLoad %9 
					                              f32_2 %146 = OpVectorShuffle %145 %145 0 1 
					                              f32_4 %147 = OpImageSampleImplicitLod %144 %146 
					                                             OpStore %56 %147 
					                read_only Texture2D %149 = OpLoad %59 
					                            sampler %150 = OpLoad %63 
					         read_only Texture2DSampled %151 = OpSampledImage %149 %150 
					                              f32_4 %152 = OpLoad %9 
					                              f32_2 %153 = OpVectorShuffle %152 %152 2 3 
					                              f32_4 %154 = OpImageSampleImplicitLod %151 %153 
					                                             OpStore %148 %154 
					                              f32_4 %156 = OpLoad %56 
					                              f32_3 %157 = OpVectorShuffle %156 %156 1 2 3 
					                              f32_3 %158 = OpFMul %157 %83 
					                              f32_3 %159 = OpFAdd %158 %86 
					                                             OpStore %155 %159 
					                              f32_3 %161 = OpLoad %94 
					                              f32_3 %162 = OpLoad %155 
					                                f32 %163 = OpDot %161 %162 
					                                             OpStore %160 %163 
					                                f32 %164 = OpLoad %160 
					                                f32 %165 = OpFAdd %164 %106 
					                                             OpStore %103 %165 
					                                f32 %166 = OpLoad %103 
					                                f32 %167 = OpFMul %166 %109 
					                                             OpStore %103 %167 
					                                f32 %168 = OpLoad %103 
					                                f32 %169 = OpExtInst %1 43 %168 %46 %112 
					                                             OpStore %103 %169 
					                                f32 %170 = OpLoad %103 
					                                f32 %171 = OpFMul %170 %116 
					                                f32 %172 = OpFAdd %171 %118 
					                                             OpStore %114 %172 
					                                f32 %173 = OpLoad %103 
					                                f32 %174 = OpLoad %103 
					                                f32 %175 = OpFMul %173 %174 
					                                             OpStore %103 %175 
					                                f32 %176 = OpLoad %103 
					                                f32 %177 = OpLoad %114 
					                                f32 %178 = OpFMul %176 %177 
					                                             OpStore %103 %178 
					                                f32 %179 = OpLoad %103 
					                                f32 %180 = OpFMul %179 %127 
					                                             OpStore %160 %180 
					                                f32 %181 = OpLoad %103 
					                                f32 %182 = OpFMul %181 %127 
					                       Private f32* %183 = OpAccessChain %79 %24 
					                                f32 %184 = OpLoad %183 
					                                f32 %185 = OpFAdd %182 %184 
					                       Private f32* %186 = OpAccessChain %79 %24 
					                                             OpStore %186 %185 
					                       Private f32* %187 = OpAccessChain %56 %24 
					                                f32 %188 = OpLoad %187 
					                                f32 %189 = OpLoad %160 
					                                f32 %190 = OpFMul %188 %189 
					                                f32 %191 = OpLoad %130 
					                                f32 %192 = OpFAdd %190 %191 
					                                             OpStore %130 %192 
					                              f32_4 %193 = OpLoad %70 
					                              f32_3 %194 = OpVectorShuffle %193 %193 1 2 3 
					                              f32_3 %195 = OpFMul %194 %83 
					                              f32_3 %196 = OpFAdd %195 %86 
					                                             OpStore %155 %196 
					                              f32_3 %197 = OpLoad %94 
					                              f32_3 %198 = OpLoad %155 
					                                f32 %199 = OpDot %197 %198 
					                                             OpStore %160 %199 
					                                f32 %201 = OpLoad %160 
					                                f32 %202 = OpFAdd %201 %106 
					                                             OpStore %200 %202 
					                                f32 %203 = OpLoad %200 
					                                f32 %204 = OpFMul %203 %109 
					                                             OpStore %200 %204 
					                                f32 %205 = OpLoad %200 
					                                f32 %206 = OpExtInst %1 43 %205 %46 %112 
					                                             OpStore %200 %206 
					                                f32 %208 = OpLoad %200 
					                                f32 %209 = OpFMul %208 %116 
					                                f32 %210 = OpFAdd %209 %118 
					                                             OpStore %207 %210 
					                                f32 %211 = OpLoad %200 
					                                f32 %212 = OpLoad %200 
					                                f32 %213 = OpFMul %211 %212 
					                                             OpStore %200 %213 
					                                f32 %214 = OpLoad %200 
					                                f32 %215 = OpLoad %207 
					                                f32 %216 = OpFMul %214 %215 
					                                             OpStore %200 %216 
					                                f32 %217 = OpLoad %200 
					                                f32 %219 = OpFMul %217 %218 
					                                             OpStore %160 %219 
					                                f32 %220 = OpLoad %200 
					                                f32 %221 = OpFMul %220 %218 
					                       Private f32* %222 = OpAccessChain %79 %24 
					                                f32 %223 = OpLoad %222 
					                                f32 %224 = OpFAdd %221 %223 
					                       Private f32* %225 = OpAccessChain %79 %24 
					                                             OpStore %225 %224 
					                       Private f32* %226 = OpAccessChain %70 %24 
					                                f32 %227 = OpLoad %226 
					                                f32 %228 = OpLoad %160 
					                                f32 %229 = OpFMul %227 %228 
					                                f32 %230 = OpLoad %130 
					                                f32 %231 = OpFAdd %229 %230 
					                                             OpStore %130 %231 
					                              f32_4 %232 = OpLoad %148 
					                              f32_3 %233 = OpVectorShuffle %232 %232 1 2 3 
					                              f32_3 %234 = OpFMul %233 %83 
					                              f32_3 %235 = OpFAdd %234 %86 
					                                             OpStore %155 %235 
					                              f32_3 %236 = OpLoad %94 
					                              f32_3 %237 = OpLoad %155 
					                                f32 %238 = OpDot %236 %237 
					                                             OpStore %160 %238 
					                              f32_3 %241 = OpLoad %94 
					                              f32_3 %244 = OpFMul %241 %243 
					                              f32_3 %245 = OpFAdd %244 %243 
					                              f32_4 %246 = OpLoad %240 
					                              f32_4 %247 = OpVectorShuffle %246 %245 0 4 5 6 
					                                             OpStore %240 %247 
					                                f32 %249 = OpLoad %160 
					                                f32 %250 = OpFAdd %249 %106 
					                                             OpStore %248 %250 
					                                f32 %251 = OpLoad %248 
					                                f32 %252 = OpFMul %251 %109 
					                                             OpStore %248 %252 
					                                f32 %253 = OpLoad %248 
					                                f32 %254 = OpExtInst %1 43 %253 %46 %112 
					                                             OpStore %248 %254 
					                                f32 %256 = OpLoad %248 
					                                f32 %257 = OpFMul %256 %116 
					                                f32 %258 = OpFAdd %257 %118 
					                                             OpStore %255 %258 
					                                f32 %259 = OpLoad %248 
					                                f32 %260 = OpLoad %248 
					                                f32 %261 = OpFMul %259 %260 
					                                             OpStore %248 %261 
					                                f32 %262 = OpLoad %248 
					                                f32 %263 = OpLoad %255 
					                                f32 %264 = OpFMul %262 %263 
					                                             OpStore %248 %264 
					                                f32 %265 = OpLoad %248 
					                                f32 %266 = OpFMul %265 %218 
					                                             OpStore %160 %266 
					                                f32 %267 = OpLoad %248 
					                                f32 %268 = OpFMul %267 %218 
					                       Private f32* %269 = OpAccessChain %79 %24 
					                                f32 %270 = OpLoad %269 
					                                f32 %271 = OpFAdd %268 %270 
					                       Private f32* %272 = OpAccessChain %79 %24 
					                                             OpStore %272 %271 
					                       Private f32* %273 = OpAccessChain %79 %24 
					                                f32 %274 = OpLoad %273 
					                                f32 %275 = OpFAdd %274 %138 
					                       Private f32* %276 = OpAccessChain %79 %24 
					                                             OpStore %276 %275 
					                       Private f32* %277 = OpAccessChain %148 %24 
					                                f32 %278 = OpLoad %277 
					                                f32 %279 = OpLoad %160 
					                                f32 %280 = OpFMul %278 %279 
					                                f32 %281 = OpLoad %130 
					                                f32 %282 = OpFAdd %280 %281 
					                                             OpStore %130 %282 
					                                f32 %283 = OpLoad %130 
					                       Private f32* %284 = OpAccessChain %79 %24 
					                                f32 %285 = OpLoad %284 
					                                f32 %286 = OpFDiv %283 %285 
					                        Output f32* %288 = OpAccessChain %240 %24 
					                                             OpStore %288 %286 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[4];
						float _Downsample;
						vec4 unused_0_4;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec3 u_xlat16_6;
					vec3 u_xlat16_7;
					vec3 u_xlat16_8;
					vec3 u_xlat16_9;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat16_12;
					float u_xlat16_17;
					void main()
					{
					    u_xlat0.x = _MainTex_TexelSize.y / _Downsample;
					    u_xlat0.y = float(1.38461542);
					    u_xlat0.z = float(3.23076916);
					    u_xlat1 = vec4(-0.0, -2.76923084, -0.0, -6.46153831) * u_xlat0.yxzx + vs_TEXCOORD2.xyxy;
					    u_xlat0 = vec4(0.0, 2.76923084, 0.0, 6.46153831) * u_xlat0.yxzx + vs_TEXCOORD2.xyxy;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_7.x = dot(u_xlat16_8.xyz, u_xlat16_7.xyz);
					    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
					    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
					    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
					    u_xlat16_12 = u_xlat16_7.x * -2.0 + 3.0;
					    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
					    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_12;
					    u_xlat16_7.x = u_xlat16_7.x * 0.31621623;
					    u_xlat16_2 = u_xlat16_7.x * u_xlat10_2.x;
					    u_xlat16_2 = u_xlat10_3.x * 0.227027029 + u_xlat16_2;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat16_9.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_12 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
					    u_xlat16_12 = u_xlat16_12 + -0.800000012;
					    u_xlat16_12 = u_xlat16_12 * 5.00000048;
					    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
					    u_xlat16_17 = u_xlat16_12 * -2.0 + 3.0;
					    u_xlat16_12 = u_xlat16_12 * u_xlat16_12;
					    u_xlat16_12 = u_xlat16_12 * u_xlat16_17;
					    u_xlat16_17 = u_xlat16_12 * 0.31621623;
					    u_xlat16_7.x = u_xlat16_12 * 0.31621623 + u_xlat16_7.x;
					    u_xlat16_2 = u_xlat10_4.x * u_xlat16_17 + u_xlat16_2;
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_6.x = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
					    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
					    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
					    u_xlat16_11 = u_xlat16_6.x * -2.0 + 3.0;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_11;
					    u_xlat16_11 = u_xlat16_6.x * 0.0702702701;
					    u_xlat16_6.x = u_xlat16_6.x * 0.0702702701 + u_xlat16_7.x;
					    u_xlat16_1 = u_xlat10_1.x * u_xlat16_11 + u_xlat16_2;
					    u_xlat16_5.xyz = u_xlat10_0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.x = dot(u_xlat16_8.xyz, u_xlat16_5.xyz);
					    SV_Target0.yzw = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat16_5.x = u_xlat16_5.x + -0.800000012;
					    u_xlat16_5.x = u_xlat16_5.x * 5.00000048;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_10 = u_xlat16_5.x * -2.0 + 3.0;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_10;
					    u_xlat16_10 = u_xlat16_5.x * 0.0702702701;
					    u_xlat16_5.x = u_xlat16_5.x * 0.0702702701 + u_xlat16_6.x;
					    u_xlat16_5.x = u_xlat16_5.x + 0.227027029;
					    u_xlat16_0 = u_xlat10_0.x * u_xlat16_10 + u_xlat16_1;
					    SV_Target0.x = u_xlat16_0 / u_xlat16_5.x;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 456209
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    u_xlat0.xyz = in_TEXCOORD0.xyx;
					    phase0_Output0_1 = u_xlat0;
					    vs_TEXCOORD2.xy = u_xlat0.zw;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	float _Downsample;
					UNITY_LOCATION(0) uniform  sampler2D _OcclusionTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec3 u_xlat16_6;
					vec3 u_xlat16_7;
					vec3 u_xlat16_8;
					vec3 u_xlat16_9;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat16_15;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy / vec2(vec2(_Downsample, _Downsample));
					    u_xlat1.xy = (-u_xlat0.xy) + vs_TEXCOORD2.xy;
					    u_xlat10_1 = texture(_OcclusionTexture, u_xlat1.xy);
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_2 = texture(_OcclusionTexture, vs_TEXCOORD2.xy);
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_6.x = dot(u_xlat16_7.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
					    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
					    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
					    u_xlat16_11 = u_xlat16_6.x * -2.0 + 3.0;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_11;
					    u_xlat16_1 = u_xlat10_1.x * u_xlat16_6.x + u_xlat10_2.x;
					    u_xlat0.zw = (-u_xlat0.yx);
					    u_xlat3 = u_xlat0.xzwy + vs_TEXCOORD2.xyxy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
					    u_xlat10_0 = texture(_OcclusionTexture, u_xlat0.xy);
					    u_xlat10_4 = texture(_OcclusionTexture, u_xlat3.xy);
					    u_xlat10_3 = texture(_OcclusionTexture, u_xlat3.zw);
					    u_xlat16_9.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_9.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_4.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_3.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_5.xyz = u_xlat10_0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.x = dot(u_xlat16_7.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.x = u_xlat16_5.x + -0.800000012;
					    u_xlat16_5.x = u_xlat16_5.x * 5.00000048;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_10 = u_xlat16_5.x * -2.0 + 3.0;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
					    u_xlat16_15 = u_xlat16_5.x * u_xlat16_10;
					    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_6.x;
					    u_xlat16_5.x = u_xlat16_5.x + 1.0;
					    u_xlat16_0 = u_xlat10_0.x * u_xlat16_15 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 / u_xlat16_5.x;
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %115 %128 %131 
					                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 Location 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 128 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 Location 131 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                                            %100 = OpTypePointer Function %6 
					                             Private f32_4* %109 = OpVariable Private 
					                                        u32 %111 = OpConstant 3 
					                                            %113 = OpTypeVector %6 2 
					                                            %114 = OpTypePointer Output %113 
					                      Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                            %117 = OpTypePointer Output %6 
					                                            %119 = OpTypeVector %6 3 
					                                        u32 %124 = OpConstant 0 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %101 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                        bool %99 = OpLoad %84 
					                                                     OpSelectionMerge %103 None 
					                                                     OpBranchConditional %99 %102 %105 
					                                            %102 = OpLabel 
					                                        f32 %104 = OpLoad %91 
					                                                     OpStore %101 %104 
					                                                     OpBranch %103 
					                                            %105 = OpLabel 
					                                 Input f32* %106 = OpAccessChain %92 %68 
					                                        f32 %107 = OpLoad %106 
					                                                     OpStore %101 %107 
					                                                     OpBranch %103 
					                                            %103 = OpLabel 
					                                        f32 %108 = OpLoad %101 
					                                                     OpStore %91 %108 
					                                        f32 %110 = OpLoad %91 
					                               Private f32* %112 = OpAccessChain %109 %111 
					                                                     OpStore %112 %110 
					                                        f32 %116 = OpLoad %91 
					                                Output f32* %118 = OpAccessChain vs_TEXCOORD2 %68 
					                                                     OpStore %118 %116 
					                                      f32_4 %120 = OpLoad %92 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 1 0 
					                                      f32_4 %122 = OpLoad %109 
					                                      f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
					                                                     OpStore %109 %123 
					                                 Input f32* %125 = OpAccessChain %92 %124 
					                                        f32 %126 = OpLoad %125 
					                                Output f32* %127 = OpAccessChain vs_TEXCOORD2 %124 
					                                                     OpStore %127 %126 
					                                      f32_4 %129 = OpLoad %109 
					                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                                     OpStore vs_TEXCOORD0 %130 
					                                      f32_4 %132 = OpLoad %109 
					                                      f32_2 %133 = OpVectorShuffle %132 %132 2 3 
					                                                     OpStore vs_TEXCOORD1 %133 
					                                Output f32* %134 = OpAccessChain %72 %22 %68 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %72 %22 %68 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 304
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %38 %290 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                              OpMemberDecorate %10 0 Offset 10 
					                                              OpMemberDecorate %10 1 Offset 10 
					                                              OpDecorate %10 Block 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD2 Location 38 
					                                              OpDecorate %39 RelaxedPrecision 
					                                              OpDecorate %43 RelaxedPrecision 
					                                              OpDecorate %46 RelaxedPrecision 
					                                              OpDecorate %46 DescriptorSet 46 
					                                              OpDecorate %46 Binding 46 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %50 RelaxedPrecision 
					                                              OpDecorate %50 DescriptorSet 50 
					                                              OpDecorate %50 Binding 50 
					                                              OpDecorate %51 RelaxedPrecision 
					                                              OpDecorate %59 RelaxedPrecision 
					                                              OpDecorate %60 RelaxedPrecision 
					                                              OpDecorate %61 RelaxedPrecision 
					                                              OpDecorate %64 RelaxedPrecision 
					                                              OpDecorate %67 RelaxedPrecision 
					                                              OpDecorate %68 RelaxedPrecision 
					                                              OpDecorate %69 RelaxedPrecision 
					                                              OpDecorate %70 RelaxedPrecision 
					                                              OpDecorate %72 RelaxedPrecision 
					                                              OpDecorate %73 RelaxedPrecision 
					                                              OpDecorate %74 RelaxedPrecision 
					                                              OpDecorate %75 RelaxedPrecision 
					                                              OpDecorate %76 RelaxedPrecision 
					                                              OpDecorate %77 RelaxedPrecision 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %79 RelaxedPrecision 
					                                              OpDecorate %80 RelaxedPrecision 
					                                              OpDecorate %81 RelaxedPrecision 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %88 RelaxedPrecision 
					                                              OpDecorate %90 RelaxedPrecision 
					                                              OpDecorate %91 RelaxedPrecision 
					                                              OpDecorate %93 RelaxedPrecision 
					                                              OpDecorate %94 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %99 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %103 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %107 RelaxedPrecision 
					                                              OpDecorate %108 RelaxedPrecision 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %120 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %131 RelaxedPrecision 
					                                              OpDecorate %132 RelaxedPrecision 
					                                              OpDecorate %136 RelaxedPrecision 
					                                              OpDecorate %140 RelaxedPrecision 
					                                              OpDecorate %141 RelaxedPrecision 
					                                              OpDecorate %142 RelaxedPrecision 
					                                              OpDecorate %147 RelaxedPrecision 
					                                              OpDecorate %148 RelaxedPrecision 
					                                              OpDecorate %153 RelaxedPrecision 
					                                              OpDecorate %154 RelaxedPrecision 
					                                              OpDecorate %159 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %161 RelaxedPrecision 
					                                              OpDecorate %162 RelaxedPrecision 
					                                              OpDecorate %163 RelaxedPrecision 
					                                              OpDecorate %164 RelaxedPrecision 
					                                              OpDecorate %165 RelaxedPrecision 
					                                              OpDecorate %166 RelaxedPrecision 
					                                              OpDecorate %167 RelaxedPrecision 
					                                              OpDecorate %168 RelaxedPrecision 
					                                              OpDecorate %169 RelaxedPrecision 
					                                              OpDecorate %170 RelaxedPrecision 
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
					                                              OpDecorate %187 RelaxedPrecision 
					                                              OpDecorate %188 RelaxedPrecision 
					                                              OpDecorate %190 RelaxedPrecision 
					                                              OpDecorate %191 RelaxedPrecision 
					                                              OpDecorate %194 RelaxedPrecision 
					                                              OpDecorate %195 RelaxedPrecision 
					                                              OpDecorate %196 RelaxedPrecision 
					                                              OpDecorate %197 RelaxedPrecision 
					                                              OpDecorate %198 RelaxedPrecision 
					                                              OpDecorate %199 RelaxedPrecision 
					                                              OpDecorate %200 RelaxedPrecision 
					                                              OpDecorate %201 RelaxedPrecision 
					                                              OpDecorate %202 RelaxedPrecision 
					                                              OpDecorate %203 RelaxedPrecision 
					                                              OpDecorate %204 RelaxedPrecision 
					                                              OpDecorate %205 RelaxedPrecision 
					                                              OpDecorate %206 RelaxedPrecision 
					                                              OpDecorate %207 RelaxedPrecision 
					                                              OpDecorate %208 RelaxedPrecision 
					                                              OpDecorate %209 RelaxedPrecision 
					                                              OpDecorate %210 RelaxedPrecision 
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
					                                              OpDecorate %225 RelaxedPrecision 
					                                              OpDecorate %226 RelaxedPrecision 
					                                              OpDecorate %229 RelaxedPrecision 
					                                              OpDecorate %230 RelaxedPrecision 
					                                              OpDecorate %231 RelaxedPrecision 
					                                              OpDecorate %232 RelaxedPrecision 
					                                              OpDecorate %233 RelaxedPrecision 
					                                              OpDecorate %234 RelaxedPrecision 
					                                              OpDecorate %235 RelaxedPrecision 
					                                              OpDecorate %236 RelaxedPrecision 
					                                              OpDecorate %237 RelaxedPrecision 
					                                              OpDecorate %238 RelaxedPrecision 
					                                              OpDecorate %239 RelaxedPrecision 
					                                              OpDecorate %240 RelaxedPrecision 
					                                              OpDecorate %241 RelaxedPrecision 
					                                              OpDecorate %242 RelaxedPrecision 
					                                              OpDecorate %243 RelaxedPrecision 
					                                              OpDecorate %244 RelaxedPrecision 
					                                              OpDecorate %245 RelaxedPrecision 
					                                              OpDecorate %246 RelaxedPrecision 
					                                              OpDecorate %247 RelaxedPrecision 
					                                              OpDecorate %248 RelaxedPrecision 
					                                              OpDecorate %249 RelaxedPrecision 
					                                              OpDecorate %250 RelaxedPrecision 
					                                              OpDecorate %251 RelaxedPrecision 
					                                              OpDecorate %252 RelaxedPrecision 
					                                              OpDecorate %253 RelaxedPrecision 
					                                              OpDecorate %254 RelaxedPrecision 
					                                              OpDecorate %255 RelaxedPrecision 
					                                              OpDecorate %256 RelaxedPrecision 
					                                              OpDecorate %257 RelaxedPrecision 
					                                              OpDecorate %258 RelaxedPrecision 
					                                              OpDecorate %259 RelaxedPrecision 
					                                              OpDecorate %260 RelaxedPrecision 
					                                              OpDecorate %261 RelaxedPrecision 
					                                              OpDecorate %263 RelaxedPrecision 
					                                              OpDecorate %264 RelaxedPrecision 
					                                              OpDecorate %267 RelaxedPrecision 
					                                              OpDecorate %268 RelaxedPrecision 
					                                              OpDecorate %269 RelaxedPrecision 
					                                              OpDecorate %270 RelaxedPrecision 
					                                              OpDecorate %271 RelaxedPrecision 
					                                              OpDecorate %272 RelaxedPrecision 
					                                              OpDecorate %274 RelaxedPrecision 
					                                              OpDecorate %275 RelaxedPrecision 
					                                              OpDecorate %278 RelaxedPrecision 
					                                              OpDecorate %279 RelaxedPrecision 
					                                              OpDecorate %280 RelaxedPrecision 
					                                              OpDecorate %282 RelaxedPrecision 
					                                              OpDecorate %282 DescriptorSet 282 
					                                              OpDecorate %282 Binding 282 
					                                              OpDecorate %283 RelaxedPrecision 
					                                              OpDecorate %284 RelaxedPrecision 
					                                              OpDecorate %284 DescriptorSet 284 
					                                              OpDecorate %284 Binding 284 
					                                              OpDecorate %285 RelaxedPrecision 
					                                              OpDecorate %287 RelaxedPrecision 
					                                              OpDecorate %288 RelaxedPrecision 
					                                              OpDecorate %290 RelaxedPrecision 
					                                              OpDecorate %290 Location 290 
					                                              OpDecorate %291 RelaxedPrecision 
					                                              OpDecorate %292 RelaxedPrecision 
					                                              OpDecorate %293 RelaxedPrecision 
					                                              OpDecorate %294 RelaxedPrecision 
					                                              OpDecorate %295 RelaxedPrecision 
					                                              OpDecorate %300 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeStruct %7 %6 
					                                      %11 = OpTypePointer Uniform %10 
					        Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
					                                      %13 = OpTypeInt 32 1 
					                                  i32 %14 = OpConstant 0 
					                                      %15 = OpTypeVector %6 2 
					                                      %16 = OpTypePointer Uniform %7 
					                                  i32 %20 = OpConstant 1 
					                                      %21 = OpTypePointer Uniform %6 
					                       Private f32_4* %33 = OpVariable Private 
					                                      %37 = OpTypePointer Input %15 
					                Input f32_2* vs_TEXCOORD2 = OpVariable Input 
					                       Private f32_4* %43 = OpVariable Private 
					                                      %44 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %45 = OpTypePointer UniformConstant %44 
					 UniformConstant read_only Texture2D* %46 = OpVariable UniformConstant 
					                                      %48 = OpTypeSampler 
					                                      %49 = OpTypePointer UniformConstant %48 
					             UniformConstant sampler* %50 = OpVariable UniformConstant 
					                                      %52 = OpTypeSampledImage %44 
					                                      %57 = OpTypeVector %6 3 
					                                      %58 = OpTypePointer Private %57 
					                       Private f32_3* %59 = OpVariable Private 
					                                  f32 %62 = OpConstant 3,674022E-40 
					                                f32_3 %63 = OpConstantComposite %62 %62 %62 
					                                  f32 %65 = OpConstant 3,674022E-40 
					                                f32_3 %66 = OpConstantComposite %65 %65 %65 
					                       Private f32_4* %68 = OpVariable Private 
					                       Private f32_3* %74 = OpVariable Private 
					                                      %82 = OpTypeInt 32 0 
					                                  u32 %83 = OpConstant 0 
					                                      %84 = OpTypePointer Private %6 
					                         Private f32* %86 = OpVariable Private 
					                                  f32 %89 = OpConstant 3,674022E-40 
					                                  f32 %92 = OpConstant 3,674022E-40 
					                                  f32 %95 = OpConstant 3,674022E-40 
					                                  f32 %96 = OpConstant 3,674022E-40 
					                         Private f32* %98 = OpVariable Private 
					                                 f32 %100 = OpConstant 3,674022E-40 
					                                 f32 %102 = OpConstant 3,674022E-40 
					                        Private f32* %107 = OpVariable Private 
					                        Private f32* %116 = OpVariable Private 
					                      Private f32_4* %140 = OpVariable Private 
					                      Private f32_3* %159 = OpVariable Private 
					                        Private f32* %164 = OpVariable Private 
					                        Private f32* %168 = OpVariable Private 
					                        Private f32* %175 = OpVariable Private 
					                        Private f32* %182 = OpVariable Private 
					                        Private f32* %241 = OpVariable Private 
					                        Private f32* %248 = OpVariable Private 
					                        Private f32* %255 = OpVariable Private 
					UniformConstant read_only Texture2D* %282 = OpVariable UniformConstant 
					            UniformConstant sampler* %284 = OpVariable UniformConstant 
					                                     %289 = OpTypePointer Output %7 
					                       Output f32_4* %290 = OpVariable Output 
					                                 u32 %298 = OpConstant 3 
					                                     %301 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Uniform f32_4* %17 = OpAccessChain %12 %14 
					                                f32_4 %18 = OpLoad %17 
					                                f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                         Uniform f32* %22 = OpAccessChain %12 %20 
					                                  f32 %23 = OpLoad %22 
					                         Uniform f32* %24 = OpAccessChain %12 %20 
					                                  f32 %25 = OpLoad %24 
					                                f32_2 %26 = OpCompositeConstruct %23 %25 
					                                  f32 %27 = OpCompositeExtract %26 0 
					                                  f32 %28 = OpCompositeExtract %26 1 
					                                f32_2 %29 = OpCompositeConstruct %27 %28 
					                                f32_2 %30 = OpFDiv %19 %29 
					                                f32_4 %31 = OpLoad %9 
					                                f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
					                                              OpStore %9 %32 
					                                f32_4 %34 = OpLoad %9 
					                                f32_2 %35 = OpVectorShuffle %34 %34 0 1 
					                                f32_2 %36 = OpFNegate %35 
					                                f32_2 %39 = OpLoad vs_TEXCOORD2 
					                                f32_2 %40 = OpFAdd %36 %39 
					                                f32_4 %41 = OpLoad %33 
					                                f32_4 %42 = OpVectorShuffle %41 %40 4 5 2 3 
					                                              OpStore %33 %42 
					                  read_only Texture2D %47 = OpLoad %46 
					                              sampler %51 = OpLoad %50 
					           read_only Texture2DSampled %53 = OpSampledImage %47 %51 
					                                f32_4 %54 = OpLoad %33 
					                                f32_2 %55 = OpVectorShuffle %54 %54 0 1 
					                                f32_4 %56 = OpImageSampleImplicitLod %53 %55 
					                                              OpStore %43 %56 
					                                f32_4 %60 = OpLoad %43 
					                                f32_3 %61 = OpVectorShuffle %60 %60 1 2 3 
					                                f32_3 %64 = OpFMul %61 %63 
					                                f32_3 %67 = OpFAdd %64 %66 
					                                              OpStore %59 %67 
					                  read_only Texture2D %69 = OpLoad %46 
					                              sampler %70 = OpLoad %50 
					           read_only Texture2DSampled %71 = OpSampledImage %69 %70 
					                                f32_2 %72 = OpLoad vs_TEXCOORD2 
					                                f32_4 %73 = OpImageSampleImplicitLod %71 %72 
					                                              OpStore %68 %73 
					                                f32_4 %75 = OpLoad %68 
					                                f32_3 %76 = OpVectorShuffle %75 %75 1 2 3 
					                                f32_3 %77 = OpFMul %76 %63 
					                                f32_3 %78 = OpFAdd %77 %66 
					                                              OpStore %74 %78 
					                                f32_3 %79 = OpLoad %74 
					                                f32_3 %80 = OpLoad %59 
					                                  f32 %81 = OpDot %79 %80 
					                         Private f32* %85 = OpAccessChain %59 %83 
					                                              OpStore %85 %81 
					                         Private f32* %87 = OpAccessChain %59 %83 
					                                  f32 %88 = OpLoad %87 
					                                  f32 %90 = OpFAdd %88 %89 
					                                              OpStore %86 %90 
					                                  f32 %91 = OpLoad %86 
					                                  f32 %93 = OpFMul %91 %92 
					                                              OpStore %86 %93 
					                                  f32 %94 = OpLoad %86 
					                                  f32 %97 = OpExtInst %1 43 %94 %95 %96 
					                                              OpStore %86 %97 
					                                  f32 %99 = OpLoad %86 
					                                 f32 %101 = OpFMul %99 %100 
					                                 f32 %103 = OpFAdd %101 %102 
					                                              OpStore %98 %103 
					                                 f32 %104 = OpLoad %86 
					                                 f32 %105 = OpLoad %86 
					                                 f32 %106 = OpFMul %104 %105 
					                                              OpStore %86 %106 
					                                 f32 %108 = OpLoad %86 
					                                 f32 %109 = OpLoad %98 
					                                 f32 %110 = OpFMul %108 %109 
					                                              OpStore %107 %110 
					                                 f32 %111 = OpLoad %98 
					                                 f32 %112 = OpLoad %86 
					                                 f32 %113 = OpFMul %111 %112 
					                                 f32 %114 = OpFAdd %113 %96 
					                        Private f32* %115 = OpAccessChain %59 %83 
					                                              OpStore %115 %114 
					                        Private f32* %117 = OpAccessChain %43 %83 
					                                 f32 %118 = OpLoad %117 
					                                 f32 %119 = OpLoad %107 
					                                 f32 %120 = OpFMul %118 %119 
					                        Private f32* %121 = OpAccessChain %68 %83 
					                                 f32 %122 = OpLoad %121 
					                                 f32 %123 = OpFAdd %120 %122 
					                                              OpStore %116 %123 
					                               f32_4 %124 = OpLoad %9 
					                               f32_2 %125 = OpVectorShuffle %124 %124 1 0 
					                               f32_2 %126 = OpFNegate %125 
					                               f32_4 %127 = OpLoad %9 
					                               f32_4 %128 = OpVectorShuffle %127 %126 0 1 4 5 
					                                              OpStore %9 %128 
					                               f32_4 %129 = OpLoad %9 
					                               f32_4 %130 = OpVectorShuffle %129 %129 0 2 3 1 
					                               f32_2 %131 = OpLoad vs_TEXCOORD2 
					                               f32_4 %132 = OpVectorShuffle %131 %131 0 1 0 1 
					                               f32_4 %133 = OpFAdd %130 %132 
					                                              OpStore %33 %133 
					                               f32_4 %134 = OpLoad %9 
					                               f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                               f32_2 %136 = OpLoad vs_TEXCOORD2 
					                               f32_2 %137 = OpFAdd %135 %136 
					                               f32_4 %138 = OpLoad %9 
					                               f32_4 %139 = OpVectorShuffle %138 %137 4 5 2 3 
					                                              OpStore %9 %139 
					                 read_only Texture2D %141 = OpLoad %46 
					                             sampler %142 = OpLoad %50 
					          read_only Texture2DSampled %143 = OpSampledImage %141 %142 
					                               f32_4 %144 = OpLoad %9 
					                               f32_2 %145 = OpVectorShuffle %144 %144 0 1 
					                               f32_4 %146 = OpImageSampleImplicitLod %143 %145 
					                                              OpStore %140 %146 
					                 read_only Texture2D %147 = OpLoad %46 
					                             sampler %148 = OpLoad %50 
					          read_only Texture2DSampled %149 = OpSampledImage %147 %148 
					                               f32_4 %150 = OpLoad %33 
					                               f32_2 %151 = OpVectorShuffle %150 %150 0 1 
					                               f32_4 %152 = OpImageSampleImplicitLod %149 %151 
					                                              OpStore %68 %152 
					                 read_only Texture2D %153 = OpLoad %46 
					                             sampler %154 = OpLoad %50 
					          read_only Texture2DSampled %155 = OpSampledImage %153 %154 
					                               f32_4 %156 = OpLoad %33 
					                               f32_2 %157 = OpVectorShuffle %156 %156 2 3 
					                               f32_4 %158 = OpImageSampleImplicitLod %155 %157 
					                                              OpStore %43 %158 
					                               f32_4 %160 = OpLoad %68 
					                               f32_3 %161 = OpVectorShuffle %160 %160 1 2 3 
					                               f32_3 %162 = OpFMul %161 %63 
					                               f32_3 %163 = OpFAdd %162 %66 
					                                              OpStore %159 %163 
					                               f32_3 %165 = OpLoad %74 
					                               f32_3 %166 = OpLoad %159 
					                                 f32 %167 = OpDot %165 %166 
					                                              OpStore %164 %167 
					                                 f32 %169 = OpLoad %164 
					                                 f32 %170 = OpFAdd %169 %89 
					                                              OpStore %168 %170 
					                                 f32 %171 = OpLoad %168 
					                                 f32 %172 = OpFMul %171 %92 
					                                              OpStore %168 %172 
					                                 f32 %173 = OpLoad %168 
					                                 f32 %174 = OpExtInst %1 43 %173 %95 %96 
					                                              OpStore %168 %174 
					                                 f32 %176 = OpLoad %168 
					                                 f32 %177 = OpFMul %176 %100 
					                                 f32 %178 = OpFAdd %177 %102 
					                                              OpStore %175 %178 
					                                 f32 %179 = OpLoad %168 
					                                 f32 %180 = OpLoad %168 
					                                 f32 %181 = OpFMul %179 %180 
					                                              OpStore %168 %181 
					                                 f32 %183 = OpLoad %168 
					                                 f32 %184 = OpLoad %175 
					                                 f32 %185 = OpFMul %183 %184 
					                                              OpStore %182 %185 
					                                 f32 %186 = OpLoad %175 
					                                 f32 %187 = OpLoad %168 
					                                 f32 %188 = OpFMul %186 %187 
					                        Private f32* %189 = OpAccessChain %59 %83 
					                                 f32 %190 = OpLoad %189 
					                                 f32 %191 = OpFAdd %188 %190 
					                        Private f32* %192 = OpAccessChain %59 %83 
					                                              OpStore %192 %191 
					                        Private f32* %193 = OpAccessChain %68 %83 
					                                 f32 %194 = OpLoad %193 
					                                 f32 %195 = OpLoad %182 
					                                 f32 %196 = OpFMul %194 %195 
					                                 f32 %197 = OpLoad %116 
					                                 f32 %198 = OpFAdd %196 %197 
					                                              OpStore %116 %198 
					                               f32_4 %199 = OpLoad %43 
					                               f32_3 %200 = OpVectorShuffle %199 %199 1 2 3 
					                               f32_3 %201 = OpFMul %200 %63 
					                               f32_3 %202 = OpFAdd %201 %66 
					                                              OpStore %159 %202 
					                               f32_3 %203 = OpLoad %74 
					                               f32_3 %204 = OpLoad %159 
					                                 f32 %205 = OpDot %203 %204 
					                                              OpStore %164 %205 
					                                 f32 %206 = OpLoad %164 
					                                 f32 %207 = OpFAdd %206 %89 
					                                              OpStore %86 %207 
					                                 f32 %208 = OpLoad %86 
					                                 f32 %209 = OpFMul %208 %92 
					                                              OpStore %86 %209 
					                                 f32 %210 = OpLoad %86 
					                                 f32 %211 = OpExtInst %1 43 %210 %95 %96 
					                                              OpStore %86 %211 
					                                 f32 %212 = OpLoad %86 
					                                 f32 %213 = OpFMul %212 %100 
					                                 f32 %214 = OpFAdd %213 %102 
					                                              OpStore %98 %214 
					                                 f32 %215 = OpLoad %86 
					                                 f32 %216 = OpLoad %86 
					                                 f32 %217 = OpFMul %215 %216 
					                                              OpStore %86 %217 
					                                 f32 %218 = OpLoad %86 
					                                 f32 %219 = OpLoad %98 
					                                 f32 %220 = OpFMul %218 %219 
					                                              OpStore %107 %220 
					                                 f32 %221 = OpLoad %98 
					                                 f32 %222 = OpLoad %86 
					                                 f32 %223 = OpFMul %221 %222 
					                        Private f32* %224 = OpAccessChain %59 %83 
					                                 f32 %225 = OpLoad %224 
					                                 f32 %226 = OpFAdd %223 %225 
					                        Private f32* %227 = OpAccessChain %59 %83 
					                                              OpStore %227 %226 
					                        Private f32* %228 = OpAccessChain %43 %83 
					                                 f32 %229 = OpLoad %228 
					                                 f32 %230 = OpLoad %107 
					                                 f32 %231 = OpFMul %229 %230 
					                                 f32 %232 = OpLoad %116 
					                                 f32 %233 = OpFAdd %231 %232 
					                                              OpStore %116 %233 
					                               f32_4 %234 = OpLoad %140 
					                               f32_3 %235 = OpVectorShuffle %234 %234 1 2 3 
					                               f32_3 %236 = OpFMul %235 %63 
					                               f32_3 %237 = OpFAdd %236 %66 
					                                              OpStore %159 %237 
					                               f32_3 %238 = OpLoad %74 
					                               f32_3 %239 = OpLoad %159 
					                                 f32 %240 = OpDot %238 %239 
					                                              OpStore %164 %240 
					                                 f32 %242 = OpLoad %164 
					                                 f32 %243 = OpFAdd %242 %89 
					                                              OpStore %241 %243 
					                                 f32 %244 = OpLoad %241 
					                                 f32 %245 = OpFMul %244 %92 
					                                              OpStore %241 %245 
					                                 f32 %246 = OpLoad %241 
					                                 f32 %247 = OpExtInst %1 43 %246 %95 %96 
					                                              OpStore %241 %247 
					                                 f32 %249 = OpLoad %241 
					                                 f32 %250 = OpFMul %249 %100 
					                                 f32 %251 = OpFAdd %250 %102 
					                                              OpStore %248 %251 
					                                 f32 %252 = OpLoad %241 
					                                 f32 %253 = OpLoad %241 
					                                 f32 %254 = OpFMul %252 %253 
					                                              OpStore %241 %254 
					                                 f32 %256 = OpLoad %241 
					                                 f32 %257 = OpLoad %248 
					                                 f32 %258 = OpFMul %256 %257 
					                                              OpStore %255 %258 
					                                 f32 %259 = OpLoad %248 
					                                 f32 %260 = OpLoad %241 
					                                 f32 %261 = OpFMul %259 %260 
					                        Private f32* %262 = OpAccessChain %59 %83 
					                                 f32 %263 = OpLoad %262 
					                                 f32 %264 = OpFAdd %261 %263 
					                        Private f32* %265 = OpAccessChain %59 %83 
					                                              OpStore %265 %264 
					                        Private f32* %266 = OpAccessChain %140 %83 
					                                 f32 %267 = OpLoad %266 
					                                 f32 %268 = OpLoad %255 
					                                 f32 %269 = OpFMul %267 %268 
					                                 f32 %270 = OpLoad %116 
					                                 f32 %271 = OpFAdd %269 %270 
					                                              OpStore %116 %271 
					                                 f32 %272 = OpLoad %116 
					                        Private f32* %273 = OpAccessChain %59 %83 
					                                 f32 %274 = OpLoad %273 
					                                 f32 %275 = OpFDiv %272 %274 
					                        Private f32* %276 = OpAccessChain %59 %83 
					                                              OpStore %276 %275 
					                        Private f32* %277 = OpAccessChain %59 %83 
					                                 f32 %278 = OpLoad %277 
					                                 f32 %279 = OpFNegate %278 
					                                 f32 %280 = OpFAdd %279 %96 
					                        Private f32* %281 = OpAccessChain %59 %83 
					                                              OpStore %281 %280 
					                 read_only Texture2D %283 = OpLoad %282 
					                             sampler %285 = OpLoad %284 
					          read_only Texture2DSampled %286 = OpSampledImage %283 %285 
					                               f32_2 %287 = OpLoad vs_TEXCOORD2 
					                               f32_4 %288 = OpImageSampleImplicitLod %286 %287 
					                                              OpStore %140 %288 
					                               f32_3 %291 = OpLoad %59 
					                               f32_3 %292 = OpVectorShuffle %291 %291 0 0 0 
					                               f32_4 %293 = OpLoad %140 
					                               f32_3 %294 = OpVectorShuffle %293 %293 0 1 2 
					                               f32_3 %295 = OpFMul %292 %294 
					                               f32_4 %296 = OpLoad %290 
					                               f32_4 %297 = OpVectorShuffle %296 %295 4 5 6 3 
					                                              OpStore %290 %297 
					                        Private f32* %299 = OpAccessChain %140 %298 
					                                 f32 %300 = OpLoad %299 
					                         Output f32* %302 = OpAccessChain %290 %298 
					                                              OpStore %302 %300 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[4];
						float _Downsample;
						vec4 unused_0_4;
					};
					uniform  sampler2D _OcclusionTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec3 u_xlat16_6;
					vec3 u_xlat16_7;
					vec3 u_xlat16_8;
					vec3 u_xlat16_9;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat16_15;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy / vec2(vec2(_Downsample, _Downsample));
					    u_xlat1.xy = (-u_xlat0.xy) + vs_TEXCOORD2.xy;
					    u_xlat10_1 = texture(_OcclusionTexture, u_xlat1.xy);
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_2 = texture(_OcclusionTexture, vs_TEXCOORD2.xy);
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_6.x = dot(u_xlat16_7.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
					    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
					    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
					    u_xlat16_11 = u_xlat16_6.x * -2.0 + 3.0;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_11;
					    u_xlat16_1 = u_xlat10_1.x * u_xlat16_6.x + u_xlat10_2.x;
					    u_xlat0.zw = (-u_xlat0.yx);
					    u_xlat3 = u_xlat0.xzwy + vs_TEXCOORD2.xyxy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
					    u_xlat10_0 = texture(_OcclusionTexture, u_xlat0.xy);
					    u_xlat10_4 = texture(_OcclusionTexture, u_xlat3.xy);
					    u_xlat10_3 = texture(_OcclusionTexture, u_xlat3.zw);
					    u_xlat16_9.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_9.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_4.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_3.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_5.xyz = u_xlat10_0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.x = dot(u_xlat16_7.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.x = u_xlat16_5.x + -0.800000012;
					    u_xlat16_5.x = u_xlat16_5.x * 5.00000048;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_10 = u_xlat16_5.x * -2.0 + 3.0;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
					    u_xlat16_15 = u_xlat16_5.x * u_xlat16_10;
					    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_6.x;
					    u_xlat16_5.x = u_xlat16_5.x + 1.0;
					    u_xlat16_0 = u_xlat10_0.x * u_xlat16_15 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 / u_xlat16_5.x;
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat10_1.xyz;
					    SV_Target0.w = u_xlat10_1.w;
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
		Pass {
			Blend Zero OneMinusSrcColor, Zero OneMinusSrcAlpha
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 458886
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					void main()
					{
					    gl_Position = in_POSITION0;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy * vec4(1.0, -1.0, 1.0, -1.0) + vec4(0.0, 1.0, 0.0, 1.0);
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					void main()
					{
					    gl_Position = in_POSITION0;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _ScreenParams;
					uniform 	float _Downsample;
					UNITY_LOCATION(0) uniform  sampler2D _OcclusionTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec3 u_xlat16_6;
					vec3 u_xlat16_7;
					vec3 u_xlat16_8;
					vec3 u_xlat16_9;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat16_15;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Downsample, _Downsample));
					    u_xlat1.xy = (-u_xlat0.xy) + vs_TEXCOORD1.xy;
					    u_xlat10_1 = texture(_OcclusionTexture, u_xlat1.xy);
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_2 = texture(_OcclusionTexture, vs_TEXCOORD1.xy);
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_6.x = dot(u_xlat16_7.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
					    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
					    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
					    u_xlat16_11 = u_xlat16_6.x * -2.0 + 3.0;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_11;
					    u_xlat16_1 = u_xlat10_1.x * u_xlat16_6.x + u_xlat10_2.x;
					    u_xlat0.zw = (-u_xlat0.yx);
					    u_xlat3 = u_xlat0.xzwy + vs_TEXCOORD1.xyxy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.xy;
					    u_xlat10_0 = texture(_OcclusionTexture, u_xlat0.xy);
					    u_xlat10_4 = texture(_OcclusionTexture, u_xlat3.xy);
					    u_xlat10_3 = texture(_OcclusionTexture, u_xlat3.zw);
					    u_xlat16_9.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_9.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_4.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_3.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_5.xyz = u_xlat10_0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.x = dot(u_xlat16_7.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.x = u_xlat16_5.x + -0.800000012;
					    u_xlat16_5.x = u_xlat16_5.x * 5.00000048;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_10 = u_xlat16_5.x * -2.0 + 3.0;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
					    u_xlat16_15 = u_xlat16_5.x * u_xlat16_10;
					    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_6.x;
					    u_xlat16_5.x = u_xlat16_5.x + 1.0;
					    u_xlat16_0 = u_xlat10_0.x * u_xlat16_15 + u_xlat16_1;
					    u_xlat0.xyz = vec3(u_xlat16_0) / u_xlat16_5.xxx;
					    u_xlat0.w = 0.0;
					    SV_Target0 = u_xlat0.wwwz;
					    SV_Target1 = u_xlat0;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 47
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Vertex %4 "main" %13 %17 %23 %35 %38 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
					                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
					                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %17 Location 17 
					                                             OpDecorate %23 Location 23 
					                                             OpDecorate vs_TEXCOORD0 Location 35 
					                                             OpDecorate vs_TEXCOORD1 Location 38 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypeInt 32 0 
					                                  u32 %9 = OpConstant 1 
					                                     %10 = OpTypeArray %6 %9 
					                                     %11 = OpTypeStruct %7 %6 %10 
					                                     %12 = OpTypePointer Output %11 
					Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
					                                     %14 = OpTypeInt 32 1 
					                                 i32 %15 = OpConstant 0 
					                                     %16 = OpTypePointer Input %7 
					                        Input f32_4* %17 = OpVariable Input 
					                                     %19 = OpTypePointer Output %7 
					                                     %21 = OpTypePointer Private %7 
					                      Private f32_4* %22 = OpVariable Private 
					                        Input f32_4* %23 = OpVariable Input 
					                                 f32 %26 = OpConstant 3,674022E-40 
					                                 f32 %27 = OpConstant 3,674022E-40 
					                               f32_4 %28 = OpConstantComposite %26 %27 %26 %27 
					                                 f32 %30 = OpConstant 3,674022E-40 
					                               f32_4 %31 = OpConstantComposite %30 %26 %30 %26 
					                                     %33 = OpTypeVector %6 2 
					                                     %34 = OpTypePointer Output %33 
					              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                     %41 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                               f32_4 %18 = OpLoad %17 
					                       Output f32_4* %20 = OpAccessChain %13 %15 
					                                             OpStore %20 %18 
					                               f32_4 %24 = OpLoad %23 
					                               f32_4 %25 = OpVectorShuffle %24 %24 0 1 0 1 
					                               f32_4 %29 = OpFMul %25 %28 
					                               f32_4 %32 = OpFAdd %29 %31 
					                                             OpStore %22 %32 
					                               f32_4 %36 = OpLoad %22 
					                               f32_2 %37 = OpVectorShuffle %36 %36 0 1 
					                                             OpStore vs_TEXCOORD0 %37 
					                               f32_4 %39 = OpLoad %22 
					                               f32_2 %40 = OpVectorShuffle %39 %39 2 3 
					                                             OpStore vs_TEXCOORD1 %40 
					                         Output f32* %42 = OpAccessChain %13 %15 %9 
					                                 f32 %43 = OpLoad %42 
					                                 f32 %44 = OpFNegate %43 
					                         Output f32* %45 = OpAccessChain %13 %15 %9 
					                                             OpStore %45 %44 
					                                             OpReturn
					                                             OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 295
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %45 %289 %292 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpMemberDecorate %10 1 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD1 Location 45 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %53 DescriptorSet 53 
					                                             OpDecorate %53 Binding 53 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %57 DescriptorSet 57 
					                                             OpDecorate %57 Binding 57 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %68 RelaxedPrecision 
					                                             OpDecorate %71 RelaxedPrecision 
					                                             OpDecorate %73 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %85 RelaxedPrecision 
					                                             OpDecorate %86 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %124 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %153 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                             OpDecorate %159 RelaxedPrecision 
					                                             OpDecorate %160 RelaxedPrecision 
					                                             OpDecorate %165 RelaxedPrecision 
					                                             OpDecorate %166 RelaxedPrecision 
					                                             OpDecorate %167 RelaxedPrecision 
					                                             OpDecorate %168 RelaxedPrecision 
					                                             OpDecorate %169 RelaxedPrecision 
					                                             OpDecorate %170 RelaxedPrecision 
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
					                                             OpDecorate %187 RelaxedPrecision 
					                                             OpDecorate %188 RelaxedPrecision 
					                                             OpDecorate %189 RelaxedPrecision 
					                                             OpDecorate %190 RelaxedPrecision 
					                                             OpDecorate %191 RelaxedPrecision 
					                                             OpDecorate %192 RelaxedPrecision 
					                                             OpDecorate %193 RelaxedPrecision 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %196 RelaxedPrecision 
					                                             OpDecorate %197 RelaxedPrecision 
					                                             OpDecorate %200 RelaxedPrecision 
					                                             OpDecorate %201 RelaxedPrecision 
					                                             OpDecorate %202 RelaxedPrecision 
					                                             OpDecorate %203 RelaxedPrecision 
					                                             OpDecorate %204 RelaxedPrecision 
					                                             OpDecorate %205 RelaxedPrecision 
					                                             OpDecorate %206 RelaxedPrecision 
					                                             OpDecorate %207 RelaxedPrecision 
					                                             OpDecorate %208 RelaxedPrecision 
					                                             OpDecorate %209 RelaxedPrecision 
					                                             OpDecorate %210 RelaxedPrecision 
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
					                                             OpDecorate %231 RelaxedPrecision 
					                                             OpDecorate %232 RelaxedPrecision 
					                                             OpDecorate %235 RelaxedPrecision 
					                                             OpDecorate %236 RelaxedPrecision 
					                                             OpDecorate %237 RelaxedPrecision 
					                                             OpDecorate %238 RelaxedPrecision 
					                                             OpDecorate %239 RelaxedPrecision 
					                                             OpDecorate %240 RelaxedPrecision 
					                                             OpDecorate %241 RelaxedPrecision 
					                                             OpDecorate %242 RelaxedPrecision 
					                                             OpDecorate %243 RelaxedPrecision 
					                                             OpDecorate %244 RelaxedPrecision 
					                                             OpDecorate %245 RelaxedPrecision 
					                                             OpDecorate %246 RelaxedPrecision 
					                                             OpDecorate %247 RelaxedPrecision 
					                                             OpDecorate %248 RelaxedPrecision 
					                                             OpDecorate %249 RelaxedPrecision 
					                                             OpDecorate %250 RelaxedPrecision 
					                                             OpDecorate %251 RelaxedPrecision 
					                                             OpDecorate %252 RelaxedPrecision 
					                                             OpDecorate %253 RelaxedPrecision 
					                                             OpDecorate %254 RelaxedPrecision 
					                                             OpDecorate %255 RelaxedPrecision 
					                                             OpDecorate %256 RelaxedPrecision 
					                                             OpDecorate %257 RelaxedPrecision 
					                                             OpDecorate %258 RelaxedPrecision 
					                                             OpDecorate %259 RelaxedPrecision 
					                                             OpDecorate %260 RelaxedPrecision 
					                                             OpDecorate %261 RelaxedPrecision 
					                                             OpDecorate %262 RelaxedPrecision 
					                                             OpDecorate %263 RelaxedPrecision 
					                                             OpDecorate %264 RelaxedPrecision 
					                                             OpDecorate %265 RelaxedPrecision 
					                                             OpDecorate %266 RelaxedPrecision 
					                                             OpDecorate %267 RelaxedPrecision 
					                                             OpDecorate %269 RelaxedPrecision 
					                                             OpDecorate %270 RelaxedPrecision 
					                                             OpDecorate %273 RelaxedPrecision 
					                                             OpDecorate %274 RelaxedPrecision 
					                                             OpDecorate %275 RelaxedPrecision 
					                                             OpDecorate %276 RelaxedPrecision 
					                                             OpDecorate %277 RelaxedPrecision 
					                                             OpDecorate %278 RelaxedPrecision 
					                                             OpDecorate %279 RelaxedPrecision 
					                                             OpDecorate %280 RelaxedPrecision 
					                                             OpDecorate %281 RelaxedPrecision 
					                                             OpDecorate %282 RelaxedPrecision 
					                                             OpDecorate %283 RelaxedPrecision 
					                                             OpDecorate %289 RelaxedPrecision 
					                                             OpDecorate %289 Location 289 
					                                             OpDecorate %290 RelaxedPrecision 
					                                             OpDecorate %291 RelaxedPrecision 
					                                             OpDecorate %292 RelaxedPrecision 
					                                             OpDecorate %292 Location 292 
					                                             OpDecorate %293 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeStruct %7 %6 
					                                     %11 = OpTypePointer Uniform %10 
					       Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 0 
					                                     %15 = OpTypeVector %6 2 
					                                     %16 = OpTypePointer Uniform %7 
					                                 f32 %20 = OpConstant 3,674022E-40 
					                               f32_2 %21 = OpConstantComposite %20 %20 
					                                 i32 %27 = OpConstant 1 
					                                     %28 = OpTypePointer Uniform %6 
					                      Private f32_4* %40 = OpVariable Private 
					                                     %44 = OpTypePointer Input %15 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                      Private f32_4* %50 = OpVariable Private 
					                                     %51 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %52 = OpTypePointer UniformConstant %51 
					UniformConstant read_only Texture2D* %53 = OpVariable UniformConstant 
					                                     %55 = OpTypeSampler 
					                                     %56 = OpTypePointer UniformConstant %55 
					            UniformConstant sampler* %57 = OpVariable UniformConstant 
					                                     %59 = OpTypeSampledImage %51 
					                                     %64 = OpTypeVector %6 3 
					                                     %65 = OpTypePointer Private %64 
					                      Private f32_3* %66 = OpVariable Private 
					                                 f32 %69 = OpConstant 3,674022E-40 
					                               f32_3 %70 = OpConstantComposite %69 %69 %69 
					                               f32_3 %72 = OpConstantComposite %20 %20 %20 
					                      Private f32_4* %74 = OpVariable Private 
					                      Private f32_3* %80 = OpVariable Private 
					                                     %88 = OpTypeInt 32 0 
					                                 u32 %89 = OpConstant 0 
					                                     %90 = OpTypePointer Private %6 
					                        Private f32* %92 = OpVariable Private 
					                                 f32 %95 = OpConstant 3,674022E-40 
					                                 f32 %98 = OpConstant 3,674022E-40 
					                                f32 %101 = OpConstant 3,674022E-40 
					                                f32 %102 = OpConstant 3,674022E-40 
					                       Private f32* %104 = OpVariable Private 
					                                f32 %106 = OpConstant 3,674022E-40 
					                                f32 %108 = OpConstant 3,674022E-40 
					                       Private f32* %113 = OpVariable Private 
					                       Private f32* %122 = OpVariable Private 
					                     Private f32_4* %146 = OpVariable Private 
					                     Private f32_3* %165 = OpVariable Private 
					                       Private f32* %170 = OpVariable Private 
					                       Private f32* %174 = OpVariable Private 
					                       Private f32* %181 = OpVariable Private 
					                       Private f32* %188 = OpVariable Private 
					                       Private f32* %247 = OpVariable Private 
					                       Private f32* %254 = OpVariable Private 
					                       Private f32* %261 = OpVariable Private 
					                     Private f32_4* %278 = OpVariable Private 
					                                u32 %286 = OpConstant 3 
					                                    %288 = OpTypePointer Output %7 
					                      Output f32_4* %289 = OpVariable Output 
					                      Output f32_4* %292 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Uniform f32_4* %17 = OpAccessChain %12 %14 
					                               f32_4 %18 = OpLoad %17 
					                               f32_2 %19 = OpVectorShuffle %18 %18 2 3 
					                               f32_2 %22 = OpFAdd %19 %21 
					                               f32_4 %23 = OpLoad %9 
					                               f32_4 %24 = OpVectorShuffle %23 %22 4 5 2 3 
					                                             OpStore %9 %24 
					                               f32_4 %25 = OpLoad %9 
					                               f32_2 %26 = OpVectorShuffle %25 %25 0 1 
					                        Uniform f32* %29 = OpAccessChain %12 %27 
					                                 f32 %30 = OpLoad %29 
					                        Uniform f32* %31 = OpAccessChain %12 %27 
					                                 f32 %32 = OpLoad %31 
					                               f32_2 %33 = OpCompositeConstruct %30 %32 
					                                 f32 %34 = OpCompositeExtract %33 0 
					                                 f32 %35 = OpCompositeExtract %33 1 
					                               f32_2 %36 = OpCompositeConstruct %34 %35 
					                               f32_2 %37 = OpFDiv %26 %36 
					                               f32_4 %38 = OpLoad %9 
					                               f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
					                                             OpStore %9 %39 
					                               f32_4 %41 = OpLoad %9 
					                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                               f32_2 %43 = OpFNegate %42 
					                               f32_2 %46 = OpLoad vs_TEXCOORD1 
					                               f32_2 %47 = OpFAdd %43 %46 
					                               f32_4 %48 = OpLoad %40 
					                               f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
					                                             OpStore %40 %49 
					                 read_only Texture2D %54 = OpLoad %53 
					                             sampler %58 = OpLoad %57 
					          read_only Texture2DSampled %60 = OpSampledImage %54 %58 
					                               f32_4 %61 = OpLoad %40 
					                               f32_2 %62 = OpVectorShuffle %61 %61 0 1 
					                               f32_4 %63 = OpImageSampleImplicitLod %60 %62 
					                                             OpStore %50 %63 
					                               f32_4 %67 = OpLoad %50 
					                               f32_3 %68 = OpVectorShuffle %67 %67 1 2 3 
					                               f32_3 %71 = OpFMul %68 %70 
					                               f32_3 %73 = OpFAdd %71 %72 
					                                             OpStore %66 %73 
					                 read_only Texture2D %75 = OpLoad %53 
					                             sampler %76 = OpLoad %57 
					          read_only Texture2DSampled %77 = OpSampledImage %75 %76 
					                               f32_2 %78 = OpLoad vs_TEXCOORD1 
					                               f32_4 %79 = OpImageSampleImplicitLod %77 %78 
					                                             OpStore %74 %79 
					                               f32_4 %81 = OpLoad %74 
					                               f32_3 %82 = OpVectorShuffle %81 %81 1 2 3 
					                               f32_3 %83 = OpFMul %82 %70 
					                               f32_3 %84 = OpFAdd %83 %72 
					                                             OpStore %80 %84 
					                               f32_3 %85 = OpLoad %80 
					                               f32_3 %86 = OpLoad %66 
					                                 f32 %87 = OpDot %85 %86 
					                        Private f32* %91 = OpAccessChain %66 %89 
					                                             OpStore %91 %87 
					                        Private f32* %93 = OpAccessChain %66 %89 
					                                 f32 %94 = OpLoad %93 
					                                 f32 %96 = OpFAdd %94 %95 
					                                             OpStore %92 %96 
					                                 f32 %97 = OpLoad %92 
					                                 f32 %99 = OpFMul %97 %98 
					                                             OpStore %92 %99 
					                                f32 %100 = OpLoad %92 
					                                f32 %103 = OpExtInst %1 43 %100 %101 %102 
					                                             OpStore %92 %103 
					                                f32 %105 = OpLoad %92 
					                                f32 %107 = OpFMul %105 %106 
					                                f32 %109 = OpFAdd %107 %108 
					                                             OpStore %104 %109 
					                                f32 %110 = OpLoad %92 
					                                f32 %111 = OpLoad %92 
					                                f32 %112 = OpFMul %110 %111 
					                                             OpStore %92 %112 
					                                f32 %114 = OpLoad %92 
					                                f32 %115 = OpLoad %104 
					                                f32 %116 = OpFMul %114 %115 
					                                             OpStore %113 %116 
					                                f32 %117 = OpLoad %104 
					                                f32 %118 = OpLoad %92 
					                                f32 %119 = OpFMul %117 %118 
					                                f32 %120 = OpFAdd %119 %102 
					                       Private f32* %121 = OpAccessChain %66 %89 
					                                             OpStore %121 %120 
					                       Private f32* %123 = OpAccessChain %50 %89 
					                                f32 %124 = OpLoad %123 
					                                f32 %125 = OpLoad %113 
					                                f32 %126 = OpFMul %124 %125 
					                       Private f32* %127 = OpAccessChain %74 %89 
					                                f32 %128 = OpLoad %127 
					                                f32 %129 = OpFAdd %126 %128 
					                                             OpStore %122 %129 
					                              f32_4 %130 = OpLoad %9 
					                              f32_2 %131 = OpVectorShuffle %130 %130 1 0 
					                              f32_2 %132 = OpFNegate %131 
					                              f32_4 %133 = OpLoad %9 
					                              f32_4 %134 = OpVectorShuffle %133 %132 0 1 4 5 
					                                             OpStore %9 %134 
					                              f32_4 %135 = OpLoad %9 
					                              f32_4 %136 = OpVectorShuffle %135 %135 0 2 3 1 
					                              f32_2 %137 = OpLoad vs_TEXCOORD1 
					                              f32_4 %138 = OpVectorShuffle %137 %137 0 1 0 1 
					                              f32_4 %139 = OpFAdd %136 %138 
					                                             OpStore %40 %139 
					                              f32_4 %140 = OpLoad %9 
					                              f32_2 %141 = OpVectorShuffle %140 %140 0 1 
					                              f32_2 %142 = OpLoad vs_TEXCOORD1 
					                              f32_2 %143 = OpFAdd %141 %142 
					                              f32_4 %144 = OpLoad %9 
					                              f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
					                                             OpStore %9 %145 
					                read_only Texture2D %147 = OpLoad %53 
					                            sampler %148 = OpLoad %57 
					         read_only Texture2DSampled %149 = OpSampledImage %147 %148 
					                              f32_4 %150 = OpLoad %9 
					                              f32_2 %151 = OpVectorShuffle %150 %150 0 1 
					                              f32_4 %152 = OpImageSampleImplicitLod %149 %151 
					                                             OpStore %146 %152 
					                read_only Texture2D %153 = OpLoad %53 
					                            sampler %154 = OpLoad %57 
					         read_only Texture2DSampled %155 = OpSampledImage %153 %154 
					                              f32_4 %156 = OpLoad %40 
					                              f32_2 %157 = OpVectorShuffle %156 %156 0 1 
					                              f32_4 %158 = OpImageSampleImplicitLod %155 %157 
					                                             OpStore %74 %158 
					                read_only Texture2D %159 = OpLoad %53 
					                            sampler %160 = OpLoad %57 
					         read_only Texture2DSampled %161 = OpSampledImage %159 %160 
					                              f32_4 %162 = OpLoad %40 
					                              f32_2 %163 = OpVectorShuffle %162 %162 2 3 
					                              f32_4 %164 = OpImageSampleImplicitLod %161 %163 
					                                             OpStore %50 %164 
					                              f32_4 %166 = OpLoad %74 
					                              f32_3 %167 = OpVectorShuffle %166 %166 1 2 3 
					                              f32_3 %168 = OpFMul %167 %70 
					                              f32_3 %169 = OpFAdd %168 %72 
					                                             OpStore %165 %169 
					                              f32_3 %171 = OpLoad %80 
					                              f32_3 %172 = OpLoad %165 
					                                f32 %173 = OpDot %171 %172 
					                                             OpStore %170 %173 
					                                f32 %175 = OpLoad %170 
					                                f32 %176 = OpFAdd %175 %95 
					                                             OpStore %174 %176 
					                                f32 %177 = OpLoad %174 
					                                f32 %178 = OpFMul %177 %98 
					                                             OpStore %174 %178 
					                                f32 %179 = OpLoad %174 
					                                f32 %180 = OpExtInst %1 43 %179 %101 %102 
					                                             OpStore %174 %180 
					                                f32 %182 = OpLoad %174 
					                                f32 %183 = OpFMul %182 %106 
					                                f32 %184 = OpFAdd %183 %108 
					                                             OpStore %181 %184 
					                                f32 %185 = OpLoad %174 
					                                f32 %186 = OpLoad %174 
					                                f32 %187 = OpFMul %185 %186 
					                                             OpStore %174 %187 
					                                f32 %189 = OpLoad %174 
					                                f32 %190 = OpLoad %181 
					                                f32 %191 = OpFMul %189 %190 
					                                             OpStore %188 %191 
					                                f32 %192 = OpLoad %181 
					                                f32 %193 = OpLoad %174 
					                                f32 %194 = OpFMul %192 %193 
					                       Private f32* %195 = OpAccessChain %66 %89 
					                                f32 %196 = OpLoad %195 
					                                f32 %197 = OpFAdd %194 %196 
					                       Private f32* %198 = OpAccessChain %66 %89 
					                                             OpStore %198 %197 
					                       Private f32* %199 = OpAccessChain %74 %89 
					                                f32 %200 = OpLoad %199 
					                                f32 %201 = OpLoad %188 
					                                f32 %202 = OpFMul %200 %201 
					                                f32 %203 = OpLoad %122 
					                                f32 %204 = OpFAdd %202 %203 
					                                             OpStore %122 %204 
					                              f32_4 %205 = OpLoad %50 
					                              f32_3 %206 = OpVectorShuffle %205 %205 1 2 3 
					                              f32_3 %207 = OpFMul %206 %70 
					                              f32_3 %208 = OpFAdd %207 %72 
					                                             OpStore %165 %208 
					                              f32_3 %209 = OpLoad %80 
					                              f32_3 %210 = OpLoad %165 
					                                f32 %211 = OpDot %209 %210 
					                                             OpStore %170 %211 
					                                f32 %212 = OpLoad %170 
					                                f32 %213 = OpFAdd %212 %95 
					                                             OpStore %92 %213 
					                                f32 %214 = OpLoad %92 
					                                f32 %215 = OpFMul %214 %98 
					                                             OpStore %92 %215 
					                                f32 %216 = OpLoad %92 
					                                f32 %217 = OpExtInst %1 43 %216 %101 %102 
					                                             OpStore %92 %217 
					                                f32 %218 = OpLoad %92 
					                                f32 %219 = OpFMul %218 %106 
					                                f32 %220 = OpFAdd %219 %108 
					                                             OpStore %104 %220 
					                                f32 %221 = OpLoad %92 
					                                f32 %222 = OpLoad %92 
					                                f32 %223 = OpFMul %221 %222 
					                                             OpStore %92 %223 
					                                f32 %224 = OpLoad %92 
					                                f32 %225 = OpLoad %104 
					                                f32 %226 = OpFMul %224 %225 
					                                             OpStore %113 %226 
					                                f32 %227 = OpLoad %104 
					                                f32 %228 = OpLoad %92 
					                                f32 %229 = OpFMul %227 %228 
					                       Private f32* %230 = OpAccessChain %66 %89 
					                                f32 %231 = OpLoad %230 
					                                f32 %232 = OpFAdd %229 %231 
					                       Private f32* %233 = OpAccessChain %66 %89 
					                                             OpStore %233 %232 
					                       Private f32* %234 = OpAccessChain %50 %89 
					                                f32 %235 = OpLoad %234 
					                                f32 %236 = OpLoad %113 
					                                f32 %237 = OpFMul %235 %236 
					                                f32 %238 = OpLoad %122 
					                                f32 %239 = OpFAdd %237 %238 
					                                             OpStore %122 %239 
					                              f32_4 %240 = OpLoad %146 
					                              f32_3 %241 = OpVectorShuffle %240 %240 1 2 3 
					                              f32_3 %242 = OpFMul %241 %70 
					                              f32_3 %243 = OpFAdd %242 %72 
					                                             OpStore %165 %243 
					                              f32_3 %244 = OpLoad %80 
					                              f32_3 %245 = OpLoad %165 
					                                f32 %246 = OpDot %244 %245 
					                                             OpStore %170 %246 
					                                f32 %248 = OpLoad %170 
					                                f32 %249 = OpFAdd %248 %95 
					                                             OpStore %247 %249 
					                                f32 %250 = OpLoad %247 
					                                f32 %251 = OpFMul %250 %98 
					                                             OpStore %247 %251 
					                                f32 %252 = OpLoad %247 
					                                f32 %253 = OpExtInst %1 43 %252 %101 %102 
					                                             OpStore %247 %253 
					                                f32 %255 = OpLoad %247 
					                                f32 %256 = OpFMul %255 %106 
					                                f32 %257 = OpFAdd %256 %108 
					                                             OpStore %254 %257 
					                                f32 %258 = OpLoad %247 
					                                f32 %259 = OpLoad %247 
					                                f32 %260 = OpFMul %258 %259 
					                                             OpStore %247 %260 
					                                f32 %262 = OpLoad %247 
					                                f32 %263 = OpLoad %254 
					                                f32 %264 = OpFMul %262 %263 
					                                             OpStore %261 %264 
					                                f32 %265 = OpLoad %254 
					                                f32 %266 = OpLoad %247 
					                                f32 %267 = OpFMul %265 %266 
					                       Private f32* %268 = OpAccessChain %66 %89 
					                                f32 %269 = OpLoad %268 
					                                f32 %270 = OpFAdd %267 %269 
					                       Private f32* %271 = OpAccessChain %66 %89 
					                                             OpStore %271 %270 
					                       Private f32* %272 = OpAccessChain %146 %89 
					                                f32 %273 = OpLoad %272 
					                                f32 %274 = OpLoad %261 
					                                f32 %275 = OpFMul %273 %274 
					                                f32 %276 = OpLoad %122 
					                                f32 %277 = OpFAdd %275 %276 
					                                             OpStore %122 %277 
					                                f32 %279 = OpLoad %122 
					                              f32_3 %280 = OpCompositeConstruct %279 %279 %279 
					                              f32_3 %281 = OpLoad %66 
					                              f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
					                              f32_3 %283 = OpFDiv %280 %282 
					                              f32_4 %284 = OpLoad %278 
					                              f32_4 %285 = OpVectorShuffle %284 %283 4 5 6 3 
					                                             OpStore %278 %285 
					                       Private f32* %287 = OpAccessChain %278 %286 
					                                             OpStore %287 %101 
					                              f32_4 %290 = OpLoad %278 
					                              f32_4 %291 = OpVectorShuffle %290 %290 3 3 3 2 
					                                             OpStore %289 %291 
					                              f32_4 %293 = OpLoad %278 
					                                             OpStore %292 %293 
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
						vec4 unused_0_0[7];
						float _Downsample;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[6];
						vec4 _ScreenParams;
						vec4 unused_1_2[2];
					};
					uniform  sampler2D _OcclusionTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec3 u_xlat16_6;
					vec3 u_xlat16_7;
					vec3 u_xlat16_8;
					vec3 u_xlat16_9;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat16_15;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = _ScreenParams.zw + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Downsample, _Downsample));
					    u_xlat1.xy = (-u_xlat0.xy) + vs_TEXCOORD1.xy;
					    u_xlat10_1 = texture(_OcclusionTexture, u_xlat1.xy);
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_2 = texture(_OcclusionTexture, vs_TEXCOORD1.xy);
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_6.x = dot(u_xlat16_7.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
					    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
					    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
					    u_xlat16_11 = u_xlat16_6.x * -2.0 + 3.0;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_11;
					    u_xlat16_1 = u_xlat10_1.x * u_xlat16_6.x + u_xlat10_2.x;
					    u_xlat0.zw = (-u_xlat0.yx);
					    u_xlat3 = u_xlat0.xzwy + vs_TEXCOORD1.xyxy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.xy;
					    u_xlat10_0 = texture(_OcclusionTexture, u_xlat0.xy);
					    u_xlat10_4 = texture(_OcclusionTexture, u_xlat3.xy);
					    u_xlat10_3 = texture(_OcclusionTexture, u_xlat3.zw);
					    u_xlat16_9.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_9.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_4.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_3.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_5.xyz = u_xlat10_0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.x = dot(u_xlat16_7.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.x = u_xlat16_5.x + -0.800000012;
					    u_xlat16_5.x = u_xlat16_5.x * 5.00000048;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_10 = u_xlat16_5.x * -2.0 + 3.0;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
					    u_xlat16_15 = u_xlat16_5.x * u_xlat16_10;
					    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_6.x;
					    u_xlat16_5.x = u_xlat16_5.x + 1.0;
					    u_xlat16_0 = u_xlat10_0.x * u_xlat16_15 + u_xlat16_1;
					    u_xlat0.xyz = vec3(u_xlat16_0) / u_xlat16_5.xxx;
					    u_xlat0.w = 0.0;
					    SV_Target0 = u_xlat0.wwwz;
					    SV_Target1 = u_xlat0;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 533013
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[6];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    u_xlat0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    u_xlat0.xyz = in_TEXCOORD0.xyx;
					    phase0_Output0_1 = u_xlat0;
					    vs_TEXCOORD2.xy = u_xlat0.zw;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec4 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	float _Downsample;
					UNITY_LOCATION(0) uniform  sampler2D _OcclusionTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec3 u_xlat16_6;
					vec3 u_xlat16_7;
					vec3 u_xlat16_8;
					vec3 u_xlat16_9;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat16_15;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy / vec2(vec2(_Downsample, _Downsample));
					    u_xlat1.xy = (-u_xlat0.xy) + vs_TEXCOORD2.xy;
					    u_xlat10_1 = texture(_OcclusionTexture, u_xlat1.xy);
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_2 = texture(_OcclusionTexture, vs_TEXCOORD2.xy);
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_6.x = dot(u_xlat16_7.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
					    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
					    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
					    u_xlat16_11 = u_xlat16_6.x * -2.0 + 3.0;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_11;
					    u_xlat16_1 = u_xlat10_1.x * u_xlat16_6.x + u_xlat10_2.x;
					    u_xlat0.zw = (-u_xlat0.yx);
					    u_xlat3 = u_xlat0.xzwy + vs_TEXCOORD2.xyxy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
					    u_xlat10_0 = texture(_OcclusionTexture, u_xlat0.xy);
					    u_xlat10_4 = texture(_OcclusionTexture, u_xlat3.xy);
					    u_xlat10_3 = texture(_OcclusionTexture, u_xlat3.zw);
					    u_xlat16_9.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_9.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_4.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_3.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_5.xyz = u_xlat10_0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.x = dot(u_xlat16_7.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.x = u_xlat16_5.x + -0.800000012;
					    u_xlat16_5.x = u_xlat16_5.x * 5.00000048;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_10 = u_xlat16_5.x * -2.0 + 3.0;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
					    u_xlat16_15 = u_xlat16_5.x * u_xlat16_10;
					    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_6.x;
					    u_xlat16_5.x = u_xlat16_5.x + 1.0;
					    u_xlat16_0 = u_xlat10_0.x * u_xlat16_15 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 / u_xlat16_5.x;
					    SV_Target0.xyz = (-vec3(u_xlat16_0)) + vec3(1.0, 1.0, 1.0);
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD2.xy);
					    SV_Target0.w = u_xlat10_0.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 139
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %92 %115 %128 %131 
					                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %91 RelaxedPrecision 
					                                                     OpDecorate %92 Location 92 
					                                                     OpDecorate %104 RelaxedPrecision 
					                                                     OpDecorate %109 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD2 Location 115 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 128 
					                                                     OpDecorate %129 RelaxedPrecision 
					                                                     OpDecorate %130 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD1 Location 131 
					                                                     OpDecorate %132 RelaxedPrecision 
					                                                     OpDecorate %133 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                Input f32_4* %92 = OpVariable Input 
					                                             %93 = OpTypePointer Input %6 
					                                         f32 %97 = OpConstant 3,674022E-40 
					                                            %100 = OpTypePointer Function %6 
					                             Private f32_4* %109 = OpVariable Private 
					                                        u32 %111 = OpConstant 3 
					                                            %113 = OpTypeVector %6 2 
					                                            %114 = OpTypePointer Output %113 
					                      Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                            %117 = OpTypePointer Output %6 
					                                            %119 = OpTypeVector %6 3 
					                                        u32 %124 = OpConstant 0 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %101 = OpVariable Function 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %94 = OpAccessChain %92 %68 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpFNegate %95 
					                                         f32 %98 = OpFAdd %96 %97 
					                                                     OpStore %91 %98 
					                                        bool %99 = OpLoad %84 
					                                                     OpSelectionMerge %103 None 
					                                                     OpBranchConditional %99 %102 %105 
					                                            %102 = OpLabel 
					                                        f32 %104 = OpLoad %91 
					                                                     OpStore %101 %104 
					                                                     OpBranch %103 
					                                            %105 = OpLabel 
					                                 Input f32* %106 = OpAccessChain %92 %68 
					                                        f32 %107 = OpLoad %106 
					                                                     OpStore %101 %107 
					                                                     OpBranch %103 
					                                            %103 = OpLabel 
					                                        f32 %108 = OpLoad %101 
					                                                     OpStore %91 %108 
					                                        f32 %110 = OpLoad %91 
					                               Private f32* %112 = OpAccessChain %109 %111 
					                                                     OpStore %112 %110 
					                                        f32 %116 = OpLoad %91 
					                                Output f32* %118 = OpAccessChain vs_TEXCOORD2 %68 
					                                                     OpStore %118 %116 
					                                      f32_4 %120 = OpLoad %92 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 1 0 
					                                      f32_4 %122 = OpLoad %109 
					                                      f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
					                                                     OpStore %109 %123 
					                                 Input f32* %125 = OpAccessChain %92 %124 
					                                        f32 %126 = OpLoad %125 
					                                Output f32* %127 = OpAccessChain vs_TEXCOORD2 %124 
					                                                     OpStore %127 %126 
					                                      f32_4 %129 = OpLoad %109 
					                                      f32_2 %130 = OpVectorShuffle %129 %129 0 1 
					                                                     OpStore vs_TEXCOORD0 %130 
					                                      f32_4 %132 = OpLoad %109 
					                                      f32_2 %133 = OpVectorShuffle %132 %132 2 3 
					                                                     OpStore vs_TEXCOORD1 %133 
					                                Output f32* %134 = OpAccessChain %72 %22 %68 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %136 = OpFNegate %135 
					                                Output f32* %137 = OpAccessChain %72 %22 %68 
					                                                     OpStore %137 %136 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 301
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %38 %278 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                              OpMemberDecorate %10 0 Offset 10 
					                                              OpMemberDecorate %10 1 Offset 10 
					                                              OpDecorate %10 Block 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
					                                              OpDecorate vs_TEXCOORD2 Location 38 
					                                              OpDecorate %39 RelaxedPrecision 
					                                              OpDecorate %43 RelaxedPrecision 
					                                              OpDecorate %46 RelaxedPrecision 
					                                              OpDecorate %46 DescriptorSet 46 
					                                              OpDecorate %46 Binding 46 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %50 RelaxedPrecision 
					                                              OpDecorate %50 DescriptorSet 50 
					                                              OpDecorate %50 Binding 50 
					                                              OpDecorate %51 RelaxedPrecision 
					                                              OpDecorate %59 RelaxedPrecision 
					                                              OpDecorate %60 RelaxedPrecision 
					                                              OpDecorate %61 RelaxedPrecision 
					                                              OpDecorate %64 RelaxedPrecision 
					                                              OpDecorate %67 RelaxedPrecision 
					                                              OpDecorate %68 RelaxedPrecision 
					                                              OpDecorate %69 RelaxedPrecision 
					                                              OpDecorate %70 RelaxedPrecision 
					                                              OpDecorate %72 RelaxedPrecision 
					                                              OpDecorate %73 RelaxedPrecision 
					                                              OpDecorate %74 RelaxedPrecision 
					                                              OpDecorate %75 RelaxedPrecision 
					                                              OpDecorate %76 RelaxedPrecision 
					                                              OpDecorate %77 RelaxedPrecision 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %79 RelaxedPrecision 
					                                              OpDecorate %80 RelaxedPrecision 
					                                              OpDecorate %81 RelaxedPrecision 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %88 RelaxedPrecision 
					                                              OpDecorate %90 RelaxedPrecision 
					                                              OpDecorate %91 RelaxedPrecision 
					                                              OpDecorate %93 RelaxedPrecision 
					                                              OpDecorate %94 RelaxedPrecision 
					                                              OpDecorate %97 RelaxedPrecision 
					                                              OpDecorate %98 RelaxedPrecision 
					                                              OpDecorate %99 RelaxedPrecision 
					                                              OpDecorate %101 RelaxedPrecision 
					                                              OpDecorate %103 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %105 RelaxedPrecision 
					                                              OpDecorate %106 RelaxedPrecision 
					                                              OpDecorate %107 RelaxedPrecision 
					                                              OpDecorate %108 RelaxedPrecision 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %110 RelaxedPrecision 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %114 RelaxedPrecision 
					                                              OpDecorate %116 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %120 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %131 RelaxedPrecision 
					                                              OpDecorate %132 RelaxedPrecision 
					                                              OpDecorate %136 RelaxedPrecision 
					                                              OpDecorate %140 RelaxedPrecision 
					                                              OpDecorate %141 RelaxedPrecision 
					                                              OpDecorate %142 RelaxedPrecision 
					                                              OpDecorate %147 RelaxedPrecision 
					                                              OpDecorate %148 RelaxedPrecision 
					                                              OpDecorate %153 RelaxedPrecision 
					                                              OpDecorate %154 RelaxedPrecision 
					                                              OpDecorate %159 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %161 RelaxedPrecision 
					                                              OpDecorate %162 RelaxedPrecision 
					                                              OpDecorate %163 RelaxedPrecision 
					                                              OpDecorate %164 RelaxedPrecision 
					                                              OpDecorate %165 RelaxedPrecision 
					                                              OpDecorate %166 RelaxedPrecision 
					                                              OpDecorate %167 RelaxedPrecision 
					                                              OpDecorate %168 RelaxedPrecision 
					                                              OpDecorate %169 RelaxedPrecision 
					                                              OpDecorate %170 RelaxedPrecision 
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
					                                              OpDecorate %187 RelaxedPrecision 
					                                              OpDecorate %188 RelaxedPrecision 
					                                              OpDecorate %190 RelaxedPrecision 
					                                              OpDecorate %191 RelaxedPrecision 
					                                              OpDecorate %194 RelaxedPrecision 
					                                              OpDecorate %195 RelaxedPrecision 
					                                              OpDecorate %196 RelaxedPrecision 
					                                              OpDecorate %197 RelaxedPrecision 
					                                              OpDecorate %198 RelaxedPrecision 
					                                              OpDecorate %199 RelaxedPrecision 
					                                              OpDecorate %200 RelaxedPrecision 
					                                              OpDecorate %201 RelaxedPrecision 
					                                              OpDecorate %202 RelaxedPrecision 
					                                              OpDecorate %203 RelaxedPrecision 
					                                              OpDecorate %204 RelaxedPrecision 
					                                              OpDecorate %205 RelaxedPrecision 
					                                              OpDecorate %206 RelaxedPrecision 
					                                              OpDecorate %207 RelaxedPrecision 
					                                              OpDecorate %208 RelaxedPrecision 
					                                              OpDecorate %209 RelaxedPrecision 
					                                              OpDecorate %210 RelaxedPrecision 
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
					                                              OpDecorate %225 RelaxedPrecision 
					                                              OpDecorate %226 RelaxedPrecision 
					                                              OpDecorate %229 RelaxedPrecision 
					                                              OpDecorate %230 RelaxedPrecision 
					                                              OpDecorate %231 RelaxedPrecision 
					                                              OpDecorate %232 RelaxedPrecision 
					                                              OpDecorate %233 RelaxedPrecision 
					                                              OpDecorate %234 RelaxedPrecision 
					                                              OpDecorate %235 RelaxedPrecision 
					                                              OpDecorate %236 RelaxedPrecision 
					                                              OpDecorate %237 RelaxedPrecision 
					                                              OpDecorate %238 RelaxedPrecision 
					                                              OpDecorate %239 RelaxedPrecision 
					                                              OpDecorate %240 RelaxedPrecision 
					                                              OpDecorate %241 RelaxedPrecision 
					                                              OpDecorate %242 RelaxedPrecision 
					                                              OpDecorate %243 RelaxedPrecision 
					                                              OpDecorate %244 RelaxedPrecision 
					                                              OpDecorate %245 RelaxedPrecision 
					                                              OpDecorate %246 RelaxedPrecision 
					                                              OpDecorate %247 RelaxedPrecision 
					                                              OpDecorate %248 RelaxedPrecision 
					                                              OpDecorate %249 RelaxedPrecision 
					                                              OpDecorate %250 RelaxedPrecision 
					                                              OpDecorate %251 RelaxedPrecision 
					                                              OpDecorate %252 RelaxedPrecision 
					                                              OpDecorate %253 RelaxedPrecision 
					                                              OpDecorate %254 RelaxedPrecision 
					                                              OpDecorate %255 RelaxedPrecision 
					                                              OpDecorate %256 RelaxedPrecision 
					                                              OpDecorate %257 RelaxedPrecision 
					                                              OpDecorate %258 RelaxedPrecision 
					                                              OpDecorate %259 RelaxedPrecision 
					                                              OpDecorate %260 RelaxedPrecision 
					                                              OpDecorate %261 RelaxedPrecision 
					                                              OpDecorate %263 RelaxedPrecision 
					                                              OpDecorate %264 RelaxedPrecision 
					                                              OpDecorate %267 RelaxedPrecision 
					                                              OpDecorate %268 RelaxedPrecision 
					                                              OpDecorate %269 RelaxedPrecision 
					                                              OpDecorate %270 RelaxedPrecision 
					                                              OpDecorate %271 RelaxedPrecision 
					                                              OpDecorate %272 RelaxedPrecision 
					                                              OpDecorate %274 RelaxedPrecision 
					                                              OpDecorate %275 RelaxedPrecision 
					                                              OpDecorate %278 RelaxedPrecision 
					                                              OpDecorate %278 Location 278 
					                                              OpDecorate %279 RelaxedPrecision 
					                                              OpDecorate %280 RelaxedPrecision 
					                                              OpDecorate %281 RelaxedPrecision 
					                                              OpDecorate %283 RelaxedPrecision 
					                                              OpDecorate %286 RelaxedPrecision 
					                                              OpDecorate %286 DescriptorSet 286 
					                                              OpDecorate %286 Binding 286 
					                                              OpDecorate %287 RelaxedPrecision 
					                                              OpDecorate %288 RelaxedPrecision 
					                                              OpDecorate %288 DescriptorSet 288 
					                                              OpDecorate %288 Binding 288 
					                                              OpDecorate %289 RelaxedPrecision 
					                                              OpDecorate %291 RelaxedPrecision 
					                                              OpDecorate %292 RelaxedPrecision 
					                                              OpDecorate %294 RelaxedPrecision 
					                                              OpDecorate %297 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeStruct %7 %6 
					                                      %11 = OpTypePointer Uniform %10 
					        Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
					                                      %13 = OpTypeInt 32 1 
					                                  i32 %14 = OpConstant 0 
					                                      %15 = OpTypeVector %6 2 
					                                      %16 = OpTypePointer Uniform %7 
					                                  i32 %20 = OpConstant 1 
					                                      %21 = OpTypePointer Uniform %6 
					                       Private f32_4* %33 = OpVariable Private 
					                                      %37 = OpTypePointer Input %15 
					                Input f32_2* vs_TEXCOORD2 = OpVariable Input 
					                       Private f32_4* %43 = OpVariable Private 
					                                      %44 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                      %45 = OpTypePointer UniformConstant %44 
					 UniformConstant read_only Texture2D* %46 = OpVariable UniformConstant 
					                                      %48 = OpTypeSampler 
					                                      %49 = OpTypePointer UniformConstant %48 
					             UniformConstant sampler* %50 = OpVariable UniformConstant 
					                                      %52 = OpTypeSampledImage %44 
					                                      %57 = OpTypeVector %6 3 
					                                      %58 = OpTypePointer Private %57 
					                       Private f32_3* %59 = OpVariable Private 
					                                  f32 %62 = OpConstant 3,674022E-40 
					                                f32_3 %63 = OpConstantComposite %62 %62 %62 
					                                  f32 %65 = OpConstant 3,674022E-40 
					                                f32_3 %66 = OpConstantComposite %65 %65 %65 
					                       Private f32_4* %68 = OpVariable Private 
					                       Private f32_3* %74 = OpVariable Private 
					                                      %82 = OpTypeInt 32 0 
					                                  u32 %83 = OpConstant 0 
					                                      %84 = OpTypePointer Private %6 
					                         Private f32* %86 = OpVariable Private 
					                                  f32 %89 = OpConstant 3,674022E-40 
					                                  f32 %92 = OpConstant 3,674022E-40 
					                                  f32 %95 = OpConstant 3,674022E-40 
					                                  f32 %96 = OpConstant 3,674022E-40 
					                         Private f32* %98 = OpVariable Private 
					                                 f32 %100 = OpConstant 3,674022E-40 
					                                 f32 %102 = OpConstant 3,674022E-40 
					                        Private f32* %107 = OpVariable Private 
					                        Private f32* %116 = OpVariable Private 
					                      Private f32_4* %140 = OpVariable Private 
					                      Private f32_3* %159 = OpVariable Private 
					                        Private f32* %164 = OpVariable Private 
					                        Private f32* %168 = OpVariable Private 
					                        Private f32* %175 = OpVariable Private 
					                        Private f32* %182 = OpVariable Private 
					                        Private f32* %241 = OpVariable Private 
					                        Private f32* %248 = OpVariable Private 
					                        Private f32* %255 = OpVariable Private 
					                                     %277 = OpTypePointer Output %7 
					                       Output f32_4* %278 = OpVariable Output 
					                               f32_3 %282 = OpConstantComposite %96 %96 %96 
					UniformConstant read_only Texture2D* %286 = OpVariable UniformConstant 
					            UniformConstant sampler* %288 = OpVariable UniformConstant 
					                                 u32 %293 = OpConstant 3 
					                                     %298 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                       Uniform f32_4* %17 = OpAccessChain %12 %14 
					                                f32_4 %18 = OpLoad %17 
					                                f32_2 %19 = OpVectorShuffle %18 %18 0 1 
					                         Uniform f32* %22 = OpAccessChain %12 %20 
					                                  f32 %23 = OpLoad %22 
					                         Uniform f32* %24 = OpAccessChain %12 %20 
					                                  f32 %25 = OpLoad %24 
					                                f32_2 %26 = OpCompositeConstruct %23 %25 
					                                  f32 %27 = OpCompositeExtract %26 0 
					                                  f32 %28 = OpCompositeExtract %26 1 
					                                f32_2 %29 = OpCompositeConstruct %27 %28 
					                                f32_2 %30 = OpFDiv %19 %29 
					                                f32_4 %31 = OpLoad %9 
					                                f32_4 %32 = OpVectorShuffle %31 %30 4 5 2 3 
					                                              OpStore %9 %32 
					                                f32_4 %34 = OpLoad %9 
					                                f32_2 %35 = OpVectorShuffle %34 %34 0 1 
					                                f32_2 %36 = OpFNegate %35 
					                                f32_2 %39 = OpLoad vs_TEXCOORD2 
					                                f32_2 %40 = OpFAdd %36 %39 
					                                f32_4 %41 = OpLoad %33 
					                                f32_4 %42 = OpVectorShuffle %41 %40 4 5 2 3 
					                                              OpStore %33 %42 
					                  read_only Texture2D %47 = OpLoad %46 
					                              sampler %51 = OpLoad %50 
					           read_only Texture2DSampled %53 = OpSampledImage %47 %51 
					                                f32_4 %54 = OpLoad %33 
					                                f32_2 %55 = OpVectorShuffle %54 %54 0 1 
					                                f32_4 %56 = OpImageSampleImplicitLod %53 %55 
					                                              OpStore %43 %56 
					                                f32_4 %60 = OpLoad %43 
					                                f32_3 %61 = OpVectorShuffle %60 %60 1 2 3 
					                                f32_3 %64 = OpFMul %61 %63 
					                                f32_3 %67 = OpFAdd %64 %66 
					                                              OpStore %59 %67 
					                  read_only Texture2D %69 = OpLoad %46 
					                              sampler %70 = OpLoad %50 
					           read_only Texture2DSampled %71 = OpSampledImage %69 %70 
					                                f32_2 %72 = OpLoad vs_TEXCOORD2 
					                                f32_4 %73 = OpImageSampleImplicitLod %71 %72 
					                                              OpStore %68 %73 
					                                f32_4 %75 = OpLoad %68 
					                                f32_3 %76 = OpVectorShuffle %75 %75 1 2 3 
					                                f32_3 %77 = OpFMul %76 %63 
					                                f32_3 %78 = OpFAdd %77 %66 
					                                              OpStore %74 %78 
					                                f32_3 %79 = OpLoad %74 
					                                f32_3 %80 = OpLoad %59 
					                                  f32 %81 = OpDot %79 %80 
					                         Private f32* %85 = OpAccessChain %59 %83 
					                                              OpStore %85 %81 
					                         Private f32* %87 = OpAccessChain %59 %83 
					                                  f32 %88 = OpLoad %87 
					                                  f32 %90 = OpFAdd %88 %89 
					                                              OpStore %86 %90 
					                                  f32 %91 = OpLoad %86 
					                                  f32 %93 = OpFMul %91 %92 
					                                              OpStore %86 %93 
					                                  f32 %94 = OpLoad %86 
					                                  f32 %97 = OpExtInst %1 43 %94 %95 %96 
					                                              OpStore %86 %97 
					                                  f32 %99 = OpLoad %86 
					                                 f32 %101 = OpFMul %99 %100 
					                                 f32 %103 = OpFAdd %101 %102 
					                                              OpStore %98 %103 
					                                 f32 %104 = OpLoad %86 
					                                 f32 %105 = OpLoad %86 
					                                 f32 %106 = OpFMul %104 %105 
					                                              OpStore %86 %106 
					                                 f32 %108 = OpLoad %86 
					                                 f32 %109 = OpLoad %98 
					                                 f32 %110 = OpFMul %108 %109 
					                                              OpStore %107 %110 
					                                 f32 %111 = OpLoad %98 
					                                 f32 %112 = OpLoad %86 
					                                 f32 %113 = OpFMul %111 %112 
					                                 f32 %114 = OpFAdd %113 %96 
					                        Private f32* %115 = OpAccessChain %59 %83 
					                                              OpStore %115 %114 
					                        Private f32* %117 = OpAccessChain %43 %83 
					                                 f32 %118 = OpLoad %117 
					                                 f32 %119 = OpLoad %107 
					                                 f32 %120 = OpFMul %118 %119 
					                        Private f32* %121 = OpAccessChain %68 %83 
					                                 f32 %122 = OpLoad %121 
					                                 f32 %123 = OpFAdd %120 %122 
					                                              OpStore %116 %123 
					                               f32_4 %124 = OpLoad %9 
					                               f32_2 %125 = OpVectorShuffle %124 %124 1 0 
					                               f32_2 %126 = OpFNegate %125 
					                               f32_4 %127 = OpLoad %9 
					                               f32_4 %128 = OpVectorShuffle %127 %126 0 1 4 5 
					                                              OpStore %9 %128 
					                               f32_4 %129 = OpLoad %9 
					                               f32_4 %130 = OpVectorShuffle %129 %129 0 2 3 1 
					                               f32_2 %131 = OpLoad vs_TEXCOORD2 
					                               f32_4 %132 = OpVectorShuffle %131 %131 0 1 0 1 
					                               f32_4 %133 = OpFAdd %130 %132 
					                                              OpStore %33 %133 
					                               f32_4 %134 = OpLoad %9 
					                               f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                               f32_2 %136 = OpLoad vs_TEXCOORD2 
					                               f32_2 %137 = OpFAdd %135 %136 
					                               f32_4 %138 = OpLoad %9 
					                               f32_4 %139 = OpVectorShuffle %138 %137 4 5 2 3 
					                                              OpStore %9 %139 
					                 read_only Texture2D %141 = OpLoad %46 
					                             sampler %142 = OpLoad %50 
					          read_only Texture2DSampled %143 = OpSampledImage %141 %142 
					                               f32_4 %144 = OpLoad %9 
					                               f32_2 %145 = OpVectorShuffle %144 %144 0 1 
					                               f32_4 %146 = OpImageSampleImplicitLod %143 %145 
					                                              OpStore %140 %146 
					                 read_only Texture2D %147 = OpLoad %46 
					                             sampler %148 = OpLoad %50 
					          read_only Texture2DSampled %149 = OpSampledImage %147 %148 
					                               f32_4 %150 = OpLoad %33 
					                               f32_2 %151 = OpVectorShuffle %150 %150 0 1 
					                               f32_4 %152 = OpImageSampleImplicitLod %149 %151 
					                                              OpStore %68 %152 
					                 read_only Texture2D %153 = OpLoad %46 
					                             sampler %154 = OpLoad %50 
					          read_only Texture2DSampled %155 = OpSampledImage %153 %154 
					                               f32_4 %156 = OpLoad %33 
					                               f32_2 %157 = OpVectorShuffle %156 %156 2 3 
					                               f32_4 %158 = OpImageSampleImplicitLod %155 %157 
					                                              OpStore %43 %158 
					                               f32_4 %160 = OpLoad %68 
					                               f32_3 %161 = OpVectorShuffle %160 %160 1 2 3 
					                               f32_3 %162 = OpFMul %161 %63 
					                               f32_3 %163 = OpFAdd %162 %66 
					                                              OpStore %159 %163 
					                               f32_3 %165 = OpLoad %74 
					                               f32_3 %166 = OpLoad %159 
					                                 f32 %167 = OpDot %165 %166 
					                                              OpStore %164 %167 
					                                 f32 %169 = OpLoad %164 
					                                 f32 %170 = OpFAdd %169 %89 
					                                              OpStore %168 %170 
					                                 f32 %171 = OpLoad %168 
					                                 f32 %172 = OpFMul %171 %92 
					                                              OpStore %168 %172 
					                                 f32 %173 = OpLoad %168 
					                                 f32 %174 = OpExtInst %1 43 %173 %95 %96 
					                                              OpStore %168 %174 
					                                 f32 %176 = OpLoad %168 
					                                 f32 %177 = OpFMul %176 %100 
					                                 f32 %178 = OpFAdd %177 %102 
					                                              OpStore %175 %178 
					                                 f32 %179 = OpLoad %168 
					                                 f32 %180 = OpLoad %168 
					                                 f32 %181 = OpFMul %179 %180 
					                                              OpStore %168 %181 
					                                 f32 %183 = OpLoad %168 
					                                 f32 %184 = OpLoad %175 
					                                 f32 %185 = OpFMul %183 %184 
					                                              OpStore %182 %185 
					                                 f32 %186 = OpLoad %175 
					                                 f32 %187 = OpLoad %168 
					                                 f32 %188 = OpFMul %186 %187 
					                        Private f32* %189 = OpAccessChain %59 %83 
					                                 f32 %190 = OpLoad %189 
					                                 f32 %191 = OpFAdd %188 %190 
					                        Private f32* %192 = OpAccessChain %59 %83 
					                                              OpStore %192 %191 
					                        Private f32* %193 = OpAccessChain %68 %83 
					                                 f32 %194 = OpLoad %193 
					                                 f32 %195 = OpLoad %182 
					                                 f32 %196 = OpFMul %194 %195 
					                                 f32 %197 = OpLoad %116 
					                                 f32 %198 = OpFAdd %196 %197 
					                                              OpStore %116 %198 
					                               f32_4 %199 = OpLoad %43 
					                               f32_3 %200 = OpVectorShuffle %199 %199 1 2 3 
					                               f32_3 %201 = OpFMul %200 %63 
					                               f32_3 %202 = OpFAdd %201 %66 
					                                              OpStore %159 %202 
					                               f32_3 %203 = OpLoad %74 
					                               f32_3 %204 = OpLoad %159 
					                                 f32 %205 = OpDot %203 %204 
					                                              OpStore %164 %205 
					                                 f32 %206 = OpLoad %164 
					                                 f32 %207 = OpFAdd %206 %89 
					                                              OpStore %86 %207 
					                                 f32 %208 = OpLoad %86 
					                                 f32 %209 = OpFMul %208 %92 
					                                              OpStore %86 %209 
					                                 f32 %210 = OpLoad %86 
					                                 f32 %211 = OpExtInst %1 43 %210 %95 %96 
					                                              OpStore %86 %211 
					                                 f32 %212 = OpLoad %86 
					                                 f32 %213 = OpFMul %212 %100 
					                                 f32 %214 = OpFAdd %213 %102 
					                                              OpStore %98 %214 
					                                 f32 %215 = OpLoad %86 
					                                 f32 %216 = OpLoad %86 
					                                 f32 %217 = OpFMul %215 %216 
					                                              OpStore %86 %217 
					                                 f32 %218 = OpLoad %86 
					                                 f32 %219 = OpLoad %98 
					                                 f32 %220 = OpFMul %218 %219 
					                                              OpStore %107 %220 
					                                 f32 %221 = OpLoad %98 
					                                 f32 %222 = OpLoad %86 
					                                 f32 %223 = OpFMul %221 %222 
					                        Private f32* %224 = OpAccessChain %59 %83 
					                                 f32 %225 = OpLoad %224 
					                                 f32 %226 = OpFAdd %223 %225 
					                        Private f32* %227 = OpAccessChain %59 %83 
					                                              OpStore %227 %226 
					                        Private f32* %228 = OpAccessChain %43 %83 
					                                 f32 %229 = OpLoad %228 
					                                 f32 %230 = OpLoad %107 
					                                 f32 %231 = OpFMul %229 %230 
					                                 f32 %232 = OpLoad %116 
					                                 f32 %233 = OpFAdd %231 %232 
					                                              OpStore %116 %233 
					                               f32_4 %234 = OpLoad %140 
					                               f32_3 %235 = OpVectorShuffle %234 %234 1 2 3 
					                               f32_3 %236 = OpFMul %235 %63 
					                               f32_3 %237 = OpFAdd %236 %66 
					                                              OpStore %159 %237 
					                               f32_3 %238 = OpLoad %74 
					                               f32_3 %239 = OpLoad %159 
					                                 f32 %240 = OpDot %238 %239 
					                                              OpStore %164 %240 
					                                 f32 %242 = OpLoad %164 
					                                 f32 %243 = OpFAdd %242 %89 
					                                              OpStore %241 %243 
					                                 f32 %244 = OpLoad %241 
					                                 f32 %245 = OpFMul %244 %92 
					                                              OpStore %241 %245 
					                                 f32 %246 = OpLoad %241 
					                                 f32 %247 = OpExtInst %1 43 %246 %95 %96 
					                                              OpStore %241 %247 
					                                 f32 %249 = OpLoad %241 
					                                 f32 %250 = OpFMul %249 %100 
					                                 f32 %251 = OpFAdd %250 %102 
					                                              OpStore %248 %251 
					                                 f32 %252 = OpLoad %241 
					                                 f32 %253 = OpLoad %241 
					                                 f32 %254 = OpFMul %252 %253 
					                                              OpStore %241 %254 
					                                 f32 %256 = OpLoad %241 
					                                 f32 %257 = OpLoad %248 
					                                 f32 %258 = OpFMul %256 %257 
					                                              OpStore %255 %258 
					                                 f32 %259 = OpLoad %248 
					                                 f32 %260 = OpLoad %241 
					                                 f32 %261 = OpFMul %259 %260 
					                        Private f32* %262 = OpAccessChain %59 %83 
					                                 f32 %263 = OpLoad %262 
					                                 f32 %264 = OpFAdd %261 %263 
					                        Private f32* %265 = OpAccessChain %59 %83 
					                                              OpStore %265 %264 
					                        Private f32* %266 = OpAccessChain %140 %83 
					                                 f32 %267 = OpLoad %266 
					                                 f32 %268 = OpLoad %255 
					                                 f32 %269 = OpFMul %267 %268 
					                                 f32 %270 = OpLoad %116 
					                                 f32 %271 = OpFAdd %269 %270 
					                                              OpStore %116 %271 
					                                 f32 %272 = OpLoad %116 
					                        Private f32* %273 = OpAccessChain %59 %83 
					                                 f32 %274 = OpLoad %273 
					                                 f32 %275 = OpFDiv %272 %274 
					                        Private f32* %276 = OpAccessChain %59 %83 
					                                              OpStore %276 %275 
					                               f32_3 %279 = OpLoad %59 
					                               f32_3 %280 = OpVectorShuffle %279 %279 0 0 0 
					                               f32_3 %281 = OpFNegate %280 
					                               f32_3 %283 = OpFAdd %281 %282 
					                               f32_4 %284 = OpLoad %278 
					                               f32_4 %285 = OpVectorShuffle %284 %283 4 5 6 3 
					                                              OpStore %278 %285 
					                 read_only Texture2D %287 = OpLoad %286 
					                             sampler %289 = OpLoad %288 
					          read_only Texture2DSampled %290 = OpSampledImage %287 %289 
					                               f32_2 %291 = OpLoad vs_TEXCOORD2 
					                               f32_4 %292 = OpImageSampleImplicitLod %290 %291 
					                                 f32 %294 = OpCompositeExtract %292 3 
					                        Private f32* %295 = OpAccessChain %140 %83 
					                                              OpStore %295 %294 
					                        Private f32* %296 = OpAccessChain %140 %83 
					                                 f32 %297 = OpLoad %296 
					                         Output f32* %299 = OpAccessChain %278 %293 
					                                              OpStore %299 %297 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[4];
						float _Downsample;
						vec4 unused_0_4;
					};
					uniform  sampler2D _OcclusionTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					float u_xlat16_1;
					vec4 u_xlat10_1;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec3 u_xlat16_5;
					vec3 u_xlat16_6;
					vec3 u_xlat16_7;
					vec3 u_xlat16_8;
					vec3 u_xlat16_9;
					float u_xlat16_10;
					float u_xlat16_11;
					float u_xlat16_15;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = _MainTex_TexelSize.xy / vec2(vec2(_Downsample, _Downsample));
					    u_xlat1.xy = (-u_xlat0.xy) + vs_TEXCOORD2.xy;
					    u_xlat10_1 = texture(_OcclusionTexture, u_xlat1.xy);
					    u_xlat16_6.xyz = u_xlat10_1.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat10_2 = texture(_OcclusionTexture, vs_TEXCOORD2.xy);
					    u_xlat16_7.xyz = u_xlat10_2.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_6.x = dot(u_xlat16_7.xyz, u_xlat16_6.xyz);
					    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
					    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
					    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
					    u_xlat16_11 = u_xlat16_6.x * -2.0 + 3.0;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
					    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_11;
					    u_xlat16_1 = u_xlat10_1.x * u_xlat16_6.x + u_xlat10_2.x;
					    u_xlat0.zw = (-u_xlat0.yx);
					    u_xlat3 = u_xlat0.xzwy + vs_TEXCOORD2.xyxy;
					    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
					    u_xlat10_0 = texture(_OcclusionTexture, u_xlat0.xy);
					    u_xlat10_4 = texture(_OcclusionTexture, u_xlat3.xy);
					    u_xlat10_3 = texture(_OcclusionTexture, u_xlat3.zw);
					    u_xlat16_9.xyz = u_xlat10_4.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_9.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_4.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_8.xyz = u_xlat10_3.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_11 = dot(u_xlat16_7.xyz, u_xlat16_8.xyz);
					    u_xlat16_11 = u_xlat16_11 + -0.800000012;
					    u_xlat16_11 = u_xlat16_11 * 5.00000048;
					    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
					    u_xlat16_16 = u_xlat16_11 * -2.0 + 3.0;
					    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
					    u_xlat16_2 = u_xlat16_11 * u_xlat16_16;
					    u_xlat16_6.x = u_xlat16_16 * u_xlat16_11 + u_xlat16_6.x;
					    u_xlat16_1 = u_xlat10_3.x * u_xlat16_2 + u_xlat16_1;
					    u_xlat16_5.xyz = u_xlat10_0.yzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_5.x = dot(u_xlat16_7.xyz, u_xlat16_5.xyz);
					    u_xlat16_5.x = u_xlat16_5.x + -0.800000012;
					    u_xlat16_5.x = u_xlat16_5.x * 5.00000048;
					    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
					    u_xlat16_10 = u_xlat16_5.x * -2.0 + 3.0;
					    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
					    u_xlat16_15 = u_xlat16_5.x * u_xlat16_10;
					    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_6.x;
					    u_xlat16_5.x = u_xlat16_5.x + 1.0;
					    u_xlat16_0 = u_xlat10_0.x * u_xlat16_15 + u_xlat16_1;
					    u_xlat16_0 = u_xlat16_0 / u_xlat16_5.x;
					    SV_Target0.xyz = (-vec3(u_xlat16_0)) + vec3(1.0, 1.0, 1.0);
					    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD2.xy);
					    SV_Target0.w = u_xlat10_0.w;
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