Shader "CameraFilterPack/FX_Hypno" {
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
			GpuProgramID 4867
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					vec2 u_xlat8;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.y = u_xlat0.x * 3.0;
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = _TimeX * _Value + u_xlat0.x;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat4 = u_xlat0.y + 2.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5.xy = u_xlat8.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat10_2 = texture(_MainTex, u_xlat8.xy);
					    u_xlat8.xy = u_xlat5.xy * u_xlat5.xy;
					    u_xlat5.xy = u_xlat8.xy * u_xlat0.xx;
					    u_xlat3.xz = u_xlat1.xx * u_xlat8.yy + (-u_xlat5.xx);
					    u_xlat3.y = u_xlat1.x * u_xlat8.x + u_xlat5.y;
					    u_xlat0.xyz = vec3(u_xlat4) * u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat0.zyz * vec3(6.66666651, 6.66666651, 1.66666663);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    u_xlat0.xzw = (-u_xlat1.zxy) * vec3(0.600000024, 0.150000006, 0.150000006) + u_xlat0.zxy;
					    u_xlat1 = u_xlat0.zzww + vec4(-0.0199999996, -0.0599999987, -0.0199999996, -0.0599999987);
					    u_xlat1 = u_xlat1 * vec4(33.3333321, 50.0, 33.3333321, 50.0);
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat3 = u_xlat1 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1.xz = u_xlat1.xz * u_xlat3.xz;
					    u_xlat5.xz = (-u_xlat3.yw) * u_xlat1.yw + vec2(1.0, 1.0);
					    u_xlat1.xy = u_xlat5.xz * u_xlat1.xz;
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat5.x = u_xlat0.y + u_xlat0.y;
					    u_xlat5.x = floor(u_xlat5.x);
					    u_xlat0.z = (-u_xlat5.x) * 0.5 + u_xlat0.y;
					    u_xlat0.w = 1.0;
					    u_xlat0.xyz = u_xlat0.xzw * u_xlat1.xxx;
					    u_xlat1.xy = u_xlat0.xy * vec2(_Value2, _Value3);
					    u_xlat1.z = u_xlat0.z * _Value4;
					    SV_Target0.xyz = abs(u_xlat1.xyz) + u_xlat10_2.xyz;
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
					; Bound: 282
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %64 %271 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpMemberDecorate %10 0 Offset 10 
					                                                      OpMemberDecorate %10 1 Offset 10 
					                                                      OpMemberDecorate %10 2 Offset 10 
					                                                      OpMemberDecorate %10 3 Offset 10 
					                                                      OpMemberDecorate %10 4 Offset 10 
					                                                      OpMemberDecorate %10 5 RelaxedPrecision 
					                                                      OpMemberDecorate %10 5 Offset 10 
					                                                      OpDecorate %10 Block 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate vs_TEXCOORD0 Location 64 
					                                                      OpDecorate %69 RelaxedPrecision 
					                                                      OpDecorate %70 RelaxedPrecision 
					                                                      OpDecorate %73 RelaxedPrecision 
					                                                      OpDecorate %74 RelaxedPrecision 
					                                                      OpDecorate %88 RelaxedPrecision 
					                                                      OpDecorate %91 RelaxedPrecision 
					                                                      OpDecorate %91 DescriptorSet 91 
					                                                      OpDecorate %91 Binding 91 
					                                                      OpDecorate %92 RelaxedPrecision 
					                                                      OpDecorate %95 RelaxedPrecision 
					                                                      OpDecorate %95 DescriptorSet 95 
					                                                      OpDecorate %95 Binding 95 
					                                                      OpDecorate %96 RelaxedPrecision 
					                                                      OpDecorate %101 RelaxedPrecision 
					                                                      OpDecorate %271 Location 271 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeStruct %6 %6 %6 %6 %6 %7 
					                                              %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                              %13 = OpTypeInt 32 1 
					                                          i32 %14 = OpConstant 1 
					                                              %15 = OpTypePointer Uniform %6 
					                                          i32 %18 = OpConstant 0 
					                                              %22 = OpTypeInt 32 0 
					                                          u32 %23 = OpConstant 0 
					                                              %24 = OpTypePointer Private %6 
					                                          f32 %28 = OpConstant 3,674022E-40 
					                                          u32 %30 = OpConstant 1 
					                                              %32 = OpTypeVector %6 2 
					                               Private f32_4* %47 = OpVariable Private 
					                                 Private f32* %56 = OpVariable Private 
					                                          f32 %59 = OpConstant 3,674022E-40 
					                                              %61 = OpTypePointer Private %32 
					                               Private f32_2* %62 = OpVariable Private 
					                                              %63 = OpTypePointer Input %32 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                          i32 %66 = OpConstant 5 
					                                              %67 = OpTypePointer Uniform %7 
					                                              %76 = OpTypeVector %6 3 
					                                              %77 = OpTypePointer Private %76 
					                               Private f32_3* %78 = OpVariable Private 
					                                        f32_2 %81 = OpConstantComposite %59 %59 
					                                          f32 %83 = OpConstant 3,674022E-40 
					                                        f32_2 %84 = OpConstantComposite %83 %83 
					                               Private f32_3* %88 = OpVariable Private 
					                                              %89 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %90 = OpTypePointer UniformConstant %89 
					         UniformConstant read_only Texture2D* %91 = OpVariable UniformConstant 
					                                              %93 = OpTypeSampler 
					                                              %94 = OpTypePointer UniformConstant %93 
					                     UniformConstant sampler* %95 = OpVariable UniformConstant 
					                                              %97 = OpTypeSampledImage %89 
					                              Private f32_4* %113 = OpVariable Private 
					                                         f32 %143 = OpConstant 3,674022E-40 
					                                         f32 %144 = OpConstant 3,674022E-40 
					                                       f32_3 %145 = OpConstantComposite %143 %143 %144 
					                                         f32 %157 = OpConstant 3,674022E-40 
					                                         f32 %158 = OpConstant 3,674022E-40 
					                                       f32_3 %159 = OpConstantComposite %157 %158 %158 
					                                         f32 %168 = OpConstant 3,674022E-40 
					                                         f32 %169 = OpConstant 3,674022E-40 
					                                       f32_4 %170 = OpConstantComposite %168 %169 %168 %169 
					                                         f32 %173 = OpConstant 3,674022E-40 
					                                         f32 %174 = OpConstant 3,674022E-40 
					                                       f32_4 %175 = OpConstantComposite %173 %174 %173 %174 
					                                         f32 %178 = OpConstant 3,674022E-40 
					                                         f32 %179 = OpConstant 3,674022E-40 
					                                         f32 %184 = OpConstant 3,674022E-40 
					                                       f32_4 %185 = OpConstantComposite %184 %184 %184 %184 
					                                       f32_4 %187 = OpConstantComposite %28 %28 %28 %28 
					                                       f32_2 %205 = OpConstantComposite %179 %179 
					                                         f32 %235 = OpConstant 3,674022E-40 
					                                         u32 %240 = OpConstant 2 
					                                         u32 %242 = OpConstant 3 
					                                         i32 %253 = OpConstant 2 
					                                         i32 %256 = OpConstant 3 
					                                         i32 %265 = OpConstant 4 
					                                             %270 = OpTypePointer Output %7 
					                               Output f32_4* %271 = OpVariable Output 
					                                             %279 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                 Uniform f32* %16 = OpAccessChain %12 %14 
					                                          f32 %17 = OpLoad %16 
					                                 Uniform f32* %19 = OpAccessChain %12 %18 
					                                          f32 %20 = OpLoad %19 
					                                          f32 %21 = OpFMul %17 %20 
					                                 Private f32* %25 = OpAccessChain %9 %23 
					                                                      OpStore %25 %21 
					                                 Private f32* %26 = OpAccessChain %9 %23 
					                                          f32 %27 = OpLoad %26 
					                                          f32 %29 = OpFMul %27 %28 
					                                 Private f32* %31 = OpAccessChain %9 %30 
					                                                      OpStore %31 %29 
					                                        f32_4 %33 = OpLoad %9 
					                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                        f32_2 %35 = OpExtInst %1 13 %34 
					                                        f32_4 %36 = OpLoad %9 
					                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
					                                                      OpStore %9 %37 
					                                 Uniform f32* %38 = OpAccessChain %12 %18 
					                                          f32 %39 = OpLoad %38 
					                                 Uniform f32* %40 = OpAccessChain %12 %14 
					                                          f32 %41 = OpLoad %40 
					                                          f32 %42 = OpFMul %39 %41 
					                                 Private f32* %43 = OpAccessChain %9 %23 
					                                          f32 %44 = OpLoad %43 
					                                          f32 %45 = OpFAdd %42 %44 
					                                 Private f32* %46 = OpAccessChain %9 %23 
					                                                      OpStore %46 %45 
					                                 Private f32* %48 = OpAccessChain %9 %23 
					                                          f32 %49 = OpLoad %48 
					                                          f32 %50 = OpExtInst %1 14 %49 
					                                 Private f32* %51 = OpAccessChain %47 %23 
					                                                      OpStore %51 %50 
					                                 Private f32* %52 = OpAccessChain %9 %23 
					                                          f32 %53 = OpLoad %52 
					                                          f32 %54 = OpExtInst %1 13 %53 
					                                 Private f32* %55 = OpAccessChain %9 %23 
					                                                      OpStore %55 %54 
					                                 Private f32* %57 = OpAccessChain %9 %30 
					                                          f32 %58 = OpLoad %57 
					                                          f32 %60 = OpFAdd %58 %59 
					                                                      OpStore %56 %60 
					                                        f32_2 %65 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %68 = OpAccessChain %12 %66 
					                                        f32_4 %69 = OpLoad %68 
					                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
					                                        f32_2 %71 = OpFMul %65 %70 
					                               Uniform f32_4* %72 = OpAccessChain %12 %66 
					                                        f32_4 %73 = OpLoad %72 
					                                        f32_2 %74 = OpVectorShuffle %73 %73 2 3 
					                                        f32_2 %75 = OpFAdd %71 %74 
					                                                      OpStore %62 %75 
					                                        f32_2 %79 = OpLoad %62 
					                                        f32_2 %80 = OpVectorShuffle %79 %79 1 0 
					                                        f32_2 %82 = OpFMul %80 %81 
					                                        f32_2 %85 = OpFAdd %82 %84 
					                                        f32_3 %86 = OpLoad %78 
					                                        f32_3 %87 = OpVectorShuffle %86 %85 3 4 2 
					                                                      OpStore %78 %87 
					                          read_only Texture2D %92 = OpLoad %91 
					                                      sampler %96 = OpLoad %95 
					                   read_only Texture2DSampled %98 = OpSampledImage %92 %96 
					                                        f32_2 %99 = OpLoad %62 
					                                       f32_4 %100 = OpImageSampleImplicitLod %98 %99 
					                                       f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
					                                                      OpStore %88 %101 
					                                       f32_3 %102 = OpLoad %78 
					                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
					                                       f32_3 %104 = OpLoad %78 
					                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
					                                       f32_2 %106 = OpFMul %103 %105 
					                                                      OpStore %62 %106 
					                                       f32_2 %107 = OpLoad %62 
					                                       f32_4 %108 = OpLoad %9 
					                                       f32_2 %109 = OpVectorShuffle %108 %108 0 0 
					                                       f32_2 %110 = OpFMul %107 %109 
					                                       f32_3 %111 = OpLoad %78 
					                                       f32_3 %112 = OpVectorShuffle %111 %110 3 4 2 
					                                                      OpStore %78 %112 
					                                       f32_4 %114 = OpLoad %47 
					                                       f32_2 %115 = OpVectorShuffle %114 %114 0 0 
					                                       f32_2 %116 = OpLoad %62 
					                                       f32_2 %117 = OpVectorShuffle %116 %116 1 1 
					                                       f32_2 %118 = OpFMul %115 %117 
					                                       f32_3 %119 = OpLoad %78 
					                                       f32_2 %120 = OpVectorShuffle %119 %119 0 0 
					                                       f32_2 %121 = OpFNegate %120 
					                                       f32_2 %122 = OpFAdd %118 %121 
					                                       f32_4 %123 = OpLoad %113 
					                                       f32_4 %124 = OpVectorShuffle %123 %122 4 1 5 3 
					                                                      OpStore %113 %124 
					                                Private f32* %125 = OpAccessChain %47 %23 
					                                         f32 %126 = OpLoad %125 
					                                Private f32* %127 = OpAccessChain %62 %23 
					                                         f32 %128 = OpLoad %127 
					                                         f32 %129 = OpFMul %126 %128 
					                                Private f32* %130 = OpAccessChain %78 %30 
					                                         f32 %131 = OpLoad %130 
					                                         f32 %132 = OpFAdd %129 %131 
					                                Private f32* %133 = OpAccessChain %113 %30 
					                                                      OpStore %133 %132 
					                                         f32 %134 = OpLoad %56 
					                                       f32_3 %135 = OpCompositeConstruct %134 %134 %134 
					                                       f32_4 %136 = OpLoad %113 
					                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
					                                       f32_3 %138 = OpFMul %135 %137 
					                                       f32_4 %139 = OpLoad %9 
					                                       f32_4 %140 = OpVectorShuffle %139 %138 4 5 6 3 
					                                                      OpStore %9 %140 
					                                       f32_4 %141 = OpLoad %9 
					                                       f32_3 %142 = OpVectorShuffle %141 %141 2 1 2 
					                                       f32_3 %146 = OpFMul %142 %145 
					                                       f32_4 %147 = OpLoad %47 
					                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
					                                                      OpStore %47 %148 
					                                       f32_4 %149 = OpLoad %47 
					                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
					                                       f32_3 %151 = OpExtInst %1 8 %150 
					                                       f32_4 %152 = OpLoad %47 
					                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
					                                                      OpStore %47 %153 
					                                       f32_4 %154 = OpLoad %47 
					                                       f32_3 %155 = OpVectorShuffle %154 %154 2 0 1 
					                                       f32_3 %156 = OpFNegate %155 
					                                       f32_3 %160 = OpFMul %156 %159 
					                                       f32_4 %161 = OpLoad %9 
					                                       f32_3 %162 = OpVectorShuffle %161 %161 2 0 1 
					                                       f32_3 %163 = OpFAdd %160 %162 
					                                       f32_4 %164 = OpLoad %9 
					                                       f32_4 %165 = OpVectorShuffle %164 %163 4 1 5 6 
					                                                      OpStore %9 %165 
					                                       f32_4 %166 = OpLoad %9 
					                                       f32_4 %167 = OpVectorShuffle %166 %166 2 2 3 3 
					                                       f32_4 %171 = OpFAdd %167 %170 
					                                                      OpStore %47 %171 
					                                       f32_4 %172 = OpLoad %47 
					                                       f32_4 %176 = OpFMul %172 %175 
					                                                      OpStore %47 %176 
					                                       f32_4 %177 = OpLoad %47 
					                                       f32_4 %180 = OpCompositeConstruct %178 %178 %178 %178 
					                                       f32_4 %181 = OpCompositeConstruct %179 %179 %179 %179 
					                                       f32_4 %182 = OpExtInst %1 43 %177 %180 %181 
					                                                      OpStore %47 %182 
					                                       f32_4 %183 = OpLoad %47 
					                                       f32_4 %186 = OpFMul %183 %185 
					                                       f32_4 %188 = OpFAdd %186 %187 
					                                                      OpStore %113 %188 
					                                       f32_4 %189 = OpLoad %47 
					                                       f32_4 %190 = OpLoad %47 
					                                       f32_4 %191 = OpFMul %189 %190 
					                                                      OpStore %47 %191 
					                                       f32_4 %192 = OpLoad %47 
					                                       f32_2 %193 = OpVectorShuffle %192 %192 0 2 
					                                       f32_4 %194 = OpLoad %113 
					                                       f32_2 %195 = OpVectorShuffle %194 %194 0 2 
					                                       f32_2 %196 = OpFMul %193 %195 
					                                       f32_4 %197 = OpLoad %47 
					                                       f32_4 %198 = OpVectorShuffle %197 %196 4 1 5 3 
					                                                      OpStore %47 %198 
					                                       f32_4 %199 = OpLoad %113 
					                                       f32_2 %200 = OpVectorShuffle %199 %199 1 3 
					                                       f32_2 %201 = OpFNegate %200 
					                                       f32_4 %202 = OpLoad %47 
					                                       f32_2 %203 = OpVectorShuffle %202 %202 1 3 
					                                       f32_2 %204 = OpFMul %201 %203 
					                                       f32_2 %206 = OpFAdd %204 %205 
					                                       f32_3 %207 = OpLoad %78 
					                                       f32_3 %208 = OpVectorShuffle %207 %206 3 1 4 
					                                                      OpStore %78 %208 
					                                       f32_3 %209 = OpLoad %78 
					                                       f32_2 %210 = OpVectorShuffle %209 %209 0 2 
					                                       f32_4 %211 = OpLoad %47 
					                                       f32_2 %212 = OpVectorShuffle %211 %211 0 2 
					                                       f32_2 %213 = OpFMul %210 %212 
					                                       f32_4 %214 = OpLoad %47 
					                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 2 3 
					                                                      OpStore %47 %215 
					                                Private f32* %216 = OpAccessChain %47 %30 
					                                         f32 %217 = OpLoad %216 
					                                Private f32* %218 = OpAccessChain %47 %23 
					                                         f32 %219 = OpLoad %218 
					                                         f32 %220 = OpFAdd %217 %219 
					                                Private f32* %221 = OpAccessChain %47 %23 
					                                                      OpStore %221 %220 
					                                Private f32* %222 = OpAccessChain %9 %30 
					                                         f32 %223 = OpLoad %222 
					                                Private f32* %224 = OpAccessChain %9 %30 
					                                         f32 %225 = OpLoad %224 
					                                         f32 %226 = OpFAdd %223 %225 
					                                Private f32* %227 = OpAccessChain %78 %23 
					                                                      OpStore %227 %226 
					                                Private f32* %228 = OpAccessChain %78 %23 
					                                         f32 %229 = OpLoad %228 
					                                         f32 %230 = OpExtInst %1 8 %229 
					                                Private f32* %231 = OpAccessChain %78 %23 
					                                                      OpStore %231 %230 
					                                Private f32* %232 = OpAccessChain %78 %23 
					                                         f32 %233 = OpLoad %232 
					                                         f32 %234 = OpFNegate %233 
					                                         f32 %236 = OpFMul %234 %235 
					                                Private f32* %237 = OpAccessChain %9 %30 
					                                         f32 %238 = OpLoad %237 
					                                         f32 %239 = OpFAdd %236 %238 
					                                Private f32* %241 = OpAccessChain %9 %240 
					                                                      OpStore %241 %239 
					                                Private f32* %243 = OpAccessChain %9 %242 
					                                                      OpStore %243 %179 
					                                       f32_4 %244 = OpLoad %9 
					                                       f32_3 %245 = OpVectorShuffle %244 %244 0 2 3 
					                                       f32_4 %246 = OpLoad %47 
					                                       f32_3 %247 = OpVectorShuffle %246 %246 0 0 0 
					                                       f32_3 %248 = OpFMul %245 %247 
					                                       f32_4 %249 = OpLoad %9 
					                                       f32_4 %250 = OpVectorShuffle %249 %248 4 5 6 3 
					                                                      OpStore %9 %250 
					                                       f32_4 %251 = OpLoad %9 
					                                       f32_2 %252 = OpVectorShuffle %251 %251 0 1 
					                                Uniform f32* %254 = OpAccessChain %12 %253 
					                                         f32 %255 = OpLoad %254 
					                                Uniform f32* %257 = OpAccessChain %12 %256 
					                                         f32 %258 = OpLoad %257 
					                                       f32_2 %259 = OpCompositeConstruct %255 %258 
					                                       f32_2 %260 = OpFMul %252 %259 
					                                       f32_4 %261 = OpLoad %47 
					                                       f32_4 %262 = OpVectorShuffle %261 %260 4 5 2 3 
					                                                      OpStore %47 %262 
					                                Private f32* %263 = OpAccessChain %9 %240 
					                                         f32 %264 = OpLoad %263 
					                                Uniform f32* %266 = OpAccessChain %12 %265 
					                                         f32 %267 = OpLoad %266 
					                                         f32 %268 = OpFMul %264 %267 
					                                Private f32* %269 = OpAccessChain %47 %240 
					                                                      OpStore %269 %268 
					                                       f32_4 %272 = OpLoad %47 
					                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
					                                       f32_3 %274 = OpExtInst %1 4 %273 
					                                       f32_3 %275 = OpLoad %88 
					                                       f32_3 %276 = OpFAdd %274 %275 
					                                       f32_4 %277 = OpLoad %271 
					                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 6 3 
					                                                      OpStore %271 %278 
					                                 Output f32* %280 = OpAccessChain %271 %242 
					                                                      OpStore %280 %179 
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
						vec4 unused_0_6;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					vec2 u_xlat8;
					void main()
					{
					    u_xlat0.x = _Value * _TimeX;
					    u_xlat0.y = u_xlat0.x * 3.0;
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = _TimeX * _Value + u_xlat0.x;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat4 = u_xlat0.y + 2.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat5.xy = u_xlat8.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat10_2 = texture(_MainTex, u_xlat8.xy);
					    u_xlat8.xy = u_xlat5.xy * u_xlat5.xy;
					    u_xlat5.xy = u_xlat8.xy * u_xlat0.xx;
					    u_xlat3.xz = u_xlat1.xx * u_xlat8.yy + (-u_xlat5.xx);
					    u_xlat3.y = u_xlat1.x * u_xlat8.x + u_xlat5.y;
					    u_xlat0.xyz = vec3(u_xlat4) * u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat0.zyz * vec3(6.66666651, 6.66666651, 1.66666663);
					    u_xlat1.xyz = floor(u_xlat1.xyz);
					    u_xlat0.xzw = (-u_xlat1.zxy) * vec3(0.600000024, 0.150000006, 0.150000006) + u_xlat0.zxy;
					    u_xlat1 = u_xlat0.zzww + vec4(-0.0199999996, -0.0599999987, -0.0199999996, -0.0599999987);
					    u_xlat1 = u_xlat1 * vec4(33.3333321, 50.0, 33.3333321, 50.0);
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat3 = u_xlat1 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat1 = u_xlat1 * u_xlat1;
					    u_xlat1.xz = u_xlat1.xz * u_xlat3.xz;
					    u_xlat5.xz = (-u_xlat3.yw) * u_xlat1.yw + vec2(1.0, 1.0);
					    u_xlat1.xy = u_xlat5.xz * u_xlat1.xz;
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat5.x = u_xlat0.y + u_xlat0.y;
					    u_xlat5.x = floor(u_xlat5.x);
					    u_xlat0.z = (-u_xlat5.x) * 0.5 + u_xlat0.y;
					    u_xlat0.w = 1.0;
					    u_xlat0.xyz = u_xlat0.xzw * u_xlat1.xxx;
					    u_xlat1.xy = u_xlat0.xy * vec2(_Value2, _Value3);
					    u_xlat1.z = u_xlat0.z * _Value4;
					    SV_Target0.xyz = abs(u_xlat1.xyz) + u_xlat10_2.xyz;
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