Shader "CameraFilterPack/Vision_Rainbow" {
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
			GpuProgramID 2309
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					bvec3 u_xlatb2;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat12;
					bool u_xlatb12;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = u_xlat0.yx + (-vec2(_Value3, _Value2));
					    u_xlat1.x = max(abs(u_xlat8.y), abs(u_xlat8.x));
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat5 = min(abs(u_xlat8.y), abs(u_xlat8.x));
					    u_xlat1.x = u_xlat1.x * u_xlat5;
					    u_xlat5 = u_xlat1.x * u_xlat1.x;
					    u_xlat9 = u_xlat5 * 0.0208350997 + -0.0851330012;
					    u_xlat9 = u_xlat5 * u_xlat9 + 0.180141002;
					    u_xlat9 = u_xlat5 * u_xlat9 + -0.330299497;
					    u_xlat5 = u_xlat5 * u_xlat9 + 0.999866009;
					    u_xlat9 = u_xlat5 * u_xlat1.x;
					    u_xlat9 = u_xlat9 * -2.0 + 1.57079637;
					    u_xlatb13 = abs(u_xlat8.y)<abs(u_xlat8.x);
					    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
					    u_xlat1.x = u_xlat1.x * u_xlat5 + u_xlat9;
					    u_xlatb5 = u_xlat8.y<(-u_xlat8.y);
					    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
					    u_xlat1.x = u_xlat5 + u_xlat1.x;
					    u_xlat5 = min(u_xlat8.y, u_xlat8.x);
					    u_xlat8.x = max(u_xlat8.y, u_xlat8.x);
					    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
					    u_xlatb12 = u_xlat5<(-u_xlat5);
					    u_xlatb8 = u_xlatb8 && u_xlatb12;
					    u_xlat8.x = (u_xlatb8) ? (-u_xlat1.x) : u_xlat1.x;
					    u_xlat12 = _TimeX * _Value + 20.0;
					    u_xlat8.x = _Value4 * u_xlat8.x + u_xlat12;
					    u_xlat1.xyz = u_xlat8.xxx * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlatb2.xyz = greaterThanEqual(u_xlat1.xyzx, (-u_xlat1.xyzx)).xyz;
					    u_xlat1.xyz = fract(abs(u_xlat1.xyz));
					    {
					        vec3 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat1.y : (-u_xlat1.y);
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat1.z : (-u_xlat1.z);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(2.0, 2.0, 2.0) + vec3(3.0, 3.0, 3.0);
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = (-u_xlat0.xy) + vec2(_Value2, _Value3);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value5);
					    u_xlat0.x = u_xlat0.x * -2.85714293;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat1.xyz + (-u_xlat10_3.xyz);
					    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
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
					; Bound: 386
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %373 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %14 0 Offset 14 
					                                                      OpMemberDecorate %14 1 Offset 14 
					                                                      OpMemberDecorate %14 2 Offset 14 
					                                                      OpMemberDecorate %14 3 Offset 14 
					                                                      OpMemberDecorate %14 4 Offset 14 
					                                                      OpMemberDecorate %14 5 Offset 14 
					                                                      OpMemberDecorate %14 6 RelaxedPrecision 
					                                                      OpMemberDecorate %14 6 Offset 14 
					                                                      OpDecorate %14 Block 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate %21 RelaxedPrecision 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %25 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %302 DescriptorSet 302 
					                                                      OpDecorate %302 Binding 302 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %306 RelaxedPrecision 
					                                                      OpDecorate %306 DescriptorSet 306 
					                                                      OpDecorate %306 Binding 306 
					                                                      OpDecorate %307 RelaxedPrecision 
					                                                      OpDecorate %312 RelaxedPrecision 
					                                                      OpDecorate %350 RelaxedPrecision 
					                                                      OpDecorate %351 RelaxedPrecision 
					                                                      OpDecorate %373 Location 373 
					                                                      OpDecorate %378 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeVector %6 4 
					                                              %14 = OpTypeStruct %6 %6 %6 %6 %6 %6 %13 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 6 
					                                              %19 = OpTypePointer Uniform %13 
					                               Private f32_2* %28 = OpVariable Private 
					                                          i32 %31 = OpConstant 3 
					                                              %32 = OpTypePointer Uniform %6 
					                                          i32 %35 = OpConstant 2 
					                                              %41 = OpTypeVector %6 3 
					                                              %42 = OpTypePointer Private %41 
					                               Private f32_3* %43 = OpVariable Private 
					                                              %44 = OpTypeInt 32 0 
					                                          u32 %45 = OpConstant 1 
					                                              %46 = OpTypePointer Private %6 
					                                          u32 %50 = OpConstant 0 
					                                          f32 %56 = OpConstant 3,674022E-40 
					                                 Private f32* %61 = OpVariable Private 
					                                 Private f32* %79 = OpVariable Private 
					                                          f32 %81 = OpConstant 3,674022E-40 
					                                          f32 %83 = OpConstant 3,674022E-40 
					                                          f32 %88 = OpConstant 3,674022E-40 
					                                          f32 %93 = OpConstant 3,674022E-40 
					                                          f32 %98 = OpConstant 3,674022E-40 
					                                         f32 %105 = OpConstant 3,674022E-40 
					                                         f32 %107 = OpConstant 3,674022E-40 
					                                             %109 = OpTypeBool 
					                                             %110 = OpTypePointer Private %109 
					                               Private bool* %111 = OpVariable Private 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                               Private bool* %130 = OpVariable Private 
					                                         f32 %138 = OpConstant 3,674022E-40 
					                               Private bool* %156 = OpVariable Private 
					                               Private bool* %163 = OpVariable Private 
					                                             %172 = OpTypePointer Function %6 
					                                Private f32* %184 = OpVariable Private 
					                                         i32 %185 = OpConstant 0 
					                                         i32 %188 = OpConstant 1 
					                                         f32 %192 = OpConstant 3,674022E-40 
					                                         i32 %194 = OpConstant 4 
					                                         f32 %205 = OpConstant 3,674022E-40 
					                                       f32_3 %206 = OpConstantComposite %205 %205 %205 
					                                         f32 %208 = OpConstant 3,674022E-40 
					                                         f32 %209 = OpConstant 3,674022E-40 
					                                       f32_3 %210 = OpConstantComposite %121 %208 %209 
					                                         f32 %213 = OpConstant 3,674022E-40 
					                                       f32_3 %214 = OpConstantComposite %213 %213 %213 
					                                             %216 = OpTypeVector %109 3 
					                                             %217 = OpTypePointer Private %216 
					                             Private bool_3* %218 = OpVariable Private 
					                                             %224 = OpTypeVector %109 4 
					                                             %230 = OpTypePointer Function %41 
					                                         u32 %259 = OpConstant 2 
					                                         f32 %276 = OpConstant 3,674022E-40 
					                                       f32_3 %277 = OpConstantComposite %276 %276 %276 
					                                         f32 %281 = OpConstant 3,674022E-40 
					                                       f32_3 %282 = OpConstantComposite %281 %281 %281 
					                              Private f32_3* %288 = OpVariable Private 
					                                       f32_3 %294 = OpConstantComposite %209 %209 %209 
					                                         f32 %296 = OpConstant 3,674022E-40 
					                                       f32_3 %297 = OpConstantComposite %296 %296 %296 
					                              Private f32_3* %299 = OpVariable Private 
					                                             %300 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %301 = OpTypePointer UniformConstant %300 
					        UniformConstant read_only Texture2D* %302 = OpVariable UniformConstant 
					                                             %304 = OpTypeSampler 
					                                             %305 = OpTypePointer UniformConstant %304 
					                    UniformConstant sampler* %306 = OpVariable UniformConstant 
					                                             %308 = OpTypeSampledImage %300 
					                                         i32 %331 = OpConstant 5 
					                                         f32 %339 = OpConstant 3,674022E-40 
					                              Private f32_3* %346 = OpVariable Private 
					                                             %372 = OpTypePointer Output %13 
					                               Output f32_4* %373 = OpVariable Output 
					                                         u32 %382 = OpConstant 3 
					                                             %383 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %173 = OpVariable Function 
					                             Function f32_3* %231 = OpVariable Function 
					                               Function f32* %235 = OpVariable Function 
					                               Function f32* %248 = OpVariable Function 
					                               Function f32* %262 = OpVariable Function 
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
					                                        f32_2 %30 = OpVectorShuffle %29 %29 1 0 
					                                 Uniform f32* %33 = OpAccessChain %16 %31 
					                                          f32 %34 = OpLoad %33 
					                                 Uniform f32* %36 = OpAccessChain %16 %35 
					                                          f32 %37 = OpLoad %36 
					                                        f32_2 %38 = OpCompositeConstruct %34 %37 
					                                        f32_2 %39 = OpFNegate %38 
					                                        f32_2 %40 = OpFAdd %30 %39 
					                                                      OpStore %28 %40 
					                                 Private f32* %47 = OpAccessChain %28 %45 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpExtInst %1 4 %48 
					                                 Private f32* %51 = OpAccessChain %28 %50 
					                                          f32 %52 = OpLoad %51 
					                                          f32 %53 = OpExtInst %1 4 %52 
					                                          f32 %54 = OpExtInst %1 40 %49 %53 
					                                 Private f32* %55 = OpAccessChain %43 %50 
					                                                      OpStore %55 %54 
					                                 Private f32* %57 = OpAccessChain %43 %50 
					                                          f32 %58 = OpLoad %57 
					                                          f32 %59 = OpFDiv %56 %58 
					                                 Private f32* %60 = OpAccessChain %43 %50 
					                                                      OpStore %60 %59 
					                                 Private f32* %62 = OpAccessChain %28 %45 
					                                          f32 %63 = OpLoad %62 
					                                          f32 %64 = OpExtInst %1 4 %63 
					                                 Private f32* %65 = OpAccessChain %28 %50 
					                                          f32 %66 = OpLoad %65 
					                                          f32 %67 = OpExtInst %1 4 %66 
					                                          f32 %68 = OpExtInst %1 37 %64 %67 
					                                                      OpStore %61 %68 
					                                 Private f32* %69 = OpAccessChain %43 %50 
					                                          f32 %70 = OpLoad %69 
					                                          f32 %71 = OpLoad %61 
					                                          f32 %72 = OpFMul %70 %71 
					                                 Private f32* %73 = OpAccessChain %43 %50 
					                                                      OpStore %73 %72 
					                                 Private f32* %74 = OpAccessChain %43 %50 
					                                          f32 %75 = OpLoad %74 
					                                 Private f32* %76 = OpAccessChain %43 %50 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpFMul %75 %77 
					                                                      OpStore %61 %78 
					                                          f32 %80 = OpLoad %61 
					                                          f32 %82 = OpFMul %80 %81 
					                                          f32 %84 = OpFAdd %82 %83 
					                                                      OpStore %79 %84 
					                                          f32 %85 = OpLoad %61 
					                                          f32 %86 = OpLoad %79 
					                                          f32 %87 = OpFMul %85 %86 
					                                          f32 %89 = OpFAdd %87 %88 
					                                                      OpStore %79 %89 
					                                          f32 %90 = OpLoad %61 
					                                          f32 %91 = OpLoad %79 
					                                          f32 %92 = OpFMul %90 %91 
					                                          f32 %94 = OpFAdd %92 %93 
					                                                      OpStore %79 %94 
					                                          f32 %95 = OpLoad %61 
					                                          f32 %96 = OpLoad %79 
					                                          f32 %97 = OpFMul %95 %96 
					                                          f32 %99 = OpFAdd %97 %98 
					                                                      OpStore %61 %99 
					                                         f32 %100 = OpLoad %61 
					                                Private f32* %101 = OpAccessChain %43 %50 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpFMul %100 %102 
					                                                      OpStore %79 %103 
					                                         f32 %104 = OpLoad %79 
					                                         f32 %106 = OpFMul %104 %105 
					                                         f32 %108 = OpFAdd %106 %107 
					                                                      OpStore %79 %108 
					                                Private f32* %112 = OpAccessChain %28 %45 
					                                         f32 %113 = OpLoad %112 
					                                         f32 %114 = OpExtInst %1 4 %113 
					                                Private f32* %115 = OpAccessChain %28 %50 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpExtInst %1 4 %116 
					                                        bool %118 = OpFOrdLessThan %114 %117 
					                                                      OpStore %111 %118 
					                                        bool %119 = OpLoad %111 
					                                         f32 %120 = OpLoad %79 
					                                         f32 %122 = OpSelect %119 %120 %121 
					                                                      OpStore %79 %122 
					                                Private f32* %123 = OpAccessChain %43 %50 
					                                         f32 %124 = OpLoad %123 
					                                         f32 %125 = OpLoad %61 
					                                         f32 %126 = OpFMul %124 %125 
					                                         f32 %127 = OpLoad %79 
					                                         f32 %128 = OpFAdd %126 %127 
					                                Private f32* %129 = OpAccessChain %43 %50 
					                                                      OpStore %129 %128 
					                                Private f32* %131 = OpAccessChain %28 %45 
					                                         f32 %132 = OpLoad %131 
					                                Private f32* %133 = OpAccessChain %28 %45 
					                                         f32 %134 = OpLoad %133 
					                                         f32 %135 = OpFNegate %134 
					                                        bool %136 = OpFOrdLessThan %132 %135 
					                                                      OpStore %130 %136 
					                                        bool %137 = OpLoad %130 
					                                         f32 %139 = OpSelect %137 %138 %121 
					                                                      OpStore %61 %139 
					                                         f32 %140 = OpLoad %61 
					                                Private f32* %141 = OpAccessChain %43 %50 
					                                         f32 %142 = OpLoad %141 
					                                         f32 %143 = OpFAdd %140 %142 
					                                Private f32* %144 = OpAccessChain %43 %50 
					                                                      OpStore %144 %143 
					                                Private f32* %145 = OpAccessChain %28 %45 
					                                         f32 %146 = OpLoad %145 
					                                Private f32* %147 = OpAccessChain %28 %50 
					                                         f32 %148 = OpLoad %147 
					                                         f32 %149 = OpExtInst %1 37 %146 %148 
					                                                      OpStore %61 %149 
					                                Private f32* %150 = OpAccessChain %28 %45 
					                                         f32 %151 = OpLoad %150 
					                                Private f32* %152 = OpAccessChain %28 %50 
					                                         f32 %153 = OpLoad %152 
					                                         f32 %154 = OpExtInst %1 40 %151 %153 
					                                Private f32* %155 = OpAccessChain %28 %50 
					                                                      OpStore %155 %154 
					                                Private f32* %157 = OpAccessChain %28 %50 
					                                         f32 %158 = OpLoad %157 
					                                Private f32* %159 = OpAccessChain %28 %50 
					                                         f32 %160 = OpLoad %159 
					                                         f32 %161 = OpFNegate %160 
					                                        bool %162 = OpFOrdGreaterThanEqual %158 %161 
					                                                      OpStore %156 %162 
					                                         f32 %164 = OpLoad %61 
					                                         f32 %165 = OpLoad %61 
					                                         f32 %166 = OpFNegate %165 
					                                        bool %167 = OpFOrdLessThan %164 %166 
					                                                      OpStore %163 %167 
					                                        bool %168 = OpLoad %156 
					                                        bool %169 = OpLoad %163 
					                                        bool %170 = OpLogicalAnd %168 %169 
					                                                      OpStore %156 %170 
					                                        bool %171 = OpLoad %156 
					                                                      OpSelectionMerge %175 None 
					                                                      OpBranchConditional %171 %174 %179 
					                                             %174 = OpLabel 
					                                Private f32* %176 = OpAccessChain %43 %50 
					                                         f32 %177 = OpLoad %176 
					                                         f32 %178 = OpFNegate %177 
					                                                      OpStore %173 %178 
					                                                      OpBranch %175 
					                                             %179 = OpLabel 
					                                Private f32* %180 = OpAccessChain %43 %50 
					                                         f32 %181 = OpLoad %180 
					                                                      OpStore %173 %181 
					                                                      OpBranch %175 
					                                             %175 = OpLabel 
					                                         f32 %182 = OpLoad %173 
					                                Private f32* %183 = OpAccessChain %28 %50 
					                                                      OpStore %183 %182 
					                                Uniform f32* %186 = OpAccessChain %16 %185 
					                                         f32 %187 = OpLoad %186 
					                                Uniform f32* %189 = OpAccessChain %16 %188 
					                                         f32 %190 = OpLoad %189 
					                                         f32 %191 = OpFMul %187 %190 
					                                         f32 %193 = OpFAdd %191 %192 
					                                                      OpStore %184 %193 
					                                Uniform f32* %195 = OpAccessChain %16 %194 
					                                         f32 %196 = OpLoad %195 
					                                Private f32* %197 = OpAccessChain %28 %50 
					                                         f32 %198 = OpLoad %197 
					                                         f32 %199 = OpFMul %196 %198 
					                                         f32 %200 = OpLoad %184 
					                                         f32 %201 = OpFAdd %199 %200 
					                                Private f32* %202 = OpAccessChain %28 %50 
					                                                      OpStore %202 %201 
					                                       f32_2 %203 = OpLoad %28 
					                                       f32_3 %204 = OpVectorShuffle %203 %203 0 0 0 
					                                       f32_3 %207 = OpFMul %204 %206 
					                                       f32_3 %211 = OpFAdd %207 %210 
					                                                      OpStore %43 %211 
					                                       f32_3 %212 = OpLoad %43 
					                                       f32_3 %215 = OpFMul %212 %214 
					                                                      OpStore %43 %215 
					                                       f32_3 %219 = OpLoad %43 
					                                       f32_4 %220 = OpVectorShuffle %219 %219 0 1 2 0 
					                                       f32_3 %221 = OpLoad %43 
					                                       f32_4 %222 = OpVectorShuffle %221 %221 0 1 2 0 
					                                       f32_4 %223 = OpFNegate %222 
					                                      bool_4 %225 = OpFOrdGreaterThanEqual %220 %223 
					                                      bool_3 %226 = OpVectorShuffle %225 %225 0 1 2 
					                                                      OpStore %218 %226 
					                                       f32_3 %227 = OpLoad %43 
					                                       f32_3 %228 = OpExtInst %1 4 %227 
					                                       f32_3 %229 = OpExtInst %1 10 %228 
					                                                      OpStore %43 %229 
					                                       f32_3 %232 = OpLoad %43 
					                                                      OpStore %231 %232 
					                               Private bool* %233 = OpAccessChain %218 %50 
					                                        bool %234 = OpLoad %233 
					                                                      OpSelectionMerge %237 None 
					                                                      OpBranchConditional %234 %236 %240 
					                                             %236 = OpLabel 
					                                Private f32* %238 = OpAccessChain %43 %50 
					                                         f32 %239 = OpLoad %238 
					                                                      OpStore %235 %239 
					                                                      OpBranch %237 
					                                             %240 = OpLabel 
					                                Private f32* %241 = OpAccessChain %43 %50 
					                                         f32 %242 = OpLoad %241 
					                                         f32 %243 = OpFNegate %242 
					                                                      OpStore %235 %243 
					                                                      OpBranch %237 
					                                             %237 = OpLabel 
					                                         f32 %244 = OpLoad %235 
					                               Function f32* %245 = OpAccessChain %231 %50 
					                                                      OpStore %245 %244 
					                               Private bool* %246 = OpAccessChain %218 %45 
					                                        bool %247 = OpLoad %246 
					                                                      OpSelectionMerge %250 None 
					                                                      OpBranchConditional %247 %249 %253 
					                                             %249 = OpLabel 
					                                Private f32* %251 = OpAccessChain %43 %45 
					                                         f32 %252 = OpLoad %251 
					                                                      OpStore %248 %252 
					                                                      OpBranch %250 
					                                             %253 = OpLabel 
					                                Private f32* %254 = OpAccessChain %43 %45 
					                                         f32 %255 = OpLoad %254 
					                                         f32 %256 = OpFNegate %255 
					                                                      OpStore %248 %256 
					                                                      OpBranch %250 
					                                             %250 = OpLabel 
					                                         f32 %257 = OpLoad %248 
					                               Function f32* %258 = OpAccessChain %231 %45 
					                                                      OpStore %258 %257 
					                               Private bool* %260 = OpAccessChain %218 %259 
					                                        bool %261 = OpLoad %260 
					                                                      OpSelectionMerge %264 None 
					                                                      OpBranchConditional %261 %263 %267 
					                                             %263 = OpLabel 
					                                Private f32* %265 = OpAccessChain %43 %259 
					                                         f32 %266 = OpLoad %265 
					                                                      OpStore %262 %266 
					                                                      OpBranch %264 
					                                             %267 = OpLabel 
					                                Private f32* %268 = OpAccessChain %43 %259 
					                                         f32 %269 = OpLoad %268 
					                                         f32 %270 = OpFNegate %269 
					                                                      OpStore %262 %270 
					                                                      OpBranch %264 
					                                             %264 = OpLabel 
					                                         f32 %271 = OpLoad %262 
					                               Function f32* %272 = OpAccessChain %231 %259 
					                                                      OpStore %272 %271 
					                                       f32_3 %273 = OpLoad %231 
					                                                      OpStore %43 %273 
					                                       f32_3 %274 = OpLoad %43 
					                                       f32_3 %275 = OpFMul %274 %206 
					                                       f32_3 %278 = OpFAdd %275 %277 
					                                                      OpStore %43 %278 
					                                       f32_3 %279 = OpLoad %43 
					                                       f32_3 %280 = OpExtInst %1 4 %279 
					                                       f32_3 %283 = OpFAdd %280 %282 
					                                                      OpStore %43 %283 
					                                       f32_3 %284 = OpLoad %43 
					                                       f32_3 %285 = OpCompositeConstruct %121 %121 %121 
					                                       f32_3 %286 = OpCompositeConstruct %56 %56 %56 
					                                       f32_3 %287 = OpExtInst %1 43 %284 %285 %286 
					                                                      OpStore %43 %287 
					                                       f32_3 %289 = OpLoad %43 
					                                       f32_3 %290 = OpLoad %43 
					                                       f32_3 %291 = OpFMul %289 %290 
					                                                      OpStore %288 %291 
					                                       f32_3 %292 = OpLoad %43 
					                                       f32_3 %293 = OpFNegate %292 
					                                       f32_3 %295 = OpFMul %293 %294 
					                                       f32_3 %298 = OpFAdd %295 %297 
					                                                      OpStore %43 %298 
					                         read_only Texture2D %303 = OpLoad %302 
					                                     sampler %307 = OpLoad %306 
					                  read_only Texture2DSampled %309 = OpSampledImage %303 %307 
					                                       f32_2 %310 = OpLoad %9 
					                                       f32_4 %311 = OpImageSampleImplicitLod %309 %310 
					                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
					                                                      OpStore %299 %312 
					                                       f32_2 %313 = OpLoad %9 
					                                       f32_2 %314 = OpFNegate %313 
					                                Uniform f32* %315 = OpAccessChain %16 %35 
					                                         f32 %316 = OpLoad %315 
					                                Uniform f32* %317 = OpAccessChain %16 %31 
					                                         f32 %318 = OpLoad %317 
					                                       f32_2 %319 = OpCompositeConstruct %316 %318 
					                                       f32_2 %320 = OpFAdd %314 %319 
					                                                      OpStore %9 %320 
					                                       f32_2 %321 = OpLoad %9 
					                                       f32_2 %322 = OpLoad %9 
					                                         f32 %323 = OpDot %321 %322 
					                                Private f32* %324 = OpAccessChain %9 %50 
					                                                      OpStore %324 %323 
					                                Private f32* %325 = OpAccessChain %9 %50 
					                                         f32 %326 = OpLoad %325 
					                                         f32 %327 = OpExtInst %1 31 %326 
					                                Private f32* %328 = OpAccessChain %9 %50 
					                                                      OpStore %328 %327 
					                                Private f32* %329 = OpAccessChain %9 %50 
					                                         f32 %330 = OpLoad %329 
					                                Uniform f32* %332 = OpAccessChain %16 %331 
					                                         f32 %333 = OpLoad %332 
					                                         f32 %334 = OpFNegate %333 
					                                         f32 %335 = OpFAdd %330 %334 
					                                Private f32* %336 = OpAccessChain %9 %50 
					                                                      OpStore %336 %335 
					                                Private f32* %337 = OpAccessChain %9 %50 
					                                         f32 %338 = OpLoad %337 
					                                         f32 %340 = OpFMul %338 %339 
					                                Private f32* %341 = OpAccessChain %9 %50 
					                                                      OpStore %341 %340 
					                                Private f32* %342 = OpAccessChain %9 %50 
					                                         f32 %343 = OpLoad %342 
					                                         f32 %344 = OpExtInst %1 43 %343 %121 %56 
					                                Private f32* %345 = OpAccessChain %9 %50 
					                                                      OpStore %345 %344 
					                                       f32_3 %347 = OpLoad %288 
					                                       f32_3 %348 = OpLoad %43 
					                                       f32_3 %349 = OpFMul %347 %348 
					                                       f32_3 %350 = OpLoad %299 
					                                       f32_3 %351 = OpFNegate %350 
					                                       f32_3 %352 = OpFAdd %349 %351 
					                                                      OpStore %346 %352 
					                                Private f32* %353 = OpAccessChain %9 %50 
					                                         f32 %354 = OpLoad %353 
					                                         f32 %355 = OpFMul %354 %105 
					                                         f32 %356 = OpFAdd %355 %296 
					                                Private f32* %357 = OpAccessChain %43 %50 
					                                                      OpStore %357 %356 
					                                Private f32* %358 = OpAccessChain %9 %50 
					                                         f32 %359 = OpLoad %358 
					                                Private f32* %360 = OpAccessChain %9 %50 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpFMul %359 %361 
					                                Private f32* %363 = OpAccessChain %9 %50 
					                                                      OpStore %363 %362 
					                                Private f32* %364 = OpAccessChain %43 %50 
					                                         f32 %365 = OpLoad %364 
					                                         f32 %366 = OpFNegate %365 
					                                Private f32* %367 = OpAccessChain %9 %50 
					                                         f32 %368 = OpLoad %367 
					                                         f32 %369 = OpFMul %366 %368 
					                                         f32 %370 = OpFAdd %369 %56 
					                                Private f32* %371 = OpAccessChain %9 %50 
					                                                      OpStore %371 %370 
					                                       f32_2 %374 = OpLoad %9 
					                                       f32_3 %375 = OpVectorShuffle %374 %374 0 0 0 
					                                       f32_3 %376 = OpLoad %346 
					                                       f32_3 %377 = OpFMul %375 %376 
					                                       f32_3 %378 = OpLoad %299 
					                                       f32_3 %379 = OpFAdd %377 %378 
					                                       f32_4 %380 = OpLoad %373 
					                                       f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
					                                                      OpStore %373 %381 
					                                 Output f32* %384 = OpAccessChain %373 %382 
					                                                      OpStore %384 %56 
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
						float _Value;
						float _Value2;
						float _Value3;
						float _Value4;
						float _Value5;
						vec4 unused_0_7;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					bvec3 u_xlatb2;
					vec4 u_xlat10_3;
					vec3 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat12;
					bool u_xlatb12;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat8.xy = u_xlat0.yx + (-vec2(_Value3, _Value2));
					    u_xlat1.x = max(abs(u_xlat8.y), abs(u_xlat8.x));
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat5 = min(abs(u_xlat8.y), abs(u_xlat8.x));
					    u_xlat1.x = u_xlat1.x * u_xlat5;
					    u_xlat5 = u_xlat1.x * u_xlat1.x;
					    u_xlat9 = u_xlat5 * 0.0208350997 + -0.0851330012;
					    u_xlat9 = u_xlat5 * u_xlat9 + 0.180141002;
					    u_xlat9 = u_xlat5 * u_xlat9 + -0.330299497;
					    u_xlat5 = u_xlat5 * u_xlat9 + 0.999866009;
					    u_xlat9 = u_xlat5 * u_xlat1.x;
					    u_xlat9 = u_xlat9 * -2.0 + 1.57079637;
					    u_xlatb13 = abs(u_xlat8.y)<abs(u_xlat8.x);
					    u_xlat9 = u_xlatb13 ? u_xlat9 : float(0.0);
					    u_xlat1.x = u_xlat1.x * u_xlat5 + u_xlat9;
					    u_xlatb5 = u_xlat8.y<(-u_xlat8.y);
					    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
					    u_xlat1.x = u_xlat5 + u_xlat1.x;
					    u_xlat5 = min(u_xlat8.y, u_xlat8.x);
					    u_xlat8.x = max(u_xlat8.y, u_xlat8.x);
					    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
					    u_xlatb12 = u_xlat5<(-u_xlat5);
					    u_xlatb8 = u_xlatb8 && u_xlatb12;
					    u_xlat8.x = (u_xlatb8) ? (-u_xlat1.x) : u_xlat1.x;
					    u_xlat12 = _TimeX * _Value + 20.0;
					    u_xlat8.x = _Value4 * u_xlat8.x + u_xlat12;
					    u_xlat1.xyz = u_xlat8.xxx * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlatb2.xyz = greaterThanEqual(u_xlat1.xyzx, (-u_xlat1.xyzx)).xyz;
					    u_xlat1.xyz = fract(abs(u_xlat1.xyz));
					    {
					        vec3 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat1.y : (-u_xlat1.y);
					        hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat1.z : (-u_xlat1.z);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(2.0, 2.0, 2.0) + vec3(3.0, 3.0, 3.0);
					    u_xlat10_3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = (-u_xlat0.xy) + vec2(_Value2, _Value3);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value5);
					    u_xlat0.x = u_xlat0.x * -2.85714293;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat1.xyz + (-u_xlat10_3.xyz);
					    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
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