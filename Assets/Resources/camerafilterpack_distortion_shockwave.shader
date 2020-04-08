Shader "CameraFilterPack/Distortion_ShockWave" {
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
			GpuProgramID 27936
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					float u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					bool u_xlatb5;
					vec2 u_xlat6;
					float u_xlat9;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.xy + (-vec2(_Value, _Value2));
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat13 = inversesqrt(u_xlat9);
					    u_xlat9 = sqrt(u_xlat9);
					    u_xlat1.xy = vec2(u_xlat13) * u_xlat1.xy;
					    u_xlat13 = _Value3 * _TimeX;
					    u_xlat13 = floor(u_xlat13);
					    u_xlat13 = _TimeX * _Value3 + (-u_xlat13);
					    u_xlat2 = (-u_xlat13) + u_xlat9;
					    u_xlat6.x = u_xlat2 * 10.0;
					    u_xlat6.x = log2(abs(u_xlat6.x));
					    u_xlat6.x = u_xlat6.x * 0.800000012;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat3.z = (-u_xlat6.x) + 1.0;
					    u_xlat2 = u_xlat2 * u_xlat3.z;
					    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat2);
					    u_xlat2 = u_xlat9 * u_xlat13;
					    u_xlat6.xy = vec2(u_xlat13) + vec2(0.100000001, -0.100000001);
					    u_xlat13 = u_xlat2 * 40.0;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat13);
					    u_xlat3.xy = u_xlat0.xy + u_xlat1.xy;
					    u_xlat3.w = 1.0;
					    u_xlat0.z = float(1.0);
					    u_xlat0.w = float(0.0);
					    u_xlatb1 = u_xlat6.x>=u_xlat9;
					    u_xlatb5 = u_xlat9>=u_xlat6.y;
					    u_xlatb1 = u_xlatb5 && u_xlatb1;
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat3 : u_xlat0;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat3 = u_xlat0.zzzz * u_xlat10_2;
					    u_xlat1 = u_xlat3 / vec4(u_xlat13);
					    SV_Target0 = u_xlat1 * u_xlat0.wwww + u_xlat10_2;
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
					; Bound: 211
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %12 %203 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate vs_TEXCOORD0 Location 12 
					                                                     OpMemberDecorate %14 0 Offset 14 
					                                                     OpMemberDecorate %14 1 Offset 14 
					                                                     OpMemberDecorate %14 2 Offset 14 
					                                                     OpMemberDecorate %14 3 Offset 14 
					                                                     OpMemberDecorate %14 4 RelaxedPrecision 
					                                                     OpMemberDecorate %14 4 Offset 14 
					                                                     OpDecorate %14 Block 
					                                                     OpDecorate %16 DescriptorSet 16 
					                                                     OpDecorate %16 Binding 16 
					                                                     OpDecorate %21 RelaxedPrecision 
					                                                     OpDecorate %22 RelaxedPrecision 
					                                                     OpDecorate %25 RelaxedPrecision 
					                                                     OpDecorate %26 RelaxedPrecision 
					                                                     OpDecorate %180 RelaxedPrecision 
					                                                     OpDecorate %183 RelaxedPrecision 
					                                                     OpDecorate %183 DescriptorSet 183 
					                                                     OpDecorate %183 Binding 183 
					                                                     OpDecorate %184 RelaxedPrecision 
					                                                     OpDecorate %187 RelaxedPrecision 
					                                                     OpDecorate %187 DescriptorSet 187 
					                                                     OpDecorate %187 Binding 187 
					                                                     OpDecorate %188 RelaxedPrecision 
					                                                     OpDecorate %196 RelaxedPrecision 
					                                                     OpDecorate %203 Location 203 
					                                                     OpDecorate %208 RelaxedPrecision 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypeVector %6 2 
					                                             %11 = OpTypePointer Input %10 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                             %14 = OpTypeStruct %6 %6 %6 %6 %7 
					                                             %15 = OpTypePointer Uniform %14 
					Uniform struct {f32; f32; f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                             %17 = OpTypeInt 32 1 
					                                         i32 %18 = OpConstant 4 
					                                             %19 = OpTypePointer Uniform %7 
					                              Private f32_4* %30 = OpVariable Private 
					                                         i32 %33 = OpConstant 1 
					                                             %34 = OpTypePointer Uniform %6 
					                                         i32 %37 = OpConstant 2 
					                                             %45 = OpTypePointer Private %6 
					                                Private f32* %46 = OpVariable Private 
					                                Private f32* %52 = OpVariable Private 
					                                         i32 %64 = OpConstant 3 
					                                         i32 %67 = OpConstant 0 
					                                Private f32* %81 = OpVariable Private 
					                                             %86 = OpTypePointer Private %10 
					                              Private f32_2* %87 = OpVariable Private 
					                                         f32 %89 = OpConstant 3,674022E-40 
					                                             %91 = OpTypeInt 32 0 
					                                         u32 %92 = OpConstant 0 
					                                        f32 %101 = OpConstant 3,674022E-40 
					                             Private f32_4* %108 = OpVariable Private 
					                                        f32 %112 = OpConstant 3,674022E-40 
					                                        u32 %114 = OpConstant 2 
					                                        f32 %132 = OpConstant 3,674022E-40 
					                                        f32 %133 = OpConstant 3,674022E-40 
					                                      f32_2 %134 = OpConstantComposite %132 %133 
					                                        f32 %137 = OpConstant 3,674022E-40 
					                                        u32 %153 = OpConstant 3 
					                                        f32 %156 = OpConstant 3,674022E-40 
					                                            %158 = OpTypeBool 
					                                            %159 = OpTypePointer Private %158 
					                              Private bool* %160 = OpVariable Private 
					                              Private bool* %165 = OpVariable Private 
					                                        u32 %167 = OpConstant 1 
					                                            %177 = OpTypeVector %158 4 
					                             Private f32_4* %180 = OpVariable Private 
					                                            %181 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %182 = OpTypePointer UniformConstant %181 
					       UniformConstant read_only Texture2D* %183 = OpVariable UniformConstant 
					                                            %185 = OpTypeSampler 
					                                            %186 = OpTypePointer UniformConstant %185 
					                   UniformConstant sampler* %187 = OpVariable UniformConstant 
					                                            %189 = OpTypeSampledImage %181 
					                                            %202 = OpTypePointer Output %7 
					                              Output f32_4* %203 = OpVariable Output 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
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
					                                       f32_4 %31 = OpLoad %9 
					                                       f32_2 %32 = OpVectorShuffle %31 %31 0 1 
					                                Uniform f32* %35 = OpAccessChain %16 %33 
					                                         f32 %36 = OpLoad %35 
					                                Uniform f32* %38 = OpAccessChain %16 %37 
					                                         f32 %39 = OpLoad %38 
					                                       f32_2 %40 = OpCompositeConstruct %36 %39 
					                                       f32_2 %41 = OpFNegate %40 
					                                       f32_2 %42 = OpFAdd %32 %41 
					                                       f32_4 %43 = OpLoad %30 
					                                       f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
					                                                     OpStore %30 %44 
					                                       f32_4 %47 = OpLoad %30 
					                                       f32_2 %48 = OpVectorShuffle %47 %47 0 1 
					                                       f32_4 %49 = OpLoad %30 
					                                       f32_2 %50 = OpVectorShuffle %49 %49 0 1 
					                                         f32 %51 = OpDot %48 %50 
					                                                     OpStore %46 %51 
					                                         f32 %53 = OpLoad %46 
					                                         f32 %54 = OpExtInst %1 32 %53 
					                                                     OpStore %52 %54 
					                                         f32 %55 = OpLoad %46 
					                                         f32 %56 = OpExtInst %1 31 %55 
					                                                     OpStore %46 %56 
					                                         f32 %57 = OpLoad %52 
					                                       f32_2 %58 = OpCompositeConstruct %57 %57 
					                                       f32_4 %59 = OpLoad %30 
					                                       f32_2 %60 = OpVectorShuffle %59 %59 0 1 
					                                       f32_2 %61 = OpFMul %58 %60 
					                                       f32_4 %62 = OpLoad %30 
					                                       f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 3 
					                                                     OpStore %30 %63 
					                                Uniform f32* %65 = OpAccessChain %16 %64 
					                                         f32 %66 = OpLoad %65 
					                                Uniform f32* %68 = OpAccessChain %16 %67 
					                                         f32 %69 = OpLoad %68 
					                                         f32 %70 = OpFMul %66 %69 
					                                                     OpStore %52 %70 
					                                         f32 %71 = OpLoad %52 
					                                         f32 %72 = OpExtInst %1 8 %71 
					                                                     OpStore %52 %72 
					                                Uniform f32* %73 = OpAccessChain %16 %67 
					                                         f32 %74 = OpLoad %73 
					                                Uniform f32* %75 = OpAccessChain %16 %64 
					                                         f32 %76 = OpLoad %75 
					                                         f32 %77 = OpFMul %74 %76 
					                                         f32 %78 = OpLoad %52 
					                                         f32 %79 = OpFNegate %78 
					                                         f32 %80 = OpFAdd %77 %79 
					                                                     OpStore %52 %80 
					                                         f32 %82 = OpLoad %52 
					                                         f32 %83 = OpFNegate %82 
					                                         f32 %84 = OpLoad %46 
					                                         f32 %85 = OpFAdd %83 %84 
					                                                     OpStore %81 %85 
					                                         f32 %88 = OpLoad %81 
					                                         f32 %90 = OpFMul %88 %89 
					                                Private f32* %93 = OpAccessChain %87 %92 
					                                                     OpStore %93 %90 
					                                Private f32* %94 = OpAccessChain %87 %92 
					                                         f32 %95 = OpLoad %94 
					                                         f32 %96 = OpExtInst %1 4 %95 
					                                         f32 %97 = OpExtInst %1 30 %96 
					                                Private f32* %98 = OpAccessChain %87 %92 
					                                                     OpStore %98 %97 
					                                Private f32* %99 = OpAccessChain %87 %92 
					                                        f32 %100 = OpLoad %99 
					                                        f32 %102 = OpFMul %100 %101 
					                               Private f32* %103 = OpAccessChain %87 %92 
					                                                     OpStore %103 %102 
					                               Private f32* %104 = OpAccessChain %87 %92 
					                                        f32 %105 = OpLoad %104 
					                                        f32 %106 = OpExtInst %1 29 %105 
					                               Private f32* %107 = OpAccessChain %87 %92 
					                                                     OpStore %107 %106 
					                               Private f32* %109 = OpAccessChain %87 %92 
					                                        f32 %110 = OpLoad %109 
					                                        f32 %111 = OpFNegate %110 
					                                        f32 %113 = OpFAdd %111 %112 
					                               Private f32* %115 = OpAccessChain %108 %114 
					                                                     OpStore %115 %113 
					                                        f32 %116 = OpLoad %81 
					                               Private f32* %117 = OpAccessChain %108 %114 
					                                        f32 %118 = OpLoad %117 
					                                        f32 %119 = OpFMul %116 %118 
					                                                     OpStore %81 %119 
					                                      f32_4 %120 = OpLoad %30 
					                                      f32_2 %121 = OpVectorShuffle %120 %120 0 1 
					                                        f32 %122 = OpLoad %81 
					                                      f32_2 %123 = OpCompositeConstruct %122 %122 
					                                      f32_2 %124 = OpFMul %121 %123 
					                                      f32_4 %125 = OpLoad %30 
					                                      f32_4 %126 = OpVectorShuffle %125 %124 4 5 2 3 
					                                                     OpStore %30 %126 
					                                        f32 %127 = OpLoad %46 
					                                        f32 %128 = OpLoad %52 
					                                        f32 %129 = OpFMul %127 %128 
					                                                     OpStore %81 %129 
					                                        f32 %130 = OpLoad %52 
					                                      f32_2 %131 = OpCompositeConstruct %130 %130 
					                                      f32_2 %135 = OpFAdd %131 %134 
					                                                     OpStore %87 %135 
					                                        f32 %136 = OpLoad %81 
					                                        f32 %138 = OpFMul %136 %137 
					                                                     OpStore %52 %138 
					                                      f32_4 %139 = OpLoad %30 
					                                      f32_2 %140 = OpVectorShuffle %139 %139 0 1 
					                                        f32 %141 = OpLoad %52 
					                                      f32_2 %142 = OpCompositeConstruct %141 %141 
					                                      f32_2 %143 = OpFDiv %140 %142 
					                                      f32_4 %144 = OpLoad %30 
					                                      f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
					                                                     OpStore %30 %145 
					                                      f32_4 %146 = OpLoad %9 
					                                      f32_2 %147 = OpVectorShuffle %146 %146 0 1 
					                                      f32_4 %148 = OpLoad %30 
					                                      f32_2 %149 = OpVectorShuffle %148 %148 0 1 
					                                      f32_2 %150 = OpFAdd %147 %149 
					                                      f32_4 %151 = OpLoad %108 
					                                      f32_4 %152 = OpVectorShuffle %151 %150 4 5 2 3 
					                                                     OpStore %108 %152 
					                               Private f32* %154 = OpAccessChain %108 %153 
					                                                     OpStore %154 %112 
					                               Private f32* %155 = OpAccessChain %9 %114 
					                                                     OpStore %155 %112 
					                               Private f32* %157 = OpAccessChain %9 %153 
					                                                     OpStore %157 %156 
					                               Private f32* %161 = OpAccessChain %87 %92 
					                                        f32 %162 = OpLoad %161 
					                                        f32 %163 = OpLoad %46 
					                                       bool %164 = OpFOrdGreaterThanEqual %162 %163 
					                                                     OpStore %160 %164 
					                                        f32 %166 = OpLoad %46 
					                               Private f32* %168 = OpAccessChain %87 %167 
					                                        f32 %169 = OpLoad %168 
					                                       bool %170 = OpFOrdGreaterThanEqual %166 %169 
					                                                     OpStore %165 %170 
					                                       bool %171 = OpLoad %165 
					                                       bool %172 = OpLoad %160 
					                                       bool %173 = OpLogicalAnd %171 %172 
					                                                     OpStore %160 %173 
					                                       bool %174 = OpLoad %160 
					                                      f32_4 %175 = OpLoad %108 
					                                      f32_4 %176 = OpLoad %9 
					                                     bool_4 %178 = OpCompositeConstruct %174 %174 %174 %174 
					                                      f32_4 %179 = OpSelect %178 %175 %176 
					                                                     OpStore %9 %179 
					                        read_only Texture2D %184 = OpLoad %183 
					                                    sampler %188 = OpLoad %187 
					                 read_only Texture2DSampled %190 = OpSampledImage %184 %188 
					                                      f32_4 %191 = OpLoad %9 
					                                      f32_2 %192 = OpVectorShuffle %191 %191 0 1 
					                                      f32_4 %193 = OpImageSampleImplicitLod %190 %192 
					                                                     OpStore %180 %193 
					                                      f32_4 %194 = OpLoad %9 
					                                      f32_4 %195 = OpVectorShuffle %194 %194 2 2 2 2 
					                                      f32_4 %196 = OpLoad %180 
					                                      f32_4 %197 = OpFMul %195 %196 
					                                                     OpStore %108 %197 
					                                      f32_4 %198 = OpLoad %108 
					                                        f32 %199 = OpLoad %52 
					                                      f32_4 %200 = OpCompositeConstruct %199 %199 %199 %199 
					                                      f32_4 %201 = OpFDiv %198 %200 
					                                                     OpStore %30 %201 
					                                      f32_4 %204 = OpLoad %30 
					                                      f32_4 %205 = OpLoad %9 
					                                      f32_4 %206 = OpVectorShuffle %205 %205 3 3 3 3 
					                                      f32_4 %207 = OpFMul %204 %206 
					                                      f32_4 %208 = OpLoad %180 
					                                      f32_4 %209 = OpFAdd %207 %208 
					                                                     OpStore %203 %209 
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
						vec4 unused_0_5;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					float u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					bool u_xlatb5;
					vec2 u_xlat6;
					float u_xlat9;
					float u_xlat13;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.xy + (-vec2(_Value, _Value2));
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat13 = inversesqrt(u_xlat9);
					    u_xlat9 = sqrt(u_xlat9);
					    u_xlat1.xy = vec2(u_xlat13) * u_xlat1.xy;
					    u_xlat13 = _Value3 * _TimeX;
					    u_xlat13 = floor(u_xlat13);
					    u_xlat13 = _TimeX * _Value3 + (-u_xlat13);
					    u_xlat2 = (-u_xlat13) + u_xlat9;
					    u_xlat6.x = u_xlat2 * 10.0;
					    u_xlat6.x = log2(abs(u_xlat6.x));
					    u_xlat6.x = u_xlat6.x * 0.800000012;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat3.z = (-u_xlat6.x) + 1.0;
					    u_xlat2 = u_xlat2 * u_xlat3.z;
					    u_xlat1.xy = u_xlat1.xy * vec2(u_xlat2);
					    u_xlat2 = u_xlat9 * u_xlat13;
					    u_xlat6.xy = vec2(u_xlat13) + vec2(0.100000001, -0.100000001);
					    u_xlat13 = u_xlat2 * 40.0;
					    u_xlat1.xy = u_xlat1.xy / vec2(u_xlat13);
					    u_xlat3.xy = u_xlat0.xy + u_xlat1.xy;
					    u_xlat3.w = 1.0;
					    u_xlat0.z = float(1.0);
					    u_xlat0.w = float(0.0);
					    u_xlatb1 = u_xlat6.x>=u_xlat9;
					    u_xlatb5 = u_xlat9>=u_xlat6.y;
					    u_xlatb1 = u_xlatb5 && u_xlatb1;
					    u_xlat0 = (bool(u_xlatb1)) ? u_xlat3 : u_xlat0;
					    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
					    u_xlat3 = u_xlat0.zzzz * u_xlat10_2;
					    u_xlat1 = u_xlat3 / vec4(u_xlat13);
					    SV_Target0 = u_xlat1 * u_xlat0.wwww + u_xlat10_2;
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