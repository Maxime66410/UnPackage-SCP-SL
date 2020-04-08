Shader "CameraFilterPack/FX_Hexagon" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 38759
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					float u_xlat3;
					float u_xlat6;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6 = u_xlat0.x * 36.0828476;
					    u_xlat1.xz = floor(vec2(u_xlat6));
					    u_xlat6 = u_xlat1.z * 0.5;
					    u_xlatb9 = u_xlat6>=(-u_xlat6);
					    u_xlat6 = fract(abs(u_xlat6));
					    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
					    u_xlat3 = (-u_xlat6) * 0.0320000015 + u_xlat0.y;
					    u_xlat0.x = (-u_xlat1.z) * 0.0277139992 + u_xlat0.x;
					    u_xlat6 = u_xlat3 * 31.25;
					    u_xlat1.y = floor(u_xlat6);
					    u_xlat2.xz = u_xlat1.zz + vec2(-1.0, -1.0);
					    u_xlat6 = u_xlat2.z * 0.5;
					    u_xlatb9 = u_xlat6>=(-u_xlat6);
					    u_xlat6 = fract(abs(u_xlat6));
					    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
					    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat1.y;
					    u_xlat3 = (-u_xlat1.y) * 0.0320000015 + u_xlat3;
					    u_xlatb9 = 0.0160000008<u_xlat3;
					    u_xlat3 = (-u_xlat3) * 31.2499981 + 0.5;
					    u_xlat3 = abs(u_xlat3) * 0.0184760932;
					    u_xlatb0 = u_xlat3<u_xlat0.x;
					    u_xlat3 = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat2.y = u_xlat3 + u_xlat6;
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0277128126, 0.0320000015, 0.5);
					    u_xlatb1 = u_xlat0.z>=(-u_xlat0.z);
					    u_xlat6 = fract(abs(u_xlat0.z));
					    u_xlat6 = (u_xlatb1) ? u_xlat6 : (-u_xlat6);
					    u_xlat0.w = u_xlat6 * 0.0320000015 + u_xlat0.y;
					    SV_Target0 = texture(_MainTex, u_xlat0.xw);
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
					; Bound: 221
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %12 %206 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 12 
					                                              OpMemberDecorate %14 0 RelaxedPrecision 
					                                              OpMemberDecorate %14 0 Offset 14 
					                                              OpDecorate %14 Block 
					                                              OpDecorate %16 DescriptorSet 16 
					                                              OpDecorate %16 Binding 16 
					                                              OpDecorate %21 RelaxedPrecision 
					                                              OpDecorate %22 RelaxedPrecision 
					                                              OpDecorate %25 RelaxedPrecision 
					                                              OpDecorate %26 RelaxedPrecision 
					                                              OpDecorate %206 Location 206 
					                                              OpDecorate %209 RelaxedPrecision 
					                                              OpDecorate %209 DescriptorSet 209 
					                                              OpDecorate %209 Binding 209 
					                                              OpDecorate %210 RelaxedPrecision 
					                                              OpDecorate %213 RelaxedPrecision 
					                                              OpDecorate %213 DescriptorSet 213 
					                                              OpDecorate %213 Binding 213 
					                                              OpDecorate %214 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 2 
					                                      %11 = OpTypePointer Input %10 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %14 = OpTypeStruct %7 
					                                      %15 = OpTypePointer Uniform %14 
					             Uniform struct {f32_4;}* %16 = OpVariable Uniform 
					                                      %17 = OpTypeInt 32 1 
					                                  i32 %18 = OpConstant 0 
					                                      %19 = OpTypePointer Uniform %7 
					                                      %30 = OpTypePointer Private %6 
					                         Private f32* %31 = OpVariable Private 
					                                      %32 = OpTypeInt 32 0 
					                                  u32 %33 = OpConstant 0 
					                                  f32 %36 = OpConstant 3,674022E-40 
					                                      %38 = OpTypeVector %6 3 
					                                      %39 = OpTypePointer Private %38 
					                       Private f32_3* %40 = OpVariable Private 
					                                  u32 %46 = OpConstant 2 
					                                  f32 %49 = OpConstant 3,674022E-40 
					                                      %51 = OpTypeBool 
					                                      %52 = OpTypePointer Private %51 
					                        Private bool* %53 = OpVariable Private 
					                                      %62 = OpTypePointer Function %6 
					                         Private f32* %71 = OpVariable Private 
					                                  f32 %74 = OpConstant 3,674022E-40 
					                                  u32 %76 = OpConstant 1 
					                                  f32 %83 = OpConstant 3,674022E-40 
					                                  f32 %90 = OpConstant 3,674022E-40 
					                       Private f32_3* %95 = OpVariable Private 
					                                  f32 %98 = OpConstant 3,674022E-40 
					                                f32_2 %99 = OpConstantComposite %98 %98 
					                                 f32 %124 = OpConstant 3,674022E-40 
					                                 f32 %135 = OpConstant 3,674022E-40 
					                                 f32 %140 = OpConstant 3,674022E-40 
					                                 f32 %145 = OpConstant 3,674022E-40 
					                       Private bool* %147 = OpVariable Private 
					                                 f32 %153 = OpConstant 3,674022E-40 
					                                 f32 %154 = OpConstant 3,674022E-40 
					                                     %161 = OpTypePointer Function %38 
					                                 f32 %173 = OpConstant 3,674022E-40 
					                               f32_3 %174 = OpConstantComposite %173 %74 %49 
					                       Private bool* %178 = OpVariable Private 
					                                 u32 %203 = OpConstant 3 
					                                     %205 = OpTypePointer Output %7 
					                       Output f32_4* %206 = OpVariable Output 
					                                     %207 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %208 = OpTypePointer UniformConstant %207 
					UniformConstant read_only Texture2D* %209 = OpVariable UniformConstant 
					                                     %211 = OpTypeSampler 
					                                     %212 = OpTypePointer UniformConstant %211 
					            UniformConstant sampler* %213 = OpVariable UniformConstant 
					                                     %215 = OpTypeSampledImage %207 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function f32* %63 = OpVariable Function 
					                       Function f32* %114 = OpVariable Function 
					                     Function f32_3* %162 = OpVariable Function 
					                       Function f32* %190 = OpVariable Function 
					                                f32_2 %13 = OpLoad vs_TEXCOORD0 
					                       Uniform f32_4* %20 = OpAccessChain %16 %18 
					                                f32_4 %21 = OpLoad %20 
					                                f32_2 %22 = OpVectorShuffle %21 %21 0 1 
					                                f32_2 %23 = OpFMul %13 %22 
					                       Uniform f32_4* %24 = OpAccessChain %16 %18 
					                                f32_4 %25 = OpLoad %24 
					                                f32_2 %26 = OpVectorShuffle %25 %25 2 3 
					                                f32_2 %27 = OpFAdd %23 %26 
					                                f32_4 %28 = OpLoad %9 
					                                f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
					                                              OpStore %9 %29 
					                         Private f32* %34 = OpAccessChain %9 %33 
					                                  f32 %35 = OpLoad %34 
					                                  f32 %37 = OpFMul %35 %36 
					                                              OpStore %31 %37 
					                                  f32 %41 = OpLoad %31 
					                                f32_2 %42 = OpCompositeConstruct %41 %41 
					                                f32_2 %43 = OpExtInst %1 8 %42 
					                                f32_3 %44 = OpLoad %40 
					                                f32_3 %45 = OpVectorShuffle %44 %43 3 1 4 
					                                              OpStore %40 %45 
					                         Private f32* %47 = OpAccessChain %40 %46 
					                                  f32 %48 = OpLoad %47 
					                                  f32 %50 = OpFMul %48 %49 
					                                              OpStore %31 %50 
					                                  f32 %54 = OpLoad %31 
					                                  f32 %55 = OpLoad %31 
					                                  f32 %56 = OpFNegate %55 
					                                 bool %57 = OpFOrdGreaterThanEqual %54 %56 
					                                              OpStore %53 %57 
					                                  f32 %58 = OpLoad %31 
					                                  f32 %59 = OpExtInst %1 4 %58 
					                                  f32 %60 = OpExtInst %1 10 %59 
					                                              OpStore %31 %60 
					                                 bool %61 = OpLoad %53 
					                                              OpSelectionMerge %65 None 
					                                              OpBranchConditional %61 %64 %67 
					                                      %64 = OpLabel 
					                                  f32 %66 = OpLoad %31 
					                                              OpStore %63 %66 
					                                              OpBranch %65 
					                                      %67 = OpLabel 
					                                  f32 %68 = OpLoad %31 
					                                  f32 %69 = OpFNegate %68 
					                                              OpStore %63 %69 
					                                              OpBranch %65 
					                                      %65 = OpLabel 
					                                  f32 %70 = OpLoad %63 
					                                              OpStore %31 %70 
					                                  f32 %72 = OpLoad %31 
					                                  f32 %73 = OpFNegate %72 
					                                  f32 %75 = OpFMul %73 %74 
					                         Private f32* %77 = OpAccessChain %9 %76 
					                                  f32 %78 = OpLoad %77 
					                                  f32 %79 = OpFAdd %75 %78 
					                                              OpStore %71 %79 
					                         Private f32* %80 = OpAccessChain %40 %46 
					                                  f32 %81 = OpLoad %80 
					                                  f32 %82 = OpFNegate %81 
					                                  f32 %84 = OpFMul %82 %83 
					                         Private f32* %85 = OpAccessChain %9 %33 
					                                  f32 %86 = OpLoad %85 
					                                  f32 %87 = OpFAdd %84 %86 
					                         Private f32* %88 = OpAccessChain %9 %33 
					                                              OpStore %88 %87 
					                                  f32 %89 = OpLoad %71 
					                                  f32 %91 = OpFMul %89 %90 
					                                              OpStore %31 %91 
					                                  f32 %92 = OpLoad %31 
					                                  f32 %93 = OpExtInst %1 8 %92 
					                         Private f32* %94 = OpAccessChain %40 %76 
					                                              OpStore %94 %93 
					                                f32_3 %96 = OpLoad %40 
					                                f32_2 %97 = OpVectorShuffle %96 %96 2 2 
					                               f32_2 %100 = OpFAdd %97 %99 
					                               f32_3 %101 = OpLoad %95 
					                               f32_3 %102 = OpVectorShuffle %101 %100 3 1 4 
					                                              OpStore %95 %102 
					                        Private f32* %103 = OpAccessChain %95 %46 
					                                 f32 %104 = OpLoad %103 
					                                 f32 %105 = OpFMul %104 %49 
					                                              OpStore %31 %105 
					                                 f32 %106 = OpLoad %31 
					                                 f32 %107 = OpLoad %31 
					                                 f32 %108 = OpFNegate %107 
					                                bool %109 = OpFOrdGreaterThanEqual %106 %108 
					                                              OpStore %53 %109 
					                                 f32 %110 = OpLoad %31 
					                                 f32 %111 = OpExtInst %1 4 %110 
					                                 f32 %112 = OpExtInst %1 10 %111 
					                                              OpStore %31 %112 
					                                bool %113 = OpLoad %53 
					                                              OpSelectionMerge %116 None 
					                                              OpBranchConditional %113 %115 %118 
					                                     %115 = OpLabel 
					                                 f32 %117 = OpLoad %31 
					                                              OpStore %114 %117 
					                                              OpBranch %116 
					                                     %118 = OpLabel 
					                                 f32 %119 = OpLoad %31 
					                                 f32 %120 = OpFNegate %119 
					                                              OpStore %114 %120 
					                                              OpBranch %116 
					                                     %116 = OpLabel 
					                                 f32 %121 = OpLoad %114 
					                                              OpStore %31 %121 
					                                 f32 %122 = OpLoad %31 
					                                 f32 %123 = OpFNegate %122 
					                                 f32 %125 = OpFMul %123 %124 
					                        Private f32* %126 = OpAccessChain %40 %76 
					                                 f32 %127 = OpLoad %126 
					                                 f32 %128 = OpFAdd %125 %127 
					                                              OpStore %31 %128 
					                        Private f32* %129 = OpAccessChain %40 %76 
					                                 f32 %130 = OpLoad %129 
					                                 f32 %131 = OpFNegate %130 
					                                 f32 %132 = OpFMul %131 %74 
					                                 f32 %133 = OpLoad %71 
					                                 f32 %134 = OpFAdd %132 %133 
					                                              OpStore %71 %134 
					                                 f32 %136 = OpLoad %71 
					                                bool %137 = OpFOrdLessThan %135 %136 
					                                              OpStore %53 %137 
					                                 f32 %138 = OpLoad %71 
					                                 f32 %139 = OpFNegate %138 
					                                 f32 %141 = OpFMul %139 %140 
					                                 f32 %142 = OpFAdd %141 %49 
					                                              OpStore %71 %142 
					                                 f32 %143 = OpLoad %71 
					                                 f32 %144 = OpExtInst %1 4 %143 
					                                 f32 %146 = OpFMul %144 %145 
					                                              OpStore %71 %146 
					                                 f32 %148 = OpLoad %71 
					                        Private f32* %149 = OpAccessChain %9 %33 
					                                 f32 %150 = OpLoad %149 
					                                bool %151 = OpFOrdLessThan %148 %150 
					                                              OpStore %147 %151 
					                                bool %152 = OpLoad %53 
					                                 f32 %155 = OpSelect %152 %153 %154 
					                                              OpStore %71 %155 
					                                 f32 %156 = OpLoad %71 
					                                 f32 %157 = OpLoad %31 
					                                 f32 %158 = OpFAdd %156 %157 
					                        Private f32* %159 = OpAccessChain %95 %76 
					                                              OpStore %159 %158 
					                                bool %160 = OpLoad %147 
					                                              OpSelectionMerge %164 None 
					                                              OpBranchConditional %160 %163 %166 
					                                     %163 = OpLabel 
					                               f32_3 %165 = OpLoad %40 
					                                              OpStore %162 %165 
					                                              OpBranch %164 
					                                     %166 = OpLabel 
					                               f32_3 %167 = OpLoad %95 
					                                              OpStore %162 %167 
					                                              OpBranch %164 
					                                     %164 = OpLabel 
					                               f32_3 %168 = OpLoad %162 
					                               f32_4 %169 = OpLoad %9 
					                               f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
					                                              OpStore %9 %170 
					                               f32_4 %171 = OpLoad %9 
					                               f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
					                               f32_3 %175 = OpFMul %172 %174 
					                               f32_4 %176 = OpLoad %9 
					                               f32_4 %177 = OpVectorShuffle %176 %175 4 5 6 3 
					                                              OpStore %9 %177 
					                        Private f32* %179 = OpAccessChain %9 %46 
					                                 f32 %180 = OpLoad %179 
					                        Private f32* %181 = OpAccessChain %9 %46 
					                                 f32 %182 = OpLoad %181 
					                                 f32 %183 = OpFNegate %182 
					                                bool %184 = OpFOrdGreaterThanEqual %180 %183 
					                                              OpStore %178 %184 
					                        Private f32* %185 = OpAccessChain %9 %46 
					                                 f32 %186 = OpLoad %185 
					                                 f32 %187 = OpExtInst %1 4 %186 
					                                 f32 %188 = OpExtInst %1 10 %187 
					                                              OpStore %31 %188 
					                                bool %189 = OpLoad %178 
					                                              OpSelectionMerge %192 None 
					                                              OpBranchConditional %189 %191 %194 
					                                     %191 = OpLabel 
					                                 f32 %193 = OpLoad %31 
					                                              OpStore %190 %193 
					                                              OpBranch %192 
					                                     %194 = OpLabel 
					                                 f32 %195 = OpLoad %31 
					                                 f32 %196 = OpFNegate %195 
					                                              OpStore %190 %196 
					                                              OpBranch %192 
					                                     %192 = OpLabel 
					                                 f32 %197 = OpLoad %190 
					                                              OpStore %31 %197 
					                                 f32 %198 = OpLoad %31 
					                                 f32 %199 = OpFMul %198 %74 
					                        Private f32* %200 = OpAccessChain %9 %76 
					                                 f32 %201 = OpLoad %200 
					                                 f32 %202 = OpFAdd %199 %201 
					                        Private f32* %204 = OpAccessChain %9 %203 
					                                              OpStore %204 %202 
					                 read_only Texture2D %210 = OpLoad %209 
					                             sampler %214 = OpLoad %213 
					          read_only Texture2DSampled %216 = OpSampledImage %210 %214 
					                               f32_4 %217 = OpLoad %9 
					                               f32_2 %218 = OpVectorShuffle %217 %217 0 3 
					                               f32_4 %219 = OpImageSampleImplicitLod %216 %218 
					                                              OpStore %206 %219 
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
						vec4 unused_0_0[4];
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec3 u_xlat2;
					float u_xlat3;
					float u_xlat6;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6 = u_xlat0.x * 36.0828476;
					    u_xlat1.xz = floor(vec2(u_xlat6));
					    u_xlat6 = u_xlat1.z * 0.5;
					    u_xlatb9 = u_xlat6>=(-u_xlat6);
					    u_xlat6 = fract(abs(u_xlat6));
					    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
					    u_xlat3 = (-u_xlat6) * 0.0320000015 + u_xlat0.y;
					    u_xlat0.x = (-u_xlat1.z) * 0.0277139992 + u_xlat0.x;
					    u_xlat6 = u_xlat3 * 31.25;
					    u_xlat1.y = floor(u_xlat6);
					    u_xlat2.xz = u_xlat1.zz + vec2(-1.0, -1.0);
					    u_xlat6 = u_xlat2.z * 0.5;
					    u_xlatb9 = u_xlat6>=(-u_xlat6);
					    u_xlat6 = fract(abs(u_xlat6));
					    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
					    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat1.y;
					    u_xlat3 = (-u_xlat1.y) * 0.0320000015 + u_xlat3;
					    u_xlatb9 = 0.0160000008<u_xlat3;
					    u_xlat3 = (-u_xlat3) * 31.2499981 + 0.5;
					    u_xlat3 = abs(u_xlat3) * 0.0184760932;
					    u_xlatb0 = u_xlat3<u_xlat0.x;
					    u_xlat3 = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat2.y = u_xlat3 + u_xlat6;
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0277128126, 0.0320000015, 0.5);
					    u_xlatb1 = u_xlat0.z>=(-u_xlat0.z);
					    u_xlat6 = fract(abs(u_xlat0.z));
					    u_xlat6 = (u_xlatb1) ? u_xlat6 : (-u_xlat6);
					    u_xlat0.w = u_xlat6 * 0.0320000015 + u_xlat0.y;
					    SV_Target0 = texture(_MainTex, u_xlat0.xw);
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