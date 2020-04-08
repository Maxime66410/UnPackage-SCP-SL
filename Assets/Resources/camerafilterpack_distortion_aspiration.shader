Shader "CameraFilterPack/Distortion_Aspiration" {
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
			GpuProgramID 53368
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
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bvec2 u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat7;
					vec2 u_xlat9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0.z = 0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat9.xy = u_xlat1.xy + (-vec2(_Value2, _Value3));
					    u_xlat2.x = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat9.xy = u_xlat9.xy * u_xlat2.xx;
					    u_xlat0.xy = u_xlat9.xy * vec2(vec2(_Value, _Value)) + u_xlat1.xy;
					    u_xlatb1.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
					    u_xlat9.xy = u_xlat0.xy + vec2(-1.0, -1.0);
					    u_xlat2.xy = (-u_xlat9.xy);
					    u_xlat2.z = u_xlat2.x + 1.0;
					    u_xlat1.xz = (u_xlatb1.x) ? u_xlat2.zx : u_xlat0.xz;
					    u_xlat13 = u_xlat1.x + 1.0;
					    u_xlat3.xy = (-vec2(u_xlat13)) + vec2(1.0, 2.0);
					    u_xlat13 = u_xlat1.z + (-u_xlat3.y);
					    u_xlat3.z = u_xlat13 + 1.0;
					    u_xlatb13 = u_xlat1.x<0.0;
					    u_xlat0.xw = (bool(u_xlatb13)) ? u_xlat3.xz : u_xlat1.xz;
					    u_xlat7.y = u_xlat2.y + u_xlat0.w;
					    u_xlat7.x = u_xlat2.y + 1.0;
					    u_xlat1.xy = (u_xlatb1.y) ? u_xlat7.xy : u_xlat0.yw;
					    u_xlat12 = u_xlat1.x + 1.0;
					    u_xlat2.xy = (-vec2(u_xlat12)) + vec2(1.0, 2.0);
					    u_xlat12 = u_xlat1.y + (-u_xlat2.y);
					    u_xlat2.z = u_xlat12 + 1.0;
					    u_xlatb12 = u_xlat1.x<0.0;
					    u_xlat0.yz = (bool(u_xlatb12)) ? u_xlat2.xz : u_xlat1.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat0.z + u_xlat0.z;
					    SV_Target0.xyz = -abs(u_xlat0.xxx) + u_xlat10_1.xyz;
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
					; Bound: 256
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %20 %243 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpDecorate vs_TEXCOORD0 Location 20 
					                                                OpMemberDecorate %22 0 Offset 22 
					                                                OpMemberDecorate %22 1 Offset 22 
					                                                OpMemberDecorate %22 2 Offset 22 
					                                                OpMemberDecorate %22 3 RelaxedPrecision 
					                                                OpMemberDecorate %22 3 Offset 22 
					                                                OpDecorate %22 Block 
					                                                OpDecorate %24 DescriptorSet 24 
					                                                OpDecorate %24 Binding 24 
					                                                OpDecorate %29 RelaxedPrecision 
					                                                OpDecorate %30 RelaxedPrecision 
					                                                OpDecorate %33 RelaxedPrecision 
					                                                OpDecorate %34 RelaxedPrecision 
					                                                OpDecorate %219 RelaxedPrecision 
					                                                OpDecorate %222 RelaxedPrecision 
					                                                OpDecorate %222 DescriptorSet 222 
					                                                OpDecorate %222 Binding 222 
					                                                OpDecorate %223 RelaxedPrecision 
					                                                OpDecorate %226 RelaxedPrecision 
					                                                OpDecorate %226 DescriptorSet 226 
					                                                OpDecorate %226 Binding 226 
					                                                OpDecorate %227 RelaxedPrecision 
					                                                OpDecorate %233 RelaxedPrecision 
					                                                OpDecorate %243 Location 243 
					                                                OpDecorate %245 RelaxedPrecision 
					                                                OpDecorate %246 RelaxedPrecision 
					                                                OpDecorate %247 RelaxedPrecision 
					                                                OpDecorate %248 RelaxedPrecision 
					                                                OpDecorate %249 RelaxedPrecision 
					                                                OpDecorate %250 RelaxedPrecision 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 4 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_4* %9 = OpVariable Private 
					                                    f32 %10 = OpConstant 3,674022E-40 
					                                        %11 = OpTypeInt 32 0 
					                                    u32 %12 = OpConstant 2 
					                                        %13 = OpTypePointer Private %6 
					                                        %15 = OpTypeVector %6 3 
					                                        %16 = OpTypePointer Private %15 
					                         Private f32_3* %17 = OpVariable Private 
					                                        %18 = OpTypeVector %6 2 
					                                        %19 = OpTypePointer Input %18 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                        %22 = OpTypeStruct %6 %6 %6 %7 
					                                        %23 = OpTypePointer Uniform %22 
					Uniform struct {f32; f32; f32; f32_4;}* %24 = OpVariable Uniform 
					                                        %25 = OpTypeInt 32 1 
					                                    i32 %26 = OpConstant 3 
					                                        %27 = OpTypePointer Uniform %7 
					                                        %38 = OpTypePointer Private %18 
					                         Private f32_2* %39 = OpVariable Private 
					                                    i32 %42 = OpConstant 1 
					                                        %43 = OpTypePointer Uniform %6 
					                                    i32 %46 = OpConstant 2 
					                         Private f32_3* %52 = OpVariable Private 
					                                    u32 %56 = OpConstant 0 
					                                    i32 %67 = OpConstant 0 
					                                        %82 = OpTypeBool 
					                                        %83 = OpTypeVector %82 2 
					                                        %84 = OpTypePointer Private %83 
					                        Private bool_2* %85 = OpVariable Private 
					                                    f32 %86 = OpConstant 3,674022E-40 
					                                  f32_4 %87 = OpConstantComposite %86 %86 %10 %10 
					                                        %90 = OpTypeVector %82 4 
					                                    f32 %95 = OpConstant 3,674022E-40 
					                                  f32_2 %96 = OpConstantComposite %95 %95 
					                                       %106 = OpTypePointer Private %82 
					                                       %109 = OpTypePointer Function %18 
					                          Private f32* %121 = OpVariable Private 
					                        Private f32_3* %125 = OpVariable Private 
					                                   f32 %129 = OpConstant 3,674022E-40 
					                                 f32_2 %130 = OpConstantComposite %86 %129 
					                                   u32 %136 = OpConstant 1 
					                         Private bool* %144 = OpVariable Private 
					                        Private f32_2* %160 = OpVariable Private 
					                                   u32 %163 = OpConstant 3 
					                          Private f32* %184 = OpVariable Private 
					                         Private bool* %203 = OpVariable Private 
					                        Private f32_4* %219 = OpVariable Private 
					                                       %220 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                       %221 = OpTypePointer UniformConstant %220 
					  UniformConstant read_only Texture2D* %222 = OpVariable UniformConstant 
					                                       %224 = OpTypeSampler 
					                                       %225 = OpTypePointer UniformConstant %224 
					              UniformConstant sampler* %226 = OpVariable UniformConstant 
					                                       %228 = OpTypeSampledImage %220 
					                          Private f32* %236 = OpVariable Private 
					                                       %242 = OpTypePointer Output %7 
					                         Output f32_4* %243 = OpVariable Output 
					                                       %253 = OpTypePointer Output %6 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                       Function f32_2* %110 = OpVariable Function 
					                       Function f32_2* %149 = OpVariable Function 
					                       Function f32_2* %174 = OpVariable Function 
					                       Function f32_2* %208 = OpVariable Function 
					                           Private f32* %14 = OpAccessChain %9 %12 
					                                                OpStore %14 %10 
					                                  f32_2 %21 = OpLoad vs_TEXCOORD0 
					                         Uniform f32_4* %28 = OpAccessChain %24 %26 
					                                  f32_4 %29 = OpLoad %28 
					                                  f32_2 %30 = OpVectorShuffle %29 %29 0 1 
					                                  f32_2 %31 = OpFMul %21 %30 
					                         Uniform f32_4* %32 = OpAccessChain %24 %26 
					                                  f32_4 %33 = OpLoad %32 
					                                  f32_2 %34 = OpVectorShuffle %33 %33 2 3 
					                                  f32_2 %35 = OpFAdd %31 %34 
					                                  f32_3 %36 = OpLoad %17 
					                                  f32_3 %37 = OpVectorShuffle %36 %35 3 4 2 
					                                                OpStore %17 %37 
					                                  f32_3 %40 = OpLoad %17 
					                                  f32_2 %41 = OpVectorShuffle %40 %40 0 1 
					                           Uniform f32* %44 = OpAccessChain %24 %42 
					                                    f32 %45 = OpLoad %44 
					                           Uniform f32* %47 = OpAccessChain %24 %46 
					                                    f32 %48 = OpLoad %47 
					                                  f32_2 %49 = OpCompositeConstruct %45 %48 
					                                  f32_2 %50 = OpFNegate %49 
					                                  f32_2 %51 = OpFAdd %41 %50 
					                                                OpStore %39 %51 
					                                  f32_2 %53 = OpLoad %39 
					                                  f32_2 %54 = OpLoad %39 
					                                    f32 %55 = OpDot %53 %54 
					                           Private f32* %57 = OpAccessChain %52 %56 
					                                                OpStore %57 %55 
					                           Private f32* %58 = OpAccessChain %52 %56 
					                                    f32 %59 = OpLoad %58 
					                                    f32 %60 = OpExtInst %1 32 %59 
					                           Private f32* %61 = OpAccessChain %52 %56 
					                                                OpStore %61 %60 
					                                  f32_2 %62 = OpLoad %39 
					                                  f32_3 %63 = OpLoad %52 
					                                  f32_2 %64 = OpVectorShuffle %63 %63 0 0 
					                                  f32_2 %65 = OpFMul %62 %64 
					                                                OpStore %39 %65 
					                                  f32_2 %66 = OpLoad %39 
					                           Uniform f32* %68 = OpAccessChain %24 %67 
					                                    f32 %69 = OpLoad %68 
					                           Uniform f32* %70 = OpAccessChain %24 %67 
					                                    f32 %71 = OpLoad %70 
					                                  f32_2 %72 = OpCompositeConstruct %69 %71 
					                                    f32 %73 = OpCompositeExtract %72 0 
					                                    f32 %74 = OpCompositeExtract %72 1 
					                                  f32_2 %75 = OpCompositeConstruct %73 %74 
					                                  f32_2 %76 = OpFMul %66 %75 
					                                  f32_3 %77 = OpLoad %17 
					                                  f32_2 %78 = OpVectorShuffle %77 %77 0 1 
					                                  f32_2 %79 = OpFAdd %76 %78 
					                                  f32_4 %80 = OpLoad %9 
					                                  f32_4 %81 = OpVectorShuffle %80 %79 4 5 2 3 
					                                                OpStore %9 %81 
					                                  f32_4 %88 = OpLoad %9 
					                                  f32_4 %89 = OpVectorShuffle %88 %88 0 1 0 0 
					                                 bool_4 %91 = OpFOrdLessThan %87 %89 
					                                 bool_2 %92 = OpVectorShuffle %91 %91 0 1 
					                                                OpStore %85 %92 
					                                  f32_4 %93 = OpLoad %9 
					                                  f32_2 %94 = OpVectorShuffle %93 %93 0 1 
					                                  f32_2 %97 = OpFAdd %94 %96 
					                                                OpStore %39 %97 
					                                  f32_2 %98 = OpLoad %39 
					                                  f32_2 %99 = OpFNegate %98 
					                                 f32_3 %100 = OpLoad %52 
					                                 f32_3 %101 = OpVectorShuffle %100 %99 3 4 2 
					                                                OpStore %52 %101 
					                          Private f32* %102 = OpAccessChain %52 %56 
					                                   f32 %103 = OpLoad %102 
					                                   f32 %104 = OpFAdd %103 %86 
					                          Private f32* %105 = OpAccessChain %52 %12 
					                                                OpStore %105 %104 
					                         Private bool* %107 = OpAccessChain %85 %56 
					                                  bool %108 = OpLoad %107 
					                                                OpSelectionMerge %112 None 
					                                                OpBranchConditional %108 %111 %115 
					                                       %111 = OpLabel 
					                                 f32_3 %113 = OpLoad %52 
					                                 f32_2 %114 = OpVectorShuffle %113 %113 2 0 
					                                                OpStore %110 %114 
					                                                OpBranch %112 
					                                       %115 = OpLabel 
					                                 f32_4 %116 = OpLoad %9 
					                                 f32_2 %117 = OpVectorShuffle %116 %116 0 2 
					                                                OpStore %110 %117 
					                                                OpBranch %112 
					                                       %112 = OpLabel 
					                                 f32_2 %118 = OpLoad %110 
					                                 f32_3 %119 = OpLoad %17 
					                                 f32_3 %120 = OpVectorShuffle %119 %118 3 1 4 
					                                                OpStore %17 %120 
					                          Private f32* %122 = OpAccessChain %17 %56 
					                                   f32 %123 = OpLoad %122 
					                                   f32 %124 = OpFAdd %123 %86 
					                                                OpStore %121 %124 
					                                   f32 %126 = OpLoad %121 
					                                 f32_2 %127 = OpCompositeConstruct %126 %126 
					                                 f32_2 %128 = OpFNegate %127 
					                                 f32_2 %131 = OpFAdd %128 %130 
					                                 f32_3 %132 = OpLoad %125 
					                                 f32_3 %133 = OpVectorShuffle %132 %131 3 4 2 
					                                                OpStore %125 %133 
					                          Private f32* %134 = OpAccessChain %17 %12 
					                                   f32 %135 = OpLoad %134 
					                          Private f32* %137 = OpAccessChain %125 %136 
					                                   f32 %138 = OpLoad %137 
					                                   f32 %139 = OpFNegate %138 
					                                   f32 %140 = OpFAdd %135 %139 
					                                                OpStore %121 %140 
					                                   f32 %141 = OpLoad %121 
					                                   f32 %142 = OpFAdd %141 %86 
					                          Private f32* %143 = OpAccessChain %125 %12 
					                                                OpStore %143 %142 
					                          Private f32* %145 = OpAccessChain %17 %56 
					                                   f32 %146 = OpLoad %145 
					                                  bool %147 = OpFOrdLessThan %146 %10 
					                                                OpStore %144 %147 
					                                  bool %148 = OpLoad %144 
					                                                OpSelectionMerge %151 None 
					                                                OpBranchConditional %148 %150 %154 
					                                       %150 = OpLabel 
					                                 f32_3 %152 = OpLoad %125 
					                                 f32_2 %153 = OpVectorShuffle %152 %152 0 2 
					                                                OpStore %149 %153 
					                                                OpBranch %151 
					                                       %154 = OpLabel 
					                                 f32_3 %155 = OpLoad %17 
					                                 f32_2 %156 = OpVectorShuffle %155 %155 0 2 
					                                                OpStore %149 %156 
					                                                OpBranch %151 
					                                       %151 = OpLabel 
					                                 f32_2 %157 = OpLoad %149 
					                                 f32_4 %158 = OpLoad %9 
					                                 f32_4 %159 = OpVectorShuffle %158 %157 4 1 2 5 
					                                                OpStore %9 %159 
					                          Private f32* %161 = OpAccessChain %52 %136 
					                                   f32 %162 = OpLoad %161 
					                          Private f32* %164 = OpAccessChain %9 %163 
					                                   f32 %165 = OpLoad %164 
					                                   f32 %166 = OpFAdd %162 %165 
					                          Private f32* %167 = OpAccessChain %160 %136 
					                                                OpStore %167 %166 
					                          Private f32* %168 = OpAccessChain %52 %136 
					                                   f32 %169 = OpLoad %168 
					                                   f32 %170 = OpFAdd %169 %86 
					                          Private f32* %171 = OpAccessChain %160 %56 
					                                                OpStore %171 %170 
					                         Private bool* %172 = OpAccessChain %85 %136 
					                                  bool %173 = OpLoad %172 
					                                                OpSelectionMerge %176 None 
					                                                OpBranchConditional %173 %175 %178 
					                                       %175 = OpLabel 
					                                 f32_2 %177 = OpLoad %160 
					                                                OpStore %174 %177 
					                                                OpBranch %176 
					                                       %178 = OpLabel 
					                                 f32_4 %179 = OpLoad %9 
					                                 f32_2 %180 = OpVectorShuffle %179 %179 1 3 
					                                                OpStore %174 %180 
					                                                OpBranch %176 
					                                       %176 = OpLabel 
					                                 f32_2 %181 = OpLoad %174 
					                                 f32_3 %182 = OpLoad %17 
					                                 f32_3 %183 = OpVectorShuffle %182 %181 3 4 2 
					                                                OpStore %17 %183 
					                          Private f32* %185 = OpAccessChain %17 %56 
					                                   f32 %186 = OpLoad %185 
					                                   f32 %187 = OpFAdd %186 %86 
					                                                OpStore %184 %187 
					                                   f32 %188 = OpLoad %184 
					                                 f32_2 %189 = OpCompositeConstruct %188 %188 
					                                 f32_2 %190 = OpFNegate %189 
					                                 f32_2 %191 = OpFAdd %190 %130 
					                                 f32_3 %192 = OpLoad %52 
					                                 f32_3 %193 = OpVectorShuffle %192 %191 3 4 2 
					                                                OpStore %52 %193 
					                          Private f32* %194 = OpAccessChain %17 %136 
					                                   f32 %195 = OpLoad %194 
					                          Private f32* %196 = OpAccessChain %52 %136 
					                                   f32 %197 = OpLoad %196 
					                                   f32 %198 = OpFNegate %197 
					                                   f32 %199 = OpFAdd %195 %198 
					                                                OpStore %184 %199 
					                                   f32 %200 = OpLoad %184 
					                                   f32 %201 = OpFAdd %200 %86 
					                          Private f32* %202 = OpAccessChain %52 %12 
					                                                OpStore %202 %201 
					                          Private f32* %204 = OpAccessChain %17 %56 
					                                   f32 %205 = OpLoad %204 
					                                  bool %206 = OpFOrdLessThan %205 %10 
					                                                OpStore %203 %206 
					                                  bool %207 = OpLoad %203 
					                                                OpSelectionMerge %210 None 
					                                                OpBranchConditional %207 %209 %213 
					                                       %209 = OpLabel 
					                                 f32_3 %211 = OpLoad %52 
					                                 f32_2 %212 = OpVectorShuffle %211 %211 0 2 
					                                                OpStore %208 %212 
					                                                OpBranch %210 
					                                       %213 = OpLabel 
					                                 f32_3 %214 = OpLoad %17 
					                                 f32_2 %215 = OpVectorShuffle %214 %214 0 1 
					                                                OpStore %208 %215 
					                                                OpBranch %210 
					                                       %210 = OpLabel 
					                                 f32_2 %216 = OpLoad %208 
					                                 f32_4 %217 = OpLoad %9 
					                                 f32_4 %218 = OpVectorShuffle %217 %216 0 4 5 3 
					                                                OpStore %9 %218 
					                   read_only Texture2D %223 = OpLoad %222 
					                               sampler %227 = OpLoad %226 
					            read_only Texture2DSampled %229 = OpSampledImage %223 %227 
					                                 f32_4 %230 = OpLoad %9 
					                                 f32_2 %231 = OpVectorShuffle %230 %230 0 1 
					                                 f32_4 %232 = OpImageSampleImplicitLod %229 %231 
					                                 f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
					                                 f32_4 %234 = OpLoad %219 
					                                 f32_4 %235 = OpVectorShuffle %234 %233 4 5 2 6 
					                                                OpStore %219 %235 
					                          Private f32* %237 = OpAccessChain %9 %12 
					                                   f32 %238 = OpLoad %237 
					                          Private f32* %239 = OpAccessChain %9 %12 
					                                   f32 %240 = OpLoad %239 
					                                   f32 %241 = OpFAdd %238 %240 
					                                                OpStore %236 %241 
					                                   f32 %244 = OpLoad %236 
					                                 f32_3 %245 = OpCompositeConstruct %244 %244 %244 
					                                 f32_3 %246 = OpExtInst %1 4 %245 
					                                 f32_3 %247 = OpFNegate %246 
					                                 f32_4 %248 = OpLoad %219 
					                                 f32_3 %249 = OpVectorShuffle %248 %248 0 1 3 
					                                 f32_3 %250 = OpFAdd %247 %249 
					                                 f32_4 %251 = OpLoad %243 
					                                 f32_4 %252 = OpVectorShuffle %251 %250 4 5 6 3 
					                                                OpStore %243 %252 
					                           Output f32* %254 = OpAccessChain %243 %163 
					                                                OpStore %254 %86 
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
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bvec2 u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat7;
					vec2 u_xlat9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0.z = 0.0;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat9.xy = u_xlat1.xy + (-vec2(_Value2, _Value3));
					    u_xlat2.x = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlat2.x = inversesqrt(u_xlat2.x);
					    u_xlat9.xy = u_xlat9.xy * u_xlat2.xx;
					    u_xlat0.xy = u_xlat9.xy * vec2(vec2(_Value, _Value)) + u_xlat1.xy;
					    u_xlatb1.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat0.xyxx).xy;
					    u_xlat9.xy = u_xlat0.xy + vec2(-1.0, -1.0);
					    u_xlat2.xy = (-u_xlat9.xy);
					    u_xlat2.z = u_xlat2.x + 1.0;
					    u_xlat1.xz = (u_xlatb1.x) ? u_xlat2.zx : u_xlat0.xz;
					    u_xlat13 = u_xlat1.x + 1.0;
					    u_xlat3.xy = (-vec2(u_xlat13)) + vec2(1.0, 2.0);
					    u_xlat13 = u_xlat1.z + (-u_xlat3.y);
					    u_xlat3.z = u_xlat13 + 1.0;
					    u_xlatb13 = u_xlat1.x<0.0;
					    u_xlat0.xw = (bool(u_xlatb13)) ? u_xlat3.xz : u_xlat1.xz;
					    u_xlat7.y = u_xlat2.y + u_xlat0.w;
					    u_xlat7.x = u_xlat2.y + 1.0;
					    u_xlat1.xy = (u_xlatb1.y) ? u_xlat7.xy : u_xlat0.yw;
					    u_xlat12 = u_xlat1.x + 1.0;
					    u_xlat2.xy = (-vec2(u_xlat12)) + vec2(1.0, 2.0);
					    u_xlat12 = u_xlat1.y + (-u_xlat2.y);
					    u_xlat2.z = u_xlat12 + 1.0;
					    u_xlatb12 = u_xlat1.x<0.0;
					    u_xlat0.yz = (bool(u_xlatb12)) ? u_xlat2.xz : u_xlat1.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat0.z + u_xlat0.z;
					    SV_Target0.xyz = -abs(u_xlat0.xxx) + u_xlat10_1.xyz;
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