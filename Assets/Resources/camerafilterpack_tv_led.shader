Shader "CameraFilterPack/TV_LED" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 25943
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
					uniform 	float _Size;
					uniform 	float Fade;
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					bvec2 u_xlatb3;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec2 u_xlat6;
					vec2 u_xlat7;
					bvec2 u_xlatb9;
					vec2 u_xlat15;
					float u_xlat18;
					void main()
					{
					    u_xlat6.y = 0.0;
					    u_xlat7.x = 0.0;
					    u_xlat0.xw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xw = u_xlat0.xw * _ScreenResolution.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xw);
					    u_xlat0.xw = u_xlat1.xw / vec2(vec2(_Size, _Size));
					    u_xlatb3.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat0.xwxx)).xy;
					    u_xlat15.xy = fract(abs(u_xlat0.xw));
					    u_xlat0.xw = floor(u_xlat0.xw);
					    u_xlat0.xw = u_xlat0.xw * vec2(vec2(_Size, _Size));
					    u_xlat0.xw = u_xlat0.xw / _ScreenResolution.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xw);
					    u_xlat0.x = (u_xlatb3.x) ? u_xlat15.x : (-u_xlat15.x);
					    u_xlat0.w = (u_xlatb3.y) ? u_xlat15.y : (-u_xlat15.y);
					    u_xlat0.xw = u_xlat0.xw * vec2(vec2(_Size, _Size));
					    u_xlat3.xyz = vec3(_TimeX, _Size, _Size) * vec3(5.5999999, 0.333333343, 0.666666687);
					    u_xlatb9.xy = lessThan(u_xlat0.xxxx, u_xlat3.yzyy).xy;
					    u_xlatb0 = u_xlat0.w<_Size;
					    u_xlat18 = u_xlat1.w * 6.0 + u_xlat3.x;
					    u_xlat18 = sin(u_xlat18);
					    u_xlat18 = u_xlat18 + 1.25;
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat18 = u_xlat18 * 0.5;
					    u_xlat6.x = u_xlat10_4.y;
					    u_xlat7.y = u_xlat10_4.z;
					    u_xlat1.yz = (u_xlatb9.y) ? u_xlat6.xy : u_xlat7.xy;
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat1.x = 0.0;
					    u_xlat5.x = u_xlat10_4.x;
					    u_xlat1.xyz = (u_xlatb9.x) ? u_xlat5.xyz : u_xlat1.xyz;
					    u_xlat0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat1.xyz, vec3(bvec3(u_xlatb0)));
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(-0.200000003, -0.200000003, -0.200000003);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = (-u_xlat10_2.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_2.xyz;
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
					; Bound: 333
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %22 %310 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 22 
					                                                      OpMemberDecorate %24 0 Offset 24 
					                                                      OpMemberDecorate %24 1 Offset 24 
					                                                      OpMemberDecorate %24 2 Offset 24 
					                                                      OpMemberDecorate %24 3 Offset 24 
					                                                      OpMemberDecorate %24 4 RelaxedPrecision 
					                                                      OpMemberDecorate %24 4 Offset 24 
					                                                      OpDecorate %24 Block 
					                                                      OpDecorate %26 DescriptorSet 26 
					                                                      OpDecorate %26 Binding 26 
					                                                      OpDecorate %31 RelaxedPrecision 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate %35 RelaxedPrecision 
					                                                      OpDecorate %36 RelaxedPrecision 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %55 RelaxedPrecision 
					                                                      OpDecorate %55 DescriptorSet 55 
					                                                      OpDecorate %55 Binding 55 
					                                                      OpDecorate %56 RelaxedPrecision 
					                                                      OpDecorate %59 RelaxedPrecision 
					                                                      OpDecorate %59 DescriptorSet 59 
					                                                      OpDecorate %59 Binding 59 
					                                                      OpDecorate %60 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %127 RelaxedPrecision 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %245 RelaxedPrecision 
					                                                      OpDecorate %273 RelaxedPrecision 
					                                                      OpDecorate %302 RelaxedPrecision 
					                                                      OpDecorate %303 RelaxedPrecision 
					                                                      OpDecorate %310 Location 310 
					                                                      OpDecorate %326 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                          f32 %10 = OpConstant 3,674022E-40 
					                                              %11 = OpTypeInt 32 0 
					                                          u32 %12 = OpConstant 1 
					                                              %13 = OpTypePointer Private %6 
					                               Private f32_2* %15 = OpVariable Private 
					                                          u32 %16 = OpConstant 0 
					                                              %18 = OpTypeVector %6 4 
					                                              %19 = OpTypePointer Private %18 
					                               Private f32_4* %20 = OpVariable Private 
					                                              %21 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %24 = OpTypeStruct %6 %6 %6 %18 %18 
					                                              %25 = OpTypePointer Uniform %24 
					Uniform struct {f32; f32; f32; f32_4; f32_4;}* %26 = OpVariable Uniform 
					                                              %27 = OpTypeInt 32 1 
					                                          i32 %28 = OpConstant 4 
					                                              %29 = OpTypePointer Uniform %18 
					                               Private f32_4* %40 = OpVariable Private 
					                                          i32 %43 = OpConstant 3 
					                                              %50 = OpTypeVector %6 3 
					                                              %51 = OpTypePointer Private %50 
					                               Private f32_3* %52 = OpVariable Private 
					                                              %53 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %54 = OpTypePointer UniformConstant %53 
					         UniformConstant read_only Texture2D* %55 = OpVariable UniformConstant 
					                                              %57 = OpTypeSampler 
					                                              %58 = OpTypePointer UniformConstant %57 
					                     UniformConstant sampler* %59 = OpVariable UniformConstant 
					                                              %61 = OpTypeSampledImage %53 
					                                          i32 %69 = OpConstant 1 
					                                              %70 = OpTypePointer Uniform %6 
					                                              %82 = OpTypeBool 
					                                              %83 = OpTypeVector %82 2 
					                                              %84 = OpTypePointer Private %83 
					                              Private bool_2* %85 = OpVariable Private 
					                                              %91 = OpTypeVector %82 4 
					                               Private f32_2* %94 = OpVariable Private 
					                              Private f32_3* %125 = OpVariable Private 
					                                             %133 = OpTypePointer Private %82 
					                                             %136 = OpTypePointer Function %6 
					                                         u32 %160 = OpConstant 3 
					                              Private f32_3* %175 = OpVariable Private 
					                                         i32 %176 = OpConstant 0 
					                                         f32 %184 = OpConstant 3,674022E-40 
					                                         f32 %185 = OpConstant 3,674022E-40 
					                                         f32 %186 = OpConstant 3,674022E-40 
					                                       f32_3 %187 = OpConstantComposite %184 %185 %186 
					                             Private bool_2* %189 = OpVariable Private 
					                               Private bool* %196 = OpVariable Private 
					                                Private f32* %202 = OpVariable Private 
					                                         f32 %205 = OpConstant 3,674022E-40 
					                                         f32 %213 = OpConstant 3,674022E-40 
					                                         f32 %216 = OpConstant 3,674022E-40 
					                                         f32 %219 = OpConstant 3,674022E-40 
					                                         u32 %224 = OpConstant 2 
					                                             %230 = OpTypePointer Function %7 
					                              Private f32_3* %240 = OpVariable Private 
					                                             %249 = OpTypePointer Function %50 
					                                       f32_3 %260 = OpConstantComposite %10 %10 %10 
					                                             %264 = OpTypeVector %82 3 
					                                       f32_3 %266 = OpConstantComposite %216 %216 %216 
					                                         f32 %279 = OpConstant 3,674022E-40 
					                                       f32_3 %280 = OpConstantComposite %279 %279 %279 
					                                             %309 = OpTypePointer Output %18 
					                               Output f32_4* %310 = OpVariable Output 
					                                         i32 %311 = OpConstant 2 
					                                             %330 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %137 = OpVariable Function 
					                               Function f32* %150 = OpVariable Function 
					                             Function f32_2* %231 = OpVariable Function 
					                             Function f32_3* %250 = OpVariable Function 
					                                 Private f32* %14 = OpAccessChain %9 %12 
					                                                      OpStore %14 %10 
					                                 Private f32* %17 = OpAccessChain %15 %16 
					                                                      OpStore %17 %10 
					                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %30 = OpAccessChain %26 %28 
					                                        f32_4 %31 = OpLoad %30 
					                                        f32_2 %32 = OpVectorShuffle %31 %31 0 1 
					                                        f32_2 %33 = OpFMul %23 %32 
					                               Uniform f32_4* %34 = OpAccessChain %26 %28 
					                                        f32_4 %35 = OpLoad %34 
					                                        f32_2 %36 = OpVectorShuffle %35 %35 2 3 
					                                        f32_2 %37 = OpFAdd %33 %36 
					                                        f32_4 %38 = OpLoad %20 
					                                        f32_4 %39 = OpVectorShuffle %38 %37 4 1 2 5 
					                                                      OpStore %20 %39 
					                                        f32_4 %41 = OpLoad %20 
					                                        f32_2 %42 = OpVectorShuffle %41 %41 0 3 
					                               Uniform f32_4* %44 = OpAccessChain %26 %43 
					                                        f32_4 %45 = OpLoad %44 
					                                        f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                        f32_2 %47 = OpFMul %42 %46 
					                                        f32_4 %48 = OpLoad %40 
					                                        f32_4 %49 = OpVectorShuffle %48 %47 4 1 2 5 
					                                                      OpStore %40 %49 
					                          read_only Texture2D %56 = OpLoad %55 
					                                      sampler %60 = OpLoad %59 
					                   read_only Texture2DSampled %62 = OpSampledImage %56 %60 
					                                        f32_4 %63 = OpLoad %20 
					                                        f32_2 %64 = OpVectorShuffle %63 %63 0 3 
					                                        f32_4 %65 = OpImageSampleImplicitLod %62 %64 
					                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
					                                                      OpStore %52 %66 
					                                        f32_4 %67 = OpLoad %40 
					                                        f32_2 %68 = OpVectorShuffle %67 %67 0 3 
					                                 Uniform f32* %71 = OpAccessChain %26 %69 
					                                          f32 %72 = OpLoad %71 
					                                 Uniform f32* %73 = OpAccessChain %26 %69 
					                                          f32 %74 = OpLoad %73 
					                                        f32_2 %75 = OpCompositeConstruct %72 %74 
					                                          f32 %76 = OpCompositeExtract %75 0 
					                                          f32 %77 = OpCompositeExtract %75 1 
					                                        f32_2 %78 = OpCompositeConstruct %76 %77 
					                                        f32_2 %79 = OpFDiv %68 %78 
					                                        f32_4 %80 = OpLoad %20 
					                                        f32_4 %81 = OpVectorShuffle %80 %79 4 1 2 5 
					                                                      OpStore %20 %81 
					                                        f32_4 %86 = OpLoad %20 
					                                        f32_4 %87 = OpVectorShuffle %86 %86 0 3 0 0 
					                                        f32_4 %88 = OpLoad %20 
					                                        f32_4 %89 = OpVectorShuffle %88 %88 0 3 0 0 
					                                        f32_4 %90 = OpFNegate %89 
					                                       bool_4 %92 = OpFOrdGreaterThanEqual %87 %90 
					                                       bool_2 %93 = OpVectorShuffle %92 %92 0 1 
					                                                      OpStore %85 %93 
					                                        f32_4 %95 = OpLoad %20 
					                                        f32_2 %96 = OpVectorShuffle %95 %95 0 3 
					                                        f32_2 %97 = OpExtInst %1 4 %96 
					                                        f32_2 %98 = OpExtInst %1 10 %97 
					                                                      OpStore %94 %98 
					                                        f32_4 %99 = OpLoad %20 
					                                       f32_2 %100 = OpVectorShuffle %99 %99 0 3 
					                                       f32_2 %101 = OpExtInst %1 8 %100 
					                                       f32_4 %102 = OpLoad %20 
					                                       f32_4 %103 = OpVectorShuffle %102 %101 4 1 2 5 
					                                                      OpStore %20 %103 
					                                       f32_4 %104 = OpLoad %20 
					                                       f32_2 %105 = OpVectorShuffle %104 %104 0 3 
					                                Uniform f32* %106 = OpAccessChain %26 %69 
					                                         f32 %107 = OpLoad %106 
					                                Uniform f32* %108 = OpAccessChain %26 %69 
					                                         f32 %109 = OpLoad %108 
					                                       f32_2 %110 = OpCompositeConstruct %107 %109 
					                                         f32 %111 = OpCompositeExtract %110 0 
					                                         f32 %112 = OpCompositeExtract %110 1 
					                                       f32_2 %113 = OpCompositeConstruct %111 %112 
					                                       f32_2 %114 = OpFMul %105 %113 
					                                       f32_4 %115 = OpLoad %20 
					                                       f32_4 %116 = OpVectorShuffle %115 %114 4 1 2 5 
					                                                      OpStore %20 %116 
					                                       f32_4 %117 = OpLoad %20 
					                                       f32_2 %118 = OpVectorShuffle %117 %117 0 3 
					                              Uniform f32_4* %119 = OpAccessChain %26 %43 
					                                       f32_4 %120 = OpLoad %119 
					                                       f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                       f32_2 %122 = OpFDiv %118 %121 
					                                       f32_4 %123 = OpLoad %20 
					                                       f32_4 %124 = OpVectorShuffle %123 %122 4 1 2 5 
					                                                      OpStore %20 %124 
					                         read_only Texture2D %126 = OpLoad %55 
					                                     sampler %127 = OpLoad %59 
					                  read_only Texture2DSampled %128 = OpSampledImage %126 %127 
					                                       f32_4 %129 = OpLoad %20 
					                                       f32_2 %130 = OpVectorShuffle %129 %129 0 3 
					                                       f32_4 %131 = OpImageSampleImplicitLod %128 %130 
					                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                                      OpStore %125 %132 
					                               Private bool* %134 = OpAccessChain %85 %16 
					                                        bool %135 = OpLoad %134 
					                                                      OpSelectionMerge %139 None 
					                                                      OpBranchConditional %135 %138 %142 
					                                             %138 = OpLabel 
					                                Private f32* %140 = OpAccessChain %94 %16 
					                                         f32 %141 = OpLoad %140 
					                                                      OpStore %137 %141 
					                                                      OpBranch %139 
					                                             %142 = OpLabel 
					                                Private f32* %143 = OpAccessChain %94 %16 
					                                         f32 %144 = OpLoad %143 
					                                         f32 %145 = OpFNegate %144 
					                                                      OpStore %137 %145 
					                                                      OpBranch %139 
					                                             %139 = OpLabel 
					                                         f32 %146 = OpLoad %137 
					                                Private f32* %147 = OpAccessChain %20 %16 
					                                                      OpStore %147 %146 
					                               Private bool* %148 = OpAccessChain %85 %12 
					                                        bool %149 = OpLoad %148 
					                                                      OpSelectionMerge %152 None 
					                                                      OpBranchConditional %149 %151 %155 
					                                             %151 = OpLabel 
					                                Private f32* %153 = OpAccessChain %94 %12 
					                                         f32 %154 = OpLoad %153 
					                                                      OpStore %150 %154 
					                                                      OpBranch %152 
					                                             %155 = OpLabel 
					                                Private f32* %156 = OpAccessChain %94 %12 
					                                         f32 %157 = OpLoad %156 
					                                         f32 %158 = OpFNegate %157 
					                                                      OpStore %150 %158 
					                                                      OpBranch %152 
					                                             %152 = OpLabel 
					                                         f32 %159 = OpLoad %150 
					                                Private f32* %161 = OpAccessChain %20 %160 
					                                                      OpStore %161 %159 
					                                       f32_4 %162 = OpLoad %20 
					                                       f32_2 %163 = OpVectorShuffle %162 %162 0 3 
					                                Uniform f32* %164 = OpAccessChain %26 %69 
					                                         f32 %165 = OpLoad %164 
					                                Uniform f32* %166 = OpAccessChain %26 %69 
					                                         f32 %167 = OpLoad %166 
					                                       f32_2 %168 = OpCompositeConstruct %165 %167 
					                                         f32 %169 = OpCompositeExtract %168 0 
					                                         f32 %170 = OpCompositeExtract %168 1 
					                                       f32_2 %171 = OpCompositeConstruct %169 %170 
					                                       f32_2 %172 = OpFMul %163 %171 
					                                       f32_4 %173 = OpLoad %20 
					                                       f32_4 %174 = OpVectorShuffle %173 %172 4 1 2 5 
					                                                      OpStore %20 %174 
					                                Uniform f32* %177 = OpAccessChain %26 %176 
					                                         f32 %178 = OpLoad %177 
					                                Uniform f32* %179 = OpAccessChain %26 %69 
					                                         f32 %180 = OpLoad %179 
					                                Uniform f32* %181 = OpAccessChain %26 %69 
					                                         f32 %182 = OpLoad %181 
					                                       f32_3 %183 = OpCompositeConstruct %178 %180 %182 
					                                       f32_3 %188 = OpFMul %183 %187 
					                                                      OpStore %175 %188 
					                                       f32_4 %190 = OpLoad %20 
					                                       f32_4 %191 = OpVectorShuffle %190 %190 0 0 0 0 
					                                       f32_3 %192 = OpLoad %175 
					                                       f32_4 %193 = OpVectorShuffle %192 %192 1 2 1 1 
					                                      bool_4 %194 = OpFOrdLessThan %191 %193 
					                                      bool_2 %195 = OpVectorShuffle %194 %194 0 1 
					                                                      OpStore %189 %195 
					                                Private f32* %197 = OpAccessChain %20 %160 
					                                         f32 %198 = OpLoad %197 
					                                Uniform f32* %199 = OpAccessChain %26 %69 
					                                         f32 %200 = OpLoad %199 
					                                        bool %201 = OpFOrdLessThan %198 %200 
					                                                      OpStore %196 %201 
					                                Private f32* %203 = OpAccessChain %40 %160 
					                                         f32 %204 = OpLoad %203 
					                                         f32 %206 = OpFMul %204 %205 
					                                Private f32* %207 = OpAccessChain %175 %16 
					                                         f32 %208 = OpLoad %207 
					                                         f32 %209 = OpFAdd %206 %208 
					                                                      OpStore %202 %209 
					                                         f32 %210 = OpLoad %202 
					                                         f32 %211 = OpExtInst %1 13 %210 
					                                                      OpStore %202 %211 
					                                         f32 %212 = OpLoad %202 
					                                         f32 %214 = OpFAdd %212 %213 
					                                                      OpStore %202 %214 
					                                         f32 %215 = OpLoad %202 
					                                         f32 %217 = OpExtInst %1 37 %215 %216 
					                                                      OpStore %202 %217 
					                                         f32 %218 = OpLoad %202 
					                                         f32 %220 = OpFMul %218 %219 
					                                                      OpStore %202 %220 
					                                Private f32* %221 = OpAccessChain %125 %12 
					                                         f32 %222 = OpLoad %221 
					                                Private f32* %223 = OpAccessChain %9 %16 
					                                                      OpStore %223 %222 
					                                Private f32* %225 = OpAccessChain %125 %224 
					                                         f32 %226 = OpLoad %225 
					                                Private f32* %227 = OpAccessChain %15 %12 
					                                                      OpStore %227 %226 
					                               Private bool* %228 = OpAccessChain %189 %12 
					                                        bool %229 = OpLoad %228 
					                                                      OpSelectionMerge %233 None 
					                                                      OpBranchConditional %229 %232 %235 
					                                             %232 = OpLabel 
					                                       f32_2 %234 = OpLoad %9 
					                                                      OpStore %231 %234 
					                                                      OpBranch %233 
					                                             %235 = OpLabel 
					                                       f32_2 %236 = OpLoad %15 
					                                                      OpStore %231 %236 
					                                                      OpBranch %233 
					                                             %233 = OpLabel 
					                                       f32_2 %237 = OpLoad %231 
					                                       f32_4 %238 = OpLoad %40 
					                                       f32_4 %239 = OpVectorShuffle %238 %237 0 4 5 3 
					                                                      OpStore %40 %239 
					                                Private f32* %241 = OpAccessChain %240 %12 
					                                                      OpStore %241 %10 
					                                Private f32* %242 = OpAccessChain %240 %224 
					                                                      OpStore %242 %10 
					                                Private f32* %243 = OpAccessChain %40 %16 
					                                                      OpStore %243 %10 
					                                Private f32* %244 = OpAccessChain %125 %16 
					                                         f32 %245 = OpLoad %244 
					                                Private f32* %246 = OpAccessChain %240 %16 
					                                                      OpStore %246 %245 
					                               Private bool* %247 = OpAccessChain %189 %16 
					                                        bool %248 = OpLoad %247 
					                                                      OpSelectionMerge %252 None 
					                                                      OpBranchConditional %248 %251 %254 
					                                             %251 = OpLabel 
					                                       f32_3 %253 = OpLoad %240 
					                                                      OpStore %250 %253 
					                                                      OpBranch %252 
					                                             %254 = OpLabel 
					                                       f32_4 %255 = OpLoad %40 
					                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
					                                                      OpStore %250 %256 
					                                                      OpBranch %252 
					                                             %252 = OpLabel 
					                                       f32_3 %257 = OpLoad %250 
					                                       f32_4 %258 = OpLoad %40 
					                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 6 3 
					                                                      OpStore %40 %259 
					                                       f32_4 %261 = OpLoad %40 
					                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
					                                        bool %263 = OpLoad %196 
					                                      bool_3 %265 = OpCompositeConstruct %263 %263 %263 
					                                       f32_3 %267 = OpSelect %265 %266 %260 
					                                       f32_3 %268 = OpExtInst %1 46 %260 %262 %267 
					                                       f32_4 %269 = OpLoad %20 
					                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
					                                                      OpStore %20 %270 
					                                       f32_4 %271 = OpLoad %20 
					                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
					                                       f32_3 %273 = OpLoad %125 
					                                       f32_3 %274 = OpFAdd %272 %273 
					                                       f32_4 %275 = OpLoad %20 
					                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 6 3 
					                                                      OpStore %20 %276 
					                                       f32_4 %277 = OpLoad %20 
					                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
					                                       f32_3 %281 = OpFAdd %278 %280 
					                                       f32_4 %282 = OpLoad %40 
					                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
					                                                      OpStore %40 %283 
					                                       f32_4 %284 = OpLoad %20 
					                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
					                                       f32_4 %286 = OpLoad %40 
					                                       f32_3 %287 = OpVectorShuffle %286 %286 0 1 2 
					                                       f32_3 %288 = OpFNegate %287 
					                                       f32_3 %289 = OpFAdd %285 %288 
					                                       f32_4 %290 = OpLoad %20 
					                                       f32_4 %291 = OpVectorShuffle %290 %289 4 5 6 3 
					                                                      OpStore %20 %291 
					                                         f32 %292 = OpLoad %202 
					                                       f32_3 %293 = OpCompositeConstruct %292 %292 %292 
					                                       f32_4 %294 = OpLoad %20 
					                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
					                                       f32_3 %296 = OpFMul %293 %295 
					                                       f32_4 %297 = OpLoad %40 
					                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
					                                       f32_3 %299 = OpFAdd %296 %298 
					                                       f32_4 %300 = OpLoad %20 
					                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
					                                                      OpStore %20 %301 
					                                       f32_3 %302 = OpLoad %52 
					                                       f32_3 %303 = OpFNegate %302 
					                                       f32_4 %304 = OpLoad %20 
					                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
					                                       f32_3 %306 = OpFAdd %303 %305 
					                                       f32_4 %307 = OpLoad %20 
					                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 6 3 
					                                                      OpStore %20 %308 
					                                Uniform f32* %312 = OpAccessChain %26 %311 
					                                         f32 %313 = OpLoad %312 
					                                Uniform f32* %314 = OpAccessChain %26 %311 
					                                         f32 %315 = OpLoad %314 
					                                Uniform f32* %316 = OpAccessChain %26 %311 
					                                         f32 %317 = OpLoad %316 
					                                       f32_3 %318 = OpCompositeConstruct %313 %315 %317 
					                                         f32 %319 = OpCompositeExtract %318 0 
					                                         f32 %320 = OpCompositeExtract %318 1 
					                                         f32 %321 = OpCompositeExtract %318 2 
					                                       f32_3 %322 = OpCompositeConstruct %319 %320 %321 
					                                       f32_4 %323 = OpLoad %20 
					                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
					                                       f32_3 %325 = OpFMul %322 %324 
					                                       f32_3 %326 = OpLoad %52 
					                                       f32_3 %327 = OpFAdd %325 %326 
					                                       f32_4 %328 = OpLoad %310 
					                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
					                                                      OpStore %310 %329 
					                                 Output f32* %331 = OpAccessChain %310 %160 
					                                                      OpStore %331 %216 
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
						float _Size;
						float Fade;
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					bvec2 u_xlatb3;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec2 u_xlat6;
					vec2 u_xlat7;
					bvec2 u_xlatb9;
					vec2 u_xlat15;
					float u_xlat18;
					void main()
					{
					    u_xlat6.y = 0.0;
					    u_xlat7.x = 0.0;
					    u_xlat0.xw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xw = u_xlat0.xw * _ScreenResolution.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xw);
					    u_xlat0.xw = u_xlat1.xw / vec2(vec2(_Size, _Size));
					    u_xlatb3.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat0.xwxx)).xy;
					    u_xlat15.xy = fract(abs(u_xlat0.xw));
					    u_xlat0.xw = floor(u_xlat0.xw);
					    u_xlat0.xw = u_xlat0.xw * vec2(vec2(_Size, _Size));
					    u_xlat0.xw = u_xlat0.xw / _ScreenResolution.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat0.xw);
					    u_xlat0.x = (u_xlatb3.x) ? u_xlat15.x : (-u_xlat15.x);
					    u_xlat0.w = (u_xlatb3.y) ? u_xlat15.y : (-u_xlat15.y);
					    u_xlat0.xw = u_xlat0.xw * vec2(vec2(_Size, _Size));
					    u_xlat3.xyz = vec3(_TimeX, _Size, _Size) * vec3(5.5999999, 0.333333343, 0.666666687);
					    u_xlatb9.xy = lessThan(u_xlat0.xxxx, u_xlat3.yzyy).xy;
					    u_xlatb0 = u_xlat0.w<_Size;
					    u_xlat18 = u_xlat1.w * 6.0 + u_xlat3.x;
					    u_xlat18 = sin(u_xlat18);
					    u_xlat18 = u_xlat18 + 1.25;
					    u_xlat18 = min(u_xlat18, 1.0);
					    u_xlat18 = u_xlat18 * 0.5;
					    u_xlat6.x = u_xlat10_4.y;
					    u_xlat7.y = u_xlat10_4.z;
					    u_xlat1.yz = (u_xlatb9.y) ? u_xlat6.xy : u_xlat7.xy;
					    u_xlat5.y = float(0.0);
					    u_xlat5.z = float(0.0);
					    u_xlat1.x = 0.0;
					    u_xlat5.x = u_xlat10_4.x;
					    u_xlat1.xyz = (u_xlatb9.x) ? u_xlat5.xyz : u_xlat1.xyz;
					    u_xlat0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat1.xyz, vec3(bvec3(u_xlatb0)));
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_4.xyz;
					    u_xlat1.xyz = u_xlat0.xyz + vec3(-0.200000003, -0.200000003, -0.200000003);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = (-u_xlat10_2.xyz) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(vec3(Fade, Fade, Fade)) * u_xlat0.xyz + u_xlat10_2.xyz;
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