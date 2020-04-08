Shader "CameraFilterPack/Vision_Drost" {
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
			GpuProgramID 34689
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bvec2 u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					bvec2 u_xlatb4;
					vec3 u_xlat5;
					bool u_xlatb7;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat10 = min(abs(u_xlat1.y), abs(u_xlat1.x));
					    u_xlat15 = max(abs(u_xlat1.y), abs(u_xlat1.x));
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat10 = u_xlat15 * u_xlat10;
					    u_xlat15 = u_xlat10 * u_xlat10;
					    u_xlat2.x = u_xlat15 * 0.0208350997 + -0.0851330012;
					    u_xlat2.x = u_xlat15 * u_xlat2.x + 0.180141002;
					    u_xlat2.x = u_xlat15 * u_xlat2.x + -0.330299497;
					    u_xlat15 = u_xlat15 * u_xlat2.x + 0.999866009;
					    u_xlat2.x = u_xlat15 * u_xlat10;
					    u_xlatb7 = abs(u_xlat1.y)<abs(u_xlat1.x);
					    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
					    u_xlat2.x = u_xlatb7 ? u_xlat2.x : float(0.0);
					    u_xlat10 = u_xlat10 * u_xlat15 + u_xlat2.x;
					    u_xlatb15 = u_xlat1.y<(-u_xlat1.y);
					    u_xlat15 = u_xlatb15 ? -3.14159274 : float(0.0);
					    u_xlat10 = u_xlat15 + u_xlat10;
					    u_xlat15 = min(u_xlat1.y, u_xlat1.x);
					    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
					    u_xlatb15 = u_xlat15<(-u_xlat15);
					    u_xlatb1.x = u_xlat1.x>=(-u_xlat1.x);
					    u_xlatb15 = u_xlatb15 && u_xlatb1.x;
					    u_xlat10 = (u_xlatb15) ? (-u_xlat10) : u_xlat10;
					    u_xlat10 = u_xlat10 + 3.1415;
					    u_xlat10 = u_xlat10 * 0.159159631;
					    u_xlat10 = _TimeX * _Value2 + u_xlat10;
					    u_xlat10 = fract(u_xlat10);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat15 = 0.0;
					    while(true){
					        u_xlatb1.x = u_xlat15>=4.0;
					        if(u_xlatb1.x){break;}
					        u_xlat1.x = (-u_xlat10) + u_xlat15;
					        u_xlat1.xy = u_xlat1.zw * u_xlat1.xx + vec2(0.5, 0.5);
					        u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					        u_xlatb4.xy = greaterThanEqual(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb17 = u_xlatb4.y && u_xlatb4.x;
					        u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
					        u_xlatb1.x = u_xlatb1.x && u_xlatb17;
					        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
					        u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
					        u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
					        u_xlat2.xyz = u_xlat1.xxx * u_xlat3.xyz + u_xlat2.xyz;
					        u_xlat15 = u_xlat15 + 1.0;
					    }
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value);
					    u_xlat0.x = u_xlat0.x * -4.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat5.x) * u_xlat0.x + 1.0;
					    u_xlat5.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_1.xyz;
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
					; Bound: 369
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %11 %356 
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
					                                                OpDecorate %234 RelaxedPrecision 
					                                                OpDecorate %237 RelaxedPrecision 
					                                                OpDecorate %237 DescriptorSet 237 
					                                                OpDecorate %237 Binding 237 
					                                                OpDecorate %238 RelaxedPrecision 
					                                                OpDecorate %241 RelaxedPrecision 
					                                                OpDecorate %241 DescriptorSet 241 
					                                                OpDecorate %241 Binding 241 
					                                                OpDecorate %242 RelaxedPrecision 
					                                                OpDecorate %248 RelaxedPrecision 
					                                                OpDecorate %285 RelaxedPrecision 
					                                                OpDecorate %295 RelaxedPrecision 
					                                                OpDecorate %296 RelaxedPrecision 
					                                                OpDecorate %297 RelaxedPrecision 
					                                                OpDecorate %301 RelaxedPrecision 
					                                                OpDecorate %351 RelaxedPrecision 
					                                                OpDecorate %352 RelaxedPrecision 
					                                                OpDecorate %356 Location 356 
					                                                OpDecorate %361 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 2 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_2* %9 = OpVariable Private 
					                                        %10 = OpTypePointer Input %7 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                        %13 = OpTypeVector %6 4 
					                                        %14 = OpTypeStruct %6 %6 %6 %13 
					                                        %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                        %17 = OpTypeInt 32 1 
					                                    i32 %18 = OpConstant 3 
					                                        %19 = OpTypePointer Uniform %13 
					                                        %28 = OpTypePointer Private %13 
					                         Private f32_4* %29 = OpVariable Private 
					                                    f32 %32 = OpConstant 3,674022E-40 
					                                  f32_4 %33 = OpConstantComposite %32 %32 %32 %32 
					                                        %35 = OpTypePointer Private %6 
					                           Private f32* %36 = OpVariable Private 
					                                        %37 = OpTypeInt 32 0 
					                                    u32 %38 = OpConstant 1 
					                                    u32 %42 = OpConstant 0 
					                           Private f32* %47 = OpVariable Private 
					                                    f32 %55 = OpConstant 3,674022E-40 
					                                        %64 = OpTypeVector %6 3 
					                                        %65 = OpTypePointer Private %64 
					                         Private f32_3* %66 = OpVariable Private 
					                                    f32 %68 = OpConstant 3,674022E-40 
					                                    f32 %70 = OpConstant 3,674022E-40 
					                                    f32 %77 = OpConstant 3,674022E-40 
					                                    f32 %84 = OpConstant 3,674022E-40 
					                                    f32 %91 = OpConstant 3,674022E-40 
					                                        %97 = OpTypeBool 
					                                        %98 = OpTypePointer Private %97 
					                          Private bool* %99 = OpVariable Private 
					                                   f32 %109 = OpConstant 3,674022E-40 
					                                   f32 %111 = OpConstant 3,674022E-40 
					                                       %115 = OpTypePointer Function %6 
					                                   f32 %122 = OpConstant 3,674022E-40 
					                         Private bool* %131 = OpVariable Private 
					                                   f32 %139 = OpConstant 3,674022E-40 
					                                       %159 = OpTypeVector %97 2 
					                                       %160 = OpTypePointer Private %159 
					                       Private bool_2* %161 = OpVariable Private 
					                                   f32 %183 = OpConstant 3,674022E-40 
					                                   f32 %186 = OpConstant 3,674022E-40 
					                                   i32 %188 = OpConstant 0 
					                                       %189 = OpTypePointer Uniform %6 
					                                   i32 %192 = OpConstant 2 
					                                   u32 %202 = OpConstant 2 
					                                  bool %209 = OpConstantTrue 
					                                   f32 %211 = OpConstant 3,674022E-40 
					                                   f32 %229 = OpConstant 3,674022E-40 
					                                 f32_2 %230 = OpConstantComposite %229 %229 
					                        Private f32_3* %234 = OpVariable Private 
					                                       %235 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                       %236 = OpTypePointer UniformConstant %235 
					  UniformConstant read_only Texture2D* %237 = OpVariable UniformConstant 
					                                       %239 = OpTypeSampler 
					                                       %240 = OpTypePointer UniformConstant %239 
					              UniformConstant sampler* %241 = OpVariable UniformConstant 
					                                       %243 = OpTypeSampledImage %235 
					                       Private bool_2* %249 = OpVariable Private 
					                                 f32_4 %252 = OpConstantComposite %122 %122 %122 %122 
					                                       %253 = OpTypeVector %97 4 
					                         Private bool* %256 = OpVariable Private 
					                                 f32_4 %262 = OpConstantComposite %55 %55 %122 %122 
					                        Private f32_3* %282 = OpVariable Private 
					                        Private f32_3* %295 = OpVariable Private 
					                                   i32 %315 = OpConstant 1 
					                                   f32 %323 = OpConstant 3,674022E-40 
					                        Private f32_3* %330 = OpVariable Private 
					                                   f32 %334 = OpConstant 3,674022E-40 
					                                       %355 = OpTypePointer Output %13 
					                         Output f32_4* %356 = OpVariable Output 
					                                   u32 %365 = OpConstant 3 
					                                       %366 = OpTypePointer Output %6 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                         Function f32* %116 = OpVariable Function 
					                         Function f32* %174 = OpVariable Function 
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
					                                  f32_2 %30 = OpLoad %9 
					                                  f32_4 %31 = OpVectorShuffle %30 %30 0 1 0 1 
					                                  f32_4 %34 = OpFAdd %31 %33 
					                                                OpStore %29 %34 
					                           Private f32* %39 = OpAccessChain %29 %38 
					                                    f32 %40 = OpLoad %39 
					                                    f32 %41 = OpExtInst %1 4 %40 
					                           Private f32* %43 = OpAccessChain %29 %42 
					                                    f32 %44 = OpLoad %43 
					                                    f32 %45 = OpExtInst %1 4 %44 
					                                    f32 %46 = OpExtInst %1 37 %41 %45 
					                                                OpStore %36 %46 
					                           Private f32* %48 = OpAccessChain %29 %38 
					                                    f32 %49 = OpLoad %48 
					                                    f32 %50 = OpExtInst %1 4 %49 
					                           Private f32* %51 = OpAccessChain %29 %42 
					                                    f32 %52 = OpLoad %51 
					                                    f32 %53 = OpExtInst %1 4 %52 
					                                    f32 %54 = OpExtInst %1 40 %50 %53 
					                                                OpStore %47 %54 
					                                    f32 %56 = OpLoad %47 
					                                    f32 %57 = OpFDiv %55 %56 
					                                                OpStore %47 %57 
					                                    f32 %58 = OpLoad %47 
					                                    f32 %59 = OpLoad %36 
					                                    f32 %60 = OpFMul %58 %59 
					                                                OpStore %36 %60 
					                                    f32 %61 = OpLoad %36 
					                                    f32 %62 = OpLoad %36 
					                                    f32 %63 = OpFMul %61 %62 
					                                                OpStore %47 %63 
					                                    f32 %67 = OpLoad %47 
					                                    f32 %69 = OpFMul %67 %68 
					                                    f32 %71 = OpFAdd %69 %70 
					                           Private f32* %72 = OpAccessChain %66 %42 
					                                                OpStore %72 %71 
					                                    f32 %73 = OpLoad %47 
					                           Private f32* %74 = OpAccessChain %66 %42 
					                                    f32 %75 = OpLoad %74 
					                                    f32 %76 = OpFMul %73 %75 
					                                    f32 %78 = OpFAdd %76 %77 
					                           Private f32* %79 = OpAccessChain %66 %42 
					                                                OpStore %79 %78 
					                                    f32 %80 = OpLoad %47 
					                           Private f32* %81 = OpAccessChain %66 %42 
					                                    f32 %82 = OpLoad %81 
					                                    f32 %83 = OpFMul %80 %82 
					                                    f32 %85 = OpFAdd %83 %84 
					                           Private f32* %86 = OpAccessChain %66 %42 
					                                                OpStore %86 %85 
					                                    f32 %87 = OpLoad %47 
					                           Private f32* %88 = OpAccessChain %66 %42 
					                                    f32 %89 = OpLoad %88 
					                                    f32 %90 = OpFMul %87 %89 
					                                    f32 %92 = OpFAdd %90 %91 
					                                                OpStore %47 %92 
					                                    f32 %93 = OpLoad %47 
					                                    f32 %94 = OpLoad %36 
					                                    f32 %95 = OpFMul %93 %94 
					                           Private f32* %96 = OpAccessChain %66 %42 
					                                                OpStore %96 %95 
					                          Private f32* %100 = OpAccessChain %29 %38 
					                                   f32 %101 = OpLoad %100 
					                                   f32 %102 = OpExtInst %1 4 %101 
					                          Private f32* %103 = OpAccessChain %29 %42 
					                                   f32 %104 = OpLoad %103 
					                                   f32 %105 = OpExtInst %1 4 %104 
					                                  bool %106 = OpFOrdLessThan %102 %105 
					                                                OpStore %99 %106 
					                          Private f32* %107 = OpAccessChain %66 %42 
					                                   f32 %108 = OpLoad %107 
					                                   f32 %110 = OpFMul %108 %109 
					                                   f32 %112 = OpFAdd %110 %111 
					                          Private f32* %113 = OpAccessChain %66 %42 
					                                                OpStore %113 %112 
					                                  bool %114 = OpLoad %99 
					                                                OpSelectionMerge %118 None 
					                                                OpBranchConditional %114 %117 %121 
					                                       %117 = OpLabel 
					                          Private f32* %119 = OpAccessChain %66 %42 
					                                   f32 %120 = OpLoad %119 
					                                                OpStore %116 %120 
					                                                OpBranch %118 
					                                       %121 = OpLabel 
					                                                OpStore %116 %122 
					                                                OpBranch %118 
					                                       %118 = OpLabel 
					                                   f32 %123 = OpLoad %116 
					                          Private f32* %124 = OpAccessChain %66 %42 
					                                                OpStore %124 %123 
					                                   f32 %125 = OpLoad %36 
					                                   f32 %126 = OpLoad %47 
					                                   f32 %127 = OpFMul %125 %126 
					                          Private f32* %128 = OpAccessChain %66 %42 
					                                   f32 %129 = OpLoad %128 
					                                   f32 %130 = OpFAdd %127 %129 
					                                                OpStore %36 %130 
					                          Private f32* %132 = OpAccessChain %29 %38 
					                                   f32 %133 = OpLoad %132 
					                          Private f32* %134 = OpAccessChain %29 %38 
					                                   f32 %135 = OpLoad %134 
					                                   f32 %136 = OpFNegate %135 
					                                  bool %137 = OpFOrdLessThan %133 %136 
					                                                OpStore %131 %137 
					                                  bool %138 = OpLoad %131 
					                                   f32 %140 = OpSelect %138 %139 %122 
					                                                OpStore %47 %140 
					                                   f32 %141 = OpLoad %47 
					                                   f32 %142 = OpLoad %36 
					                                   f32 %143 = OpFAdd %141 %142 
					                                                OpStore %36 %143 
					                          Private f32* %144 = OpAccessChain %29 %38 
					                                   f32 %145 = OpLoad %144 
					                          Private f32* %146 = OpAccessChain %29 %42 
					                                   f32 %147 = OpLoad %146 
					                                   f32 %148 = OpExtInst %1 37 %145 %147 
					                                                OpStore %47 %148 
					                          Private f32* %149 = OpAccessChain %29 %38 
					                                   f32 %150 = OpLoad %149 
					                          Private f32* %151 = OpAccessChain %29 %42 
					                                   f32 %152 = OpLoad %151 
					                                   f32 %153 = OpExtInst %1 40 %150 %152 
					                          Private f32* %154 = OpAccessChain %29 %42 
					                                                OpStore %154 %153 
					                                   f32 %155 = OpLoad %47 
					                                   f32 %156 = OpLoad %47 
					                                   f32 %157 = OpFNegate %156 
					                                  bool %158 = OpFOrdLessThan %155 %157 
					                                                OpStore %131 %158 
					                          Private f32* %162 = OpAccessChain %29 %42 
					                                   f32 %163 = OpLoad %162 
					                          Private f32* %164 = OpAccessChain %29 %42 
					                                   f32 %165 = OpLoad %164 
					                                   f32 %166 = OpFNegate %165 
					                                  bool %167 = OpFOrdGreaterThanEqual %163 %166 
					                         Private bool* %168 = OpAccessChain %161 %42 
					                                                OpStore %168 %167 
					                                  bool %169 = OpLoad %131 
					                         Private bool* %170 = OpAccessChain %161 %42 
					                                  bool %171 = OpLoad %170 
					                                  bool %172 = OpLogicalAnd %169 %171 
					                                                OpStore %131 %172 
					                                  bool %173 = OpLoad %131 
					                                                OpSelectionMerge %176 None 
					                                                OpBranchConditional %173 %175 %179 
					                                       %175 = OpLabel 
					                                   f32 %177 = OpLoad %36 
					                                   f32 %178 = OpFNegate %177 
					                                                OpStore %174 %178 
					                                                OpBranch %176 
					                                       %179 = OpLabel 
					                                   f32 %180 = OpLoad %36 
					                                                OpStore %174 %180 
					                                                OpBranch %176 
					                                       %176 = OpLabel 
					                                   f32 %181 = OpLoad %174 
					                                                OpStore %36 %181 
					                                   f32 %182 = OpLoad %36 
					                                   f32 %184 = OpFAdd %182 %183 
					                                                OpStore %36 %184 
					                                   f32 %185 = OpLoad %36 
					                                   f32 %187 = OpFMul %185 %186 
					                                                OpStore %36 %187 
					                          Uniform f32* %190 = OpAccessChain %16 %188 
					                                   f32 %191 = OpLoad %190 
					                          Uniform f32* %193 = OpAccessChain %16 %192 
					                                   f32 %194 = OpLoad %193 
					                                   f32 %195 = OpFMul %191 %194 
					                                   f32 %196 = OpLoad %36 
					                                   f32 %197 = OpFAdd %195 %196 
					                                                OpStore %36 %197 
					                                   f32 %198 = OpLoad %36 
					                                   f32 %199 = OpExtInst %1 10 %198 
					                                                OpStore %36 %199 
					                          Private f32* %200 = OpAccessChain %66 %42 
					                                                OpStore %200 %122 
					                          Private f32* %201 = OpAccessChain %66 %38 
					                                                OpStore %201 %122 
					                          Private f32* %203 = OpAccessChain %66 %202 
					                                                OpStore %203 %122 
					                                                OpStore %47 %122 
					                                                OpBranch %204 
					                                       %204 = OpLabel 
					                                                OpLoopMerge %206 %207 None 
					                                                OpBranch %208 
					                                       %208 = OpLabel 
					                                                OpBranchConditional %209 %205 %206 
					                                       %205 = OpLabel 
					                                   f32 %210 = OpLoad %47 
					                                  bool %212 = OpFOrdGreaterThanEqual %210 %211 
					                         Private bool* %213 = OpAccessChain %161 %42 
					                                                OpStore %213 %212 
					                         Private bool* %214 = OpAccessChain %161 %42 
					                                  bool %215 = OpLoad %214 
					                                                OpSelectionMerge %217 None 
					                                                OpBranchConditional %215 %216 %217 
					                                       %216 = OpLabel 
					                                                OpBranch %206 
					                                       %217 = OpLabel 
					                                   f32 %219 = OpLoad %36 
					                                   f32 %220 = OpFNegate %219 
					                                   f32 %221 = OpLoad %47 
					                                   f32 %222 = OpFAdd %220 %221 
					                          Private f32* %223 = OpAccessChain %29 %42 
					                                                OpStore %223 %222 
					                                 f32_4 %224 = OpLoad %29 
					                                 f32_2 %225 = OpVectorShuffle %224 %224 2 3 
					                                 f32_4 %226 = OpLoad %29 
					                                 f32_2 %227 = OpVectorShuffle %226 %226 0 0 
					                                 f32_2 %228 = OpFMul %225 %227 
					                                 f32_2 %231 = OpFAdd %228 %230 
					                                 f32_4 %232 = OpLoad %29 
					                                 f32_4 %233 = OpVectorShuffle %232 %231 4 5 2 3 
					                                                OpStore %29 %233 
					                   read_only Texture2D %238 = OpLoad %237 
					                               sampler %242 = OpLoad %241 
					            read_only Texture2DSampled %244 = OpSampledImage %238 %242 
					                                 f32_4 %245 = OpLoad %29 
					                                 f32_2 %246 = OpVectorShuffle %245 %245 0 1 
					                                 f32_4 %247 = OpImageSampleImplicitLod %244 %246 
					                                 f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
					                                                OpStore %234 %248 
					                                 f32_4 %250 = OpLoad %29 
					                                 f32_4 %251 = OpVectorShuffle %250 %250 0 1 0 0 
					                                bool_4 %254 = OpFOrdGreaterThanEqual %251 %252 
					                                bool_2 %255 = OpVectorShuffle %254 %254 0 1 
					                                                OpStore %249 %255 
					                         Private bool* %257 = OpAccessChain %249 %38 
					                                  bool %258 = OpLoad %257 
					                         Private bool* %259 = OpAccessChain %249 %42 
					                                  bool %260 = OpLoad %259 
					                                  bool %261 = OpLogicalAnd %258 %260 
					                                                OpStore %256 %261 
					                                 f32_4 %263 = OpLoad %29 
					                                 f32_4 %264 = OpVectorShuffle %263 %263 0 1 0 0 
					                                bool_4 %265 = OpFOrdGreaterThanEqual %262 %264 
					                                bool_2 %266 = OpVectorShuffle %265 %265 0 1 
					                                                OpStore %161 %266 
					                         Private bool* %267 = OpAccessChain %161 %42 
					                                  bool %268 = OpLoad %267 
					                                  bool %269 = OpLoad %256 
					                                  bool %270 = OpLogicalAnd %268 %269 
					                         Private bool* %271 = OpAccessChain %161 %42 
					                                                OpStore %271 %270 
					                         Private bool* %272 = OpAccessChain %161 %38 
					                                  bool %273 = OpLoad %272 
					                         Private bool* %274 = OpAccessChain %161 %42 
					                                  bool %275 = OpLoad %274 
					                                  bool %276 = OpLogicalAnd %273 %275 
					                         Private bool* %277 = OpAccessChain %161 %42 
					                                                OpStore %277 %276 
					                         Private bool* %278 = OpAccessChain %161 %42 
					                                  bool %279 = OpLoad %278 
					                                   f32 %280 = OpSelect %279 %55 %122 
					                          Private f32* %281 = OpAccessChain %29 %42 
					                                                OpStore %281 %280 
					                                 f32_3 %283 = OpLoad %66 
					                                 f32_3 %284 = OpFNegate %283 
					                                 f32_3 %285 = OpLoad %234 
					                                 f32_3 %286 = OpFAdd %284 %285 
					                                                OpStore %282 %286 
					                                 f32_4 %287 = OpLoad %29 
					                                 f32_3 %288 = OpVectorShuffle %287 %287 0 0 0 
					                                 f32_3 %289 = OpLoad %282 
					                                 f32_3 %290 = OpFMul %288 %289 
					                                 f32_3 %291 = OpLoad %66 
					                                 f32_3 %292 = OpFAdd %290 %291 
					                                                OpStore %66 %292 
					                                   f32 %293 = OpLoad %47 
					                                   f32 %294 = OpFAdd %293 %55 
					                                                OpStore %47 %294 
					                                                OpBranch %207 
					                                       %207 = OpLabel 
					                                                OpBranch %204 
					                                       %206 = OpLabel 
					                   read_only Texture2D %296 = OpLoad %237 
					                               sampler %297 = OpLoad %241 
					            read_only Texture2DSampled %298 = OpSampledImage %296 %297 
					                                 f32_2 %299 = OpLoad %9 
					                                 f32_4 %300 = OpImageSampleImplicitLod %298 %299 
					                                 f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
					                                                OpStore %295 %301 
					                                 f32_2 %302 = OpLoad %9 
					                                 f32_2 %303 = OpFNegate %302 
					                                 f32_2 %304 = OpFAdd %303 %230 
					                                                OpStore %9 %304 
					                                 f32_2 %305 = OpLoad %9 
					                                 f32_2 %306 = OpLoad %9 
					                                   f32 %307 = OpDot %305 %306 
					                          Private f32* %308 = OpAccessChain %9 %42 
					                                                OpStore %308 %307 
					                          Private f32* %309 = OpAccessChain %9 %42 
					                                   f32 %310 = OpLoad %309 
					                                   f32 %311 = OpExtInst %1 31 %310 
					                          Private f32* %312 = OpAccessChain %9 %42 
					                                                OpStore %312 %311 
					                          Private f32* %313 = OpAccessChain %9 %42 
					                                   f32 %314 = OpLoad %313 
					                          Uniform f32* %316 = OpAccessChain %16 %315 
					                                   f32 %317 = OpLoad %316 
					                                   f32 %318 = OpFNegate %317 
					                                   f32 %319 = OpFAdd %314 %318 
					                          Private f32* %320 = OpAccessChain %9 %42 
					                                                OpStore %320 %319 
					                          Private f32* %321 = OpAccessChain %9 %42 
					                                   f32 %322 = OpLoad %321 
					                                   f32 %324 = OpFMul %322 %323 
					                          Private f32* %325 = OpAccessChain %9 %42 
					                                                OpStore %325 %324 
					                          Private f32* %326 = OpAccessChain %9 %42 
					                                   f32 %327 = OpLoad %326 
					                                   f32 %328 = OpExtInst %1 43 %327 %122 %55 
					                          Private f32* %329 = OpAccessChain %9 %42 
					                                                OpStore %329 %328 
					                          Private f32* %331 = OpAccessChain %9 %42 
					                                   f32 %332 = OpLoad %331 
					                                   f32 %333 = OpFMul %332 %109 
					                                   f32 %335 = OpFAdd %333 %334 
					                          Private f32* %336 = OpAccessChain %330 %42 
					                                                OpStore %336 %335 
					                          Private f32* %337 = OpAccessChain %9 %42 
					                                   f32 %338 = OpLoad %337 
					                          Private f32* %339 = OpAccessChain %9 %42 
					                                   f32 %340 = OpLoad %339 
					                                   f32 %341 = OpFMul %338 %340 
					                          Private f32* %342 = OpAccessChain %9 %42 
					                                                OpStore %342 %341 
					                          Private f32* %343 = OpAccessChain %330 %42 
					                                   f32 %344 = OpLoad %343 
					                                   f32 %345 = OpFNegate %344 
					                          Private f32* %346 = OpAccessChain %9 %42 
					                                   f32 %347 = OpLoad %346 
					                                   f32 %348 = OpFMul %345 %347 
					                                   f32 %349 = OpFAdd %348 %55 
					                          Private f32* %350 = OpAccessChain %9 %42 
					                                                OpStore %350 %349 
					                                 f32_3 %351 = OpLoad %295 
					                                 f32_3 %352 = OpFNegate %351 
					                                 f32_3 %353 = OpLoad %66 
					                                 f32_3 %354 = OpFAdd %352 %353 
					                                                OpStore %330 %354 
					                                 f32_2 %357 = OpLoad %9 
					                                 f32_3 %358 = OpVectorShuffle %357 %357 0 0 0 
					                                 f32_3 %359 = OpLoad %330 
					                                 f32_3 %360 = OpFMul %358 %359 
					                                 f32_3 %361 = OpLoad %295 
					                                 f32_3 %362 = OpFAdd %360 %361 
					                                 f32_4 %363 = OpLoad %356 
					                                 f32_4 %364 = OpVectorShuffle %363 %362 4 5 6 3 
					                                                OpStore %356 %364 
					                           Output f32* %367 = OpAccessChain %356 %365 
					                                                OpStore %367 %55 
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
						vec4 unused_0_4;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bvec2 u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					bvec2 u_xlatb4;
					vec3 u_xlat5;
					bool u_xlatb7;
					float u_xlat10;
					float u_xlat15;
					bool u_xlatb15;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
					    u_xlat10 = min(abs(u_xlat1.y), abs(u_xlat1.x));
					    u_xlat15 = max(abs(u_xlat1.y), abs(u_xlat1.x));
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat10 = u_xlat15 * u_xlat10;
					    u_xlat15 = u_xlat10 * u_xlat10;
					    u_xlat2.x = u_xlat15 * 0.0208350997 + -0.0851330012;
					    u_xlat2.x = u_xlat15 * u_xlat2.x + 0.180141002;
					    u_xlat2.x = u_xlat15 * u_xlat2.x + -0.330299497;
					    u_xlat15 = u_xlat15 * u_xlat2.x + 0.999866009;
					    u_xlat2.x = u_xlat15 * u_xlat10;
					    u_xlatb7 = abs(u_xlat1.y)<abs(u_xlat1.x);
					    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
					    u_xlat2.x = u_xlatb7 ? u_xlat2.x : float(0.0);
					    u_xlat10 = u_xlat10 * u_xlat15 + u_xlat2.x;
					    u_xlatb15 = u_xlat1.y<(-u_xlat1.y);
					    u_xlat15 = u_xlatb15 ? -3.14159274 : float(0.0);
					    u_xlat10 = u_xlat15 + u_xlat10;
					    u_xlat15 = min(u_xlat1.y, u_xlat1.x);
					    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
					    u_xlatb15 = u_xlat15<(-u_xlat15);
					    u_xlatb1.x = u_xlat1.x>=(-u_xlat1.x);
					    u_xlatb15 = u_xlatb15 && u_xlatb1.x;
					    u_xlat10 = (u_xlatb15) ? (-u_xlat10) : u_xlat10;
					    u_xlat10 = u_xlat10 + 3.1415;
					    u_xlat10 = u_xlat10 * 0.159159631;
					    u_xlat10 = _TimeX * _Value2 + u_xlat10;
					    u_xlat10 = fract(u_xlat10);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat15 = 0.0;
					    while(true){
					        u_xlatb1.x = u_xlat15>=4.0;
					        if(u_xlatb1.x){break;}
					        u_xlat1.x = (-u_xlat10) + u_xlat15;
					        u_xlat1.xy = u_xlat1.zw * u_xlat1.xx + vec2(0.5, 0.5);
					        u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					        u_xlatb4.xy = greaterThanEqual(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					        u_xlatb17 = u_xlatb4.y && u_xlatb4.x;
					        u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
					        u_xlatb1.x = u_xlatb1.x && u_xlatb17;
					        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
					        u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
					        u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
					        u_xlat2.xyz = u_xlat1.xxx * u_xlat3.xyz + u_xlat2.xyz;
					        u_xlat15 = u_xlat15 + 1.0;
					    }
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value);
					    u_xlat0.x = u_xlat0.x * -4.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat5.x) * u_xlat0.x + 1.0;
					    u_xlat5.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_1.xyz;
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