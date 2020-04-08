Shader "CameraFilterPack/Drawing_Manga_Flash" {
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
			GpuProgramID 38410
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
					uniform 	float _Intensity;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					float u_xlat2;
					vec2 u_xlat3;
					bool u_xlatb3;
					bool u_xlatb5;
					vec2 u_xlat6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.y = (-_Value3);
					    u_xlat0.x = (-_Value4);
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy + u_xlat6.yx;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat6.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
					    u_xlat6.x = float(1.0) / u_xlat6.x;
					    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
					    u_xlat6.x = u_xlat6.x * u_xlat9;
					    u_xlat9 = u_xlat6.x * u_xlat6.x;
					    u_xlat2 = u_xlat9 * 0.0208350997 + -0.0851330012;
					    u_xlat2 = u_xlat9 * u_xlat2 + 0.180141002;
					    u_xlat2 = u_xlat9 * u_xlat2 + -0.330299497;
					    u_xlat9 = u_xlat9 * u_xlat2 + 0.999866009;
					    u_xlat2 = u_xlat9 * u_xlat6.x;
					    u_xlat2 = u_xlat2 * -2.0 + 1.57079637;
					    u_xlatb5 = abs(u_xlat0.y)<abs(u_xlat0.x);
					    u_xlat2 = u_xlatb5 ? u_xlat2 : float(0.0);
					    u_xlat6.x = u_xlat6.x * u_xlat9 + u_xlat2;
					    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
					    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
					    u_xlat6.x = u_xlat9 + u_xlat6.x;
					    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
					    u_xlatb9 = u_xlat9<(-u_xlat9);
					    u_xlat2 = max(u_xlat0.y, u_xlat0.x);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb3 = u_xlat2>=(-u_xlat2);
					    u_xlatb3 = u_xlatb3 && u_xlatb9;
					    u_xlat3.x = (u_xlatb3) ? (-u_xlat6.x) : u_xlat6.x;
					    u_xlat3.x = _Value * 3.14159274 + u_xlat3.x;
					    u_xlat6.x = _Value * 6.28318548;
					    u_xlat3.x = u_xlat3.x / u_xlat6.x;
					    u_xlat3.x = u_xlat3.x * 700.0;
					    u_xlat3.y = _Value2 * _TimeX;
					    u_xlat3.xy = floor(u_xlat3.xy);
					    u_xlat6.x = u_xlat3.y / _Value2;
					    u_xlat6.x = max(u_xlat6.x, 0.100000001);
					    u_xlat0.y = u_xlat6.x * u_xlat3.x;
					    u_xlat3.xy = u_xlat0.yx * vec2(0.00142857141, 1.41421354);
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat3.x = fract(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 0.699999988 + 0.300000012;
					    u_xlat0.x = u_xlat0.x * 1.41421354 + (-u_xlat3.x);
					    u_xlatb3 = u_xlat3.x<u_xlat3.y;
					    u_xlat0.x = abs(u_xlat0.x);
					    u_xlat0.x = u_xlatb3 ? u_xlat0.x : float(0.0);
					    SV_Target0 = vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity)) * (-u_xlat0.xxxx) + u_xlat10_1;
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
					; Bound: 338
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %32 %315 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %11 0 Offset 11 
					                                                      OpMemberDecorate %11 1 Offset 11 
					                                                      OpMemberDecorate %11 2 Offset 11 
					                                                      OpMemberDecorate %11 3 Offset 11 
					                                                      OpMemberDecorate %11 4 Offset 11 
					                                                      OpMemberDecorate %11 5 Offset 11 
					                                                      OpMemberDecorate %11 6 RelaxedPrecision 
					                                                      OpMemberDecorate %11 6 Offset 11 
					                                                      OpDecorate %11 Block 
					                                                      OpDecorate %13 DescriptorSet 13 
					                                                      OpDecorate %13 Binding 13 
					                                                      OpDecorate vs_TEXCOORD0 Location 32 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %38 RelaxedPrecision 
					                                                      OpDecorate %41 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %49 RelaxedPrecision 
					                                                      OpDecorate %52 RelaxedPrecision 
					                                                      OpDecorate %52 DescriptorSet 52 
					                                                      OpDecorate %52 Binding 52 
					                                                      OpDecorate %53 RelaxedPrecision 
					                                                      OpDecorate %56 RelaxedPrecision 
					                                                      OpDecorate %56 DescriptorSet 56 
					                                                      OpDecorate %56 Binding 56 
					                                                      OpDecorate %57 RelaxedPrecision 
					                                                      OpDecorate %315 Location 315 
					                                                      OpDecorate %335 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypeStruct %6 %6 %6 %6 %6 %6 %10 
					                                              %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                              %14 = OpTypeInt 32 1 
					                                          i32 %15 = OpConstant 3 
					                                              %16 = OpTypePointer Uniform %6 
					                                              %20 = OpTypeInt 32 0 
					                                          u32 %21 = OpConstant 1 
					                                              %22 = OpTypePointer Private %6 
					                                          i32 %24 = OpConstant 4 
					                                          u32 %28 = OpConstant 0 
					                               Private f32_2* %30 = OpVariable Private 
					                                              %31 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %34 = OpConstant 6 
					                                              %35 = OpTypePointer Uniform %10 
					                                              %48 = OpTypePointer Private %10 
					                               Private f32_4* %49 = OpVariable Private 
					                                              %50 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %51 = OpTypePointer UniformConstant %50 
					         UniformConstant read_only Texture2D* %52 = OpVariable UniformConstant 
					                                              %54 = OpTypeSampler 
					                                              %55 = OpTypePointer UniformConstant %54 
					                     UniformConstant sampler* %56 = OpVariable UniformConstant 
					                                              %58 = OpTypeSampledImage %50 
					                                          f32 %70 = OpConstant 3,674022E-40 
					                                 Private f32* %75 = OpVariable Private 
					                                 Private f32* %93 = OpVariable Private 
					                                          f32 %95 = OpConstant 3,674022E-40 
					                                          f32 %97 = OpConstant 3,674022E-40 
					                                         f32 %102 = OpConstant 3,674022E-40 
					                                         f32 %107 = OpConstant 3,674022E-40 
					                                         f32 %112 = OpConstant 3,674022E-40 
					                                         f32 %119 = OpConstant 3,674022E-40 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                                             %123 = OpTypeBool 
					                                             %124 = OpTypePointer Private %123 
					                               Private bool* %125 = OpVariable Private 
					                                         f32 %135 = OpConstant 3,674022E-40 
					                               Private bool* %144 = OpVariable Private 
					                                         f32 %152 = OpConstant 3,674022E-40 
					                               Private bool* %181 = OpVariable Private 
					                              Private f32_2* %189 = OpVariable Private 
					                                             %191 = OpTypePointer Function %6 
					                                         i32 %203 = OpConstant 1 
					                                         f32 %206 = OpConstant 3,674022E-40 
					                                         f32 %214 = OpConstant 3,674022E-40 
					                                         f32 %225 = OpConstant 3,674022E-40 
					                                         i32 %228 = OpConstant 2 
					                                         i32 %231 = OpConstant 0 
					                                         f32 %246 = OpConstant 3,674022E-40 
					                                         f32 %257 = OpConstant 3,674022E-40 
					                                         f32 %258 = OpConstant 3,674022E-40 
					                                       f32_2 %259 = OpConstantComposite %257 %258 
					                                         f32 %263 = OpConstant 3,674022E-40 
					                                         f32 %264 = OpConstant 3,674022E-40 
					                                       f32_2 %265 = OpConstantComposite %263 %264 
					                                         f32 %274 = OpConstant 3,674022E-40 
					                                         f32 %283 = OpConstant 3,674022E-40 
					                                         f32 %285 = OpConstant 3,674022E-40 
					                                             %314 = OpTypePointer Output %10 
					                               Output f32_4* %315 = OpVariable Output 
					                                         i32 %316 = OpConstant 5 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %192 = OpVariable Function 
					                               Function f32* %306 = OpVariable Function 
					                                 Uniform f32* %17 = OpAccessChain %13 %15 
					                                          f32 %18 = OpLoad %17 
					                                          f32 %19 = OpFNegate %18 
					                                 Private f32* %23 = OpAccessChain %9 %21 
					                                                      OpStore %23 %19 
					                                 Uniform f32* %25 = OpAccessChain %13 %24 
					                                          f32 %26 = OpLoad %25 
					                                          f32 %27 = OpFNegate %26 
					                                 Private f32* %29 = OpAccessChain %9 %28 
					                                                      OpStore %29 %27 
					                                        f32_2 %33 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %36 = OpAccessChain %13 %34 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_2 %38 = OpVectorShuffle %37 %37 0 1 
					                                        f32_2 %39 = OpFMul %33 %38 
					                               Uniform f32_4* %40 = OpAccessChain %13 %34 
					                                        f32_4 %41 = OpLoad %40 
					                                        f32_2 %42 = OpVectorShuffle %41 %41 2 3 
					                                        f32_2 %43 = OpFAdd %39 %42 
					                                                      OpStore %30 %43 
					                                        f32_2 %44 = OpLoad %9 
					                                        f32_2 %45 = OpLoad %30 
					                                        f32_2 %46 = OpVectorShuffle %45 %45 1 0 
					                                        f32_2 %47 = OpFAdd %44 %46 
					                                                      OpStore %9 %47 
					                          read_only Texture2D %53 = OpLoad %52 
					                                      sampler %57 = OpLoad %56 
					                   read_only Texture2DSampled %59 = OpSampledImage %53 %57 
					                                        f32_2 %60 = OpLoad %30 
					                                        f32_4 %61 = OpImageSampleImplicitLod %59 %60 
					                                                      OpStore %49 %61 
					                                 Private f32* %62 = OpAccessChain %9 %21 
					                                          f32 %63 = OpLoad %62 
					                                          f32 %64 = OpExtInst %1 4 %63 
					                                 Private f32* %65 = OpAccessChain %9 %28 
					                                          f32 %66 = OpLoad %65 
					                                          f32 %67 = OpExtInst %1 4 %66 
					                                          f32 %68 = OpExtInst %1 40 %64 %67 
					                                 Private f32* %69 = OpAccessChain %30 %28 
					                                                      OpStore %69 %68 
					                                 Private f32* %71 = OpAccessChain %30 %28 
					                                          f32 %72 = OpLoad %71 
					                                          f32 %73 = OpFDiv %70 %72 
					                                 Private f32* %74 = OpAccessChain %30 %28 
					                                                      OpStore %74 %73 
					                                 Private f32* %76 = OpAccessChain %9 %21 
					                                          f32 %77 = OpLoad %76 
					                                          f32 %78 = OpExtInst %1 4 %77 
					                                 Private f32* %79 = OpAccessChain %9 %28 
					                                          f32 %80 = OpLoad %79 
					                                          f32 %81 = OpExtInst %1 4 %80 
					                                          f32 %82 = OpExtInst %1 37 %78 %81 
					                                                      OpStore %75 %82 
					                                 Private f32* %83 = OpAccessChain %30 %28 
					                                          f32 %84 = OpLoad %83 
					                                          f32 %85 = OpLoad %75 
					                                          f32 %86 = OpFMul %84 %85 
					                                 Private f32* %87 = OpAccessChain %30 %28 
					                                                      OpStore %87 %86 
					                                 Private f32* %88 = OpAccessChain %30 %28 
					                                          f32 %89 = OpLoad %88 
					                                 Private f32* %90 = OpAccessChain %30 %28 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %92 = OpFMul %89 %91 
					                                                      OpStore %75 %92 
					                                          f32 %94 = OpLoad %75 
					                                          f32 %96 = OpFMul %94 %95 
					                                          f32 %98 = OpFAdd %96 %97 
					                                                      OpStore %93 %98 
					                                          f32 %99 = OpLoad %75 
					                                         f32 %100 = OpLoad %93 
					                                         f32 %101 = OpFMul %99 %100 
					                                         f32 %103 = OpFAdd %101 %102 
					                                                      OpStore %93 %103 
					                                         f32 %104 = OpLoad %75 
					                                         f32 %105 = OpLoad %93 
					                                         f32 %106 = OpFMul %104 %105 
					                                         f32 %108 = OpFAdd %106 %107 
					                                                      OpStore %93 %108 
					                                         f32 %109 = OpLoad %75 
					                                         f32 %110 = OpLoad %93 
					                                         f32 %111 = OpFMul %109 %110 
					                                         f32 %113 = OpFAdd %111 %112 
					                                                      OpStore %75 %113 
					                                         f32 %114 = OpLoad %75 
					                                Private f32* %115 = OpAccessChain %30 %28 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFMul %114 %116 
					                                                      OpStore %93 %117 
					                                         f32 %118 = OpLoad %93 
					                                         f32 %120 = OpFMul %118 %119 
					                                         f32 %122 = OpFAdd %120 %121 
					                                                      OpStore %93 %122 
					                                Private f32* %126 = OpAccessChain %9 %21 
					                                         f32 %127 = OpLoad %126 
					                                         f32 %128 = OpExtInst %1 4 %127 
					                                Private f32* %129 = OpAccessChain %9 %28 
					                                         f32 %130 = OpLoad %129 
					                                         f32 %131 = OpExtInst %1 4 %130 
					                                        bool %132 = OpFOrdLessThan %128 %131 
					                                                      OpStore %125 %132 
					                                        bool %133 = OpLoad %125 
					                                         f32 %134 = OpLoad %93 
					                                         f32 %136 = OpSelect %133 %134 %135 
					                                                      OpStore %93 %136 
					                                Private f32* %137 = OpAccessChain %30 %28 
					                                         f32 %138 = OpLoad %137 
					                                         f32 %139 = OpLoad %75 
					                                         f32 %140 = OpFMul %138 %139 
					                                         f32 %141 = OpLoad %93 
					                                         f32 %142 = OpFAdd %140 %141 
					                                Private f32* %143 = OpAccessChain %30 %28 
					                                                      OpStore %143 %142 
					                                Private f32* %145 = OpAccessChain %9 %21 
					                                         f32 %146 = OpLoad %145 
					                                Private f32* %147 = OpAccessChain %9 %21 
					                                         f32 %148 = OpLoad %147 
					                                         f32 %149 = OpFNegate %148 
					                                        bool %150 = OpFOrdLessThan %146 %149 
					                                                      OpStore %144 %150 
					                                        bool %151 = OpLoad %144 
					                                         f32 %153 = OpSelect %151 %152 %135 
					                                                      OpStore %75 %153 
					                                         f32 %154 = OpLoad %75 
					                                Private f32* %155 = OpAccessChain %30 %28 
					                                         f32 %156 = OpLoad %155 
					                                         f32 %157 = OpFAdd %154 %156 
					                                Private f32* %158 = OpAccessChain %30 %28 
					                                                      OpStore %158 %157 
					                                Private f32* %159 = OpAccessChain %9 %21 
					                                         f32 %160 = OpLoad %159 
					                                Private f32* %161 = OpAccessChain %9 %28 
					                                         f32 %162 = OpLoad %161 
					                                         f32 %163 = OpExtInst %1 37 %160 %162 
					                                                      OpStore %75 %163 
					                                         f32 %164 = OpLoad %75 
					                                         f32 %165 = OpLoad %75 
					                                         f32 %166 = OpFNegate %165 
					                                        bool %167 = OpFOrdLessThan %164 %166 
					                                                      OpStore %144 %167 
					                                Private f32* %168 = OpAccessChain %9 %21 
					                                         f32 %169 = OpLoad %168 
					                                Private f32* %170 = OpAccessChain %9 %28 
					                                         f32 %171 = OpLoad %170 
					                                         f32 %172 = OpExtInst %1 40 %169 %171 
					                                                      OpStore %93 %172 
					                                       f32_2 %173 = OpLoad %9 
					                                       f32_2 %174 = OpLoad %9 
					                                         f32 %175 = OpDot %173 %174 
					                                Private f32* %176 = OpAccessChain %9 %28 
					                                                      OpStore %176 %175 
					                                Private f32* %177 = OpAccessChain %9 %28 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpExtInst %1 31 %178 
					                                Private f32* %180 = OpAccessChain %9 %28 
					                                                      OpStore %180 %179 
					                                         f32 %182 = OpLoad %93 
					                                         f32 %183 = OpLoad %93 
					                                         f32 %184 = OpFNegate %183 
					                                        bool %185 = OpFOrdGreaterThanEqual %182 %184 
					                                                      OpStore %181 %185 
					                                        bool %186 = OpLoad %181 
					                                        bool %187 = OpLoad %144 
					                                        bool %188 = OpLogicalAnd %186 %187 
					                                                      OpStore %181 %188 
					                                        bool %190 = OpLoad %181 
					                                                      OpSelectionMerge %194 None 
					                                                      OpBranchConditional %190 %193 %198 
					                                             %193 = OpLabel 
					                                Private f32* %195 = OpAccessChain %30 %28 
					                                         f32 %196 = OpLoad %195 
					                                         f32 %197 = OpFNegate %196 
					                                                      OpStore %192 %197 
					                                                      OpBranch %194 
					                                             %198 = OpLabel 
					                                Private f32* %199 = OpAccessChain %30 %28 
					                                         f32 %200 = OpLoad %199 
					                                                      OpStore %192 %200 
					                                                      OpBranch %194 
					                                             %194 = OpLabel 
					                                         f32 %201 = OpLoad %192 
					                                Private f32* %202 = OpAccessChain %189 %28 
					                                                      OpStore %202 %201 
					                                Uniform f32* %204 = OpAccessChain %13 %203 
					                                         f32 %205 = OpLoad %204 
					                                         f32 %207 = OpFMul %205 %206 
					                                Private f32* %208 = OpAccessChain %189 %28 
					                                         f32 %209 = OpLoad %208 
					                                         f32 %210 = OpFAdd %207 %209 
					                                Private f32* %211 = OpAccessChain %189 %28 
					                                                      OpStore %211 %210 
					                                Uniform f32* %212 = OpAccessChain %13 %203 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %215 = OpFMul %213 %214 
					                                Private f32* %216 = OpAccessChain %30 %28 
					                                                      OpStore %216 %215 
					                                Private f32* %217 = OpAccessChain %189 %28 
					                                         f32 %218 = OpLoad %217 
					                                Private f32* %219 = OpAccessChain %30 %28 
					                                         f32 %220 = OpLoad %219 
					                                         f32 %221 = OpFDiv %218 %220 
					                                Private f32* %222 = OpAccessChain %189 %28 
					                                                      OpStore %222 %221 
					                                Private f32* %223 = OpAccessChain %189 %28 
					                                         f32 %224 = OpLoad %223 
					                                         f32 %226 = OpFMul %224 %225 
					                                Private f32* %227 = OpAccessChain %189 %28 
					                                                      OpStore %227 %226 
					                                Uniform f32* %229 = OpAccessChain %13 %228 
					                                         f32 %230 = OpLoad %229 
					                                Uniform f32* %232 = OpAccessChain %13 %231 
					                                         f32 %233 = OpLoad %232 
					                                         f32 %234 = OpFMul %230 %233 
					                                Private f32* %235 = OpAccessChain %189 %21 
					                                                      OpStore %235 %234 
					                                       f32_2 %236 = OpLoad %189 
					                                       f32_2 %237 = OpExtInst %1 8 %236 
					                                                      OpStore %189 %237 
					                                Private f32* %238 = OpAccessChain %189 %21 
					                                         f32 %239 = OpLoad %238 
					                                Uniform f32* %240 = OpAccessChain %13 %228 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpFDiv %239 %241 
					                                Private f32* %243 = OpAccessChain %30 %28 
					                                                      OpStore %243 %242 
					                                Private f32* %244 = OpAccessChain %30 %28 
					                                         f32 %245 = OpLoad %244 
					                                         f32 %247 = OpExtInst %1 40 %245 %246 
					                                Private f32* %248 = OpAccessChain %30 %28 
					                                                      OpStore %248 %247 
					                                Private f32* %249 = OpAccessChain %30 %28 
					                                         f32 %250 = OpLoad %249 
					                                Private f32* %251 = OpAccessChain %189 %28 
					                                         f32 %252 = OpLoad %251 
					                                         f32 %253 = OpFMul %250 %252 
					                                Private f32* %254 = OpAccessChain %9 %21 
					                                                      OpStore %254 %253 
					                                       f32_2 %255 = OpLoad %9 
					                                       f32_2 %256 = OpVectorShuffle %255 %255 1 0 
					                                       f32_2 %260 = OpFMul %256 %259 
					                                                      OpStore %189 %260 
					                                       f32_2 %261 = OpLoad %189 
					                                       f32_2 %262 = OpVectorShuffle %261 %261 0 0 
					                                         f32 %266 = OpDot %262 %265 
					                                Private f32* %267 = OpAccessChain %189 %28 
					                                                      OpStore %267 %266 
					                                Private f32* %268 = OpAccessChain %189 %28 
					                                         f32 %269 = OpLoad %268 
					                                         f32 %270 = OpExtInst %1 13 %269 
					                                Private f32* %271 = OpAccessChain %189 %28 
					                                                      OpStore %271 %270 
					                                Private f32* %272 = OpAccessChain %189 %28 
					                                         f32 %273 = OpLoad %272 
					                                         f32 %275 = OpFMul %273 %274 
					                                Private f32* %276 = OpAccessChain %189 %28 
					                                                      OpStore %276 %275 
					                                Private f32* %277 = OpAccessChain %189 %28 
					                                         f32 %278 = OpLoad %277 
					                                         f32 %279 = OpExtInst %1 10 %278 
					                                Private f32* %280 = OpAccessChain %189 %28 
					                                                      OpStore %280 %279 
					                                Private f32* %281 = OpAccessChain %189 %28 
					                                         f32 %282 = OpLoad %281 
					                                         f32 %284 = OpFMul %282 %283 
					                                         f32 %286 = OpFAdd %284 %285 
					                                Private f32* %287 = OpAccessChain %189 %28 
					                                                      OpStore %287 %286 
					                                Private f32* %288 = OpAccessChain %9 %28 
					                                         f32 %289 = OpLoad %288 
					                                         f32 %290 = OpFMul %289 %258 
					                                Private f32* %291 = OpAccessChain %189 %28 
					                                         f32 %292 = OpLoad %291 
					                                         f32 %293 = OpFNegate %292 
					                                         f32 %294 = OpFAdd %290 %293 
					                                Private f32* %295 = OpAccessChain %9 %28 
					                                                      OpStore %295 %294 
					                                Private f32* %296 = OpAccessChain %189 %28 
					                                         f32 %297 = OpLoad %296 
					                                Private f32* %298 = OpAccessChain %189 %21 
					                                         f32 %299 = OpLoad %298 
					                                        bool %300 = OpFOrdLessThan %297 %299 
					                                                      OpStore %181 %300 
					                                Private f32* %301 = OpAccessChain %9 %28 
					                                         f32 %302 = OpLoad %301 
					                                         f32 %303 = OpExtInst %1 4 %302 
					                                Private f32* %304 = OpAccessChain %9 %28 
					                                                      OpStore %304 %303 
					                                        bool %305 = OpLoad %181 
					                                                      OpSelectionMerge %308 None 
					                                                      OpBranchConditional %305 %307 %311 
					                                             %307 = OpLabel 
					                                Private f32* %309 = OpAccessChain %9 %28 
					                                         f32 %310 = OpLoad %309 
					                                                      OpStore %306 %310 
					                                                      OpBranch %308 
					                                             %311 = OpLabel 
					                                                      OpStore %306 %135 
					                                                      OpBranch %308 
					                                             %308 = OpLabel 
					                                         f32 %312 = OpLoad %306 
					                                Private f32* %313 = OpAccessChain %9 %28 
					                                                      OpStore %313 %312 
					                                Uniform f32* %317 = OpAccessChain %13 %316 
					                                         f32 %318 = OpLoad %317 
					                                Uniform f32* %319 = OpAccessChain %13 %316 
					                                         f32 %320 = OpLoad %319 
					                                Uniform f32* %321 = OpAccessChain %13 %316 
					                                         f32 %322 = OpLoad %321 
					                                Uniform f32* %323 = OpAccessChain %13 %316 
					                                         f32 %324 = OpLoad %323 
					                                       f32_4 %325 = OpCompositeConstruct %318 %320 %322 %324 
					                                         f32 %326 = OpCompositeExtract %325 0 
					                                         f32 %327 = OpCompositeExtract %325 1 
					                                         f32 %328 = OpCompositeExtract %325 2 
					                                         f32 %329 = OpCompositeExtract %325 3 
					                                       f32_4 %330 = OpCompositeConstruct %326 %327 %328 %329 
					                                       f32_2 %331 = OpLoad %9 
					                                       f32_4 %332 = OpVectorShuffle %331 %331 0 0 0 0 
					                                       f32_4 %333 = OpFNegate %332 
					                                       f32_4 %334 = OpFMul %330 %333 
					                                       f32_4 %335 = OpLoad %49 
					                                       f32_4 %336 = OpFAdd %334 %335 
					                                                      OpStore %315 %336 
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
						float _Intensity;
						vec4 unused_0_7;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_1;
					float u_xlat2;
					vec2 u_xlat3;
					bool u_xlatb3;
					bool u_xlatb5;
					vec2 u_xlat6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.y = (-_Value3);
					    u_xlat0.x = (-_Value4);
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xy = u_xlat0.xy + u_xlat6.yx;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat6.x = max(abs(u_xlat0.y), abs(u_xlat0.x));
					    u_xlat6.x = float(1.0) / u_xlat6.x;
					    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
					    u_xlat6.x = u_xlat6.x * u_xlat9;
					    u_xlat9 = u_xlat6.x * u_xlat6.x;
					    u_xlat2 = u_xlat9 * 0.0208350997 + -0.0851330012;
					    u_xlat2 = u_xlat9 * u_xlat2 + 0.180141002;
					    u_xlat2 = u_xlat9 * u_xlat2 + -0.330299497;
					    u_xlat9 = u_xlat9 * u_xlat2 + 0.999866009;
					    u_xlat2 = u_xlat9 * u_xlat6.x;
					    u_xlat2 = u_xlat2 * -2.0 + 1.57079637;
					    u_xlatb5 = abs(u_xlat0.y)<abs(u_xlat0.x);
					    u_xlat2 = u_xlatb5 ? u_xlat2 : float(0.0);
					    u_xlat6.x = u_xlat6.x * u_xlat9 + u_xlat2;
					    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
					    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
					    u_xlat6.x = u_xlat9 + u_xlat6.x;
					    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
					    u_xlatb9 = u_xlat9<(-u_xlat9);
					    u_xlat2 = max(u_xlat0.y, u_xlat0.x);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb3 = u_xlat2>=(-u_xlat2);
					    u_xlatb3 = u_xlatb3 && u_xlatb9;
					    u_xlat3.x = (u_xlatb3) ? (-u_xlat6.x) : u_xlat6.x;
					    u_xlat3.x = _Value * 3.14159274 + u_xlat3.x;
					    u_xlat6.x = _Value * 6.28318548;
					    u_xlat3.x = u_xlat3.x / u_xlat6.x;
					    u_xlat3.x = u_xlat3.x * 700.0;
					    u_xlat3.y = _Value2 * _TimeX;
					    u_xlat3.xy = floor(u_xlat3.xy);
					    u_xlat6.x = u_xlat3.y / _Value2;
					    u_xlat6.x = max(u_xlat6.x, 0.100000001);
					    u_xlat0.y = u_xlat6.x * u_xlat3.x;
					    u_xlat3.xy = u_xlat0.yx * vec2(0.00142857141, 1.41421354);
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat3.x = fract(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 0.699999988 + 0.300000012;
					    u_xlat0.x = u_xlat0.x * 1.41421354 + (-u_xlat3.x);
					    u_xlatb3 = u_xlat3.x<u_xlat3.y;
					    u_xlat0.x = abs(u_xlat0.x);
					    u_xlat0.x = u_xlatb3 ? u_xlat0.x : float(0.0);
					    SV_Target0 = vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity)) * (-u_xlat0.xxxx) + u_xlat10_1;
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