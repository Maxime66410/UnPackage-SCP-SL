Shader "CameraFilterPack/Vision_Aura" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value2 ("_ColorRGB", Vector) = (1,1,1,1)
		_Value5 ("Speed", Range(0, 1)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 761
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
					uniform 	vec4 _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat2;
					int u_xlati2;
					bool u_xlatb2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					float u_xlat7;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat12;
					float u_xlat13;
					bool u_xlatb13;
					vec2 u_xlat14;
					vec2 u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = u_xlat0.xy + (-vec2(_Value3, _Value4));
					    u_xlat1.x = _TimeX * _Value5;
					    u_xlat7 = min(abs(u_xlat12.x), abs(u_xlat12.y));
					    u_xlat13 = max(abs(u_xlat12.x), abs(u_xlat12.y));
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat7 = u_xlat13 * u_xlat7;
					    u_xlat13 = u_xlat7 * u_xlat7;
					    u_xlat19 = u_xlat13 * 0.0208350997 + -0.0851330012;
					    u_xlat19 = u_xlat13 * u_xlat19 + 0.180141002;
					    u_xlat19 = u_xlat13 * u_xlat19 + -0.330299497;
					    u_xlat13 = u_xlat13 * u_xlat19 + 0.999866009;
					    u_xlat19 = u_xlat13 * u_xlat7;
					    u_xlatb2 = abs(u_xlat12.x)<abs(u_xlat12.y);
					    u_xlat19 = u_xlat19 * -2.0 + 1.57079637;
					    u_xlat19 = u_xlatb2 ? u_xlat19 : float(0.0);
					    u_xlat7 = u_xlat7 * u_xlat13 + u_xlat19;
					    u_xlatb13 = u_xlat12.x<(-u_xlat12.x);
					    u_xlat13 = u_xlatb13 ? -3.14159274 : float(0.0);
					    u_xlat7 = u_xlat13 + u_xlat7;
					    u_xlat13 = min(u_xlat12.x, u_xlat12.y);
					    u_xlat19 = max(u_xlat12.x, u_xlat12.y);
					    u_xlatb13 = u_xlat13<(-u_xlat13);
					    u_xlatb19 = u_xlat19>=(-u_xlat19);
					    u_xlatb13 = u_xlatb19 && u_xlatb13;
					    u_xlat7 = (u_xlatb13) ? (-u_xlat7) : u_xlat7;
					    u_xlat13 = dot(u_xlat12.xy, u_xlat12.xy);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat19 = u_xlat13 * _Value;
					    u_xlat19 = u_xlat19 * 40.0 + -3.0;
					    u_xlat2 = u_xlat7 * 6.0;
					    u_xlat2 = cos(u_xlat2);
					    u_xlat2 = u_xlat7 + u_xlat2;
					    u_xlat2 = u_xlat1.x * 2.0 + u_xlat2;
					    u_xlat2 = cos(u_xlat2);
					    u_xlat19 = u_xlat2 * 0.680000007 + u_xlat19;
					    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
					    u_xlat7 = (-u_xlat13) * _Value + u_xlat7;
					    u_xlat13 = 0.0;
					    for(int u_xlati_loop_1 = 3 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
					    {
					        u_xlat8.x = float(u_xlati_loop_1);
					        u_xlat14.x = u_xlat7 * u_xlat8.x + u_xlat1.x;
					        u_xlat14.xy = u_xlat12.xy + u_xlat14.xx;
					        u_xlat8.xy = u_xlat8.xx + u_xlat14.xy;
					        u_xlat8.xy = cos(u_xlat8.xy);
					        u_xlat8.xy = u_xlat8.xy * vec2(0.200000003, 0.200000003) + u_xlat12.xy;
					        u_xlat3.xy = abs(u_xlat8.xy) * vec2(10.0, 10.0);
					        u_xlat15.xy = fract(u_xlat3.xy);
					        u_xlat15.xy = u_xlat15.xy + vec2(-0.5, -0.5);
					        u_xlat3.xy = floor(u_xlat3.xy);
					        u_xlat20 = 1.0;
					        u_xlat4.x = -1.0;
					        while(true){
					            u_xlatb16 = u_xlat4.x>=2.0;
					            if(u_xlatb16){break;}
					            u_xlat16 = u_xlat20;
					            u_xlat4.y = -1.0;
					            while(true){
					                u_xlatb22 = u_xlat4.y>=2.0;
					                if(u_xlatb22){break;}
					                u_xlat5.xy = u_xlat3.xy + u_xlat4.xy;
					                u_xlat5.xy = u_xlat5.xy + vec2(_TimeX);
					                u_xlat5.xy = cos(u_xlat5.xy);
					                u_xlat22 = u_xlat5.y + u_xlat5.x;
					                u_xlat5.xy = vec2(u_xlat22) * vec2(0.300000012, 0.300000012) + u_xlat15.xy;
					                u_xlat5.xy = (-u_xlat4.xy) + u_xlat5.xy;
					                u_xlat22 = dot(u_xlat5.xy, u_xlat5.xy);
					                u_xlat22 = sqrt(u_xlat22);
					                u_xlat16 = min(u_xlat22, u_xlat16);
					                u_xlat4.y = u_xlat4.y + 1.0;
					            }
					            u_xlat20 = u_xlat16;
					            u_xlat4.x = u_xlat4.x + 1.0;
					        }
					        u_xlat8.xy = u_xlat8.xy * vec2(14.2340002, 16.2339993);
					        u_xlat8.xy = cos(u_xlat8.xy);
					        u_xlat8.x = u_xlat8.y + u_xlat8.x;
					        u_xlat8.x = u_xlat8.x * 0.400000006 + 0.699999988;
					        u_xlat13 = u_xlat20 * u_xlat8.x + u_xlat13;
					    }
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xyz = vec3(u_xlat13) * _Value2.xyz;
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * _Value2.www + u_xlat10_0.xyz;
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
					; Bound: 422
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %405 
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
					                                                      OpDecorate %379 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %382 DescriptorSet 382 
					                                                      OpDecorate %382 Binding 382 
					                                                      OpDecorate %383 RelaxedPrecision 
					                                                      OpDecorate %386 RelaxedPrecision 
					                                                      OpDecorate %386 DescriptorSet 386 
					                                                      OpDecorate %386 Binding 386 
					                                                      OpDecorate %387 RelaxedPrecision 
					                                                      OpDecorate %392 RelaxedPrecision 
					                                                      OpDecorate %405 Location 405 
					                                                      OpDecorate %411 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeVector %6 4 
					                                              %14 = OpTypeStruct %6 %6 %13 %6 %6 %6 %13 
					                                              %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32_4; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                              %17 = OpTypeInt 32 1 
					                                          i32 %18 = OpConstant 6 
					                                              %19 = OpTypePointer Uniform %13 
					                               Private f32_2* %28 = OpVariable Private 
					                                          i32 %30 = OpConstant 3 
					                                              %31 = OpTypePointer Uniform %6 
					                                          i32 %34 = OpConstant 4 
					                                              %40 = OpTypeVector %6 3 
					                                              %41 = OpTypePointer Private %40 
					                               Private f32_3* %42 = OpVariable Private 
					                                          i32 %43 = OpConstant 0 
					                                          i32 %46 = OpConstant 5 
					                                              %50 = OpTypeInt 32 0 
					                                          u32 %51 = OpConstant 0 
					                                              %52 = OpTypePointer Private %6 
					                                 Private f32* %54 = OpVariable Private 
					                                          u32 %58 = OpConstant 1 
					                                 Private f32* %63 = OpVariable Private 
					                                          f32 %71 = OpConstant 3,674022E-40 
					                                 Private f32* %80 = OpVariable Private 
					                                          f32 %82 = OpConstant 3,674022E-40 
					                                          f32 %84 = OpConstant 3,674022E-40 
					                                          f32 %89 = OpConstant 3,674022E-40 
					                                          f32 %94 = OpConstant 3,674022E-40 
					                                          f32 %99 = OpConstant 3,674022E-40 
					                                             %104 = OpTypeBool 
					                                             %105 = OpTypePointer Private %104 
					                               Private bool* %106 = OpVariable Private 
					                                         f32 %115 = OpConstant 3,674022E-40 
					                                         f32 %117 = OpConstant 3,674022E-40 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                               Private bool* %128 = OpVariable Private 
					                                         f32 %136 = OpConstant 3,674022E-40 
					                               Private bool* %155 = OpVariable Private 
					                                             %164 = OpTypePointer Function %6 
					                                         i32 %179 = OpConstant 1 
					                                         f32 %184 = OpConstant 3,674022E-40 
					                                         f32 %186 = OpConstant 3,674022E-40 
					                                Private f32* %188 = OpVariable Private 
					                                         f32 %190 = OpConstant 3,674022E-40 
					                                         f32 %199 = OpConstant 3,674022E-40 
					                                         f32 %206 = OpConstant 3,674022E-40 
					                                             %219 = OpTypePointer Function %17 
					                              Private f32_2* %228 = OpVariable Private 
					                              Private f32_2* %232 = OpVariable Private 
					                                         f32 %252 = OpConstant 3,674022E-40 
					                                       f32_2 %253 = OpConstantComposite %252 %252 
					                              Private f32_2* %257 = OpVariable Private 
					                                         f32 %260 = OpConstant 3,674022E-40 
					                                       f32_2 %261 = OpConstantComposite %260 %260 
					                              Private f32_2* %263 = OpVariable Private 
					                                         f32 %267 = OpConstant 3,674022E-40 
					                                       f32_2 %268 = OpConstantComposite %267 %267 
					                                Private f32* %272 = OpVariable Private 
					                              Private f32_2* %273 = OpVariable Private 
					                                         f32 %274 = OpConstant 3,674022E-40 
					                                        bool %281 = OpConstantTrue 
					                               Private bool* %282 = OpVariable Private 
					                                Private f32* %290 = OpVariable Private 
					                               Private bool* %298 = OpVariable Private 
					                              Private f32_2* %306 = OpVariable Private 
					                                Private f32* %317 = OpVariable Private 
					                                         f32 %325 = OpConstant 3,674022E-40 
					                                       f32_2 %326 = OpConstantComposite %325 %325 
					                                         f32 %352 = OpConstant 3,674022E-40 
					                                         f32 %353 = OpConstant 3,674022E-40 
					                                       f32_2 %354 = OpConstantComposite %352 %353 
					                                         f32 %366 = OpConstant 3,674022E-40 
					                                         f32 %368 = OpConstant 3,674022E-40 
					                              Private f32_3* %379 = OpVariable Private 
					                                             %380 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %381 = OpTypePointer UniformConstant %380 
					        UniformConstant read_only Texture2D* %382 = OpVariable UniformConstant 
					                                             %384 = OpTypeSampler 
					                                             %385 = OpTypePointer UniformConstant %384 
					                    UniformConstant sampler* %386 = OpVariable UniformConstant 
					                                             %388 = OpTypeSampledImage %380 
					                                         i32 %395 = OpConstant 2 
					                                             %404 = OpTypePointer Output %13 
					                               Output f32_4* %405 = OpVariable Output 
					                                         u32 %415 = OpConstant 3 
					                                             %416 = OpTypePointer Output %6 
					                                             %419 = OpTypePointer Private %17 
					                                Private i32* %420 = OpVariable Private 
					                               Private bool* %421 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %165 = OpVariable Function 
					                               Function i32* %220 = OpVariable Function 
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
					                                 Uniform f32* %32 = OpAccessChain %16 %30 
					                                          f32 %33 = OpLoad %32 
					                                 Uniform f32* %35 = OpAccessChain %16 %34 
					                                          f32 %36 = OpLoad %35 
					                                        f32_2 %37 = OpCompositeConstruct %33 %36 
					                                        f32_2 %38 = OpFNegate %37 
					                                        f32_2 %39 = OpFAdd %29 %38 
					                                                      OpStore %28 %39 
					                                 Uniform f32* %44 = OpAccessChain %16 %43 
					                                          f32 %45 = OpLoad %44 
					                                 Uniform f32* %47 = OpAccessChain %16 %46 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpFMul %45 %48 
					                                 Private f32* %53 = OpAccessChain %42 %51 
					                                                      OpStore %53 %49 
					                                 Private f32* %55 = OpAccessChain %28 %51 
					                                          f32 %56 = OpLoad %55 
					                                          f32 %57 = OpExtInst %1 4 %56 
					                                 Private f32* %59 = OpAccessChain %28 %58 
					                                          f32 %60 = OpLoad %59 
					                                          f32 %61 = OpExtInst %1 4 %60 
					                                          f32 %62 = OpExtInst %1 37 %57 %61 
					                                                      OpStore %54 %62 
					                                 Private f32* %64 = OpAccessChain %28 %51 
					                                          f32 %65 = OpLoad %64 
					                                          f32 %66 = OpExtInst %1 4 %65 
					                                 Private f32* %67 = OpAccessChain %28 %58 
					                                          f32 %68 = OpLoad %67 
					                                          f32 %69 = OpExtInst %1 4 %68 
					                                          f32 %70 = OpExtInst %1 40 %66 %69 
					                                                      OpStore %63 %70 
					                                          f32 %72 = OpLoad %63 
					                                          f32 %73 = OpFDiv %71 %72 
					                                                      OpStore %63 %73 
					                                          f32 %74 = OpLoad %63 
					                                          f32 %75 = OpLoad %54 
					                                          f32 %76 = OpFMul %74 %75 
					                                                      OpStore %54 %76 
					                                          f32 %77 = OpLoad %54 
					                                          f32 %78 = OpLoad %54 
					                                          f32 %79 = OpFMul %77 %78 
					                                                      OpStore %63 %79 
					                                          f32 %81 = OpLoad %63 
					                                          f32 %83 = OpFMul %81 %82 
					                                          f32 %85 = OpFAdd %83 %84 
					                                                      OpStore %80 %85 
					                                          f32 %86 = OpLoad %63 
					                                          f32 %87 = OpLoad %80 
					                                          f32 %88 = OpFMul %86 %87 
					                                          f32 %90 = OpFAdd %88 %89 
					                                                      OpStore %80 %90 
					                                          f32 %91 = OpLoad %63 
					                                          f32 %92 = OpLoad %80 
					                                          f32 %93 = OpFMul %91 %92 
					                                          f32 %95 = OpFAdd %93 %94 
					                                                      OpStore %80 %95 
					                                          f32 %96 = OpLoad %63 
					                                          f32 %97 = OpLoad %80 
					                                          f32 %98 = OpFMul %96 %97 
					                                         f32 %100 = OpFAdd %98 %99 
					                                                      OpStore %63 %100 
					                                         f32 %101 = OpLoad %63 
					                                         f32 %102 = OpLoad %54 
					                                         f32 %103 = OpFMul %101 %102 
					                                                      OpStore %80 %103 
					                                Private f32* %107 = OpAccessChain %28 %51 
					                                         f32 %108 = OpLoad %107 
					                                         f32 %109 = OpExtInst %1 4 %108 
					                                Private f32* %110 = OpAccessChain %28 %58 
					                                         f32 %111 = OpLoad %110 
					                                         f32 %112 = OpExtInst %1 4 %111 
					                                        bool %113 = OpFOrdLessThan %109 %112 
					                                                      OpStore %106 %113 
					                                         f32 %114 = OpLoad %80 
					                                         f32 %116 = OpFMul %114 %115 
					                                         f32 %118 = OpFAdd %116 %117 
					                                                      OpStore %80 %118 
					                                        bool %119 = OpLoad %106 
					                                         f32 %120 = OpLoad %80 
					                                         f32 %122 = OpSelect %119 %120 %121 
					                                                      OpStore %80 %122 
					                                         f32 %123 = OpLoad %54 
					                                         f32 %124 = OpLoad %63 
					                                         f32 %125 = OpFMul %123 %124 
					                                         f32 %126 = OpLoad %80 
					                                         f32 %127 = OpFAdd %125 %126 
					                                                      OpStore %54 %127 
					                                Private f32* %129 = OpAccessChain %28 %51 
					                                         f32 %130 = OpLoad %129 
					                                Private f32* %131 = OpAccessChain %28 %51 
					                                         f32 %132 = OpLoad %131 
					                                         f32 %133 = OpFNegate %132 
					                                        bool %134 = OpFOrdLessThan %130 %133 
					                                                      OpStore %128 %134 
					                                        bool %135 = OpLoad %128 
					                                         f32 %137 = OpSelect %135 %136 %121 
					                                                      OpStore %63 %137 
					                                         f32 %138 = OpLoad %63 
					                                         f32 %139 = OpLoad %54 
					                                         f32 %140 = OpFAdd %138 %139 
					                                                      OpStore %54 %140 
					                                Private f32* %141 = OpAccessChain %28 %51 
					                                         f32 %142 = OpLoad %141 
					                                Private f32* %143 = OpAccessChain %28 %58 
					                                         f32 %144 = OpLoad %143 
					                                         f32 %145 = OpExtInst %1 37 %142 %144 
					                                                      OpStore %63 %145 
					                                Private f32* %146 = OpAccessChain %28 %51 
					                                         f32 %147 = OpLoad %146 
					                                Private f32* %148 = OpAccessChain %28 %58 
					                                         f32 %149 = OpLoad %148 
					                                         f32 %150 = OpExtInst %1 40 %147 %149 
					                                                      OpStore %80 %150 
					                                         f32 %151 = OpLoad %63 
					                                         f32 %152 = OpLoad %63 
					                                         f32 %153 = OpFNegate %152 
					                                        bool %154 = OpFOrdLessThan %151 %153 
					                                                      OpStore %128 %154 
					                                         f32 %156 = OpLoad %80 
					                                         f32 %157 = OpLoad %80 
					                                         f32 %158 = OpFNegate %157 
					                                        bool %159 = OpFOrdGreaterThanEqual %156 %158 
					                                                      OpStore %155 %159 
					                                        bool %160 = OpLoad %155 
					                                        bool %161 = OpLoad %128 
					                                        bool %162 = OpLogicalAnd %160 %161 
					                                                      OpStore %128 %162 
					                                        bool %163 = OpLoad %128 
					                                                      OpSelectionMerge %167 None 
					                                                      OpBranchConditional %163 %166 %170 
					                                             %166 = OpLabel 
					                                         f32 %168 = OpLoad %54 
					                                         f32 %169 = OpFNegate %168 
					                                                      OpStore %165 %169 
					                                                      OpBranch %167 
					                                             %170 = OpLabel 
					                                         f32 %171 = OpLoad %54 
					                                                      OpStore %165 %171 
					                                                      OpBranch %167 
					                                             %167 = OpLabel 
					                                         f32 %172 = OpLoad %165 
					                                                      OpStore %54 %172 
					                                       f32_2 %173 = OpLoad %28 
					                                       f32_2 %174 = OpLoad %28 
					                                         f32 %175 = OpDot %173 %174 
					                                                      OpStore %63 %175 
					                                         f32 %176 = OpLoad %63 
					                                         f32 %177 = OpExtInst %1 31 %176 
					                                                      OpStore %63 %177 
					                                         f32 %178 = OpLoad %63 
					                                Uniform f32* %180 = OpAccessChain %16 %179 
					                                         f32 %181 = OpLoad %180 
					                                         f32 %182 = OpFMul %178 %181 
					                                                      OpStore %80 %182 
					                                         f32 %183 = OpLoad %80 
					                                         f32 %185 = OpFMul %183 %184 
					                                         f32 %187 = OpFAdd %185 %186 
					                                                      OpStore %80 %187 
					                                         f32 %189 = OpLoad %54 
					                                         f32 %191 = OpFMul %189 %190 
					                                                      OpStore %188 %191 
					                                         f32 %192 = OpLoad %188 
					                                         f32 %193 = OpExtInst %1 14 %192 
					                                                      OpStore %188 %193 
					                                         f32 %194 = OpLoad %54 
					                                         f32 %195 = OpLoad %188 
					                                         f32 %196 = OpFAdd %194 %195 
					                                                      OpStore %188 %196 
					                                Private f32* %197 = OpAccessChain %42 %51 
					                                         f32 %198 = OpLoad %197 
					                                         f32 %200 = OpFMul %198 %199 
					                                         f32 %201 = OpLoad %188 
					                                         f32 %202 = OpFAdd %200 %201 
					                                                      OpStore %188 %202 
					                                         f32 %203 = OpLoad %188 
					                                         f32 %204 = OpExtInst %1 14 %203 
					                                                      OpStore %188 %204 
					                                         f32 %205 = OpLoad %188 
					                                         f32 %207 = OpFMul %205 %206 
					                                         f32 %208 = OpLoad %80 
					                                         f32 %209 = OpFAdd %207 %208 
					                                                      OpStore %80 %209 
					                                         f32 %210 = OpLoad %80 
					                                         f32 %211 = OpExtInst %1 43 %210 %121 %71 
					                                                      OpStore %80 %211 
					                                         f32 %212 = OpLoad %63 
					                                         f32 %213 = OpFNegate %212 
					                                Uniform f32* %214 = OpAccessChain %16 %179 
					                                         f32 %215 = OpLoad %214 
					                                         f32 %216 = OpFMul %213 %215 
					                                         f32 %217 = OpLoad %54 
					                                         f32 %218 = OpFAdd %216 %217 
					                                                      OpStore %54 %218 
					                                                      OpStore %63 %121 
					                                                      OpStore %220 %30 
					                                                      OpBranch %221 
					                                             %221 = OpLabel 
					                                                      OpLoopMerge %223 %224 None 
					                                                      OpBranch %225 
					                                             %225 = OpLabel 
					                                         i32 %226 = OpLoad %220 
					                                        bool %227 = OpSLessThan %226 %18 
					                                                      OpBranchConditional %227 %222 %223 
					                                             %222 = OpLabel 
					                                         i32 %229 = OpLoad %220 
					                                         f32 %230 = OpConvertSToF %229 
					                                Private f32* %231 = OpAccessChain %228 %51 
					                                                      OpStore %231 %230 
					                                         f32 %233 = OpLoad %54 
					                                Private f32* %234 = OpAccessChain %228 %51 
					                                         f32 %235 = OpLoad %234 
					                                         f32 %236 = OpFMul %233 %235 
					                                Private f32* %237 = OpAccessChain %42 %51 
					                                         f32 %238 = OpLoad %237 
					                                         f32 %239 = OpFAdd %236 %238 
					                                Private f32* %240 = OpAccessChain %232 %51 
					                                                      OpStore %240 %239 
					                                       f32_2 %241 = OpLoad %28 
					                                       f32_2 %242 = OpLoad %232 
					                                       f32_2 %243 = OpVectorShuffle %242 %242 0 0 
					                                       f32_2 %244 = OpFAdd %241 %243 
					                                                      OpStore %232 %244 
					                                       f32_2 %245 = OpLoad %228 
					                                       f32_2 %246 = OpVectorShuffle %245 %245 0 0 
					                                       f32_2 %247 = OpLoad %232 
					                                       f32_2 %248 = OpFAdd %246 %247 
					                                                      OpStore %228 %248 
					                                       f32_2 %249 = OpLoad %228 
					                                       f32_2 %250 = OpExtInst %1 14 %249 
					                                                      OpStore %228 %250 
					                                       f32_2 %251 = OpLoad %228 
					                                       f32_2 %254 = OpFMul %251 %253 
					                                       f32_2 %255 = OpLoad %28 
					                                       f32_2 %256 = OpFAdd %254 %255 
					                                                      OpStore %228 %256 
					                                       f32_2 %258 = OpLoad %228 
					                                       f32_2 %259 = OpExtInst %1 4 %258 
					                                       f32_2 %262 = OpFMul %259 %261 
					                                                      OpStore %257 %262 
					                                       f32_2 %264 = OpLoad %257 
					                                       f32_2 %265 = OpExtInst %1 10 %264 
					                                                      OpStore %263 %265 
					                                       f32_2 %266 = OpLoad %263 
					                                       f32_2 %269 = OpFAdd %266 %268 
					                                                      OpStore %263 %269 
					                                       f32_2 %270 = OpLoad %257 
					                                       f32_2 %271 = OpExtInst %1 8 %270 
					                                                      OpStore %257 %271 
					                                                      OpStore %272 %71 
					                                Private f32* %275 = OpAccessChain %273 %51 
					                                                      OpStore %275 %274 
					                                                      OpBranch %276 
					                                             %276 = OpLabel 
					                                                      OpLoopMerge %278 %279 None 
					                                                      OpBranch %280 
					                                             %280 = OpLabel 
					                                                      OpBranchConditional %281 %277 %278 
					                                             %277 = OpLabel 
					                                Private f32* %283 = OpAccessChain %273 %51 
					                                         f32 %284 = OpLoad %283 
					                                        bool %285 = OpFOrdGreaterThanEqual %284 %199 
					                                                      OpStore %282 %285 
					                                        bool %286 = OpLoad %282 
					                                                      OpSelectionMerge %288 None 
					                                                      OpBranchConditional %286 %287 %288 
					                                             %287 = OpLabel 
					                                                      OpBranch %278 
					                                             %288 = OpLabel 
					                                         f32 %291 = OpLoad %272 
					                                                      OpStore %290 %291 
					                                Private f32* %292 = OpAccessChain %273 %58 
					                                                      OpStore %292 %274 
					                                                      OpBranch %293 
					                                             %293 = OpLabel 
					                                                      OpLoopMerge %295 %296 None 
					                                                      OpBranch %297 
					                                             %297 = OpLabel 
					                                                      OpBranchConditional %281 %294 %295 
					                                             %294 = OpLabel 
					                                Private f32* %299 = OpAccessChain %273 %58 
					                                         f32 %300 = OpLoad %299 
					                                        bool %301 = OpFOrdGreaterThanEqual %300 %199 
					                                                      OpStore %298 %301 
					                                        bool %302 = OpLoad %298 
					                                                      OpSelectionMerge %304 None 
					                                                      OpBranchConditional %302 %303 %304 
					                                             %303 = OpLabel 
					                                                      OpBranch %295 
					                                             %304 = OpLabel 
					                                       f32_2 %307 = OpLoad %257 
					                                       f32_2 %308 = OpLoad %273 
					                                       f32_2 %309 = OpFAdd %307 %308 
					                                                      OpStore %306 %309 
					                                       f32_2 %310 = OpLoad %306 
					                                Uniform f32* %311 = OpAccessChain %16 %43 
					                                         f32 %312 = OpLoad %311 
					                                       f32_2 %313 = OpCompositeConstruct %312 %312 
					                                       f32_2 %314 = OpFAdd %310 %313 
					                                                      OpStore %306 %314 
					                                       f32_2 %315 = OpLoad %306 
					                                       f32_2 %316 = OpExtInst %1 14 %315 
					                                                      OpStore %306 %316 
					                                Private f32* %318 = OpAccessChain %306 %58 
					                                         f32 %319 = OpLoad %318 
					                                Private f32* %320 = OpAccessChain %306 %51 
					                                         f32 %321 = OpLoad %320 
					                                         f32 %322 = OpFAdd %319 %321 
					                                                      OpStore %317 %322 
					                                         f32 %323 = OpLoad %317 
					                                       f32_2 %324 = OpCompositeConstruct %323 %323 
					                                       f32_2 %327 = OpFMul %324 %326 
					                                       f32_2 %328 = OpLoad %263 
					                                       f32_2 %329 = OpFAdd %327 %328 
					                                                      OpStore %306 %329 
					                                       f32_2 %330 = OpLoad %273 
					                                       f32_2 %331 = OpFNegate %330 
					                                       f32_2 %332 = OpLoad %306 
					                                       f32_2 %333 = OpFAdd %331 %332 
					                                                      OpStore %306 %333 
					                                       f32_2 %334 = OpLoad %306 
					                                       f32_2 %335 = OpLoad %306 
					                                         f32 %336 = OpDot %334 %335 
					                                                      OpStore %317 %336 
					                                         f32 %337 = OpLoad %317 
					                                         f32 %338 = OpExtInst %1 31 %337 
					                                                      OpStore %317 %338 
					                                         f32 %339 = OpLoad %317 
					                                         f32 %340 = OpLoad %290 
					                                         f32 %341 = OpExtInst %1 37 %339 %340 
					                                                      OpStore %290 %341 
					                                Private f32* %342 = OpAccessChain %273 %58 
					                                         f32 %343 = OpLoad %342 
					                                         f32 %344 = OpFAdd %343 %71 
					                                Private f32* %345 = OpAccessChain %273 %58 
					                                                      OpStore %345 %344 
					                                                      OpBranch %296 
					                                             %296 = OpLabel 
					                                                      OpBranch %293 
					                                             %295 = OpLabel 
					                                         f32 %346 = OpLoad %290 
					                                                      OpStore %272 %346 
					                                Private f32* %347 = OpAccessChain %273 %51 
					                                         f32 %348 = OpLoad %347 
					                                         f32 %349 = OpFAdd %348 %71 
					                                Private f32* %350 = OpAccessChain %273 %51 
					                                                      OpStore %350 %349 
					                                                      OpBranch %279 
					                                             %279 = OpLabel 
					                                                      OpBranch %276 
					                                             %278 = OpLabel 
					                                       f32_2 %351 = OpLoad %228 
					                                       f32_2 %355 = OpFMul %351 %354 
					                                                      OpStore %228 %355 
					                                       f32_2 %356 = OpLoad %228 
					                                       f32_2 %357 = OpExtInst %1 14 %356 
					                                                      OpStore %228 %357 
					                                Private f32* %358 = OpAccessChain %228 %58 
					                                         f32 %359 = OpLoad %358 
					                                Private f32* %360 = OpAccessChain %228 %51 
					                                         f32 %361 = OpLoad %360 
					                                         f32 %362 = OpFAdd %359 %361 
					                                Private f32* %363 = OpAccessChain %228 %51 
					                                                      OpStore %363 %362 
					                                Private f32* %364 = OpAccessChain %228 %51 
					                                         f32 %365 = OpLoad %364 
					                                         f32 %367 = OpFMul %365 %366 
					                                         f32 %369 = OpFAdd %367 %368 
					                                Private f32* %370 = OpAccessChain %228 %51 
					                                                      OpStore %370 %369 
					                                         f32 %371 = OpLoad %272 
					                                Private f32* %372 = OpAccessChain %228 %51 
					                                         f32 %373 = OpLoad %372 
					                                         f32 %374 = OpFMul %371 %373 
					                                         f32 %375 = OpLoad %63 
					                                         f32 %376 = OpFAdd %374 %375 
					                                                      OpStore %63 %376 
					                                                      OpBranch %224 
					                                             %224 = OpLabel 
					                                         i32 %377 = OpLoad %220 
					                                         i32 %378 = OpIAdd %377 %179 
					                                                      OpStore %220 %378 
					                                                      OpBranch %221 
					                                             %223 = OpLabel 
					                         read_only Texture2D %383 = OpLoad %382 
					                                     sampler %387 = OpLoad %386 
					                  read_only Texture2DSampled %389 = OpSampledImage %383 %387 
					                                       f32_2 %390 = OpLoad %9 
					                                       f32_4 %391 = OpImageSampleImplicitLod %389 %390 
					                                       f32_3 %392 = OpVectorShuffle %391 %391 0 1 2 
					                                                      OpStore %379 %392 
					                                         f32 %393 = OpLoad %63 
					                                       f32_3 %394 = OpCompositeConstruct %393 %393 %393 
					                              Uniform f32_4* %396 = OpAccessChain %16 %395 
					                                       f32_4 %397 = OpLoad %396 
					                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
					                                       f32_3 %399 = OpFMul %394 %398 
					                                                      OpStore %42 %399 
					                                         f32 %400 = OpLoad %80 
					                                       f32_3 %401 = OpCompositeConstruct %400 %400 %400 
					                                       f32_3 %402 = OpLoad %42 
					                                       f32_3 %403 = OpFMul %401 %402 
					                                                      OpStore %42 %403 
					                                       f32_3 %406 = OpLoad %42 
					                              Uniform f32_4* %407 = OpAccessChain %16 %395 
					                                       f32_4 %408 = OpLoad %407 
					                                       f32_3 %409 = OpVectorShuffle %408 %408 3 3 3 
					                                       f32_3 %410 = OpFMul %406 %409 
					                                       f32_3 %411 = OpLoad %379 
					                                       f32_3 %412 = OpFAdd %410 %411 
					                                       f32_4 %413 = OpLoad %405 
					                                       f32_4 %414 = OpVectorShuffle %413 %412 4 5 6 3 
					                                                      OpStore %405 %414 
					                                 Output f32* %417 = OpAccessChain %405 %415 
					                                                      OpStore %417 %71 
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
						vec4 _Value2;
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
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					float u_xlat2;
					int u_xlati2;
					bool u_xlatb2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat5;
					float u_xlat7;
					vec2 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat12;
					float u_xlat13;
					bool u_xlatb13;
					vec2 u_xlat14;
					vec2 u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat20;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = u_xlat0.xy + (-vec2(_Value3, _Value4));
					    u_xlat1.x = _TimeX * _Value5;
					    u_xlat7 = min(abs(u_xlat12.x), abs(u_xlat12.y));
					    u_xlat13 = max(abs(u_xlat12.x), abs(u_xlat12.y));
					    u_xlat13 = float(1.0) / u_xlat13;
					    u_xlat7 = u_xlat13 * u_xlat7;
					    u_xlat13 = u_xlat7 * u_xlat7;
					    u_xlat19 = u_xlat13 * 0.0208350997 + -0.0851330012;
					    u_xlat19 = u_xlat13 * u_xlat19 + 0.180141002;
					    u_xlat19 = u_xlat13 * u_xlat19 + -0.330299497;
					    u_xlat13 = u_xlat13 * u_xlat19 + 0.999866009;
					    u_xlat19 = u_xlat13 * u_xlat7;
					    u_xlatb2 = abs(u_xlat12.x)<abs(u_xlat12.y);
					    u_xlat19 = u_xlat19 * -2.0 + 1.57079637;
					    u_xlat19 = u_xlatb2 ? u_xlat19 : float(0.0);
					    u_xlat7 = u_xlat7 * u_xlat13 + u_xlat19;
					    u_xlatb13 = u_xlat12.x<(-u_xlat12.x);
					    u_xlat13 = u_xlatb13 ? -3.14159274 : float(0.0);
					    u_xlat7 = u_xlat13 + u_xlat7;
					    u_xlat13 = min(u_xlat12.x, u_xlat12.y);
					    u_xlat19 = max(u_xlat12.x, u_xlat12.y);
					    u_xlatb13 = u_xlat13<(-u_xlat13);
					    u_xlatb19 = u_xlat19>=(-u_xlat19);
					    u_xlatb13 = u_xlatb19 && u_xlatb13;
					    u_xlat7 = (u_xlatb13) ? (-u_xlat7) : u_xlat7;
					    u_xlat13 = dot(u_xlat12.xy, u_xlat12.xy);
					    u_xlat13 = sqrt(u_xlat13);
					    u_xlat19 = u_xlat13 * _Value;
					    u_xlat19 = u_xlat19 * 40.0 + -3.0;
					    u_xlat2 = u_xlat7 * 6.0;
					    u_xlat2 = cos(u_xlat2);
					    u_xlat2 = u_xlat7 + u_xlat2;
					    u_xlat2 = u_xlat1.x * 2.0 + u_xlat2;
					    u_xlat2 = cos(u_xlat2);
					    u_xlat19 = u_xlat2 * 0.680000007 + u_xlat19;
					    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
					    u_xlat7 = (-u_xlat13) * _Value + u_xlat7;
					    u_xlat13 = 0.0;
					    for(int u_xlati_loop_1 = 3 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
					    {
					        u_xlat8.x = float(u_xlati_loop_1);
					        u_xlat14.x = u_xlat7 * u_xlat8.x + u_xlat1.x;
					        u_xlat14.xy = u_xlat12.xy + u_xlat14.xx;
					        u_xlat8.xy = u_xlat8.xx + u_xlat14.xy;
					        u_xlat8.xy = cos(u_xlat8.xy);
					        u_xlat8.xy = u_xlat8.xy * vec2(0.200000003, 0.200000003) + u_xlat12.xy;
					        u_xlat3.xy = abs(u_xlat8.xy) * vec2(10.0, 10.0);
					        u_xlat15.xy = fract(u_xlat3.xy);
					        u_xlat15.xy = u_xlat15.xy + vec2(-0.5, -0.5);
					        u_xlat3.xy = floor(u_xlat3.xy);
					        u_xlat20 = 1.0;
					        u_xlat4.x = -1.0;
					        while(true){
					            u_xlatb16 = u_xlat4.x>=2.0;
					            if(u_xlatb16){break;}
					            u_xlat16 = u_xlat20;
					            u_xlat4.y = -1.0;
					            while(true){
					                u_xlatb22 = u_xlat4.y>=2.0;
					                if(u_xlatb22){break;}
					                u_xlat5.xy = u_xlat3.xy + u_xlat4.xy;
					                u_xlat5.xy = u_xlat5.xy + vec2(_TimeX);
					                u_xlat5.xy = cos(u_xlat5.xy);
					                u_xlat22 = u_xlat5.y + u_xlat5.x;
					                u_xlat5.xy = vec2(u_xlat22) * vec2(0.300000012, 0.300000012) + u_xlat15.xy;
					                u_xlat5.xy = (-u_xlat4.xy) + u_xlat5.xy;
					                u_xlat22 = dot(u_xlat5.xy, u_xlat5.xy);
					                u_xlat22 = sqrt(u_xlat22);
					                u_xlat16 = min(u_xlat22, u_xlat16);
					                u_xlat4.y = u_xlat4.y + 1.0;
					            }
					            u_xlat20 = u_xlat16;
					            u_xlat4.x = u_xlat4.x + 1.0;
					        }
					        u_xlat8.xy = u_xlat8.xy * vec2(14.2340002, 16.2339993);
					        u_xlat8.xy = cos(u_xlat8.xy);
					        u_xlat8.x = u_xlat8.y + u_xlat8.x;
					        u_xlat8.x = u_xlat8.x * 0.400000006 + 0.699999988;
					        u_xlat13 = u_xlat20 * u_xlat8.x + u_xlat13;
					    }
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1.xyz = vec3(u_xlat13) * _Value2.xyz;
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * _Value2.www + u_xlat10_0.xyz;
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