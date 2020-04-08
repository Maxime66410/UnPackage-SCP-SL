Shader "CameraFilterPack/Vision_Tunnel" {
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
			GpuProgramID 35557
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
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					vec2 u_xlat6;
					float u_xlat7;
					float u_xlat9;
					bool u_xlatb9;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.x = max(abs(u_xlat6.y), abs(u_xlat6.x));
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat4 = min(abs(u_xlat6.y), abs(u_xlat6.x));
					    u_xlat1.x = u_xlat1.x * u_xlat4;
					    u_xlat4 = u_xlat1.x * u_xlat1.x;
					    u_xlat7 = u_xlat4 * 0.0208350997 + -0.0851330012;
					    u_xlat7 = u_xlat4 * u_xlat7 + 0.180141002;
					    u_xlat7 = u_xlat4 * u_xlat7 + -0.330299497;
					    u_xlat4 = u_xlat4 * u_xlat7 + 0.999866009;
					    u_xlat7 = u_xlat4 * u_xlat1.x;
					    u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
					    u_xlatb10 = abs(u_xlat6.y)<abs(u_xlat6.x);
					    u_xlat7 = u_xlatb10 ? u_xlat7 : float(0.0);
					    u_xlat1.x = u_xlat1.x * u_xlat4 + u_xlat7;
					    u_xlatb4 = u_xlat6.y<(-u_xlat6.y);
					    u_xlat4 = u_xlatb4 ? -3.14159274 : float(0.0);
					    u_xlat1.x = u_xlat4 + u_xlat1.x;
					    u_xlat4 = min(u_xlat6.y, u_xlat6.x);
					    u_xlatb4 = u_xlat4<(-u_xlat4);
					    u_xlat7 = max(u_xlat6.y, u_xlat6.x);
					    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlatb9 = u_xlat7>=(-u_xlat7);
					    u_xlatb9 = u_xlatb9 && u_xlatb4;
					    u_xlat9 = (u_xlatb9) ? (-u_xlat1.x) : u_xlat1.x;
					    u_xlat9 = u_xlat9 * 0.318309158;
					    u_xlat1.x = u_xlat9 / _Value3;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat1.y = (-_Value3) * u_xlat1.x + u_xlat9;
					    u_xlat9 = 0.100000001 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x + u_xlat6.x;
					    u_xlat6.x = min(u_xlat6.x, 1.0);
					    u_xlat1.x = (-u_xlat9) + 0.800000012;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat9 = u_xlat6.x * -2.0 + 3.0;
					    u_xlat6.x = u_xlat6.x * u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * u_xlat9;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value);
					    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat6.xxx + (-u_xlat10_2.xyz);
					    u_xlat1.x = _Value + -0.0500000007;
					    u_xlat1.x = u_xlat1.x + (-_Value2);
					    u_xlat1.x = u_xlat1.x + (-_Value);
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_2.xyz;
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
					; Bound: 359
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %11 %346 
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
					                                                OpDecorate %226 RelaxedPrecision 
					                                                OpDecorate %229 RelaxedPrecision 
					                                                OpDecorate %229 DescriptorSet 229 
					                                                OpDecorate %229 Binding 229 
					                                                OpDecorate %230 RelaxedPrecision 
					                                                OpDecorate %233 RelaxedPrecision 
					                                                OpDecorate %233 DescriptorSet 233 
					                                                OpDecorate %233 Binding 233 
					                                                OpDecorate %234 RelaxedPrecision 
					                                                OpDecorate %239 RelaxedPrecision 
					                                                OpDecorate %256 RelaxedPrecision 
					                                                OpDecorate %257 RelaxedPrecision 
					                                                OpDecorate %258 RelaxedPrecision 
					                                                OpDecorate %262 RelaxedPrecision 
					                                                OpDecorate %285 RelaxedPrecision 
					                                                OpDecorate %289 RelaxedPrecision 
					                                                OpDecorate %290 RelaxedPrecision 
					                                                OpDecorate %346 Location 346 
					                                                OpDecorate %351 RelaxedPrecision 
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
					                         Private f32_2* %28 = OpVariable Private 
					                                    f32 %31 = OpConstant 3,674022E-40 
					                                  f32_2 %32 = OpConstantComposite %31 %31 
					                                    f32 %34 = OpConstant 3,674022E-40 
					                                  f32_2 %35 = OpConstantComposite %34 %34 
					                         Private f32_2* %37 = OpVariable Private 
					                                        %38 = OpTypeInt 32 0 
					                                    u32 %39 = OpConstant 1 
					                                        %40 = OpTypePointer Private %6 
					                                    u32 %44 = OpConstant 0 
					                                    f32 %50 = OpConstant 3,674022E-40 
					                           Private f32* %55 = OpVariable Private 
					                           Private f32* %73 = OpVariable Private 
					                                    f32 %75 = OpConstant 3,674022E-40 
					                                    f32 %77 = OpConstant 3,674022E-40 
					                                    f32 %82 = OpConstant 3,674022E-40 
					                                    f32 %87 = OpConstant 3,674022E-40 
					                                    f32 %92 = OpConstant 3,674022E-40 
					                                    f32 %99 = OpConstant 3,674022E-40 
					                                   f32 %101 = OpConstant 3,674022E-40 
					                                       %103 = OpTypeBool 
					                                       %104 = OpTypePointer Private %103 
					                         Private bool* %105 = OpVariable Private 
					                                   f32 %115 = OpConstant 3,674022E-40 
					                         Private bool* %124 = OpVariable Private 
					                                   f32 %132 = OpConstant 3,674022E-40 
					                         Private bool* %161 = OpVariable Private 
					                          Private f32* %169 = OpVariable Private 
					                                       %171 = OpTypePointer Function %6 
					                                   f32 %183 = OpConstant 3,674022E-40 
					                                   i32 %186 = OpConstant 2 
					                                       %187 = OpTypePointer Uniform %6 
					                                   f32 %205 = OpConstant 3,674022E-40 
					                                   f32 %221 = OpConstant 3,674022E-40 
					                                       %224 = OpTypeVector %6 3 
					                                       %225 = OpTypePointer Private %224 
					                        Private f32_3* %226 = OpVariable Private 
					                                       %227 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                       %228 = OpTypePointer UniformConstant %227 
					  UniformConstant read_only Texture2D* %229 = OpVariable UniformConstant 
					                                       %231 = OpTypeSampler 
					                                       %232 = OpTypePointer UniformConstant %231 
					              UniformConstant sampler* %233 = OpVariable UniformConstant 
					                                       %235 = OpTypeSampledImage %227 
					                                   f32 %243 = OpConstant 3,674022E-40 
					                        Private f32_3* %256 = OpVariable Private 
					                                   f32 %265 = OpConstant 3,674022E-40 
					                                 f32_2 %266 = OpConstantComposite %265 %265 
					                                   i32 %278 = OpConstant 0 
					                        Private f32_3* %284 = OpVariable Private 
					                                   f32 %294 = OpConstant 3,674022E-40 
					                                   i32 %299 = OpConstant 1 
					                                       %345 = OpTypePointer Output %13 
					                         Output f32_4* %346 = OpVariable Output 
					                                   u32 %355 = OpConstant 3 
					                                       %356 = OpTypePointer Output %6 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                         Function f32* %172 = OpVariable Function 
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
					                                  f32_2 %33 = OpFMul %30 %32 
					                                  f32_2 %36 = OpFAdd %33 %35 
					                                                OpStore %28 %36 
					                           Private f32* %41 = OpAccessChain %28 %39 
					                                    f32 %42 = OpLoad %41 
					                                    f32 %43 = OpExtInst %1 4 %42 
					                           Private f32* %45 = OpAccessChain %28 %44 
					                                    f32 %46 = OpLoad %45 
					                                    f32 %47 = OpExtInst %1 4 %46 
					                                    f32 %48 = OpExtInst %1 40 %43 %47 
					                           Private f32* %49 = OpAccessChain %37 %44 
					                                                OpStore %49 %48 
					                           Private f32* %51 = OpAccessChain %37 %44 
					                                    f32 %52 = OpLoad %51 
					                                    f32 %53 = OpFDiv %50 %52 
					                           Private f32* %54 = OpAccessChain %37 %44 
					                                                OpStore %54 %53 
					                           Private f32* %56 = OpAccessChain %28 %39 
					                                    f32 %57 = OpLoad %56 
					                                    f32 %58 = OpExtInst %1 4 %57 
					                           Private f32* %59 = OpAccessChain %28 %44 
					                                    f32 %60 = OpLoad %59 
					                                    f32 %61 = OpExtInst %1 4 %60 
					                                    f32 %62 = OpExtInst %1 37 %58 %61 
					                                                OpStore %55 %62 
					                           Private f32* %63 = OpAccessChain %37 %44 
					                                    f32 %64 = OpLoad %63 
					                                    f32 %65 = OpLoad %55 
					                                    f32 %66 = OpFMul %64 %65 
					                           Private f32* %67 = OpAccessChain %37 %44 
					                                                OpStore %67 %66 
					                           Private f32* %68 = OpAccessChain %37 %44 
					                                    f32 %69 = OpLoad %68 
					                           Private f32* %70 = OpAccessChain %37 %44 
					                                    f32 %71 = OpLoad %70 
					                                    f32 %72 = OpFMul %69 %71 
					                                                OpStore %55 %72 
					                                    f32 %74 = OpLoad %55 
					                                    f32 %76 = OpFMul %74 %75 
					                                    f32 %78 = OpFAdd %76 %77 
					                                                OpStore %73 %78 
					                                    f32 %79 = OpLoad %55 
					                                    f32 %80 = OpLoad %73 
					                                    f32 %81 = OpFMul %79 %80 
					                                    f32 %83 = OpFAdd %81 %82 
					                                                OpStore %73 %83 
					                                    f32 %84 = OpLoad %55 
					                                    f32 %85 = OpLoad %73 
					                                    f32 %86 = OpFMul %84 %85 
					                                    f32 %88 = OpFAdd %86 %87 
					                                                OpStore %73 %88 
					                                    f32 %89 = OpLoad %55 
					                                    f32 %90 = OpLoad %73 
					                                    f32 %91 = OpFMul %89 %90 
					                                    f32 %93 = OpFAdd %91 %92 
					                                                OpStore %55 %93 
					                                    f32 %94 = OpLoad %55 
					                           Private f32* %95 = OpAccessChain %37 %44 
					                                    f32 %96 = OpLoad %95 
					                                    f32 %97 = OpFMul %94 %96 
					                                                OpStore %73 %97 
					                                    f32 %98 = OpLoad %73 
					                                   f32 %100 = OpFMul %98 %99 
					                                   f32 %102 = OpFAdd %100 %101 
					                                                OpStore %73 %102 
					                          Private f32* %106 = OpAccessChain %28 %39 
					                                   f32 %107 = OpLoad %106 
					                                   f32 %108 = OpExtInst %1 4 %107 
					                          Private f32* %109 = OpAccessChain %28 %44 
					                                   f32 %110 = OpLoad %109 
					                                   f32 %111 = OpExtInst %1 4 %110 
					                                  bool %112 = OpFOrdLessThan %108 %111 
					                                                OpStore %105 %112 
					                                  bool %113 = OpLoad %105 
					                                   f32 %114 = OpLoad %73 
					                                   f32 %116 = OpSelect %113 %114 %115 
					                                                OpStore %73 %116 
					                          Private f32* %117 = OpAccessChain %37 %44 
					                                   f32 %118 = OpLoad %117 
					                                   f32 %119 = OpLoad %55 
					                                   f32 %120 = OpFMul %118 %119 
					                                   f32 %121 = OpLoad %73 
					                                   f32 %122 = OpFAdd %120 %121 
					                          Private f32* %123 = OpAccessChain %37 %44 
					                                                OpStore %123 %122 
					                          Private f32* %125 = OpAccessChain %28 %39 
					                                   f32 %126 = OpLoad %125 
					                          Private f32* %127 = OpAccessChain %28 %39 
					                                   f32 %128 = OpLoad %127 
					                                   f32 %129 = OpFNegate %128 
					                                  bool %130 = OpFOrdLessThan %126 %129 
					                                                OpStore %124 %130 
					                                  bool %131 = OpLoad %124 
					                                   f32 %133 = OpSelect %131 %132 %115 
					                                                OpStore %55 %133 
					                                   f32 %134 = OpLoad %55 
					                          Private f32* %135 = OpAccessChain %37 %44 
					                                   f32 %136 = OpLoad %135 
					                                   f32 %137 = OpFAdd %134 %136 
					                          Private f32* %138 = OpAccessChain %37 %44 
					                                                OpStore %138 %137 
					                          Private f32* %139 = OpAccessChain %28 %39 
					                                   f32 %140 = OpLoad %139 
					                          Private f32* %141 = OpAccessChain %28 %44 
					                                   f32 %142 = OpLoad %141 
					                                   f32 %143 = OpExtInst %1 37 %140 %142 
					                                                OpStore %55 %143 
					                                   f32 %144 = OpLoad %55 
					                                   f32 %145 = OpLoad %55 
					                                   f32 %146 = OpFNegate %145 
					                                  bool %147 = OpFOrdLessThan %144 %146 
					                                                OpStore %124 %147 
					                          Private f32* %148 = OpAccessChain %28 %39 
					                                   f32 %149 = OpLoad %148 
					                          Private f32* %150 = OpAccessChain %28 %44 
					                                   f32 %151 = OpLoad %150 
					                                   f32 %152 = OpExtInst %1 40 %149 %151 
					                                                OpStore %73 %152 
					                                 f32_2 %153 = OpLoad %28 
					                                 f32_2 %154 = OpLoad %28 
					                                   f32 %155 = OpDot %153 %154 
					                          Private f32* %156 = OpAccessChain %28 %44 
					                                                OpStore %156 %155 
					                          Private f32* %157 = OpAccessChain %28 %44 
					                                   f32 %158 = OpLoad %157 
					                                   f32 %159 = OpExtInst %1 31 %158 
					                          Private f32* %160 = OpAccessChain %28 %44 
					                                                OpStore %160 %159 
					                                   f32 %162 = OpLoad %73 
					                                   f32 %163 = OpLoad %73 
					                                   f32 %164 = OpFNegate %163 
					                                  bool %165 = OpFOrdGreaterThanEqual %162 %164 
					                                                OpStore %161 %165 
					                                  bool %166 = OpLoad %161 
					                                  bool %167 = OpLoad %124 
					                                  bool %168 = OpLogicalAnd %166 %167 
					                                                OpStore %161 %168 
					                                  bool %170 = OpLoad %161 
					                                                OpSelectionMerge %174 None 
					                                                OpBranchConditional %170 %173 %178 
					                                       %173 = OpLabel 
					                          Private f32* %175 = OpAccessChain %37 %44 
					                                   f32 %176 = OpLoad %175 
					                                   f32 %177 = OpFNegate %176 
					                                                OpStore %172 %177 
					                                                OpBranch %174 
					                                       %178 = OpLabel 
					                          Private f32* %179 = OpAccessChain %37 %44 
					                                   f32 %180 = OpLoad %179 
					                                                OpStore %172 %180 
					                                                OpBranch %174 
					                                       %174 = OpLabel 
					                                   f32 %181 = OpLoad %172 
					                                                OpStore %169 %181 
					                                   f32 %182 = OpLoad %169 
					                                   f32 %184 = OpFMul %182 %183 
					                                                OpStore %169 %184 
					                                   f32 %185 = OpLoad %169 
					                          Uniform f32* %188 = OpAccessChain %16 %186 
					                                   f32 %189 = OpLoad %188 
					                                   f32 %190 = OpFDiv %185 %189 
					                          Private f32* %191 = OpAccessChain %37 %44 
					                                                OpStore %191 %190 
					                          Private f32* %192 = OpAccessChain %37 %44 
					                                   f32 %193 = OpLoad %192 
					                                   f32 %194 = OpExtInst %1 8 %193 
					                          Private f32* %195 = OpAccessChain %37 %44 
					                                                OpStore %195 %194 
					                          Uniform f32* %196 = OpAccessChain %16 %186 
					                                   f32 %197 = OpLoad %196 
					                                   f32 %198 = OpFNegate %197 
					                          Private f32* %199 = OpAccessChain %37 %44 
					                                   f32 %200 = OpLoad %199 
					                                   f32 %201 = OpFMul %198 %200 
					                                   f32 %202 = OpLoad %169 
					                                   f32 %203 = OpFAdd %201 %202 
					                          Private f32* %204 = OpAccessChain %37 %39 
					                                                OpStore %204 %203 
					                          Private f32* %206 = OpAccessChain %28 %44 
					                                   f32 %207 = OpLoad %206 
					                                   f32 %208 = OpFDiv %205 %207 
					                                                OpStore %169 %208 
					                          Private f32* %209 = OpAccessChain %28 %44 
					                                   f32 %210 = OpLoad %209 
					                          Private f32* %211 = OpAccessChain %28 %44 
					                                   f32 %212 = OpLoad %211 
					                                   f32 %213 = OpFAdd %210 %212 
					                          Private f32* %214 = OpAccessChain %28 %44 
					                                                OpStore %214 %213 
					                          Private f32* %215 = OpAccessChain %28 %44 
					                                   f32 %216 = OpLoad %215 
					                                   f32 %217 = OpExtInst %1 37 %216 %50 
					                          Private f32* %218 = OpAccessChain %28 %44 
					                                                OpStore %218 %217 
					                                   f32 %219 = OpLoad %169 
					                                   f32 %220 = OpFNegate %219 
					                                   f32 %222 = OpFAdd %220 %221 
					                          Private f32* %223 = OpAccessChain %37 %44 
					                                                OpStore %223 %222 
					                   read_only Texture2D %230 = OpLoad %229 
					                               sampler %234 = OpLoad %233 
					            read_only Texture2DSampled %236 = OpSampledImage %230 %234 
					                                 f32_2 %237 = OpLoad %37 
					                                 f32_4 %238 = OpImageSampleImplicitLod %236 %237 
					                                 f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
					                                                OpStore %226 %239 
					                          Private f32* %240 = OpAccessChain %28 %44 
					                                   f32 %241 = OpLoad %240 
					                                   f32 %242 = OpFMul %241 %99 
					                                   f32 %244 = OpFAdd %242 %243 
					                                                OpStore %169 %244 
					                          Private f32* %245 = OpAccessChain %28 %44 
					                                   f32 %246 = OpLoad %245 
					                          Private f32* %247 = OpAccessChain %28 %44 
					                                   f32 %248 = OpLoad %247 
					                                   f32 %249 = OpFMul %246 %248 
					                          Private f32* %250 = OpAccessChain %28 %44 
					                                                OpStore %250 %249 
					                          Private f32* %251 = OpAccessChain %28 %44 
					                                   f32 %252 = OpLoad %251 
					                                   f32 %253 = OpLoad %169 
					                                   f32 %254 = OpFMul %252 %253 
					                          Private f32* %255 = OpAccessChain %28 %44 
					                                                OpStore %255 %254 
					                   read_only Texture2D %257 = OpLoad %229 
					                               sampler %258 = OpLoad %233 
					            read_only Texture2DSampled %259 = OpSampledImage %257 %258 
					                                 f32_2 %260 = OpLoad %9 
					                                 f32_4 %261 = OpImageSampleImplicitLod %259 %260 
					                                 f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
					                                                OpStore %256 %262 
					                                 f32_2 %263 = OpLoad %9 
					                                 f32_2 %264 = OpFNegate %263 
					                                 f32_2 %267 = OpFAdd %264 %266 
					                                                OpStore %9 %267 
					                                 f32_2 %268 = OpLoad %9 
					                                 f32_2 %269 = OpLoad %9 
					                                   f32 %270 = OpDot %268 %269 
					                          Private f32* %271 = OpAccessChain %9 %44 
					                                                OpStore %271 %270 
					                          Private f32* %272 = OpAccessChain %9 %44 
					                                   f32 %273 = OpLoad %272 
					                                   f32 %274 = OpExtInst %1 31 %273 
					                          Private f32* %275 = OpAccessChain %9 %44 
					                                                OpStore %275 %274 
					                          Private f32* %276 = OpAccessChain %9 %44 
					                                   f32 %277 = OpLoad %276 
					                          Uniform f32* %279 = OpAccessChain %16 %278 
					                                   f32 %280 = OpLoad %279 
					                                   f32 %281 = OpFNegate %280 
					                                   f32 %282 = OpFAdd %277 %281 
					                          Private f32* %283 = OpAccessChain %9 %44 
					                                                OpStore %283 %282 
					                                 f32_3 %285 = OpLoad %226 
					                                 f32_2 %286 = OpLoad %28 
					                                 f32_3 %287 = OpVectorShuffle %286 %286 0 0 0 
					                                 f32_3 %288 = OpFMul %285 %287 
					                                 f32_3 %289 = OpLoad %256 
					                                 f32_3 %290 = OpFNegate %289 
					                                 f32_3 %291 = OpFAdd %288 %290 
					                                                OpStore %284 %291 
					                          Uniform f32* %292 = OpAccessChain %16 %278 
					                                   f32 %293 = OpLoad %292 
					                                   f32 %295 = OpFAdd %293 %294 
					                          Private f32* %296 = OpAccessChain %37 %44 
					                                                OpStore %296 %295 
					                          Private f32* %297 = OpAccessChain %37 %44 
					                                   f32 %298 = OpLoad %297 
					                          Uniform f32* %300 = OpAccessChain %16 %299 
					                                   f32 %301 = OpLoad %300 
					                                   f32 %302 = OpFNegate %301 
					                                   f32 %303 = OpFAdd %298 %302 
					                          Private f32* %304 = OpAccessChain %37 %44 
					                                                OpStore %304 %303 
					                          Private f32* %305 = OpAccessChain %37 %44 
					                                   f32 %306 = OpLoad %305 
					                          Uniform f32* %307 = OpAccessChain %16 %278 
					                                   f32 %308 = OpLoad %307 
					                                   f32 %309 = OpFNegate %308 
					                                   f32 %310 = OpFAdd %306 %309 
					                          Private f32* %311 = OpAccessChain %37 %44 
					                                                OpStore %311 %310 
					                          Private f32* %312 = OpAccessChain %37 %44 
					                                   f32 %313 = OpLoad %312 
					                                   f32 %314 = OpFDiv %50 %313 
					                          Private f32* %315 = OpAccessChain %37 %44 
					                                                OpStore %315 %314 
					                          Private f32* %316 = OpAccessChain %9 %44 
					                                   f32 %317 = OpLoad %316 
					                          Private f32* %318 = OpAccessChain %37 %44 
					                                   f32 %319 = OpLoad %318 
					                                   f32 %320 = OpFMul %317 %319 
					                          Private f32* %321 = OpAccessChain %9 %44 
					                                                OpStore %321 %320 
					                          Private f32* %322 = OpAccessChain %9 %44 
					                                   f32 %323 = OpLoad %322 
					                                   f32 %324 = OpExtInst %1 43 %323 %115 %50 
					                          Private f32* %325 = OpAccessChain %9 %44 
					                                                OpStore %325 %324 
					                          Private f32* %326 = OpAccessChain %9 %44 
					                                   f32 %327 = OpLoad %326 
					                                   f32 %328 = OpFMul %327 %99 
					                                   f32 %329 = OpFAdd %328 %243 
					                          Private f32* %330 = OpAccessChain %37 %44 
					                                                OpStore %330 %329 
					                          Private f32* %331 = OpAccessChain %9 %44 
					                                   f32 %332 = OpLoad %331 
					                          Private f32* %333 = OpAccessChain %9 %44 
					                                   f32 %334 = OpLoad %333 
					                                   f32 %335 = OpFMul %332 %334 
					                          Private f32* %336 = OpAccessChain %9 %44 
					                                                OpStore %336 %335 
					                          Private f32* %337 = OpAccessChain %37 %44 
					                                   f32 %338 = OpLoad %337 
					                                   f32 %339 = OpFNegate %338 
					                          Private f32* %340 = OpAccessChain %9 %44 
					                                   f32 %341 = OpLoad %340 
					                                   f32 %342 = OpFMul %339 %341 
					                                   f32 %343 = OpFAdd %342 %50 
					                          Private f32* %344 = OpAccessChain %9 %44 
					                                                OpStore %344 %343 
					                                 f32_2 %347 = OpLoad %9 
					                                 f32_3 %348 = OpVectorShuffle %347 %347 0 0 0 
					                                 f32_3 %349 = OpLoad %284 
					                                 f32_3 %350 = OpFMul %348 %349 
					                                 f32_3 %351 = OpLoad %256 
					                                 f32_3 %352 = OpFAdd %350 %351 
					                                 f32_4 %353 = OpLoad %346 
					                                 f32_4 %354 = OpVectorShuffle %353 %352 4 5 6 3 
					                                                OpStore %346 %354 
					                           Output f32* %357 = OpAccessChain %346 %355 
					                                                OpStore %357 %50 
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
						float _Value;
						float _Value2;
						float _Value3;
						vec4 unused_0_4;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					float u_xlat4;
					bool u_xlatb4;
					vec2 u_xlat6;
					float u_xlat7;
					float u_xlat9;
					bool u_xlatb9;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.x = max(abs(u_xlat6.y), abs(u_xlat6.x));
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat4 = min(abs(u_xlat6.y), abs(u_xlat6.x));
					    u_xlat1.x = u_xlat1.x * u_xlat4;
					    u_xlat4 = u_xlat1.x * u_xlat1.x;
					    u_xlat7 = u_xlat4 * 0.0208350997 + -0.0851330012;
					    u_xlat7 = u_xlat4 * u_xlat7 + 0.180141002;
					    u_xlat7 = u_xlat4 * u_xlat7 + -0.330299497;
					    u_xlat4 = u_xlat4 * u_xlat7 + 0.999866009;
					    u_xlat7 = u_xlat4 * u_xlat1.x;
					    u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
					    u_xlatb10 = abs(u_xlat6.y)<abs(u_xlat6.x);
					    u_xlat7 = u_xlatb10 ? u_xlat7 : float(0.0);
					    u_xlat1.x = u_xlat1.x * u_xlat4 + u_xlat7;
					    u_xlatb4 = u_xlat6.y<(-u_xlat6.y);
					    u_xlat4 = u_xlatb4 ? -3.14159274 : float(0.0);
					    u_xlat1.x = u_xlat4 + u_xlat1.x;
					    u_xlat4 = min(u_xlat6.y, u_xlat6.x);
					    u_xlatb4 = u_xlat4<(-u_xlat4);
					    u_xlat7 = max(u_xlat6.y, u_xlat6.x);
					    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					    u_xlat6.x = sqrt(u_xlat6.x);
					    u_xlatb9 = u_xlat7>=(-u_xlat7);
					    u_xlatb9 = u_xlatb9 && u_xlatb4;
					    u_xlat9 = (u_xlatb9) ? (-u_xlat1.x) : u_xlat1.x;
					    u_xlat9 = u_xlat9 * 0.318309158;
					    u_xlat1.x = u_xlat9 / _Value3;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat1.y = (-_Value3) * u_xlat1.x + u_xlat9;
					    u_xlat9 = 0.100000001 / u_xlat6.x;
					    u_xlat6.x = u_xlat6.x + u_xlat6.x;
					    u_xlat6.x = min(u_xlat6.x, 1.0);
					    u_xlat1.x = (-u_xlat9) + 0.800000012;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat9 = u_xlat6.x * -2.0 + 3.0;
					    u_xlat6.x = u_xlat6.x * u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * u_xlat9;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xy = (-u_xlat0.xy) + vec2(0.5, 0.5);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + (-_Value);
					    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat6.xxx + (-u_xlat10_2.xyz);
					    u_xlat1.x = _Value + -0.0500000007;
					    u_xlat1.x = u_xlat1.x + (-_Value2);
					    u_xlat1.x = u_xlat1.x + (-_Value);
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat1.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_2.xyz;
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