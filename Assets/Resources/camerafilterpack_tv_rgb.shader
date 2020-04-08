Shader "CameraFilterPack/TV_Rgb" {
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
			GpuProgramID 3113
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
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec3 u_xlatb0;
					vec3 u_xlat1;
					bvec3 u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat6;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD0.yxx * _MainTex_ST.yxx + _MainTex_ST.wzz;
					    u_xlat0.xyz = u_xlat0.xyz * _ScreenResolution.yxx;
					    u_xlat12 = _Distortion * 6.0;
					    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat12);
					    u_xlatb1.xyz = greaterThanEqual(u_xlat0.xyzx, (-u_xlat0.xzzx)).xyz;
					    u_xlat2.xyz = fract(abs(u_xlat0.xzz));
					    u_xlat0.xy = floor(u_xlat0.zx);
					    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat0.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.z);
					    u_xlat0.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb0.xyz = lessThan(u_xlat0.xyzx, vec4(5.0, 2.0, 4.0, 0.0)).xyz;
					    u_xlat1.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat6.x = 0.0;
					    u_xlat5.x = u_xlat3.y;
					    u_xlat6.y = u_xlat3.z;
					    u_xlat1.yz = (u_xlatb0.z) ? u_xlat5.xy : u_xlat6.xy;
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = (u_xlatb0.y) ? u_xlat3.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat4.xyz, vec3(u_xlatb0.xxx));
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
					; Bound: 210
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %12 %195 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 12 
					                                             OpMemberDecorate %16 0 Offset 16 
					                                             OpMemberDecorate %16 1 Offset 16 
					                                             OpMemberDecorate %16 2 RelaxedPrecision 
					                                             OpMemberDecorate %16 2 Offset 16 
					                                             OpDecorate %16 Block 
					                                             OpDecorate %18 DescriptorSet 18 
					                                             OpDecorate %18 Binding 18 
					                                             OpDecorate %23 RelaxedPrecision 
					                                             OpDecorate %24 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %28 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %87 DescriptorSet 87 
					                                             OpDecorate %87 Binding 87 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %91 DescriptorSet 91 
					                                             OpDecorate %91 Binding 91 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %195 Location 195 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeVector %6 2 
					                                     %11 = OpTypePointer Input %10 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %15 = OpTypeVector %6 4 
					                                     %16 = OpTypeStruct %6 %15 %15 
					                                     %17 = OpTypePointer Uniform %16 
					Uniform struct {f32; f32_4; f32_4;}* %18 = OpVariable Uniform 
					                                     %19 = OpTypeInt 32 1 
					                                 i32 %20 = OpConstant 2 
					                                     %21 = OpTypePointer Uniform %15 
					                                 i32 %31 = OpConstant 1 
					                                     %36 = OpTypePointer Private %6 
					                        Private f32* %37 = OpVariable Private 
					                                 i32 %38 = OpConstant 0 
					                                     %39 = OpTypePointer Uniform %6 
					                                 f32 %42 = OpConstant 3,674022E-40 
					                                     %48 = OpTypeBool 
					                                     %49 = OpTypeVector %48 3 
					                                     %50 = OpTypePointer Private %49 
					                     Private bool_3* %51 = OpVariable Private 
					                                     %57 = OpTypeVector %48 4 
					                      Private f32_3* %60 = OpVariable Private 
					                                     %85 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %86 = OpTypePointer UniformConstant %85 
					UniformConstant read_only Texture2D* %87 = OpVariable UniformConstant 
					                                     %89 = OpTypeSampler 
					                                     %90 = OpTypePointer UniformConstant %89 
					            UniformConstant sampler* %91 = OpVariable UniformConstant 
					                                     %93 = OpTypeSampledImage %85 
					                      Private f32_3* %99 = OpVariable Private 
					                                    %100 = OpTypeInt 32 0 
					                                u32 %101 = OpConstant 0 
					                                    %102 = OpTypePointer Private %48 
					                                    %105 = OpTypePointer Function %6 
					                                u32 %117 = OpConstant 1 
					                                u32 %126 = OpConstant 2 
					                                f32 %151 = OpConstant 3,674022E-40 
					                                f32 %152 = OpConstant 3,674022E-40 
					                                f32 %153 = OpConstant 3,674022E-40 
					                                f32 %154 = OpConstant 3,674022E-40 
					                              f32_4 %155 = OpConstantComposite %151 %152 %153 %154 
					                                    %159 = OpTypePointer Private %10 
					                     Private f32_2* %160 = OpVariable Private 
					                     Private f32_2* %162 = OpVariable Private 
					                                    %172 = OpTypePointer Function %10 
					                                    %186 = OpTypePointer Function %7 
					                                    %194 = OpTypePointer Output %15 
					                      Output f32_4* %195 = OpVariable Output 
					                              f32_3 %196 = OpConstantComposite %154 %154 %154 
					                                f32 %200 = OpConstant 3,674022E-40 
					                              f32_3 %201 = OpConstantComposite %200 %200 %200 
					                                u32 %206 = OpConstant 3 
					                                    %207 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Function f32* %106 = OpVariable Function 
					                      Function f32* %120 = OpVariable Function 
					                      Function f32* %134 = OpVariable Function 
					                    Function f32_2* %173 = OpVariable Function 
					                    Function f32_3* %187 = OpVariable Function 
					                               f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               f32_3 %14 = OpVectorShuffle %13 %13 1 0 0 
					                      Uniform f32_4* %22 = OpAccessChain %18 %20 
					                               f32_4 %23 = OpLoad %22 
					                               f32_3 %24 = OpVectorShuffle %23 %23 1 0 0 
					                               f32_3 %25 = OpFMul %14 %24 
					                      Uniform f32_4* %26 = OpAccessChain %18 %20 
					                               f32_4 %27 = OpLoad %26 
					                               f32_3 %28 = OpVectorShuffle %27 %27 3 2 2 
					                               f32_3 %29 = OpFAdd %25 %28 
					                                             OpStore %9 %29 
					                               f32_3 %30 = OpLoad %9 
					                      Uniform f32_4* %32 = OpAccessChain %18 %31 
					                               f32_4 %33 = OpLoad %32 
					                               f32_3 %34 = OpVectorShuffle %33 %33 1 0 0 
					                               f32_3 %35 = OpFMul %30 %34 
					                                             OpStore %9 %35 
					                        Uniform f32* %40 = OpAccessChain %18 %38 
					                                 f32 %41 = OpLoad %40 
					                                 f32 %43 = OpFMul %41 %42 
					                                             OpStore %37 %43 
					                               f32_3 %44 = OpLoad %9 
					                                 f32 %45 = OpLoad %37 
					                               f32_3 %46 = OpCompositeConstruct %45 %45 %45 
					                               f32_3 %47 = OpFDiv %44 %46 
					                                             OpStore %9 %47 
					                               f32_3 %52 = OpLoad %9 
					                               f32_4 %53 = OpVectorShuffle %52 %52 0 1 2 0 
					                               f32_3 %54 = OpLoad %9 
					                               f32_4 %55 = OpVectorShuffle %54 %54 0 2 2 0 
					                               f32_4 %56 = OpFNegate %55 
					                              bool_4 %58 = OpFOrdGreaterThanEqual %53 %56 
					                              bool_3 %59 = OpVectorShuffle %58 %58 0 1 2 
					                                             OpStore %51 %59 
					                               f32_3 %61 = OpLoad %9 
					                               f32_3 %62 = OpVectorShuffle %61 %61 0 2 2 
					                               f32_3 %63 = OpExtInst %1 4 %62 
					                               f32_3 %64 = OpExtInst %1 10 %63 
					                                             OpStore %60 %64 
					                               f32_3 %65 = OpLoad %9 
					                               f32_2 %66 = OpVectorShuffle %65 %65 2 0 
					                               f32_2 %67 = OpExtInst %1 8 %66 
					                               f32_3 %68 = OpLoad %9 
					                               f32_3 %69 = OpVectorShuffle %68 %67 3 4 2 
					                                             OpStore %9 %69 
					                                 f32 %70 = OpLoad %37 
					                               f32_2 %71 = OpCompositeConstruct %70 %70 
					                               f32_3 %72 = OpLoad %9 
					                               f32_2 %73 = OpVectorShuffle %72 %72 0 1 
					                               f32_2 %74 = OpFMul %71 %73 
					                               f32_3 %75 = OpLoad %9 
					                               f32_3 %76 = OpVectorShuffle %75 %74 3 4 2 
					                                             OpStore %9 %76 
					                               f32_3 %77 = OpLoad %9 
					                               f32_2 %78 = OpVectorShuffle %77 %77 0 1 
					                      Uniform f32_4* %79 = OpAccessChain %18 %31 
					                               f32_4 %80 = OpLoad %79 
					                               f32_2 %81 = OpVectorShuffle %80 %80 0 1 
					                               f32_2 %82 = OpFDiv %78 %81 
					                               f32_3 %83 = OpLoad %9 
					                               f32_3 %84 = OpVectorShuffle %83 %82 3 4 2 
					                                             OpStore %9 %84 
					                 read_only Texture2D %88 = OpLoad %87 
					                             sampler %92 = OpLoad %91 
					          read_only Texture2DSampled %94 = OpSampledImage %88 %92 
					                               f32_3 %95 = OpLoad %9 
					                               f32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                               f32_4 %97 = OpImageSampleImplicitLod %94 %96 
					                               f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
					                                             OpStore %9 %98 
					                      Private bool* %103 = OpAccessChain %51 %101 
					                               bool %104 = OpLoad %103 
					                                             OpSelectionMerge %108 None 
					                                             OpBranchConditional %104 %107 %111 
					                                    %107 = OpLabel 
					                       Private f32* %109 = OpAccessChain %60 %101 
					                                f32 %110 = OpLoad %109 
					                                             OpStore %106 %110 
					                                             OpBranch %108 
					                                    %111 = OpLabel 
					                       Private f32* %112 = OpAccessChain %60 %101 
					                                f32 %113 = OpLoad %112 
					                                f32 %114 = OpFNegate %113 
					                                             OpStore %106 %114 
					                                             OpBranch %108 
					                                    %108 = OpLabel 
					                                f32 %115 = OpLoad %106 
					                       Private f32* %116 = OpAccessChain %99 %101 
					                                             OpStore %116 %115 
					                      Private bool* %118 = OpAccessChain %51 %117 
					                               bool %119 = OpLoad %118 
					                                             OpSelectionMerge %122 None 
					                                             OpBranchConditional %119 %121 %125 
					                                    %121 = OpLabel 
					                       Private f32* %123 = OpAccessChain %60 %117 
					                                f32 %124 = OpLoad %123 
					                                             OpStore %120 %124 
					                                             OpBranch %122 
					                                    %125 = OpLabel 
					                       Private f32* %127 = OpAccessChain %60 %126 
					                                f32 %128 = OpLoad %127 
					                                f32 %129 = OpFNegate %128 
					                                             OpStore %120 %129 
					                                             OpBranch %122 
					                                    %122 = OpLabel 
					                                f32 %130 = OpLoad %120 
					                       Private f32* %131 = OpAccessChain %99 %117 
					                                             OpStore %131 %130 
					                      Private bool* %132 = OpAccessChain %51 %126 
					                               bool %133 = OpLoad %132 
					                                             OpSelectionMerge %136 None 
					                                             OpBranchConditional %133 %135 %139 
					                                    %135 = OpLabel 
					                       Private f32* %137 = OpAccessChain %60 %126 
					                                f32 %138 = OpLoad %137 
					                                             OpStore %134 %138 
					                                             OpBranch %136 
					                                    %139 = OpLabel 
					                       Private f32* %140 = OpAccessChain %60 %126 
					                                f32 %141 = OpLoad %140 
					                                f32 %142 = OpFNegate %141 
					                                             OpStore %134 %142 
					                                             OpBranch %136 
					                                    %136 = OpLabel 
					                                f32 %143 = OpLoad %134 
					                       Private f32* %144 = OpAccessChain %99 %126 
					                                             OpStore %144 %143 
					                                f32 %145 = OpLoad %37 
					                              f32_3 %146 = OpCompositeConstruct %145 %145 %145 
					                              f32_3 %147 = OpLoad %99 
					                              f32_3 %148 = OpFMul %146 %147 
					                                             OpStore %99 %148 
					                              f32_3 %149 = OpLoad %99 
					                              f32_4 %150 = OpVectorShuffle %149 %149 0 1 2 0 
					                             bool_4 %156 = OpFOrdLessThan %150 %155 
					                             bool_3 %157 = OpVectorShuffle %156 %156 0 1 2 
					                                             OpStore %51 %157 
					                       Private f32* %158 = OpAccessChain %60 %101 
					                                             OpStore %158 %154 
					                       Private f32* %161 = OpAccessChain %160 %117 
					                                             OpStore %161 %154 
					                       Private f32* %163 = OpAccessChain %162 %101 
					                                             OpStore %163 %154 
					                       Private f32* %164 = OpAccessChain %9 %117 
					                                f32 %165 = OpLoad %164 
					                       Private f32* %166 = OpAccessChain %160 %101 
					                                             OpStore %166 %165 
					                       Private f32* %167 = OpAccessChain %9 %126 
					                                f32 %168 = OpLoad %167 
					                       Private f32* %169 = OpAccessChain %162 %117 
					                                             OpStore %169 %168 
					                      Private bool* %170 = OpAccessChain %51 %126 
					                               bool %171 = OpLoad %170 
					                                             OpSelectionMerge %175 None 
					                                             OpBranchConditional %171 %174 %177 
					                                    %174 = OpLabel 
					                              f32_2 %176 = OpLoad %160 
					                                             OpStore %173 %176 
					                                             OpBranch %175 
					                                    %177 = OpLabel 
					                              f32_2 %178 = OpLoad %162 
					                                             OpStore %173 %178 
					                                             OpBranch %175 
					                                    %175 = OpLabel 
					                              f32_2 %179 = OpLoad %173 
					                              f32_3 %180 = OpLoad %60 
					                              f32_3 %181 = OpVectorShuffle %180 %179 0 3 4 
					                                             OpStore %60 %181 
					                       Private f32* %182 = OpAccessChain %9 %117 
					                                             OpStore %182 %154 
					                       Private f32* %183 = OpAccessChain %9 %126 
					                                             OpStore %183 %154 
					                      Private bool* %184 = OpAccessChain %51 %117 
					                               bool %185 = OpLoad %184 
					                                             OpSelectionMerge %189 None 
					                                             OpBranchConditional %185 %188 %191 
					                                    %188 = OpLabel 
					                              f32_3 %190 = OpLoad %9 
					                                             OpStore %187 %190 
					                                             OpBranch %189 
					                                    %191 = OpLabel 
					                              f32_3 %192 = OpLoad %60 
					                                             OpStore %187 %192 
					                                             OpBranch %189 
					                                    %189 = OpLabel 
					                              f32_3 %193 = OpLoad %187 
					                                             OpStore %9 %193 
					                              f32_3 %197 = OpLoad %9 
					                             bool_3 %198 = OpLoad %51 
					                             bool_3 %199 = OpVectorShuffle %198 %198 0 0 0 
					                              f32_3 %202 = OpSelect %199 %201 %196 
					                              f32_3 %203 = OpExtInst %1 46 %196 %197 %202 
					                              f32_4 %204 = OpLoad %195 
					                              f32_4 %205 = OpVectorShuffle %204 %203 4 5 6 3 
					                                             OpStore %195 %205 
					                        Output f32* %208 = OpAccessChain %195 %206 
					                                             OpStore %208 %200 
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
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec3 u_xlatb0;
					vec3 u_xlat1;
					bvec3 u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat5;
					vec2 u_xlat6;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD0.yxx * _MainTex_ST.yxx + _MainTex_ST.wzz;
					    u_xlat0.xyz = u_xlat0.xyz * _ScreenResolution.yxx;
					    u_xlat12 = _Distortion * 6.0;
					    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat12);
					    u_xlatb1.xyz = greaterThanEqual(u_xlat0.xyzx, (-u_xlat0.xzzx)).xyz;
					    u_xlat2.xyz = fract(abs(u_xlat0.xzz));
					    u_xlat0.xy = floor(u_xlat0.zx);
					    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / _ScreenResolution.xy;
					    u_xlat3 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
					    u_xlat0.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.z);
					    u_xlat0.z = (u_xlatb1.z) ? u_xlat2.z : (-u_xlat2.z);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlatb0.xyz = lessThan(u_xlat0.xyzx, vec4(5.0, 2.0, 4.0, 0.0)).xyz;
					    u_xlat1.x = float(0.0);
					    u_xlat5.y = float(0.0);
					    u_xlat6.x = 0.0;
					    u_xlat5.x = u_xlat3.y;
					    u_xlat6.y = u_xlat3.z;
					    u_xlat1.yz = (u_xlatb0.z) ? u_xlat5.xy : u_xlat6.xy;
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.xyz = (u_xlatb0.y) ? u_xlat3.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat4.xyz, vec3(u_xlatb0.xxx));
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