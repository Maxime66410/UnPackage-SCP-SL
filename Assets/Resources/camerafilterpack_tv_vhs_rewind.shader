Shader "CameraFilterPack/TV_VHS_Rewind" {
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
			GpuProgramID 13045
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
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.200000003;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + 0.899999976;
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12 = u_xlat4.x + -0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat12;
					    u_xlat0.x = abs(u_xlat0.x) * _Value;
					    u_xlat1.xyz = vec3(_Value3, _Value2, _Value2) * (-vec3(_TimeX));
					    u_xlat1.xyz = fract(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat4.yyy * vec3(vec3(_Value, _Value, _Value)) + (-u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz + vec3(-0.0500000007, -0.0500000007, -0.0500000007);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
					    u_xlat12 = u_xlat1.y * 10.0 + -0.5;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(10.0, 10.0, 100.0);
					    u_xlat12 = u_xlat12 * -4.0 + 2.0;
					    u_xlat9.x = sin(u_xlat1.z);
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat9.x = u_xlat12 * 0.0199999996;
					    u_xlat9.y = 0.0;
					    u_xlat2.zw = u_xlat4.xy + u_xlat9.xy;
					    u_xlat2.xy = u_xlat0.xx * vec2(0.0189999994, -0.0189999994) + u_xlat2.zz;
					    u_xlat10_0 = texture(_MainTex, u_xlat2.yw);
					    u_xlat3 = texture(_MainTex, u_xlat2.xw);
					    u_xlat3.z = u_xlat10_0.z;
					    u_xlat10_0 = texture(_MainTex, u_xlat2.zw);
					    u_xlat0.x = (-u_xlat2.w) + 1.0;
					    u_xlat0.xz = u_xlat0.xx * u_xlat1.xy;
					    u_xlat3.y = u_xlat10_0.y;
					    u_xlat1.xyz = (-u_xlat3.xyz) + u_xlat3.xxx;
					    u_xlat0.xyw = u_xlat0.xxx * u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyw) + u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
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
					; Bound: 262
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Fragment %4 "main" %40 %249 
					                                                     OpExecutionMode %4 OriginUpperLeft 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpMemberDecorate %11 0 Offset 11 
					                                                     OpMemberDecorate %11 1 Offset 11 
					                                                     OpMemberDecorate %11 2 Offset 11 
					                                                     OpMemberDecorate %11 3 Offset 11 
					                                                     OpMemberDecorate %11 4 RelaxedPrecision 
					                                                     OpMemberDecorate %11 4 Offset 11 
					                                                     OpDecorate %11 Block 
					                                                     OpDecorate %13 DescriptorSet 13 
					                                                     OpDecorate %13 Binding 13 
					                                                     OpDecorate vs_TEXCOORD0 Location 40 
					                                                     OpDecorate %45 RelaxedPrecision 
					                                                     OpDecorate %46 RelaxedPrecision 
					                                                     OpDecorate %49 RelaxedPrecision 
					                                                     OpDecorate %50 RelaxedPrecision 
					                                                     OpDecorate %185 RelaxedPrecision 
					                                                     OpDecorate %185 DescriptorSet 185 
					                                                     OpDecorate %185 Binding 185 
					                                                     OpDecorate %186 RelaxedPrecision 
					                                                     OpDecorate %189 RelaxedPrecision 
					                                                     OpDecorate %189 DescriptorSet 189 
					                                                     OpDecorate %189 Binding 189 
					                                                     OpDecorate %190 RelaxedPrecision 
					                                                     OpDecorate %198 RelaxedPrecision 
					                                                     OpDecorate %199 RelaxedPrecision 
					                                                     OpDecorate %206 RelaxedPrecision 
					                                                     OpDecorate %207 RelaxedPrecision 
					                                                     OpDecorate %249 Location 249 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 3 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_3* %9 = OpVariable Private 
					                                             %10 = OpTypeVector %6 4 
					                                             %11 = OpTypeStruct %6 %6 %6 %6 %10 
					                                             %12 = OpTypePointer Uniform %11 
					Uniform struct {f32; f32; f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                             %14 = OpTypeInt 32 1 
					                                         i32 %15 = OpConstant 0 
					                                             %16 = OpTypePointer Uniform %6 
					                                         f32 %19 = OpConstant 3,674022E-40 
					                                             %21 = OpTypeInt 32 0 
					                                         u32 %22 = OpConstant 0 
					                                             %23 = OpTypePointer Private %6 
					                                         f32 %31 = OpConstant 3,674022E-40 
					                                         f32 %33 = OpConstant 3,674022E-40 
					                                             %36 = OpTypeVector %6 2 
					                                             %37 = OpTypePointer Private %36 
					                              Private f32_2* %38 = OpVariable Private 
					                                             %39 = OpTypePointer Input %36 
					                       Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %42 = OpConstant 4 
					                                             %43 = OpTypePointer Uniform %10 
					                                Private f32* %52 = OpVariable Private 
					                                         f32 %55 = OpConstant 3,674022E-40 
					                                         i32 %65 = OpConstant 1 
					                                             %70 = OpTypePointer Private %10 
					                              Private f32_4* %71 = OpVariable Private 
					                                         i32 %72 = OpConstant 3 
					                                         i32 %75 = OpConstant 2 
					                                        f32 %115 = OpConstant 3,674022E-40 
					                                      f32_3 %116 = OpConstantComposite %115 %115 %115 
					                                        f32 %122 = OpConstant 3,674022E-40 
					                                      f32_3 %123 = OpConstantComposite %122 %122 %122 
					                                      f32_3 %129 = OpConstantComposite %31 %31 %31 
					                                        u32 %133 = OpConstant 1 
					                                        f32 %136 = OpConstant 3,674022E-40 
					                                        f32 %141 = OpConstant 3,674022E-40 
					                                      f32_3 %142 = OpConstantComposite %136 %136 %141 
					                                        f32 %147 = OpConstant 3,674022E-40 
					                                        f32 %149 = OpConstant 3,674022E-40 
					                             Private f32_2* %151 = OpVariable Private 
					                                        u32 %152 = OpConstant 2 
					                                        f32 %162 = OpConstant 3,674022E-40 
					                             Private f32_4* %166 = OpVariable Private 
					                                        f32 %174 = OpConstant 3,674022E-40 
					                                        f32 %175 = OpConstant 3,674022E-40 
					                                      f32_2 %176 = OpConstantComposite %174 %175 
					                                            %183 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                            %184 = OpTypePointer UniformConstant %183 
					       UniformConstant read_only Texture2D* %185 = OpVariable UniformConstant 
					                                            %187 = OpTypeSampler 
					                                            %188 = OpTypePointer UniformConstant %187 
					                   UniformConstant sampler* %189 = OpVariable UniformConstant 
					                                            %191 = OpTypeSampledImage %183 
					                                        u32 %214 = OpConstant 3 
					                                        f32 %218 = OpConstant 3,674022E-40 
					                                            %248 = OpTypePointer Output %10 
					                              Output f32_4* %249 = OpVariable Output 
					                                            %259 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                Uniform f32* %17 = OpAccessChain %13 %15 
					                                         f32 %18 = OpLoad %17 
					                                         f32 %20 = OpFMul %18 %19 
					                                Private f32* %24 = OpAccessChain %9 %22 
					                                                     OpStore %24 %20 
					                                Private f32* %25 = OpAccessChain %9 %22 
					                                         f32 %26 = OpLoad %25 
					                                         f32 %27 = OpExtInst %1 13 %26 
					                                Private f32* %28 = OpAccessChain %9 %22 
					                                                     OpStore %28 %27 
					                                Private f32* %29 = OpAccessChain %9 %22 
					                                         f32 %30 = OpLoad %29 
					                                         f32 %32 = OpFMul %30 %31 
					                                         f32 %34 = OpFAdd %32 %33 
					                                Private f32* %35 = OpAccessChain %9 %22 
					                                                     OpStore %35 %34 
					                                       f32_2 %41 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %44 = OpAccessChain %13 %42 
					                                       f32_4 %45 = OpLoad %44 
					                                       f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                       f32_2 %47 = OpFMul %41 %46 
					                              Uniform f32_4* %48 = OpAccessChain %13 %42 
					                                       f32_4 %49 = OpLoad %48 
					                                       f32_2 %50 = OpVectorShuffle %49 %49 2 3 
					                                       f32_2 %51 = OpFAdd %47 %50 
					                                                     OpStore %38 %51 
					                                Private f32* %53 = OpAccessChain %38 %22 
					                                         f32 %54 = OpLoad %53 
					                                         f32 %56 = OpFAdd %54 %55 
					                                                     OpStore %52 %56 
					                                Private f32* %57 = OpAccessChain %9 %22 
					                                         f32 %58 = OpLoad %57 
					                                         f32 %59 = OpLoad %52 
					                                         f32 %60 = OpFMul %58 %59 
					                                Private f32* %61 = OpAccessChain %9 %22 
					                                                     OpStore %61 %60 
					                                Private f32* %62 = OpAccessChain %9 %22 
					                                         f32 %63 = OpLoad %62 
					                                         f32 %64 = OpExtInst %1 4 %63 
					                                Uniform f32* %66 = OpAccessChain %13 %65 
					                                         f32 %67 = OpLoad %66 
					                                         f32 %68 = OpFMul %64 %67 
					                                Private f32* %69 = OpAccessChain %9 %22 
					                                                     OpStore %69 %68 
					                                Uniform f32* %73 = OpAccessChain %13 %72 
					                                         f32 %74 = OpLoad %73 
					                                Uniform f32* %76 = OpAccessChain %13 %75 
					                                         f32 %77 = OpLoad %76 
					                                Uniform f32* %78 = OpAccessChain %13 %75 
					                                         f32 %79 = OpLoad %78 
					                                       f32_3 %80 = OpCompositeConstruct %74 %77 %79 
					                                Uniform f32* %81 = OpAccessChain %13 %15 
					                                         f32 %82 = OpLoad %81 
					                                       f32_3 %83 = OpCompositeConstruct %82 %82 %82 
					                                       f32_3 %84 = OpFNegate %83 
					                                       f32_3 %85 = OpFMul %80 %84 
					                                       f32_4 %86 = OpLoad %71 
					                                       f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
					                                                     OpStore %71 %87 
					                                       f32_4 %88 = OpLoad %71 
					                                       f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
					                                       f32_3 %90 = OpExtInst %1 10 %89 
					                                       f32_4 %91 = OpLoad %71 
					                                       f32_4 %92 = OpVectorShuffle %91 %90 4 5 6 3 
					                                                     OpStore %71 %92 
					                                       f32_2 %93 = OpLoad %38 
					                                       f32_3 %94 = OpVectorShuffle %93 %93 1 1 1 
					                                Uniform f32* %95 = OpAccessChain %13 %65 
					                                         f32 %96 = OpLoad %95 
					                                Uniform f32* %97 = OpAccessChain %13 %65 
					                                         f32 %98 = OpLoad %97 
					                                Uniform f32* %99 = OpAccessChain %13 %65 
					                                        f32 %100 = OpLoad %99 
					                                      f32_3 %101 = OpCompositeConstruct %96 %98 %100 
					                                        f32 %102 = OpCompositeExtract %101 0 
					                                        f32 %103 = OpCompositeExtract %101 1 
					                                        f32 %104 = OpCompositeExtract %101 2 
					                                      f32_3 %105 = OpCompositeConstruct %102 %103 %104 
					                                      f32_3 %106 = OpFMul %94 %105 
					                                      f32_4 %107 = OpLoad %71 
					                                      f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
					                                      f32_3 %109 = OpFNegate %108 
					                                      f32_3 %110 = OpFAdd %106 %109 
					                                      f32_4 %111 = OpLoad %71 
					                                      f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
					                                                     OpStore %71 %112 
					                                      f32_4 %113 = OpLoad %71 
					                                      f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
					                                      f32_3 %117 = OpFAdd %114 %116 
					                                      f32_4 %118 = OpLoad %71 
					                                      f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
					                                                     OpStore %71 %119 
					                                      f32_4 %120 = OpLoad %71 
					                                      f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
					                                      f32_3 %124 = OpExtInst %1 40 %121 %123 
					                                      f32_4 %125 = OpLoad %71 
					                                      f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
					                                                     OpStore %71 %126 
					                                      f32_4 %127 = OpLoad %71 
					                                      f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
					                                      f32_3 %130 = OpExtInst %1 37 %128 %129 
					                                      f32_4 %131 = OpLoad %71 
					                                      f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
					                                                     OpStore %71 %132 
					                               Private f32* %134 = OpAccessChain %71 %133 
					                                        f32 %135 = OpLoad %134 
					                                        f32 %137 = OpFMul %135 %136 
					                                        f32 %138 = OpFAdd %137 %55 
					                                                     OpStore %52 %138 
					                                      f32_4 %139 = OpLoad %71 
					                                      f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
					                                      f32_3 %143 = OpFMul %140 %142 
					                                      f32_4 %144 = OpLoad %71 
					                                      f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
					                                                     OpStore %71 %145 
					                                        f32 %146 = OpLoad %52 
					                                        f32 %148 = OpFMul %146 %147 
					                                        f32 %150 = OpFAdd %148 %149 
					                                                     OpStore %52 %150 
					                               Private f32* %153 = OpAccessChain %71 %152 
					                                        f32 %154 = OpLoad %153 
					                                        f32 %155 = OpExtInst %1 13 %154 
					                               Private f32* %156 = OpAccessChain %151 %22 
					                                                     OpStore %156 %155 
					                                        f32 %157 = OpLoad %52 
					                               Private f32* %158 = OpAccessChain %151 %22 
					                                        f32 %159 = OpLoad %158 
					                                        f32 %160 = OpFMul %157 %159 
					                                                     OpStore %52 %160 
					                                        f32 %161 = OpLoad %52 
					                                        f32 %163 = OpFMul %161 %162 
					                               Private f32* %164 = OpAccessChain %151 %22 
					                                                     OpStore %164 %163 
					                               Private f32* %165 = OpAccessChain %151 %133 
					                                                     OpStore %165 %122 
					                                      f32_2 %167 = OpLoad %38 
					                                      f32_2 %168 = OpLoad %151 
					                                      f32_2 %169 = OpFAdd %167 %168 
					                                      f32_4 %170 = OpLoad %166 
					                                      f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
					                                                     OpStore %166 %171 
					                                      f32_3 %172 = OpLoad %9 
					                                      f32_2 %173 = OpVectorShuffle %172 %172 0 0 
					                                      f32_2 %177 = OpFMul %173 %176 
					                                      f32_4 %178 = OpLoad %166 
					                                      f32_2 %179 = OpVectorShuffle %178 %178 2 2 
					                                      f32_2 %180 = OpFAdd %177 %179 
					                                      f32_4 %181 = OpLoad %166 
					                                      f32_4 %182 = OpVectorShuffle %181 %180 4 5 2 3 
					                                                     OpStore %166 %182 
					                        read_only Texture2D %186 = OpLoad %185 
					                                    sampler %190 = OpLoad %189 
					                 read_only Texture2DSampled %192 = OpSampledImage %186 %190 
					                                      f32_4 %193 = OpLoad %166 
					                                      f32_2 %194 = OpVectorShuffle %193 %193 1 3 
					                                      f32_4 %195 = OpImageSampleImplicitLod %192 %194 
					                                        f32 %196 = OpCompositeExtract %195 2 
					                               Private f32* %197 = OpAccessChain %9 %152 
					                                                     OpStore %197 %196 
					                        read_only Texture2D %198 = OpLoad %185 
					                                    sampler %199 = OpLoad %189 
					                 read_only Texture2DSampled %200 = OpSampledImage %198 %199 
					                                      f32_4 %201 = OpLoad %166 
					                                      f32_2 %202 = OpVectorShuffle %201 %201 0 3 
					                                      f32_4 %203 = OpImageSampleImplicitLod %200 %202 
					                                        f32 %204 = OpCompositeExtract %203 0 
					                               Private f32* %205 = OpAccessChain %9 %22 
					                                                     OpStore %205 %204 
					                        read_only Texture2D %206 = OpLoad %185 
					                                    sampler %207 = OpLoad %189 
					                 read_only Texture2DSampled %208 = OpSampledImage %206 %207 
					                                      f32_4 %209 = OpLoad %166 
					                                      f32_2 %210 = OpVectorShuffle %209 %209 2 3 
					                                      f32_4 %211 = OpImageSampleImplicitLod %208 %210 
					                                        f32 %212 = OpCompositeExtract %211 1 
					                               Private f32* %213 = OpAccessChain %9 %133 
					                                                     OpStore %213 %212 
					                               Private f32* %215 = OpAccessChain %166 %214 
					                                        f32 %216 = OpLoad %215 
					                                        f32 %217 = OpFNegate %216 
					                                        f32 %219 = OpFAdd %217 %218 
					                                                     OpStore %52 %219 
					                                        f32 %220 = OpLoad %52 
					                                      f32_2 %221 = OpCompositeConstruct %220 %220 
					                                      f32_4 %222 = OpLoad %71 
					                                      f32_2 %223 = OpVectorShuffle %222 %222 0 1 
					                                      f32_2 %224 = OpFMul %221 %223 
					                                      f32_4 %225 = OpLoad %71 
					                                      f32_4 %226 = OpVectorShuffle %225 %224 4 5 2 3 
					                                                     OpStore %71 %226 
					                                      f32_3 %227 = OpLoad %9 
					                                      f32_3 %228 = OpFNegate %227 
					                                      f32_3 %229 = OpLoad %9 
					                                      f32_3 %230 = OpVectorShuffle %229 %229 0 0 0 
					                                      f32_3 %231 = OpFAdd %228 %230 
					                                      f32_4 %232 = OpLoad %166 
					                                      f32_4 %233 = OpVectorShuffle %232 %231 4 5 6 3 
					                                                     OpStore %166 %233 
					                                      f32_4 %234 = OpLoad %71 
					                                      f32_3 %235 = OpVectorShuffle %234 %234 0 0 0 
					                                      f32_4 %236 = OpLoad %166 
					                                      f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
					                                      f32_3 %238 = OpFMul %235 %237 
					                                      f32_3 %239 = OpLoad %9 
					                                      f32_3 %240 = OpFAdd %238 %239 
					                                                     OpStore %9 %240 
					                                      f32_3 %241 = OpLoad %9 
					                                      f32_3 %242 = OpFNegate %241 
					                                      f32_3 %243 = OpLoad %9 
					                                      f32_3 %244 = OpVectorShuffle %243 %243 0 0 0 
					                                      f32_3 %245 = OpFAdd %242 %244 
					                                      f32_4 %246 = OpLoad %71 
					                                      f32_4 %247 = OpVectorShuffle %246 %245 4 1 5 6 
					                                                     OpStore %71 %247 
					                                      f32_4 %250 = OpLoad %71 
					                                      f32_3 %251 = OpVectorShuffle %250 %250 1 1 1 
					                                      f32_4 %252 = OpLoad %71 
					                                      f32_3 %253 = OpVectorShuffle %252 %252 0 2 3 
					                                      f32_3 %254 = OpFMul %251 %253 
					                                      f32_3 %255 = OpLoad %9 
					                                      f32_3 %256 = OpFAdd %254 %255 
					                                      f32_4 %257 = OpLoad %249 
					                                      f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
					                                                     OpStore %249 %258 
					                                Output f32* %260 = OpAccessChain %249 %214 
					                                                     OpStore %260 %218 
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
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.200000003;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + 0.899999976;
					    u_xlat4.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12 = u_xlat4.x + -0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat12;
					    u_xlat0.x = abs(u_xlat0.x) * _Value;
					    u_xlat1.xyz = vec3(_Value3, _Value2, _Value2) * (-vec3(_TimeX));
					    u_xlat1.xyz = fract(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat4.yyy * vec3(vec3(_Value, _Value, _Value)) + (-u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz + vec3(-0.0500000007, -0.0500000007, -0.0500000007);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = min(u_xlat1.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
					    u_xlat12 = u_xlat1.y * 10.0 + -0.5;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(10.0, 10.0, 100.0);
					    u_xlat12 = u_xlat12 * -4.0 + 2.0;
					    u_xlat9.x = sin(u_xlat1.z);
					    u_xlat12 = u_xlat12 * u_xlat9.x;
					    u_xlat9.x = u_xlat12 * 0.0199999996;
					    u_xlat9.y = 0.0;
					    u_xlat2.zw = u_xlat4.xy + u_xlat9.xy;
					    u_xlat2.xy = u_xlat0.xx * vec2(0.0189999994, -0.0189999994) + u_xlat2.zz;
					    u_xlat10_0 = texture(_MainTex, u_xlat2.yw);
					    u_xlat3 = texture(_MainTex, u_xlat2.xw);
					    u_xlat3.z = u_xlat10_0.z;
					    u_xlat10_0 = texture(_MainTex, u_xlat2.zw);
					    u_xlat0.x = (-u_xlat2.w) + 1.0;
					    u_xlat0.xz = u_xlat0.xx * u_xlat1.xy;
					    u_xlat3.y = u_xlat10_0.y;
					    u_xlat1.xyz = (-u_xlat3.xyz) + u_xlat3.xxx;
					    u_xlat0.xyw = u_xlat0.xxx * u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = (-u_xlat0.xyw) + u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.zzz * u_xlat1.xyz + u_xlat0.xyw;
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