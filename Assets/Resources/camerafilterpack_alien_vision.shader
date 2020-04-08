Shader "CameraFilterPack/Alien_Vision" {
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
			GpuProgramID 37127
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
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _Value2 * _TimeX;
					    u_xlat0.xy = u_xlat0.xx * vec2(6.0, 16.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat4.x = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat4.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat1.zw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat1.zw + vec2(-0.5, -0.5);
					    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat4.x = (-u_xlat4.x) * 0.5 + 1.0;
					    u_xlat1.y = u_xlat0.x * 0.0500000007 + u_xlat1.z;
					    u_xlat1.x = (-u_xlat0.x) * 0.0500000007 + u_xlat1.z;
					    u_xlat2 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.yw);
					    u_xlat2.x = u_xlat10_3.x;
					    u_xlat0.x = u_xlat1.w * 800.0;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat2.y = u_xlat10_1.y;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xzw = (-u_xlat0.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
					    u_xlat0.xz = u_xlat4.xx * u_xlat0.xz;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w * u_xlat4.x + u_xlat0.x;
					    u_xlat0.y = u_xlat0.x * 0.333333343;
					    u_xlat0.x = u_xlat0.x * 0.333333343 + (-_Value);
					    u_xlatb8 = u_xlat0.y>=_Value;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat12 = _TimeX + _TimeX;
					    u_xlat12 = cos(u_xlat12);
					    u_xlat9.y = u_xlat12 * 0.241545901 + 1.0;
					    u_xlat12 = _TimeX * 4.0;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat2.y = u_xlat12 * 0.241545901 + 0.5;
					    u_xlat2.x = float(0.100000001);
					    u_xlat2.z = float(0.0);
					    u_xlat1.x = float(0.0);
					    u_xlat9.x = float(0.100000001);
					    u_xlat3.xyz = (-u_xlat9.xyx) + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat9.xyx;
					    u_xlat0.x = sin(_TimeX);
					    u_xlat1.y = u_xlat0.x * 0.241545901 + 0.5;
					    u_xlat2.xyz = (-u_xlat1.xyx) + u_xlat2.xyz;
					    u_xlat0.xyw = u_xlat0.yyy * u_xlat2.xyz + u_xlat1.xyx;
					    SV_Target0.xyz = (bool(u_xlatb8)) ? u_xlat3.xyz : u_xlat0.xyw;
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
					; Bound: 329
					; Schema: 0
					                                                OpCapability Shader 
					                                         %1 = OpExtInstImport "GLSL.std.450" 
					                                                OpMemoryModel Logical GLSL450 
					                                                OpEntryPoint Fragment %4 "main" %78 %313 
					                                                OpExecutionMode %4 OriginUpperLeft 
					                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                OpMemberDecorate %10 0 Offset 10 
					                                                OpMemberDecorate %10 1 Offset 10 
					                                                OpMemberDecorate %10 2 Offset 10 
					                                                OpMemberDecorate %10 3 RelaxedPrecision 
					                                                OpMemberDecorate %10 3 Offset 10 
					                                                OpDecorate %10 Block 
					                                                OpDecorate %12 DescriptorSet 12 
					                                                OpDecorate %12 Binding 12 
					                                                OpDecorate vs_TEXCOORD0 Location 78 
					                                                OpDecorate %83 RelaxedPrecision 
					                                                OpDecorate %84 RelaxedPrecision 
					                                                OpDecorate %87 RelaxedPrecision 
					                                                OpDecorate %88 RelaxedPrecision 
					                                                OpDecorate %136 RelaxedPrecision 
					                                                OpDecorate %136 DescriptorSet 136 
					                                                OpDecorate %136 Binding 136 
					                                                OpDecorate %137 RelaxedPrecision 
					                                                OpDecorate %140 RelaxedPrecision 
					                                                OpDecorate %140 DescriptorSet 140 
					                                                OpDecorate %140 Binding 140 
					                                                OpDecorate %141 RelaxedPrecision 
					                                                OpDecorate %150 RelaxedPrecision 
					                                                OpDecorate %151 RelaxedPrecision 
					                                                OpDecorate %163 RelaxedPrecision 
					                                                OpDecorate %164 RelaxedPrecision 
					                                                OpDecorate %313 Location 313 
					                                         %2 = OpTypeVoid 
					                                         %3 = OpTypeFunction %2 
					                                         %6 = OpTypeFloat 32 
					                                         %7 = OpTypeVector %6 4 
					                                         %8 = OpTypePointer Private %7 
					                          Private f32_4* %9 = OpVariable Private 
					                                        %10 = OpTypeStruct %6 %6 %6 %7 
					                                        %11 = OpTypePointer Uniform %10 
					Uniform struct {f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                        %13 = OpTypeInt 32 1 
					                                    i32 %14 = OpConstant 2 
					                                        %15 = OpTypePointer Uniform %6 
					                                    i32 %18 = OpConstant 0 
					                                        %22 = OpTypeInt 32 0 
					                                    u32 %23 = OpConstant 0 
					                                        %24 = OpTypePointer Private %6 
					                                        %26 = OpTypeVector %6 2 
					                                    f32 %29 = OpConstant 3,674022E-40 
					                                    f32 %30 = OpConstant 3,674022E-40 
					                                  f32_2 %31 = OpConstantComposite %29 %30 
					                                    f32 %42 = OpConstant 3,674022E-40 
					                                        %45 = OpTypePointer Private %26 
					                         Private f32_2* %46 = OpVariable Private 
					                                    u32 %47 = OpConstant 1 
					                                    f32 %50 = OpConstant 3,674022E-40 
					                         Private f32_4* %76 = OpVariable Private 
					                                        %77 = OpTypePointer Input %26 
					                  Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                    i32 %80 = OpConstant 3 
					                                        %81 = OpTypePointer Uniform %7 
					                                    f32 %94 = OpConstant 3,674022E-40 
					                                  f32_2 %95 = OpConstantComposite %94 %94 
					                                   f32 %119 = OpConstant 3,674022E-40 
					                                   u32 %121 = OpConstant 2 
					                                       %134 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                       %135 = OpTypePointer UniformConstant %134 
					  UniformConstant read_only Texture2D* %136 = OpVariable UniformConstant 
					                                       %138 = OpTypeSampler 
					                                       %139 = OpTypePointer UniformConstant %138 
					              UniformConstant sampler* %140 = OpVariable UniformConstant 
					                                       %142 = OpTypeSampledImage %134 
					                                   u32 %148 = OpConstant 3 
					                                   f32 %160 = OpConstant 3,674022E-40 
					                                       %175 = OpTypeVector %6 3 
					                                   f32 %179 = OpConstant 3,674022E-40 
					                                 f32_3 %180 = OpConstantComposite %179 %179 %179 
					                                   f32 %211 = OpConstant 3,674022E-40 
					                                   i32 %217 = OpConstant 1 
					                                       %223 = OpTypeBool 
					                                       %224 = OpTypePointer Private %223 
					                         Private bool* %225 = OpVariable Private 
					                          Private f32* %244 = OpVariable Private 
					                        Private f32_2* %252 = OpVariable Private 
					                                   f32 %254 = OpConstant 3,674022E-40 
					                                   f32 %260 = OpConstant 3,674022E-40 
					                                       %264 = OpTypePointer Private %175 
					                        Private f32_3* %265 = OpVariable Private 
					                                   f32 %270 = OpConstant 3,674022E-40 
					                                   f32 %272 = OpConstant 3,674022E-40 
					                        Private f32_3* %276 = OpVariable Private 
					                                       %312 = OpTypePointer Output %7 
					                         Output f32_4* %313 = OpVariable Output 
					                                       %315 = OpTypePointer Function %175 
					                                       %326 = OpTypePointer Output %6 
					                                    void %4 = OpFunction None %3 
					                                         %5 = OpLabel 
					                       Function f32_3* %316 = OpVariable Function 
					                           Uniform f32* %16 = OpAccessChain %12 %14 
					                                    f32 %17 = OpLoad %16 
					                           Uniform f32* %19 = OpAccessChain %12 %18 
					                                    f32 %20 = OpLoad %19 
					                                    f32 %21 = OpFMul %17 %20 
					                           Private f32* %25 = OpAccessChain %9 %23 
					                                                OpStore %25 %21 
					                                  f32_4 %27 = OpLoad %9 
					                                  f32_2 %28 = OpVectorShuffle %27 %27 0 0 
					                                  f32_2 %32 = OpFMul %28 %31 
					                                  f32_4 %33 = OpLoad %9 
					                                  f32_4 %34 = OpVectorShuffle %33 %32 4 5 2 3 
					                                                OpStore %9 %34 
					                                  f32_4 %35 = OpLoad %9 
					                                  f32_2 %36 = OpVectorShuffle %35 %35 0 1 
					                                  f32_2 %37 = OpExtInst %1 13 %36 
					                                  f32_4 %38 = OpLoad %9 
					                                  f32_4 %39 = OpVectorShuffle %38 %37 4 5 2 3 
					                                                OpStore %9 %39 
					                           Private f32* %40 = OpAccessChain %9 %23 
					                                    f32 %41 = OpLoad %40 
					                                    f32 %43 = OpFAdd %41 %42 
					                           Private f32* %44 = OpAccessChain %9 %23 
					                                                OpStore %44 %43 
					                           Private f32* %48 = OpAccessChain %9 %47 
					                                    f32 %49 = OpLoad %48 
					                                    f32 %51 = OpFMul %49 %50 
					                                    f32 %52 = OpFAdd %51 %42 
					                           Private f32* %53 = OpAccessChain %46 %23 
					                                                OpStore %53 %52 
					                           Private f32* %54 = OpAccessChain %9 %23 
					                                    f32 %55 = OpLoad %54 
					                                    f32 %56 = OpFMul %55 %50 
					                           Private f32* %57 = OpAccessChain %9 %23 
					                                                OpStore %57 %56 
					                           Private f32* %58 = OpAccessChain %46 %23 
					                                    f32 %59 = OpLoad %58 
					                           Private f32* %60 = OpAccessChain %9 %23 
					                                    f32 %61 = OpLoad %60 
					                                    f32 %62 = OpFMul %59 %61 
					                           Private f32* %63 = OpAccessChain %9 %23 
					                                                OpStore %63 %62 
					                           Private f32* %64 = OpAccessChain %9 %23 
					                                    f32 %65 = OpLoad %64 
					                           Private f32* %66 = OpAccessChain %9 %23 
					                                    f32 %67 = OpLoad %66 
					                                    f32 %68 = OpFMul %65 %67 
					                           Private f32* %69 = OpAccessChain %46 %23 
					                                                OpStore %69 %68 
					                           Private f32* %70 = OpAccessChain %46 %23 
					                                    f32 %71 = OpLoad %70 
					                           Private f32* %72 = OpAccessChain %9 %23 
					                                    f32 %73 = OpLoad %72 
					                                    f32 %74 = OpFMul %71 %73 
					                           Private f32* %75 = OpAccessChain %9 %23 
					                                                OpStore %75 %74 
					                                  f32_2 %79 = OpLoad vs_TEXCOORD0 
					                         Uniform f32_4* %82 = OpAccessChain %12 %80 
					                                  f32_4 %83 = OpLoad %82 
					                                  f32_2 %84 = OpVectorShuffle %83 %83 0 1 
					                                  f32_2 %85 = OpFMul %79 %84 
					                         Uniform f32_4* %86 = OpAccessChain %12 %80 
					                                  f32_4 %87 = OpLoad %86 
					                                  f32_2 %88 = OpVectorShuffle %87 %87 2 3 
					                                  f32_2 %89 = OpFAdd %85 %88 
					                                  f32_4 %90 = OpLoad %76 
					                                  f32_4 %91 = OpVectorShuffle %90 %89 0 1 4 5 
					                                                OpStore %76 %91 
					                                  f32_4 %92 = OpLoad %76 
					                                  f32_2 %93 = OpVectorShuffle %92 %92 2 3 
					                                  f32_2 %96 = OpFAdd %93 %95 
					                                                OpStore %46 %96 
					                                  f32_2 %97 = OpLoad %46 
					                                  f32_2 %98 = OpLoad %46 
					                                    f32 %99 = OpDot %97 %98 
					                          Private f32* %100 = OpAccessChain %46 %23 
					                                                OpStore %100 %99 
					                          Private f32* %101 = OpAccessChain %46 %23 
					                                   f32 %102 = OpLoad %101 
					                                   f32 %103 = OpExtInst %1 31 %102 
					                          Private f32* %104 = OpAccessChain %46 %23 
					                                                OpStore %104 %103 
					                          Private f32* %105 = OpAccessChain %46 %23 
					                                   f32 %106 = OpLoad %105 
					                          Private f32* %107 = OpAccessChain %9 %23 
					                                   f32 %108 = OpLoad %107 
					                                   f32 %109 = OpFMul %106 %108 
					                          Private f32* %110 = OpAccessChain %9 %23 
					                                                OpStore %110 %109 
					                          Private f32* %111 = OpAccessChain %46 %23 
					                                   f32 %112 = OpLoad %111 
					                                   f32 %113 = OpFNegate %112 
					                                   f32 %114 = OpFMul %113 %50 
					                                   f32 %115 = OpFAdd %114 %42 
					                          Private f32* %116 = OpAccessChain %46 %23 
					                                                OpStore %116 %115 
					                          Private f32* %117 = OpAccessChain %9 %23 
					                                   f32 %118 = OpLoad %117 
					                                   f32 %120 = OpFMul %118 %119 
					                          Private f32* %122 = OpAccessChain %76 %121 
					                                   f32 %123 = OpLoad %122 
					                                   f32 %124 = OpFAdd %120 %123 
					                          Private f32* %125 = OpAccessChain %76 %47 
					                                                OpStore %125 %124 
					                          Private f32* %126 = OpAccessChain %9 %23 
					                                   f32 %127 = OpLoad %126 
					                                   f32 %128 = OpFNegate %127 
					                                   f32 %129 = OpFMul %128 %119 
					                          Private f32* %130 = OpAccessChain %76 %121 
					                                   f32 %131 = OpLoad %130 
					                                   f32 %132 = OpFAdd %129 %131 
					                          Private f32* %133 = OpAccessChain %76 %23 
					                                                OpStore %133 %132 
					                   read_only Texture2D %137 = OpLoad %136 
					                               sampler %141 = OpLoad %140 
					            read_only Texture2DSampled %143 = OpSampledImage %137 %141 
					                                 f32_4 %144 = OpLoad %76 
					                                 f32_2 %145 = OpVectorShuffle %144 %144 0 3 
					                                 f32_4 %146 = OpImageSampleImplicitLod %143 %145 
					                                   f32 %147 = OpCompositeExtract %146 2 
					                          Private f32* %149 = OpAccessChain %9 %148 
					                                                OpStore %149 %147 
					                   read_only Texture2D %150 = OpLoad %136 
					                               sampler %151 = OpLoad %140 
					            read_only Texture2DSampled %152 = OpSampledImage %150 %151 
					                                 f32_4 %153 = OpLoad %76 
					                                 f32_2 %154 = OpVectorShuffle %153 %153 1 3 
					                                 f32_4 %155 = OpImageSampleImplicitLod %152 %154 
					                                   f32 %156 = OpCompositeExtract %155 0 
					                          Private f32* %157 = OpAccessChain %9 %23 
					                                                OpStore %157 %156 
					                          Private f32* %158 = OpAccessChain %76 %148 
					                                   f32 %159 = OpLoad %158 
					                                   f32 %161 = OpFMul %159 %160 
					                          Private f32* %162 = OpAccessChain %76 %23 
					                                                OpStore %162 %161 
					                   read_only Texture2D %163 = OpLoad %136 
					                               sampler %164 = OpLoad %140 
					            read_only Texture2DSampled %165 = OpSampledImage %163 %164 
					                                 f32_4 %166 = OpLoad %76 
					                                 f32_2 %167 = OpVectorShuffle %166 %166 2 3 
					                                 f32_4 %168 = OpImageSampleImplicitLod %165 %167 
					                                   f32 %169 = OpCompositeExtract %168 1 
					                          Private f32* %170 = OpAccessChain %9 %121 
					                                                OpStore %170 %169 
					                          Private f32* %171 = OpAccessChain %76 %23 
					                                   f32 %172 = OpLoad %171 
					                                   f32 %173 = OpExtInst %1 13 %172 
					                          Private f32* %174 = OpAccessChain %76 %23 
					                                                OpStore %174 %173 
					                                 f32_4 %176 = OpLoad %76 
					                                 f32_3 %177 = OpVectorShuffle %176 %176 0 0 0 
					                                 f32_3 %178 = OpFNegate %177 
					                                 f32_3 %181 = OpFMul %178 %180 
					                                 f32_4 %182 = OpLoad %9 
					                                 f32_3 %183 = OpVectorShuffle %182 %182 0 2 3 
					                                 f32_3 %184 = OpFAdd %181 %183 
					                                 f32_4 %185 = OpLoad %9 
					                                 f32_4 %186 = OpVectorShuffle %185 %184 4 1 5 6 
					                                                OpStore %9 %186 
					                                 f32_2 %187 = OpLoad %46 
					                                 f32_2 %188 = OpVectorShuffle %187 %187 0 0 
					                                 f32_4 %189 = OpLoad %9 
					                                 f32_2 %190 = OpVectorShuffle %189 %189 0 2 
					                                 f32_2 %191 = OpFMul %188 %190 
					                                 f32_4 %192 = OpLoad %9 
					                                 f32_4 %193 = OpVectorShuffle %192 %191 4 1 5 3 
					                                                OpStore %9 %193 
					                          Private f32* %194 = OpAccessChain %9 %121 
					                                   f32 %195 = OpLoad %194 
					                          Private f32* %196 = OpAccessChain %9 %23 
					                                   f32 %197 = OpLoad %196 
					                                   f32 %198 = OpFAdd %195 %197 
					                          Private f32* %199 = OpAccessChain %9 %23 
					                                                OpStore %199 %198 
					                          Private f32* %200 = OpAccessChain %9 %148 
					                                   f32 %201 = OpLoad %200 
					                          Private f32* %202 = OpAccessChain %46 %23 
					                                   f32 %203 = OpLoad %202 
					                                   f32 %204 = OpFMul %201 %203 
					                          Private f32* %205 = OpAccessChain %9 %23 
					                                   f32 %206 = OpLoad %205 
					                                   f32 %207 = OpFAdd %204 %206 
					                          Private f32* %208 = OpAccessChain %9 %23 
					                                                OpStore %208 %207 
					                          Private f32* %209 = OpAccessChain %9 %23 
					                                   f32 %210 = OpLoad %209 
					                                   f32 %212 = OpFMul %210 %211 
					                          Private f32* %213 = OpAccessChain %9 %47 
					                                                OpStore %213 %212 
					                          Private f32* %214 = OpAccessChain %9 %23 
					                                   f32 %215 = OpLoad %214 
					                                   f32 %216 = OpFMul %215 %211 
					                          Uniform f32* %218 = OpAccessChain %12 %217 
					                                   f32 %219 = OpLoad %218 
					                                   f32 %220 = OpFNegate %219 
					                                   f32 %221 = OpFAdd %216 %220 
					                          Private f32* %222 = OpAccessChain %9 %23 
					                                                OpStore %222 %221 
					                          Private f32* %226 = OpAccessChain %9 %47 
					                                   f32 %227 = OpLoad %226 
					                          Uniform f32* %228 = OpAccessChain %12 %217 
					                                   f32 %229 = OpLoad %228 
					                                  bool %230 = OpFOrdGreaterThanEqual %227 %229 
					                                                OpStore %225 %230 
					                                 f32_4 %231 = OpLoad %9 
					                                 f32_2 %232 = OpVectorShuffle %231 %231 0 1 
					                          Uniform f32* %233 = OpAccessChain %12 %217 
					                                   f32 %234 = OpLoad %233 
					                          Uniform f32* %235 = OpAccessChain %12 %217 
					                                   f32 %236 = OpLoad %235 
					                                 f32_2 %237 = OpCompositeConstruct %234 %236 
					                                   f32 %238 = OpCompositeExtract %237 0 
					                                   f32 %239 = OpCompositeExtract %237 1 
					                                 f32_2 %240 = OpCompositeConstruct %238 %239 
					                                 f32_2 %241 = OpFDiv %232 %240 
					                                 f32_4 %242 = OpLoad %9 
					                                 f32_4 %243 = OpVectorShuffle %242 %241 4 5 2 3 
					                                                OpStore %9 %243 
					                          Uniform f32* %245 = OpAccessChain %12 %18 
					                                   f32 %246 = OpLoad %245 
					                          Uniform f32* %247 = OpAccessChain %12 %18 
					                                   f32 %248 = OpLoad %247 
					                                   f32 %249 = OpFAdd %246 %248 
					                                                OpStore %244 %249 
					                                   f32 %250 = OpLoad %244 
					                                   f32 %251 = OpExtInst %1 14 %250 
					                                                OpStore %244 %251 
					                                   f32 %253 = OpLoad %244 
					                                   f32 %255 = OpFMul %253 %254 
					                                   f32 %256 = OpFAdd %255 %42 
					                          Private f32* %257 = OpAccessChain %252 %47 
					                                                OpStore %257 %256 
					                          Uniform f32* %258 = OpAccessChain %12 %18 
					                                   f32 %259 = OpLoad %258 
					                                   f32 %261 = OpFMul %259 %260 
					                                                OpStore %244 %261 
					                                   f32 %262 = OpLoad %244 
					                                   f32 %263 = OpExtInst %1 13 %262 
					                                                OpStore %244 %263 
					                                   f32 %266 = OpLoad %244 
					                                   f32 %267 = OpFMul %266 %254 
					                                   f32 %268 = OpFAdd %267 %50 
					                          Private f32* %269 = OpAccessChain %265 %47 
					                                                OpStore %269 %268 
					                          Private f32* %271 = OpAccessChain %265 %23 
					                                                OpStore %271 %270 
					                          Private f32* %273 = OpAccessChain %265 %121 
					                                                OpStore %273 %272 
					                          Private f32* %274 = OpAccessChain %76 %23 
					                                                OpStore %274 %272 
					                          Private f32* %275 = OpAccessChain %252 %23 
					                                                OpStore %275 %270 
					                                 f32_2 %277 = OpLoad %252 
					                                 f32_3 %278 = OpVectorShuffle %277 %277 0 1 0 
					                                 f32_3 %279 = OpFNegate %278 
					                                 f32_3 %280 = OpLoad %265 
					                                 f32_3 %281 = OpFAdd %279 %280 
					                                                OpStore %276 %281 
					                                 f32_4 %282 = OpLoad %9 
					                                 f32_3 %283 = OpVectorShuffle %282 %282 0 0 0 
					                                 f32_3 %284 = OpLoad %276 
					                                 f32_3 %285 = OpFMul %283 %284 
					                                 f32_2 %286 = OpLoad %252 
					                                 f32_3 %287 = OpVectorShuffle %286 %286 0 1 0 
					                                 f32_3 %288 = OpFAdd %285 %287 
					                                                OpStore %276 %288 
					                          Uniform f32* %289 = OpAccessChain %12 %18 
					                                   f32 %290 = OpLoad %289 
					                                   f32 %291 = OpExtInst %1 13 %290 
					                          Private f32* %292 = OpAccessChain %9 %23 
					                                                OpStore %292 %291 
					                          Private f32* %293 = OpAccessChain %9 %23 
					                                   f32 %294 = OpLoad %293 
					                                   f32 %295 = OpFMul %294 %254 
					                                   f32 %296 = OpFAdd %295 %50 
					                          Private f32* %297 = OpAccessChain %76 %47 
					                                                OpStore %297 %296 
					                                 f32_4 %298 = OpLoad %76 
					                                 f32_3 %299 = OpVectorShuffle %298 %298 0 1 0 
					                                 f32_3 %300 = OpFNegate %299 
					                                 f32_3 %301 = OpLoad %265 
					                                 f32_3 %302 = OpFAdd %300 %301 
					                                                OpStore %265 %302 
					                                 f32_4 %303 = OpLoad %9 
					                                 f32_3 %304 = OpVectorShuffle %303 %303 1 1 1 
					                                 f32_3 %305 = OpLoad %265 
					                                 f32_3 %306 = OpFMul %304 %305 
					                                 f32_4 %307 = OpLoad %76 
					                                 f32_3 %308 = OpVectorShuffle %307 %307 0 1 0 
					                                 f32_3 %309 = OpFAdd %306 %308 
					                                 f32_4 %310 = OpLoad %9 
					                                 f32_4 %311 = OpVectorShuffle %310 %309 4 5 2 6 
					                                                OpStore %9 %311 
					                                  bool %314 = OpLoad %225 
					                                                OpSelectionMerge %318 None 
					                                                OpBranchConditional %314 %317 %320 
					                                       %317 = OpLabel 
					                                 f32_3 %319 = OpLoad %276 
					                                                OpStore %316 %319 
					                                                OpBranch %318 
					                                       %320 = OpLabel 
					                                 f32_4 %321 = OpLoad %9 
					                                 f32_3 %322 = OpVectorShuffle %321 %321 0 1 3 
					                                                OpStore %316 %322 
					                                                OpBranch %318 
					                                       %318 = OpLabel 
					                                 f32_3 %323 = OpLoad %316 
					                                 f32_4 %324 = OpLoad %313 
					                                 f32_4 %325 = OpVectorShuffle %324 %323 4 5 6 3 
					                                                OpStore %313 %325 
					                           Output f32* %327 = OpAccessChain %313 %148 
					                                                OpStore %327 %42 
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
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat10_3;
					vec2 u_xlat4;
					bool u_xlatb8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _Value2 * _TimeX;
					    u_xlat0.xy = u_xlat0.xx * vec2(6.0, 16.0);
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat4.x = u_xlat0.y * 0.5 + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.5;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat4.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat1.zw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.xy = u_xlat1.zw + vec2(-0.5, -0.5);
					    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlat4.x = (-u_xlat4.x) * 0.5 + 1.0;
					    u_xlat1.y = u_xlat0.x * 0.0500000007 + u_xlat1.z;
					    u_xlat1.x = (-u_xlat0.x) * 0.0500000007 + u_xlat1.z;
					    u_xlat2 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.yw);
					    u_xlat2.x = u_xlat10_3.x;
					    u_xlat0.x = u_xlat1.w * 800.0;
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat2.y = u_xlat10_1.y;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xzw = (-u_xlat0.xxx) * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
					    u_xlat0.xz = u_xlat4.xx * u_xlat0.xz;
					    u_xlat0.x = u_xlat0.z + u_xlat0.x;
					    u_xlat0.x = u_xlat0.w * u_xlat4.x + u_xlat0.x;
					    u_xlat0.y = u_xlat0.x * 0.333333343;
					    u_xlat0.x = u_xlat0.x * 0.333333343 + (-_Value);
					    u_xlatb8 = u_xlat0.y>=_Value;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat12 = _TimeX + _TimeX;
					    u_xlat12 = cos(u_xlat12);
					    u_xlat9.y = u_xlat12 * 0.241545901 + 1.0;
					    u_xlat12 = _TimeX * 4.0;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat2.y = u_xlat12 * 0.241545901 + 0.5;
					    u_xlat2.x = float(0.100000001);
					    u_xlat2.z = float(0.0);
					    u_xlat1.x = float(0.0);
					    u_xlat9.x = float(0.100000001);
					    u_xlat3.xyz = (-u_xlat9.xyx) + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat9.xyx;
					    u_xlat0.x = sin(_TimeX);
					    u_xlat1.y = u_xlat0.x * 0.241545901 + 0.5;
					    u_xlat2.xyz = (-u_xlat1.xyx) + u_xlat2.xyz;
					    u_xlat0.xyw = u_xlat0.yyy * u_xlat2.xyz + u_xlat1.xyx;
					    SV_Target0.xyz = (bool(u_xlatb8)) ? u_xlat3.xyz : u_xlat0.xyw;
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